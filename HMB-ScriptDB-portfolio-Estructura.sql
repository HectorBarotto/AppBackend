-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Current Database: `portfolio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `portfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `portfolio`;

--
-- Table structure for table `datos_personales`
--

DROP TABLE IF EXISTS `datos_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_personales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `sobre_mi` varchar(200) DEFAULT NULL,
  `url_foto` varchar(100) DEFAULT NULL,
  `url_banner` varchar(100) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_persona_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_persona_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educacion` (
  `id` int(11) NOT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `url_logo` varchar(100) DEFAULT NULL,
  `datos_personales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`datos_personales_id`),
  KEY `fk_educacion_datos_personales1_idx` (`datos_personales_id`),
  CONSTRAINT `fk_educacion_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia_laboral` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(45) DEFAULT NULL,
  `puesto` varchar(45) DEFAULT NULL,
  `es_trabajo_actual` tinyint(4) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `url_logo` varchar(100) DEFAULT NULL,
  `datos_personales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`datos_personales_id`),
  KEY `fk_experiencia_laboral_datos_personales1_idx` (`datos_personales_id`),
  CONSTRAINT `fk_experiencia_laboral_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `datos_personales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`datos_personales_id`),
  KEY `fk_habilidades_datos_personales1_idx` (`datos_personales_id`),
  CONSTRAINT `fk_habilidades_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL,
  `proyecto` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `datos_personales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`datos_personales_id`),
  KEY `fk_proyectos_datos_personales1_idx` (`datos_personales_id`),
  CONSTRAINT `fk_proyectos_datos_personales1` FOREIGN KEY (`datos_personales_id`) REFERENCES `datos_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proyecto_has_tecnologia`
--

DROP TABLE IF EXISTS `proyecto_has_tecnologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_has_tecnologia` (
  `proyecto_id` int(11) NOT NULL,
  `tecnologia_id` int(11) NOT NULL,
  PRIMARY KEY (`proyecto_id`,`tecnologia_id`),
  KEY `fk_proyectos_has_tecnologia_tecnologia1_idx` (`tecnologia_id`),
  KEY `fk_proyectos_has_tecnologia_proyectos1_idx` (`proyecto_id`),
  CONSTRAINT `fk_proyectos_has_tecnologia_proyectos1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_has_tecnologia_tecnologia1` FOREIGN KEY (`tecnologia_id`) REFERENCES `tecnologia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tecnologia`
--

DROP TABLE IF EXISTS `tecnologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnologia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-25 19:18:50
