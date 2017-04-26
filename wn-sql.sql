-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: weathernow
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `id_ciu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciu` varchar(100) DEFAULT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_ciu`),
  KEY `fk_ciudades_paises_idx` (`id_pais`),
  CONSTRAINT `FK3cnbrde3p56r63m20pv0g505i` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  CONSTRAINT `fk_ciudades_paises` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'madrid',64),(2,'zaragoza',64),(3,'soria',64),(4,'roma',120),(5,'londres',185),(6,'edinburgo',185),(7,'paris',72),(8,'oslo',219);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoscielo`
--

DROP TABLE IF EXISTS `estadoscielo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoscielo` (
  `id_est` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoscielo`
--

LOCK TABLES `estadoscielo` WRITE;
/*!40000 ALTER TABLE `estadoscielo` DISABLE KEYS */;
INSERT INTO `estadoscielo` VALUES (1,'despejado'),(2,'nuves y claros'),(3,'nublado'),(4,'niebla'),(5,'nublado');
/*!40000 ALTER TABLE `estadoscielo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) NOT NULL,
  `codigo_pais` varchar(3) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Afganistán','AF'),(2,'Albania','AL'),(3,'Alemania','DE'),(4,'Andorra','AD'),(5,'Angola','AO'),(6,'Anguila','AI'),(7,'Antártida','AQ'),(8,'Antigua y Barbuda','AG'),(9,'Arabia Saudita','SA'),(10,'Argelia','DZ'),(11,'Argentina','AR'),(12,'Armenia','AM'),(13,'Aruba','AW'),(14,'Australia','AU'),(15,'Austria','AT'),(16,'Azerbaiyán','AZ'),(17,'Bahamas','BS'),(18,'Bangladés','BD'),(19,'Barbados','BB'),(20,'Baréin','BH'),(21,'Bélgica','BE'),(22,'Belice','BZ'),(23,'Benín','BJ'),(24,'Bermudas','BM'),(25,'Bielorrusia','BY'),(26,'Bolivia, Estado Plurinacional de','BO'),(27,'Bonaire, San Eustaquio y Saba','BQ'),(28,'Bosnia y Herzegovina','BA'),(29,'Botsuana','BW'),(30,'Brasil','BR'),(31,'Brunéi Darussalam','BN'),(32,'Bulgaria','BG'),(33,'Burkina Faso','BF'),(34,'Burundi','BI'),(35,'Bután','BT'),(36,'Cabo Verde','CV'),(37,'Camboya','KH'),(38,'Camerún','CM'),(39,'Canadá','CA'),(40,'Chad','TD'),(41,'Chile','CL'),(42,'China, República Popular','CN'),(43,'Chipre','CY'),(44,'Colombia','CO'),(45,'Comoras','KM'),(46,'Congo, La República Democrática del','CD'),(47,'Congo','CG'),(48,'Corea, República de','KR'),(49,'Corea, República Democrática Popular de','KP'),(50,'Costa de Marfil','CI'),(51,'Costa Rica','CR'),(52,'Croacia','HR'),(53,'Cuba','CU'),(54,'Curazao','CW'),(55,'Dinamarca','DK'),(56,'Dominica','DM'),(57,'Ecuador','EC'),(58,'Egipto','EG'),(59,'El Salvador','SV'),(60,'Emiratos Árabes Unidos','AE'),(61,'Eritrea','ER'),(62,'Eslovaquia','SK'),(63,'Eslovenia','SI'),(64,'España','ES'),(65,'Estados Unidos','US'),(66,'Estonia','EE'),(67,'Etiopía','ET'),(68,'Federacion Rusa','RU'),(69,'Filipinas','PH'),(70,'Finlandia','FI'),(71,'Fiyi','FJ'),(72,'Francia','FR'),(73,'Gabón','GA'),(74,'Gambia','GM'),(75,'Georgia','GE'),(76,'Ghana','GH'),(77,'Gibraltar','GI'),(78,'Granada','GD'),(79,'Grecia','GR'),(80,'Groenlandia','GL'),(81,'Guadalupe','GP'),(82,'Guam','GU'),(83,'Guatemala','GT'),(84,'Guayana Francesa','GF'),(85,'Guernsey','GG'),(86,'Guinea-Bisáu','GW'),(87,'Guinea Ecuatorial','GQ'),(88,'Guinea','GN'),(89,'Guyana','GY'),(90,'Haití','HT'),(91,'Honduras','HN'),(92,'Hong Kong','HK'),(93,'Hungría','HU'),(94,'India','IN'),(95,'Indonesia','ID'),(96,'Irak','IQ'),(97,'Irán, República Islámica de','IR'),(98,'Irlanda','IE'),(99,'Isla Bouvet','BV'),(100,'Isla de Man','IM'),(101,'Isla de Navidad','CX'),(102,'Isla Norfolk','NF'),(103,'Islandia','IS'),(104,'Islas Åland','AX'),(105,'Islas Caimán','KY'),(106,'Islas Cocos (Keeling)','CC'),(107,'Islas Cook','CK'),(108,'Islas Falkland (Malvinas)','FK'),(109,'Islas Feroe','FO'),(110,'Islas Georgias del Sur y Sandwich del Sur','GS'),(111,'Islas Heard y Mcdonald','HM'),(112,'Islas Marianas del Norte','MP'),(113,'Islas Marshall','MH'),(114,'Islas Salomón','SB'),(115,'Islas Turcas y Caicos','TC'),(116,'Islas Ultramarinas Menores de Estados Unidos','UM'),(117,'Islas Virgenes Británicas','VG'),(118,'Islas Virgenes de Los Estados Unidos','VI'),(119,'Israel','IL'),(120,'Italia','IT'),(121,'Jamaica','JM'),(122,'Japón','JP'),(123,'Jersey','JE'),(124,'Jordania','JO'),(125,'Kazajistán','KZ'),(126,'Kenia','KE'),(127,'Kirguistán','KG'),(128,'Kiribati','KI'),(129,'Kuwait','KW'),(130,'Lesoto','LS'),(131,'Letonia','LV'),(132,'Líbano','LB'),(133,'Liberia','LR'),(134,'Libia','LY'),(135,'Liechtenstein','LI'),(136,'Lituania','LT'),(137,'Luxemburgo','LU'),(138,'Macao','MO'),(139,'Macedonia, La Antigua República Yugoslava de','MK'),(140,'Madagascar','MG'),(141,'Malasia','MY'),(142,'Malaui','MW'),(143,'Maldivas','MV'),(144,'Malí','ML'),(145,'Malta','MT'),(146,'Marruecos','MA'),(147,'Martinica','MQ'),(148,'Mauricio','MU'),(149,'Mauritania','MR'),(150,'Mayotte','YT'),(151,'México','MX'),(152,'Micronesia, Estados Federados de','FM'),(153,'Moldavia, República de','MD'),(154,'Mónaco','MC'),(155,'Mongolia','MN'),(156,'Montenegro','ME'),(157,'Montserrat','MS'),(158,'Mozambique','MZ'),(159,'Myanmar','MM'),(160,'Nabimia','NA'),(161,'Nauru','NR'),(162,'Nepal','NP'),(163,'Nicaragua','NI'),(164,'Nigeria','NG'),(165,'Níger','NE'),(166,'Niue','NU'),(167,'Noruega','NO'),(168,'Nueva Caledonia','NC'),(169,'Nueva Zelanda','NZ'),(170,'Omán','OM'),(171,'Países Bajos','NL'),(172,'Pakistán','PK'),(173,'Palaos','PW'),(174,'Palestina, Estado de','PS'),(175,'Panamá','PA'),(176,'Papúa Nueva Guinea','PG'),(177,'Paraguay','PY'),(178,'Perú','PE'),(179,'Pitcairn','PN'),(180,'Polinesia Francesa','PF'),(181,'Polonia','PL'),(182,'Portugal','PT'),(183,'Puerto Rico','PR'),(184,'Qatar','QA'),(185,'Reino Unido','GB'),(186,'República Centroafricana','CF'),(187,'República Checa','CZ'),(188,'República Democrática Popular Lao','LA'),(189,'República Dominicana','DO'),(190,'Reunión','RE'),(191,'Ruanda','RW'),(192,'Rumania','RO'),(193,'Sahara Occidental','EH'),(194,'Samoa Americana','AS'),(195,'Samoa','WS'),(196,'San Bartolomé','BL'),(197,'San Cristóbal y Nieves','KN'),(198,'San Marino','SM'),(199,'San Martín (Parte Francesa)','MF'),(200,'San Pedro y Miquelón','PM'),(201,'San Vicente y Las Granadinas','VC'),(202,'Santa Helena, Ascensión y Tristán de Acuña','SH'),(203,'Santa Lucía','LC'),(204,'Santa Sede (Ciudad Estado Vaticano)','VA'),(205,'Santo Tomé y Principe','ST'),(206,'Senegal','SN'),(207,'Serbia','RS'),(208,'Seychelles','SC'),(209,'Sierra Leona','SL'),(210,'Singapur','SG'),(211,'Sint Maarten (Parte Neerlandesa)','SX'),(212,'Siria, República Arabe de','SY'),(213,'Somalia','SO'),(214,'Sri Lanka','LK'),(215,'Suazilandia','SZ'),(216,'Sudáfrica','ZA'),(217,'Sudán del Sur','SS'),(218,'Sudán','SD'),(219,'Suecia','SE'),(220,'Suiza','CH'),(221,'Surinam','SR'),(222,'Svalbard y Jan Mayen','SJ'),(223,'Tailandia','TH'),(224,'Taiwán, Provincia de China','TW'),(225,'Tanzania, República Unida de','TZ'),(226,'Tayikistán','TJ'),(227,'Territorio Británico del Océano Índico','IO'),(228,'Territorios Australes Franceses','TF'),(229,'Timor-Leste','TL'),(230,'Togo','TG'),(231,'Tokelau','TK'),(232,'Tonga','TO'),(233,'Trinidad y Tobago','TT'),(234,'Túnez','TN'),(235,'Turkmenistán','TM'),(236,'Turquía','TR'),(237,'Tuvalu','TV'),(238,'Ucrania','UA'),(239,'Uganda','UG'),(240,'Uruguay','UY'),(241,'Uzbekistán','UZ'),(242,'Vanuatu','VU'),(243,'Venezuela, República Bolivariana de','VE'),(244,'Viet Nam','VN'),(245,'Wallis y Futuna','WF'),(246,'Yemen','YE'),(247,'Yibuti','DJ'),(248,'Zambia','ZM'),(249,'Zimbabue','ZW');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registros` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reg` datetime NOT NULL,
  `id_ciu` int(11) NOT NULL,
  `temperatura` float DEFAULT NULL,
  `id_usu` int(11) NOT NULL,
  `id_est` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reg`),
  KEY `fk_registros_ciudades1_idx` (`id_ciu`),
  KEY `fk_registros_usuarios1_idx` (`id_usu`),
  KEY `fk_registros_estadosCielo1_idx` (`id_est`),
  CONSTRAINT `FKmnw0ob166cgeyv6b467tx95yg` FOREIGN KEY (`id_est`) REFERENCES `estadoscielo` (`id_est`),
  CONSTRAINT `FKok87o6xjwgxbs5l8bvlb19c3o` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  CONSTRAINT `FKqnqe08d95wnvr6dybtbohojwj` FOREIGN KEY (`id_ciu`) REFERENCES `ciudades` (`id_ciu`),
  CONSTRAINT `fk_registros_ciudades1` FOREIGN KEY (`id_ciu`) REFERENCES `ciudades` (`id_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_estadosCielo1` FOREIGN KEY (`id_est`) REFERENCES `estadoscielo` (`id_est`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_usuarios1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,'2017-04-26 01:36:22',8,0,1,1),(2,'2017-04-26 01:41:37',8,0,1,1),(3,'2017-04-26 01:49:27',8,0,1,1),(4,'2017-04-26 01:50:09',8,0,1,1);
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL AUTO_INCREMENT,
  `clave_usu` varchar(100) NOT NULL,
  `correo_usu` varchar(100) DEFAULT NULL,
  `privilegio_usu` varchar(100) NOT NULL,
  `nombre_usu` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin@admin.com','admin','admin');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26  2:06:59
