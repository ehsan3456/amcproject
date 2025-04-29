-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: nlcapp
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Branch',7,'add_branch'),(26,'Can change Branch',7,'change_branch'),(27,'Can delete Branch',7,'delete_branch'),(28,'Can view Branch',7,'view_branch'),(29,'Can add CBK Number',8,'add_cbknumbers'),(30,'Can change CBK Number',8,'change_cbknumbers'),(31,'Can delete CBK Number',8,'delete_cbknumbers'),(32,'Can view CBK Number',8,'view_cbknumbers'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add SW HR V',10,'add_sw_hr_v'),(38,'Can change SW HR V',10,'change_sw_hr_v'),(39,'Can delete SW HR V',10,'delete_sw_hr_v'),(40,'Can view SW HR V',10,'view_sw_hr_v'),(41,'Can add template',11,'add_template'),(42,'Can change template',11,'change_template'),(43,'Can delete template',11,'delete_template'),(44,'Can view template',11,'view_template'),(45,'Can add CBK Contact',12,'add_cbkcontacts'),(46,'Can change CBK Contact',12,'change_cbkcontacts'),(47,'Can delete CBK Contact',12,'delete_cbkcontacts'),(48,'Can view CBK Contact',12,'view_cbkcontacts'),(49,'Can add Outgoing SMS',13,'add_outgoingsms'),(50,'Can change Outgoing SMS',13,'change_outgoingsms'),(51,'Can delete Outgoing SMS',13,'delete_outgoingsms'),(52,'Can view Outgoing SMS',13,'view_outgoingsms'),(53,'Can add Token',14,'add_token'),(54,'Can change Token',14,'change_token'),(55,'Can delete Token',14,'delete_token'),(56,'Can view Token',14,'view_token'),(57,'Can add Token',15,'add_tokenproxy'),(58,'Can change Token',15,'change_tokenproxy'),(59,'Can delete Token',15,'delete_tokenproxy'),(60,'Can view Token',15,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$5Y8uPwdSZqrZg0iowd77FP$TWbOkecM0pacXb9HS0i+VdaXZ0ivV8bGFlYiDRFGOqA=','2024-12-19 04:09:11.651255',1,'ehsan','','','ehsanulhaq09876@gmai.com',1,1,'2024-12-10 08:49:10.008124'),(2,'pbkdf2_sha256$870000$TCPPpNaUJZUi6loufFfFlP$Do6OLuAGPED6qqjj4bSXyY7K/vcf61kbtxdMuf54qKw=',NULL,0,'supervisor','','','',0,1,'2024-12-26 05:17:15.195484');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('624b21db01a50ba0c2d62ec57945e0c3bda1fa82','2024-12-19 04:52:49.716893',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbk_contacts`
--

DROP TABLE IF EXISTS `cbk_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cbk_contacts` (
  `contact_id` int NOT NULL,
  `credate` datetime(6) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `empstatus` varchar(200) DEFAULT NULL,
  `off_dir_id` bigint DEFAULT NULL,
  `off_ext_id` bigint DEFAULT NULL,
  `pascomm_id` bigint DEFAULT NULL,
  `defcomm_id` bigint DEFAULT NULL,
  `margala_id` bigint DEFAULT NULL,
  `confidential` bigint NOT NULL,
  `dashboard` bigint NOT NULL,
  `empstatus_id` bigint DEFAULT NULL,
  `curr_desg` varchar(200) DEFAULT NULL,
  `curr_grade_id` bigint NOT NULL,
  `category` bigint NOT NULL,
  `descr` longtext,
  `contact_addr` varchar(500) DEFAULT NULL,
  `curr_sbu_id` bigint NOT NULL,
  `curr_dept_id` bigint NOT NULL,
  `curr_sec_id` bigint NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `off_dir_temp` varchar(20) DEFAULT NULL,
  `mobile_temp` varchar(20) DEFAULT NULL,
  `staff_no` varchar(90) NOT NULL,
  `mobile_id` bigint DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `staff_no` (`staff_no`),
  CONSTRAINT `CBK_CONTACTS_staff_no_2782a853_fk_SW_HR_V_staff_no` FOREIGN KEY (`staff_no`) REFERENCES `sw_hr_v` (`staff_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbk_contacts`
--

LOCK TABLES `cbk_contacts` WRITE;
/*!40000 ALTER TABLE `cbk_contacts` DISABLE KEYS */;
INSERT INTO `cbk_contacts` VALUES (109,'2024-12-31 08:27:52.117842','dummyr@gmail.com',NULL,'1','Civilian',228,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,'',NULL,0,0,0,NULL,NULL,'+923345212848','201120',NULL),(110,'2024-12-31 07:26:49.824221','dummy@gmail.com',NULL,'1','Civilian',227,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,'',NULL,0,0,0,NULL,NULL,'+923345211878','401120',NULL),(112,'2024-12-31 08:28:29.468042',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,'',NULL,0,0,0,NULL,NULL,'+923445211848','128120',NULL),(115,'2024-12-31 08:29:23.966089',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,'',NULL,0,0,0,NULL,NULL,'+923345222848','129120',NULL),(116,'2024-12-31 08:28:55.046586',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,'',NULL,0,0,0,NULL,NULL,'+923345211948','124120',NULL),(117,'2024-12-31 08:29:48.064322',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,'',NULL,0,0,0,NULL,NULL,'+923345211949','125120',NULL),(160,'2018-03-08 11:30:37.000000',NULL,NULL,'1','Civilian Officer',143,NULL,NULL,NULL,NULL,0,0,2,NULL,0,0,NULL,NULL,0,0,0,NULL,'051-9052565','+923219553948','119401',961),(221,'2018-03-17 23:48:35.000000','irfan.shahid@nlc.com.pk',NULL,'1','Civilian',226,NULL,NULL,NULL,NULL,0,0,3,NULL,0,0,NULL,NULL,0,0,0,NULL,'051-9052565','+923345211848','120394',1010);
/*!40000 ALTER TABLE `cbk_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbk_numbers`
--

DROP TABLE IF EXISTS `cbk_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cbk_numbers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contactno` varchar(100) NOT NULL,
  `contact_type` varchar(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `credate` datetime(6) NOT NULL,
  `contact_type_id` int DEFAULT NULL,
  `del_status` varchar(1) NOT NULL,
  `category` int DEFAULT NULL,
  `contactno_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbk_numbers`
--

LOCK TABLES `cbk_numbers` WRITE;
/*!40000 ALTER TABLE `cbk_numbers` DISABLE KEYS */;
INSERT INTO `cbk_numbers` VALUES (1,'+923219553948',NULL,'1','2018-03-08 11:30:31.000000',5,'0',NULL,961),(2,'+923345211848',NULL,'1','2018-03-27 03:13:45.000000',5,'0',NULL,1010);
/*!40000 ALTER TABLE `cbk_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-12-11 06:08:20.138241','1','Eid Wishes',1,'[{\"added\": {}}]',11,1),(2,'2024-12-11 06:21:25.711251','1','ICT 18 above',1,'[{\"added\": {}}]',9,1),(3,'2024-12-11 06:26:37.589246','2','Message to 03365660673',1,'[{\"added\": {}}]',13,1),(4,'2024-12-26 05:17:17.459392','2','supervisor',1,'[{\"added\": {}}]',4,1),(5,'2024-12-26 05:23:39.019872','2','Mr. Muhammad Amman Zaheer',2,'[]',10,1),(6,'2024-12-30 05:38:27.813428','2','Holiday Notification',1,'[{\"added\": {}}]',11,1),(7,'2024-12-30 08:56:01.491291','3','Muhammad Ehsan Ul Haq',1,'[{\"added\": {}}]',10,1),(8,'2024-12-30 08:56:55.426272','4','Iqra',1,'[{\"added\": {}}]',10,1),(9,'2024-12-30 08:57:41.781151','5','Mehmoona',1,'[{\"added\": {}}]',10,1),(10,'2024-12-30 08:58:16.851656','6','Ramsha',1,'[{\"added\": {}}]',10,1),(11,'2024-12-30 08:59:07.342985','7','Muhammad Ikram Ul Haq',1,'[{\"added\": {}}]',10,1),(12,'2024-12-30 08:59:55.503689','8','Ismael',1,'[{\"added\": {}}]',10,1),(13,'2024-12-30 09:02:55.046353','9','Rehmaan',1,'[{\"added\": {}}]',10,1),(14,'2024-12-30 09:03:35.334941','10','Imran',1,'[{\"added\": {}}]',10,1),(15,'2024-12-31 07:26:50.099910','110','Contact ID: 110 - Email: dummy@gmail.com',1,'[{\"added\": {}}]',12,1),(16,'2024-12-31 08:27:52.195964','109','Contact ID: 109 - Email: dummyr@gmail.com',1,'[{\"added\": {}}]',12,1),(17,'2024-12-31 08:28:29.487524','112','Contact ID: 112 - Email: N/A',1,'[{\"added\": {}}]',12,1),(18,'2024-12-31 08:28:55.046586','116','Contact ID: 116 - Email: N/A',1,'[{\"added\": {}}]',12,1),(19,'2024-12-31 08:29:23.984925','115','Contact ID: 115 - Email: N/A',1,'[{\"added\": {}}]',12,1),(20,'2024-12-31 08:29:48.064322','117','Contact ID: 117 - Email: N/A',1,'[{\"added\": {}}]',12,1),(21,'2024-12-31 08:30:45.415909','10','Imran',2,'[{\"changed\": {\"fields\": [\"Location code\"]}}]',10,1),(22,'2024-12-31 08:31:07.240435','9','Rehmaan',2,'[{\"changed\": {\"fields\": [\"Location code\"]}}]',10,1),(23,'2024-12-31 08:31:28.299745','8','Ismael',2,'[{\"changed\": {\"fields\": [\"Location code\"]}}]',10,1),(24,'2024-12-31 08:31:58.399483','7','Muhammad Ikram Ul Haq',2,'[{\"changed\": {\"fields\": [\"Location code\"]}}]',10,1),(25,'2024-12-31 08:32:08.638050','6','Ramsha',2,'[{\"changed\": {\"fields\": [\"Location code\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(14,'authtoken','token'),(15,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'smswebportal','branch'),(12,'smswebportal','cbkcontacts'),(8,'smswebportal','cbknumbers'),(9,'smswebportal','group'),(13,'smswebportal','outgoingsms'),(10,'smswebportal','sw_hr_v'),(11,'smswebportal','template');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-10 08:30:49.872179'),(2,'auth','0001_initial','2024-12-10 08:31:01.793633'),(3,'admin','0001_initial','2024-12-10 08:31:04.996572'),(4,'admin','0002_logentry_remove_auto_add','2024-12-10 08:31:05.121869'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-10 08:31:05.183911'),(6,'contenttypes','0002_remove_content_type_name','2024-12-10 08:31:06.621339'),(7,'auth','0002_alter_permission_name_max_length','2024-12-10 08:31:07.824406'),(8,'auth','0003_alter_user_email_max_length','2024-12-10 08:31:08.027518'),(9,'auth','0004_alter_user_username_opts','2024-12-10 08:31:08.090019'),(10,'auth','0005_alter_user_last_login_null','2024-12-10 08:31:09.168088'),(11,'auth','0006_require_contenttypes_0002','2024-12-10 08:31:09.277454'),(12,'auth','0007_alter_validators_add_error_messages','2024-12-10 08:31:09.355581'),(13,'auth','0008_alter_user_username_max_length','2024-12-10 08:31:10.293029'),(14,'auth','0009_alter_user_last_name_max_length','2024-12-10 08:31:11.433596'),(15,'auth','0010_alter_group_name_max_length','2024-12-10 08:31:11.636712'),(16,'auth','0011_update_proxy_permissions','2024-12-10 08:31:11.714834'),(17,'auth','0012_alter_user_first_name_max_length','2024-12-10 08:31:12.808529'),(18,'sessions','0001_initial','2024-12-10 08:31:13.511618'),(19,'smswebportal','0001_initial','2024-12-10 08:31:20.183160'),(20,'smswebportal','0002_rename_contact_no_cbknumbers_contactno','2024-12-10 08:37:32.868562'),(21,'smswebportal','0003_cbknumbers_contactno_id','2024-12-10 08:40:42.161414'),(22,'smswebportal','0004_cbkcontacts_mobile_id','2024-12-10 08:45:40.365607'),(23,'smswebportal','0005_remove_outgoingsms_template','2024-12-11 08:48:30.219713'),(24,'smswebportal','0006_remove_outgoingsms_group','2024-12-13 06:22:00.938114'),(25,'authtoken','0001_initial','2024-12-17 06:36:51.686689'),(26,'authtoken','0002_auto_20160226_1747','2024-12-17 06:36:52.510146'),(27,'authtoken','0003_tokenproxy','2024-12-17 06:36:52.730639'),(28,'authtoken','0004_alter_tokenproxy_options','2024-12-17 06:36:52.865934'),(29,'smswebportal','0010_clean_receiver_no_data','2024-12-17 06:56:34.290246'),(30,'smswebportal','0011_alter_outgoingsms_receiver_no','2024-12-17 06:56:41.088211'),(31,'smswebportal','0012_outgoingsms_sent_at','2024-12-30 07:20:54.384743'),(32,'smswebportal','0013_outgoingsms_status','2024-12-30 07:29:24.627091'),(33,'smswebportal','0014_remove_outgoingsms_status','2024-12-30 07:36:20.439643'),(34,'smswebportal','0015_outgoingsms_status','2024-12-30 07:40:05.928235'),(35,'smswebportal','0016_alter_outgoingsms_options_remove_outgoingsms_msg_and_more','2025-01-01 07:18:04.666471'),(36,'smswebportal','0017_alter_outgoingsms_senttime_alter_outgoingsms_status','2025-01-01 09:01:49.407135'),(37,'smswebportal','0018_remove_outgoingsms_senttime','2025-01-01 09:29:04.035828'),(38,'smswebportal','0019_outgoingsms_senttime','2025-01-01 09:31:06.238636');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ucj8b3xqhemgq6habtououoryykrgrpc','.eJxVjMsOwiAQRf-FtSE8ymNcuvcbyACDVA0kpV0Z_12bdKHbe865LxZwW2vYBi1hzuzMJDv9bhHTg9oO8h3brfPU27rMke8KP-jg157peTncv4OKo35rX2QhYQCys6gdGmFcNMlbkgA-YqRJE0nSCWSakhcSbCZhVVERFBn2_gDkZzfn:1tO7qZ:sX1L1-JCCiklBfRq015DpgvOsnzCdfOcBv18smz6voY','2025-01-02 04:09:11.856942');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ozekimessageout`
--

DROP TABLE IF EXISTS `ozekimessageout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ozekimessageout` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ERRORMSG` varchar(250) DEFAULT NULL,
  `MSGTYPE` varchar(160) DEFAULT NULL,
  `OPERATOR` varchar(120) DEFAULT NULL,
  `RECEIVEDTIME` varchar(100) DEFAULT NULL,
  `RECEIVER` varchar(30) DEFAULT NULL,
  `REFERENCE` varchar(100) DEFAULT NULL,
  `SENDER` varchar(30) DEFAULT NULL,
  `STAT` varchar(20) DEFAULT NULL,
  `MSG` varchar(500) DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL,
  `SENTTIME` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ozekimessageout`
--

LOCK TABLES `ozekimessageout` WRITE;
/*!40000 ALTER TABLE `ozekimessageout` DISABLE KEYS */;
INSERT INTO `ozekimessageout` VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(66,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(67,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(82,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(86,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(87,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(88,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(96,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(104,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(106,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(109,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(110,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(115,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(117,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(119,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending',NULL),(126,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Eid Mubarak !!!','sent',NULL),(127,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Eid Mubarak !!!','sent',NULL),(128,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(129,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(130,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(131,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(132,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(133,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(134,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(135,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(136,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(137,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(138,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(139,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(140,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(141,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(142,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(143,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(144,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(145,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(146,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(147,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(148,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(149,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(150,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(151,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(152,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(153,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(154,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(155,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(156,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(157,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(158,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(159,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(160,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(161,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(162,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(163,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(164,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(165,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(166,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(167,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(168,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(169,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(170,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(171,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(172,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(173,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(174,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(175,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(176,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(177,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(178,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(179,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(180,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(181,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(182,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(183,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(184,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(185,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(186,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(187,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(188,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(189,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(190,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(191,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(192,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(193,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(194,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(195,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(196,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(197,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(198,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(199,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent',NULL),(200,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'ehsan here','sent',NULL),(201,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(202,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(203,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(204,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(205,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(206,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(207,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(208,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Tomorrow will be Holiday !!!! Enjoy','sent','2025-01-01 09:54:50.667492'),(209,NULL,NULL,NULL,NULL,'+923345211848',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(210,NULL,NULL,NULL,NULL,'+923219553948',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(211,NULL,NULL,NULL,NULL,'+923345211949',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(212,NULL,NULL,NULL,NULL,'+923345222848',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(213,NULL,NULL,NULL,NULL,'+923345211948',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(214,NULL,NULL,NULL,NULL,'+923445211848',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(215,NULL,NULL,NULL,NULL,'+923345212848',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638'),(216,NULL,NULL,NULL,NULL,'+923345211878',NULL,NULL,NULL,'Ehsan here','send','2025-01-01 10:03:00.799638');
/*!40000 ALTER TABLE `ozekimessageout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smswebportal_branch`
--

DROP TABLE IF EXISTS `smswebportal_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smswebportal_branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_name` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smswebportal_branch`
--

LOCK TABLES `smswebportal_branch` WRITE;
/*!40000 ALTER TABLE `smswebportal_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `smswebportal_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smswebportal_group`
--

DROP TABLE IF EXISTS `smswebportal_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smswebportal_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smswebportal_group`
--

LOCK TABLES `smswebportal_group` WRITE;
/*!40000 ALTER TABLE `smswebportal_group` DISABLE KEYS */;
INSERT INTO `smswebportal_group` VALUES (1,'ICT 18 above','something special');
/*!40000 ALTER TABLE `smswebportal_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smswebportal_template`
--

DROP TABLE IF EXISTS `smswebportal_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smswebportal_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL,
  `template_content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smswebportal_template`
--

LOCK TABLES `smswebportal_template` WRITE;
/*!40000 ALTER TABLE `smswebportal_template` DISABLE KEYS */;
INSERT INTO `smswebportal_template` VALUES (1,'Eid Wishes','Eid Mubarak !!!'),(2,'Holiday Notification','Tomorrow will be Holiday !!!! Enjoy');
/*!40000 ALTER TABLE `smswebportal_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sw_hr_v`
--

DROP TABLE IF EXISTS `sw_hr_v`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sw_hr_v` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staff_no` varchar(90) NOT NULL,
  `staff_name` varchar(150) NOT NULL,
  `job_desc` longtext NOT NULL,
  `organization_desc` varchar(450) NOT NULL,
  `location_code` varchar(180) NOT NULL,
  `grade_desc` varchar(180) NOT NULL,
  `group_name` varchar(720) NOT NULL,
  `nlc_type` varchar(450) NOT NULL,
  `emp_type` varchar(33) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_no` (`staff_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sw_hr_v`
--

LOCK TABLES `sw_hr_v` WRITE;
/*!40000 ALTER TABLE `sw_hr_v` DISABLE KEYS */;
INSERT INTO `sw_hr_v` VALUES (1,'120394','Mr. Muhammad Irfan Shahid','ICTO - Developer','HQ NLC','0107-ICT Branch HQ NLC Rwp','NLC-16','CIV STAFF.Employee','Contract','Employee'),(2,'119401','Mr. Muhammad Amman Zaheer','Assistant Manager Developer','HQ NLC','0107-ICT Branch HQ NLC Rwp','NLC-17','CIV OFFR.Employee','Contract','Employee'),(3,'127120','Muhammad Ehsan Ul Haq','Internee','HQ NLC','0107-ICT Branch HQ NLC Rwp','NLC-17','CIV OFFR.Employee','Contract','Employee'),(4,'121120','Iqra','Developer','HQ NLC','0107-ICT Branch HQ NLC Rwp','NLC-17','CIV OFFR.Employee','Contract','Employee'),(5,'125120','Mehmoona','Developer','HQ NLC','0107-ICT Branch HQ NLC Rwp','NLC-17','CIV OFFR.Employee','Contract','Employee'),(6,'129120','Ramsha','Developer','HQ NLC','Finance','NLC-17','CIV OFFR.Employee','Contract','Employee'),(7,'124120','Muhammad Ikram Ul Haq','Medical Supredent','HQ NLC','Finance','NLC-17','CIV OFFR.Employee','Contract','Employee'),(8,'128120','Ismael','Developer','HQ NLC','HR Branch','NLC-17','CIV OFFR.Employee','Contract','Employee'),(9,'201120','Rehmaan','Operator','HQ NLC','HR Branch','NLC-17','CIV OFFR.Employee','Contract','Employee'),(10,'401120','Imran','Scientist','HQ NLC','HR Branch','NLC-17','CIV OFFR.Employee','Contract','Employee');
/*!40000 ALTER TABLE `sw_hr_v` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 10:30:47
