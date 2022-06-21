-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 22 août 2019 à 15:01
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `fichier_virement`
--

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `Username`, `Password`) VALUES
(1, 'Sihem', '20342070');

-- --------------------------------------------------------

--
-- Structure de la table `virement`
--

DROP TABLE IF EXISTS `virement`;
CREATE TABLE IF NOT EXISTS `virement` (
  `ID_Virement` int(11) NOT NULL AUTO_INCREMENT,
  `CodeE` varchar(2) NOT NULL,
  `CodeBanqueDest` varchar(2) NOT NULL,
  `RIB_D` varchar(20) NOT NULL,
  `DateE` varchar(8) NOT NULL,
  `NumFichier` varchar(20) NOT NULL,
  `CodeRegistre` varchar(15) NOT NULL,
  `Nbr_Tot_Im_virement` varchar(10) NOT NULL,
  `Montant_Tot` varchar(12) NOT NULL,
  `ContrePartie` varchar(20) NOT NULL,
  `filler` varchar(51) NOT NULL,
  `CodeE_IM` varchar(2) NOT NULL,
  `CodeBanqueBen` varchar(2) NOT NULL,
  `RIB_DO` varchar(20) NOT NULL,
  `RIB_B` varchar(20) NOT NULL,
  `numDossier` varchar(20) NOT NULL,
  `motif` varchar(50) NOT NULL,
  `Montant_det_v` varchar(10) NOT NULL,
  `CodeMotif` varchar(2) NOT NULL,
  `Zone_inutilise` varchar(34) NOT NULL,
  PRIMARY KEY (`ID_Virement`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
