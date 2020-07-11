-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 11 juil. 2020 à 21:56
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_stagiaires`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `id_abs` int(11) NOT NULL AUTO_INCREMENT,
  `cin` char(9) DEFAULT NULL,
  `date_D` date DEFAULT NULL,
  `date_F` date DEFAULT NULL,
  `justification` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_abs`),
  KEY `cin` (`cin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

DROP TABLE IF EXISTS `affectation`;
CREATE TABLE IF NOT EXISTS `affectation` (
  `cin` char(9) NOT NULL,
  `id_stg` int(11) NOT NULL,
  `date_D` date DEFAULT NULL,
  `date_F` date DEFAULT NULL,
  `eta_avancement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cin`,`id_stg`),
  KEY `id_stg` (`id_stg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `encadreurs`
--

DROP TABLE IF EXISTS `encadreurs`;
CREATE TABLE IF NOT EXISTS `encadreurs` (
  `matricule` int(11) NOT NULL AUTO_INCREMENT,
  `id_fonct` int(11) DEFAULT NULL,
  `nom_enc` varchar(250) DEFAULT NULL,
  `prenom_enc` varchar(250) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `tele` char(11) DEFAULT NULL,
  PRIMARY KEY (`matricule`),
  KEY `id_fonct` (`id_fonct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fonction_enc`
--

DROP TABLE IF EXISTS `fonction_enc`;
CREATE TABLE IF NOT EXISTS `fonction_enc` (
  `id_fonct` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fonct` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_fonct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `nom_serv` varchar(250) DEFAULT NULL,
  `chef_serv` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `id_stg` int(11) NOT NULL AUTO_INCREMENT,
  `type_stage` varchar(250) DEFAULT NULL,
  `titre_sujet` varchar(50) DEFAULT NULL,
  `desc_sujet` text DEFAULT NULL,
  PRIMARY KEY (`id_stg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stagiaires`
--

DROP TABLE IF EXISTS `stagiaires`;
CREATE TABLE IF NOT EXISTS `stagiaires` (
  `cin` char(9) NOT NULL,
  `id_service` int(11) DEFAULT NULL,
  `matricule` int(11) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `sexe` tinyint(1) DEFAULT NULL,
  `deate_nss` date DEFAULT NULL,
  `etab` varchar(250) DEFAULT NULL,
  `CV` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `niveau` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`cin`),
  KEY `id_service` (`id_service`),
  KEY `matricule` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom_user` varchar(250) DEFAULT NULL,
  `prenom_user` varchar(250) DEFAULT NULL,
  `login` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`cin`) REFERENCES `stagiaires` (`cin`);

--
-- Contraintes pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `affectation_ibfk_1` FOREIGN KEY (`cin`) REFERENCES `stagiaires` (`cin`),
  ADD CONSTRAINT `affectation_ibfk_2` FOREIGN KEY (`id_stg`) REFERENCES `stage` (`id_stg`);

--
-- Contraintes pour la table `encadreurs`
--
ALTER TABLE `encadreurs`
  ADD CONSTRAINT `encadreurs_ibfk_1` FOREIGN KEY (`id_fonct`) REFERENCES `fonction_enc` (`id_fonct`);

--
-- Contraintes pour la table `stagiaires`
--
ALTER TABLE `stagiaires`
  ADD CONSTRAINT `stagiaires_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `stagiaires_ibfk_2` FOREIGN KEY (`matricule`) REFERENCES `encadreurs` (`matricule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
