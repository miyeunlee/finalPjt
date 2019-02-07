-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: StudyRepublic
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `admin_comment`
--

DROP TABLE IF EXISTS `admin_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_comment` (
  `admin_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(15) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`admin_comment_id`),
  KEY `admin_comment_member_id_fk` (`id`),
  CONSTRAINT `admin_comment_member_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_comment`
--

LOCK TABLES `admin_comment` WRITE;
/*!40000 ALTER TABLE `admin_comment` DISABLE KEYS */;
INSERT INTO `admin_comment` VALUES (1,'aaa123','내용1','2019-01-14'),(2,'bbb123','내용2','2019-01-14'),(3,'ccc123','내용3','2019-01-14'),(4,'ddd123','내용4','2019-01-14');
/*!40000 ALTER TABLE `admin_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career_cd`
--

DROP TABLE IF EXISTS `career_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `career_cd` (
  `CAREER_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(30) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(30) NOT NULL,
  PRIMARY KEY (`CAREER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='경력코드테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career_cd`
--

LOCK TABLES `career_cd` WRITE;
/*!40000 ALTER TABLE `career_cd` DISABLE KEYS */;
INSERT INTO `career_cd` VALUES ('DA','DATABASE,DBA','데이터베이스, DBA'),('ER','ERP,DESIGN_SYSTEM_ANALYSIS','ERP,시스템분석설계'),('MO','MOBILE','모바일'),('PA','PROGRAMMATION_APPLICATION','응용프로그램개발'),('PU','PROGRAMMATION_UI','퍼블리싱,UI개발'),('PW','PROGRAMMATION_WEB','웹개발'),('SD','SYSTEM_DEVELOPMENT','시스템개발'),('SE','SECURITY','보안'),('SN','SERVER_NETWORK','서버네트워크'),('WD','WEB_DESIGN','웹디자인'),('WP','WEB_PLANNING,PM','웹기획,PM');
/*!40000 ALTER TABLE `career_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_cd`
--

DROP TABLE IF EXISTS `day_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_cd` (
  `DAY_CODE` tinyint(1) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`DAY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes days.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_cd`
--

LOCK TABLES `day_cd` WRITE;
/*!40000 ALTER TABLE `day_cd` DISABLE KEYS */;
INSERT INTO `day_cd` VALUES (0,'SUNDAY','일'),(1,'MONDAY','월'),(2,'TUESDAY','화'),(3,'WEDNESDAY','수'),(4,'THURSDAY','목'),(5,'FRIDAY','금'),(6,'SATURDAY','토');
/*!40000 ALTER TABLE `day_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_cd`
--

DROP TABLE IF EXISTS `education_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_cd` (
  `EDUCATION_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(30) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(30) NOT NULL,
  `SEQUENCENUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`EDUCATION_CODE`),
  UNIQUE KEY `SEQUENCENUM_UNIQUE` (`SEQUENCENUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='최종학력코드테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_cd`
--

LOCK TABLES `education_cd` WRITE;
/*!40000 ALTER TABLE `education_cd` DISABLE KEYS */;
INSERT INTO `education_cd` VALUES ('A','ASSOCIATE','대학2년제',3),('B','BACHELOR','대학4년제',4),('D','DOCTOR','박사',1),('E','ETC','기타',5),('M','MASTER','석사',2);
/*!40000 ALTER TABLE `education_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeboard`
--

DROP TABLE IF EXISTS `freeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeboard` (
  `freeboard_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notice` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `likecount` int(11) DEFAULT '0',
  `replycount` int(11) DEFAULT '0',
  `id` varchar(15) NOT NULL,
  PRIMARY KEY (`freeboard_id`),
  KEY `freeboard_id_fk_idx` (`id`),
  CONSTRAINT `freeboard_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeboard`
--

LOCK TABLES `freeboard` WRITE;
/*!40000 ALTER TABLE `freeboard` DISABLE KEYS */;
INSERT INTO `freeboard` VALUES (1,'안녕 멍청아','안녕','2019-01-25 06:53:32',0,0,0,0,0,'aaa123'),(2,'배가 유저불량이네 ','ㅎㅎㅎ','2019-01-25 06:53:45',0,0,0,0,0,'aaa123'),(3,'123','123123','2019-01-25 06:53:57',0,0,0,0,0,'aaa123'),(4,'멍멍','멍멍','2019-01-25 06:54:41',0,0,0,0,0,'aaa123'),(5,'멍멍','멍멍','2019-01-25 06:54:44',0,0,0,0,0,'aaa123'),(6,'멍멍','멍멍','2019-01-25 06:54:47',0,0,0,0,0,'aaa123'),(7,'멍멍','멍멍','2019-01-25 06:54:51',0,0,0,0,0,'aaa123'),(8,'망망','망망','2019-01-25 06:54:56',0,0,0,0,0,'aaa123'),(10,'망망','망망','2019-01-25 06:55:03',0,0,0,0,0,'aaa123'),(11,'망망','망망','2019-01-25 06:55:06',0,0,0,0,0,'aaa123'),(12,'망망','망망','2019-01-25 06:55:11',0,0,0,0,0,'aaa123'),(13,'망망','망망','2019-01-25 06:55:14',0,0,0,0,0,'aaa123'),(14,'몽몽','몽몽','2019-01-25 06:55:28',0,0,0,0,0,'aaa123'),(16,'몽몽','몽몽','2019-01-25 06:55:45',0,0,0,0,0,'aaa123'),(17,'몽몽','몽몽','2019-01-25 06:55:48',0,0,1,0,0,'aaa123'),(18,'몽몽','몽몽','2019-01-25 06:55:51',0,0,0,0,0,'aaa123'),(21,'몽몽','몽몽','2019-01-25 06:56:47',0,0,0,0,0,'aaa123'),(22,'우하하하','우하하하','2019-01-25 06:58:12',0,0,4,0,0,'aaa123'),(23,'ㅁㅇ미','ㅁㄴㅇㅁㄴㅇㅁㄴㅇ','2019-01-25 07:00:19',0,0,0,0,0,'aaa123'),(25,'망망','ㅁㄴㅇ','2019-01-27 11:51:53',0,0,1,0,0,'aaa123'),(35,'안녕','','2019-01-28 03:43:32',0,0,0,0,0,'aaa123'),(36,'123123','','2019-01-28 04:47:57',0,0,0,0,0,'aaa123'),(46,'왜이런시련을','','2019-01-28 06:40:46',0,0,8,0,0,'aaa123'),(47,'123123','','2019-01-28 06:47:02',0,0,3,0,0,'aaa123'),(48,'123131','','2019-01-28 06:48:40',0,0,26,0,0,'aaa123'),(49,'123123','','2019-01-28 06:49:17',0,0,1,0,0,'aaa123'),(52,'멍멍','','2019-01-28 07:59:17',0,0,0,0,0,'aaa123'),(58,'123','','2019-01-28 08:06:46',0,0,0,0,0,'aaa123'),(59,'123','','2019-01-28 08:06:59',0,0,0,0,0,'aaa123'),(60,'123','','2019-01-28 08:07:42',0,0,0,0,0,'aaa123'),(61,'123','','2019-01-28 08:08:52',0,0,2,0,0,'aaa123'),(62,'rr','','2019-01-28 08:15:18',0,0,1,0,0,'aaa123'),(63,'123','','2019-01-28 08:17:33',0,0,0,0,0,'aaa123'),(64,'123123','','2019-01-28 08:18:38',0,0,0,0,0,'aaa123'),(65,'123123','','2019-01-28 08:24:10',0,0,0,0,0,'aaa123'),(66,'123','','2019-01-28 08:38:02',0,0,2,0,0,'aaa123'),(67,'123','','2019-01-28 08:41:30',0,0,1,0,0,'aaa123'),(68,'123132','','2019-01-28 08:46:54',0,0,3,0,0,'aaa123'),(69,'123123','123123','2019-01-28 08:48:17',0,0,5,0,0,'aaa123'),(70,'123','<p>123123123</p>','2019-01-28 10:43:32',0,0,3,0,0,'aaa123'),(71,'123123123','123123123123\r\n\r\n123123123\r\n\r\n123123','2019-01-28 11:27:00',0,0,4,0,0,'aaa123'),(75,'123123','<p>1231231231111111111111111111111111111111133333333333<br>1233333333<br>123<br>123<br>123<br>123<br>123<br>123<br>123<br>12<br>31233333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333</p>','2019-01-29 01:17:48',0,0,3,0,0,'aaa123'),(77,'123123','<p>123123<br>123<br>123<br>123123<br>123123124124</p>','2019-01-29 01:21:50',0,0,3,0,0,'aaa123'),(78,'123123','<p>123123123</p>','2019-01-29 01:24:36',0,0,4,0,0,'aaa123'),(79,'123123','<p>123123<br>123123<br>123<br>123123<br>123123</p>','2019-01-29 01:24:44',0,0,4,0,0,'aaa123'),(80,'123123','<p>123123</p>','2019-01-29 01:48:29',0,0,2,0,0,'aaa123'),(81,'123123','<p>12312313</p>','2019-01-29 01:49:42',0,0,5,0,0,'aaa123'),(82,'123123','<p>123123</p>','2019-01-29 01:54:11',0,0,6,0,0,'aaa123'),(83,'123123','<p>123123123</p>','2019-01-29 02:09:03',0,0,12,0,0,'aaa123'),(85,'123123','<p>123123123111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>','2019-01-29 02:11:40',0,0,20,0,0,'aaa123'),(94,'123','<p>&nbsp;</p>','2019-01-29 02:52:08',0,0,6,0,0,'aaa123'),(100,'123123','<p>12313</p>123123123123','2019-01-29 08:31:54',0,0,60,0,0,'aaa123'),(102,'12313','123123123','2019-01-29 09:15:33',0,0,32,0,0,'aaa123'),(123,'1231313','12313123123123123123111','2019-01-30 01:59:58',0,0,198,0,0,'aaa123'),(128,'123123123','<p>123123111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>','2019-01-31 08:55:18',0,0,68,0,0,'aaa123'),(129,'12314124','<p>124124</p>','2019-02-01 08:51:27',0,0,0,0,0,'aaa123');
/*!40000 ALTER TABLE `freeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeboard_file`
--

DROP TABLE IF EXISTS `freeboard_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeboard_file` (
  `freeboard_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `freeboard_id` int(11) NOT NULL,
  `filenumber` int(11) NOT NULL,
  `originname` varchar(20) NOT NULL,
  `savename` varchar(20) NOT NULL,
  PRIMARY KEY (`freeboard_file_id`),
  UNIQUE KEY `savename_UNIQUE` (`savename`),
  KEY `freeboard_file_freeboard_id_fk_idx` (`freeboard_id`),
  CONSTRAINT `freeboard_file_freeboard_id_fk` FOREIGN KEY (`freeboard_id`) REFERENCES `freeboard` (`freeboard_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeboard_file`
--

LOCK TABLES `freeboard_file` WRITE;
/*!40000 ALTER TABLE `freeboard_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `freeboard_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeboard_reply`
--

DROP TABLE IF EXISTS `freeboard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeboard_reply` (
  `freeboard_reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `freeboard_id` int(11) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replygroup` int(11) DEFAULT '0',
  `replystep` int(11) DEFAULT '0',
  PRIMARY KEY (`freeboard_reply_id`),
  KEY `freeboard_reply_id_fk_idx` (`id`),
  KEY `freeboard_reply_freeboard_id_fk_idx` (`freeboard_id`),
  CONSTRAINT `freeboard_reply_freeboard_id_fk` FOREIGN KEY (`freeboard_id`) REFERENCES `freeboard` (`freeboard_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `freeboard_reply_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeboard_reply`
--

LOCK TABLES `freeboard_reply` WRITE;
/*!40000 ALTER TABLE `freeboard_reply` DISABLE KEYS */;
INSERT INTO `freeboard_reply` VALUES (13,123,'aaa123','124124111111','2019-01-31 10:20:46',0,0),(14,123,'aaa123','1231231231111111111111111123123123123','2019-01-31 10:22:45',0,0),(19,100,'aaa123','111111','2019-01-31 11:01:19',0,0),(20,100,'aaa123','12313123','2019-01-31 11:01:21',0,0),(21,100,'aaa123','1231323','2019-01-31 11:01:22',0,0),(22,128,'aaa123','11111111111111213123123123123','2019-01-31 11:01:27',0,0),(23,128,'aaa123','2222222222222','2019-01-31 11:01:29',0,0),(24,128,'aaa123','3333333333333','2019-01-31 11:01:33',0,0),(25,85,'aaa123','1111111111111','2019-01-31 11:01:38',0,0),(26,85,'aaa123','222222222222222222','2019-01-31 11:01:40',0,0),(27,85,'aaa123','3333333333333','2019-01-31 11:01:42',0,0),(28,85,'aaa123','44444444444444','2019-01-31 11:01:43',0,0),(29,82,'aaa123','1111111111','2019-01-31 11:01:47',0,0),(30,82,'aaa123','222222222222','2019-01-31 11:01:49',0,0),(31,82,'aaa123','3333333333333','2019-01-31 11:01:50',0,0),(32,82,'aaa123','4444444444444','2019-01-31 11:01:52',0,0),(35,123,'aaa123','11111111111111','2019-01-31 16:24:42',0,0),(36,102,'aaa123','324243','2019-01-31 16:33:18',0,0),(37,102,'aaa123','2222222222222222','2019-01-31 16:33:22',0,0),(38,128,'aaa123','qweqe','2019-01-31 17:28:08',0,0),(39,128,'aaa123','qweqe','2019-01-31 17:28:09',0,0),(40,123,'aaa123','qwrqwrqwr','2019-02-01 00:37:58',0,0),(41,123,'aaa123','qqqqqqqqqqq','2019-02-01 00:38:01',0,0),(43,128,'aaa123','123123123','2019-02-01 01:20:35',0,0),(44,128,'aaa123','123123123123123','2019-02-01 01:20:37',0,0),(46,128,'aaa123','123123123','2019-02-01 05:43:52',0,0),(47,123,'aaa123','12312313','2019-02-01 06:34:27',0,0),(48,128,'aaa123','12314','2019-02-01 06:56:33',0,0),(50,128,'aaa123','124124124','2019-02-01 07:00:09',0,0),(51,128,'aaa123','1하하하하하하하ㅏ하하하하','2019-02-01 07:00:16',0,0);
/*!40000 ALTER TABLE `freeboard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_cd`
--

DROP TABLE IF EXISTS `grade_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_cd` (
  `GRADE_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`GRADE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes grade of each member.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_cd`
--

LOCK TABLES `grade_cd` WRITE;
/*!40000 ALTER TABLE `grade_cd` DISABLE KEYS */;
INSERT INTO `grade_cd` VALUES ('A','ADMIN','관리자'),('N','NORMAL','일반'),('T','TUTOR','강사'),('W','WAIT','강사승인대기');
/*!40000 ALTER TABLE `grade_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquireboard`
--

DROP TABLE IF EXISTS `inquireboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquireboard` (
  `inquireboard_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notice` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `likecount` int(11) DEFAULT '0',
  `replycount` int(11) DEFAULT '0',
  `hide` tinyint(1) DEFAULT '0',
  `commentgroup` int(11) DEFAULT '0',
  `commentstep` int(11) DEFAULT '0',
  `commentindent` int(11) DEFAULT '0',
  `id` varchar(15) NOT NULL,
  PRIMARY KEY (`inquireboard_id`),
  KEY `inquireboard_id_fk_idx` (`id`),
  CONSTRAINT `inquireboard_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquireboard`
--

LOCK TABLES `inquireboard` WRITE;
/*!40000 ALTER TABLE `inquireboard` DISABLE KEYS */;
INSERT INTO `inquireboard` VALUES (1,'문의합니다.','결제문의합니다.','2019-01-11 20:18:51',0,0,1,0,0,0,0,0,0,'eee123'),(2,'문의드립니다.','환불문의합니다.','2019-01-11 20:18:51',0,0,1,0,0,0,1,0,0,'iii123'),(3,'문의합니다.','탈퇴문의합니다.','2019-01-11 20:18:51',0,0,1,0,0,1,0,0,0,'ggg123'),(4,'문의드립니다.','신고문의합니다.','2019-01-11 20:18:51',0,0,1,0,0,0,1,0,0,'admin123'),(5,'문의합니다.','환불문의합니다.','2019-01-11 20:18:51',0,0,1,0,0,0,0,0,0,'hhh123'),(6,'문의드립니다.','신고문의합니다.','2019-01-11 20:18:52',0,0,1,0,0,0,1,0,0,'hhh123'),(7,'문의합니다.','탈퇴문의합니다.','2019-01-11 20:18:52',0,0,1,0,0,1,0,0,0,'fff123'),(8,'문의드립니다.','결제문의합니다.','2019-01-11 20:18:52',0,0,0,0,0,1,0,0,0,'iii123'),(9,'문의합니다.','스터디문의합니다.','2019-01-11 20:18:52',0,0,0,0,0,0,0,0,0,'hhh123'),(10,'문의드립니다.','위치문의합니다.','2019-01-11 20:18:52',0,0,0,0,0,0,0,0,0,'iii123');
/*!40000 ALTER TABLE `inquireboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquireboard_file`
--

DROP TABLE IF EXISTS `inquireboard_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquireboard_file` (
  `inquireboard_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquireboard_id` int(11) NOT NULL,
  `filenumber` int(11) NOT NULL,
  `originname` varchar(20) NOT NULL,
  `savename` varchar(20) NOT NULL,
  PRIMARY KEY (`inquireboard_file_id`),
  KEY `inquireboard_file_inquireboard_id_fk_idx` (`inquireboard_id`),
  CONSTRAINT `inquireboard_file_inquireboard_id_fk` FOREIGN KEY (`inquireboard_id`) REFERENCES `inquireboard` (`inquireboard_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquireboard_file`
--

LOCK TABLES `inquireboard_file` WRITE;
/*!40000 ALTER TABLE `inquireboard_file` DISABLE KEYS */;
INSERT INTO `inquireboard_file` VALUES (1,1,1,'text.txt','11zca12fa48.jpg'),(2,1,2,'image.jpg','sfsf12fa48.jpg'),(3,1,3,'nana.jpg','4124112fa48.jpg'),(4,1,4,'momo.jpg','562qwca12fa48.jpg'),(5,2,1,'nini.jpg','223112fa48.jpg'),(6,2,2,'text.txt','124112fa48.jpg'),(7,2,3,'image.jpg','4124a12fa48.jpg'),(8,3,1,'nana.jpg','11zca12fa48.jpg'),(9,3,2,'momo.jpg','124ca12fa48.jpg'),(10,3,3,'nini.jpg','11zc24a12fa48.jpg');
/*!40000 ALTER TABLE `inquireboard_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquireboard_reply`
--

DROP TABLE IF EXISTS `inquireboard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquireboard_reply` (
  `inquireboard_reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquireboard_id` int(11) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replygroup` int(11) DEFAULT '0',
  `replystep` int(11) DEFAULT '0',
  PRIMARY KEY (`inquireboard_reply_id`),
  KEY `inquireboard_reply_inquireboard_id_fk_idx` (`inquireboard_id`),
  KEY `inquireboard_reply_id_fk_idx` (`id`),
  CONSTRAINT `inquireboard_reply_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inquireboard_reply_inquireboard_id_fk` FOREIGN KEY (`inquireboard_id`) REFERENCES `inquireboard` (`inquireboard_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquireboard_reply`
--

LOCK TABLES `inquireboard_reply` WRITE;
/*!40000 ALTER TABLE `inquireboard_reply` DISABLE KEYS */;
INSERT INTO `inquireboard_reply` VALUES (1,1,'fff123','답변완료','2019-01-14 10:09:06',1,0),(2,2,'ddd123','답변완료','2019-01-14 10:09:06',1,0),(3,3,'hhh123','답변완료','2019-01-14 10:09:06',1,0),(4,4,'eee123','답변완료','2019-01-14 10:09:06',1,0),(5,5,'fff123','답변완료','2019-01-14 10:09:06',1,0),(6,6,'ddd123','답변완료','2019-01-14 10:09:06',1,0),(7,7,'eee123','답변완료','2019-01-14 10:09:06',1,0),(8,8,'aaa123','답변완료','2019-01-14 10:09:06',1,0),(9,9,'admin123','답변완료','2019-01-14 10:09:06',1,0),(10,10,'aaa123','답변완료','2019-01-14 10:09:06',1,0);
/*!40000 ALTER TABLE `inquireboard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_1_cd`
--

DROP TABLE IF EXISTS `interest_1_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_1_cd` (
  `INTEREST_1_CODE` varchar(50) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(50) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(50) NOT NULL,
  PRIMARY KEY (`INTEREST_1_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관심분야1코드테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_1_cd`
--

LOCK TABLES `interest_1_cd` WRITE;
/*!40000 ALTER TABLE `interest_1_cd` DISABLE KEYS */;
INSERT INTO `interest_1_cd` VALUES ('D','DATABASE','데이터베이스'),('N','NETWORK&SECURITY','네트워크보안'),('P','APPLICATION_PROGRAMING','응용프로그래밍'),('W','WEB_PROGRAMING','웹프로그래밍');
/*!40000 ALTER TABLE `interest_1_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_2_cd`
--

DROP TABLE IF EXISTS `interest_2_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_2_cd` (
  `INTEREST_2_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(50) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(50) NOT NULL,
  `INTEREST_1_CODE` varchar(45) NOT NULL,
  PRIMARY KEY (`INTEREST_2_CODE`),
  KEY `INTEREST_1_CODE_FK_idx` (`INTEREST_1_CODE`),
  CONSTRAINT `INTEREST_2_CD_INTEREST_1_CODE_FK` FOREIGN KEY (`INTEREST_1_CODE`) REFERENCES `interest_1_cd` (`INTEREST_1_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관심분야2코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_2_cd`
--

LOCK TABLES `interest_2_cd` WRITE;
/*!40000 ALTER TABLE `interest_2_cd` DISABLE KEYS */;
INSERT INTO `interest_2_cd` VALUES ('D01','Database','전체','D'),('D02','Oracle','오라클','D'),('D03','Mysql','MYSQL','D'),('D04','Mongo','몽고','D'),('D05','Mara','마리아','D'),('D06','Ms','MS','D'),('N01','Network&Security','전체','N'),('N02','Network_Management','네트워크관리','N'),('N03','Server_management','서버관리','N'),('N04','Linux','LINUX','N'),('N05','Infomation_Security','정보보안','N'),('N06','Pos','POS','N'),('N07','System_Operation','시스템운영','N'),('P01','Application_Programing','전체','P'),('P02','Java','JAVA','P'),('P03','C','C','P'),('P04','C#','C#','P'),('P05','C++','C++','P'),('P06','Android','안드로이드','P'),('P07','Ios','IOS','P'),('P08','Python','파이썬','P'),('P09','VisualC','VISUALC','P'),('P10','Was','WAS','P'),('W01','Web_Programing','전체','W'),('W02','PhP','PHP','W'),('W03','HTML&Js','HTML/JS','W'),('W04','AJAX','AJAX','W'),('W05','Jsp','JSP','W'),('W06','Spring','SPRING','W');
/*!40000 ALTER TABLE `interest_2_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_location`
--

DROP TABLE IF EXISTS `interest_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_location` (
  `interest_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `interest_location` varchar(100) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`interest_location_id`),
  KEY `interest_location_id_fk_idx` (`id`),
  CONSTRAINT `interest_location_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_location`
--

LOCK TABLES `interest_location` WRITE;
/*!40000 ALTER TABLE `interest_location` DISABLE KEYS */;
INSERT INTO `interest_location` VALUES (40,'경남 사천시 벌리동 ',NULL),(41,'서울 송파구 오금동 ',NULL),(46,'서울 강남구 논현동 ','sss123');
/*!40000 ALTER TABLE `interest_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_cd`
--

DROP TABLE IF EXISTS `level_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_cd` (
  `LEVEL_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`LEVEL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='레벨 코드 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_cd`
--

LOCK TABLES `level_cd` WRITE;
/*!40000 ALTER TABLE `level_cd` DISABLE KEYS */;
INSERT INTO `level_cd` VALUES ('H','HIGH','상'),('L','LOW','하'),('M','MID','중');
/*!40000 ALTER TABLE `level_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leveltest`
--

DROP TABLE IF EXISTS `leveltest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leveltest` (
  `question_number` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `LEVELTEST_TYPE_CODE` varchar(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `choice` text,
  `correct_answer` varchar(100) NOT NULL,
  PRIMARY KEY (`question_number`,`study_id`),
  KEY `leveltest_study_id_fk_idx` (`study_id`),
  KEY `leveltest_LEVELTEST_TYPE_CODE_idx` (`LEVELTEST_TYPE_CODE`),
  CONSTRAINT `leveltest_LEVELTEST_TYPE_CODE` FOREIGN KEY (`LEVELTEST_TYPE_CODE`) REFERENCES `leveltest_type_cd` (`LEVELTEST_TYPE_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leveltest_study_id_fk` FOREIGN KEY (`study_id`) REFERENCES `study` (`study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leveltest`
--

LOCK TABLES `leveltest` WRITE;
/*!40000 ALTER TABLE `leveltest` DISABLE KEYS */;
INSERT INTO `leveltest` VALUES (1,'BF00002','MC','다음 중 접근제어자가 아닌 것을 고르세요!','final;private;protected','1'),(1,'PB00001','SA','오버로딩의 조건을 아는 대로 쓰세요.',NULL,'선언부가 달라야 한다. 리턴타입은 상관없다.'),(2,'BF00002','SA','가장 범위가 넓은 접근제어자는?',NULL,'public');
/*!40000 ALTER TABLE `leveltest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leveltest_response`
--

DROP TABLE IF EXISTS `leveltest_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leveltest_response` (
  `question_number` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `submit_answer` varchar(100) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`question_number`,`study_id`,`id`),
  KEY `leveltest_response_id_fk_idx` (`id`),
  CONSTRAINT `leveltest_response_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leveltest_response_question_number_study_id_fk` FOREIGN KEY (`question_number`, `study_id`) REFERENCES `leveltest` (`question_number`, `study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leveltest_response`
--

LOCK TABLES `leveltest_response` WRITE;
/*!40000 ALTER TABLE `leveltest_response` DISABLE KEYS */;
INSERT INTO `leveltest_response` VALUES (1,'BF00002','aaa123','2',0),(1,'BF00002','bbb123','1',1),(1,'BF00002','fff123','1',1),(2,'BF00002','aaa123','public',1),(2,'BF00002','bbb123','public',1),(2,'BF00002','ccc123','public',1);
/*!40000 ALTER TABLE `leveltest_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leveltest_type_cd`
--

DROP TABLE IF EXISTS `leveltest_type_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leveltest_type_cd` (
  `LEVELTEST_TYPE_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`LEVELTEST_TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='레벨테스트 유형 코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leveltest_type_cd`
--

LOCK TABLES `leveltest_type_cd` WRITE;
/*!40000 ALTER TABLE `leveltest_type_cd` DISABLE KEYS */;
INSERT INTO `leveltest_type_cd` VALUES ('MC','MULTIPLE_CHOICE','객관식'),('SA','SHORT_ANSWER','주관식');
/*!40000 ALTER TABLE `leveltest_type_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(15) NOT NULL,
  `MEMBER_STATUS_CODE` varchar(20) NOT NULL DEFAULT 'N',
  `GRADE_CODE` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth` date NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `visibility` tinyint(1) DEFAULT '0',
  `profile_origin_name` varchar(32) DEFAULT NULL,
  `profile_save_name` varchar(32) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MEMBER_STATUS_CODE_idx` (`MEMBER_STATUS_CODE`),
  KEY `GRAGE_CODE_idx` (`GRADE_CODE`),
  CONSTRAINT `tutor_GRADE_CODE_fk` FOREIGN KEY (`GRADE_CODE`) REFERENCES `grade_cd` (`GRADE_CODE`),
  CONSTRAINT `tutor_MEMBER_STATUS_CODE_fk` FOREIGN KEY (`MEMBER_STATUS_CODE`) REFERENCES `member_status_cd` (`MEMBER_STATUS_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('aaa123','A','T','$2a$10$TqlWkUNPfElGeXftDXWd3u.g/JMi/FMhwKAeDSDpieT5XJQA/o0Fe','이미연','여','1991-01-01','삼각지','samgakji@daum.net','010-1234-1234',0,NULL,'d','2018-02-02'),('admin123','N','W','$2a$10$d5EgxMh4n7CDsSkkzkIxseqQEJu397HR1591ux/QQHjs0ngpZ1Tva','신상용','여','1992-11-10','갓상용','god@naver.com','010-2579-1441',0,NULL,'d','2018-01-01'),('bbb123','N','T','$2a$10$LH/RwXpagMucKO0KVZr1/.6nUCh.OpNkJiNJjY9p6J.SnPsGVnuWe','이요한','여','1993-05-15','요하네스','yohanes@naver.com','010-9876-5432',0,NULL,'d','2018-03-03'),('ccc123','N','T','$2a$10$K2niCM2d5Jr0XlCU5Dfrj.7vcXeS8AkRAAJl87LqWjl7zOS9ke6iW','윤원식','여','1989-02-12','원시켱','wonsik@daum.net','010-1111-1111',0,NULL,'d','2018-03-04'),('ddd123','N','T','$2a$10$d4/ZbJp5iiGJ53nO3fsuTOdlQGkHKQ0ssvhR6a3ZnXq9Lu/.A5qGe','김준석','여','1992-03-05','석브라이모비치','zelatan@gmail.com','010-2222-2222',0,NULL,'d','2018-03-04'),('eee123','N','T','$2a$10$X/tz1ZOqYJ5CHOqxSNEiKu5iEJACUH51KBTwWuI6w2Y/lj/Fdq6Iu','윤성호','여','1993-07-31','해군','navy@gmail.com','010-3333-3333',0,NULL,'d','2018-03-05'),('fff123','N','N','$2a$10$vpOyP5MzRW1ay2hWT5fRg.rat1Pq8nZRU6AnGLq4yIkIwFQGlakh6','권오엽','여','1993-04-21','육군','army@gmail.com','010-4444-4444',0,NULL,'d','2018-03-06'),('ggg123','N','N','$2a$10$f9ukqTbAAgBbdgTKeM3iQun4d/.FzAam4unqR.l8uk70i1J8ukUv2','안성현','여','1989-03-21','공군','ariforce@naver.com','010-5555-5555',0,NULL,'d','2018-03-07'),('hhh123','N','N','$2a$10$.QtKWRrD.du4Kbk7PEXh4OnIxlvURgPV7BsIlxeOl0/3uLSQjXeOG','이한솔','여','1988-08-08','조교','sodejang@daum.net','010-6666-6666',0,NULL,'d','2018-03-08'),('iii123','N','N','$2a$10$k2qSzyQukl.QxfpdZy2IveA1gN10qDOZAyZYzPiwobkkD0iA3BWoS','이동준','여','1992-03-04','탱크','tank@naver.com','010-7777-7777',0,NULL,'d','2018-03-09'),('rrr123','N','N','$2a$10$xaOGpUd3EUDX4g2Xm8YzRewO3pwrwH8xR4qANY9LOr4VKn0mlQoNm','나야나','남','2019-01-02','워너원','abc@naver.com','010-3333-4444',0,NULL,NULL,'2019-01-31'),('sss123','N','N','$2a$10$ubSC2MMbeXOEYdZg0vRqYuhyoFEMehrBEYvttfJ9yuqeNUz/Qdkx2','나플라','남','1993-09-01','혓바닥이무기','napla@naver.com','010-1231-1233',0,NULL,'d','2019-01-29'),('xxx123','N','W','$2a$10$JJ.wtpYQMOSuwiumT2Nj0efJbxyd//zhPoJMAEmYczLJD2qpJ1lxG','김두한','남','1890-12-12','종로의두목','doohankim@naver.com','010-2579-3123',0,NULL,'d','2019-01-29');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_interest`
--

DROP TABLE IF EXISTS `member_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_interest` (
  `member_interest_id` int(11) NOT NULL,
  `id` varchar(15) NOT NULL,
  `INTEREST_2_CODE` varchar(20) NOT NULL,
  PRIMARY KEY (`member_interest_id`),
  UNIQUE KEY `id_INTEREST_2_CODE_UNIQUE` (`id`,`INTEREST_2_CODE`),
  KEY `INTEREST_2_CODE_FK_idx` (`INTEREST_2_CODE`),
  KEY `INTEREST_ID_FK_idx` (`id`),
  CONSTRAINT `member_interest_INTEREST_2_CODE_fk` FOREIGN KEY (`INTEREST_2_CODE`) REFERENCES `interest_2_cd` (`INTEREST_2_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `member_interest_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관심분야 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_interest`
--

LOCK TABLES `member_interest` WRITE;
/*!40000 ALTER TABLE `member_interest` DISABLE KEYS */;
INSERT INTO `member_interest` VALUES (1,'aaa123','D01'),(2,'aaa123','D02'),(3,'aaa123','P03'),(6,'bbb123','D02'),(5,'bbb123','P03'),(4,'bbb123','P05'),(7,'ccc123','N01'),(8,'ccc123','N02'),(9,'ccc123','N03'),(10,'fff123','P04'),(11,'fff123','P05'),(12,'hhh123','P06'),(13,'hhh123','P07');
/*!40000 ALTER TABLE `member_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `fno` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `member` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fno`),
  KEY `member_roles_id_fk_idx` (`member`),
  KEY `member_roles_code_fk_idx` (`role_name`),
  CONSTRAINT `member_roles_code_fk` FOREIGN KEY (`role_name`) REFERENCES `grade_cd` (`GRADE_CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_roles_id_fk` FOREIGN KEY (`member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (11,'A','admin123'),(12,'T','aaa123'),(13,'T','bbb123'),(14,'T','ccc123'),(15,'T','ddd123'),(16,'T','eee123'),(17,'N','fff123'),(18,'N','ggg123'),(19,'N','hhh123'),(20,'N','iii123'),(44,'N','aaa123'),(45,'N','bbb123'),(46,'N','ccc123'),(47,'N','ddd123'),(48,'N','eee123'),(49,'N','xxx123'),(50,'N','sss123'),(86,'N','admin123'),(87,'W','admin123'),(88,'T','admin123'),(91,'N','rrr123');
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_status_cd`
--

DROP TABLE IF EXISTS `member_status_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_status_cd` (
  `MEMBER_STATUS_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`MEMBER_STATUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 상태 코드 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_status_cd`
--

LOCK TABLES `member_status_cd` WRITE;
/*!40000 ALTER TABLE `member_status_cd` DISABLE KEYS */;
INSERT INTO `member_status_cd` VALUES ('A','PAUSE_ALL','영구정지'),('E','EXIT','탈퇴'),('N','NORMAL','일반'),('P','PAUSE','정지');
/*!40000 ALTER TABLE `member_status_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_receive`
--

DROP TABLE IF EXISTS `message_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_receive` (
  `message_receive_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` varchar(15) NOT NULL,
  `receive_id` varchar(15) NOT NULL,
  `message_content` varchar(4000) NOT NULL,
  `message_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `message_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`message_receive_id`),
  KEY `message_receive_receive_id_fk_idx` (`receive_id`),
  KEY `message_receive_send_id_fk_idx` (`send_id`),
  CONSTRAINT `message_receive_receive_id_fk` FOREIGN KEY (`receive_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_receive_send_id_fk` FOREIGN KEY (`send_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_receive`
--

LOCK TABLES `message_receive` WRITE;
/*!40000 ALTER TABLE `message_receive` DISABLE KEYS */;
INSERT INTO `message_receive` VALUES (1,'aaa123','bbb123','같이스터디하실래요?','2019-01-24 17:38:14',0),(2,'bbb123','ccc123','같이스터디하실래요?','2019-01-24 17:38:36',0),(3,'aaa123','ccc123','하이하이','2019-01-24 09:33:26',0);
/*!40000 ALTER TABLE `message_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_send`
--

DROP TABLE IF EXISTS `message_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_send` (
  `message_send_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` varchar(15) NOT NULL,
  `receive_id` varchar(15) NOT NULL,
  `message_content` varchar(4000) NOT NULL,
  `message_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `message_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`message_send_id`),
  KEY `message_send_send_id_fk_idx` (`send_id`),
  KEY `message_send_receive_id_fk_idx` (`receive_id`),
  CONSTRAINT `message_send_receive_id_fk` FOREIGN KEY (`receive_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_send_send_id_fk` FOREIGN KEY (`send_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='보낸쪽지함테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_send`
--

LOCK TABLES `message_send` WRITE;
/*!40000 ALTER TABLE `message_send` DISABLE KEYS */;
INSERT INTO `message_send` VALUES (1,'aaa123','bbb123','같이스터디하실래요?','2019-01-24 17:38:14',0),(2,'bbb123','ccc123','같이스터디하실래요?','2019-01-24 17:38:36',0),(3,'aaa123','ccc123','하이하이','2019-01-24 09:33:26',0);
/*!40000 ALTER TABLE `message_send` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`seok`@`%`*/ /*!50003 TRIGGER `StudyRepublic`.`message_send_AFTER_INSERT` AFTER INSERT ON `message_send` FOR EACH ROW
BEGIN
	insert into message_receive 
    set
    
      message_receive_id = new.message_send_id
    , send_id = new.send_id
    , receive_id = new.receive_id
    , message_content = new.message_content
    , message_date = new.message_date
    , message_delete=new.message_delete;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `onoff_cd`
--

DROP TABLE IF EXISTS `onoff_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onoff_cd` (
  `ONOFF_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`ONOFF_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes types of study. (ON/OFF)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onoff_cd`
--

LOCK TABLES `onoff_cd` WRITE;
/*!40000 ALTER TABLE `onoff_cd` DISABLE KEYS */;
INSERT INTO `onoff_cd` VALUES ('B','BOTH','온오프라인'),('F','OFF','오프라인'),('O','ON','온라인');
/*!40000 ALTER TABLE `onoff_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` varchar(25) NOT NULL,
  `id` varchar(15) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `tax_free_amount` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `tid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `study_id_UNIQUE` (`study_id`),
  KEY `payment_id_fk_idx` (`id`),
  KEY `payment_study_id_fk_idx` (`study_id`),
  CONSTRAINT `payment_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payment_study_id_fk` FOREIGN KEY (`study_id`) REFERENCES `study_price` (`study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` VALUES ('user8','lnPQpt2Yxa7AqGPPpFNdaA==','HqnUhhwGCyGET7+Mbn0cGQ==','2019-01-19 21:34:01');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `popular_bs_interest`
--

DROP TABLE IF EXISTS `popular_bs_interest`;
/*!50001 DROP VIEW IF EXISTS `popular_bs_interest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `popular_bs_interest` AS SELECT 
 1 AS `interest_2_code`,
 1 AS `CODE_VALUE_ENGLISH`,
 1 AS `CODE_VALUE_KOREAN`,
 1 AS `INTEREST_1_CODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `popular_pr_interest`
--

DROP TABLE IF EXISTS `popular_pr_interest`;
/*!50001 DROP VIEW IF EXISTS `popular_pr_interest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `popular_pr_interest` AS SELECT 
 1 AS `interest_2_code`,
 1 AS `CODE_VALUE_ENGLISH`,
 1 AS `CODE_VALUE_KOREAN`,
 1 AS `INTEREST_1_CODE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `popular_study`
--

DROP TABLE IF EXISTS `popular_study`;
/*!50001 DROP VIEW IF EXISTS `popular_study`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `popular_study` AS SELECT 
 1 AS `study_id`,
 1 AS `name`,
 1 AS `leader_id`,
 1 AS `TYPE_CODE`,
 1 AS `ONOFF_CODE`,
 1 AS `STUDY_STATUS_CODE`,
 1 AS `LEVEL_CODE`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `DAY_CODE`,
 1 AS `study_count`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `enroll_capacity`,
 1 AS `enroll_actual`,
 1 AS `introduction`,
 1 AS `has_leveltest`,
 1 AS `disband_date`,
 1 AS `post_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `recommend_tutor_member`
--

DROP TABLE IF EXISTS `recommend_tutor_member`;
/*!50001 DROP VIEW IF EXISTS `recommend_tutor_member`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `recommend_tutor_member` AS SELECT 
 1 AS `id`,
 1 AS `MEMBER_STATUS_CODE`,
 1 AS `GRADE_CODE`,
 1 AS `password`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `birth`,
 1 AS `nickname`,
 1 AS `email`,
 1 AS `phonenumber`,
 1 AS `visibility`,
 1 AS `profile_origin_name`,
 1 AS `profile_save_name`,
 1 AS `registration_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(15) DEFAULT NULL,
  `REPORT_WHY_CODE` int(11) DEFAULT NULL,
  `REPORT_TYPE_CODE` varchar(20) DEFAULT NULL,
  `target` varchar(15) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_id_fk` (`id`),
  KEY `report_REPORT_TYPE_CODE_fk` (`REPORT_TYPE_CODE`),
  KEY `report_REPORT_WHY_CODE_fk` (`REPORT_WHY_CODE`),
  CONSTRAINT `report_REPORT_TYPE_CODE_fk` FOREIGN KEY (`REPORT_TYPE_CODE`) REFERENCES `report_type_cd` (`REPORT_TYPE_CODE`),
  CONSTRAINT `report_REPORT_WHY_CODE_fk` FOREIGN KEY (`REPORT_WHY_CODE`) REFERENCES `report_why_cd` (`REPORT_WHY_CODE`),
  CONSTRAINT `report_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'aaa123',1,'member','ggg123','내용1','2019-01-14'),(2,'bbb123',2,'study','BB00001','내용2','2019-01-14'),(3,'ccc123',3,'message','4','내용3','2019-01-14'),(5,'bbb123',5,'inquireboard','4','5','2019-01-14'),(6,'ccc123',6,'requestboard','4','6','2019-01-14'),(7,'aaa123',7,'study_fileshareboard','4','7','2019-01-14'),(8,'bbb123',1,'study_noticeboard','4','8','2019-01-14'),(9,'aaa123',2,'study_qnaboard','4','9','2019-01-14');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_type_cd`
--

DROP TABLE IF EXISTS `report_type_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_type_cd` (
  `REPORT_TYPE_CODE` varchar(20) NOT NULL,
  `CODE_VALUE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`REPORT_TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_type_cd`
--

LOCK TABLES `report_type_cd` WRITE;
/*!40000 ALTER TABLE `report_type_cd` DISABLE KEYS */;
INSERT INTO `report_type_cd` VALUES ('freeboard','자유게시판신고'),('inquireboard','스터디요청게시판신고'),('member','회원신고'),('message','쪽지신고'),('requestboard','문의게시판신고'),('study','스터디신고'),('study_fileshareboard','스터디파일공유게시판신고'),('study_noticeboard','스터디공지사항게시판신고'),('study_qnaboard','스터디QnA게시판신고');
/*!40000 ALTER TABLE `report_type_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_why_cd`
--

DROP TABLE IF EXISTS `report_why_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_why_cd` (
  `REPORT_WHY_CODE` int(11) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`REPORT_WHY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_why_cd`
--

LOCK TABLES `report_why_cd` WRITE;
/*!40000 ALTER TABLE `report_why_cd` DISABLE KEYS */;
INSERT INTO `report_why_cd` VALUES (1,'profit purpose','영리목적/홍보성'),(2,'illegal','불법정보'),(3,'obscenity','음란성/선정성'),(4,'abuse','욕설/인신공격'),(5,'privacy','개인정보노출'),(6,'repeat','반복게시/도배'),(7,'etc','기타');
/*!40000 ALTER TABLE `report_why_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestboard`
--

DROP TABLE IF EXISTS `requestboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestboard` (
  `requestboard_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notice` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `likecount` int(11) DEFAULT '0',
  `replycount` int(11) DEFAULT '0',
  `id` varchar(15) NOT NULL,
  PRIMARY KEY (`requestboard_id`),
  KEY `requestboard_id_fk_idx` (`id`),
  CONSTRAINT `requestboard_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestboard`
--

LOCK TABLES `requestboard` WRITE;
/*!40000 ALTER TABLE `requestboard` DISABLE KEYS */;
INSERT INTO `requestboard` VALUES (1,'요청합니다','요청합니다','2019-01-11 20:06:49',0,0,0,0,0,'aaa123'),(2,'요청합니다','요청합니다','2019-01-11 20:06:49',0,0,0,0,0,'aaa123'),(3,'반갑습니다.','안녕하세요','2019-01-11 20:06:49',0,0,0,0,0,'aaa123'),(4,'안녕하세요','반갑습니다.','2019-01-11 20:06:49',0,0,0,0,0,'aaa123'),(5,'요청합니다','요청합니다','2019-01-11 20:06:49',0,0,0,0,0,'aaa123'),(6,'안녕하세요','반갑습니다.','2019-01-11 20:06:49',0,0,0,0,0,'aaa123'),(7,'요청합니다','요청합니다','2019-01-11 20:06:49',0,0,0,0,0,'ccc123'),(8,'반갑습니다.','안녕하세요','2019-01-11 20:06:49',0,0,0,0,0,'ccc123'),(9,'요청합니다','요청합니다','2019-01-11 20:06:49',0,0,0,0,0,'ccc123'),(10,'반갑습니다.','안녕하세요','2019-01-11 20:06:49',0,0,0,0,0,'ccc123');
/*!40000 ALTER TABLE `requestboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestboard_file`
--

DROP TABLE IF EXISTS `requestboard_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestboard_file` (
  `requestboard_file` int(11) NOT NULL AUTO_INCREMENT,
  `requestboard_id` int(11) NOT NULL,
  `filenumber` int(11) NOT NULL,
  `originname` varchar(20) NOT NULL,
  `savename` varchar(20) NOT NULL,
  PRIMARY KEY (`requestboard_file`),
  UNIQUE KEY `savename_UNIQUE` (`savename`),
  KEY `requestboard_file_requestboard_id_fk_idx` (`requestboard_id`),
  CONSTRAINT `requestboard_file_requestboard_id_fk` FOREIGN KEY (`requestboard_id`) REFERENCES `requestboard` (`requestboard_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestboard_file`
--

LOCK TABLES `requestboard_file` WRITE;
/*!40000 ALTER TABLE `requestboard_file` DISABLE KEYS */;
INSERT INTO `requestboard_file` VALUES (1,1,1,'image.jpg','123a1b846b.jpg'),(2,1,2,'text.txt','asdfgb846b.jpg'),(3,1,3,'text.txt','qwerb846b.jpg'),(4,1,4,'image.jpg','zxcvbb846b.jpg'),(5,1,5,'momo.jpg','1qazb846b.jpg'),(6,1,6,'image.jpg','2wsxb846b.jpg'),(7,2,1,'momo.jpg','3edcb846b.jpg'),(8,2,2,'image.jpg','4rffvb846b.jpg'),(9,2,3,'momo.jpg','5tqsd846b.jpg'),(10,2,4,'text.txt','6qsdvb846b.jpg');
/*!40000 ALTER TABLE `requestboard_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestboard_reply`
--

DROP TABLE IF EXISTS `requestboard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestboard_reply` (
  `requestboard_reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `requestboard_id` int(11) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replygroup` int(11) DEFAULT '0',
  `replystep` int(11) DEFAULT '0',
  PRIMARY KEY (`requestboard_reply_id`),
  KEY `requestboard_reply_requestboard_id_fk_idx` (`requestboard_id`),
  KEY `requestboard_reply_id_fk_idx` (`id`),
  CONSTRAINT `requestboard_reply_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `requestboard_reply_requestboard_id_fk` FOREIGN KEY (`requestboard_id`) REFERENCES `requestboard` (`requestboard_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestboard_reply`
--

LOCK TABLES `requestboard_reply` WRITE;
/*!40000 ALTER TABLE `requestboard_reply` DISABLE KEYS */;
INSERT INTO `requestboard_reply` VALUES (1,1,'ddd123','다음에해요','2019-01-11 20:12:43',1,0),(2,1,'eee123','안녕하세요','2019-01-11 20:12:43',2,0),(3,2,'ddd123','저도요청요','2019-01-11 20:12:43',1,0),(4,2,'eee123','ㅇㅅㅇ','2019-01-11 20:12:43',1,1),(5,2,'ddd123','다음에저도','2019-01-11 20:12:43',1,2),(6,2,'fff123','^^','2019-01-11 20:12:43',1,3),(7,2,'ddd123','...','2019-01-11 20:12:43',2,1),(8,3,'ggg123','ㅎㅎㅎ','2019-01-11 20:12:43',1,0),(9,3,'fff123','ㅋㅋㅋ','2019-01-11 20:12:43',1,1),(10,3,'ggg123','안녕하세요','2019-01-11 20:12:43',2,0);
/*!40000 ALTER TABLE `requestboard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_number` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` text,
  `score` float NOT NULL,
  PRIMARY KEY (`review_number`),
  KEY `review_id_fk_idx` (`id`,`study_id`),
  CONSTRAINT `review_id_study_id_fk` FOREIGN KEY (`id`, `study_id`) REFERENCES `study_member` (`id`, `study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'BO00001','aaa123','스터디원 모두 성실하시고 참 됴아따.',4),(2,'BO00001','bbb123','테스트',5),(3,'BO00001','ccc123','테스트',5),(4,'PB00001','aaa123','so so',3),(5,'PB00001','bbb123','그럭저럭 괜찮았어요',2),(6,'PB00001','ccc123','널널한 분위기. 좀 아쉽다',2.5),(7,'PB00001','ddd123','배고프다',1.5),(8,'PF00003','ddd123','최고의 스터디! 튜터님이 준비도 많이 해오시고 설명도 잘 해주세요. 많이 배워갑니다.',4.5),(9,'PF00003','eee123','최고의 스터디! 튜터님이 준비도 많이 해오시고 설명도 잘 해주세요. 많이 배워갑니다.2222',4.5),(10,'PF00003','ggg123','강사님 최고최고',5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study` (
  `study_id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `leader_id` varchar(15) NOT NULL,
  `TYPE_CODE` varchar(20) NOT NULL,
  `ONOFF_CODE` varchar(20) NOT NULL,
  `STUDY_STATUS_CODE` varchar(20) NOT NULL,
  `LEVEL_CODE` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `DAY_CODE` tinyint(1) NOT NULL,
  `study_count` int(11) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `enroll_capacity` int(11) NOT NULL,
  `enroll_actual` int(11) NOT NULL,
  `introduction` mediumtext NOT NULL,
  `has_leveltest` tinyint(1) DEFAULT NULL,
  `disband_date` datetime DEFAULT NULL,
  `post_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`study_id`),
  KEY `study_id_fk_idx` (`leader_id`),
  KEY `study_TYPE_CODE_fk_idx` (`TYPE_CODE`),
  KEY `study_ONOFF_CODE_fk_idx` (`ONOFF_CODE`),
  KEY `study_STUDY_STATUS_CODE_fk_idx` (`STUDY_STATUS_CODE`),
  KEY `study_LEVEL_CODE_fk_idx` (`LEVEL_CODE`),
  KEY `study_DAY_CODE_fk_idx` (`DAY_CODE`),
  CONSTRAINT `study_DAY_CODE_fk` FOREIGN KEY (`DAY_CODE`) REFERENCES `day_cd` (`DAY_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_LEVEL_CODE_fk` FOREIGN KEY (`LEVEL_CODE`) REFERENCES `level_cd` (`LEVEL_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_ONOFF_CODE_fk` FOREIGN KEY (`ONOFF_CODE`) REFERENCES `onoff_cd` (`ONOFF_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_STUDY_STATUS_CODE_fk` FOREIGN KEY (`STUDY_STATUS_CODE`) REFERENCES `study_status_cd` (`STUDY_STATUS_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_TYPE_CODE_fk` FOREIGN KEY (`TYPE_CODE`) REFERENCES `type_cd` (`TYPE_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_leader_id_fk` FOREIGN KEY (`leader_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Study table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study`
--

LOCK TABLES `study` WRITE;
/*!40000 ALTER TABLE `study` DISABLE KEYS */;
INSERT INTO `study` VALUES ('BB00001','소개합니다 이미연의 스터디타임','aaa123','B','B','O','M','2019-01-15','2019-02-19',2,5,'12:00:00','14:00:00',10,5,'소개합니다 소개합니다 이미연의 스터디타임',0,NULL,'2019-01-10 00:00:00'),('BB00002','소개합니다 원시켱의 강의','ccc123','B','B','O','M','2019-02-15','2019-03-22',5,5,'13:00:00','15:00:00',5,4,'소개합니다 소개합니다 원시켱의 강의',0,NULL,'2019-01-15 20:50:36'),('BB00003','소개합니다 김준석의 드립하는법','ddd123','B','B','F','M','2019-02-16','2019-03-23',6,5,'14:00:00','16:00:00',5,5,'소개합니다 소개합니다 김준석의 드립하는법',0,NULL,'2019-01-17 20:57:05'),('BF00001','소개합니다 이미연의 자바를 잡아라','aaa123','B','F','O','H','2019-01-15','2019-02-19',2,5,'10:00:00','12:00:00',5,1,'소개합니다 소개합니다 이미연의 자바를 잡아라',0,NULL,'2018-10-10 09:00:00'),('BF00002','소개합니다 믿습니까 갓성호','eee123','B','F','G','H','2018-12-01','2018-12-29',6,4,'11:00:00','13:00:00',8,5,'소개합니다 소개합니다 믿습니까 갓성호',1,NULL,'2018-11-01 00:00:00'),('BO00001','소개합니다 우리 스터디를 소개합니다.','aaa123','B','O','C','H','2018-10-01','2018-11-05',1,5,'10:00:00','12:00:00',5,3,'소개합니다 소개합니다 우리 스터디를 소개합니다.',0,NULL,'2018-09-15 09:00:00'),('PB00001','소개합니다 스터디는 오프라인이죠.','bbb123','P','F','C','M','2018-11-01','2018-12-06',4,5,'12:00:00','15:00:00',10,8,'소개합니다 소개합니다 스터디는 오프라인이죠.',1,NULL,'2018-08-31 00:00:00'),('PF00001','소개합니다 이요한의 스터디2','bbb123','P','F','O','M','2019-02-01','2019-03-08',5,5,'15:00:00','17:00:00',5,1,'소개합니다 소개합니다 이요한의 스터디2',0,NULL,'2018-09-10 12:00:00'),('PF00002','소개합니다 윤성호입니다. 믿고 따라오세요.','eee123','P','F','O','M','2019-03-01','2019-04-05',5,5,'09:00:00','10:00:00',10,6,'소개합니다 소개합니다 윤성호입니다. 믿고 따라오세요.',0,NULL,'2019-01-15 00:00:00'),('PF00003','소개합니다 김준석의 자바','ddd123','P','F','C','M','2018-10-02','2018-11-06',2,5,'20:00:00','22:00:00',5,5,'소개합니다 소개합니다 김준석의 자바',0,NULL,'2018-09-11 20:58:52'),('PO00001','소개합니다 이요한의 스터디','bbb123','P','O','G','M','2018-12-01','2019-02-28',6,15,'18:00:00','20:00:00',9,6,'소개합니다 소개합니다 이요한의 스터디',0,NULL,'2018-11-11 00:33:36'),('PO00002','소개합니다 윤성호의 열혈 파이썬','eee123','P','O','D','L','2018-12-01','2019-01-05',6,5,'15:00:00','19:00:00',5,5,'소개합니다 소개합니다 윤성호의 열혈 파이썬',0,'2019-01-15 10:18:55','2018-11-20 00:00:00'),('PO00003','소개합니다 더 이상 드립이 떠오르질 않아','aaa123','P','O','O','L','2019-03-02','2019-04-13',6,6,'11:00:00','13:00:00',5,1,'소개합니다 소개합니다 더 이상 드립이 떠오르질 않아',0,NULL,'2019-01-15 00:00:00');
/*!40000 ALTER TABLE `study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_fileshareboard`
--

DROP TABLE IF EXISTS `study_fileshareboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_fileshareboard` (
  `study_fileshareboard_id` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `date` datetime NOT NULL,
  `id` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`study_fileshareboard_id`),
  UNIQUE KEY `study_fileshareboard_UNIQUE` (`number`,`study_id`),
  KEY `study_fileshareboard_id$study_id_fk_idx` (`study_id`,`id`),
  CONSTRAINT `study_fileshareboard_id$study_id_fk` FOREIGN KEY (`study_id`, `id`) REFERENCES `study_member` (`study_id`, `id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='파일 공유 게시판 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_fileshareboard`
--

LOCK TABLES `study_fileshareboard` WRITE;
/*!40000 ALTER TABLE `study_fileshareboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_fileshareboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_fileshareboard_file`
--

DROP TABLE IF EXISTS `study_fileshareboard_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_fileshareboard_file` (
  `study_fileshareboard_file_id` int(11) NOT NULL,
  `study_fileshareboard_id` int(11) NOT NULL,
  `filenumber` int(11) NOT NULL,
  `originname` varchar(20) NOT NULL,
  `savename` varchar(20) NOT NULL,
  PRIMARY KEY (`study_fileshareboard_file_id`),
  UNIQUE KEY `study_fileshareboard_file_UNIQUE` (`study_fileshareboard_id`,`filenumber`),
  KEY `study_fileshareboard_file_study_fileshareboard_id_fk_idx` (`study_fileshareboard_id`),
  CONSTRAINT `study_fileshareboard_file_study_fileshareboard_id_fk` FOREIGN KEY (`study_fileshareboard_id`) REFERENCES `study_fileshareboard` (`study_fileshareboard_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='파일 공유 게시판 파일첨부';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_fileshareboard_file`
--

LOCK TABLES `study_fileshareboard_file` WRITE;
/*!40000 ALTER TABLE `study_fileshareboard_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_fileshareboard_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_fileshareboard_reply`
--

DROP TABLE IF EXISTS `study_fileshareboard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_fileshareboard_reply` (
  `study_fileshareboard_reply_id` int(11) NOT NULL,
  `study_fileshareboard_id` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `replygroup` int(11) NOT NULL,
  `replystep` int(11) NOT NULL,
  PRIMARY KEY (`study_fileshareboard_reply_id`),
  UNIQUE KEY `study_filechareboard_id_UNIQUE` (`study_fileshareboard_id`,`replygroup`,`replystep`),
  KEY `study_fileshareboard_reply_id$study_id_fk_idx` (`study_id`,`id`),
  CONSTRAINT `study_fileshareboard_reply_id$study_id_fk` FOREIGN KEY (`study_id`, `id`) REFERENCES `study_member` (`study_id`, `id`),
  CONSTRAINT `study_fileshareboard_reply_study_filechareboard_id_fk` FOREIGN KEY (`study_fileshareboard_id`) REFERENCES `study_fileshareboard` (`study_fileshareboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='파일 공유 게시판 덧글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_fileshareboard_reply`
--

LOCK TABLES `study_fileshareboard_reply` WRITE;
/*!40000 ALTER TABLE `study_fileshareboard_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_fileshareboard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_interest`
--

DROP TABLE IF EXISTS `study_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_interest` (
  `study_interest_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` varchar(20) NOT NULL,
  `interest_2_code` varchar(20) NOT NULL,
  PRIMARY KEY (`study_interest_id`),
  UNIQUE KEY `study_interest_study_id_study_interest_UNIQUE` (`study_id`,`interest_2_code`),
  KEY `study_interest_study_id_fk_idx` (`study_id`),
  KEY `study_interest_INTEREST_2_CODE_fk_idx` (`interest_2_code`),
  CONSTRAINT `study_interest_INTEREST_2_CODE_fk` FOREIGN KEY (`interest_2_code`) REFERENCES `interest_2_cd` (`INTEREST_2_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_interest_study_id_fk` FOREIGN KEY (`study_id`) REFERENCES `study` (`study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_interest`
--

LOCK TABLES `study_interest` WRITE;
/*!40000 ALTER TABLE `study_interest` DISABLE KEYS */;
INSERT INTO `study_interest` VALUES (34,'BB00001','P02'),(33,'BB00001','P04'),(31,'BB00002','N01'),(32,'BB00002','P02'),(30,'BB00003','P02'),(29,'BB00003','W01'),(27,'BF00001','D01'),(28,'BF00001','D02'),(25,'BF00002','D01'),(26,'BF00002','D02'),(24,'BO00001','D02'),(23,'BO00001','P01'),(1,'BO00001','P08'),(22,'PB00001','D02'),(21,'PB00001','W01'),(20,'PF00001','D02'),(19,'PF00001','P01'),(2,'PF00001','P03'),(3,'PF00001','W01'),(18,'PF00002','D02'),(17,'PF00002','N01'),(15,'PF00003','N02'),(16,'PF00003','N03'),(13,'PO00001','N01'),(14,'PO00001','N02'),(11,'PO00002','D03'),(12,'PO00002','D04'),(4,'PO00003','D01'),(5,'PO00003','D02');
/*!40000 ALTER TABLE `study_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_location`
--

DROP TABLE IF EXISTS `study_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_location` (
  `interest_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` varchar(20) NOT NULL,
  `interest_location` varchar(60) NOT NULL,
  PRIMARY KEY (`interest_location_id`),
  UNIQUE KEY `study_offline_study_id_interest_location_UNIQUE` (`study_id`,`interest_location`),
  KEY `study_offline_study_id_fk_idx` (`study_id`),
  CONSTRAINT `study_offline_study_id_fk` FOREIGN KEY (`study_id`) REFERENCES `study` (`study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_location`
--

LOCK TABLES `study_location` WRITE;
/*!40000 ALTER TABLE `study_location` DISABLE KEYS */;
INSERT INTO `study_location` VALUES (2,'BB00001','서울특별시 강남구 역삼1동'),(12,'BB00001','서울특별시 강남구 역삼2동'),(3,'BB00002','서울특별시 강남구 역삼2동'),(4,'BB00003','서울특별시 강남구 역삼3동'),(5,'BF00001','서울특별시 강남구 역삼4동'),(11,'BF00001','서울특별시 강남구 역삼동'),(6,'BF00002','서울특별시 강남구 역삼5동'),(7,'PB00001','서울특별시 강남구 역삼6동'),(8,'PF00001','서울특별시 강남구 역삼7동'),(1,'PF00001','서울특별시 강남구 역삼동'),(9,'PF00002','서울특별시 강남구 역삼8동'),(10,'PF00003','서울특별시 강남구 역삼9동');
/*!40000 ALTER TABLE `study_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_member`
--

DROP TABLE IF EXISTS `study_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_member` (
  `study_id` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `STUDY_MEMBER_STATUS_CODE` varchar(20) NOT NULL DEFAULT 'WA',
  `enroll_date` datetime NOT NULL,
  `exit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`study_id`,`id`),
  KEY `study_member_id_fk_idx` (`id`),
  KEY `study_member_STUDY_MEMBER_STATUS_CODE_fk_idx` (`STUDY_MEMBER_STATUS_CODE`),
  CONSTRAINT `study_member_STUDY_MEMBER_STATUS_CODE_fk` FOREIGN KEY (`STUDY_MEMBER_STATUS_CODE`) REFERENCES `study_member_status_cd` (`STUDY_MEMBER_STATUS_CODE`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `study_member_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `study_member_study_id_fk` FOREIGN KEY (`study_id`) REFERENCES `study` (`study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Specify all members joined to a study.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_member`
--

LOCK TABLES `study_member` WRITE;
/*!40000 ALTER TABLE `study_member` DISABLE KEYS */;
INSERT INTO `study_member` VALUES ('BB00001','aaa123','LE','2019-01-10 00:00:00',NULL),('BB00001','bbb123','ME','2019-01-10 01:00:00',NULL),('BB00001','ccc123','ME','2019-01-10 00:30:00',NULL),('BB00001','ddd123','ME','2019-01-10 00:40:00',NULL),('BB00001','fff123','ME','2019-01-10 02:00:00',NULL),('BB00001','ggg123','WA','2019-01-10 04:00:00',NULL),('BB00001','hhh123','DE','2019-01-10 06:00:00',NULL),('BB00001','iii123','EX','2019-01-10 08:00:00','2019-01-12 08:00:00'),('BB00002','bbb123','ME','2019-01-16 20:50:36',NULL),('BB00002','ccc123','LE','2019-01-15 20:50:36',NULL),('BB00002','eee123','ME','2019-01-16 20:50:36',NULL),('BB00002','ggg123','ME','2019-01-16 20:50:36',NULL),('BB00003','ddd123','LE','2019-01-17 20:57:05',NULL),('BB00003','eee123','ME','2019-01-18 20:57:05',NULL),('BB00003','ggg123','ME','2019-01-18 20:57:05',NULL),('BB00003','hhh123','ME','2019-01-18 20:57:05',NULL),('BB00003','iii123','ME','2019-01-18 20:57:05',NULL),('BF00001','aaa123','LE','2018-10-10 09:00:00',NULL),('BF00002','aaa123','WA','2018-11-01 01:00:00',NULL),('BF00002','bbb123','ME','2018-11-01 01:00:00',NULL),('BF00002','ccc123','ME','2018-11-01 01:00:00',NULL),('BF00002','eee123','LE','2018-11-01 00:00:00',NULL),('BF00002','fff123','ME','2019-01-15 10:12:47',NULL),('BF00002','iii123','ME','2018-11-01 01:00:00',NULL),('BO00001','aaa123','LE','2018-09-15 09:00:00',NULL),('BO00001','bbb123','ME','2018-09-15 10:00:00',NULL),('BO00001','ccc123','ME','2018-09-15 10:00:00',NULL),('PB00001','aaa123','ME','2018-08-31 01:00:00',NULL),('PB00001','bbb123','LE','2018-08-31 00:00:00',NULL),('PB00001','ccc123','ME','2018-08-31 01:00:00',NULL),('PB00001','ddd123','ME','2018-08-31 01:00:00',NULL),('PB00001','eee123','DE','2018-08-31 01:00:00',NULL),('PB00001','fff123','ME','2018-08-31 01:00:00',NULL),('PB00001','ggg123','ME','2018-08-31 01:00:00',NULL),('PB00001','hhh123','ME','2018-08-31 01:00:00',NULL),('PB00001','iii123','ME','2018-08-31 01:00:00',NULL),('PF00001','bbb123','LE','2018-09-10 12:00:00',NULL),('PF00002','aaa123','ME','2019-01-15 05:54:50',NULL),('PF00002','bbb123','ME','2019-01-15 06:54:50',NULL),('PF00002','ccc123','ME','2019-01-15 07:54:50',NULL),('PF00002','ddd123','ME','2019-01-15 08:54:50',NULL),('PF00002','eee123','LE','2019-01-15 00:00:00',NULL),('PF00002','fff123','WA','2019-01-15 01:54:50',NULL),('PF00002','ggg123','DE','2019-01-15 02:54:50',NULL),('PF00002','hhh123','EX','2019-01-15 03:54:50','2019-01-17 00:54:50'),('PF00002','iii123','ME','2019-01-15 04:54:50',NULL),('PF00003','ddd123','LE','2018-09-11 20:58:52',NULL),('PF00003','eee123','ME','2018-09-11 21:58:52',NULL),('PF00003','ggg123','ME','2018-09-11 21:58:52',NULL),('PF00003','hhh123','ME','2018-09-11 21:58:52',NULL),('PF00003','iii123','ME','2018-09-11 21:58:52',NULL),('PO00001','aaa123','ME','2018-11-16 00:33:36',NULL),('PO00001','bbb123','LE','2018-11-11 00:33:36',NULL),('PO00001','ccc123','ME','2018-11-16 00:33:36',NULL),('PO00001','ddd123','ME','2018-11-16 00:33:36',NULL),('PO00001','eee123','ME','2018-11-16 00:33:36',NULL),('PO00001','fff123','WA','2018-11-16 00:33:36',NULL),('PO00001','ggg123','DE','2018-11-16 00:33:36',NULL),('PO00001','hhh123','EX','2018-11-16 00:33:36','2019-01-13 04:00:00'),('PO00001','iii123','ME','2018-11-16 00:33:36',NULL),('PO00002','aaa123','ME','2018-11-21 00:00:00',NULL),('PO00002','bbb123','EX','2018-11-21 00:00:00','2018-12-10 00:00:00'),('PO00002','ccc123','ME','2018-11-21 00:00:00',NULL),('PO00002','ddd123','EX','2018-11-21 00:00:00','2018-11-28 00:00:00'),('PO00002','eee123','LE','2018-11-20 00:00:00',NULL),('PO00002','ggg123','ME','2018-11-22 00:00:00',NULL),('PO00002','iii123','ME','2018-11-22 00:00:00',NULL),('PO00003','aaa123','LE','2019-01-15 00:00:00',NULL);
/*!40000 ALTER TABLE `study_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mia`@`%`*/ /*!50003 TRIGGER `StudyRepublic`.`study_member_AFTER_INSERT` AFTER INSERT ON `study_member` FOR EACH ROW
BEGIN
update study s
	set enroll_actual = (select count(m.id) from study_member m 
							where m.study_id = s.study_id 
							and (m.study_member_status_code = 'LE' or m.study_member_status_code = 'ME') 
                            group by m.study_id)
	where study_id like 'B%' or study_id like 'P%';
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `study_member_status_cd`
--

DROP TABLE IF EXISTS `study_member_status_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_member_status_cd` (
  `STUDY_MEMBER_STATUS_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`STUDY_MEMBER_STATUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes status of a study member.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_member_status_cd`
--

LOCK TABLES `study_member_status_cd` WRITE;
/*!40000 ALTER TABLE `study_member_status_cd` DISABLE KEYS */;
INSERT INTO `study_member_status_cd` VALUES ('DE','DENIED','거절'),('EX','EXIT','탈퇴'),('LE','LEADER','리더'),('ME','MEMBER','승인'),('WA','MEMBER_WAIT','승인대기');
/*!40000 ALTER TABLE `study_member_status_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_noticeboard`
--

DROP TABLE IF EXISTS `study_noticeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_noticeboard` (
  `study_noticeboard_id` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `date` datetime NOT NULL,
  `id` varchar(15) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `day` datetime DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`study_noticeboard_id`),
  KEY `study_noticeboard_id$study_id_fk_idx` (`study_id`,`id`),
  CONSTRAINT `study_noticeboard_id$study_id_fk` FOREIGN KEY (`study_id`, `id`) REFERENCES `study_member` (`study_id`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='스터디 공지사항 게시판 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_noticeboard`
--

LOCK TABLES `study_noticeboard` WRITE;
/*!40000 ALTER TABLE `study_noticeboard` DISABLE KEYS */;
INSERT INTO `study_noticeboard` VALUES (1,'BB00001',1,'수업 시작합니다.','반갑습니다','2019-01-10 01:00:00','aaa123','00:00:00','00:00:00','2019-01-15 00:00:00','',0),(2,'BB00001',2,'수업 시간은 변동없습니다. 장소 확인하세요.','(수업 내용) (지도)','2019-01-10 01:03:02','aaa123','00:12:00','00:14:00','2019-01-15 00:00:00','서울시 강남구',0),(3,'PF00002',1,'안녕하세요 수업 공지입니다.','정상 시간대로 진행 될 예정입니다. 서적 지참해주세요.','2019-01-15 08:00:00','eee123','00:19:00','00:10:00','2019-01-15 00:00:00','서울시 서초구',0),(4,'PO00001',1,'반갑습니다.','수업일자가 변동되었습니다.','2019-01-11 07:00:00','bbb123','00:18:00','00:20:00','2019-02-02 00:00:00','서울시 동작구',0),(5,'BB00001',3,'3입니다','3입니다','2019-01-28 07:00:00','aaa123','00:00:00','00:00:00','2019-02-02 00:00:00','서울시 강남구',0);
/*!40000 ALTER TABLE `study_noticeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_noticeboard_file`
--

DROP TABLE IF EXISTS `study_noticeboard_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_noticeboard_file` (
  `study_noticeboard_file_id` int(11) NOT NULL,
  `study_noticeboard_id` int(11) NOT NULL,
  `filenumber` int(11) NOT NULL,
  `originname` varchar(20) NOT NULL,
  `savename` varchar(20) NOT NULL,
  PRIMARY KEY (`study_noticeboard_file_id`),
  UNIQUE KEY `study_noticeboard_id_UNIQUE` (`study_noticeboard_id`,`filenumber`),
  KEY `study_noticeboard_file_study_noticeboard_id_fk_idx` (`study_noticeboard_id`),
  CONSTRAINT `study_noticeboard_file_study_noticeboard_id_fk` FOREIGN KEY (`study_noticeboard_id`) REFERENCES `study_noticeboard` (`study_noticeboard_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_noticeboard_file`
--

LOCK TABLES `study_noticeboard_file` WRITE;
/*!40000 ALTER TABLE `study_noticeboard_file` DISABLE KEYS */;
INSERT INTO `study_noticeboard_file` VALUES (1,2,1,'image.jpg ','asdfasdfdf.jpg'),(2,2,2,'video.avi','asdfasdfa2.avi'),(3,3,1,'text.txt','asdfadsfas3.txt'),(4,4,1,'text2.txt','asdfasdfas4.txt'),(5,4,2,'pdf.pdf','asdfasdfas5.pdf'),(6,3,2,'image2.jpg','asdfasdfas8.jpg');
/*!40000 ALTER TABLE `study_noticeboard_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_noticeboard_reply`
--

DROP TABLE IF EXISTS `study_noticeboard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_noticeboard_reply` (
  `study_noticeboard_reply_id` int(11) NOT NULL,
  `study_noticeboard_id` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `replygroup` int(11) NOT NULL,
  `replystep` int(11) NOT NULL,
  PRIMARY KEY (`study_noticeboard_reply_id`),
  KEY `study_noticeboard_reply_study_noticeboard_id_fk_idx` (`study_noticeboard_id`),
  KEY `study_noticeboard_reply_id$study_id_fk_idx` (`study_id`,`id`),
  CONSTRAINT `study_noticeboard_reply_id$study_id_fk` FOREIGN KEY (`study_id`, `id`) REFERENCES `study_member` (`study_id`, `id`),
  CONSTRAINT `study_noticeboard_reply_study_noticeboard_id_fk` FOREIGN KEY (`study_noticeboard_id`) REFERENCES `study_noticeboard` (`study_noticeboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공지사항 게시판 덧글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_noticeboard_reply`
--

LOCK TABLES `study_noticeboard_reply` WRITE;
/*!40000 ALTER TABLE `study_noticeboard_reply` DISABLE KEYS */;
INSERT INTO `study_noticeboard_reply` VALUES (1,1,'BB00001','bbb123','반갑습니다!','2019-01-10 00:00:00',1,0),(2,1,'BB00001','ccc123','반갑습니다2','2019-01-10 00:00:00',2,0),(3,1,'BB00001','aaa123','안녕하세요^^','2019-01-10 00:00:00',1,1),(4,1,'BB00001','aaa123','안녕하세요2^^','2019-01-10 00:00:00',2,1),(5,1,'BB00001','bbb123','헉 보고 계셨군요','2019-01-10 00:00:00',1,2),(6,1,'BB00001','ddd123','안녕하세요!!!3','2019-01-10 00:00:00',3,0),(7,1,'BB00001','aaa123','물론이죠! ^^','2019-01-10 00:00:00',1,3);
/*!40000 ALTER TABLE `study_noticeboard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_price`
--

DROP TABLE IF EXISTS `study_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_price` (
  `study_id` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`study_id`),
  CONSTRAINT `study_premium_study_id_fk` FOREIGN KEY (`study_id`) REFERENCES `study` (`study_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information for the premium studies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_price`
--

LOCK TABLES `study_price` WRITE;
/*!40000 ALTER TABLE `study_price` DISABLE KEYS */;
INSERT INTO `study_price` VALUES ('PB00001',30000),('PF00001',20000),('PF00002',55000),('PF00003',75000),('PO00001',105000),('PO00002',10000),('PO00003',20000);
/*!40000 ALTER TABLE `study_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_qnaboard`
--

DROP TABLE IF EXISTS `study_qnaboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_qnaboard` (
  `study_qnaboard_id` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`study_qnaboard_id`),
  KEY `study_qnaboard_study_id_fk_idx` (`study_id`),
  KEY `study_qnaboard_id$study_id_fk_idx` (`study_id`,`id`),
  CONSTRAINT `study_qnaboard_id$study_id_fk` FOREIGN KEY (`study_id`, `id`) REFERENCES `study_member` (`study_id`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='질문및 답변게시판';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_qnaboard`
--

LOCK TABLES `study_qnaboard` WRITE;
/*!40000 ALTER TABLE `study_qnaboard` DISABLE KEYS */;
INSERT INTO `study_qnaboard` VALUES (1,'PF00002',1,'수업 변동 될 가능성이 있나요?','제목이 곧 내용입니다.','2019-01-15 03:54:50','aaa123',0),(2,'PF00002',2,'문제가 너무 어렵네요','수업 땐 쉬울까요?','2019-01-15 03:54:50','bbb123',0),(3,'PO00001',1,'스터디 나가도 될까요?','안하고 싶네요','2019-01-15 03:54:50','ccc123',0),(4,'PF00002',3,'3번 문제 어떻게 푸나요?','혹시 답 아시는 분?','2019-01-15 03:54:50','eee123',0),(5,'PO00001',2,'꿀꿀꿀','멍멍멍','2019-01-15 03:54:50','ddd123',0),(6,'BB00001',1,'띠요옹 TEST','테스트라고','2019-01-31 10:50:00','aaa123',0);
/*!40000 ALTER TABLE `study_qnaboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_qnaboard_file`
--

DROP TABLE IF EXISTS `study_qnaboard_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_qnaboard_file` (
  `study_qnaboard_file_id` int(11) NOT NULL,
  `study_qnaboard_id` int(11) NOT NULL,
  `filenumber` int(11) NOT NULL,
  `originname` varchar(20) NOT NULL,
  `savename` varchar(20) NOT NULL,
  PRIMARY KEY (`study_qnaboard_file_id`),
  UNIQUE KEY `study_qnaboard_file_UNIQUE` (`study_qnaboard_id`,`filenumber`),
  KEY `study_qnaboard_file_fk_idx` (`study_qnaboard_id`),
  CONSTRAINT `study_qnaboard_file_study_qnaboard_id_fk` FOREIGN KEY (`study_qnaboard_id`) REFERENCES `study_qnaboard` (`study_qnaboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_qnaboard_file`
--

LOCK TABLES `study_qnaboard_file` WRITE;
/*!40000 ALTER TABLE `study_qnaboard_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_qnaboard_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_qnaboard_reply`
--

DROP TABLE IF EXISTS `study_qnaboard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_qnaboard_reply` (
  `study_qnaboard_reply_id` int(11) NOT NULL,
  `study_qnaboard_id` int(11) NOT NULL,
  `study_id` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `replygroup` int(11) NOT NULL,
  `replystep` int(11) NOT NULL,
  PRIMARY KEY (`study_qnaboard_reply_id`),
  UNIQUE KEY `study_qnaboard_id_UNIQUE` (`study_qnaboard_id`,`replygroup`,`replystep`),
  KEY `study_qnaboard_reply_id$study_id_fk_idx` (`study_id`,`id`),
  CONSTRAINT `study_qnaboard_reply_id$study_id_fk` FOREIGN KEY (`study_id`, `id`) REFERENCES `study_member` (`study_id`, `id`),
  CONSTRAINT `study_qnaboard_reply_study_qnaboard_id_fk` FOREIGN KEY (`study_qnaboard_id`) REFERENCES `study_qnaboard` (`study_qnaboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='질문 및 답변 게시판';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_qnaboard_reply`
--

LOCK TABLES `study_qnaboard_reply` WRITE;
/*!40000 ALTER TABLE `study_qnaboard_reply` DISABLE KEYS */;
INSERT INTO `study_qnaboard_reply` VALUES (1,1,'PF00002','eee123','아뇨 없습니다','2019-01-15 03:54:50',1,0),(2,2,'PF00002','ggg123','괜찮지 않을까요?','2019-01-15 03:54:50',1,0),(3,3,'PO00001','ccc123','그건 자유 아닌가요?','2019-01-15 03:54:50',1,0),(4,2,'PF00002','eee123','쉽게 하도록 하겠습니다','2019-01-15 03:54:50',2,0),(5,2,'PF00002','eee123','잘 알려드릴게요 ^^','2019-01-15 03:54:50',1,1),(6,3,'PO00001','bbb123','마음대로 하셔도 괜찮습니다~','2019-01-15 03:54:50',2,0);
/*!40000 ALTER TABLE `study_qnaboard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_status_cd`
--

DROP TABLE IF EXISTS `study_status_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_status_cd` (
  `STUDY_STATUS_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`STUDY_STATUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='스터디 상태 코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_status_cd`
--

LOCK TABLES `study_status_cd` WRITE;
/*!40000 ALTER TABLE `study_status_cd` DISABLE KEYS */;
INSERT INTO `study_status_cd` VALUES ('C','CLOSED','완료'),('D','DISBAND','해체'),('F','FULL','모집마감'),('G','ONGOING','진행중'),('O','OPENED','모집중');
/*!40000 ALTER TABLE `study_status_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `tutor_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(15) NOT NULL,
  `EDUCATION_CODE` varchar(20) DEFAULT NULL,
  `introduction` varchar(500) NOT NULL,
  PRIMARY KEY (`tutor_number`),
  KEY `tutor_id_fk_idx` (`id`),
  KEY `tutor_EDUCATION_CODE_fk_idx` (`EDUCATION_CODE`),
  CONSTRAINT `tutor_educationcode_fk` FOREIGN KEY (`EDUCATION_CODE`) REFERENCES `education_cd` (`EDUCATION_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tutor_id_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
INSERT INTO `tutor` VALUES (1,'aaa123','B','나는 이미연누나 입니다. 저는 JAVA를 잘하고 현재 비트캠프 부조장입니다. '),(2,'bbb123','B','나는 이요한이다. 나는 수원에 산다. '),(3,'ccc123','B','나는 원시켱 입니다. 저는 잠실에 거주합니다.'),(4,'ddd123','B','나는 김준석이요. 호날두 팬입니다.'),(5,'eee123','B','나는 윤성호 입니다. 전 멸치입니다.'),(65,'xxx123','D','dfgdfg');
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_career`
--

DROP TABLE IF EXISTS `tutor_career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_career` (
  `tutor_career_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_number` int(11) DEFAULT NULL,
  `CAREER_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tutor_career_id`),
  KEY `tutor_career_CAREER_CODE_fk_idx` (`CAREER_CODE`),
  KEY `tutor_career_tutor_tutor_number_idx` (`tutor_number`),
  CONSTRAINT `tutor_career_CAREER_CODE_fk` FOREIGN KEY (`CAREER_CODE`) REFERENCES `career_cd` (`CAREER_CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tutor_career_tutor_tutor_number` FOREIGN KEY (`tutor_number`) REFERENCES `tutor` (`tutor_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='강사희망분야 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_career`
--

LOCK TABLES `tutor_career` WRITE;
/*!40000 ALTER TABLE `tutor_career` DISABLE KEYS */;
INSERT INTO `tutor_career` VALUES (1,1,'PW'),(2,1,'SD'),(3,2,'PW'),(4,2,'SD'),(5,3,'PW'),(6,3,'PA'),(7,4,'PA'),(8,4,'PW'),(9,5,'PA'),(10,5,'PW'),(102,65,'ER'),(103,65,'MO'),(104,65,'PA'),(105,65,'DA');
/*!40000 ALTER TABLE `tutor_career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_file`
--

DROP TABLE IF EXISTS `tutor_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_file` (
  `tutor_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_number` int(11) NOT NULL,
  `tutorfile_originname` varchar(32) DEFAULT NULL,
  `tutorfile_savename` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tutor_file_id`),
  KEY `tutor_file_tutor_tutor_number_idx` (`tutor_number`),
  CONSTRAINT `tutor_file_tutor_tutor_number` FOREIGN KEY (`tutor_number`) REFERENCES `tutor` (`tutor_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='강사경력파일테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_file`
--

LOCK TABLES `tutor_file` WRITE;
/*!40000 ALTER TABLE `tutor_file` DISABLE KEYS */;
INSERT INTO `tutor_file` VALUES (1,1,'mia.word','4e3k32yxgm.word'),(2,1,'mia_certifiacation.jpg','jsgkd29746.jpg'),(3,2,'yohan.word','5xvehjwy32.word'),(4,2,'yohan_career.jpg','hs35y5f7kd.jpg'),(5,3,'wonsik.word','whq72tepbr.word'),(6,3,'wonsik_career.jpg','kaqw6khmka.jpg'),(7,4,'joonseok.word','5kzpdert57.word'),(8,4,'joonseok_career.jpg','vf6rwmbq6z.jpg'),(9,5,'seongho.word','qzqebq93sz.word'),(10,5,'seongho_career.jpg','c9n4ma6t58.jpg');
/*!40000 ALTER TABLE `tutor_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_interest`
--

DROP TABLE IF EXISTS `tutor_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_interest` (
  `tutor_interest_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_number_` int(11) DEFAULT NULL,
  `INTEREST_2_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tutor_interest_id`),
  KEY `tutor_INTEREST_2_CODE_fk_idx` (`INTEREST_2_CODE`),
  KEY `tutor_interest_tutor_tutor_number_idx` (`tutor_number_`),
  CONSTRAINT `tutor_interest_tutor_tutor_number` FOREIGN KEY (`tutor_number_`) REFERENCES `tutor` (`tutor_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_interest`
--

LOCK TABLES `tutor_interest` WRITE;
/*!40000 ALTER TABLE `tutor_interest` DISABLE KEYS */;
INSERT INTO `tutor_interest` VALUES (1,1,'P01'),(2,1,'D01'),(3,2,'P01'),(4,2,'D01'),(5,3,'P01'),(6,3,'W01'),(7,4,'P01'),(8,4,'W01'),(9,5,'P01'),(10,5,'D01'),(104,65,'D03'),(105,65,'D02'),(106,65,'D04'),(107,65,'W04');
/*!40000 ALTER TABLE `tutor_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_cd`
--

DROP TABLE IF EXISTS `type_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_cd` (
  `TYPE_CODE` varchar(20) NOT NULL,
  `CODE_VALUE_ENGLISH` varchar(20) DEFAULT NULL,
  `CODE_VALUE_KOREAN` varchar(20) NOT NULL,
  PRIMARY KEY (`TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes types of study. (BASIC/PREMIUM)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_cd`
--

LOCK TABLES `type_cd` WRITE;
/*!40000 ALTER TABLE `type_cd` DISABLE KEYS */;
INSERT INTO `type_cd` VALUES ('B','BASIC_STUDY','일반 스터디'),('P','PREMUIM_STUDY','프리미엄 스터디');
/*!40000 ALTER TABLE `type_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `popular_bs_interest`
--

/*!50001 DROP VIEW IF EXISTS `popular_bs_interest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lee`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_bs_interest` AS select `StudyRepublic`.`interest_2_cd`.`INTEREST_2_CODE` AS `interest_2_code`,`StudyRepublic`.`interest_2_cd`.`CODE_VALUE_ENGLISH` AS `CODE_VALUE_ENGLISH`,`StudyRepublic`.`interest_2_cd`.`CODE_VALUE_KOREAN` AS `CODE_VALUE_KOREAN`,`StudyRepublic`.`interest_2_cd`.`INTEREST_1_CODE` AS `INTEREST_1_CODE` from (`StudyRepublic`.`interest_2_cd` join (select `StudyRepublic`.`study_interest`.`interest_2_code` AS `interest_2_code`,count(0) AS `popular_interest` from (`StudyRepublic`.`study_interest` join `StudyRepublic`.`study` on((`StudyRepublic`.`study_interest`.`study_id` = `StudyRepublic`.`study`.`study_id`))) where (`StudyRepublic`.`study`.`TYPE_CODE` = 'B') group by `StudyRepublic`.`study_interest`.`interest_2_code` order by `popular_interest` desc) `a` on((`StudyRepublic`.`interest_2_cd`.`INTEREST_2_CODE` = `a`.`interest_2_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_pr_interest`
--

/*!50001 DROP VIEW IF EXISTS `popular_pr_interest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lee`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_pr_interest` AS select `StudyRepublic`.`interest_2_cd`.`INTEREST_2_CODE` AS `interest_2_code`,`StudyRepublic`.`interest_2_cd`.`CODE_VALUE_ENGLISH` AS `CODE_VALUE_ENGLISH`,`StudyRepublic`.`interest_2_cd`.`CODE_VALUE_KOREAN` AS `CODE_VALUE_KOREAN`,`StudyRepublic`.`interest_2_cd`.`INTEREST_1_CODE` AS `INTEREST_1_CODE` from (`StudyRepublic`.`interest_2_cd` join (select `StudyRepublic`.`study_interest`.`interest_2_code` AS `interest_2_code`,count(0) AS `popular_interest` from (`StudyRepublic`.`study_interest` join `StudyRepublic`.`study` on((`StudyRepublic`.`study_interest`.`study_id` = `StudyRepublic`.`study`.`study_id`))) where (`StudyRepublic`.`study`.`TYPE_CODE` = 'P') group by `StudyRepublic`.`study_interest`.`interest_2_code` order by `popular_interest` desc) `a` on((`StudyRepublic`.`interest_2_cd`.`INTEREST_2_CODE` = `a`.`interest_2_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_study`
--

/*!50001 DROP VIEW IF EXISTS `popular_study`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lee`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_study` AS select `StudyRepublic`.`study`.`study_id` AS `study_id`,`StudyRepublic`.`study`.`name` AS `name`,`StudyRepublic`.`study`.`leader_id` AS `leader_id`,`StudyRepublic`.`study`.`TYPE_CODE` AS `TYPE_CODE`,`StudyRepublic`.`study`.`ONOFF_CODE` AS `ONOFF_CODE`,`StudyRepublic`.`study`.`STUDY_STATUS_CODE` AS `STUDY_STATUS_CODE`,`StudyRepublic`.`study`.`LEVEL_CODE` AS `LEVEL_CODE`,`StudyRepublic`.`study`.`start_date` AS `start_date`,`StudyRepublic`.`study`.`end_date` AS `end_date`,`StudyRepublic`.`study`.`DAY_CODE` AS `DAY_CODE`,`StudyRepublic`.`study`.`study_count` AS `study_count`,`StudyRepublic`.`study`.`start_time` AS `start_time`,`StudyRepublic`.`study`.`end_time` AS `end_time`,`StudyRepublic`.`study`.`enroll_capacity` AS `enroll_capacity`,`StudyRepublic`.`study`.`enroll_actual` AS `enroll_actual`,`StudyRepublic`.`study`.`introduction` AS `introduction`,`StudyRepublic`.`study`.`has_leveltest` AS `has_leveltest`,`StudyRepublic`.`study`.`disband_date` AS `disband_date`,`StudyRepublic`.`study`.`post_date` AS `post_date` from `StudyRepublic`.`study` where (`StudyRepublic`.`study`.`leader_id` in (select distinct `StudyRepublic`.`study`.`leader_id` from (((select `StudyRepublic`.`review`.`study_id` AS `study_id`,round(avg(`StudyRepublic`.`review`.`score`),1) AS `score` from `StudyRepublic`.`review` group by `StudyRepublic`.`review`.`study_id` having (`score` >= 4.5))) `a` join `StudyRepublic`.`study` on((`a`.`study_id` = `StudyRepublic`.`study`.`study_id`)))) and (`StudyRepublic`.`study`.`STUDY_STATUS_CODE` = 'O')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recommend_tutor_member`
--

/*!50001 DROP VIEW IF EXISTS `recommend_tutor_member`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lee`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `recommend_tutor_member` AS select `StudyRepublic`.`member`.`id` AS `id`,`StudyRepublic`.`member`.`MEMBER_STATUS_CODE` AS `MEMBER_STATUS_CODE`,`StudyRepublic`.`member`.`GRADE_CODE` AS `GRADE_CODE`,`StudyRepublic`.`member`.`password` AS `password`,`StudyRepublic`.`member`.`name` AS `name`,`StudyRepublic`.`member`.`gender` AS `gender`,`StudyRepublic`.`member`.`birth` AS `birth`,`StudyRepublic`.`member`.`nickname` AS `nickname`,`StudyRepublic`.`member`.`email` AS `email`,`StudyRepublic`.`member`.`phonenumber` AS `phonenumber`,`StudyRepublic`.`member`.`visibility` AS `visibility`,`StudyRepublic`.`member`.`profile_origin_name` AS `profile_origin_name`,`StudyRepublic`.`member`.`profile_save_name` AS `profile_save_name`,`StudyRepublic`.`member`.`registration_date` AS `registration_date` from (`StudyRepublic`.`member` join (select `StudyRepublic`.`study`.`leader_id` AS `leader_id`,count(0) AS `count_study` from `StudyRepublic`.`study` where (`StudyRepublic`.`study`.`TYPE_CODE` = 'P') group by `StudyRepublic`.`study`.`leader_id` order by `count_study` desc limit 3) `a`) where (`StudyRepublic`.`member`.`id` = `a`.`leader_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-01 18:07:42
