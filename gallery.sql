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
INSERT INTO `user` VALUES (301,'leonardo','giusti','leonardo.giusti','leo123'),(302,'luca','giudici','luca.giudici','luca1998'),(303,'davide','guerra','davide.guerra','dado98'),(304,'karl','klay','karl.klay','karllrak'), (305,'anon','cogn','a','a');
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
INSERT INTO `album` VALUES (1,'first','2020-06-21 20:14:08'),(2,'HELLO WRLD','2020-06-21 13:14:08'),(3,'2020-06-21 21:12:08','2020-06-21 21:12:08'),(4,'second','2012-06-21 20:14:08'),(5,'me','2020-04-21 20:14:08'),(6,'hi','2020-01-21 20:14:08'),(7,'html','2018-02-21 20:14:08');
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
INSERT INTO `image` VALUES (201,'koala','one text','C:/Users/leona/git/tiw-image_gallery/images','2020-06-21 20:14:08'), (202,'leone','one text','C:/Users/leona/git/tiw-image_gallery/images','2020-06-21 20:14:08');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userid` INT(11) NOT NULL,
  `image_id` INT(11) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  )
ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (100,1,1,'Primo'),(101,2,1,'Nice pic'),(103,1,1,'bellaaa');
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
INSERT INTO `containment` VALUES (1,201),(2,202),(5,202);
/*!40000 ALTER TABLE `containment` ENABLE KEYS */;
UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
