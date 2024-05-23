-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_cliente` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `fecha_de_alta` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'10001','DANIEL ALFONSO SUAREZ CANTILLO','CALLE ANDALUCIA, 55','ACTIVO','2024-05-23'),(2,'10002','MARIA CAMILA PEREZ VILLALOBO','CALLE GODELLA, 87','ACTIVO','2024-05-23'),(3,'10003','ANDREINA TOMAS TRUYOL','CALLE LATINA, 5','ACTIVO','2024-05-23'),(4,'10004','MAURICIO MALDONADO ZAPATA','CALLE MIRAFLORES, 45','ACTIVO','2024-05-23'),(5,'10005','INDIRA LINETH SANTAMARIA SOTO','CALLE MENTOR, 47','ACTIVO','2024-05-23');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_cobrar`
--

DROP TABLE IF EXISTS `cuentas_cobrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_cobrar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_fact` int NOT NULL,
  `nombre_cli` varchar(100) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `estado` enum('PAGADO','PENDIENTE') NOT NULL DEFAULT 'PENDIENTE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_cobrar`
--

LOCK TABLES `cuentas_cobrar` WRITE;
/*!40000 ALTER TABLE `cuentas_cobrar` DISABLE KEYS */;
INSERT INTO `cuentas_cobrar` VALUES (1,5001,'DANIEL ALFONSO SUAREZ CANTILLO',5000,'PAGADO'),(2,5002,'MARIA CAMILA PEREZ VILLALOBO',7500,'PENDIENTE'),(3,5003,'ANDREINA TOMAS TRUYOL',1200,'PENDIENTE'),(4,5004,'MAURICIO MALDONADO ZAPATA',1400,'PENDIENTE'),(5,5005,'INDIRA LINETH SANTAMARIA SOTO',750,'PAGADO');
/*!40000 ALTER TABLE `cuentas_cobrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_fact` decimal(10,0) NOT NULL,
  `fec_fact` datetime NOT NULL,
  `nombre_cli` varchar(100) NOT NULL,
  `dir_cli` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,5001,'2024-01-20 14:54:01','DANIEL ALFONSO SUAREZ CANTILLO','CALLE ANDALUCIA, 55',5000),(2,5002,'2024-01-21 15:14:12','MARIA CAMILA PEREZ VILLALOBO','CALLE GODELLA, 87',7500),(3,5003,'2024-04-04 18:17:41','ANDREINA TOMAS TRUYOL','CALLE LATINA, 5',1200),(4,5004,'2024-05-12 15:08:44','MAURICIO MALDONADO ZAPATA','CALLE MIRAFLORES, 45',1400),(5,5005,'2024-05-16 16:24:15','INDIRA LINETH SANTAMARIA SOTO','CALLE MENTOR, 47',750);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'erp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23  2:51:51
