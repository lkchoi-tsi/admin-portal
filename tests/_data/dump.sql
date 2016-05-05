# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.12)
# Database: test
# Generation Time: 2016-05-01 17:31:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ap_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_migrations`;

CREATE TABLE `ap_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_migrations` WRITE;
/*!40000 ALTER TABLE `ap_migrations` DISABLE KEYS */;

INSERT INTO `ap_migrations` (`migration`, `batch`)
VALUES
	('2014_10_12_000000_create_users_table',1),
	('2014_10_12_100000_create_password_resets_table',1),
	('2016_04_17_063515_create_teams_table',1),
	('2016_04_22_215353_create_roles_table',1),
	('2016_04_22_215402_create_permissions_table',1),
	('2016_04_22_215431_create_roles_permissions_table',1),
	('2016_04_22_231900_create_users_roles_table',1),
	('2016_04_23_200807_create_users_permissions_table',1),
	('2016_04_25_231322_add_status_to_users_table',1),
	('2016_04_25_232551_add_wp_id_to_users_table',1);

/*!40000 ALTER TABLE `ap_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ap_password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_password_resets`;

CREATE TABLE `ap_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table ap_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_permissions`;

CREATE TABLE `ap_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_permissions` WRITE;
/*!40000 ALTER TABLE `ap_permissions` DISABLE KEYS */;

INSERT INTO `ap_permissions` (`id`, `name`, `label`, `enabled`)
VALUES
	(1,'everything-except-maintain-code','Everything',1),
	(2,'maintain-code','Maintain Code',0),
	(3,'client-search','Client Search',1),
	(4,'client-cancellation','Client Cancellation',1),
	(5,'employee-list-management','Employee List Management',1),
	(6,'store-provisioning','ECWID Provisioning',1),
	(7,'store-upgrade','ECWID Upgrade/Downgrade',1),
	(8,'store-cancellation','ECWID Cancellation',1),
	(9,'audience-extension-go-live','Audience Extension Go Live',1),
	(10,'audience-extension-cancellation','Audience Extension Cancellation',1),
	(11,'directory-listing-provisioning','Yext Provisioning',1),
	(12,'directory-listing-cancellation','Yext Cancellation',1),
	(13,'user-role-management','User Management - Create & Edit Roles',1),
	(14,'user-role-assignment','User Management - Assign Roles to Users',1),
	(15,'user-permission-assignment','User Management - Override Permissions for Users',1),
	(16,'payment-update','CC / ACH Update',1),
	(17,'site-creation','Site Creation',1),
	(18,'create-landing-page','Create Landing Page',1),
	(19,'create-demo-site','Create Demo Site',1),
	(20,'create-client-site','Create Client Site',1),
	(21,'copy-from-client-site','Copy from Client Site',1),
	(22,'copy-from-stock-site','Copy from Stock Site',1),
	(23,'reserved','Reserved',0);

/*!40000 ALTER TABLE `ap_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ap_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_roles`;

CREATE TABLE `ap_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_roles` WRITE;
/*!40000 ALTER TABLE `ap_roles` DISABLE KEYS */;

INSERT INTO `ap_roles` (`id`, `name`, `label`, `enabled`, `hidden`)
VALUES
	(1,'developer','Developer',1,1),
	(2,'account-manager','Account Manager',1,0),
	(3,'designer','Designer',1,0),
	(4,'director','Director',1,0),
	(5,'agency','Agency',1,0),
	(6,'analyst','Analyst',1,0),
	(7,'billing','Billing',1,0),
	(8,'content','Content',1,0),
	(9,'marketing','Marketing',1,0),
	(10,'retention','Retention',1,0),
	(11,'social-media-poster','Social Media Poster',1,0),
	(12,'sales-rep','Sales Rep',1,0),
	(13,'service-manager','Service Manager',1,0),
	(14,'sales-manager','Sales Manager',1,0),
	(15,'finance-administrator','Finance Administrator',1,0),
	(16,'development-administrator','Development Administrator',1,0),
	(17,'client','Client',1,0),
	(18,'reserved','Reserved',1,0);

/*!40000 ALTER TABLE `ap_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ap_roles_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_roles_permissions`;

CREATE TABLE `ap_roles_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `access` enum('grant','deny') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'grant',
  `enabled` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `roles_permissions_role_id_foreign` (`role_id`),
  KEY `roles_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ap_permissions` (`id`),
  CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ap_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_roles_permissions` WRITE;
/*!40000 ALTER TABLE `ap_roles_permissions` DISABLE KEYS */;

