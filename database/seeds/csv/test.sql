# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.12)
# Database: townsquare
# Generation Time: 2016-04-18 15:21:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table management
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management`;

CREATE TABLE `management` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` int(10) unsigned NOT NULL,
  `subordinate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `management_manager_id_foreign` (`manager_id`),
  KEY `management_subordinate_id_foreign` (`subordinate_id`),
  CONSTRAINT `management_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  CONSTRAINT `management_subordinate_id_foreign` FOREIGN KEY (`subordinate_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;

INSERT INTO `management` (`id`, `manager_id`, `subordinate_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,6,9,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(2,6,14,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(3,6,17,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(4,6,18,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(5,6,29,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(6,6,32,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(7,6,36,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(8,6,38,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(9,6,39,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(10,6,40,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(11,6,45,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(12,6,47,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(13,5,10,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(14,5,13,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(15,5,16,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(16,5,20,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(17,5,21,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(18,5,22,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(19,5,25,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(20,5,26,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(21,5,30,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(22,5,33,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(23,5,37,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(24,5,46,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(25,7,11,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(26,7,12,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(27,7,15,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(28,7,19,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(29,7,23,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(30,7,24,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(31,7,27,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(32,7,28,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(33,7,31,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(34,7,34,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(35,7,35,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(36,7,41,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(37,7,43,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(38,7,44,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(39,2,48,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(40,2,50,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(41,2,57,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(42,2,58,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(43,2,60,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(44,2,61,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(45,2,62,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(46,2,64,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(47,2,65,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(48,2,66,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(49,2,67,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(50,2,71,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(51,8,49,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(52,8,51,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(53,8,52,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(54,8,53,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(55,8,54,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(56,8,55,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(57,8,56,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(58,8,59,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(59,8,63,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(60,8,68,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(61,8,69,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(62,8,70,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(63,8,72,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(64,8,73,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(65,8,74,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(66,1,76,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(67,1,77,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(68,1,78,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL);

/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`migration`, `batch`)
VALUES
	('2014_10_12_000000_create_users_table',1),
	('2014_10_12_100000_create_password_resets_table',1),
	('2016_04_16_174819_create_phones_table',1),
	('2016_04_17_052918_create_management_table',1),
	('2016_04_17_063515_create_teams_table',1),
	('2016_04_17_071900_create_users_teams_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table phones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phones`;

CREATE TABLE `phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('cell','extension','work') COLLATE utf8_unicode_ci NOT NULL,
  `phoneable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneable_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;

INSERT INTO `phones` (`id`, `number`, `type`, `phoneable_type`, `phoneable_id`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,'(704) 469-4123','work','Tsi\\\\User',1,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(2,'(360) 601-6832','work','Tsi\\\\User',2,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(3,'(704) 469-4130','work','Tsi\\\\User',3,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(4,'(704) 469-4115','work','Tsi\\\\User',4,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(5,'(704) 469-4137','work','Tsi\\\\User',5,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(6,'(980) 475-2847','cell','Tsi\\\\User',1,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(7,'(360) 601-6832','cell','Tsi\\\\User',2,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(8,'(980) 475-1818','cell','Tsi\\\\User',3,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(9,'(980) 475-0962','cell','Tsi\\\\User',4,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(10,'(480) 650-3562','cell','Tsi\\\\User',5,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(11,'(757) 705-0447','cell','Tsi\\\\User',6,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(12,'(980) 253-9510','cell','Tsi\\\\User',7,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(13,'(718) 344-9943','cell','Tsi\\\\User',8,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(14,'5107','extension','Tsi\\\\User',10,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(15,'5121','extension','Tsi\\\\User',11,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(16,'5119','extension','Tsi\\\\User',13,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(17,'5093','extension','Tsi\\\\User',15,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(18,'5123','extension','Tsi\\\\User',16,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(19,'5023','extension','Tsi\\\\User',17,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(20,'5010','extension','Tsi\\\\User',20,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(21,'5066','extension','Tsi\\\\User',21,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(22,'5112','extension','Tsi\\\\User',22,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(23,'5087','extension','Tsi\\\\User',24,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(24,'5133','extension','Tsi\\\\User',25,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(25,'5083','extension','Tsi\\\\User',26,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(26,'5098','extension','Tsi\\\\User',27,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(27,'5101','extension','Tsi\\\\User',29,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(28,'5014','extension','Tsi\\\\User',31,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(29,'5111','extension','Tsi\\\\User',32,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(30,'5127','extension','Tsi\\\\User',34,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(31,'5047','extension','Tsi\\\\User',36,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(32,'5107','extension','Tsi\\\\User',37,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(33,'5024','extension','Tsi\\\\User',40,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(34,'5136','extension','Tsi\\\\User',42,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(35,'5099','extension','Tsi\\\\User',45,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(36,'5067','extension','Tsi\\\\User',46,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(37,'(810) 577-1155','cell','Tsi\\\\User',48,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(38,'(903) 521-6398','cell','Tsi\\\\User',49,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(39,'(517) 927-0894','cell','Tsi\\\\User',50,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(40,'(309) 429-0851','cell','Tsi\\\\User',51,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(41,'(915) 242-3111','cell','Tsi\\\\User',52,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(42,'(815) 275-2358','cell','Tsi\\\\User',53,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(43,'(518) 688-5868','cell','Tsi\\\\User',56,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(44,'(970) 219-7506','cell','Tsi\\\\User',57,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(45,'(763) 244-4058','cell','Tsi\\\\User',58,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(46,'(716) 255-1454','cell','Tsi\\\\User',59,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(47,'(848) 333-4867','cell','Tsi\\\\User',60,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(48,'(217) 853-5410','cell','Tsi\\\\User',62,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(49,'(806) 543-7656','cell','Tsi\\\\User',63,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(50,'(616) 366-1437','cell','Tsi\\\\User',64,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(51,'(337) 278-0913','cell','Tsi\\\\User',65,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(52,'(856) 261-4885','cell','Tsi\\\\User',66,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(53,'(205) 283-3032','cell','Tsi\\\\User',67,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(54,'(269) 599-3633','cell','Tsi\\\\User',68,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(55,'(603) 828-9950','cell','Tsi\\\\User',69,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(56,'(401) 241-9914','cell','Tsi\\\\User',70,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(57,'(208) 954-3291','cell','Tsi\\\\User',71,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(58,'(607) 725-8420','cell','Tsi\\\\User',72,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(59,'(802) 440-2865','cell','Tsi\\\\User',73,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(60,'(207) 219-9927','cell','Tsi\\\\User',74,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(61,'(406) 220-0230','cell','Tsi\\\\User',75,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(62,'(856) 816-7981','cell','Tsi\\\\User',76,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(63,'(704) 578-5968','cell','Tsi\\\\User',77,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(64,'(716) 449-1997','cell','Tsi\\\\User',78,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(65,'(704) 665-0611','work','Tsi\\\\User',77,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(66,'5077','extension','Tsi\\\\User',77,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(67,'(704) 469-4150','work','Tsi\\\\User',79,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(68,'(704) 469-4128','work','Tsi\\\\User',80,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(69,'5128','extension','Tsi\\\\User',79,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(70,'5016','extension','Tsi\\\\User',80,NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21');

/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;

INSERT INTO `teams` (`id`, `name`, `manager_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'$8K-47\'s',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(2,'Street Fighters',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(3,'Director of Sales',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(4,'El Presidente',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(5,'American Gongsters',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(6,'Dead President\'s Club',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(7,'Moneybadgers',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(8,'Ball So Hard University',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(9,'Training Events',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(10,'OSS',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL),
	(11,'ISS',0,'2016-04-18 15:15:21','2016-04-18 15:15:21',NULL);

/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sales_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `sales_id`, `api_token`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Todd','Krovitz','','$2y$10$f0IX0zFqdpLG4EcC/ZxqZOh/3ym3QLdAzA1UfZC.QOqXx9FGC68UK','','',NULL,'2016-04-18 15:15:15','2016-04-18 15:15:15'),
	(2,'Ryan','Misenar','','$2y$10$VntsIFfGECVHHfeccJquKu2xmv2EksQraGf97TGS7Mq.5eZe1Ih/a','','',NULL,'2016-04-18 15:15:15','2016-04-18 15:15:15'),
	(3,'Josh','Pate','','$2y$10$JlGX78nB.SKoK.uOoL5yqetMo95Lf7zP1INbWTX9.IHvHs/ajkUOi','','',NULL,'2016-04-18 15:15:15','2016-04-18 15:15:15'),
	(4,'Tim','Pirrone','','$2y$10$Cn98Qve/ePMATq4rZ/9YfeP96EzGlECC7mr3CLTgw95q0UJP//BvW','','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(5,'Nick','Rico','','$2y$10$fu94RIaEefO4zij73r9th.blzKFACNuIHm3juGCaRTeZ/veL/.BH6','','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(6,'Brian','Dickerson','','$2y$10$zH9ZCC5fQ.Yk6w0umfGnhOlYGUdT/KqtITXB.n52y6qaiWMXFJApu','','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(7,'Leia','Vachon','','$2y$10$fKjEd5CHr37K1ucGyw/q9OI8Nwgn7r5QrucwTgEt3Xt3XZoTEgppi','','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(8,'Aksel','Gulukyan','','$2y$10$JBDBdh8PdXcHwy1kDX1h2u1hPHRYftII6Ib37.9.h.JviEz/G0zBW','','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(9,'Ammar','Ayube','','$2y$10$4E3G6.FOgWQoNwzdZlwq8OvXNRkBNrF5n7jk17Fiwrt.mefR/LIOi','V07291','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(10,'Heather','Barb','','$2y$10$cewi4FatRuKaRW9tUBOwbu44VB.9gDHbdEP0kXpJ0z38mWlm9nU4.','C07148','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(11,'Adam','Barbee','','$2y$10$4sGWRBPM1/RYt4dQB4T/CeaKULdHleOc6nykkgsirc4YNtGzolamW','M06828','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(12,'Wayne','Bass','','$2y$10$uNo.y0dtBXOOh5zjCI/zzu.l.by6IA7BC6lTttr3p3lw1m66sR5B.','M07212','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(13,'Jaricka','Berger','','$2y$10$HUQlGyP3wOSNwHzIBmRNHuHcvkoBQjJFeZzjdvFnyApQN5gWo3X6q','C07131','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(14,'Ross','Blackstock','','$2y$10$0pAvmVgYpaCjFyKCw3AVH.EMdlJ.wa2q1nl.xucPcDaXqJ0VMDUJy','F07421','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(15,'Skyela','Campbell','','$2y$10$.n48owWrhf0M8qphHzG1l.9NiwwE7BNueWyiBjirx0/QFS07Jl.kO','J06585','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(16,'Jordan','Christoff','','$2y$10$rrayx/FO8F6wKQkemG3ztOiQsri0cB23YKaoGxXvfDflcoSf88gqm','U07122','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(17,'Garrett','Clark','','$2y$10$Dme1hTjCcJB0GeArgVX8wuIc1dz79Z43DwX6VgZu82rHhHhI5ZL1K','K06850','',NULL,'2016-04-18 15:15:16','2016-04-18 15:15:16'),
	(18,'Heather','Clark','','$2y$10$1z/1NZpLaAERaODqdKAnNubN2kXsF2KiZSHC37GU9QIp0MKXLq3Iq','L07235','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(19,'Jess','Cocchiara','','$2y$10$rsCg/46lhq9u7vKqFe8e4O8PpASGyMpszVxYBtnoABI5BjAGZ4qIa','Z07343','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(20,'Ryan','Daly','','$2y$10$K8ik3n7KTISmUjBmnxYbmuGTBiA3zbI0.sMZ0I0ea9HM8YcnuCLA.','E04756','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(21,'Mike','DeLaCruz','','$2y$10$mC6i6NLa/UjfMn23FLfR2Ou706.coXUpPajIT8VvTyQ2QrMNS.1sm','L07427','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(22,'Mark','De Sessa','','$2y$10$A9yaD527VpHtHH1TQqmO/.FuEIrq8/.aDhdVUuuBepgsandbCdRru','G06486','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(23,'Kaleigh','Earle','','$2y$10$AFFr/xTeA2x1kGPkC5V.pui4uUnkgiYuE/6TTung2eTr.3PbErV4O','J07425','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(24,'Sheryl','Fleming','','$2y$10$bv4jlW72bvNRldu3uPWQoemNB0aPkOsDgT06W5I0cS77U.znXHuZi','A06768','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(25,'Kristin','Geppert','','$2y$10$SarNXxjk8A.vgmK6sCdcTeGS4uLinj30J9CrZ7R5S0QhY1S7P1htO','I06944','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(26,'Erika','Guerrero','','$2y$10$3Kwi8a0QR87ZoUCpFu12YuDcFN5Lbs5ePSP50Zz3jFpujvjRoDEdC','D07347','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(27,'Alex','Hagen','','$2y$10$JRe/xNmUY8ynEhpQaLvO9uw0Zifvma5eUT4bDUfqunpdXbm8YT4f6','X05349','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(28,'William','Judd','','$2y$10$sHr3HMVqJzyXV.boypPHlu0zThQgEe5N0q0fbzq2mmE5PjJRqDk16','T07385','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(29,'Vladimir','Males','','$2y$10$pr11LTQ0UmOV.n1AnBfx5ug08ldynEJfmoEAkNR5ak/spN3N9d5lW','A05448','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(30,'Shawn','Mitcham','','$2y$10$AflTfs2vCiJXSvAMAKUwxuFHor.fNj3Q4sr3gORBHaAIjpvxzKd5u','P07262','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(31,'Lesley','Mitchell','','$2y$10$BZVYqSHLi7TuZwJk1IXKl.qjdektHleMX3RetlLOyroGKiqgTF4T2','G06294','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(32,'Michael','Moran','','$2y$10$3UnUII6QqA6vyQuR6EfPBezT/aLf1wA0ipska.5laNeWb9ZurIP.m','R07023','',NULL,'2016-04-18 15:15:17','2016-04-18 15:15:17'),
	(33,'Thomas','Muratore','','$2y$10$X0FZ9/zzRr.rpEGsBd1ao.aXESpFUnBKOOuI0AwP2f5mJCc3zw2um','E07300','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(34,'Jake','Nager','','$2y$10$IuxLuQQZGW9ISajbBu7KcO1cHMLnqbxS.NdfIbe4FKmYLU2ASU.TK','B06817','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(35,'Jericha','Nichols','','$2y$10$9LC/8m3Myw4T1112ljY5JuibLquswB35YwSeEVgmQduAc0U5dxFl6','B07297','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(36,'Eric','Ormsbee','','$2y$10$d8xItTJVuuLImf7d3boZ3us.jT2JNwWvbHWE1D5PGz5Do8hszFrPS','N06181','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(37,'Philip','Perry','','$2y$10$kzRbAa4C31s3pAyLipKsteNLSz0xvqgVkIC9GEUMuUC3nhFkSslWC','B07345','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(38,'Lauren','Pierce','','$2y$10$wF5fUvYqUOVh61kpsuCJfe3YSU88NVQZi7NMEnYknepmlBdmr1AKy','L07379','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(39,'Dan','Plunkett','','$2y$10$MY0TfGekY3Uh6e4AjuIlYuYlDokmM87Qg8Hzf0doC3yvfL5S2XGSi','C07346','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(40,'Sean','Ryan','','$2y$10$xalWzTS2RWyke7gWWRkjRe087PtqWwkXBKRD9HzWUxUHFpUHSfLhe','P07022','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(41,'Lindsey','Schievink','','$2y$10$Pa9emMJyU4MaEhbhkXVRqe1jFNuo5eZQS05yF9ZYI9xmX.Qa4L3pq','V07219','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(42,'Ashley','Todd','','$2y$10$rgslb9Q2IxoCqTXl1yzBs.1.n5RwY/0asLhSu0y3kGEGOCpWX9Wbm','M06852','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(43,'Chris','Tran','','$2y$10$1B6RtC9SPdEVQuhFoch9VeYJHTitJaauipyvoZ7kvlRNdpZS7eXCa','V07267','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(44,'Jay','Tremmel','','$2y$10$GtPGVLS/G9ae4Pifb0EXsu6YvnA7.t99QuJjK1xwx4k/5JFh4WxCW','F07301','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(45,'Joey','Vachon','','$2y$10$WHiLHuV9HsJFn2A5sL0toOtblcMh4UBqmRNOAK6D/XQlcQQKEwdI.','H05407','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(46,'Meredith','Walsh','','$2y$10$6pYPudgvB6dxC/mcNuX2jeeK.N21SSr.vZ9qv5Sl0xi7Rt4BTNRQC','Y07030','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(47,'Matt','Whiteside','','$2y$10$5Xksw/.VdxoQDT9a5iYviuhHGqmnPGAe/AkzrKANXs8dc53dOxl6S','U07290','',NULL,'2016-04-18 15:15:18','2016-04-18 15:15:18'),
	(48,'Rebeca','Anderson','','$2y$10$VOBaKI0ApJP9VyNxmwBmWeZE6eQrZx.yuiWepB4gJtd.yOITWW0xq','B06769','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(49,'Jason','Bailey','','$2y$10$UVXc3rQ04BRdXkkJOKeO..nnuzkka5l2NFSf/ZWEbJbyJIybCUDZK','C05114','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(50,'Michelle','Batchelor','','$2y$10$wR0QglbM24TbFAEvWF7fqe2rvO09/3IIb0GKPQVlvqpC3CTgRbuVi','U07026','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(51,'Calla','Boley','','$2y$10$KyjcQPmK0ZJ/R6JgeGfNZO8CSbiJK4JH8dUzcldcGCgQNFMawKA4S','N07213','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(52,'Irene','Cordova','','$2y$10$x2.e9MZJbd1rbCMjHVUZgeZZpsb9x6I6ZfAFQr3lqsLDc4BokpBNi','S07216','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(53,'Leah','Dixon','','$2y$10$bZa/wsgteNvUBab24cZ.4uPammPR0hx6ga3eYCpdZyS/hfj8IcaD2','N06853','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(54,'Janet','Fermo','','$2y$10$n82K/PEgidMBx2qDcLb/xOyee/gumc8jW4d6NoGxUohWLUQwBsgze','J07401','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(55,'Tara','Gelsomino','','$2y$10$gxwuO8IAB3GeprrqnXK1ae3WFl/7Areg9Tjf3DsynoFYmFQtcHtnu','','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(56,'Janette','Hammond','','$2y$10$.jtti.mKDzDLvYpvPS8tEe/eLyh8mt4dK7R9/PIFKv/ZGkOY//T6a','M06972','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(57,'Angie','Hauser','','$2y$10$NJX6kp29Hx77Mz9wABElSOiMR8stXfoQk2waNf.eER.zc7FlSftk.','M06516','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(58,'Chad','Hobot','','$2y$10$pGlR/pXn2MiaNGMxiBxAjeQnXaPGXRAZzkt2Vt7hDXc63Bvee8VnS','J06969','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(59,'Thom','Jennings','','$2y$10$WTVYYqiYZ93Qcv727baOT.O8Geq9B.IFyFumOVkzC3GCamIgMdwnG','P07214','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(60,'Nicole','Kearney','','$2y$10$QfqrKTtzpKBNEvI3seA.hOV1laiQfO5JUcndBfJevKJ1LnUqQXwoC','N06949','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(61,'Ryan','London','','$2y$10$o.qZC0FYcoKS3TpqE.iX/.e.hXcoeHIW9gcKcAHDQVluyJg6inw3K','R07407','',NULL,'2016-04-18 15:15:19','2016-04-18 15:15:19'),
	(62,'Patrick','McShea','','$2y$10$xzfbOATTLPGn.mv77c9F1.Tw4VKPdekGr5HfcKp.B.GDZ2k58UI8m','H06679','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(63,'Mallory','Maxwell','','$2y$10$1gp5esm9qGNRPoGdtkZq6.m0uJYWONCNYCv.fDBuYshLAB9xbriBe','A07032','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(64,'Jillian','May','','$2y$10$Um8Eg79mU0CwKrjH77wFB.KIVneORdPe6IrtYCLvThhky/Q92nORi','T07217','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(65,'Casey','Miller','','$2y$10$BN2yGOIOTeg5f2d7GUbbx.OmFI6D4dZZBXVkvFR4zwoDExqMcmIBi','J06105','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(66,'Ashley','Olson','','$2y$10$KOHUtiJsrQECAsXqsNLG1Ogt9OE53YJfM29QaH88q8VTTnZu4KaCq','R07215','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(67,'Chasity','Reach','','$2y$10$TflnLYJ1EIRK7IW9B6lkle5sOuouaRUEaoRBsPgJXjoFjJJDFFB/S','P06950','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(68,'Mackenzie','Schutter','','$2y$10$aO8uii6IEV9o6ioEOfyXh.j3w2c6xhseULaHQFw2oWeBc2/2xDFLm','M07308','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(69,'John','Tellier','','$2y$10$0YiqVZVKipm787RgNg2w0.tPb5.m.90piRkVT/hMhXeezRj1aQUty','M06948','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(70,'Lisa','Thomas','','$2y$10$jygmXTqWBoOkXIbByh2BuOUp..CA1oa.v9II2UQdNSvP7YUE.kRFy','H05143','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(71,'Shane','Tolman','','$2y$10$7mG.AHxwyjSEbgoAQ7XHx.GxJOid5Uv2S0YCOfFaC4yT2bWI4F6P.','U07218','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(72,'Joe','Waldowski','','$2y$10$ruMTZlqLx4zk3R2jzhsN4usE9zYTvsF4.jEzs9Kl93lfE/DE32eGW','V06859','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(73,'Larry','Walsh','','$2y$10$xxZWUYIjZ5aIyW6nvSFUsO6UNxc5nT/pZ4CRVq0gUEp569g0C3DQK','D07299','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(74,'Andrew','Woolford','','$2y$10$eBg4QHV8mU2FdiQBXZrtsegyMLYAV6Ygq.nKjg63hetqzOt.1.VIK','J06945','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(75,'Alex','Zundel','','$2y$10$j/5Lp6n1FSYTod0MMBBNfe01uGkJZrkNg3ZNDJloW.D1bjZMyCQUe','M06108','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(76,'David','Callahan','','$2y$10$c35UIsmCtIGazoQk2cvqqOtn4CZNjAs1cywAYOdHjrFdaajmZjjBK','K06202','',NULL,'2016-04-18 15:15:20','2016-04-18 15:15:20'),
	(77,'May','Ly','','$2y$10$6WOY2.MI6iiRNrSIGcSZ9uQPsPtZDA94UNxXZrSEMu7CM3za83gsC','K05098','',NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(78,'Marc','Notaro','','$2y$10$PpVYbqO6GncLmpBuTpFsxeL4JOFMkVnxtv9cTO4MUKmXD8GGbO0Xm','E06100','',NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(79,'Sara','Ryan','','$2y$10$Ed4SuR7RIlu6.j82z0vgmOUbCvMTfWCI2K9FKOjvnmBvOasOGvr/S','W06692','',NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21'),
	(80,'Katrina','Smith','','$2y$10$jNS/BKAs3YhOw3sTDGxjreznv.F9udYXaXRZYlockwWpG2fIL1tqi','X06693','',NULL,'2016-04-18 15:15:21','2016-04-18 15:15:21');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_teams`;

CREATE TABLE `users_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `team_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_teams_user_id_foreign` (`user_id`),
  KEY `users_teams_team_id_foreign` (`team_id`),
  CONSTRAINT `users_teams_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `users_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users_teams` WRITE;
/*!40000 ALTER TABLE `users_teams` DISABLE KEYS */;

INSERT INTO `users_teams` (`id`, `team_role`, `user_id`, `team_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'',1,1,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(2,'',1,9,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(3,'',2,2,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(4,'',2,10,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(5,'',3,3,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(6,'',4,4,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(7,'',5,5,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(8,'',5,11,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(9,'',6,6,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(10,'',6,11,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(11,'',7,7,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(12,'',7,11,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(13,'',8,8,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21'),
	(14,'',8,10,'2016-04-18 15:15:21',NULL,'2016-04-18 15:15:21');

/*!40000 ALTER TABLE `users_teams` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
