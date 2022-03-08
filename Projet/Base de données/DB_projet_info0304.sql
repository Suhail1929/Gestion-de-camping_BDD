-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 04 déc. 2021 à 14:45
-- Version du serveur : 5.7.31
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `info0304`
--

-- --------------------------------------------------------

--
-- Structure de la table `accompagnant`
--

CREATE TABLE `accompagnant` (
  `Id_accompagnant` int(11) NOT NULL,
  `NomAcc` varchar(50) DEFAULT NULL,
  `PrenomAcc` varchar(50) DEFAULT NULL,
  `NumTelAcc` int(11) DEFAULT NULL,
  `Id_Client` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `accompagnant`
--

INSERT INTO `accompagnant` (`Id_accompagnant`, `NomAcc`, `PrenomAcc`, `NumTelAcc`, `Id_Client`) VALUES
(1, 'Paul', 'Jack', 21354612, 1),
(2, 'Ahmed', 'Omar', 147852963, 1),
(3, 'Leo', 'Menard', 78956201, 3),
(4, 'polin', 'Emma', 285967413, 4),
(5, 'Mamouni', 'Paul', 789412914, 6),
(6, 'Alapa', 'Laura', 658741236, 6);

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `Id_Activite` int(11) NOT NULL,
  `TypeActivite` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`Id_Activite`, `TypeActivite`) VALUES
(1, 'Musique'),
(2, 'Foot'),
(3, 'Tournoi des échecs'),
(4, 'dance');

-- --------------------------------------------------------

--
-- Structure de la table `aider`
--

CREATE TABLE `aider` (
  `Id_Employe` int(11) NOT NULL,
  `Id_Client` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aider`
--

INSERT INTO `aider` (`Id_Employe`, `Id_Client`) VALUES
(1, 2),
(1, 4),
(2, 1),
(2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `animateur`
--

CREATE TABLE `animateur` (
  `Id_Animateur` int(11) NOT NULL,
  `NomAnimateur` varchar(50) DEFAULT NULL,
  `PrenomAnimateur` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `animateur`
--

INSERT INTO `animateur` (`Id_Animateur`, `NomAnimateur`, `PrenomAnimateur`) VALUES
(1, 'Chandonnet', 'Algernon '),
(2, 'Brigliador ', 'Julienne '),
(3, 'Kasparov', 'Martin');

-- --------------------------------------------------------

--
-- Structure de la table `apporter`
--

CREATE TABLE `apporter` (
  `Id_Employe` int(11) NOT NULL,
  `Id_EquipementsOfferts` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `apporter`
--

INSERT INTO `apporter` (`Id_Employe`, `Id_EquipementsOfferts`) VALUES
(1, 1),
(2, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `branchement_électrique`
--

CREATE TABLE `branchement_électrique` (
  `Id_Branchement_électrique` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `branchement_électrique`
--

INSERT INTO `branchement_électrique` (`Id_Branchement_électrique`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Id_Client` int(11) NOT NULL,
  `NomClient` varchar(50) DEFAULT NULL,
  `PrenomClient` varchar(50) DEFAULT NULL,
  `AdresseClient` varchar(50) DEFAULT NULL,
  `DateDeNaissanceClient` varchar(50) DEFAULT NULL,
  `EmailClient` varchar(100) DEFAULT NULL,
  `NumTelClient` int(11) DEFAULT NULL,
  `Id_ConnexionInternet` int(11) DEFAULT NULL,
  `Id_Emplacement` int(11) NOT NULL,
  `Id_Responsable_` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_Client`, `NomClient`, `PrenomClient`, `AdresseClient`, `DateDeNaissanceClient`, `EmailClient`, `NumTelClient`, `Id_ConnexionInternet`, `Id_Emplacement`, `Id_Responsable_`) VALUES
(1, 'Barrière', 'Orva ', '10, Chemin Des Bateliers 49000 ANGERS', '12/04/1989', '\r\nOrvaBarriere@dayrep.com', 774185296, 1, 1, 1),
(2, 'Théberge', 'Gérard ', '51, boulevard Aristide Briand 78150 LE CHESNAY', '26/01/965', 'GerardTheberge@armyspy.com', 172565744, 1, 2, 1),
(3, 'Édouard', 'Thérèse ', '31, rue de Geneve 80080 AMIENS', '04/11/1957', '\r\nThereseEdouard@teleworm.us', 7741874, 1, 3, 1),
(4, 'Coudert', 'Jean ', '67, rue Léon Dierx 87280 LIMOGES', '07/10/1995', 'JeanCoudert@jourrapide.com', 652147896, 1, 2, 1),
(5, 'Hugo', 'Loris', '10, Chemin Des pop 49000 ANGERS', '22/07/1999', 'Hugo47522@yahou.com', 789562314, 1, 4, 1),
(6, 'Cupe', 'Solip', '51,Rue de vesle 51100  Reims', '29/08/2001', 'Solpi.cupe@hotmail.fr', 25874136, 1, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `connexioninternet`
--

CREATE TABLE `connexioninternet` (
  `Id_ConnexionInternet` int(11) NOT NULL,
  `Debit` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `connexioninternet`
--

INSERT INTO `connexioninternet` (`Id_ConnexionInternet`, `Debit`) VALUES
(1, 60);

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

CREATE TABLE `diplome` (
  `Id_Diplome` int(11) NOT NULL,
  `DateObtention` date DEFAULT NULL,
  `Id_Animateur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`Id_Diplome`, `DateObtention`, `Id_Animateur`) VALUES
