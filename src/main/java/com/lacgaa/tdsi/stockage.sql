-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 03 jan. 2019 à 04:48
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `stockage`
--

-- --------------------------------------------------------

--
-- Structure de la table `authentification`
--

DROP TABLE IF EXISTS `authentification`;
CREATE TABLE IF NOT EXISTS `authentification` (
  `idAuth` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`idAuth`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `authentification`
--

INSERT INTO `authentification` (`idAuth`, `user`, `password`) VALUES
(1, 'jurispenale@gmail.com', 'jdk2016'),
(2, 'ali@hotmail.com', 'jdk2016'),
(3, 'ram@gmail.com', 'jdk2018'),
(4, 'cherifkasse0@gmail.com', 'jdk2016'),
(5, 'jurispena@gmail.com', 'jdk2016'),
(6, 'ra@gmail.com', 'jdk2016');

-- --------------------------------------------------------

--
-- Structure de la table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `tel` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `subscribe`
--

INSERT INTO `subscribe` (`id`, `nom`, `prenom`, `email`, `pass`, `tel`) VALUES
(1, 'farid', 'mohamed', 'jurispenale@gmail.com', 'jdk2016', '778752421'),
(2, 'ali', 'mohamed', 'ali@hotmail.com', 'jdk2016', '77663490'),
(3, 'ramadan', 'mohamed', 'ram@gmail.com', 'jdk2018', '7777777777777'),
(4, 'cherif', 'kasse', 'cherifkasse0@gmail.com', 'jdk2016', '7777777777'),
(5, 'farid', 'kkkk', 'jurispena@gmail.com', 'jdk2016', '777777'),
(6, 'ggggg', 'ggggg', 'ra@gmail.com', 'jdk2016', '6666666');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
