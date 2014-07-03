-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: oc_testing
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1-log

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
-- Table structure for table `oc6_activity`
--

DROP TABLE IF EXISTS `oc6_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `affecteduser` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subjectparams` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `messageparams` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_activity`
--

LOCK TABLES `oc6_activity` WRITE;
/*!40000 ALTER TABLE `oc6_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_appconfig`
--

DROP TABLE IF EXISTS `oc6_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_appconfig` (
  `appid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_appconfig`
--

LOCK TABLES `oc6_appconfig` WRITE;
/*!40000 ALTER TABLE `oc6_appconfig` DISABLE KEYS */;
INSERT INTO `oc6_appconfig` VALUES ('activity','enabled','yes'),('activity','installed_version','1.1.2'),('activity','types','filesystem'),('backgroundjob','lastjob','1'),('calendar','enabled','yes'),('calendar','installed_version','0.6.3'),('calendar','types',''),('contacts','enabled','yes'),('contacts','installed_version','0.3'),('contacts','types',''),('core','global_cache_gc_lastrun','1404372618'),('core','installedat','1401291989.8355'),('core','lastupdatedat','1404372625'),('core','lastupdateResult','{\"version\":{},\"versionstring\":{},\"url\":{},\"web\":{}}'),('core','public_caldav','calendar/share.php'),('core','public_calendar','calendar/share.php'),('core','public_documents','documents/public.php'),('core','public_files','files_sharing/public.php'),('core','public_gallery','gallery/public.php'),('core','public_webdav','files_sharing/public.php'),('core','remote_caldav','calendar/appinfo/remote.php'),('core','remote_calendar','calendar/appinfo/remote.php'),('core','remote_carddav','contacts/appinfo/remote.php'),('core','remote_contacts','contacts/appinfo/remote.php'),('core','remote_core.css','/core/minimizer.php'),('core','remote_core.js','/core/minimizer.php'),('core','remote_files','files/appinfo/remote.php'),('core','remote_filesync','files/appinfo/filesync.php'),('core','remote_webdav','files/appinfo/remote.php'),('documents','enabled','yes'),('documents','installed_version','0.8.1'),('documents','types',''),('files','backgroundwatcher_previous_file','22'),('files','backgroundwatcher_previous_folder','14'),('files','enabled','yes'),('files','installed_version','1.1.7'),('files','types','filesystem'),('files_pdfviewer','enabled','yes'),('files_pdfviewer','installed_version','0.3'),('files_pdfviewer','types',''),('files_sharing','enabled','yes'),('files_sharing','installed_version','0.3.5'),('files_sharing','types','filesystem'),('files_texteditor','enabled','yes'),('files_texteditor','installed_version','0.3'),('files_texteditor','types',''),('files_trashbin','enabled','yes'),('files_trashbin','installed_version','0.5'),('files_trashbin','types','filesystem'),('files_versions','enabled','yes'),('files_versions','installed_version','1.0.3'),('files_versions','types','filesystem'),('files_videoviewer','enabled','yes'),('files_videoviewer','installed_version','0.1.2'),('files_videoviewer','types',''),('firstrunwizard','enabled','yes'),('firstrunwizard','installed_version','1.0'),('firstrunwizard','types',''),('gallery','enabled','yes'),('gallery','installed_version','0.5.3'),('gallery','types','filesystem'),('revealjs','enabled','yes'),('revealjs','installed_version','2.4.1'),('revealjs','types',''),('roundcube','autoLogin','1'),('roundcube','enabled','yes'),('roundcube','installed_version','2.4.1'),('roundcube','maildir','/oc_testing/mysql/RC10/'),('roundcube','types',''),('search_lucene','enabled','yes'),('search_lucene','installed_version','0.5.2'),('search_lucene','types','filesystem'),('storagecharts2','enabled','yes'),('storagecharts2','installed_version','2.4.1'),('storagecharts2','types',''),('updater','enabled','yes'),('updater','installed_version','0.3'),('updater','types','');
/*!40000 ALTER TABLE `oc6_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_clndr_calendars`
--

DROP TABLE IF EXISTS `oc6_clndr_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_clndr_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `ctag` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` longtext COLLATE utf8_unicode_ci,
  `components` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_clndr_calendars`