(3, '1999-12-22', 3),
(1, '2016-11-18', 1),
(2, '2011-06-08', 2);

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE `emplacement` (
  `Id_Emplacement` int(11) NOT NULL,
  `Taille_` varchar(50) DEFAULT NULL,
  `Niveaudeconfort` varchar(50) DEFAULT NULL,
  `NumEmplacement` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `emplacement`
--

INSERT INTO `emplacement` (`Id_Emplacement`, `Taille_`, `Niveaudeconfort`, `NumEmplacement`) VALUES
(1, '10 m3', '3', 1),
(2, '30 m3', '5', 2),
(3, '9 m3', '2', 3),
(4, '40 m3', '5', 5);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `Id_Employe` int(11) NOT NULL,
  `NomEmploye` varchar(50) DEFAULT NULL,
  `PrenomEmploye` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`Id_Employe`, `NomEmploye`, `PrenomEmploye`) VALUES
(1, 'Michaud', 'Xavier'),
(2, 'Petrie', 'Christophe');

-- --------------------------------------------------------

--
-- Structure de la table `encadrer`
--

CREATE TABLE `encadrer` (
  `Id_Seance` int(11) NOT NULL,
  `Id_Animateur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `encadrer`
--

INSERT INTO `encadrer` (`Id_Seance`, `Id_Animateur`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `equipementsofferts`
--

CREATE TABLE `equipementsofferts` (
  `Id_EquipementsOfferts` int(11) NOT NULL,
  `NomEquipement` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipementsofferts`
--

INSERT INTO `equipementsofferts` (`Id_EquipementsOfferts`, `NomEquipement`) VALUES
(1, 'canne à pêche'),
(2, 'bottes');

-- --------------------------------------------------------

--
-- Structure de la table `etre_pratiquer`
--

CREATE TABLE `etre_pratiquer` (
  `Id_Seance` int(11) NOT NULL,
  `Id_Activite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etre_pratiquer`
--

INSERT INTO `etre_pratiquer` (`Id_Seance`, `Id_Activite`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `faire_l_entretien`
--

CREATE TABLE `faire_l_entretien` (
  `Id_Employe` int(11) NOT NULL,
  `Id_Emplacement` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `faire_l_entretien`
--

INSERT INTO `faire_l_entretien` (`Id_Employe`, `Id_Emplacement`) VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 2),
(2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `instaler`
--

CREATE TABLE `instaler` (
  `Id_Employe` int(11) NOT NULL,
  `Id_Branchement_électrique` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `instaler`
--

INSERT INTO `instaler` (`Id_Employe`, `Id_Branchement_électrique`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `Id_Client` int(11) NOT NULL,
  `Id_Seance` int(11) NOT NULL,
  `Id_accompagnant` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`Id_Client`, `Id_Seance`, `Id_accompagnant`) VALUES
(1, 1, 3),
(2, 2, 4),
(5, 3, 1),
(6, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `Id_Reservation` int(11) NOT NULL,
  `DateArrivee` datetime DEFAULT NULL,
  `DateDepart` datetime DEFAULT NULL,
  `PrixReservation` double DEFAULT NULL,
  `Id_Client` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`Id_Reservation`, `DateArrivee`, `DateDepart`, `PrixReservation`, `Id_Client`) VALUES
(1, '2022-02-22 11:56:59', '2022-03-03 11:56:59', 257.58, 1),
(3, '2022-02-10 12:56:59', '2022-03-03 11:56:59', 257.58, 3),
(4, '2022-02-10 12:56:59', '2022-03-03 11:56:59', 257.58, 4),
(2, '2022-02-10 11:56:59', '2022-03-10 11:56:59', 420.85, 2),
(5, '2021-12-16 23:53:13', '2022-01-06 23:53:13', 320, 5),
(6, '2022-02-01 23:53:13', '2022-02-26 23:53:13', 600, 6);

-- --------------------------------------------------------

--
-- Structure de la table `responsable_`
--

CREATE TABLE `responsable_` (
  `Id_Responsable_` int(11) NOT NULL,
  `NomResponsable` varchar(50) DEFAULT NULL,
  `PrenomResponsable` varchar(50) DEFAULT NULL,
  `EmailResponsable` varchar(50) DEFAULT NULL,
  `NumTelResponsable` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `responsable_`
--

INSERT INTO `responsable_` (`Id_Responsable_`, `NomResponsable`, `PrenomResponsable`, `EmailResponsable`, `NumTelResponsable`) VALUES
(1, 'Dupont', 'Gerard', 'Gerard.DUPONT@gmail.com', 662359541);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `Id_Seance` int(11) NOT NULL,
  `DateSeance` datetime DEFAULT NULL,
  `PrixSeance` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`Id_Seance`, `DateSeance`, `PrixSeance`) VALUES
(1, '2022-03-01 12:00:00', 20.5),
(2, '2022-03-12 19:00:00', 10.99),
(3, '2022-02-02 23:54:22', 0);

-- --------------------------------------------------------

--
-- Structure de la table `utiliser`
--

CREATE TABLE `utiliser` (
  `Id_Client` int(11) NOT NULL,
  `Id_EquipementsOfferts` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utiliser`
--

INSERT INTO `utiliser` (`Id_Client`, `Id_EquipementsOfferts`) VALUES
(1, 1),
(2, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accompagnant`
--
ALTER TABLE `accompagnant`
  ADD PRIMARY KEY (`Id_accompagnant`),
  ADD KEY `Id_Client` (`Id_Client`);

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`Id_Activite`);

--
-- Index pour la table `aider`
--
ALTER TABLE `aider`
  ADD PRIMARY KEY (`Id_Employe`,`Id_Client`),
  ADD KEY `Id_Client` (`Id_Client`);

--
-- Index pour la table `animateur`
--
ALTER TABLE `animateur`
  ADD PRIMARY KEY (`Id_Animateur`);

--
-- Index pour la table `apporter`
--
ALTER TABLE `apporter`
  ADD PRIMARY KEY (`Id_Employe`,`Id_EquipementsOfferts`),
  ADD KEY `Id_EquipementsOfferts` (`Id_EquipementsOfferts`);

--
-- Index pour la table `branchement_électrique`
--
ALTER TABLE `branchement_électrique`
  ADD PRIMARY KEY (`Id_Branchement_électrique`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_Client`),
  ADD KEY `Id_ConnexionInternet` (`Id_ConnexionInternet`),
  ADD KEY `Id_Emplacement` (`Id_Emplacement`),
  ADD KEY `Id_Responsable_` (`Id_Responsable_`);

--
-- Index pour la table `connexioninternet`
--
ALTER TABLE `connexioninternet`
  ADD PRIMARY KEY (`Id_ConnexionInternet`);

--
-- Index pour la table `diplome`
--
ALTER TABLE `diplome`
  ADD PRIMARY KEY (`Id_Diplome`),
  ADD KEY `Id_Animateur` (`Id_Animateur`);

--
-- Index pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD PRIMARY KEY (`Id_Emplacement`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`Id_Employe`);

--
-- Index pour la table `encadrer`
--
ALTER TABLE `encadrer`
  ADD PRIMARY KEY (`Id_Seance`,`Id_Animateur`),
  ADD KEY `Id_Animateur` (`Id_Animateur`);

--
-- Index pour la table `equipementsofferts`
--
ALTER TABLE `equipementsofferts`
  ADD PRIMARY KEY (`Id_EquipementsOfferts`);

--
-- Index pour la table `etre_pratiquer`
--
ALTER TABLE `etre_pratiquer`
  ADD PRIMARY KEY (`Id_Seance`,`Id_Activite`),
  ADD KEY `Id_Activite` (`Id_Activite`);

--
-- Index pour la table `faire_l_entretien`
--
ALTER TABLE `faire_l_entretien`
  ADD PRIMARY KEY (`Id_Employe`,`Id_Emplacement`),
  ADD KEY `Id_Emplacement` (`Id_Emplacement`);

--
-- Index pour la table `instaler`
--
ALTER TABLE `instaler`
  ADD PRIMARY KEY (`Id_Employe`,`Id_Branchement_électrique`),
  ADD KEY `Id_Branchement_électrique` (`Id_Branchement_électrique`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`Id_Client`,`Id_Seance`,`Id_accompagnant`),
  ADD KEY `Id_Seance` (`Id_Seance`),
  ADD KEY `Id_accompagnant` (`Id_accompagnant`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Id_Reservation`),
  ADD KEY `Id_Client` (`Id_Client`);

--
-- Index pour la table `responsable_`
--
ALTER TABLE `responsable_`
  ADD PRIMARY KEY (`Id_Responsable_`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`Id_Seance`);

--
-- Index pour la table `utiliser`
--
ALTER TABLE `utiliser`
  ADD PRIMARY KEY (`Id_Client`,`Id_EquipementsOfferts`),
  ADD KEY `Id_EquipementsOfferts` (`Id_EquipementsOfferts`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accompagnant`
--
ALTER TABLE `accompagnant`
  MODIFY `Id_accompagnant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `Id_Activite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `animateur`
--
ALTER TABLE `animateur`
  MODIFY `Id_Animateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `branchement_électrique`
--
ALTER TABLE `branchement_électrique`
  MODIFY `Id_Branchement_électrique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `Id_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `connexioninternet`
--
ALTER TABLE `connexioninternet`
  MODIFY `Id_ConnexionInternet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `diplome`
--
ALTER TABLE `diplome`
  MODIFY `Id_Diplome` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132165;

--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `Id_Emplacement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `Id_Employe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `equipementsofferts`
--
ALTER TABLE `equipementsofferts`
  MODIFY `Id_EquipementsOfferts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Id_Reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `responsable_`
--
ALTER TABLE `responsable_`
  MODIFY `Id_Responsable_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `Id_Seance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
