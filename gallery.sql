-- MySQL Workbench Synchronization
-- Generated: 2020-08-22 19:26
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: leona

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE  IF NOT EXISTS `db_gallery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_gallery`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (301,'leonardo','giusti','leonardo.giusti','leo123'),(302,'luca','giudici','luca.giudici','luca1998'),(303,'davide','guerra','davide.guerra','dado98'),(304,'karl','klay','karl.klay','karllrak'), (305,'anonino','ignoto','a','a');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'first','2020-06-21 20:14:08'),(2,'HELLO WRLD','2020-06-21 13:14:08'),(3,'2020-06-21 21:12:08','2020-06-21 21:12:08');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` INT(11) NOT NULL ,
  `title` VARCHAR(50) NOT NULL,
  `text` VARCHAR(2555) NOT NULL,
  `directory` VARCHAR(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (200,'tartaruga','ninja ','C:/Users/Cipo/git/tiw-image_gallery/images','2015-01-01 20:14:08'),(201,'aquila','one text','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-21 20:14:08'), (202,'capibara','che animale strano','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-26 17:14:08'),(203,'cervo','che bello','C:/Users/Cipo/git/tiw-image_gallery/images','2017-03-21 20:14:08'),(204,'civetta','guarda che occhi','C:/Users/Cipo/git/tiw-image_gallery/images','2020-01-23 20:00:08'),(205,'drago_di_comodo','Fa paura','C:/Users/Cipo/git/tiw-image_gallery/images','2013-11-21 20:14:08'),(206,'gufo','che colore','C:/Users/Cipo/git/tiw-image_gallery/images','2019-08-21 20:14:08'),(207,'kiwi','pensavo fosse un frutto','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-21 20:14:00'),(208,'koala','first pic','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-21 20:14:08'),(209,'leone','segno zodiacale','C:/Users/Cipo/git/tiw-image_gallery/images','2020-02-11 20:14:08'),(210,'lince','una lince','C:/Users/Cipo/git/tiw-image_gallery/images','2018-10-21 10:14:08'),(211,'lupo','Timore','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-19 19:14:08'),(212,'pantera','nerissima','C:/Users/Cipo/git/tiw-image_gallery/images','2019-01-21 20:14:08'),(213,'pinguino','pingui','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-01 20:01:08'),(214,'elefante','dumbo','C:/Users/Cipo/git/tiw-image_gallery/images','2020-06-01 18:10:08');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userid` INT(11) NOT NULL REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  `image_id` INT(11) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  )
ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment`(userid, image_id, text) VALUES (301,201,'Primo'),(305,201,'Nice pic'),(301,201,'bellaaa foto'),(301,201,'wow'),(303,200,'che bella'),(302,204,'lol'),(304,205,'nice'),(301,207,'WOW'),(301,208,'Chic'),(301,211,'lol'),(304,211,'zoom'),(302,213,'pls'),(303,207,'good'),(303,203,'great'),(306,208,'awesome'),(311,210,'awww'),(306,201,'auuuuu'),(304,204,'hiiiii'),(309,202,'ooooh'),(302,200,'xxxxxxxD'),(300,205,'seems real');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `containment`;

CREATE TABLE IF NOT EXISTS `containment` (
  `albumid` INT(11) NOT NULL,
  `imageid` INT(11) NOT NULL,
  FOREIGN KEY (`albumid`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`imageid`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`albumid`, `imageid`)
  )
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `containment` WRITE;
/*!40000 ALTER TABLE `containment` DISABLE KEYS */;
INSERT INTO `containment` VALUES (1,201),(1,202),(1,205),(1,206),(1,207),(1,208),(1,209),(2,210),(1,203),(1,204),(1,211),(2,212),(3,213),(1,214);
/*!40000 ALTER TABLE `containment` ENABLE KEYS */;
UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
