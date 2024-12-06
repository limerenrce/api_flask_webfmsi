-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_library
CREATE DATABASE IF NOT EXISTS `db_library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_library`;

-- Dumping structure for table db_library.tb_authors
CREATE TABLE IF NOT EXISTS `tb_authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `tb_authors_last_name_index` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Store the master data for The authors of books';

-- Dumping data for table db_library.tb_authors: ~11 rows (approximately)
INSERT INTO `tb_authors` (`author_id`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Satya', 'Uttami', '2024-11-29 10:00:01', '2024-11-29 10:00:01', NULL),
	(2, 'Aprillia', 'Kusuma', '2024-11-29 10:01:34', '2024-11-29 10:01:34', NULL),
	(3, 'Artini', 'Artalia', '2024-11-29 10:01:48', '2024-11-29 10:01:48', NULL),
	(4, 'Putri', 'Dharmayanti', '2024-11-29 10:02:09', '2024-11-29 10:02:09', NULL),
	(5, 'Keigo', 'Higashino', '2024-11-29 10:03:23', '2024-11-29 10:03:23', NULL),
	(6, 'Leila S.', 'Chudori', '2024-11-29 10:04:03', '2024-11-29 10:04:03', NULL),
	(7, 'Ziggy', 'Zezsyazeoviennazabrizkie', '2024-11-29 10:04:59', '2024-11-29 10:04:59', NULL),
	(8, 'Henry', 'Manampiring', '2024-11-29 10:07:48', '2024-11-29 10:07:48', NULL),
	(9, 'Oka', 'Rusmini', '2024-11-29 10:09:08', '2024-11-29 10:09:08', NULL),
	(11, 'Ananta Toer', 'Pramoedya', '2024-11-29 10:29:35', '2024-11-29 10:29:35', NULL),
	(12, 'Mew', 'Jeans', '2024-11-29 11:03:30', '2024-11-29 11:03:30', NULL),
	(13, 'Mew', 'Jeans', '2024-11-29 11:03:54', '2024-11-29 11:03:54', NULL);

-- Dumping structure for table db_library.tb_books
CREATE TABLE IF NOT EXISTS `tb_books` (
  `id_books` int NOT NULL AUTO_INCREMENT COMMENT 'incremental ID for table tb_books',
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Books title',
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Book created at',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_books`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_library.tb_books: ~17 rows (approximately)
INSERT INTO `tb_books` (`id_books`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Harry potter edit', 'update description updated', '2024-04-02 04:32:11', '2024-04-02 04:32:11'),
	(2, 'Romeo and Juliet', NULL, '2024-04-02 04:33:01', '2024-04-02 04:33:01'),
	(3, 'House of Flame and Shadow', NULL, '2024-04-02 04:33:54', '2024-04-02 04:33:54'),
	(4, 'Fourth Wing', NULL, '2024-04-02 04:34:13', '2024-04-02 04:34:13'),
	(5, 'Iron Flame', NULL, '2024-04-02 04:34:29', '2024-04-02 04:34:29'),
	(6, 'It Ends with us', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(7, 'Bride', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(8, 'Harry Potter Philosopher\'s Stone', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(9, 'Harry Potter Chamber of Secrets ', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(11, 'Harry Potter Goblet of File', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(12, 'Harry Potter Half Blood Prince', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(13, 'Harry Potter Deathly Hallows', NULL, '2024-04-02 04:36:52', '2024-04-02 04:36:52'),
	(29, 'update title books test', 'update description updated', '2024-05-14 15:12:08', '2024-05-14 15:12:08'),
	(32, 'test', 'delete books', '2024-05-15 00:53:10', '2024-05-15 00:53:10'),
	(33, 'test book harry potter', 'description book harry potter', '2024-05-15 04:48:29', '2024-05-15 04:48:29'),
	(34, '7 Habit of Highly Effective People', 'It is a nice book tbh', '2024-11-15 11:07:26', '2024-11-15 11:07:26');

-- Dumping structure for table db_library.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `users_pk` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_library.users: ~2 rows (approximately)
INSERT INTO `users` (`id_users`, `username`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'john_doe', '$2b$12$6bzZ3QZjTsMQ2xYmFijOKeGmu5JjeV5sb6LHkFOIOWObWL8dQy70S', '2024-05-29 07:35:50', '2024-05-29 07:35:50', NULL),
	(2, 'jean_doe', '$2b$12$Ywex3fWuHj0H90BztX7DieUvd6VHYHtu5LD8hxabL35f5WmSq3zp.', '2024-05-29 07:38:50', '2024-05-29 07:38:50', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
