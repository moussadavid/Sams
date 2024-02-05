CREATE DATABASE  IF NOT EXISTS `db_restaurant` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_restaurant`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: db_restaurant
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
-- Table structure for table `billdetails`
--

DROP TABLE IF EXISTS `billdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `billdetails` (
  `Id` bigint(255) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `item_qty` int(11) DEFAULT NULL,
  `side_salad` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billdetails`
--

LOCK TABLES `billdetails` WRITE;
/*!40000 ALTER TABLE `billdetails` DISABLE KEYS */;
INSERT INTO `billdetails` VALUES (1,1,44,12,'French Fries (no Rice),Tabbouleh,Lettuce'),(2,1,44,1,'Onion,Jalapeño,Black Olives'),(3,1,43,1,'Feta Cheese'),(4,2,44,1,'French Fries (no Rice),Tabbouleh,Lettuce'),(5,2,44,1,'Onion,Jalapeño,Black Olives'),(6,2,43,1,'Feta Cheese'),(7,3,44,1,'French Fries (no Rice),Tabbouleh,Lettuce'),(8,3,43,1,'Feta Cheese'),(9,3,44,1,'Onion,Jalapeño,Black Olives'),(10,4,44,1,'French Fries (no Rice),Tabbouleh,Lettuce'),(11,4,43,1,'Feta Cheese'),(12,4,44,1,'Onion,Jalapeño,Black Olives'),(13,5,44,1,'French Fries (no Rice),Tabbouleh,Lettuce'),(14,5,44,1,'Onion,Jalapeño,Black Olives'),(15,5,43,1,'Feta Cheese'),(16,6,44,1,'French Fries (no Rice),Tabbouleh,Lettuce'),(17,6,44,1,'Onion,Jalapeño,Black Olives'),(18,6,43,1,'Feta Cheese'),(19,7,1,1,''),(20,7,2,1,''),(21,7,3,1,''),(22,8,1,1,''),(23,8,3,1,''),(24,8,9,1,''),(25,9,1,1,''),(26,9,1,1,''),(27,9,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(28,10,1,2,''),(29,10,1,2,''),(30,10,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(31,10,9,1,'Tzatziki Sauce'),(32,11,1,2,''),(33,11,1,2,''),(34,11,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(35,11,9,1,'Tzatziki Sauce'),(36,12,1,2,''),(37,12,1,2,''),(38,12,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(39,12,9,1,'Tzatziki Sauce'),(40,13,1,2,''),(41,13,1,2,''),(42,13,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(43,13,9,1,'Tzatziki Sauce'),(44,14,1,2,''),(45,14,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(46,14,9,1,'Tzatziki Sauce'),(47,14,1,2,''),(48,15,1,2,''),(49,15,1,2,''),(50,15,9,1,'Tzatziki Sauce'),(51,15,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(52,16,1,2,''),(53,16,1,2,''),(54,16,9,1,'Tzatziki Sauce'),(55,16,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(56,17,1,2,''),(57,17,1,2,''),(58,17,9,1,'French Fries (no Rice),Lettuce,Cucumber,Tomato,Feta Cheese,Tzatziki Sauce'),(59,17,9,1,'Tzatziki Sauce');
/*!40000 ALTER TABLE `billdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billstatus`
--

DROP TABLE IF EXISTS `billstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `billstatus` (
  `bill_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bill_phone` varchar(255) DEFAULT NULL,
  `bill_address` text,
  `bill_when` varchar(255) DEFAULT NULL,
  `bill_method` varchar(255) DEFAULT NULL,
  `bill_discount` decimal(10,2) DEFAULT NULL,
  `bill_delivery` decimal(10,2) DEFAULT NULL,
  `bill_taxfees` decimal(10,2) DEFAULT NULL,
  `bill_tips` decimal(10,2) DEFAULT NULL,
  `bill_total` decimal(10,2) DEFAULT NULL,
  `bill_paid` varchar(255) DEFAULT NULL,
  `bill_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billstatus`
--

LOCK TABLES `billstatus` WRITE;
/*!40000 ALTER TABLE `billstatus` DISABLE KEYS */;
INSERT INTO `billstatus` VALUES (1,2,'84571208681','','2024-01-25T09:54','',0.00,0.00,3.41,NULL,39.38,'false',0),(2,2,'84571208681','','2024-01-25T10:01','',0.00,0.00,3.54,NULL,39.51,'true',5),(3,2,'84571208681','','2024-01-25T10:04','',0.00,0.00,0.36,NULL,36.33,'true',1),(4,2,'84571208681','','2024-01-25T10:08','',0.00,0.00,3.56,NULL,39.53,'true',1),(5,2,'84571208681','','2024-01-25T10:14','',0.00,0.00,3.60,NULL,39.57,'true',1),(6,2,'84571208681','','2024-01-25T10:16','',0.00,0.00,3.60,NULL,39.57,'true',5),(7,2,'84571208681','','2024-01-25T13:33','',3.00,0.00,3.88,NULL,39.88,'true',5),(8,2,'84571208681','','2024-01-26T10:10','',0.00,0.00,3.23,NULL,35.20,'true',5),(9,2,'84571208681','','2024-01-26T10:32','',0.00,0.00,3.23,NULL,35.20,'false',0),(10,2,'84571208681','','2024-01-26T13:45','',0.00,0.00,6.17,NULL,70.11,'false',1),(11,2,'84571208681','','2024-01-26T19:24','',0.00,0.00,6.17,NULL,70.11,'false',1),(12,2,'84571208681','','2024-01-26T19:24','',0.00,0.00,6.17,NULL,70.11,'false',1),(13,2,'84571208681','','2024-01-26T19:27','',0.00,0.00,6.17,NULL,77.12,'false',1),(14,2,'84571208681','','2024-01-26T20:02','',0.00,0.00,6.17,NULL,80.11,'false',1),(15,2,'84571208681','','2024-01-26T20:02','',0.00,0.00,6.17,NULL,77.12,'false',0),(16,2,'84571208681','','2024-01-26T20:02','',0.00,0.00,6.17,NULL,75.11,'false',0),(17,2,'84571208681','','2024-01-26T20:10','',0.00,0.00,6.17,35.05,105.16,'false',0);
/*!40000 ALTER TABLE `billstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booktable`
--

DROP TABLE IF EXISTS `booktable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `booktable` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `book_phone` varchar(255) DEFAULT NULL,
  `book_people` int(11) DEFAULT NULL,
  `book_tables` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_when` varchar(255) DEFAULT NULL,
  `book_note` text,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booktable`
--

LOCK TABLES `booktable` WRITE;
/*!40000 ALTER TABLE `booktable` DISABLE KEYS */;
INSERT INTO `booktable` VALUES (1,'ggg','84208658544',4,1,NULL,'2024-01-15T21:42','ertretret');
/*!40000 ALTER TABLE `booktable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `item_qty` int(11) DEFAULT NULL,
  `side_salad` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (17,2,20,1,'Tzatziki Sauce on side and Rice'),(18,2,18,1,'Lettuce and French Fries');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `food` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `food_star` varchar(255) DEFAULT NULL,
  `food_vote` varchar(255) DEFAULT NULL,
  `food_price` varchar(255) DEFAULT NULL,
  `food_discount` varchar(255) DEFAULT NULL,
  `food_desc` varchar(255) DEFAULT NULL,
  `food_status` varchar(255) DEFAULT NULL,
  `food_type` varchar(255) DEFAULT NULL,
  `food_category` varchar(255) DEFAULT NULL,
  `food_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  UNIQUE KEY `food_id_UNIQUE` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Lamb Gyro Sandwich','5','999','9.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','gyro','sandwiches','taco/taco-1.png'),(2,'FALAFEL Sandwich','5','999','9.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','vegan','sandwiches','taco/taco-2.png'),(3,'Grilled Chicken Sandwich','5','999','9.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','gyro','sandwiches','taco/taco-3.png'),(4,'Chicken Shawarma Sandwich','5','999','10.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','meat','sandwiches','taco/taco-5.png'),(5,'Beef Shawarma Sandwich','5','999','10.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','normal','meat','sandwiches','taco/taco-5.png'),(6,'Philly Sandwich','5','500','10.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','new dishes','meat','sandwiches','taco/taco-6.png'),(7,'Kofta Sandwich','5','500','11.99','0.00','Come with Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','seasonal dishes online only','meat','sandwiches','taco/taco-7.png'),(8,'Lamb Gyro Platter','5','100','11.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','new dishes','meat','platters','taco/taco-8.png'),(9,'Chicken Gyro Platter','5','600','11.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','new dishes','meat','platters','burrito/burrito-1.png'),(10,'FALAFEL Platter','5','999','11.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','best seller','meat','platters','burrito/burrito-2.png'),(11,'Chicken Shawarma Platter','5','999','12.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','best seller','vegan','platters','burrito/burrito-3.png'),(12,'Beef Shawarma Platter','5','999','12.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','new dishes','meat','platters','burrito/burrito-4.png'),(13,'GYRO Combo Platter(1/2 Lamb & 1/2 Checken)','5','999','12.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','best seller','meat','platters','burrito/burrito-5.png'),(14,'Philly Platter','5','400','12.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','seasonal dishes','meat','platters','burrito/burrito-6.png'),(15,'Shawarma Combo Platter(1/2 Beef & 1/2 Checken)','5','699','13.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','best seller','meat','platters','nachos/nachos-1.png'),(16,'Kofta Platter','5','999','13.99','0.00','Come with Side Rice & Side Salad: Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce & One Pita Bread.','best seller','meat','platters','nachos/nachos-2.png'),(17,'Lamb Gyro Combo','5','999','12.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','best seller','meat','combo','nachos/nachos-3.png'),(18,'FALAFEL Combo','5','999','12.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','best seller','meat','combo','nachos/nachos-4.png'),(19,'Grilled Chicken Combo','5','999','12.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','normal','vegan','combo','nachos/nachos-5.png'),(20,'Chicken Shawarma Combo','5','999','13.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','best seller','vegan','combo','nachos/salsa-1.png'),(21,'Beef Shawarma Combo','5','699','13.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','best seller','vegan','combo','nachos/salsa-2.png'),(22,'Philly Combo','5','499','13.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','seasonal dishes','vegan','combo','nachos/salsa-3.png'),(23,'Kofta Combo','5','999','14.99','0.00','Combo include soda, Sandwich and your choice of Fries or Rice','best seller','vegan','combo','nachos/salsa-4.png'),(24,'Greek Salad (Large)','5','699','10.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','vegan','salad','nachos/salsa-5.png'),(25,'FALAFEL Salad','5','699','12.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','Pita Bread','vegan','salad','side/Pita Bread.png'),(26,'Gyro Salad','5','999','12.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','meat','salad','side/side-2.png'),(27,'Grilled Chicken Salad','4','200','12.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','normal','vegan','salad','side/side-3.png'),(28,'Philly Salad','4','100','14.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','new dishes','vegan','salad','side/side-4.png'),(29,'Chicken Shawarma Salad','3.5','299','14.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','new dishes','meat','salad','side/side-5.png'),(30,'Beef Shawarma Salad','4.5','999','14.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','vegan','salad','dessert/dessert-1.png'),(31,'Shawarma Combo Salad','4.5','999','15.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','vegan','salad','dessert/dessert-2.png'),(32,'Combo Gyro Salad','4.5','50','13.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','new dishes','vegan','salad','dessert/dessert-3.png'),(33,'Baklava','3','599','2.49','0.00','Baklava Slice  (Buy 2 Baklava Get 1 Free)','seasonal dishes online only','vegan','dessert','dessert/dessert-4.png'),(34,'Rice with Gyro','4','199','10.99','0.00','Kids meals served with small drink','normal','vegan','kids','dessert/dessert-5.png'),(35,'Chicken Nuggets (with fries)','4','299','10.99','0.00','Kids meals served with small drink','normal','vegan','kids','dessert/dessert-6.png'),(36,'Chicken Wings (with fries)','4.5','999','10.99','0.00','Kids meals served with small drink','normal','vegan','kids','dessert/dessert-7.png'),(37,'Chicken Tenders (with fries)','4.5','999','10.99','0.00','Kids meals served with small drink','best seller','vegan','kids','drink/drink-1.png'),(38,'Fountain Drink 16oz ','4.5','999','2.49','0.00','','best seller','vegan','drink','drink/drink-2.png'),(39,'Fountain Drink 24oz','4.5','599','2.99','0.00','','new dishes seasonal dishes','vegan','drink','drink/drink-3.png'),(40,'Can Soda','4','999','1.49','0.00','','best seller','vegan','drink','drink/drink-4.png'),(41,'Water','3.5','999','1.49','0.00','','seasonal dishes best seller','vegan','drink','drink/drink-5.png'),(42,'Monster','4.5','9999','3.99','0.00','','best seller','vegan','drink','drink/drink-6.png'),(43,'Bottled Beveage','5','999','2.99','0.00','','best seller','gyro','drink','gyro/Lamb Gyro Platter.png'),(44,'Pita Bread','5','9999','1.00','0.00','','best seller','gyro','sides','gyro/Chicken Gyro Platter.png'),(45,'Tzatziki Sauce','5','999','1.00','0.00','','best seller','gyro','sides','gyro/Chicken Gyro Platter.png'),(46,'French Fries','5','9999','2.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(47,'Rice ','5','999','2.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(49,'Falafel (4 PCS)','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(50,'Grape Leaves Rolls (6 PCS)','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(51,'Hummus','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(52,'Nuggets','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(53,'Tenders ','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(54,'Wings ','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(55,'Chicken Gyro','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(56,'Lamb Gyro','5','999','6.99','0.00',' ','best seller','vegan','sides','drink/drink-6.png'),(57,'Greek Salad (Small)','5','999','6.99','0.00','Lettuce,Tabbouleh, Cucumber, Onion, Tomato, Feta Cheese,Banana Pepper, Jalapeño, Black Olives, Tzatziki Sauce','best seller','vegan','salad','drink/drink-6.png'),(58,'Tabouleh Salad','5','999','6.99','0.00','','best seller','vegan','sides','drink/drink-6.png'),(61,'Coffee','5','999','0.99','0.00','','best seller','vegan','drink','drink/drink-6.png'),(62,'Tea','5','999','0.99','0.00','','best seller','vegan','drink','drink/drink-6.png');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_birth` varchar(255) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'David Moussa','david.nashed@hotmail.com','84571208681','@123456789','2020-02-24','male'),(3,'d','d','d3','ewrew','wer','33');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-26 22:45:15
