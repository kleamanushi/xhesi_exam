CREATE DATABASE  IF NOT EXISTS `recipes` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipes_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recipes_has_users_users1_idx` (`users_id`),
  KEY `fk_recipes_has_users_recipes1_idx` (`recipes_id`),
  CONSTRAINT `fk_recipes_has_users_recipes1` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`),
  CONSTRAINT `fk_recipes_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (26,16,7),(27,17,7),(29,19,9),(32,19,6),(33,16,6);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_made` date DEFAULT NULL,
  `numberOf` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `dontTrust` int DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_recipes_users_idx` (`user_id`),
  CONSTRAINT `fk_recipes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (16,'Vlore1','I went to the beach.1','2022-07-13',1,6,2,'Klea Manushi','2022-07-02 16:38:40','2022-07-02 18:53:14'),(17,'Shkoder','I am taking the Exam.','2022-07-04',6,7,1,'Xhesika Facja','2022-07-02 16:40:02','2022-07-02 18:49:06'),(19,'vlora','nothing','2022-07-03',1,8,2,'peron1 last','2022-07-02 18:04:03','2022-07-02 18:49:02');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'Klea','Manushi','kleamanushi@gmail.com','$2b$12$xjJKRGd0WrfPwb5aj6GcWujhrh6MU77JO6lYhCSpi5I5CQ50uAyTi','2022-07-02 16:36:15','2022-07-02 16:36:15'),(7,'Xhesika','Facja','xhesikafacja@gmail.com','$2b$12$aA4Snu5x7MTdVYqleHkOmea/HPbYWH5hUthV6pN3IXlcOjGHVK.8C','2022-07-02 16:39:15','2022-07-02 16:39:15'),(8,'peron1','last','person1@gmail.com','$2b$12$28.h28OFOKhglgzEkFfsU.U7zyGUVZ.Unj7o4bIyx5ashl5k49ega','2022-07-02 18:03:27','2022-07-02 18:03:27'),(9,'test2','test','test2@gmail.com','$2b$12$RrEEToLArwsJJYvY.sQVn.tHXrFOKYqw4YjRjuLiQ7OT9l9nOvwUq','2022-07-02 18:35:46','2022-07-02 18:35:46'),(10,'11111','111111','11111@gmail.com','$2b$12$Ps.ymCbiweu5xAMZuEXpOOp6f9MNOnov8AXoZPvTRtw9ihrTn9RQa','2022-07-02 18:46:40','2022-07-02 18:46:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-03 22:29:40



[Unit]
Description=Gunicorn instance
After=network.target
[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/exam
Environment="PATH=/home/ubuntu/exam/venv/bin"
ExecStart=/home/ubuntu/exam/venv/bin/gunicorn --workers 3 --bind unix:exam_final.sock -m 007 wsgi:application
[Install]
WantedBy=multi-user.target



sudo vim /etc/nginx/sites-available/exam_final

server {
    listen 80;
    server_name 52.70.247.184;
    location / {
        include proxy_params;
        proxy_pass http://unix:/home/ubuntu/exam/exam_final.sock;
    }
}

sudo ln -s /etc/nginx/sites-available/exam_final /etc/nginx/sites-enabled