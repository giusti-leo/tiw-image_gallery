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
DEFAULT CHARACTER SET = utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'leonardo','giusti','leonardo.giusti','leo123'),(2,'luca','giudici','luca.giudici','luca1998'),(3,'davide','guerra','davide.guerra','dado98'),(4,'karl','klay','karl.klay','karllrak');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id` ) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'first','2020-06-21 20:14:08'),(2,'HELLO WRLD','2020-06-21 13:14:08'),(3,'2020-06-21 21:12:08','2020-06-21 21:12:08'),(4,'second','2012-06-21 20:14:08'),(5,'me','2020-04-21 20:14:08'),(6,'hi','2020-01-21 20:14:08'),(7,'html','2018-02-21 20:14:08');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `text` VARCHAR(2555) NOT NULL,
  `directory` VARCHAR(255) NOT NULL,
  `date` datetime NOT NULL,
  `image` LONGBLOB ,
  PRIMARY KEY (`id`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'koala','one text','C:/Users/leona/git/tiw-image_gallery/images','2020-06-21 20:14:08', load_file('C:/Users/leona/git/tiw-image_gallery/images/koala.jpg')), (2,'leone','one text','C:/Users/leona/git/tiw-image_gallery/images','2020-06-21 20:14:08',LOAD_FILE('C:/Users/leona/git/tiw-image_gallery/images/leone.jpg'));
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userid` INT(11) NOT NULL,
  `image_id` INT(11) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `userid`
    FOREIGN KEY (`userid`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `image_id`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'Primo'),(2,2,1,'Nice pic'),(3,1,1,'bellaaa');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `order`;

CREATE TABLE IF NOT EXISTS `order` (
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
DEFAULT CHARACTER SET = utf8mb4;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(2,1,1),(2,2,2),(2,3,3),(2,4,4),(2,5,5),(3,1,1),(3,2,2),(3,3,3),(3,4,4),(3,5,5),(4,1,1),(4,2,2),(4,3,3),(4,4,4),(4,5,5);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
