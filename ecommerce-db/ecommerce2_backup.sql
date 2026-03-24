-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce2
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(14) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Ana','Silva','123.456.789-00','Rua A'),(2,'Carlos','Souza','987.654.321-00','Rua B');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_client_delete` BEFORE DELETE ON `client` FOR EACH ROW BEGIN
    INSERT INTO deleted_clients(idClient, Fname, Lname, CPF)
    VALUES (OLD.idClient, OLD.Fname, OLD.Lname, OLD.CPF);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `deleted_clients`
--

DROP TABLE IF EXISTS `deleted_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_clients` (
  `idClient` int DEFAULT NULL,
  `Fname` varchar(10) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(14) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_clients`
--

LOCK TABLES `deleted_clients` WRITE;
/*!40000 ALTER TABLE `deleted_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idOrderClient` int DEFAULT NULL,
  `OrderStatus` varchar(20) DEFAULT NULL,
  `Payment` varchar(20) DEFAULT NULL,
  `SendValue` float DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_order_client` (`idOrderClient`),
  CONSTRAINT `fk_order_client` FOREIGN KEY (`idOrderClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Em processamento','Cartão',15),(2,1,'Em processamento','Cartão',15),(3,1,'Em processamento','Cartão',20);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(50) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Notebook','Eletrônico',2990),(2,'Mouse','Acessório',50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_product_update` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
    IF OLD.Price <> NEW.Price THEN
        INSERT INTO product_price_log(idProduct, old_price, new_price)
        VALUES (OLD.idProduct, OLD.Price, NEW.Price);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_price_log`
--

DROP TABLE IF EXISTS `product_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_log` (
  `idProduct` int DEFAULT NULL,
  `old_price` float DEFAULT NULL,
  `new_price` float DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_log`
--

LOCK TABLES `product_price_log` WRITE;
/*!40000 ALTER TABLE `product_price_log` DISABLE KEYS */;
INSERT INTO `product_price_log` VALUES (1,3000,2990,'2026-03-24 14:01:46');
/*!40000 ALTER TABLE `product_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `idPO` int NOT NULL AUTO_INCREMENT,
  `idOrder` int DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`idPO`),
  KEY `fk_po_order` (`idOrder`),
  KEY `fk_po_product` (`idProduct`),
  CONSTRAINT `fk_po_order` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_po_product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (1,2,1,2),(2,1,1,2),(3,3,1,2);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productseller` (
  `idSeller` int NOT NULL,
  `idProduct` int NOT NULL,
  PRIMARY KEY (`idSeller`,`idProduct`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `productseller_ibfk_1` FOREIGN KEY (`idSeller`) REFERENCES `seller` (`idSeller`),
  CONSTRAINT `productseller_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `idSupplier` int NOT NULL,
  `idProduct` int NOT NULL,
  PRIMARY KEY (`idSupplier`,`idProduct`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `productsupplier_ibfk_1` FOREIGN KEY (`idSupplier`) REFERENCES `supplier` (`idSupplier`),
  CONSTRAINT `productsupplier_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSeller`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Loja Tech','SP'),(2,'Info Store','RJ');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Fornecedor A'),(2,'Fornecedor B');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_orders_clients`
--

DROP TABLE IF EXISTS `vw_orders_clients`;
/*!50001 DROP VIEW IF EXISTS `vw_orders_clients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_orders_clients` AS SELECT 
 1 AS `idClient`,
 1 AS `Fname`,
 1 AS `Lname`,
 1 AS `idOrder`,
 1 AS `OrderStatus`,
 1 AS `Payment`,
 1 AS `SendValue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_sellers`
--

DROP TABLE IF EXISTS `vw_products_sellers`;
/*!50001 DROP VIEW IF EXISTS `vw_products_sellers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_products_sellers` AS SELECT 
 1 AS `idSeller`,
 1 AS `seller_name`,
 1 AS `Location`,
 1 AS `idProduct`,
 1 AS `Pname`,
 1 AS `Category`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_suppliers`
--

DROP TABLE IF EXISTS `vw_products_suppliers`;
/*!50001 DROP VIEW IF EXISTS `vw_products_suppliers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_products_suppliers` AS SELECT 
 1 AS `idSupplier`,
 1 AS `supplier_name`,
 1 AS `idProduct`,
 1 AS `Pname`,
 1 AS `Category`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_orders_clients`
--

/*!50001 DROP VIEW IF EXISTS `vw_orders_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orders_clients` AS select `c`.`idClient` AS `idClient`,`c`.`Fname` AS `Fname`,`c`.`Lname` AS `Lname`,`o`.`idOrder` AS `idOrder`,`o`.`OrderStatus` AS `OrderStatus`,`o`.`Payment` AS `Payment`,`o`.`SendValue` AS `SendValue` from (`client` `c` join `orders` `o` on((`c`.`idClient` = `o`.`idOrderClient`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_sellers`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_sellers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_sellers` AS select `s`.`idSeller` AS `idSeller`,`s`.`SocialName` AS `seller_name`,`s`.`Location` AS `Location`,`p`.`idProduct` AS `idProduct`,`p`.`Pname` AS `Pname`,`p`.`Category` AS `Category`,`p`.`Price` AS `Price` from ((`seller` `s` join `productseller` `ps` on((`s`.`idSeller` = `ps`.`idSeller`))) join `product` `p` on((`ps`.`idProduct` = `p`.`idProduct`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_suppliers`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_suppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_suppliers` AS select `sup`.`idSupplier` AS `idSupplier`,`sup`.`SocialName` AS `supplier_name`,`p`.`idProduct` AS `idProduct`,`p`.`Pname` AS `Pname`,`p`.`Category` AS `Category`,`p`.`Price` AS `Price` from ((`supplier` `sup` join `productsupplier` `ps` on((`sup`.`idSupplier` = `ps`.`idSupplier`))) join `product` `p` on((`ps`.`idProduct` = `p`.`idProduct`))) */;
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

-- Dump completed on 2026-03-24 11:31:40
