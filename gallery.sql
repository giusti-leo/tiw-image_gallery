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
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (301,'leonardo','giusti','leonardo.giusti','leo123','leonardo.giusti@mail.polimi.com'),(302,'luca','giudici','luca.giudici','luca1998','luca.giudici@mail.polimi.com'),(303,'davide','guerra','davide.guerra','dado98','davide_war@mail.polimi.com'),(304,'karl','klay','karl.klay','karllrak','magic_karl@mail.polimi.com'), (305,'anonino','ignoto','a','a','utente.anonimo@mail.polimi.com');
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
INSERT INTO `image` VALUES (200,'tartaruga','ninja ','https://www.mille-animali.com/images/animali/tartaruga.jpg','2015-01-01 20:14:08'),(201,'aquila','one text','https://www.tuttogreen.it/wp-content/uploads/2016/12/aquila-reale-apertura-alare.jpg','2020-06-21 20:14:08'), (202,'capibara','che animale strano','https://cdn.lifegate.it/A7d9wnXCKYWDz7hKfD65dGslRJQ=/1200x800/smart/https://www.lifegate.it/app/uploads/capibara-.jpg','2020-06-26 17:14:08'),(203,'cervo','che bello','https://upload.wikimedia.org/wikipedia/commons/8/8d/Rothirsch.jpg','2017-03-21 20:14:08'),(204,'civetta','guarda che occhi','https://www.ilverdemondo.it/public/blog/original/come-allevare-una-civetta-it-000.jpg','2020-01-23 20:00:08'),(205,'drago_di_comodo','Fa paura','https://cdn.onb.it/2019/09/drago.jpg','2013-11-21 20:14:08'),(206,'gufo','che colore','https://www.focusjunior.it/content/uploads/2016/12/gufo-10.jpg','2019-08-21 20:14:08'),(207,'kiwi','pensavo fosse un frutto','https://i.pinimg.com/originals/26/f6/0e/26f60edb0d18a0b486eccfab3912359e.jpg','2020-06-21 20:14:00'),(208,'koala','first pic','https://images.vanityfair.it/wp-content/uploads/2019/05/20141928/Koala_landscape.jpg','2020-06-21 20:14:08'),(209,'leone','segno zodiacale','https://safariavventura.com/wp-content/uploads/2018/02/Leone-africano.jpg','2020-02-11 20:14:08'),(210,'lince','una lince','https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Canada_Lynx_%286187103428%29.jpg/230px-Canada_Lynx_%286187103428%29.jpg','2018-10-21 10:14:08'),(211,'lupo','Timore','https://www.romagnanotizie.net/photogallery_new/images/2014/10/venerdi-17-ottobre-si-terra-una-serata-dedicata-al-lupo-139386.660x368.jpg','2020-06-19 19:14:08'),(212,'pantera','nerissima','https://wips.plug.it/cips/initalia.virgilio.it/cms/2020/08/allarme-pantera.jpg','2019-01-21 20:14:08'),(213,'pinguino','pingui','https://www.focus.it/site_stored/imgs/0005/017/shutterstock_348950189.630x360.jpg','2020-06-01 20:01:08'),(214,'elefante','dumbo','https://www.sapere.it/.imaging/mte/sapere/624x410/dam/animali/mammiferi/Elefante-indiano/jcr:content/Elefante%20indiano.jpg','2020-06-01 18:10:08');
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
