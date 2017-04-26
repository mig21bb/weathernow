CREATE DATABASE `weathernow` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

CREATE TABLE `ciudades` (
  `id_ciu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciu` varchar(100) DEFAULT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_ciu`),
  KEY `fk_ciudades_paises_idx` (`id_pais`),
  CONSTRAINT `FK3cnbrde3p56r63m20pv0g505i` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  CONSTRAINT `fk_ciudades_paises` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `estadoscielo` (
  `id_est` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) NOT NULL,
  `codigo_pais` varchar(3) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

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

CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL AUTO_INCREMENT,
  `clave_usu` varchar(100) NOT NULL,
  `correo_usu` varchar(100) DEFAULT NULL,
  `privilegio_usu` varchar(100) NOT NULL,
  `nombre_usu` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SELECT * FROM weathernow.estadoscielo;