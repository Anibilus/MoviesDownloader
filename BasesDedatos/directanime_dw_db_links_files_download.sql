-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: directanime_dw_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `links_files_download`
--

DROP TABLE IF EXISTS `links_files_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links_files_download` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `server_id` int DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `episode_id` int DEFAULT NULL,
  `quality` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1080P',
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `server_id` (`server_id`),
  KEY `links_files_download_ibfk_4` (`episode_id`),
  CONSTRAINT `links_files_download_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `media_downloads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `links_files_download_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `links_files_download_ibfk_4` FOREIGN KEY (`episode_id`) REFERENCES `series_episodes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links_files_download`
--

LOCK TABLES `links_files_download` WRITE;
/*!40000 ALTER TABLE `links_files_download` DISABLE KEYS */;
INSERT INTO `links_files_download` VALUES (38,111,41,NULL,'https://streamwish.to/e/zpthl7gv9ccp',NULL,'1080P'),(39,111,40,NULL,'https://www.yourupload.com/embed/Shcw1f0vyDFt',NULL,'1080P'),(40,112,41,NULL,'https://streamwish.to/e/6y0cg4r6yh0p',NULL,'1080P'),(41,112,40,NULL,'https://www.yourupload.com/embed/0jRD338ap54v',NULL,'1080P'),(42,111,37,NULL,'https://mega.nz/#!dTMnVIgT!-q8EiRGagkG0TXSZwBHkxyefmcmVk8IMG7JwUPcZNgo',NULL,'1080P'),(43,111,38,NULL,'https://1fichier.com/?rjrpae26veylfo9ld0h5',NULL,'1080P'),(44,111,41,NULL,'https://streamwish.to/e/zpthl7gv9ccp',NULL,'1080P'),(45,111,40,NULL,'https://www.yourupload.com/embed/Shcw1f0vyDFt',NULL,'1080P'),(46,112,41,NULL,'https://streamwish.to/e/6y0cg4r6yh0p',NULL,'1080P'),(47,112,40,NULL,'https://www.yourupload.com/embed/0jRD338ap54v',NULL,'1080P'),(48,111,41,NULL,'https://streamwish.to/e/zpthl7gv9ccp',NULL,'1080P'),(49,111,40,NULL,'https://www.yourupload.com/embed/Shcw1f0vyDFt',NULL,'1080P'),(50,112,41,NULL,'https://streamwish.to/e/6y0cg4r6yh0p',NULL,'1080P'),(51,112,40,NULL,'https://www.yourupload.com/embed/0jRD338ap54v',NULL,'1080P'),(52,111,41,NULL,'https://streamwish.to/e/zpthl7gv9ccp',NULL,'1080P'),(53,111,40,NULL,'https://www.yourupload.com/embed/Shcw1f0vyDFt',NULL,'1080P'),(54,112,41,NULL,'https://streamwish.to/e/6y0cg4r6yh0p',NULL,'1080P'),(55,112,40,NULL,'https://www.yourupload.com/embed/0jRD338ap54v',NULL,'1080P'),(56,111,37,NULL,'https://mega.nz/#!dTMnVIgT!-q8EiRGagkG0TXSZwBHkxyefmcmVk8IMG7JwUPcZNgo',NULL,'1080P'),(57,111,38,NULL,'https://1fichier.com/?rjrpae26veylfo9ld0h5',NULL,'1080P'),(58,111,41,NULL,'https://streamwish.to/e/zpthl7gv9ccp',NULL,'1080P'),(59,111,40,NULL,'https://www.yourupload.com/embed/Shcw1f0vyDFt',NULL,'1080P'),(60,112,41,NULL,'https://streamwish.to/e/6y0cg4r6yh0p',NULL,'1080P'),(61,112,40,NULL,'https://www.yourupload.com/embed/0jRD338ap54v',NULL,'1080P'),(62,111,37,NULL,'https://mega.nz/#!dTMnVIgT!-q8EiRGagkG0TXSZwBHkxyefmcmVk8IMG7JwUPcZNgo',NULL,'1080P'),(63,111,38,NULL,'https://1fichier.com/?rjrpae26veylfo9ld0h5',NULL,'1080P'),(64,111,41,NULL,'https://streamwish.to/e/zpthl7gv9ccp',NULL,'1080P'),(65,111,40,NULL,'https://www.yourupload.com/embed/Shcw1f0vyDFt',NULL,'1080P'),(66,112,37,NULL,'https://mega.nz/#!dK9XQDLD!je3bzZykkK4vYBAtv6_JyuxRrOEoLtRWoTcju8dDNAc',NULL,'1080P'),(67,112,38,NULL,'https://1fichier.com/?e63flmdqmalz2p1j1gdu',NULL,'1080P'),(68,112,41,NULL,'https://streamwish.to/e/6y0cg4r6yh0p',NULL,'1080P'),(69,112,40,NULL,'https://www.yourupload.com/embed/0jRD338ap54v',NULL,'1080P'),(70,141,37,NULL,'https://mega.nz/#!cfkhlJQR!4XGfOh40IBJQ82Dm2XVzHU0Jfl5hOUGNGy6Y_COMMfA',NULL,'1080P'),(71,141,38,NULL,'https://1fichier.com/?9x8tdvstnbx38po8jskb',NULL,'1080P'),(72,141,41,NULL,'https://www.yourupload.com/embed/bGXd62yghbVW',NULL,'1080P'),(73,141,40,NULL,'https://streamwish.to/e/mcvt99eesos4',NULL,'1080P'),(74,149,37,NULL,'https://mega.nz/#!wL10AZQT!Mo1BSeGSMUE-lDy1k1Wf8UkdKKQD7VMOoLj42yI14Dk',NULL,'1080P'),(75,149,38,NULL,'https://1fichier.com/?fbnokzusgr7djmfp00sw',NULL,'1080P'),(76,149,41,NULL,'https://www.yourupload.com/embed/34ySs21s855n',NULL,'1080P'),(77,149,40,NULL,'https://streamwish.to/e/wniyvdd0czet',NULL,'1080P'),(78,150,37,NULL,'https://mega.nz/#!gXcTQJLC!nW6tZgBG4hf9u67_NZHKA2k6DOLa7WoIfG1uO-LIvac',NULL,'1080P'),(79,150,38,NULL,'https://1fichier.com/?nqn4h2v7i23rd4jx4l8s',NULL,'1080P'),(80,150,41,NULL,'https://streamwish.to/e/omv8ps9if6oq',NULL,'1080P'),(81,150,40,NULL,'https://www.yourupload.com/embed/13yjV6qngpsq',NULL,'1080P');
/*!40000 ALTER TABLE `links_files_download` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  1:13:22
