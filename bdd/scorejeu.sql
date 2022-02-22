-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 22 Février 2022 à 23:44
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `scorejeu`
--

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `Genre` varchar(20) NOT NULL DEFAULT '',
  `Description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `genres`
--

INSERT INTO `genres` (`Genre`, `Description`) VALUES
('Action', 'Jeu d''action'),
('Course', 'Jeu de course'),
('Combat', 'Jeu de combat'),
('Arcade', 'Jeu d''arcade'),
('F2P', 'Jeu gratuit'),
('FPS', 'Jeu de tire en vue réaliste'),
('Gestion', 'Jeu de gestion'),
('Danse', 'Jeu de danse'),
('Mobile', 'Jeu se jouant sur téléphone'),
('Plateforme', 'Jeu de plateforme'),
('Mot', 'Jeu où le but est de formuler des mots'),
('Survie', 'Jeu de survie'),
('TPS', 'Jeu de tire en vue extérieure');

-- --------------------------------------------------------

--
-- Structure de la table `jeux`
--

CREATE TABLE IF NOT EXISTS `jeux` (
  'id_jeu' int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) NOT NULL DEFAULT '',
  `Genre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Nom`),
  KEY `fk_jeux_genre` (`Genre`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jeux`
--

INSERT INTO `jeux` (`Nom`, `Genre`) VALUES


(1, 'Pac-Man', 'Arcade'),
(2, 'Super Mario Bros.', 'Plateforme'),
(3, 'Battlefield 2048', 'FPS'),
(4, 'Pinball 3D Space Cad', 'Arcade'),
(5, 'Subway Surfer', 'Mobile'),
(6, 'Cookie Clicker', 'Mobile'),
(7, 'Everstopped', 'FPS'),
(8, 'Angry Birds', 'Mobile'),
(9, 'Just Dance', 'Danse'),
(10, 'Super Smash Bros. Ultimate', 'Combat'),
(11, 'Brawlhalla', 'Combat'),
(12, 'Rayman 3', 'Plateforme'),
(13, 'Temple Run', 'Mobile'),
(14, 'Fruit Ninja', 'Mobile'),
(15, 'Mario Kart 8 Online', 'Course'),
(16,'Call of Duty', 'FPS'),
(17,'Candy Crush', 'Mobile'),
(18,'Civilization', 'Gestion'),
(19,'Scrabble', 'Mot'),
(20,'Raid Shadow Legend', 'F2P'),
(21, 'Minecraft', 'Survie'),
(22, 'Splatoon', 'TPS');

-- --------------------------------------------------------

--
-- Structure de la table `scores`
--

CREATE TABLE IF NOT EXISTS `scores` (
  `id_score` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `Pseudo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_score`),
  KEY `fk_scores_utilisateurs` (`Pseudo`),
  KEY `fk_scores_jeux` (`Nom`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `scores`
--

INSERT INTO `scores` (`id_score`, `Nom`, `Score`, `Pseudo`) VALUES
(1, 'Scrabble', 5299552, 'Grassouillet'),
(2, 'Rayman 3', 5946, 'IceTiger'),
(3, 'Super Smash Bros. Ultimate', 62598, 'IceTiger'),
(4, 'Mario Kart 8 Online', 19595, 'IceTiger'),
(5, 'Battlefield 2048', 80552, 'Ploumpy'),
(6, 'Call of Duty', 8551, 'Ploumpy'),
(7, 'Minecraft', 67285249, 'Ploumpy'),
(8, 'Temple Run', 972821, 'Unityboy'),
(9, 'Super Mario Bros.', 9457582, 'Unityboy'),
(10, 'Brawlhalla', 79671, 'Unityboy'),
(11, 'Splatoon', 218, 'marin'),
(12, 'Angry Birds', 981, 'marin'),
(13, 'Cookie Clicker', 9812185, 'marin'),
(14, 'Civilization', 1896812, 'Ovide'),
(15, 'Scrabble', 1797, 'Ovide'),
(16, 'Just Dance', 971517, 'Ovide'),
(17, 'Pinball 3D Space Cad',719517, 'Belgoboy'),
(18, 'Subway Surfer', 9751, 'Belgoboy'),
(19, 'Raid Shadow Legend', 9571, 'Belgoboy'),
(20, 'Battlefield 2048', 852089, 'FluffyPaws'),
(21, 'Raid Shadow Legend', 9715, 'FluffyPaws'),
(22, 'Brawlhalla', 71591, 'FluffyPaws'),
(23, 'Fruit Ninja', 71951, 'LAG'),
(24, 'Everstopped', 8559, 'LAG'),
(25, 'Just Dance', 2955, 'LAG'),
(26, 'Candy Crush', 81741 'MuskFan'),
(27, 'Scrabble', 7174, 'MuskFan'),
(28, 'Pac-Man', 95719, 'MuskFan');


-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `Type` varchar(20) NOT NULL DEFAULT '',
  `Description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `types`
--

INSERT INTO `types` (`Type`, `Description`) VALUES
('Joueur', 'Utilisateur'),
('Superviseur', 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) DEFAULT NULL,
  `Prenom` varchar(20) DEFAULT NULL,
  `MotDePasse` varchar(20) DEFAULT NULL,
  `Pseudo` varchar(20) NOT NULL DEFAULT '',
  `Mail` varchar(20) NOT NULL DEFAULT '',
  `DateDeNaissance` date DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Pseudo`,`Mail`,`Id`),
  KEY `fk_utilisateurs_types` (`Type`),
  KEY `index_id` (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`Id`, `Nom`, `Prenom`, `MotDePasse`, `Pseudo`, `Mail`, `Type`) VALUES
(1, 'Madembo', 'Grace', 'GMadembo', 'Grassouillet', 'g.madembo@gmail.com', 'Joueur'),
(2, 'Kunz', 'Quentin', 'QKUNZ', 'IceTiger', 'q.kunz@gmail.com', 'Joueur'),
(3, 'Bohnert', 'Alexandre', 'BoAlex', 'Ploumpy', 'a.bohnert@gmail.com', 'Joueur'),
(4, 'Eitel', 'Hugo', 'AZERTY', 'Unityboy', 'h.eitel@gmail.com', 'Joueur'),
(5, 'Schwartz', 'Marine', 'fleur', 'marin', 'm.schwartz@gmail.com', 'Joueur'),
(6, 'Viceconte', 'Oriane', 'craYon', 'Ovide','o.viceconte@gmail.com','Joueur'),
(7, 'Zumkir', 'Jeffrey', 'osef', 'Belgoboy', 'j.zumkir@gmail.com', 'Joueur'),
(8, 'Riff', 'Baptiste', 's4suke', 'FluffyPaws', 'b.riff@gmail.com'),
(9, 'Gete', 'Francois', '86', 'LAG', 'f.gete@gmail.com'),
(10, 'Ekle', 'Elias', 'photo', 'MuskFan', 'e.eckle@gmail.com'),
(11, 'Root', 'Root', 'root', 'root', 'r.root@gmail.com', 'Superviseur');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `jeux`
--
ALTER TABLE `jeux`
  ADD CONSTRAINT `fk_jeux_genre` FOREIGN KEY (`Genre`) REFERENCES `genres` (`Genre`);

--
-- Contraintes pour la table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `fk_scores_jeux` FOREIGN KEY (`Nom`) REFERENCES `jeux` (`Nom`),
  ADD CONSTRAINT `fk_scores_utilisateurs` FOREIGN KEY (`Pseudo`) REFERENCES `utilisateurs` (`Pseudo`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `fk_utilisateurs_types` FOREIGN KEY (`Type`) REFERENCES `types` (`Type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
