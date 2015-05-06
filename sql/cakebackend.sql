-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: cakebackend
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authake_groups`
--

DROP TABLE IF EXISTS `authake_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authake_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authake_groups`
--

LOCK TABLES `authake_groups` WRITE;
/*!40000 ALTER TABLE `authake_groups` DISABLE KEYS */;
INSERT INTO `authake_groups` VALUES (1,'Administrators'),(2,'Registered users'),(3,'author');
/*!40000 ALTER TABLE `authake_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authake_groups_users`
--

DROP TABLE IF EXISTS `authake_groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authake_groups_users` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authake_groups_users`
--

LOCK TABLES `authake_groups_users` WRITE;
/*!40000 ALTER TABLE `authake_groups_users` DISABLE KEYS */;
INSERT INTO `authake_groups_users` VALUES (2,2),(3,2),(1,1);
/*!40000 ALTER TABLE `authake_groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authake_rules`
--

DROP TABLE IF EXISTS `authake_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authake_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Rule description',
  `group_id` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `action` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` tinyint(1) NOT NULL DEFAULT '0',
  `forward` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authake_rules`
--

LOCK TABLES `authake_rules` WRITE;
/*!40000 ALTER TABLE `authake_rules` DISABLE KEYS */;
INSERT INTO `authake_rules` VALUES (1,'Allow everything for Administrators',1,999999,'*',1,'',''),(2,'Allow anybody to see the home page, the error page, to register, to log in, see profile and log out',NULL,200,'/ or /authake/user/* or /register or /login or /logout or /lost-password or /verify(/)?* or /pass(/)?* or /profile or /denied or /pages(/)?* or //pages/*',1,'',''),(4,'Deny everything for everybody by default (allow to have allow by default then deny)',NULL,0,'*',0,'','Access denied!'),(6,'Display a message for denied admin page',NULL,100,'/authake(/index)? or /authake/users* or /authake/groups* or /authake/rules*',0,'','You are not allowed to access the administration page!');
/*!40000 ALTER TABLE `authake_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authake_users`
--

DROP TABLE IF EXISTS `authake_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authake_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `emailcheckcode` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `passwordchangecode` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `disable` tinyint(1) NOT NULL COMMENT 'Disable/enable account',
  `expire_account` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authake_users`
--

LOCK TABLES `authake_users` WRITE;
/*!40000 ALTER TABLE `authake_users` DISABLE KEYS */;
INSERT INTO `authake_users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','alezyy@yahoo.com','','',0,'2031-05-05','2008-02-12 12:19:31','2008-02-12 12:19:31'),(2,'test','098f6bcd4621d373cade4e832627b4f6','tizpeople@gmail.com','e367590af7d67b32a0180845703fe4de','',0,'2034-05-14','2015-05-05 19:48:19','2015-05-05 19:48:19'),(3,'mona','1a1dc91c907325c69271ddf0c944bc72','mona@email.com','','',0,'2021-05-05','2015-05-05 19:58:02','2015-05-05 19:58:02');
/*!40000 ALTER TABLE `authake_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-05 20:28:34
