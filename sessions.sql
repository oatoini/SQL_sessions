-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour sessions
CREATE DATABASE IF NOT EXISTS `sessions` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sessions`;

-- Listage de la structure de la table sessions. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.categorie : ~2 rows (environ)
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`id`, `nom`) VALUES
	(1, 'Bureautique'),
	(2, 'Programmation');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Listage de la structure de la table sessions. cours
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FDCA8C9CBCF5E72D` (`categorie_id`),
  CONSTRAINT `FK_FDCA8C9CBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.cours : ~4 rows (environ)
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` (`id`, `categorie_id`, `nom`) VALUES
	(1, 1, 'Word'),
	(2, 1, 'Excel'),
	(3, 2, 'Back'),
	(4, 2, 'Front');
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;

-- Listage de la structure de la table sessions. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sessions.doctrine_migration_versions : ~1 rows (environ)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20220517070512', '2022-05-17 07:06:28', 8486);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table sessions. eleve
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.eleve : ~25 rows (environ)
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT INTO `eleve` (`id`, `nom`, `prenom`) VALUES
	(1, 'Ferrand', 'Isabelle'),
	(2, 'Collin', 'Honore'),
	(3, 'Carre', 'Bernadette'),
	(4, 'Guerin-Diallo', 'Leon'),
	(5, 'Valentin', 'Jules'),
	(6, 'Royer', 'Alex'),
	(7, 'Bazin', 'Adrien'),
	(8, 'Noemi', 'Nicolas'),
	(9, 'Blanc', 'Anastasie'),
	(10, 'Ledoux', 'Henriette'),
	(11, 'Le Roux', 'Capucine'),
	(12, 'Fernandez', 'Patrick'),
	(13, 'Boulanger', 'Xavier'),
	(14, 'Petitjean', 'Henriette'),
	(15, 'Martel', 'Augustin'),
	(16, 'Abbad', 'Salma'),
	(17, 'Texeira', 'Benoit'),
	(18, 'Gautier', 'Margot'),
	(19, 'Geisler', 'Theresa'),
	(20, 'Yilmaz', 'Gunay'),
	(21, 'Jesus', 'Lucas'),
	(22, 'Lambert', 'Clemence'),
	(23, 'Caron', 'Andre'),
	(24, 'Blanc', 'Elise'),
	(25, 'Theodore', 'Alexandre');
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;

-- Listage de la structure de la table sessions. formation
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.formation : ~2 rows (environ)
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` (`id`, `nom`) VALUES
	(1, 'DevWeb'),
	(2, 'Vente');
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;

-- Listage de la structure de la table sessions. programme
CREATE TABLE IF NOT EXISTS `programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `cours_id` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DDCB9FF613FECDF` (`session_id`),
  KEY `IDX_3DDCB9FF7ECF78B0` (`cours_id`),
  CONSTRAINT `FK_3DDCB9FF613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_3DDCB9FF7ECF78B0` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.programme : ~12 rows (environ)
/*!40000 ALTER TABLE `programme` DISABLE KEYS */;
INSERT INTO `programme` (`id`, `session_id`, `cours_id`, `duree`) VALUES
	(1, 1, 1, 15),
	(2, 1, 2, 20),
	(3, 1, 3, 55),
	(4, 1, 4, 60),
	(5, 2, 1, 15),
	(6, 2, 2, 20),
	(7, 2, 3, 60),
	(8, 2, 4, 50),
	(9, 3, 1, 50),
	(10, 3, 2, 60),
	(11, 4, 1, 50),
	(12, 4, 2, 60);
/*!40000 ALTER TABLE `programme` ENABLE KEYS */;

-- Listage de la structure de la table sessions. session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formation_id` int(11) DEFAULT NULL,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `capacite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D45200282E` (`formation_id`),
  CONSTRAINT `FK_D044D5D45200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.session : ~4 rows (environ)
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`id`, `formation_id`, `nom`, `date_debut`, `date_fin`, `capacite`) VALUES
	(1, 1, 'session_janvier', '2022-01-01 00:00:00', '2022-07-01 00:00:00', 10),
	(2, 1, 'session_juillet', '2022-07-01 00:00:00', '2022-12-01 00:00:00', 10),
	(3, 2, 'session_janvier', '2022-04-01 00:00:00', '2022-10-01 00:00:00', 10),
	(4, 2, 'session_juillet', '2023-01-01 00:00:00', '2023-05-01 00:00:00', 10),
	(5, 1, 'session_mars', '2023-01-01 00:00:00', '2023-07-01 00:00:00', 10);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;

-- Listage de la structure de la table sessions. session_eleve
CREATE TABLE IF NOT EXISTS `session_eleve` (
  `session_id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`,`eleve_id`),
  KEY `IDX_37DCBD21613FECDF` (`session_id`),
  KEY `IDX_37DCBD21A6CC7B2` (`eleve_id`),
  CONSTRAINT `FK_37DCBD21613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_37DCBD21A6CC7B2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sessions.session_eleve : ~28 rows (environ)
/*!40000 ALTER TABLE `session_eleve` DISABLE KEYS */;
INSERT INTO `session_eleve` (`session_id`, `eleve_id`) VALUES
	(1, 1),
	(1, 5),
	(1, 9),
	(1, 13),
	(1, 17),
	(1, 21),
	(1, 25),
	(2, 2),
	(2, 3),
	(2, 6),
	(2, 10),
	(2, 14),
	(2, 18),
	(2, 22),
	(3, 2),
	(3, 3),
	(3, 7),
	(3, 11),
	(3, 15),
	(3, 19),
	(3, 23),
	(4, 1),
	(4, 4),
	(4, 8),
	(4, 12),
	(4, 16),
	(4, 20),
	(4, 24);
/*!40000 ALTER TABLE `session_eleve` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