INSERT INTO `ap_roles_permissions` (`id`, `role_id`, `permission_id`, `access`, `enabled`, `hidden`)
VALUES
	(1,1,1,'grant',1,0),
	(2,1,2,'grant',1,1),
	(3,2,3,'grant',1,0),
	(4,2,6,'grant',1,0),
	(5,2,7,'grant',1,0),
	(6,2,11,'grant',1,0),
	(7,2,16,'grant',1,0),
	(8,3,3,'grant',1,0),
	(9,3,6,'grant',1,0),
	(10,3,7,'grant',1,0),
	(11,3,11,'grant',1,0),
	(12,3,16,'grant',1,0),
	(13,4,3,'grant',1,0),
	(14,4,6,'grant',1,0),
	(15,4,7,'grant',1,0),
	(16,4,8,'grant',1,0),
	(17,4,9,'grant',1,0),
	(18,4,10,'grant',1,0),
	(19,4,11,'grant',1,0),
	(20,4,16,'grant',1,0),
	(21,4,14,'grant',1,0),
	(22,4,12,'grant',1,0),
	(23,5,3,'grant',1,0),
	(24,5,6,'grant',1,0),
	(25,5,7,'grant',1,0),
	(26,5,11,'grant',1,0),
	(27,5,16,'grant',1,0),
	(28,6,3,'grant',1,0),
	(29,6,6,'grant',1,0),
	(30,6,7,'grant',1,0),
	(31,6,11,'grant',1,0),
	(32,6,16,'grant',1,0),
	(33,7,3,'grant',1,0),
	(34,7,6,'grant',1,0),
	(35,7,7,'grant',1,0),
	(36,7,9,'grant',1,0),
	(37,7,10,'grant',1,0),
	(38,7,11,'grant',1,0),
	(39,7,12,'grant',1,0),
	(40,7,8,'grant',1,0),
	(41,7,16,'grant',1,0),
	(42,8,3,'grant',1,0),
	(43,8,6,'grant',1,0),
	(44,8,7,'grant',1,0),
	(45,8,11,'grant',1,0),
	(46,8,16,'grant',1,0),
	(47,9,3,'grant',1,0),
	(48,9,6,'grant',1,0),
	(49,9,7,'grant',1,0),
	(50,9,11,'grant',1,0),
	(51,9,16,'grant',1,0),
	(52,10,3,'grant',1,0),
	(53,10,6,'grant',1,0),
	(54,10,7,'grant',1,0),
	(55,10,11,'grant',1,0),
	(56,10,16,'grant',1,0),
	(57,11,3,'grant',1,0),
	(58,11,6,'grant',1,0),
	(59,11,7,'grant',1,0),
	(60,11,11,'grant',1,0),
	(61,11,16,'grant',1,0),
	(62,12,3,'grant',1,0),
	(63,13,3,'grant',1,0),
	(64,13,6,'grant',1,0),
	(65,13,7,'grant',1,0),
	(66,13,8,'grant',1,0),
	(67,13,9,'grant',1,0),
	(68,13,10,'grant',1,0),
	(69,13,11,'grant',1,0),
	(70,13,12,'grant',1,0),
	(71,13,16,'grant',1,0),
	(72,13,14,'grant',1,0),
	(73,14,3,'grant',1,0),
	(74,14,14,'grant',1,0),
	(75,15,3,'grant',1,0),
	(76,15,5,'grant',1,0),
	(77,15,6,'grant',1,0),
	(78,15,7,'grant',1,0),
	(79,15,8,'grant',1,0),
	(80,15,9,'grant',1,0),
	(81,15,10,'grant',1,0),
	(82,15,11,'grant',1,0),
	(83,15,12,'grant',1,0),
	(84,15,16,'grant',1,0),
	(85,15,13,'grant',1,0),
	(86,15,14,'grant',1,0),
	(87,15,15,'grant',1,0),
	(88,16,3,'grant',1,0),
	(89,16,5,'grant',1,0),
	(90,16,6,'grant',1,0),
	(91,16,7,'grant',1,0),
	(92,16,8,'grant',1,0),
	(93,16,9,'grant',1,0),
	(94,16,10,'grant',1,0),
	(95,16,11,'grant',1,0),
	(96,16,12,'grant',1,0),
	(97,16,13,'grant',1,0),
	(98,16,14,'grant',1,0),
	(99,16,15,'grant',1,0),
	(100,16,16,'grant',1,0),
	(101,15,17,'grant',1,0),
	(102,13,17,'grant',1,0),
	(103,13,19,'grant',1,0),
	(104,3,17,'grant',1,0),
	(105,16,17,'grant',1,0),
	(106,16,18,'grant',1,0),
	(107,16,19,'grant',1,0),
	(108,4,4,'grant',1,0),
	(109,7,4,'grant',1,0),
	(110,13,4,'grant',1,0),
	(111,15,4,'grant',1,0);

