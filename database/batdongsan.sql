-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: bat_dong_san
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `assignmentbuilding` (
                                      `buildingid` bigint(20) NOT NULL,
                                      `staffid` bigint(20) NOT NULL,
                                      KEY `FKf4ibbod44h32ao1o6pb4yq98p` (`staffid`),
                                      KEY `FKkk3mdegrmfcdlsxqds1m6q238` (`buildingid`),
                                      CONSTRAINT `FKf4ibbod44h32ao1o6pb4yq98p` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`),
                                      CONSTRAINT `FKkk3mdegrmfcdlsxqds1m6q238` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `assignmentcustomer` (
                                      `customerid` bigint(20) NOT NULL,
                                      `staffid` bigint(20) NOT NULL,
                                      KEY `FKco26n95l1hpuq1suv0briljor` (`staffid`),
                                      KEY `FK4sygo3a6twd6tkay7em8f1lgg` (`customerid`),
                                      CONSTRAINT `FK4sygo3a6twd6tkay7em8f1lgg` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
                                      CONSTRAINT `FKco26n95l1hpuq1suv0briljor` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (2,2);
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `building` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `createdby` varchar(255) DEFAULT NULL,
                            `createddate` datetime DEFAULT NULL,
                            `modifiedby` varchar(255) DEFAULT NULL,
                            `modifieddate` datetime DEFAULT NULL,
                            `brokeragetee` double DEFAULT NULL,
                            `type` varchar(255) DEFAULT NULL,
                            `carfee` varchar(255) DEFAULT NULL,
                            `decorationtime` varchar(255) DEFAULT NULL,
                            `deposit` varchar(255) DEFAULT NULL,
                            `direction` varchar(255) DEFAULT NULL,
                            `district` varchar(255) DEFAULT NULL,
                            `electricityfee` varchar(255) DEFAULT NULL,
                            `floorarea` int(11) DEFAULT NULL,
                            `level` varchar(255) DEFAULT NULL,
                            `managername` varchar(255) DEFAULT NULL,
                            `managerphone` varchar(255) DEFAULT NULL,
                            `motofee` varchar(255) DEFAULT NULL,
                            `name` varchar(255) DEFAULT NULL,
                            `note` varchar(255) DEFAULT NULL,
                            `numberofbasement` int(11) DEFAULT NULL,
                            `overtimefee` varchar(255) DEFAULT NULL,
                            `payment` varchar(255) DEFAULT NULL,
                            `rentprice` int(11) DEFAULT NULL,
                            `rentpricedescription` varchar(255) DEFAULT NULL,
                            `renttime` varchar(255) DEFAULT NULL,
                            `servicefee` varchar(255) DEFAULT NULL,
                            `street` varchar(255) DEFAULT NULL,
                            `structure` varchar(255) DEFAULT NULL,
                            `ward` varchar(255) DEFAULT NULL,
                            `waterfee` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (16,NULL,NULL,'nguyenvana','2022-07-16 13:14:22',NULL,'NOI_THAT,NGUYEN_CAN','','','','','QUAN_SON_TRA','',2077,'','','','','Hiyori Garden Tower Đà Nẵng',NULL,2,'','',NULL,NULL,'','','Lô 2, A2 Võ Văn Kiệt','','Phường An Hải Đông',NULL),(17,'nguyenvana','2022-07-16 12:21:45','nguyenvana','2022-07-16 12:21:45',NULL,'NOI_THAT,TANG_TRET','','','','','QUAN_SON_TRA','',8967,'','','','','Monarchy Đà Nẵng',NULL,2,'','',NULL,NULL,'','','Đường Trần Hưng Đạo','','Phường An Hải Bắc',NULL),(18,'nguyenvana','2022-07-16 12:24:02','nguyenvana','2022-07-16 12:24:02',NULL,'NGUYEN_CAN','','','','','QUAN_HAI_CHAU','',9641,'','','','','Risemount Đà Nẵng',NULL,2,'','',NULL,NULL,'','','Lô A2 – đường Như Nguyệt','','phường Thuận Phước',NULL),(19,'nguyenvana','2022-07-16 12:27:53','nguyenvana','2022-07-16 12:27:53',NULL,'NOI_THAT,TANG_TRET,NGUYEN_CAN','','','','','QUAN_SON_TRA','',3379,'','','','','Ocean View Đà Nẵng',NULL,3,'','',NULL,NULL,'','','Ngô Quyền','','Phường An Hải Tây',NULL),(20,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',NULL,'NOI_THAT,TANG_TRET,NGUYEN_CAN','','','','','QUAN_SON_TRA','',22000,'','','','','Wyndham Soleil Đà Nẵng',NULL,4,'','',NULL,NULL,'','','Số 02 Phạm Văn Đồng, Võ Nguyên Giáp','','Phước Mỹ',NULL),(21,'nguyenvana','2022-07-16 12:32:40','nguyenvana','2022-07-16 12:32:40',NULL,'TANG_TRET,NGUYEN_CAN','','','','','QUAN_HAI_CHAU','',3125,'','','','','The Royal Đà Nẵng',NULL,2,'','',NULL,NULL,'','','Đường Bạch Đằng','','phường Bình Thuận',NULL),(22,'nguyenvana','2022-07-16 12:34:05','nguyenvana','2022-07-16 12:34:05',NULL,'NGUYEN_CAN','','','','','QUAN_SON_TRA','',3966,'','','','','Premier Sky Residences',NULL,1,'','',NULL,NULL,'','','Đường Võ Nguyên Giáp','','phường Phước Mỹ',NULL),(23,'nguyenvana','2022-07-16 12:36:45','nguyenvana','2022-07-16 12:36:45',NULL,'NOI_THAT,TANG_TRET,NGUYEN_CAN','','','','','QUAN_NGU_HANH_SON','',11550,'','','','','Golf View Luxury Apartment',NULL,3,'','',NULL,NULL,'','','Đường Trường Sa','','phường Hoà Hải',NULL),(24,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',NULL,'NOI_THAT,TANG_TRET,NGUYEN_CAN','','','','','QUAN_NGU_HANH_SON','',10000,'','','','','Mường Thanh Luxury Đà Nẵng',NULL,3,'','',NULL,NULL,'','','270 Võ Nguyên Giáp','','Bắc Mỹ Phú',NULL),(25,'nguyenvana','2022-07-16 12:45:24','nguyenvana','2022-07-16 12:45:24',NULL,'NGUYEN_CAN','','','','','QUAN_SON_TRA','',4591,'','','','','Vinpearl Condotel Riverfront',NULL,3,'','',NULL,NULL,'','','341 Đ. Trần Hưng Đạo','',' An Hải Bắc',NULL),(26,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',NULL,'TANG_TRET,NGUYEN_CAN','','','','','QUAN_SON_TRA','',3238,'','','','','Azura Apartments Đà Nẵng',NULL,1,'','',NULL,NULL,'','','Trần Hưng Đạo','','phường An Hải Bắc',NULL),(27,'nguyenvana','2022-07-16 12:53:50','nguyenvana','2022-07-16 12:53:50',NULL,'NOI_THAT,TANG_TRET,NGUYEN_CAN','','','','2','QUAN_HAI_CHAU','',3728,'','','','','Novotel Đà Nẵng Premier Han River',NULL,NULL,'','',NULL,NULL,'','','36 Bạch Đằng','','Hòa Thuận Đông',NULL),(28,'nguyenvana','2022-07-16 12:58:37','nguyenvana','2022-07-16 12:58:37',NULL,'NOI_THAT,NGUYEN_CAN','','','','','QUAN_SON_TRA','',80000,'','','','','Four Points by Sheraton Đà Nẵng',NULL,5,'','',NULL,NULL,'','','Đường Võ Nguyên Giáp','','Mỹ An',NULL),(29,'nguyenvana','2022-07-16 13:02:06','nguyenvana','2022-07-16 13:02:06',NULL,'TANG_TRET,NGUYEN_CAN','','','','','QUAN_NGU_HANH_SON','',68334,'','','','','Cocobay Carinae Hotel Cor4',NULL,1,'','',NULL,NULL,'','','Trường Sa','','Hoà Hải',NULL),(30,'nguyenvana','2022-07-16 13:04:43','nguyenvana','2022-07-16 13:04:43',NULL,'NOI_THAT,TANG_TRET,NGUYEN_CAN','','','','','QUAN_SON_TRA','',3800,'','','','','Đà Nẵng Golden Bay Hotel',NULL,3,'','',NULL,NULL,'','','Lê Văn Duyệt','','Nại Hiên Đông',NULL);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `createdby` varchar(255) DEFAULT NULL,
                            `createddate` datetime DEFAULT NULL,
                            `modifiedby` varchar(255) DEFAULT NULL,
                            `modifieddate` datetime DEFAULT NULL,
                            `email` varchar(255) DEFAULT NULL,
                            `fullname` varchar(255) DEFAULT NULL,
                            `phone` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,NULL,NULL,'nguyenvana','2022-07-16 01:23:55','trongnghia161001@gmail.com','Nguyễn Trọng Nghĩa','0328441828');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `rentarea` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `createdby` varchar(255) DEFAULT NULL,
                            `createddate` datetime DEFAULT NULL,
                            `modifiedby` varchar(255) DEFAULT NULL,
                            `modifieddate` datetime DEFAULT NULL,
                            `value` int(11) DEFAULT NULL,
                            `buildingid` bigint(20) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `FKqhqoxlvm1iblaew5s0v8n3ut4` (`buildingid`),
                            CONSTRAINT `FKqhqoxlvm1iblaew5s0v8n3ut4` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (16,'nguyenvana','2022-07-16 12:21:45','nguyenvana','2022-07-16 12:21:45',50,17),(17,'nguyenvana','2022-07-16 12:21:45','nguyenvana','2022-07-16 12:21:45',100,17),(18,'nguyenvana','2022-07-16 12:21:45','nguyenvana','2022-07-16 12:21:45',150,17),(19,'nguyenvana','2022-07-16 12:24:02','nguyenvana','2022-07-16 12:24:02',43,18),(20,'nguyenvana','2022-07-16 12:24:02','nguyenvana','2022-07-16 12:24:02',55,18),(21,'nguyenvana','2022-07-16 12:24:02','nguyenvana','2022-07-16 12:24:02',60,18),(22,'nguyenvana','2022-07-16 12:24:02','nguyenvana','2022-07-16 12:24:02',124,18),(23,'nguyenvana','2022-07-16 12:27:53','nguyenvana','2022-07-16 12:27:53',46,19),(24,'nguyenvana','2022-07-16 12:27:53','nguyenvana','2022-07-16 12:27:53',96,19),(25,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',34,20),(26,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',43,20),(27,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',60,20),(28,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',102,20),(29,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',98,20),(30,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',132,20),(31,'nguyenvana','2022-07-16 12:30:55','nguyenvana','2022-07-16 12:30:55',162,20),(32,'nguyenvana','2022-07-16 12:32:40','nguyenvana','2022-07-16 12:32:40',59,21),(33,'nguyenvana','2022-07-16 12:32:40','nguyenvana','2022-07-16 12:32:40',73,21),(34,'nguyenvana','2022-07-16 12:32:40','nguyenvana','2022-07-16 12:32:40',80,21),(35,'nguyenvana','2022-07-16 12:32:40','nguyenvana','2022-07-16 12:32:40',103,21),(36,'nguyenvana','2022-07-16 12:34:05','nguyenvana','2022-07-16 12:34:05',58,22),(37,'nguyenvana','2022-07-16 12:34:05','nguyenvana','2022-07-16 12:34:05',110,22),(38,'nguyenvana','2022-07-16 12:36:45','nguyenvana','2022-07-16 12:36:45',42,23),(39,'nguyenvana','2022-07-16 12:36:45','nguyenvana','2022-07-16 12:36:45',108,23),(40,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',49,24),(41,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',46,24),(42,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',50,24),(43,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',84,24),(44,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',58,24),(45,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',68,24),(46,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',59,24),(47,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',80,24),(48,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',60,24),(49,'nguyenvana','2022-07-16 12:42:03','nguyenvana','2022-07-16 12:42:03',97,24),(50,'nguyenvana','2022-07-16 12:45:24','nguyenvana','2022-07-16 12:45:24',42,25),(51,'nguyenvana','2022-07-16 12:45:24','nguyenvana','2022-07-16 12:45:24',54,25),(52,'nguyenvana','2022-07-16 12:45:24','nguyenvana','2022-07-16 12:45:24',62,25),(53,'nguyenvana','2022-07-16 12:45:24','nguyenvana','2022-07-16 12:45:24',100,25),(54,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',64,26),(55,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',99107,26),(56,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',114,26),(57,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',158,26),(58,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',166,26),(59,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',193,26),(60,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',222,26),(61,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',279,26),(62,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',282,26),(63,'nguyenvana','2022-07-16 12:50:08','nguyenvana','2022-07-16 12:50:08',445,26),(64,'nguyenvana','2022-07-16 12:53:50','nguyenvana','2022-07-16 12:53:50',98,27),(65,'nguyenvana','2022-07-16 12:53:50','nguyenvana','2022-07-16 12:53:50',125,27),(66,'nguyenvana','2022-07-16 12:53:50','nguyenvana','2022-07-16 12:53:50',157,27),(67,'nguyenvana','2022-07-16 12:53:50','nguyenvana','2022-07-16 12:53:50',200,27),(68,'nguyenvana','2022-07-16 12:58:37','nguyenvana','2022-07-16 12:58:37',60,28),(69,'nguyenvana','2022-07-16 12:58:37','nguyenvana','2022-07-16 12:58:37',100,28),(70,'nguyenvana','2022-07-16 13:02:06','nguyenvana','2022-07-16 13:02:06',100,29),(71,'nguyenvana','2022-07-16 13:02:06','nguyenvana','2022-07-16 13:02:06',200,29),(72,'nguyenvana','2022-07-16 13:02:06','nguyenvana','2022-07-16 13:02:06',300,29),(73,'nguyenvana','2022-07-16 13:02:06','nguyenvana','2022-07-16 13:02:06',400,29),(74,'nguyenvana','2022-07-16 13:04:43','nguyenvana','2022-07-16 13:04:43',34,30),(75,'nguyenvana','2022-07-16 13:04:43','nguyenvana','2022-07-16 13:04:43',45,30),(76,'nguyenvana','2022-07-16 13:04:43','nguyenvana','2022-07-16 13:04:43',65,30),(83,'nguyenvana','2022-07-16 13:14:22','nguyenvana','2022-07-16 13:14:22',100,16),(84,'nguyenvana','2022-07-16 13:14:22','nguyenvana','2022-07-16 13:14:22',110,16),(85,'nguyenvana','2022-07-16 13:14:22','nguyenvana','2022-07-16 13:14:22',120,16);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
                        `id` bigint(20) NOT NULL AUTO_INCREMENT,
                        `createdby` varchar(255) DEFAULT NULL,
                        `createddate` datetime DEFAULT NULL,
                        `modifiedby` varchar(255) DEFAULT NULL,
                        `modifieddate` datetime DEFAULT NULL,
                        `code` varchar(255) NOT NULL,
                        `name` varchar(255) NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UK_c36say97xydpmgigg38qv5l2p` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,NULL,NULL,NULL,'manager','Quản trị hệ thống'),(2,NULL,NULL,NULL,NULL,'staff','Nhân viên');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `createdby` varchar(255) DEFAULT NULL,
                               `createddate` datetime DEFAULT NULL,
                               `modifiedby` varchar(255) DEFAULT NULL,
                               `modifieddate` datetime DEFAULT NULL,
                               `code` varchar(255) DEFAULT NULL,
                               `note` varchar(255) DEFAULT NULL,
                               `staffid` bigint(20) DEFAULT NULL,
                               `customerid` bigint(20) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FKldobv9jeuxje0fjqnhrw6e23v` (`customerid`),
                               CONSTRAINT `FKldobv9jeuxje0fjqnhrw6e23v` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (4,'nguyenvanb','2022-07-15 15:18:13','nguyenvanb','2022-07-15 15:18:13','CSKH','Đã gọi điện',NULL,2),(5,'nguyenvanb','2022-07-15 15:18:27','nguyenvanb','2022-07-15 15:18:27','CSKH','Đã tư vấn',NULL,2),(6,'nguyenvanb','2022-07-15 15:18:52','nguyenvanb','2022-07-15 15:18:52','DĐX','Đi xem tòa nhà Mường Thanh',NULL,2);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
                        `id` bigint(20) NOT NULL AUTO_INCREMENT,
                        `createdby` varchar(255) DEFAULT NULL,
                        `createddate` datetime DEFAULT NULL,
                        `modifiedby` varchar(255) DEFAULT NULL,
                        `modifieddate` datetime DEFAULT NULL,
                        `email` varchar(255) DEFAULT NULL,
                        `fullname` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `status` int(11) NOT NULL,
                        `username` varchar(255) NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
                        UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,'nguyenvana','2022-07-15 22:57:29',NULL,'Nguyễn Văn A','$2a$10$eqwVlVuDTU2gYBVgXv5kdukPbSzev9/fgpcnciDcZDwwEU3YcZMGe',1,'nguyenvana'),(2,NULL,NULL,'nguyenvana','2022-07-15 16:16:26',NULL,'Nguyễn Văn B','$2a$10$cx223SS0AyheSfXYm0H2HOUP9rHmhafvgAdPLSEz1OE84mBkrh6M6',1,'nguyenvanb'),(3,NULL,NULL,'nguyenvana','2022-07-15 16:14:30',NULL,'Nguyễn Văn C','$2a$10$4eaBI2d5qDFtqHdOvshoZucD0oGYbeHKigHjiN9HM3LXSeGt1vjny',1,'nguyenvanc'),(4,NULL,NULL,'nguyenvana','2022-07-10 15:44:49',NULL,'Nguyễn Văn D','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',0,'nguyenvand'),(7,'nguyenvana','2022-07-15 22:23:27','nguyenvana','2022-07-15 23:03:06',NULL,'Nguyễn Văn E','$2a$10$Ed82UI/24ag9OkFQuP07Z.cgQ6ivY/Uy4AToWhOegDJ7TJ7TaYWD6',0,'nguyenvane'),(8,NULL,NULL,'nguyenvana','2022-07-15 23:03:06',NULL,'Nguyễn Văn F','$2a$10$UawU62ieUh17T3xC7/Hlru/lfI2xM/CG.WU5rvck/PeVupxbT9eOm',0,'nguyenvanf'),(9,'nguyenvana','2022-07-15 23:03:25','nguyenvana','2022-07-15 23:03:25',NULL,'Nguyễn Văn H','$2a$10$tuTFX.odKeax5EpI75COveslSPmkn35aONGalt7GSNbnBzuWmFwOa',1,'nguyenvanh'),(10,'nguyenvana','2022-07-15 23:17:04','nguyenvana','2022-07-15 23:17:04',NULL,'Nguyễn Hoài Yến','$2a$10$5d34p05gUBBFJDlm3Ia3busNi08DtrGggWf65.EnxDJgVFW.k4dCu',1,'nguyenhoaiyen');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
                             `user_id` bigint(20) NOT NULL,
                             `role_id` bigint(20) NOT NULL,
                             KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
                             KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
                             CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
                             CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (3,2),(4,2),(2,2),(7,2),(1,1),(8,2),(9,2),(10,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-23  0:00:27
