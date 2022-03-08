

-- **************  la liste des arrivées: *******************
-- Je vais sélectionner la liste des arrivées du jour actuel.
-- j'ai utilisé  CAST(CURRENT_TIMESTAMP AS DATE) pour obtenir la journée actuelle
-- J'ai également sélectionné le nom et le prénom de la personne responsable_ qui l'accueillera pour faciliter la tâche d'accueil.

select Client.NomClient, Client.PrenomClient, reservation.DateArrivee, Emplacement.NumEmplacement,Responsable_.NomResponsable, Responsable_.PrenomResponsable,accompagnant.NomACC,accompagnant.PrenomACC
from Client
inner join Emplacement on Client.Id_Emplacement = emplacement.Id_Emplacement
inner join Reservation on Client.Id_Client = reservation.Id_Client
inner join Responsable_ on Client.Id_Responsable_ = Responsable_.Id_Responsable_
inner join accompagnant on Client.Id_Client = accompagnant.Id_Client
where reservation.DateArrivee >= CAST(CURRENT_TIMESTAMP AS DATE) 
order by reservation.DateArrivee ASC;


-- **************  la liste des départs: *******************
-- je vais appliquer meme principe que celle j'ai appliqué avec la liste des arrivées
-- ici j'ai selectionnée en plus le prix de réservation car ils veulent faire l'état des lieux et la facturation
select Client.NomClient, Client.PrenomClient, Reservation.DateDepart, Reservation.PrixReservation, Emplacement.NumEmplacement,accompagnant.NomACC,accompagnant.PrenomACC
from Client
inner join Emplacement on Client.Id_Emplacement = emplacement.Id_Emplacement
inner join Reservation on Client.Id_Client = reservation.Id_Client
inner join accompagnant on Client.Id_Client = accompagnant.Id_Client
where reservation.DateArrivee >= CAST(CURRENT_TIMESTAMP AS DATE)
order by reservation.DateDepart ASC;

-- **************  le planning des activitées: *******************
-- je vais selectionner toute les activitées ordonnées par le temps d'une facon ascendante pour faciliter les décisions

select Activite.TypeActivite, Seance.DateSeance, Animateur.NomAnimateur, Animateur.PrenomAnimateur, Client.NomClient, Client.PrenomClient,accompagnant.NomACC,accompagnant.PrenomACC
from Seance
inner join Etre_pratiquer on Seance.Id_Seance = Etre_pratiquer.Id_Seance 
inner join activite on Activite.Id_Activite = Etre_pratiquer.Id_Activite
inner join encadrer on Seance.Id_Seance = encadrer.Id_Seance
inner join Animateur on Animateur.Id_Animateur = encadrer.Id_Animateur
inner join participer on Seance.Id_Seance = participer.Id_Seance
inner join Client on Client.Id_Client = participer.Id_Client
inner join accompagnant on Client.Id_Client = accompagnant.Id_Client
WHERE Seance.DateSeance >= CAST(CURRENT_TIMESTAMP AS DATE) 
Order By Seance.DateSeance ASC;

-- ********************* planning de chaque animateur ******************
-- je vais lister toute les activité avec leur type et son animateur ordonnées par le temps d'une facon ascendante

select Animateur.NomAnimateur, Animateur.PrenomAnimateur, Activite.TypeActivite, Seance.DateSeance
from Animateur 
inner join encadrer on Animateur.Id_Animateur = encadrer.Id_Animateur
inner join Seance on Seance.Id_Seance = encadrer.Id_Seance
inner join Etre_pratiquer on Seance.Id_Seance = Etre_pratiquer.Id_Seance
inner join Activite on  Activite.Id_Activite = Etre_pratiquer.Id_Activite
WHERE Seance.DateSeance >= CAST(CURRENT_TIMESTAMP AS DATE)
Order by Seance.DateSeance ASC;


-- **********************  la liste de personnel avec l'emplacement pour faire l'entretien et le ménage
-- le personnel chargé de l'entretien
-- Je posterai la liste des sites qui seront libérés aujourd'hui avec son employé de maintenance pour les remettre en état.

select Employe.NomEmploye, Employe.PrenomEmploye,Emplacement.NumEmplacement,Reservation.DateDepart
from Employe
inner join faire_l_entretien on Employe.Id_Employe = faire_l_entretien.Id_Employe 
inner join Emplacement on  Emplacement.Id_Emplacement = faire_l_entretien.Id_Emplacement
inner join Client on Emplacement.Id_Emplacement = Client.Id_Emplacement
inner join Reservation on Reservation.Id_Client = Client.Id_Client
where Reservation.DateDepart >= CAST(CURRENT_TIMESTAMP AS DATE)
order by Reservation.DateDepart ASC;

-- le meme principe avec la liste de personnel qui vont faire le ménage (aide les clients)
-- liste des arrivées avec le personnel responsable_ pour faire préparer leur emplacement
select Employe.NomEmploye, Employe.PrenomEmploye,Emplacement.NumEmplacement,Reservation.DateArrivee
from Employe
inner join aider on Employe.Id_Employe = aider.Id_Employe
inner join Client on client.Id_Client = aider.Id_Client
inner join Emplacement on Emplacement.Id_Emplacement = Client.Id_Emplacement
inner join Reservation on Reservation.Id_Client = Client.Id_Client
where Reservation.DateArrivee >= CAST(CURRENT_TIMESTAMP AS DATE)
order by Reservation.DateDepart ASC;


-- ************************ la facturation de séjours**************************
select Client.NomClient, Client.PrenomClient, Reservation.PrixReservation, ifnull(activite.TypeActivite,'') as activite, ifnull(seance.PrixSeance,0) as prix_activite
from Client 
inner join Reservation on Client.Id_Client = Reservation.Id_Client 
left join participer on client.Id_Client = participer.Id_Client 
left join accompagnant on client.Id_Client = accompagnant.Id_Client 
left JOIN seance on seance.Id_Seance = participer.Id_Seance 
LEFT JOIN etre_pratiquer on seance.Id_Seance = etre_pratiquer.Id_Seance 
left join activite on activite.Id_Activite = etre_pratiquer.Id_Activite 
Group by Client.NomClient, Client.PrenomClient;



-- somme

select Client.NomClient, Client.PrenomClient, Reservation.PrixReservation +  ifnull(Sum(seance.PrixSeance),0) as somme
from Client 
inner join Reservation on Client.Id_Client = Reservation.Id_Client 
left join participer on client.Id_Client = participer.Id_Client 
left join accompagnant on client.Id_Client = accompagnant.Id_Client 
left JOIN seance on seance.Id_Seance = participer.Id_Seance 
LEFT JOIN etre_pratiquer on seance.Id_Seance = etre_pratiquer.Id_Seance 
left join activite on activite.Id_Activite = etre_pratiquer.Id_Activite 
Group by Client.NomClient, Client.PrenomClient;