--

LOCK TABLES `oc6_clndr_calendars` WRITE;
/*!40000 ALTER TABLE `oc6_clndr_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_clndr_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_clndr_objects`
--

DROP TABLE IF EXISTS `oc6_clndr_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_clndr_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` int(10) unsigned NOT NULL DEFAULT '0',
  `objecttype` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `startdate` datetime DEFAULT '1970-01-01 00:00:00',
  `enddate` datetime DEFAULT '1970-01-01 00:00:00',
  `repeating` int(11) DEFAULT '0',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendardata` longtext COLLATE utf8_unicode_ci,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastmodified` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_clndr_objects`
--

LOCK TABLES `oc6_clndr_objects` WRITE;
/*!40000 ALTER TABLE `oc6_clndr_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_clndr_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_clndr_repeat`
--

DROP TABLE IF EXISTS `oc6_clndr_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_clndr_repeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventid` int(10) unsigned NOT NULL DEFAULT '0',
  `calid` int(10) unsigned NOT NULL DEFAULT '0',
  `startdate` datetime DEFAULT '1970-01-01 00:00:00',
  `enddate` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_clndr_repeat`
--

LOCK TABLES `oc6_clndr_repeat` WRITE;
/*!40000 ALTER TABLE `oc6_clndr_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_clndr_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_clndr_share_calendar`
--

DROP TABLE IF EXISTS `oc6_clndr_share_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_clndr_share_calendar` (
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `share` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sharetype` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `calendarid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `permissions` smallint(6) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_clndr_share_calendar`
--

LOCK TABLES `oc6_clndr_share_calendar` WRITE;
/*!40000 ALTER TABLE `oc6_clndr_share_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_clndr_share_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_clndr_share_event`
--

DROP TABLE IF EXISTS `oc6_clndr_share_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_clndr_share_event` (
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `share` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sharetype` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `permissions` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_clndr_share_event`
--

LOCK TABLES `oc6_clndr_share_event` WRITE;
/*!40000 ALTER TABLE `oc6_clndr_share_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_clndr_share_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_contacts_addressbooks`
--

DROP TABLE IF EXISTS `oc6_contacts_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_contacts_addressbooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `displayname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ctag` int(10) unsigned NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_contacts_addressbooks`
--

LOCK TABLES `oc6_contacts_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc6_contacts_addressbooks` DISABLE KEYS */;
INSERT INTO `oc6_contacts_addressbooks` VALUES (1,'admin','Kontakte','kontakte','',1401291998,1),(2,'negative@roundcube.owncloud.org','Contacts','contacts','',1404372624,1),(3,'positive@roundcube.owncloud.org','Contacts','contacts','',1404372642,1);
/*!40000 ALTER TABLE `oc6_contacts_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_contacts_cards`
--

DROP TABLE IF EXISTS `oc6_contacts_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_contacts_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` int(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carddata` longtext COLLATE utf8_unicode_ci,
  `uri` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_contacts_cards`
--

LOCK TABLES `oc6_contacts_cards` WRITE;
/*!40000 ALTER TABLE `oc6_contacts_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_contacts_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_contacts_cards_properties`
--

DROP TABLE IF EXISTS `oc6_contacts_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_contacts_cards_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contactid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cp_name_index` (`name`),
  KEY `cp_value_index` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_contacts_cards_properties`
--

LOCK TABLES `oc6_contacts_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc6_contacts_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_contacts_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_dlstcharts`
--

DROP TABLE IF EXISTS `oc6_dlstcharts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_dlstcharts` (
  `stc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oc_uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `stc_month` bigint(20) NOT NULL,
  `stc_dayts` bigint(20) NOT NULL,
  `stc_used` bigint(20) NOT NULL,
  `stc_total` bigint(20) NOT NULL,
  PRIMARY KEY (`stc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_dlstcharts`
--

LOCK TABLES `oc6_dlstcharts` WRITE;
/*!40000 ALTER TABLE `oc6_dlstcharts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_dlstcharts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_dlstcharts_uconf`
--

DROP TABLE IF EXISTS `oc6_dlstcharts_uconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_dlstcharts_uconf` (
  `uc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oc_uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uc_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uc_val` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_dlstcharts_uconf`
--

LOCK TABLES `oc6_dlstcharts_uconf` WRITE;
/*!40000 ALTER TABLE `oc6_dlstcharts_uconf` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_dlstcharts_uconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_documents_invite`
--

DROP TABLE IF EXISTS `oc6_documents_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_documents_invite` (
  `es_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  `sent_on` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_documents_invite`
--

LOCK TABLES `oc6_documents_invite` WRITE;
/*!40000 ALTER TABLE `oc6_documents_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_documents_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_documents_member`
--

DROP TABLE IF EXISTS `oc6_documents_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_documents_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `es_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `is_guest` smallint(5) unsigned NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_documents_member`
--

LOCK TABLES `oc6_documents_member` WRITE;
/*!40000 ALTER TABLE `oc6_documents_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_documents_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_documents_op`
--

DROP TABLE IF EXISTS `oc6_documents_op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_documents_op` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `es_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `member` int(10) unsigned NOT NULL DEFAULT '1',
  `opspec` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `documents_op_eis_idx` (`es_id`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_documents_op`
--

LOCK TABLES `oc6_documents_op` WRITE;
/*!40000 ALTER TABLE `oc6_documents_op` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_documents_op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_documents_revisions`
--

DROP TABLE IF EXISTS `oc6_documents_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_documents_revisions` (
  `es_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `seq_head` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `file_id` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `save_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `documents_rev_eis_idx` (`es_id`,`seq_head`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_documents_revisions`
--

LOCK TABLES `oc6_documents_revisions` WRITE;
/*!40000 ALTER TABLE `oc6_documents_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_documents_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_documents_session`
--

DROP TABLE IF EXISTS `oc6_documents_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_documents_session` (
  `es_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `genesis_url` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `genesis_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `file_id` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`es_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_documents_session`
--

LOCK TABLES `oc6_documents_session` WRITE;
/*!40000 ALTER TABLE `oc6_documents_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_documents_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_file_map`
--

DROP TABLE IF EXISTS `oc6_file_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_file_map` (
  `logic_path` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `logic_path_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `physic_path` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `physic_path_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`logic_path_hash`),
  UNIQUE KEY `file_map_pp_index` (`physic_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_file_map`
--

LOCK TABLES `oc6_file_map` WRITE;
/*!40000 ALTER TABLE `oc6_file_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_file_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_filecache`
--

DROP TABLE IF EXISTS `oc6_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_filecache` (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `storage` int(11) NOT NULL DEFAULT '0',
  `path` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` int(11) NOT NULL DEFAULT '0',
  `mimepart` int(11) NOT NULL DEFAULT '0',
  `size` bigint(20) NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `storage_mtime` int(11) NOT NULL DEFAULT '0',
  `encrypted` int(11) NOT NULL DEFAULT '0',
  `unencrypted_size` bigint(20) NOT NULL DEFAULT '0',
  `etag` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_filecache`
--

LOCK TABLES `oc6_filecache` WRITE;
/*!40000 ALTER TABLE `oc6_filecache` DISABLE KEYS */;
INSERT INTO `oc6_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1404372667,1401291998,0,0,'53b506bb035c4'),(12,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,6040581,1404372628,1404372624,0,0,'53b506951e680'),(13,2,'files','45b963397aa40d4a0063e0d85e4fe7a1',12,'files',2,1,6040581,1404372628,1404372624,0,0,'53b5069536c2f'),(14,2,'files/photos','923e51351db3e8726f22ba0fa1c04d5a',13,'photos',2,1,678556,1404372628,1404372624,0,0,'53b506957f531'),(15,2,'files/music','1f8cfec283cd675038bb95b599fdc75a',13,'music',2,1,3764804,1404372628,1404372624,0,0,'53b506956cdef'),(16,2,'files/documents','2d30f25cef1a92db784bc537e8bf128d',13,'documents',2,1,23383,1404372628,1404372624,0,0,'53b5069552c52'),(17,2,'files/ownCloudUserManual.pdf','c8edba2d1b8eb651c107b43532c34445',13,'ownCloudUserManual.pdf',4,3,1573838,1404372624,1404372624,0,0,'53b50690984ad'),(18,2,'files/documents/example.odt','f51311bd6910ec7356d79286dcb24dec',16,'example.odt',5,3,23383,1404372624,1404372624,0,0,'53b506928d6ef'),(19,2,'files/music/projekteva-letitrain.mp3','da7d05a957a2bbbf0e74b12c1b5fcfee',15,'projekteva-letitrain.mp3',7,6,3764804,1404372624,1404372624,0,0,'53b5069317c3f'),(20,2,'files/photos/paris.jpg','65154b90b985bff20d4923f224ca1c33',14,'paris.jpg',9,8,228761,1404372624,1404372624,0,0,'53b5069377c22'),(21,2,'files/photos/san francisco.jpg','e86e87a4ecd557753734e1d34fbeecec',14,'san francisco.jpg',9,8,216071,1404372624,1404372624,0,0,'53b50693780b6'),(22,2,'files/photos/squirrel.jpg','e462c24fc17cb1a3fa3bca86d7f89593',14,'squirrel.jpg',9,8,233724,1404372624,1404372624,0,0,'53b5069378409'),(23,4,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,6040581,1404372648,1404372642,0,0,'53b506a8740ed'),(24,4,'files','45b963397aa40d4a0063e0d85e4fe7a1',23,'files',2,1,6040581,1404372648,1404372642,0,0,'53b506a88811b'),(25,4,'files/photos','923e51351db3e8726f22ba0fa1c04d5a',24,'photos',2,1,678556,1404372642,1404372642,0,0,'53b506a3383f6'),(26,4,'files/music','1f8cfec283cd675038bb95b599fdc75a',24,'music',2,1,3764804,1404372642,1404372642,0,0,'53b506a338643'),(27,4,'files/documents','2d30f25cef1a92db784bc537e8bf128d',24,'documents',2,1,23383,1404372642,1404372642,0,0,'53b506a338812'),(28,4,'files/ownCloudUserManual.pdf','c8edba2d1b8eb651c107b43532c34445',24,'ownCloudUserManual.pdf',4,3,1573838,1404372642,1404372642,0,0,'53b506a338aa0'),(29,4,'files/documents/example.odt','f51311bd6910ec7356d79286dcb24dec',27,'example.odt',5,3,23383,1404372642,1404372642,0,0,'53b506a449f26'),(30,4,'files/music/projekteva-letitrain.mp3','da7d05a957a2bbbf0e74b12c1b5fcfee',26,'projekteva-letitrain.mp3',7,6,3764804,1404372642,1404372642,0,0,'53b506a4dccf3'),(31,4,'files/photos/paris.jpg','65154b90b985bff20d4923f224ca1c33',25,'paris.jpg',9,8,228761,1404372642,1404372642,0,0,'53b506a71154a'),(32,4,'files/photos/san francisco.jpg','e86e87a4ecd557753734e1d34fbeecec',25,'san francisco.jpg',9,8,216071,1404372642,1404372642,0,0,'53b506a7117aa'),(33,4,'files/photos/squirrel.jpg','e462c24fc17cb1a3fa3bca86d7f89593',25,'squirrel.jpg',9,8,233724,1404372642,1404372642,0,0,'53b506a7119ae'),(34,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,6040581,1404372667,1404372662,0,0,'53b506bb62a29'),(35,1,'files/photos','923e51351db3e8726f22ba0fa1c04d5a',34,'photos',2,1,678556,1404372667,1404372662,0,0,'53b506bbf131f'),(36,1,'files/music','1f8cfec283cd675038bb95b599fdc75a',34,'music',2,1,3764804,1404372667,1404372662,0,0,'53b506bbce784'),(37,1,'files/documents','2d30f25cef1a92db784bc537e8bf128d',34,'documents',2,1,23383,1404372667,1404372662,0,0,'53b506bb8f26d'),(38,1,'files/ownCloudUserManual.pdf','c8edba2d1b8eb651c107b43532c34445',34,'ownCloudUserManual.pdf',4,3,1573838,1404372662,1404372662,0,0,'53b506b6c73dc'),(39,1,'files/documents/example.odt','f51311bd6910ec7356d79286dcb24dec',37,'example.odt',5,3,23383,1404372662,1404372662,0,0,'53b506ba0861c'),(40,1,'files/music/projekteva-letitrain.mp3','da7d05a957a2bbbf0e74b12c1b5fcfee',36,'projekteva-letitrain.mp3',7,6,3764804,1404372662,1404372662,0,0,'53b506ba59d1c'),(41,1,'files/photos/paris.jpg','65154b90b985bff20d4923f224ca1c33',35,'paris.jpg',9,8,228761,1404372662,1404372662,0,0,'53b506bab3b68'),(42,1,'files/photos/san francisco.jpg','e86e87a4ecd557753734e1d34fbeecec',35,'san francisco.jpg',9,8,216071,1404372662,1404372662,0,0,'53b506bab3e15'),(43,1,'files/photos/squirrel.jpg','e462c24fc17cb1a3fa3bca86d7f89593',35,'squirrel.jpg',9,8,233724,1404372662,1404372662,0,0,'53b506bab408f');
/*!40000 ALTER TABLE `oc6_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_files_trash`
--

DROP TABLE IF EXISTS `oc6_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_files_trash` (
  `id` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_files_trash`
