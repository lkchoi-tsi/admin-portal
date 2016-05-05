# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.12)
# Database: townsquare
# Generation Time: 2016-04-22 23:30:33 +0000
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
	('2016_04_20_142622_create_roles_table',1),
	('2016_04_20_143002_create_permissions_table',1),
	('2016_04_20_143301_create_permissions_roles_table',1);

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


# Dump of table ap_permissions_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ap_permissions_roles`;

CREATE TABLE `ap_permissions_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `access` enum('grant','deny') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'grant',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `permissions_roles_role_id_foreign` (`role_id`),
  KEY `permissions_roles_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permissions_roles_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ap_permissions` (`id`),
  CONSTRAINT `permissions_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ap_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_permissions_roles` WRITE;
/*!40000 ALTER TABLE `ap_permissions_roles` DISABLE KEYS */;

INSERT INTO `ap_permissions_roles` (`id`, `role_id`, `permission_id`, `access`, `enabled`, `hidden`)
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

/*!40000 ALTER TABLE `ap_permissions_roles` ENABLE KEYS */;
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
	(18,'reserved','Reserved',0,0);

/*!40000 ALTER TABLE `ap_roles` ENABLE KEYS */;
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
	(1,'$8K-47\'s',1,'Training Events','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(2,'Street Fighters',2,'OSS','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(3,'Director of Sales',3,'','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(4,'El Presidente',4,'','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(5,'American Gongsters',5,'ISS','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(6,'Dead President\'s Club',6,'ISS','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(7,'Moneybadgers',7,'ISS','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL),
	(8,'Ball So Hard University',8,'OSS','2016-04-20 16:10:22','2016-04-20 16:10:22',NULL);

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
  PRIMARY KEY (`id`),
  KEY `users_manager_id_foreign` (`manager_id`),
  CONSTRAINT `users_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `ap_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `ap_users` WRITE;
/*!40000 ALTER TABLE `ap_users` DISABLE KEYS */;

INSERT INTO `ap_users` (`id`, `employee_id`, `first_name`, `last_name`, `email`, `password`, `cell_phone`, `work_phone`, `extension`, `manager_id`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Todd','Krovitz','todd.krovitz@townsquaremedia.com','$2y$10$vqyKZB9sHPZ5YJ3d6KO6nOpZjmKsMETFPCuqs8sCM28PUneZbNPj2','(980) 475-2847','(704) 469-4123',NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(2,NULL,'Ryan','Misenar','ryan.misenar@townsquaremedia.com','$2y$10$EhkOfoSQX9MAa1.FkFyHdeDw/XV7DU5V9VGsJVSbvMeMNyh1ipMgG','(360)-601-6832','(360) 601-6832',NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(3,NULL,'Josh','Pate','josh.pate@townsquaremedia.com','$2y$10$yigJnU.sANZRlPrHEV/pV.qlAl1x1OxY/Gg4Cq2s1RiwO9S5M/mju','(980) 475-1818','(704) 469-4130',NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(4,NULL,'Tim','Pirrone','tim.pirrone@townsquaremedia.com','$2y$10$shE4fU3FEaxB9Pc6RWkY6uGmeHv0kU/0caFu3.6MN/dBIOk1HiBJ2','(980) 475-0962','(704) 469-4115',NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(5,NULL,'Nick','Rico','nick.rico@townsquaremedia.com','$2y$10$Hy3J4qWsVyrU01yBy441F.P8DyNeIIxFhQe5wTYJhWNHisSCs7zAC','(480) 650-3562','(704) 469-4137',NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(6,NULL,'Brian','Dickerson','brian.dickerson@townsquaremedia.com','$2y$10$RBfpylMkQmkl21sARBTdmeBfstAeidlj9VVDWKgdkIgZOEU.LKkEK','(757) 705-0447',NULL,NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(7,'','Leia','Vachon','leia.vachon@townsquaremedia.com','$2y$10$f/kyGfs7cOennOdnrna3BewgQp3S8dkhNHtnyiFGvYY5Am35XFho.','(980) 253-9510',NULL,NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-22 18:30:57'),
	(8,NULL,'Aksel','Gulukyan','aksel.gulukyan@townsquaremedia.com','$2y$10$GtUm9hVfCZPKoJoeq70d6uLgyKhDA3ywB.zBVIolPbR8rm6U/G7eu','(718) 344-9943',NULL,NULL,NULL,NULL,'2016-04-20 16:10:17','2016-04-20 16:10:17'),
	(9,'V07291','Ammar','Ayube','ammar.ayube@townsquaremedia.com','$2y$10$VtZfp3owPsLdTu/LL4QktexjtcZRZpSrBp6zNFl6r3yTFhzBG1zPG',NULL,NULL,'5107',6,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(10,'C07148','Heather','Barb','heather.barb@townsquaremedia.com','$2y$10$2Bjefw3dZ28LGan935CDyeom8SW8sTLkx9WnHWl9jET9kI/y9YHfC',NULL,NULL,'5121',5,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(11,'M06828','Adam','Barbee','adam.barbee@townsquaremedia.com','$2y$10$VTcsgcbKRKpom74jDiuDkuG0p2553XCiIh1NQnszQrUgf5Mt8Nvcy',NULL,NULL,NULL,7,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(12,'M07212','Wayne','Bass','wayne.bass@townsquaremedia.com','$2y$10$CqLg9P7ZODtEzBinHojdaeojKZIif/.6502I4iuYs70GASXAIyQgq',NULL,NULL,'5119',7,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(13,'C07131','Jaricka','Berger','jaricka.berger@townsquaremedia.com','$2y$10$BPytyBEkQ/PAtSRvacwXEuN3FxMflzjRiTUbUxBl2KqT7KIHo4WBK',NULL,NULL,NULL,5,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(14,'F07421','Ross','Blackstock','ross.blackstock@townsquaremedia.com','$2y$10$v8euLyU/s8aVVJPLpeVhae7TUr04SU/lHMNoJOauHMxHMaZCjjiXu',NULL,NULL,'5093',6,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(15,'J06585','Skyela','Campbell','skyela.campbell@townsquaremedia.com','$2y$10$4sySBqq5FAvCa5ZQPYnB/OSH1Lip39qnWI0H8kAg0tJLHhfQob1N2',NULL,NULL,'5123',7,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(16,'U07122','Jordan','Christoff','jordan.christoff@townsquaremedia.com','$2y$10$juTVEJRooHyxUptlP.Q7AO16xHbwFEj8tQ7w4vEcaHxdAk8PQqj/G',NULL,NULL,'5023',5,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(17,'K06850','Garrett','Clark','garrett.clark@townsquaremedia.com','$2y$10$G8IUQy.d0iPtaUDOwO4CluO7a0uNmbUbQPfk9CapjuGrCyYcJEf1S',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(18,'L07235','Heather','Clark','heather.clark@townsquaremedia.com','$2y$10$WD0Y1ukxhLSfKAttj1e8vuavq/1hZDfogsNIFyCikZXjZh.au1k5.',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(19,'Z07343','Jess','Cocchiara','jess.cocchiara@townsquaremedia.com','$2y$10$PMla2fRzYtU2eWdu88bPbuGBgTnW7Mn9745TGYuuEiSG.QnCYTHjy',NULL,NULL,'5010',7,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(20,'E04756','Ryan','Daly','ryan.daly@townsquaremedia.com','$2y$10$TN/84LLtq63MVC3.h.pvB.rCwSghGm3MzJRLhs3wNclvxTy7UUrO6',NULL,NULL,'5066',5,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(21,'L07427','Mike','DeLaCruz','mike.delacruz@townsquaremedia.com','$2y$10$4jsHck9TOiIip24R86nV9.d/7JQ.gsyNdHxhLgYA5SurOIfkkOeNK',NULL,NULL,'5112',5,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(22,'G06486','Mark','De Sessa','mark.de sessa@townsquaremedia.com','$2y$10$2Uj5nhCft9fkVD1q.dVpP.229tNx5AmZjiLvOPDbds.KnqUVd4bIC',NULL,NULL,NULL,5,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(23,'J07425','Kaleigh','Earle','kaleigh.earle@townsquaremedia.com','$2y$10$kkccluJvc05RAOq3iVS4zeblCSmfQ1enw32d5EB2YQaHOM2FijiC6',NULL,NULL,'5087',7,NULL,'2016-04-20 16:10:18','2016-04-20 16:10:18'),
	(24,'A06768','Sheryl','Fleming','sheryl.fleming@townsquaremedia.com','$2y$10$wcfF6gOH8aai8JLWUzQOAusUS.H4dYRC62EjmHfuDw1bzLt7xIgze',NULL,NULL,'5133',7,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(25,'I06944','Kristin','Geppert','kristin.geppert@townsquaremedia.com','$2y$10$LZm37v0pUuuEcXvAqJhHYOEwiIPO2NNmOye91EzypW1rx/X5cZAGu',NULL,NULL,'5083',5,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(26,'D07347','Erika','Guerrero','erika.guerrero@townsquaremedia.com','$2y$10$PDJdsDKpAOB6GMbkoBseqOte1EwTd/6cKhT528pERRVcAzilUcSvG',NULL,NULL,'5098',5,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(27,'X05349','Alex','Hagen','alex.hagen@townsquaremedia.com','$2y$10$dWowCckFFLAy/yCCJds12e0y4vJIPPuag9SvQXXXDhOk9dMISIHsy',NULL,NULL,NULL,7,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(28,'T07385','William','Judd','william.judd@townsquaremedia.com','$2y$10$FFB5oCsyH1BbOHGrqS8P3uej0CQ9Cjvrky5bmGL21xE82Pb0c5twm',NULL,NULL,'5101',7,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(29,'A05448','Vladimir','Males','vladimir.males@townsquaremedia.com','$2y$10$JBz1I1b2HAKHDsHmfzAU4ufJ.OxQf3.FP/7Wr7Bv2fkORFnup5hxK',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(30,'P07262','Shawn','Mitcham','shawn.mitcham@townsquaremedia.com','$2y$10$mAjR6GsVx2uKCqWAeUu4YOA/WgPHvZLZhukQglWpXDOgvzT/IqRle',NULL,NULL,'5014',5,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(31,'G06294','Lesley','Mitchell','lesley.mitchell@townsquaremedia.com','$2y$10$yplXAXmf6C9/i8FzfCTDWuPWhcLP7nOhnp.A8NAVWNhlLSbtfw9.S',NULL,NULL,'5111',7,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(32,'R07023','Michael','Moran','michael.moran@townsquaremedia.com','$2y$10$DgJJ1UEZzjRo03Sez1MU9uU2VAQVqNQct7o18hAHNR/uUAvDYAf.2',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(33,'E07300','Thomas','Muratore','thomas.muratore@townsquaremedia.com','$2y$10$ZKR4Tyh3TiJqDgU2rV52.uPRqwq/X0EBgUcOm1abtWPuJMXpCKYsO',NULL,NULL,'5127',5,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(34,'B06817','Jake','Nager','jake.nager@townsquaremedia.com','$2y$10$SKyYbyH8g.tRBmuhN8GkmORDgC9.0TITlNF4Az7VWQPEyhdMXPxNe',NULL,NULL,NULL,7,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(35,'B07297','Jericha','Nichols','jericha.nichols@townsquaremedia.com','$2y$10$8XJ2aAyyeOj7OVltrff2w.sp7TftiLdl.2gN1.CNrOvBefDgZo8VO',NULL,NULL,'5047',7,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(36,'N06181','Eric','Ormsbee','eric.ormsbee@townsquaremedia.com','$2y$10$sIcAEB5pB6iicoVjNg4I3eKYUugUEwdLggQ2YIJPNbVfmrN2.OGey',NULL,NULL,'5107',6,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(37,'B07345','Philip','Perry','philip.perry@townsquaremedia.com','$2y$10$HGg.wAIhL36R7fNnXej5Q.V.O0smsI9.L3416Fm9xQgIkg1.VHKBm',NULL,NULL,NULL,5,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(38,'L07379','Lauren','Pierce','lauren.pierce@townsquaremedia.com','$2y$10$ClaMeAM379yi2FpJVzl.Jee8wVeXsrh8fYWjNbvEEeoPRj5qO0E.a',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:19','2016-04-20 16:10:19'),
	(39,'C07346','Dan','Plunkett','dan.plunkett@townsquaremedia.com','$2y$10$zGlHqLk0COE0YTpPUoYKO.qVOyOiYWnbmYD/VvhWBHvkfsVrcyUcm',NULL,NULL,'5024',6,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(40,'P07022','Sean','Ryan','sean.ryan@townsquaremedia.com','$2y$10$.8i9SvLd9.4RdMvNSSATJOHN/dbDteyaW2sgLsXTNy9ZZAgvegFba',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(41,'V07219','Lindsey','Schievink','lindsey.schievink@townsquaremedia.com','$2y$10$TVFDStN8GqGYwgenx4lNPuQqeSRM3WGj7oGmtdgmECY3LjSn13BI2',NULL,NULL,'5136',7,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(42,'M06852','Ashley','Todd','ashley.todd@townsquaremedia.com','$2y$10$3r1Gw4.7zVJQAYDmtaf75OKs4lTTmM5FGANHV.UHYw1jP7K3h9jMG',NULL,NULL,NULL,5,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(43,'V07267','Chris','Tran','chris.tran@townsquaremedia.com','$2y$10$Bphm5/GzzVsKD1g1kbpQ5.mgrwPRSD4TTlE1E4zjbTJS/FG85g1PC',NULL,NULL,NULL,7,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(44,'F07301','Jay','Tremmel','jay.tremmel@townsquaremedia.com','$2y$10$NHKibJyRd8PhuLEzykkiEuDFixbvkGJkvetFVHmufAFUMmi3GxOgK',NULL,NULL,'5099',7,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(45,'H05407','Joey','Vachon','joey.vachon@townsquaremedia.com','$2y$10$eoTm.gaOdjbKHGz5NiY.Eu8Ri9GnsXmq/5HMSiTqk2k2tFkyFNtsu',NULL,NULL,'5067',6,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(46,'Y07030','Meredith','Walsh','meredith.walsh@townsquaremedia.com','$2y$10$q5YaEL/hqm0rQKtswkBxuedylQjtHM.UWKHtReyeHty38ZQgwVWBG',NULL,NULL,NULL,5,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(47,'U07290','Matt','Whiteside','matt.whiteside@townsquaremedia.com','$2y$10$qmtpNsWuy3ecpLIZWv2W8ur3t.ZrSBgC7vyrbkt1DSMQqqqOhQVvW',NULL,NULL,NULL,6,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(48,'B06769','Rebeca','Anderson','rebeca.anderson@townsquaremedia.com','$2y$10$tbeERpVVFcVY7t8wIDJmPeWg7K7ABnq42mgzZ1gkCHQfPFjyDvRbu','(810) 577-1155',NULL,NULL,2,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(49,'C05114','Jason','Bailey','jason.bailey@townsquaremedia.com','$2y$10$mjG6MhVx4Vn8cysxRujMw.7cjKYIWqu1xah5lOtTl5K.S29UU/F52','(903) 521-6398',NULL,NULL,8,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(50,'U07026','Michelle','Batchelor','michelle.batchelor@townsquaremedia.com','$2y$10$/t80/NWN/Re3tGKTtbM85.mCjZCnQ/hlcpK6yrIfQWKcqgKi4e1mu','(517) 927-0894',NULL,NULL,2,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(51,'N07213','Calla','Boley','calla.boley@townsquaremedia.com','$2y$10$VSoppp.MizSDOwkF4qbAD.3.gL0xOzqM4/L4uY8NOmAtwkYHd0nKe','(309) 429-0851',NULL,NULL,8,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(52,'S07216','Irene','Cordova','irene.cordova@townsquaremedia.com','$2y$10$077raz4RIRIjMnVDs0/zpu.T6ROKN23QmDSPUvpY5XhpEm//Ba2Q2','(915) 242-3111',NULL,NULL,8,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(53,'N06853','Leah','Dixon','leah.dixon@townsquaremedia.com','$2y$10$dSsPBbq4VhY.3tZ73i4IVeam8MyQtEmcG3u9yvHF7eQfiqlwqAJda','(815) 275-2358',NULL,NULL,8,NULL,'2016-04-20 16:10:20','2016-04-20 16:10:20'),
	(54,'J07401','Janet','Fermo','janet.fermo@townsquaremedia.com','$2y$10$hp7Oon7wv5Yqtv25TgQaR.XbSGhTtBE8eh04WqgAFA1D5Na9MxHUG',NULL,NULL,NULL,8,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(55,NULL,'Tara','Gelsomino','tara.gelsomino@townsquaremedia.com','$2y$10$uC1K7VoiC8DQrCcC/TQypu0ObP/abp5NDceBjOu/RVDjN02O9.oc2',NULL,NULL,NULL,8,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(56,'M06972','Janette','Hammond','janette.hammond@townsquaremedia.com','$2y$10$RZj4Xb4HWHxS6BwrcfYgkORsiJHlcApb8Cpvx4BljbayofPvgQDUK','(518) 688-5868',NULL,NULL,8,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(57,'M06516','Angie','Hauser','angie.hauser@townsquaremedia.com','$2y$10$qZgXRDfcIZXMkODGsgIomerM4cHuFnUfZT7HxnObKmhTF5tEekTze','(970) 219-7506',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(58,'J06969','Chad','Hobot','chad.hobot@townsquaremedia.com','$2y$10$UPdy5oi45tamhpfiBlen/.sUqsruB/xBqqFWO8CHAwHkuabGGhy0m','(763) 244-4058',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(59,'P07214','Thom','Jennings','thom.jennings@townsquaremedia.com','$2y$10$pp7cyD8t8JnzT9n5Q1LkP.COlXmwKi21v4BiYY/FILZjlqa3nBVpe','(716) 255-1454',NULL,NULL,8,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(60,'N06949','Nicole','Kearney','nicole.kearney@townsquaremedia.com','$2y$10$SkeQDChRPI.J5NHO04acweVcoPiNHhUGMGLDedsWRAKS63/HBvY2e','(848) 333-4867',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(61,'R07407','Ryan','London','ryan.london@townsquaremedia.com','$2y$10$wgtXLeMCSDFjM7NF12EyTumdYCsE5bVg5/nQ2cP9rBcOu/9mtbAYm',NULL,NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(62,'H06679','Patrick','McShea','patrick.mcshea@townsquaremedia.com','$2y$10$qECK9O05uQuktSfaVkU.Ie21EpFBFASo5pRueF92N5cRuoeyygdqu','(217) 853-5410',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(63,'A07032','Mallory','Maxwell','mallory.maxwell@townsquaremedia.com','$2y$10$OdeOQsLKdbwgOxidj16ZleZobPaJBNzB2Jvd7QJt.pj9YGyJEMWF2','(806) 543-7656',NULL,NULL,8,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(64,'T07217','Jillian','May','jillian.may@townsquaremedia.com','$2y$10$OT/UbJWy7ymasbDMW2mDY.E7o659XD1jVdmFBhCoygUk0VrNcDk5.','(616) 366-1437',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(65,'J06105','Casey','Miller','casey.miller@townsquaremedia.com','$2y$10$0OxWl2zDVagoi/YF8wYCnebwdRUPpWHst9/UmqRqBB4N82AMAh4Uu','(337) 278-0913',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(66,'R07215','Ashley','Olson','ashley.olson@townsquaremedia.com','$2y$10$pE9U0gqQG1DPSCFr3JwPxO6OwryEkGJYjUeYHj4BnfIEISPXX4hBy','(856) 261-4885',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(67,'P06950','Chasity','Reach','chasity.reach@townsquaremedia.com','$2y$10$pWmmCTEvkIReZfrof4f1uuoCH6XD1ihjf/.PmXUWKOTVgCLxuR6BO','(205) 283-3032',NULL,NULL,2,NULL,'2016-04-20 16:10:21','2016-04-20 16:10:21'),
	(68,'M07308','Mackenzie','Schutter','mackenzie.schutter@townsquaremedia.com','$2y$10$Q4W/XYKXjhUq3PBkM9sI9ePt3VZeiP/Yan99jlXw2PDFEcHr4YRZW','(269) 599-3633',NULL,NULL,8,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(69,'M06948','John','Tellier','john.tellier@townsquaremedia.com','$2y$10$vCHhCrXhWE47W3gIdcZL5.6bbjHqkl6Mt3gevaUJCsix0le.pUjVm','(603) 828-9950',NULL,NULL,8,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(70,'H05143','Lisa','Thomas','lisa.thomas@townsquaremedia.com','$2y$10$ocn7tUbiVF5QY0wnKeKEUO.GedEy4w1ulSdf.6hqxo1jTQou3ptD2','(401) 241-9914',NULL,NULL,8,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(71,'U07218','Shane','Tolman','shane.tolman@townsquaremedia.com','$2y$10$zsduvJJHfy9oOA2sKuytLOg4DA5o5/Dp4Jn9AnvWEvIC9rZMPThSW','(208) 954-3291',NULL,NULL,2,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(72,'V06859','Joe','Waldowski','joe.waldowski@townsquaremedia.com','$2y$10$AGAex0c5J16e58pfT73vL.OlzsaCmrOOShPol.lzjMzbLjJKmXjL6','(607) 725-8420',NULL,NULL,8,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(73,'D07299','Larry','Walsh','larry.walsh@townsquaremedia.com','$2y$10$TSW8ClSAANqS94DvfCqHHu0aZZ/tJ26uqzXKnHN/7dIXhigSakCfK','(802) 440-2865',NULL,NULL,8,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(74,'J06945','Andrew','Woolford','andrew.woolford@townsquaremedia.com','$2y$10$2/RzrW.a5ufNT9kcrcm8ge0y/KDlPy9M.X/40V2pi2g.zbzkuPyFu','(207) 219-9927',NULL,NULL,8,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(75,'M06108','Alex','Zundel','alex.zundel@townsquaremedia.com','$2y$10$3BzR6fkHOQ5W89yrW9tFtulC1RQSQtQomVaxewRPZm7wUSp9jp4jS','(406) 220-0230',NULL,NULL,78,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(76,'K06202','David','Callahan','david.callahan@townsquaremedia.com','$2y$10$5MCpp9KupWO17aLaasEfzOuLaKAv5SHjRyNzYJ2YCuqXPovTWYtd6','(856) 816-7981','(704) 665-0611',NULL,1,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(77,'K05098','May','Ly','may.ly@townsquaremedia.com','$2y$10$010onL/KzIhY6WDtFHwiW.Aj.R4vJtc4Dc.b6ECaNZ7T1QmH9yy6q','(704) 578-5968','(704) 665-0611','5077',1,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(78,'E06100','Marc','Notaro','marc.notaro@townsquaremedia.com','$2y$10$hKsI6grUNQ.PHS6cg5u5detThZFyoXez2nZvynI46yh8pvEZSkLUy','(716) 449-1997',NULL,NULL,1,NULL,'2016-04-20 16:10:22','2016-04-20 16:10:22'),
	(79,'W06692','Sara','Ryan','sara.ryan@townsquaremedia.com','$2y$10$Ript.Lr5LynfuJVjbhush.1htxtePZxbJW4VK/ERS6qs/mHL5AcVK',NULL,'(704) 469-4150','5128',81,NULL,'2016-04-20 16:10:22','2016-04-20 16:44:46'),
	(80,'X06693','Katrina','Smith','katrina.smith@townsquaremedia.com','$2y$10$wdC./1QAZT0t7atxy3QKZOxQRZnwhxF/I9RNelpRN2jwRLsPx6QVS',NULL,'(704) 469-4128','5016',81,NULL,'2016-04-20 16:10:22','2016-04-20 16:45:13'),
	(81,'','Chris','Ireland','chris.ireland@townsquaremedia.com','',NULL,NULL,NULL,NULL,NULL,'2016-04-20 16:44:33','2016-04-20 16:44:33'),
	(82,'COS839','Leo','McGary','leo.mcgary@westwing.com','',NULL,NULL,NULL,NULL,NULL,'2016-04-21 14:04:13','2016-04-21 19:01:46'),
	(83,'DCOS93','Josh','Lyman','josh.lyman@westwing.com','',NULL,NULL,NULL,82,NULL,'2016-04-21 18:29:54','2016-04-21 19:02:08'),
	(84,'PS8493','CJ','Craig','cj@westwing.com','',NULL,NULL,NULL,82,NULL,'2016-04-21 19:07:55','2016-04-21 19:17:01'),
	(85,'CD8496','Toby','Ziegler','toby.ziegler@townsquaremedia.com','',NULL,NULL,NULL,82,NULL,'2016-04-21 19:11:14','2016-04-21 19:16:35'),
	(87,'DCD391','Sam','Seaborn','sam.seaborn@westwing.com','',NULL,NULL,NULL,85,NULL,'2016-04-21 19:13:09','2016-04-21 19:15:19'),
	(88,'ADCOS7','Donna','Moss','donna.moss@westwing.com','',NULL,NULL,NULL,83,NULL,'2016-04-21 19:13:56','2016-04-21 19:13:56'),
	(89,'BM3892','Charlie','Young','charlie.young@townsquaremedia.com','',NULL,NULL,NULL,NULL,NULL,'2016-04-22 20:41:49','2016-04-22 21:14:10');

/*!40000 ALTER TABLE `ap_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