/*!40000 ALTER TABLE `ap_roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ap_teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_teams`;

CREATE TABLE `ap_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_manager_id_foreign` (`manager_id`),
  CONSTRAINT `teams_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `ap_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_teams` WRITE;
/*!40000 ALTER TABLE `ap_teams` DISABLE KEYS */;

INSERT INTO `ap_teams` (`id`, `name`, `manager_id`, `type`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'$8K-47\'s',1,'Training Events','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(2,'Street Fighters',2,'OSS','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(3,'Director of Sales',3,'','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(4,'El Presidente',4,'','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(5,'American Gongsters',5,'ISS','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(6,'Dead President\'s Club',6,'ISS','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(7,'Moneybadgers',7,'ISS','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL),
	(8,'Ball So Hard University',8,'OSS','2016-05-01 17:31:25','2016-05-01 17:31:25',NULL);

/*!40000 ALTER TABLE `ap_teams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ap_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_users`;

CREATE TABLE `ap_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cell_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','terminated') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `wp_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_manager_id_foreign` (`manager_id`),
  CONSTRAINT `users_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `ap_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_users` WRITE;
/*!40000 ALTER TABLE `ap_users` DISABLE KEYS */;

INSERT INTO `ap_users` (`id`, `employee_id`, `first_name`, `last_name`, `email`, `password`, `cell_phone`, `work_phone`, `extension`, `manager_id`, `remember_token`, `created_at`, `updated_at`, `status`, `wp_id`)
VALUES
	(1,NULL,'Todd','Krovitz','todd.krovitz@townsquaremedia.com','$2y$10$m9jFXKgPdkL55eTdRIn29.yn1cftwgmJxZj/QOI/L8LWX5jk5NpWy','(980) 475-2847','(704) 469-4123',NULL,NULL,NULL,'2016-05-01 17:31:19','2016-05-01 17:31:19','active',2514),
	(2,NULL,'Ryan','Misenar','ryan.misenar@townsquaremedia.com','$2y$10$Cv6PHFgGJ7FGgib8hI6IjuR/PfnDQ3wukCVeDANfHN0j7HgXaaVsi','(360)-601-6832','(360) 601-6832',NULL,NULL,NULL,'2016-05-01 17:31:19','2016-05-01 17:31:19','active',2524),
	(3,NULL,'Josh','Pate','josh.pate@townsquaremedia.com','$2y$10$HfYT2d2r7poCp2BSX5qL4uq17T3HlQxQKeRv6kdRJdUYtOHjaCVse','(980) 475-1818','(704) 469-4130',NULL,NULL,NULL,'2016-05-01 17:31:19','2016-05-01 17:31:19','active',2516),
	(4,NULL,'Tim','Pirrone','tim.pirrone@townsquaremedia.com','$2y$10$JzoNL4q04Y8T1BwB3I0CleQ/5/f5hJak4RaBYq3L.31s6c9VU.U1.','(980) 475-0962','(704) 469-4115',NULL,NULL,NULL,'2016-05-01 17:31:19','2016-05-01 17:31:19','active',2992),
	(5,NULL,'Nick','Rico','nick.rico@townsquaremedia.com','$2y$10$xk/3Hw6cNSCZwkeDsAfUbe8BixL3Vf74.UAFN2I9oRmm0w1MUHCLu','(480) 650-3562','(704) 469-4137',NULL,NULL,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',2624),
	(6,NULL,'Brian','Dickerson','brian.dickerson@townsquaremedia.com','$2y$10$cqB0PV5wGm7NVJ0TZQ5zA.8Y10gIDMhYCS938FYpfwcEM2Qo.Wacy','(757) 705-0447',NULL,NULL,NULL,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',2529),
	(7,NULL,'Leia','Vachon','leia.vachon@townsquaremedia.com','$2y$10$T5gCpoD4TxTkvABsenSNu.fgmJAO8cFrPy4/d7epPUK1P6MUHJYCq','(980) 253-9510',NULL,NULL,NULL,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',2626),
	(8,NULL,'Aksel','Gulukyan','aksel.gulukyan@townsquaremedia.com','$2y$10$ESrKCOqD9rydxt.PpKgXhuzmYQd8oTgwNnlk.zuwwRAtsqCvroKf2','(718) 344-9943',NULL,NULL,NULL,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',11117),
	(9,'V07291','Ammar','Ayube','ammar.ayube@townsquaremedia.com','$2y$10$hNSxZ5zPMZ8PapBCVcBW/uQJgzrNI4K7QJxWcRDJntWTf8D8aESUe',NULL,NULL,'5107',6,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',NULL),
	(10,'C07148','Heather','Barb','heather.barb@townsquaremedia.com','$2y$10$hmbXP.YSpwjrisuw31IGw.qBC5IcOYzi2iYWk3lb.y8F/z/sIQLRe',NULL,NULL,'5121',5,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',NULL),
	(11,'M06828','Adam','Barbee','adam.barbee@townsquaremedia.com','$2y$10$Poh6MIjYk9reoylXKWUkfOGTcDFbw6bKuHac0oODL4VB2ZxDTWDTK',NULL,NULL,NULL,7,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',9256),
	(12,'M07212','Wayne','Bass','wayne.bass@townsquaremedia.com','$2y$10$aPFdbqQaxhTxKFw2YW2ekeb9Fks5PTQWahlDngeHRAaTXymzOBqZa',NULL,NULL,'5119',7,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',11263),
	(13,'C07131','Jaricka','Berger','jaricka.berger@townsquaremedia.com','$2y$10$AKtYdYRCKTlqZRyOLlp9ju3qrD1nqFKyk71h1KnaNJwTeseolNKle',NULL,NULL,NULL,5,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',10741),
	(14,'F07421','Ross','Blackstock','ross.blackstock@townsquaremedia.com','$2y$10$sGvH5v/75na2KdvJpP/o8OUuLnzOA3Pkcx3AAzCsgRlWcptQnkUtu',NULL,NULL,'5093',6,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',NULL),
	(15,'J06585','Skyela','Campbell','skyela.campbell@townsquaremedia.com','$2y$10$.gNDT0rOm31pJ237ov6NP.QP2ssg6nSRUNGh6YmHipZ8NNbpiHB5C',NULL,NULL,'5123',7,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',7771),
	(16,'U07122','Jordan','Christoff','jordan.christoff@townsquaremedia.com','$2y$10$V.cKj8CR3d2lWPyRwFGE9uzxDDM.nF56Q9R70hN.TAumUmdPFjULi',NULL,NULL,'5023',5,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',10740),
	(17,'K06850','Garrett','Clark','garrett.clark@townsquaremedia.com','$2y$10$45PME9n4CHSmkuPGEI7MleAMmAkLf5xvG32fE1aktX6.yE4aQaFdq',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',9258),
	(18,'L07235','Heather','Clark','heather.clark@townsquaremedia.com','$2y$10$/q/chMLyupU4WYObhUz1TuAH8TOdIAkMqcZQSkKBYmxk5SMPRjJWG',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',NULL),
	(19,'Z07343','Jess','Cocchiara','jess.cocchiara@townsquaremedia.com','$2y$10$uO0L.7L94f4qZPC9r52EVegIAkLtcefv78i.8LG4TM9tlhINSy/9.',NULL,NULL,'5010',7,NULL,'2016-05-01 17:31:20','2016-05-01 17:31:20','active',NULL),
	(20,'E04756','Ryan','Daly','ryan.daly@townsquaremedia.com','$2y$10$TIX6aHhe.LmGIUs2UmpytuGnz3Ii4i9uFAeUWXsXZU05ohYNqbU.e',NULL,NULL,'5066',5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',2522),
	(21,'L07427','Mike','DeLaCruz','mike.delacruz@townsquaremedia.com','$2y$10$TWBpRbui/TI25A4xd0GXde4XQ7TEBpEsDEpJlBSBdTqrsnQ4vx89y',NULL,NULL,'5112',5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(22,'G06486','Mark','De Sessa','mark.de sessa@townsquaremedia.com','$2y$10$hX.Q.7g41O13ianjWaPrHuqdkY..nnicfy8/PMvkJ6u4ZQTfk2E.i',NULL,NULL,NULL,5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(23,'J07425','Kaleigh','Earle','kaleigh.earle@townsquaremedia.com','$2y$10$neFEI5zQDS0krZmDHx4DYOyM6bQyYcVHBSYJjc937Uyf6EknCXsnS',NULL,NULL,'5087',7,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(24,'A06768','Sheryl','Fleming','sheryl.fleming@townsquaremedia.com','$2y$10$8604ZMCjq1iYmtwREzBZZu1pq5jQomomOh4UP2DrLngHG0H6WB9xi',NULL,NULL,'5133',7,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',8659),
	(25,'I06944','Kristin','Geppert','kristin.geppert@townsquaremedia.com','$2y$10$2Jw0PqiXEGwqHnUZR2Wmi.mYbuSN9WEhFja43ZVGNACTMGov0nR5y',NULL,NULL,'5083',5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',9744),
	(26,'D07347','Erika','Guerrero','erika.guerrero@townsquaremedia.com','$2y$10$EtgIEXGJYeyXHmVAWqmqkuyPMzH2YIV1LegyIliTkA3zfqWcieMR6',NULL,NULL,'5098',5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(27,'X05349','Alex','Hagen','alex.hagen@townsquaremedia.com','$2y$10$bDhNniGsRwfdyBa7nNYhn.qH6XW4z7tovFQD9VwuSFoxObzcKWrtu',NULL,NULL,NULL,7,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',4373),
	(28,'T07385','William','Judd','william.judd@townsquaremedia.com','$2y$10$ej87ZOT1nKTHk7pK12yWHuwHQQohW1ZYOEd0hhlTbEwDb771jGkFK',NULL,NULL,'5101',7,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(29,'A05448','Vladimir','Males','vladimir.males@townsquaremedia.com','$2y$10$UMgSupRJ//2nWnINGJxuYe7ARofWBszX6OSywFASzc3xXzBg92JwO',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',5010),
	(30,'P07262','Shawn','Mitcham','shawn.mitcham@townsquaremedia.com','$2y$10$/9EdHqN7yan9TS4D8l1Ce.ZT1WvRlSVG6zGdEpBtFSTC4swiNvV76',NULL,NULL,'5014',5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(31,'G06294','Lesley','Mitchell','lesley.mitchell@townsquaremedia.com','$2y$10$AuCR4uWj9NvTWYkqrGQxSuX8Oszk7ifFYUTaCzwrQaRXlXMRJy9Ke',NULL,NULL,'5111',7,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',6109),
	(32,'R07023','Michael','Moran','michael.moran@townsquaremedia.com','$2y$10$TXmKRHYhMv7vssM71fn2.erqH5XjL7ygY1.ha6sbC75V9JSZoOEUq',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',10224),
	(33,'E07300','Thomas','Muratore','thomas.muratore@townsquaremedia.com','$2y$10$POmW0JK3.I0URKU54SDFLukp1.D.kTRKrTYIw5p5fFGEC/7V4K2KS',NULL,NULL,'5127',5,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(34,'B06817','Jake','Nager','jake.nager@townsquaremedia.com','$2y$10$rUN6dt0Ugf6xCJQhIjbWf.U2DcWx4tWeV06cJffSUIg31vC2IXrnO',NULL,NULL,NULL,7,NULL,'2016-05-01 17:31:21','2016-05-01 17:31:21','active',NULL),
	(35,'B07297','Jericha','Nichols','jericha.nichols@townsquaremedia.com','$2y$10$6MNxnu.zW8NhqGqglH3x9OOrW77W6VXbrbKex58Qi6CoLJsyAYCDO',NULL,NULL,'5047',7,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(36,'N06181','Eric','Ormsbee','eric.ormsbee@townsquaremedia.com','$2y$10$A4ynybyptu2UkWP4mFoiVOiTc3wC7nYs5W8RtR9tPU88tpEMOgS..',NULL,NULL,'5107',6,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',5571),
	(37,'B07345','Philip','Perry','philip.perry@townsquaremedia.com','$2y$10$Y/Uo6niOoGx1P2QKUy.U9OFicW7UMY38D3jP91Xl87YazLfjYOHDG',NULL,NULL,NULL,5,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(38,'L07379','Lauren','Pierce','lauren.pierce@townsquaremedia.com','$2y$10$jSD8ucOIQRHTqjqHZw5mLu42d4bryvkkZuiiQv7NCzaIF5MgHkisK',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(39,'C07346','Dan','Plunkett','dan.plunkett@townsquaremedia.com','$2y$10$2q0RCc2z0wrq3ufMQKxCWuWIY7Xh9PizINyoI8FLiWmsMiWNgQXby',NULL,NULL,'5024',6,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(40,'P07022','Sean','Ryan','sean.ryan@townsquaremedia.com','$2y$10$kdvmkNdoy1lDllHhO16MZuqLpe8hNj7ZNRB/TzO9rHdXjU2TSM6fC',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',9971),
	(41,'V07219','Lindsey','Schievink','lindsey.schievink@townsquaremedia.com','$2y$10$hz/Hn6A8m32unPviakS7QOFziUhqmRPyINYXDbv.RzjhaAcnsomzS',NULL,NULL,'5136',7,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',11262),
	(42,'M06852','Ashley','Todd','ashley.todd@townsquaremedia.com','$2y$10$ID1FlhFqSPuV9GIqQPh0Kuia/9fCLZgdXOt9pK80PiUIM7m5C12hi',NULL,NULL,NULL,5,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',9254),
	(43,'V07267','Chris','Tran','chris.tran@townsquaremedia.com','$2y$10$PuoAuwfweQNXLa6Fcoxk7e/uYcan80j05KoYHUGInQh4pzOxynQDm',NULL,NULL,NULL,7,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(44,'F07301','Jay','Tremmel','jay.tremmel@townsquaremedia.com','$2y$10$mQCvk9R/DvvBoz83J6eMc.g8xLp2Z8TKtLCLPGF7R5Hp6TfmYstu2',NULL,NULL,'5099',7,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(45,'H05407','Joey','Vachon','joey.vachon@townsquaremedia.com','$2y$10$LGIBxoEN8srn7T37ngtnVemsbnpao77ccuCYRUQoQuPZ0BDX6DhJO',NULL,NULL,'5067',6,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',4628),
	(46,'Y07030','Meredith','Walsh','meredith.walsh@townsquaremedia.com','$2y$10$5uqm5Td5wWfrE56AODs4S.jTjHOSnhlUjwJM9l4bgOZSOBKw6q6/W',NULL,NULL,NULL,5,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',10226),
	(47,'U07290','Matt','Whiteside','matt.whiteside@townsquaremedia.com','$2y$10$.4KPUyBBVuVVi3.woW6Y/O1Fp./4.yWD7CNdDtPo7YLlwnx9MVmE6',NULL,NULL,NULL,6,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',NULL),
	(48,'B06769','Rebeca','Anderson','rebeca.anderson@townsquaremedia.com','$2y$10$HRcsC1DUWzCrhBoliV/hYeaUGRDDxa9tJo85JBybrSsCZoLN1MQiq','(810) 577-1155',NULL,NULL,2,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',8656),
	(49,'C05114','Jason','Bailey','jason.bailey@townsquaremedia.com','$2y$10$1YFasxUFiDufDNnsybIKROuTpvOmEzgk.5DSXhuJTxuPPODUw59ua','(903) 521-6398',NULL,NULL,8,NULL,'2016-05-01 17:31:22','2016-05-01 17:31:22','active',3310),
	(50,'U07026','Michelle','Batchelor','michelle.batchelor@townsquaremedia.com','$2y$10$kPfCkzwxYW6b5CrQrQJ/guoaMXMAHUCq8203MBSpU.BopAV97ueuS','(517) 927-0894',NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',10229),
	(51,'N07213','Calla','Boley','calla.boley@townsquaremedia.com','$2y$10$P.bQpGRBkU8gjyIniULpDe5NttQqElEuQJDfrg6z9H2AJ8BkcgNR6','(309) 429-0851',NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',11255),
	(52,'S07216','Irene','Cordova','irene.cordova@townsquaremedia.com','$2y$10$ujnBtjO/v96s/InQh4A.mujAlkfp1OqmUgWMwbQ5g2oD.3Nw4uQcy','(915) 242-3111',NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',11256),
	(53,'N06853','Leah','Dixon','leah.dixon@townsquaremedia.com','$2y$10$UYwicr3pnCPKvR/mVzz98OP4OZJpT6Dh.uWINMPmMv6v6iBWlof5S','(815) 275-2358',NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',9253),
	(54,'J07401','Janet','Fermo','janet.fermo@townsquaremedia.com','$2y$10$tNUVNIKNh4pu7Dosuz.HEO2Rjm4PCCxBRUPLPcdogqnqfEni1NFL2',NULL,NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',NULL),
	(55,NULL,'Tara','Gelsomino','tara.gelsomino@townsquaremedia.com','$2y$10$UnnognEkT7./ad763KlVM.lNCClbJp8T2moh8080TGKGP9GlMneIm',NULL,NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',NULL),
	(56,'M06972','Janette','Hammond','janette.hammond@townsquaremedia.com','$2y$10$4PUWuBs2Ovh5.h8VLo8Zl.Z8j2dFrJMW5x3wfXG3Kok1RNCMAEZNe','(518) 688-5868',NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',9742),
	(57,'M06516','Angie','Hauser','angie.hauser@townsquaremedia.com','$2y$10$n740TDzKE2uqhWBuZu5Ynu830K.7iVQFNugOhM0Fq8McNtB92SweW','(970) 219-7506',NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',7281),
	(58,'J06969','Chad','Hobot','chad.hobot@townsquaremedia.com','$2y$10$SiggwyYU7I7VZGVYIAlJNuwNULGfpGR5tGXoP3eYd8U55pkbLp4FG','(763) 244-4058',NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',9749),
	(59,'P07214','Thom','Jennings','thom.jennings@townsquaremedia.com','$2y$10$ya0OZ0JFYx7IF1Eu0suL6u1X0KgCceQLidLxw/5R/eUOlO42x6sYi','(716) 255-1454',NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',11259),
	(60,'N06949','Nicole','Kearney','nicole.kearney@townsquaremedia.com','$2y$10$g4NGOaGL/jSqbOnGpNN4mefnSqlfr0m.HVZbroCzQeOpAWANeCp8m','(848) 333-4867',NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',9736),
	(61,'R07407','Ryan','London','ryan.london@townsquaremedia.com','$2y$10$RGBRtW8T1PVNyoX5MtLNCuZBVxTHijS3HIUBsrt4YdznYw2HOV5s2',NULL,NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',NULL),
	(62,'H06679','Patrick','McShea','patrick.mcshea@townsquaremedia.com','$2y$10$XA/sxkQWsnOd7F1TLQ3TmeMmLPSYUaLYfA2WIcXNbXYWoTohWxdiC','(217) 853-5410',NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',8256),
	(63,'A07032','Mallory','Maxwell','mallory.maxwell@townsquaremedia.com','$2y$10$N2VkqkqX9AW1Avl63MG0eOVbKXNK2IKMsJGXFh3rAfn97.IA/TI1.','(806) 543-7656',NULL,NULL,8,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',10231),
	(64,'T07217','Jillian','May','jillian.may@townsquaremedia.com','$2y$10$58Ek2SSJX7dhKX9Oy8oTU.WJ57ZY.weZye.pwwKjWzXwBEL6ddniO','(616) 366-1437',NULL,NULL,2,NULL,'2016-05-01 17:31:23','2016-05-01 17:31:23','active',NULL),
	(65,'J06105','Casey','Miller','casey.miller@townsquaremedia.com','$2y$10$hHrgAie5/5MNAuqKDbYLpeiifRsq.wYKg85wcPRwiVwwc0euy/4NK','(337) 278-0913',NULL,NULL,2,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',5247),
	(66,'R07215','Ashley','Olson','ashley.olson@townsquaremedia.com','$2y$10$YlkhgLe.DAmvPriXtW2lY.8ccY.V4Vg51FDI2U.MPXVHEAqVcr7rS','(856) 261-4885',NULL,NULL,2,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',11260),
	(67,'P06950','Chasity','Reach','chasity.reach@townsquaremedia.com','$2y$10$s2RhOYIem2dfv//0Hg9a0.aDKoPCt1bj7uK5WECTiAhrXCi.ML.Im','(205) 283-3032',NULL,NULL,2,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',9735),
	(68,'M07308','Mackenzie','Schutter','mackenzie.schutter@townsquaremedia.com','$2y$10$.umcjBLIuWMTKMGZVJ1tre1sPryWmp/ZgZbZRu2kLpcfil8FoDT52','(269) 599-3633',NULL,NULL,8,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',NULL),
	(69,'M06948','John','Tellier','john.tellier@townsquaremedia.com','$2y$10$cFuyLaX6XS1I8Ou51fzuTuE9KtPznk9esl.uFkeT3BvDm5NqwSLei','(603) 828-9950',NULL,NULL,8,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',9738),
	(70,'H05143','Lisa','Thomas','lisa.thomas@townsquaremedia.com','$2y$10$YYkYVwYs.noZ4J2ws9NileX3qaqBHpQo/CAImjbNdUdv8x1V0M8/e','(401) 241-9914',NULL,NULL,8,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',3559),
	(71,'U07218','Shane','Tolman','shane.tolman@townsquaremedia.com','$2y$10$tt0PmZv1PqyIZNC.xerSZ.JtXMX/cIf1S0R47mgPhSw.dnDnhi8EW','(208) 954-3291',NULL,NULL,2,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',11257),
	(72,'V06859','Joe','Waldowski','joe.waldowski@townsquaremedia.com','$2y$10$VNZ6H7L3h4Bckea0AYzz2ubrMaIyVrEvxooPq78ICRiO3Bk4t7TaC','(607) 725-8420',NULL,NULL,8,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',9252),
	(73,'D07299','Larry','Walsh','larry.walsh@townsquaremedia.com','$2y$10$Y4.exYiv25eyMY8b8LzHK.4Axp2iBjUR6kl96KrjNYlXB38NkWzvO','(802) 440-2865',NULL,NULL,8,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',NULL),
	(74,'J06945','Andrew','Woolford','andrew.woolford@townsquaremedia.com','$2y$10$c.KO/zKawZzz6rxSU8mi9ulQ5ovtIh3th97H6o1J2VRXiPKZXothS','(207) 219-9927',NULL,NULL,8,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',9741),
	(75,'M06108','Alex','Zundel','alex.zundel@townsquaremedia.com','$2y$10$4fA3TX1bS0MhXU6bz3LokuyCAiuRWEoFcN.G3IVWEs.eTwaGgMk/K','(406) 220-0230',NULL,NULL,NULL,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',5246),
	(76,'K06202','David','Callahan','david.callahan@townsquaremedia.com','$2y$10$rXm46eo64kvIPwzwjNAHA.b2RwfAJiyxyotaN0lb000nDgOQWO1Hi','(856) 816-7981','(704) 665-0611',NULL,1,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',1781),
	(77,'K05098','May','Ly','may.ly@townsquaremedia.com','$2y$10$LdCcpm2ZWdTJ7RextkYJg.l6y0eCkbJx5yEFnn2q0/a2obp41J8G.','(704) 578-5968','(704) 665-0611','5077',1,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',3309),
	(78,'E06100','Marc','Notaro','marc.notaro@townsquaremedia.com','$2y$10$OhL.m4jj8orW2ohbx/xHq.h01IKBmqRHB4EpmkSAMa5G8NK8EF0Gy','(716) 449-1997',NULL,NULL,1,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',5248),
	(79,'W06692','Sara','Ryan','sara.ryan@townsquaremedia.com','$2y$10$o2QqUQHDWQIiDkTKwYoHnue8IQqW1VPhzx2WW.wsuJ2AjuOaN5Ja.',NULL,'(704) 469-4150','5128',NULL,NULL,'2016-05-01 17:31:24','2016-05-01 17:31:24','active',8258),
	(80,'X06693','Katrina','Smith','katrina.smith@townsquaremedia.com','$2y$10$tqedG1h9VmengO2Vz.XZDO0zGmBRStBn2ZkLgvMZy5KCktt.m2Eq2',NULL,'(704) 469-4128','5016',NULL,NULL,'2016-05-01 17:31:25','2016-05-01 17:31:25','active',8259);

/*!40000 ALTER TABLE `ap_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ap_users_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_users_permissions`;

CREATE TABLE `ap_users_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `access` enum('grant','deny') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_permissions_user_id_foreign` (`user_id`),
  KEY `users_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ap_permissions` (`id`),
  CONSTRAINT `users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ap_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table ap_users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_users_roles`;

CREATE TABLE `ap_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_roles_user_id_foreign` (`user_id`),
  KEY `users_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ap_roles` (`id`),
  CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ap_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_users_roles` WRITE;
/*!40000 ALTER TABLE `ap_users_roles` DISABLE KEYS */;

INSERT INTO `ap_users_roles` (`id`, `user_id`, `role_id`)
VALUES
	(1,1,14),
	(2,2,14),
	(3,3,14),
	(4,4,14),
	(5,5,14),
	(6,6,14),
	(7,7,14),
	(8,8,14),
	(9,9,12),
	(10,10,12),
	(11,11,12),
	(12,12,12),
	(13,13,12),
	(14,14,12),
	(15,15,12),
	(16,16,12),
	(17,17,12),
	(18,18,12),
	(19,19,12),
	(20,20,12),
	(21,21,12),
	(22,22,12),
	(23,23,12),
	(24,24,12),
	(25,25,12),
	(26,26,12),
	(27,27,12),
	(28,28,12),
	(29,29,12),
	(30,30,12),
	(31,31,12),
	(32,32,12),
	(33,33,12),
	(34,34,12),
	(35,35,12),
	(36,36,12),
	(37,37,12),
	(38,38,12),
	(39,39,12),
	(40,40,12),
	(41,41,12),
	(42,42,12),
	(43,43,12),
	(44,44,12),
	(45,45,12),
	(46,46,12),
	(47,47,12),
	(48,48,12),
	(49,49,12),
	(50,50,12),
	(51,51,12),
	(52,52,12),
	(53,53,12),
	(54,54,12),
	(55,55,12),
	(56,56,12),
	(57,57,12),
	(58,58,12),
	(59,59,12),
	(60,60,12),
	(61,61,12),
	(62,62,12),
	(63,63,12),
	(64,64,12),
	(65,65,12),
	(66,66,12),
	(67,67,12),
	(68,68,12),
	(69,69,12),
	(70,70,12),
	(71,71,12),
	(72,72,12),
	(73,73,12),
	(74,74,12),
	(75,75,12),
	(76,76,12),
	(77,77,12),
	(78,78,12),
	(79,79,12),
	(80,80,12);

/*!40000 ALTER TABLE `ap_users_roles` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