--

LOCK TABLES `oc6_files_trash` WRITE;
/*!40000 ALTER TABLE `oc6_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_files_trashsize`
--

DROP TABLE IF EXISTS `oc6_files_trashsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_files_trashsize` (
  `user` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_files_trashsize`
--

LOCK TABLES `oc6_files_trashsize` WRITE;
/*!40000 ALTER TABLE `oc6_files_trashsize` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_files_trashsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_files_versions`
--

DROP TABLE IF EXISTS `oc6_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_files_versions` (
  `user` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_files_versions`
--

LOCK TABLES `oc6_files_versions` WRITE;
/*!40000 ALTER TABLE `oc6_files_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_gallery_sharing`
--

DROP TABLE IF EXISTS `oc6_gallery_sharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_gallery_sharing` (
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `gallery_id` int(11) NOT NULL DEFAULT '0',
  `recursive` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_gallery_sharing`
--

LOCK TABLES `oc6_gallery_sharing` WRITE;
/*!40000 ALTER TABLE `oc6_gallery_sharing` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_gallery_sharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_group_admin`
--

DROP TABLE IF EXISTS `oc6_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_group_admin` (
  `gid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_group_admin`
--

LOCK TABLES `oc6_group_admin` WRITE;
/*!40000 ALTER TABLE `oc6_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_group_user`
--

DROP TABLE IF EXISTS `oc6_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_group_user` (
  `gid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_group_user`
--

LOCK TABLES `oc6_group_user` WRITE;
/*!40000 ALTER TABLE `oc6_group_user` DISABLE KEYS */;
INSERT INTO `oc6_group_user` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc6_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_groups`
--

DROP TABLE IF EXISTS `oc6_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_groups` (
  `gid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_groups`
--

LOCK TABLES `oc6_groups` WRITE;
/*!40000 ALTER TABLE `oc6_groups` DISABLE KEYS */;
INSERT INTO `oc6_groups` VALUES ('admin');
/*!40000 ALTER TABLE `oc6_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_jobs`
--

DROP TABLE IF EXISTS `oc6_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `argument` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_jobs`
--

LOCK TABLES `oc6_jobs` WRITE;
/*!40000 ALTER TABLE `oc6_jobs` DISABLE KEYS */;
INSERT INTO `oc6_jobs` VALUES (1,'OC\\Cache\\FileGlobalGC','null',1404372716),(2,'OC\\BackgroundJob\\Legacy\\RegularJob','[\"\\\\OC\\\\Files\\\\Cache\\\\BackgroundWatcher\",\"checkNext\"]',1404372706),(3,'OC\\BackgroundJob\\Legacy\\RegularJob','[\"OC_RoundCube_AuthHelper\",\"refresh\"]',1404372712);
/*!40000 ALTER TABLE `oc6_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_locks`
--

DROP TABLE IF EXISTS `oc6_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_locks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeout` int(10) unsigned DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` smallint(6) DEFAULT NULL,
  `depth` smallint(6) DEFAULT NULL,
  `uri` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_locks`
--

LOCK TABLES `oc6_locks` WRITE;
/*!40000 ALTER TABLE `oc6_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_lucene_status`
--

DROP TABLE IF EXISTS `oc6_lucene_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_lucene_status` (
  `fileid` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  KEY `status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_lucene_status`
--

LOCK TABLES `oc6_lucene_status` WRITE;
/*!40000 ALTER TABLE `oc6_lucene_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_lucene_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_mimetypes`
--

DROP TABLE IF EXISTS `oc6_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_mimetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_mimetypes`
--

LOCK TABLES `oc6_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc6_mimetypes` DISABLE KEYS */;
INSERT INTO `oc6_mimetypes` VALUES (3,'application'),(4,'application/pdf'),(5,'application/vnd.oasis.opendocument.text'),(6,'audio'),(7,'audio/mpeg'),(1,'httpd'),(2,'httpd/unix-directory'),(8,'image'),(9,'image/jpeg');
/*!40000 ALTER TABLE `oc6_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_permissions`
--

DROP TABLE IF EXISTS `oc6_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_permissions` (
  `fileid` int(11) NOT NULL DEFAULT '0',
  `user` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` int(11) NOT NULL DEFAULT '0',
  KEY `id_user_index` (`fileid`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_permissions`
--

LOCK TABLES `oc6_permissions` WRITE;
/*!40000 ALTER TABLE `oc6_permissions` DISABLE KEYS */;
INSERT INTO `oc6_permissions` VALUES (16,'negative@roundcube.owncloud.org',31),(15,'negative@roundcube.owncloud.org',31),(17,'negative@roundcube.owncloud.org',27),(14,'negative@roundcube.owncloud.org',31),(13,'negative@roundcube.owncloud.org',31),(24,'positive@roundcube.owncloud.org',31),(38,'admin',27),(34,'admin',31),(37,'admin',31),(36,'admin',31),(35,'admin',31),(27,'positive@roundcube.owncloud.org',31),(26,'positive@roundcube.owncloud.org',31),(28,'positive@roundcube.owncloud.org',27),(25,'positive@roundcube.owncloud.org',31);
/*!40000 ALTER TABLE `oc6_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_pictures_images_cache`
--

DROP TABLE IF EXISTS `oc6_pictures_images_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_pictures_images_cache` (
  `uid_owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_pictures_images_cache`
--

LOCK TABLES `oc6_pictures_images_cache` WRITE;
/*!40000 ALTER TABLE `oc6_pictures_images_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_pictures_images_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_preferences`
--

DROP TABLE IF EXISTS `oc6_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_preferences` (
  `userid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_preferences`
--

LOCK TABLES `oc6_preferences` WRITE;
/*!40000 ALTER TABLE `oc6_preferences` DISABLE KEYS */;
INSERT INTO `oc6_preferences` VALUES ('admin','files','cache_version','5'),('admin','firstrunwizard','show','0'),('admin','login_token','103875b6a73b1f60ed65c3f7972e456e','1404372676'),('admin','login_token','c1184177e812f57df378fd57fb5f829e','1404372662'),('admin','login_token','e2f223c40c298f39786a272686de51c7','1404372711'),('negative@roundcube.owncloud.org','files','cache_version','5'),('negative@roundcube.owncloud.org','login_token','a7e7f6ecda9ca0cbb97afdda5320cd45','1404372624'),('positive@roundcube.owncloud.org','files','cache_version','5'),('positive@roundcube.owncloud.org','login_token','6517687ae2d5f8e289b171ff286426b8','1404372693'),('positive@roundcube.owncloud.org','login_token','caa551e6106cbdf86a6de603eef6df44','1404372642');
/*!40000 ALTER TABLE `oc6_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_privatedata`
--

DROP TABLE IF EXISTS `oc6_privatedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_privatedata` (
  `keyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_privatedata`
--

LOCK TABLES `oc6_privatedata` WRITE;
/*!40000 ALTER TABLE `oc6_privatedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_privatedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_properties`
--

DROP TABLE IF EXISTS `oc6_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `propertyvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_properties`
--

LOCK TABLES `oc6_properties` WRITE;
/*!40000 ALTER TABLE `oc6_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_roundcube`
--

DROP TABLE IF EXISTS `oc6_roundcube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_roundcube` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oc_user` varchar(4096) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail_user` varchar(4096) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail_password` varchar(4096) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_roundcube`
--

LOCK TABLES `oc6_roundcube` WRITE;
/*!40000 ALTER TABLE `oc6_roundcube` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_roundcube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_share`
--

DROP TABLE IF EXISTS `oc6_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT '0',
  `share_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid_owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_source` int(11) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT '0',
  `stime` bigint(20) NOT NULL DEFAULT '0',
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_share`
--

LOCK TABLES `oc6_share` WRITE;
/*!40000 ALTER TABLE `oc6_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_storagecharts2`
--

DROP TABLE IF EXISTS `oc6_storagecharts2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_storagecharts2` (
  `stc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oc_uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `stc_month` bigint(20) NOT NULL,
  `stc_dayts` bigint(20) NOT NULL,
  `stc_used` bigint(20) NOT NULL,
  `stc_total` bigint(20) NOT NULL,
  PRIMARY KEY (`stc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_storagecharts2`
--

LOCK TABLES `oc6_storagecharts2` WRITE;
/*!40000 ALTER TABLE `oc6_storagecharts2` DISABLE KEYS */;
INSERT INTO `oc6_storagecharts2` VALUES (1,'admin',201407,1404345600,18354735,1657143243311);
/*!40000 ALTER TABLE `oc6_storagecharts2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_storagecharts2_uconf`
--

DROP TABLE IF EXISTS `oc6_storagecharts2_uconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_storagecharts2_uconf` (
  `uc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oc_uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uc_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uc_val` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_storagecharts2_uconf`
--

LOCK TABLES `oc6_storagecharts2_uconf` WRITE;
/*!40000 ALTER TABLE `oc6_storagecharts2_uconf` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_storagecharts2_uconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_storages`
--

DROP TABLE IF EXISTS `oc6_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_storages` (
  `id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numeric_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_storages`
--

LOCK TABLES `oc6_storages` WRITE;
/*!40000 ALTER TABLE `oc6_storages` DISABLE KEYS */;
INSERT INTO `oc6_storages` VALUES ('home::admin',1),('home::negative@roundcube.owncloud.org',2),('home::positive@roundcube.owncloud.org',4),('local::/var/www/oc_testing/mysql/OC60/data/',3);
/*!40000 ALTER TABLE `oc6_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_users`
--

DROP TABLE IF EXISTS `oc6_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_users` (
  `uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_users`
--

LOCK TABLES `oc6_users` WRITE;
/*!40000 ALTER TABLE `oc6_users` DISABLE KEYS */;
INSERT INTO `oc6_users` VALUES ('admin',NULL,'$2a$08$ppgj7UMJoLNEJHNWjKOlaOp/JO3TJ4/9VoOrhFZvsHmFe0Lm4MbDG'),('negative@roundcube.owncloud.org',NULL,'$2a$08$lkwE4UYlQ90A2b6cUNpgZOeTDRPCZrMEufih50Jeifg/dtOJ4J2MG'),('positive@roundcube.owncloud.org',NULL,'$2a$08$0b7DGj2Y6PS8lAfCuXBOd.H2cj83HX0jfZG2xy1ilnCSU54ZFgRZq');
/*!40000 ALTER TABLE `oc6_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_vcategory`
--

DROP TABLE IF EXISTS `oc6_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_vcategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_vcategory`
--

LOCK TABLES `oc6_vcategory` WRITE;
/*!40000 ALTER TABLE `oc6_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc6_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc6_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc6_vcategory_to_object` (
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc6_vcategory_to_object`
--

LOCK TABLES `oc6_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc6_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc6_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'oc_testing'
--

--
-- Dumping routines for database 'oc_testing'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-03  9:32:10
