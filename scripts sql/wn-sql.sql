CREATE DATABASE `weathernow` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

CREATE TABLE `weathernow`.`estadoscielo` (
  `id_est` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `weathernow`.`paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) NOT NULL,
  `codigo_pais` varchar(3) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

CREATE TABLE `weathernow`.`ciudades` (
  `id_ciu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciu` varchar(100) DEFAULT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_ciu`),
  KEY `fk_ciudades_paises_idx` (`id_pais`),
  CONSTRAINT `FK3cnbrde3p56r63m20pv0g505i` FOREIGN KEY (`id_pais`) REFERENCES  `weathernow`.`paises` (`id_pais`),
  CONSTRAINT `fk_ciudades_paises` FOREIGN KEY (`id_pais`) REFERENCES  `weathernow`.`paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `weathernow`.`usuarios` (
  `id_usu` int(11) NOT NULL AUTO_INCREMENT,
  `clave_usu` varchar(100) NOT NULL,
  `correo_usu` varchar(100) DEFAULT NULL,
  `privilegio_usu` varchar(100) NOT NULL,
  `nombre_usu` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `weathernow`.`registros` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reg` date NOT NULL,
  `id_ciu` int(11) NOT NULL,
  `temperatura` float DEFAULT NULL,
  `id_usu` int(11) NOT NULL,
  `id_est` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reg`),
  KEY `fk_registros_ciudades1_idx` (`id_ciu`),
  KEY `fk_registros_usuarios1_idx` (`id_usu`),
  KEY `fk_registros_estadosCielo1_idx` (`id_est`),
  CONSTRAINT `FKmnw0ob166cgeyv6b467tx95yg` FOREIGN KEY (`id_est`) REFERENCES `weathernow`.`estadoscielo` (`id_est`),
  CONSTRAINT `FKok87o6xjwgxbs5l8bvlb19c3o` FOREIGN KEY (`id_usu`) REFERENCES `weathernow`.`usuarios` (`id_usu`),
  CONSTRAINT `FKqnqe08d95wnvr6dybtbohojwj` FOREIGN KEY (`id_ciu`) REFERENCES `weathernow`.`ciudades` (`id_ciu`),
  CONSTRAINT `fk_registros_ciudades1` FOREIGN KEY (`id_ciu`) REFERENCES `weathernow`.`ciudades` (`id_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_estadosCielo1` FOREIGN KEY (`id_est`) REFERENCES `weathernow`.`estadoscielo` (`id_est`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_usuarios1` FOREIGN KEY (`id_usu`) REFERENCES `weathernow`.`usuarios` (`id_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*
-- Query: SELECT * FROM weathernow.paises
-- Date: 2017-04-27 00:00
*/


INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (1,'Afganistán','AF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (2,'Albania','AL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (3,'Alemania','DE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (4,'Andorra','AD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (5,'Angola','AO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (6,'Anguila','AI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (7,'Antártida','AQ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (8,'Antigua y Barbuda','AG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (9,'Arabia Saudita','SA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (10,'Argelia','DZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (11,'Argentina','AR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (12,'Armenia','AM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (13,'Aruba','AW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (14,'Australia','AU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (15,'Austria','AT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (16,'Azerbaiyán','AZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (17,'Bahamas','BS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (18,'Bangladés','BD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (19,'Barbados','BB');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (20,'Baréin','BH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (21,'Bélgica','BE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (22,'Belice','BZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (23,'Benín','BJ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (24,'Bermudas','BM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (25,'Bielorrusia','BY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (26,'Bolivia, Estado Plurinacional de','BO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (27,'Bonaire, San Eustaquio y Saba','BQ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (28,'Bosnia y Herzegovina','BA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (29,'Botsuana','BW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (30,'Brasil','BR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (31,'Brunéi Darussalam','BN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (32,'Bulgaria','BG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (33,'Burkina Faso','BF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (34,'Burundi','BI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (35,'Bután','BT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (36,'Cabo Verde','CV');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (37,'Camboya','KH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (38,'Camerún','CM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (39,'Canadá','CA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (40,'Chad','TD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (41,'Chile','CL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (42,'China, República Popular','CN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (43,'Chipre','CY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (44,'Colombia','CO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (45,'Comoras','KM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (46,'Congo, La República Democrática del','CD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (47,'Congo','CG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (48,'Corea, República de','KR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (49,'Corea, República Democrática Popular de','KP');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (50,'Costa de Marfil','CI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (51,'Costa Rica','CR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (52,'Croacia','HR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (53,'Cuba','CU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (54,'Curazao','CW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (55,'Dinamarca','DK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (56,'Dominica','DM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (57,'Ecuador','EC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (58,'Egipto','EG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (59,'El Salvador','SV');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (60,'Emiratos Árabes Unidos','AE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (61,'Eritrea','ER');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (62,'Eslovaquia','SK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (63,'Eslovenia','SI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (64,'España','ES');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (65,'Estados Unidos','US');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (66,'Estonia','EE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (67,'Etiopía','ET');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (68,'Federacion Rusa','RU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (69,'Filipinas','PH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (70,'Finlandia','FI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (71,'Fiyi','FJ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (72,'Francia','FR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (73,'Gabón','GA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (74,'Gambia','GM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (75,'Georgia','GE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (76,'Ghana','GH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (77,'Gibraltar','GI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (78,'Granada','GD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (79,'Grecia','GR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (80,'Groenlandia','GL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (81,'Guadalupe','GP');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (82,'Guam','GU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (83,'Guatemala','GT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (84,'Guayana Francesa','GF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (85,'Guernsey','GG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (86,'Guinea-Bisáu','GW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (87,'Guinea Ecuatorial','GQ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (88,'Guinea','GN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (89,'Guyana','GY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (90,'Haití','HT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (91,'Honduras','HN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (92,'Hong Kong','HK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (93,'Hungría','HU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (94,'India','IN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (95,'Indonesia','ID');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (96,'Irak','IQ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (97,'Irán, República Islámica de','IR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (98,'Irlanda','IE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (99,'Isla Bouvet','BV');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (100,'Isla de Man','IM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (101,'Isla de Navidad','CX');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (102,'Isla Norfolk','NF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (103,'Islandia','IS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (104,'Islas Åland','AX');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (105,'Islas Caimán','KY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (106,'Islas Cocos (Keeling)','CC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (107,'Islas Cook','CK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (108,'Islas Falkland (Malvinas)','FK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (109,'Islas Feroe','FO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (110,'Islas Georgias del Sur y Sandwich del Sur','GS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (111,'Islas Heard y Mcdonald','HM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (112,'Islas Marianas del Norte','MP');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (113,'Islas Marshall','MH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (114,'Islas Salomón','SB');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (115,'Islas Turcas y Caicos','TC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (116,'Islas Ultramarinas Menores de Estados Unidos','UM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (117,'Islas Virgenes Británicas','VG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (118,'Islas Virgenes de Los Estados Unidos','VI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (119,'Israel','IL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (120,'Italia','IT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (121,'Jamaica','JM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (122,'Japón','JP');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (123,'Jersey','JE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (124,'Jordania','JO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (125,'Kazajistán','KZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (126,'Kenia','KE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (127,'Kirguistán','KG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (128,'Kiribati','KI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (129,'Kuwait','KW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (130,'Lesoto','LS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (131,'Letonia','LV');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (132,'Líbano','LB');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (133,'Liberia','LR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (134,'Libia','LY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (135,'Liechtenstein','LI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (136,'Lituania','LT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (137,'Luxemburgo','LU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (138,'Macao','MO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (139,'Macedonia, La Antigua República Yugoslava de','MK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (140,'Madagascar','MG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (141,'Malasia','MY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (142,'Malaui','MW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (143,'Maldivas','MV');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (144,'Malí','ML');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (145,'Malta','MT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (146,'Marruecos','MA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (147,'Martinica','MQ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (148,'Mauricio','MU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (149,'Mauritania','MR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (150,'Mayotte','YT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (151,'México','MX');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (152,'Micronesia, Estados Federados de','FM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (153,'Moldavia, República de','MD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (154,'Mónaco','MC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (155,'Mongolia','MN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (156,'Montenegro','ME');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (157,'Montserrat','MS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (158,'Mozambique','MZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (159,'Myanmar','MM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (160,'Nabimia','NA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (161,'Nauru','NR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (162,'Nepal','NP');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (163,'Nicaragua','NI');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (164,'Nigeria','NG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (165,'Níger','NE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (166,'Niue','NU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (167,'Noruega','NO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (168,'Nueva Caledonia','NC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (169,'Nueva Zelanda','NZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (170,'Omán','OM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (171,'Países Bajos','NL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (172,'Pakistán','PK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (173,'Palaos','PW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (174,'Palestina, Estado de','PS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (175,'Panamá','PA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (176,'Papúa Nueva Guinea','PG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (177,'Paraguay','PY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (178,'Perú','PE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (179,'Pitcairn','PN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (180,'Polinesia Francesa','PF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (181,'Polonia','PL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (182,'Portugal','PT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (183,'Puerto Rico','PR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (184,'Qatar','QA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (185,'Reino Unido','GB');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (186,'República Centroafricana','CF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (187,'República Checa','CZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (188,'República Democrática Popular Lao','LA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (189,'República Dominicana','DO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (190,'Reunión','RE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (191,'Ruanda','RW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (192,'Rumania','RO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (193,'Sahara Occidental','EH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (194,'Samoa Americana','AS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (195,'Samoa','WS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (196,'San Bartolomé','BL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (197,'San Cristóbal y Nieves','KN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (198,'San Marino','SM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (199,'San Martín (Parte Francesa)','MF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (200,'San Pedro y Miquelón','PM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (201,'San Vicente y Las Granadinas','VC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (202,'Santa Helena, Ascensión y Tristán de Acuña','SH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (203,'Santa Lucía','LC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (204,'Santa Sede (Ciudad Estado Vaticano)','VA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (205,'Santo Tomé y Principe','ST');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (206,'Senegal','SN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (207,'Serbia','RS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (208,'Seychelles','SC');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (209,'Sierra Leona','SL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (210,'Singapur','SG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (211,'Sint Maarten (Parte Neerlandesa)','SX');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (212,'Siria, República Arabe de','SY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (213,'Somalia','SO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (214,'Sri Lanka','LK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (215,'Suazilandia','SZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (216,'Sudáfrica','ZA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (217,'Sudán del Sur','SS');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (218,'Sudán','SD');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (219,'Suecia','SE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (220,'Suiza','CH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (221,'Surinam','SR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (222,'Svalbard y Jan Mayen','SJ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (223,'Tailandia','TH');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (224,'Taiwán, Provincia de China','TW');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (225,'Tanzania, República Unida de','TZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (226,'Tayikistán','TJ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (227,'Territorio Británico del Océano Índico','IO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (228,'Territorios Australes Franceses','TF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (229,'Timor-Leste','TL');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (230,'Togo','TG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (231,'Tokelau','TK');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (232,'Tonga','TO');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (233,'Trinidad y Tobago','TT');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (234,'Túnez','TN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (235,'Turkmenistán','TM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (236,'Turquía','TR');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (237,'Tuvalu','TV');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (238,'Ucrania','UA');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (239,'Uganda','UG');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (240,'Uruguay','UY');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (241,'Uzbekistán','UZ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (242,'Vanuatu','VU');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (243,'Venezuela, República Bolivariana de','VE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (244,'Viet Nam','VN');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (245,'Wallis y Futuna','WF');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (246,'Yemen','YE');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (247,'Yibuti','DJ');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (248,'Zambia','ZM');
INSERT INTO weathernow.`paises` (`id_pais`,`nombre_pais`,`codigo_pais`) VALUES (249,'Zimbabue','ZW');

/*
-- Query: SELECT * FROM weathernow.ciudades
-- Date: 2017-04-27 00:00
*/
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (1,'madrid',64);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (2,'zaragoza',64);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (3,'soria',64);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (4,'roma',120);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (5,'londres',185);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (6,'edinburgo',185);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (7,'paris',72);
INSERT INTO weathernow.`ciudades` (`id_ciu`,`nombre_ciu`,`id_pais`) VALUES (8,'oslo',219);

/*
-- Query: SELECT * FROM weathernow.estadoscielo
-- Date: 2017-04-27 00:02
*/
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (1,'despejado');
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (2,'nuves y claros');
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (3,'nublado');
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (4,'niebla');
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (5,'nublado');
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (6,'lluvia');
INSERT INTO weathernow.`estadoscielo` (`id_est`,`estado`) VALUES (7,'tormenta');

/*
-- Query: SELECT * FROM weathernow.usuarios
-- Date: 2017-04-27 00:01
*/
INSERT INTO weathernow.`usuarios` (`id_usu`,`clave_usu`,`correo_usu`,`privilegio_usu`,`nombre_usu`) VALUES (1,'admin','admin@admin.com','admin','admin');

/*
-- Query: SELECT * FROM weathernow.registros
-- Date: 2017-05-20 02:43
*/
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (1,'2017-04-26',8,0,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (8,'2017-04-27',7,0,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (9,'2017-04-27',5,0,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (10,'2017-04-27',4,0,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (12,'2017-04-27',8,0,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (14,'2017-04-28',8,15,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (15,'2017-04-29',8,16,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (16,'2017-04-30',8,17,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (17,'2017-05-01',8,18,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (18,'2017-05-02',8,19,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (19,'2017-05-03',8,20,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (20,'2017-05-04',8,21,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (23,'2017-05-01',5,0,1,6);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (25,'2017-05-01',1,0,1,4);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (27,'2017-05-01',3,0,1,6);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (28,'2017-05-01',2,0,1,6);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (29,'2017-05-01',6,0,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (30,'2017-05-19',3,0,1,4);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (31,'2017-05-19',6,0,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (34,'2017-05-23',2,24,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (36,'2017-05-25',2,24,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (37,'2017-05-26',2,24,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (39,'2017-05-20',1,24,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (40,'2017-05-21',1,23,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (41,'2017-05-22',1,24,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (42,'2017-05-23',1,23,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (43,'2017-05-24',1,24,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (44,'2017-05-25',1,24,1,4);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (45,'2017-05-26',1,22,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (46,'2017-05-27',1,24,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (47,'2017-05-20',2,24,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (48,'2017-05-21',2,23,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (49,'2017-05-22',2,24,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (51,'2017-05-24',2,24,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (54,'2017-05-27',2,24,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (55,'2017-05-20',3,24,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (56,'2017-05-21',3,23,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (57,'2017-05-22',3,24,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (58,'2017-05-23',3,23,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (59,'2017-05-24',3,24,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (60,'2017-05-25',3,24,1,4);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (61,'2017-05-26',3,22,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (62,'2017-05-27',3,24,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (63,'2017-05-20',4,14,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (64,'2017-05-21',4,13,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (65,'2017-05-22',4,14,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (66,'2017-05-23',4,13,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (67,'2017-05-24',4,14,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (68,'2017-05-25',4,14,1,4);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (69,'2017-05-26',4,12,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (70,'2017-05-27',4,14,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (73,'2017-05-22',5,14,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (77,'2017-05-26',5,12,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (78,'2017-05-27',5,14,1,5);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (80,'2017-05-20',5,14,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (81,'2017-05-21',5,13,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (83,'2017-05-23',5,13,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (88,'2017-01-03',2,0,1,1);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (93,'2017-05-24',5,14,1,3);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (94,'2017-05-25',5,14,1,4);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (99,'2017-06-01',4,0,1,2);
INSERT INTO weathernow.`registros` (`id_reg`,`fecha_reg`,`id_ciu`,`temperatura`,`id_usu`,`id_est`) VALUES (101,'2017-06-01',1,0,1,3);


