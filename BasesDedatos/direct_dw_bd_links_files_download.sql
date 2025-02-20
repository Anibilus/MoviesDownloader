-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: direct_dw_bd
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
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality_id` int DEFAULT NULL,
  `episode_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `server_id` (`server_id`),
  KEY `quality_id` (`quality_id`),
  KEY `links_files_download_ibfk_4` (`episode_id`),
  CONSTRAINT `links_files_download_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `media_downloads` (`id`),
  CONSTRAINT `links_files_download_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`),
  CONSTRAINT `links_files_download_ibfk_3` FOREIGN KEY (`quality_id`) REFERENCES `qualities` (`quality_id`),
  CONSTRAINT `links_files_download_ibfk_4` FOREIGN KEY (`episode_id`) REFERENCES `series_episodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links_files_download`
--

LOCK TABLES `links_files_download` WRITE;
/*!40000 ALTER TABLE `links_files_download` DISABLE KEYS */;
INSERT INTO `links_files_download` VALUES (4,10,10,'Audio Latino','https://powvideo.org/embed-q2t6dhnjpbbz-920x560.html',2,NULL),(5,10,11,'Audio Latino','https://hqq.tv/player/embed_player.php?vid=xlfESLwdItiC&autoplay=no',2,NULL),(6,11,10,'Subtítulo Español','https://powvideo.org/embed-ivaiq45vvvn3-920x560.html',2,NULL),(7,11,13,'Subtítulo Español','https://streamplay.to/embed-lsijgdmcpjbs-920x560.html',2,NULL),(8,12,10,'Subtítulo Español','https://powvideo.org/embed-u8ypjn94lsdp-920x560.html',2,NULL),(9,12,10,'Subtítulo Español','https://powvideo.org/embed-nawfpzkx4smn-920x560.html',2,NULL),(10,12,13,'Subtítulo Español','https://streamplay.to/embed-pptt8afewfb2-920x560.html',2,NULL),(11,12,11,'Subtítulo Español','https://hqq.tv/player/embed_player.php?vid=KvprcQblAmeJ&autoplay=no',2,NULL),(12,12,11,'Subtítulo Español','https://hqq.tv/player/embed_player.php?vid=2ZtJMHe9TZOa&autoplay=no',2,NULL),(13,14,10,'Audio Latino','https://powvideo.org/embed-q2t6dhnjpbbz-920x560.html',2,NULL),(14,14,11,'Audio Latino','https://hqq.tv/player/embed_player.php?vid=xlfESLwdItiC&autoplay=no',2,NULL),(15,15,10,'Subtítulo Español','https://powvideo.org/embed-ivaiq45vvvn3-920x560.html',2,NULL),(16,15,13,'Subtítulo Español','https://streamplay.to/embed-lsijgdmcpjbs-920x560.html',2,NULL),(17,16,10,'Subtítulo Español','https://powvideo.org/embed-nawfpzkx4smn-920x560.html',2,NULL),(18,16,10,'Subtítulo Español','https://powvideo.org/embed-u8ypjn94lsdp-920x560.html',2,NULL),(19,16,13,'Subtítulo Español','https://streamplay.to/embed-pptt8afewfb2-920x560.html',2,NULL),(20,16,11,'Subtítulo Español','https://hqq.tv/player/embed_player.php?vid=2ZtJMHe9TZOa&autoplay=no',2,NULL),(21,16,11,'Subtítulo Español','https://hqq.tv/player/embed_player.php?vid=KvprcQblAmeJ&autoplay=no',2,NULL),(22,17,10,'Audio Latino','https://powvideo.org/embed-ir4bxfaeha8f-920x560.html',2,NULL),(23,18,10,'Audio Latino','https://powvideo.org/embed-h8516talbc7m-920x560.html',2,NULL),(24,18,11,'Audio Latino','https://hqq.tv/player/embed_player.php?vid=okSF8fXuajiU&autoplay=no',2,NULL),(25,18,11,'Audio Latino','https://hqq.tv/player/embed_player.php?vid=yFM6BHxCsE3e&autoplay=no',2,NULL),(26,19,10,'Audio Español','https://powvideo.org/embed-cv9qxk5heiwt-920x560.html',2,NULL),(27,19,10,'Audio Español','https://powvideo.org/embed-uv69kwdh46m7-920x560.html',2,NULL),(28,19,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=ZqWfpEStKj8I&autoplay=no',2,NULL),(89,NULL,10,'Audio Español','https://powvideo.org/embed-pefd0k2mr0q0-920x560.html',2,320),(90,NULL,10,'Audio Español','https://powvideo.org/embed-0an35rz281di-920x560.html',2,320),(91,NULL,98,'Audio Español','https://vidmoly.to/embed-9hm2tcldccra-920x360.html',2,320),(92,NULL,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=RItUUChT1qhd&autoplay=no',2,320),(93,NULL,10,'Audio Español','https://powvideo.org/embed-vxp0h8umxomi-920x560.html',2,321),(94,NULL,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=VMEok8TJX4Zz&autoplay=no',2,321),(95,NULL,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=C14aoSxAfS4K&autoplay=no',2,322),(96,NULL,10,'Audio Español','https://powvideo.org/embed-3xh1q7o7enpc-920x560.html',2,323),(97,NULL,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=9fRIXMrQ8ik8&autoplay=no',2,323),(98,NULL,10,'Audio Español','https://powvideo.org/embed-zmn3voxxcnbv-920x560.html',2,324),(99,NULL,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=WuMns4Z9Nmwc&autoplay=no',2,324),(100,NULL,10,'Audio Español','https://powvideo.org/embed-elisyv44ee1w-920x560.html',2,325),(101,NULL,11,'Audio Español','https://hqq.tv/player/embed_player.php?vid=DrS11mX3YkaV&autoplay=no',2,325);
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

-- Dump completed on 2025-02-19  1:13:23
