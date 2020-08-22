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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'leonardo','giusti','leonardo.giusti','leo123'),(2,'luca','giudici','luca.giudici','luca1998'),(3,'davide','guerra','davide.guerra','dado98'),(4,'karl','klay','karl.klay','karllrak');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id` ) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'first','2020-06-21 20:14:08',),(2,'HELLO WRLD','2020-06-21 13:14:08'),(3,'2020-06-21 21:12:08','2020-06-21 21:12:08'),(4,'second','2012-06-21 20:14:08'),(5,'me','2020-04-21 20:14:08'),(6,'hi','2020-01-21 20:14:08'),(7,'html','2018-02-21 20:14:08');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `text` VARCHAR(2555) NOT NULL,
  `directory` VARCHAR(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'one','one text','C:\Users\Desktop\gallery\first','2020-06-21 20:14:08'),(2,'one','HELLO WRLD','C:\Users\Desktop\gallery\first','2020-06-21 13:14:08'),(3,'2020-06-21 21:12:08','sad','C:\Users\Desktop\gallery\first','2020-06-21 21:12:08'),(4,'second','four','C:\Users\Desktop\gallery\first','2012-06-21 20:14:08'),(5,'me','five','C:\Users\Desktop\gallery\first','2020-04-21 20:14:08'),(6,'hi','six','C:\Users\Desktop\gallery\first','2020-01-21 20:14:08'),(7,'html','seven','C:\Users\Desktop\gallery\first','2018-02-21 20:14:08'),(8,'fff','eight','C:\Users\Desktop\gallery\first','2018-06-21 20:13:08'),(9,'friend','nine','C:\Users\Desktop\gallery\first','2000-06-21 20:14:08'),(10,'no capture','ten','C:\Users\Desktop\gallery\first','2019-10-21 20:14:08'),(11,'ciao','eleven','C:\Users\Desktop\gallery\first','2020-01-11 20:14:08'),(12,'maila','twelve','C:\Users\Desktop\gallery\HELLO_WRLD','2011-05-24 20:14:08'),(13,'hjhj','tredicipietro','C:\Users\Desktop\gallery\HELLO_WRLD','2020-07-28 20:14:08'),(14,'pet','fourteen','C:\Users\Desktop\gallery\HELLO_WRLD','2019-01-10 20:13:08'),(15,'instagram','fifteen','C:\Users\Desktop\gallery\HELLO_WRLD','2012-08-21 11:14:08'),(16,'babbo','sixteen','C:\Users\Desktop\gallery\HELLO_WRLD','2019-09-01 20:14:08'),(17,'sisters','seventeen','C:\Users\Desktop\gallery\HELLO_WRLD','2001-09-21 20:14:08'),(18,'flick','eighteen','C:\Users\Desktop\gallery\second','2020-03-21 20:18:08'),(19,'table','nineteen','C:\Users\Desktop\gallery\second','2017-03-21 11:14:08'),(20,'go','twenty','C:\Users\Desktop\gallery\second','2016-06-21 20:14:08'),(21,'damn','twentyone','C:\Users\Desktop\gallery\second','2018-03-17 20:15:08'),(22,'HELLO WRLD 333','twentytwo','C:\Users\Desktop\gallery\second','2020-06-19 11:14:08'),(23,'2020-06-22 22:12:08','twentythree','C:\Users\Desktop\gallery\second','2020-06-22 22:12:08'),(24,'seconddnoces','twentyfour','C:\Users\Desktop\gallery\me','2015-04-25 20:14:58'),(25,'memmeme','twentyfive','C:\Users\Desktop\gallery\me','2020-10-19 20:19:47'),(26,'hi max','twentysix','C:\Users\Desktop\gallery\me','2020-01-21 15:14:08');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `user_id` INT(11) NOT NULL,
  `image_id` INT(11) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`, `image_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `image_id`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'Primo'),(2,1,'Nice pic'),(1,11,'bellaaa'),(2,1,'hi'),(1,22,'xd lol'),(3,11,'xd'),(1,15,'really nice'),(2,16,'pic pic pic'),(4,15,'Primo'),(3,18,'gallery'),(2,10,'asmr'),(3,18,'horrible pic'),(4,19,'fail'),(3,21,'No capture needed'),(1,21,'insert text'),(2,25,'text'),(1,23,'comment'),(3,8,'cute'),(2,7,'nice'),(3,11,'pop'),(4,15,'lol'),(3,16,'why'),(1,14,'Primo'),(21,1,'clear'),(1,12,'high'),(3,10,'daje');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS `gallery`.`order` (
  `user_id` INT(11) NOT NULL,
  `album_id` INT(11) NOT NULL,
  `identifier` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `album_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(2,5,5),(2,1,1),(2,2,2),(2,3,3),(2,4,4),(2,5,5),(3,1,1),(3,2,2),(3,3,3),(3,4,4),(3,5,5),(4,1,1),(4,2,2),(4,3,3),(4,4,4),(4,5,5);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
