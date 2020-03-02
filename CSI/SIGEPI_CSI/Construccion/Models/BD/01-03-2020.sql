-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.16 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para chaira_sigepi
DROP DATABASE IF EXISTS `chaira_sigepi`;
CREATE DATABASE IF NOT EXISTS `chaira_sigepi` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chaira_sigepi`;

-- Volcando estructura para tabla chaira_sigepi.pe_archivo
DROP TABLE IF EXISTS `pe_archivo`;
CREATE TABLE IF NOT EXISTS `pe_archivo` (
  `ID_ARCHIVO` double NOT NULL,
  `ARC_NOMBRE` varchar(500) NOT NULL,
  `ARC_URL` varchar(500) NOT NULL,
  `ID_PE_PROYECTO` double DEFAULT NULL,
  `ARC_TIPO` varchar(10) DEFAULT NULL,
  `ID_PE_TIPO_DOCUMENTO` double DEFAULT '1',
  `ARC_FECHA_CARGA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ARCHIVO`),
  KEY `PE_ARCHIVO_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_ARCHIVO_FK2` (`ID_PE_TIPO_DOCUMENTO`),
  CONSTRAINT `PE_ARCHIVO_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`) ON DELETE CASCADE,
  CONSTRAINT `PE_ARCHIVO_FK2` FOREIGN KEY (`ID_PE_TIPO_DOCUMENTO`) REFERENCES `pe_tipo_documento` (`ID_TIPO_DOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_archivo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_archivo` DISABLE KEYS */;
REPLACE INTO `pe_archivo` (`ID_ARCHIVO`, `ARC_NOMBRE`, `ARC_URL`, `ID_PE_PROYECTO`, `ARC_TIPO`, `ID_PE_TIPO_DOCUMENTO`, `ARC_FECHA_CARGA`) VALUES
	(1, 'algo', '../../../pdf/1.pdf', 1, 'pdf', 1, '2020-02-21 07:47:29'),
	(2, 'fdsafsdf', '../../../pdf/2.pdf', 3, 'word', 1, '2020-02-21 09:42:32'),
	(3, 'fasfds', '../../../pdf/3.pdf', 2, 'word', 2, '2020-02-21 09:41:59');
/*!40000 ALTER TABLE `pe_archivo` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_area_trabajo
DROP TABLE IF EXISTS `pe_area_trabajo`;
CREATE TABLE IF NOT EXISTS `pe_area_trabajo` (
  `ID_AREA_TRABAJO` double NOT NULL,
  `ARTR_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_AREA_TRABAJO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_area_trabajo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_area_trabajo` DISABLE KEYS */;
REPLACE INTO `pe_area_trabajo` (`ID_AREA_TRABAJO`, `ARTR_NOMBRE`) VALUES
	(1, 'Desarrollo social e inclusión'),
	(2, 'TIC'),
	(3, 'Desarrollo agropecuario'),
	(4, 'Gestión pública y privada');
/*!40000 ALTER TABLE `pe_area_trabajo` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_dependecia_proyecto
DROP TABLE IF EXISTS `pe_dependecia_proyecto`;
CREATE TABLE IF NOT EXISTS `pe_dependecia_proyecto` (
  `ID_DEPENDENCIA_PROYECTO` double NOT NULL,
  `DEPR_NOMBRE` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_DEPENDENCIA_PROYECTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_dependecia_proyecto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_dependecia_proyecto` DISABLE KEYS */;
REPLACE INTO `pe_dependecia_proyecto` (`ID_DEPENDENCIA_PROYECTO`, `DEPR_NOMBRE`) VALUES
	(1, 'Vicerrectoria de investigaciones'),
	(2, 'Division de bienestar universitario-Extension cultural'),
	(3, 'Unidad de Emprendimiento');
/*!40000 ALTER TABLE `pe_dependecia_proyecto` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_evaluacion
DROP TABLE IF EXISTS `pe_evaluacion`;
CREATE TABLE IF NOT EXISTS `pe_evaluacion` (
  `ID_EVALUACION` double NOT NULL,
  `EVA_OBSERVACIONES` varchar(4000) DEFAULT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  `EVA_PUNTAJE_TOTAL` double DEFAULT NULL,
  `ID_PE_PERSONA` double NOT NULL,
  `EVA_FECHA` datetime DEFAULT NULL,
  `EVA_ESTADO` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_EVALUACION`),
  KEY `PE_EVALUACION_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_EVALUACION_FK2` (`ID_PE_PERSONA`),
  CONSTRAINT `PE_EVALUACION_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`) ON DELETE CASCADE,
  CONSTRAINT `PE_EVALUACION_FK2` FOREIGN KEY (`ID_PE_PERSONA`) REFERENCES `pe_persona` (`ID_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_evaluacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_evaluacion` DISABLE KEYS */;
REPLACE INTO `pe_evaluacion` (`ID_EVALUACION`, `EVA_OBSERVACIONES`, `ID_PE_PROYECTO`, `EVA_PUNTAJE_TOTAL`, `ID_PE_PERSONA`, `EVA_FECHA`, `EVA_ESTADO`) VALUES
	(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, 75, 11, '2020-04-17 16:43:57', '0'),
	(2, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', 2, 80, 12, '2020-04-23 16:44:36', '0'),
	(3, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. ', 3, 65, 11, '2020-03-25 16:45:06', '0'),
	(4, NULL, 3, NULL, 13, '2020-02-29 15:29:18', '0');
/*!40000 ALTER TABLE `pe_evaluacion` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_evaluacion_item
DROP TABLE IF EXISTS `pe_evaluacion_item`;
CREATE TABLE IF NOT EXISTS `pe_evaluacion_item` (
  `ID_EVALUACION_ITEM` double NOT NULL,
  `EVIT_PUNTAJE` double DEFAULT NULL,
  `ID_PE_EVALUACION` double NOT NULL,
  `ID_PE_ITEM` double NOT NULL,
  `EVIT_FECHA_CALIFICACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_EVALUACION_ITEM`),
  KEY `PE_EVALUACION_ITEM_FK1` (`ID_PE_ITEM`),
  KEY `PE_EVALUCACION_ITEM_FK1` (`ID_PE_EVALUACION`),
  CONSTRAINT `PE_EVALUACION_ITEM_FK1` FOREIGN KEY (`ID_PE_ITEM`) REFERENCES `pe_item` (`ID_ITEM`),
  CONSTRAINT `PE_EVALUCACION_ITEM_FK1` FOREIGN KEY (`ID_PE_EVALUACION`) REFERENCES `pe_evaluacion` (`ID_EVALUACION`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_evaluacion_item: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_evaluacion_item` DISABLE KEYS */;
REPLACE INTO `pe_evaluacion_item` (`ID_EVALUACION_ITEM`, `EVIT_PUNTAJE`, `ID_PE_EVALUACION`, `ID_PE_ITEM`, `EVIT_FECHA_CALIFICACION`) VALUES
	(1, 5, 1, 1, '2020-02-28 16:46:07'),
	(2, 5, 2, 2, '2020-02-28 16:46:47'),
	(3, 2, 3, 3, '2020-02-28 16:47:10'),
	(4, 3, 3, 5, '2020-02-28 16:49:32'),
	(5, 5, 1, 2, NULL),
	(6, 5, 1, 3, '2020-03-01 20:56:32'),
	(7, 10, 1, 4, '2020-03-01 22:01:22'),
	(8, 12, 1, 5, '2020-03-01 22:11:22'),
	(9, 0, 1, 6, NULL),
	(10, 0, 1, 8, NULL),
	(11, 0, 2, 1, NULL);
/*!40000 ALTER TABLE `pe_evaluacion_item` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_facultad
DROP TABLE IF EXISTS `pe_facultad`;
CREATE TABLE IF NOT EXISTS `pe_facultad` (
  `ID_FACULTAD` double NOT NULL,
  `FAC_NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_FACULTAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_facultad: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_facultad` DISABLE KEYS */;
REPLACE INTO `pe_facultad` (`ID_FACULTAD`, `FAC_NOMBRE`) VALUES
	(1, 'Facultad de ciencias de la educaión '),
	(2, 'Facultad de ciencias basicas'),
	(3, 'Facultad de ciencias agropecuarias'),
	(4, 'Facultad de ciencias administrativas y contables'),
	(5, 'Facultad de ingenierias'),
	(6, 'Facultad de derecho y ciencias politicas');
/*!40000 ALTER TABLE `pe_facultad` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_grupo_extension
DROP TABLE IF EXISTS `pe_grupo_extension`;
CREATE TABLE IF NOT EXISTS `pe_grupo_extension` (
  `ID_GRUPO_EXTENSION` double NOT NULL,
  `GREX_NOMBRE` varchar(500) NOT NULL,
  PRIMARY KEY (`ID_GRUPO_EXTENSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_grupo_extension: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_grupo_extension` DISABLE KEYS */;
REPLACE INTO `pe_grupo_extension` (`ID_GRUPO_EXTENSION`, `GREX_NOMBRE`) VALUES
	(1, 'Giecom'),
	(2, 'SARA'),
	(3, 'GAIA'),
	(4, 'GIIE'),
	(5, 'Grupo de baile'),
	(6, 'Coral uniamazonia'),
	(7, 'TECNOVA');
/*!40000 ALTER TABLE `pe_grupo_extension` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_item
DROP TABLE IF EXISTS `pe_item`;
CREATE TABLE IF NOT EXISTS `pe_item` (
  `ID_ITEM` double NOT NULL,
  `ITE_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ITEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_item: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_item` DISABLE KEYS */;
REPLACE INTO `pe_item` (`ID_ITEM`, `ITE_NOMBRE`) VALUES
	(1, 'Planteamiento del problema'),
	(2, 'Justificación'),
	(3, 'Objetivos'),
	(4, ' Metodología'),
	(5, 'Impacto y pertinencia social'),
	(6, 'Resultados esperados'),
	(8, 'Número de integrantes'),
	(61, 'Cronograma');
/*!40000 ALTER TABLE `pe_item` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_objetivos
DROP TABLE IF EXISTS `pe_objetivos`;
CREATE TABLE IF NOT EXISTS `pe_objetivos` (
  `ID_OBJETIVO` double NOT NULL,
  `OBJ_DESCRIPCION` varchar(4000) NOT NULL,
  `OBJ_TIPO` varchar(20) NOT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  PRIMARY KEY (`ID_OBJETIVO`),
  KEY `PE_OBJETIVOS_FK1` (`ID_PE_PROYECTO`),
  CONSTRAINT `PE_OBJETIVOS_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_objetivos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_objetivos` DISABLE KEYS */;
REPLACE INTO `pe_objetivos` (`ID_OBJETIVO`, `OBJ_DESCRIPCION`, `OBJ_TIPO`, `ID_PE_PROYECTO`) VALUES
	(1, 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', 'General', 1),
	(2, 'Aumentar la cobertura de la inteligencia artificial en la region aplicada a los medio de ransporte', 'General', 2),
	(3, 'Detectar celulas cancerigenas de mama de manera anticipada,preveniendo enfermedades terminales', 'General', 3);
/*!40000 ALTER TABLE `pe_objetivos` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_persona
DROP TABLE IF EXISTS `pe_persona`;
CREATE TABLE IF NOT EXISTS `pe_persona` (
  `ID_PERSONA` double NOT NULL,
  `PER_NOMBRES` varchar(30) NOT NULL,
  `PER_APELLIDOS` varchar(30) NOT NULL,
  `PER_TELEFONO` varchar(10) DEFAULT NULL,
  `PER_CEDULA` varchar(20) NOT NULL,
  `PER_FECHA_REGISTRO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_persona: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_persona` DISABLE KEYS */;
REPLACE INTO `pe_persona` (`ID_PERSONA`, `PER_NOMBRES`, `PER_APELLIDOS`, `PER_TELEFONO`, `PER_CEDULA`, `PER_FECHA_REGISTRO`) VALUES
	(1, 'Jp', 'Murcia', '3102828537', '1117548404', '2020-02-12 18:09:41'),
	(2, 'user1', 'ape', '4546464', '464646464', '2020-02-12 18:10:07'),
	(3, 'USER3', 'ape', '123211', '13149872', '2020-02-17 15:57:26'),
	(4, 'USER4', 'ape', '123211', '13149872', '2020-02-17 15:57:27'),
	(5, 'USER5', 'ape', '123211', '13149872', '2020-02-17 15:57:28'),
	(6, 'USER6', 'ape', '123211', '13149872', '2020-02-17 15:57:29'),
	(7, 'USER7', 'ape', '123211', '13149872', '2020-02-17 15:57:29'),
	(8, 'USER8', 'ape', '123211', '13149872', '2020-02-17 15:57:30'),
	(9, 'USER9', 'ape', '123211', '13149872', '2020-02-17 15:57:31'),
	(10, 'USER10', 'ape', '123211', '13149872', '2020-02-17 15:57:34'),
	(11, 'par', 'sdsad', 'dsadsad', '499111', '2020-02-21 08:09:28'),
	(12, 'par2', 'dfvv', '456454', '98979797', '2020-02-21 09:24:05'),
	(13, 'par3', 'apelii', '79897', '12146', '2020-02-21 09:24:29');
/*!40000 ALTER TABLE `pe_persona` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_persona_programa
DROP TABLE IF EXISTS `pe_persona_programa`;
CREATE TABLE IF NOT EXISTS `pe_persona_programa` (
  `ID_PERSONA_PROGRAMA` double NOT NULL,
  `ID_PE_PERSONA` double NOT NULL,
  `ID_PE_PROGRAMA` double NOT NULL,
  PRIMARY KEY (`ID_PERSONA_PROGRAMA`),
  KEY `PE_PERSONA_PROGRAMA_FK1` (`ID_PE_PERSONA`),
  KEY `PE_PERSONA_PROGRAMA_FK2` (`ID_PE_PROGRAMA`),
  CONSTRAINT `PE_PERSONA_PROGRAMA_FK1` FOREIGN KEY (`ID_PE_PERSONA`) REFERENCES `pe_persona` (`ID_PERSONA`),
  CONSTRAINT `PE_PERSONA_PROGRAMA_FK2` FOREIGN KEY (`ID_PE_PROGRAMA`) REFERENCES `pe_programa` (`ID_PROGRAMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_persona_programa: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_persona_programa` DISABLE KEYS */;
REPLACE INTO `pe_persona_programa` (`ID_PERSONA_PROGRAMA`, `ID_PE_PERSONA`, `ID_PE_PROGRAMA`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 10, 3);
/*!40000 ALTER TABLE `pe_persona_programa` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_poblacion
DROP TABLE IF EXISTS `pe_poblacion`;
CREATE TABLE IF NOT EXISTS `pe_poblacion` (
  `ID_POBLACION` double NOT NULL,
  `POB_NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_POBLACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_poblacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_poblacion` DISABLE KEYS */;
REPLACE INTO `pe_poblacion` (`ID_POBLACION`, `POB_NOMBRE`) VALUES
	(1, 'primera infancia'),
	(2, 'Niñez'),
	(3, 'Poblacion vulnerable'),
	(4, 'Grupos deportivos');
/*!40000 ALTER TABLE `pe_poblacion` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_poblacion_ciclo
DROP TABLE IF EXISTS `pe_poblacion_ciclo`;
CREATE TABLE IF NOT EXISTS `pe_poblacion_ciclo` (
  `ID_POBLACION_CICLO` double NOT NULL,
  `POCI_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_POBLACION_CICLO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_poblacion_ciclo: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_poblacion_ciclo` DISABLE KEYS */;
REPLACE INTO `pe_poblacion_ciclo` (`ID_POBLACION_CICLO`, `POCI_NOMBRE`) VALUES
	(1, 'Primera infancia (0-5 años)'),
	(2, 'Niñez (6-10 años)'),
	(3, 'Adultos ( 26-60 años )'),
	(4, 'Jóvenes (11-25 años)'),
	(5, 'Adultos mayores (> 60 años)');
/*!40000 ALTER TABLE `pe_poblacion_ciclo` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_poblacion_condicion
DROP TABLE IF EXISTS `pe_poblacion_condicion`;
CREATE TABLE IF NOT EXISTS `pe_poblacion_condicion` (
  `ID_POBLACION_CONDICION` double NOT NULL,
  `POCO_NOMRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_POBLACION_CONDICION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_poblacion_condicion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_poblacion_condicion` DISABLE KEYS */;
REPLACE INTO `pe_poblacion_condicion` (`ID_POBLACION_CONDICION`, `POCO_NOMRE`) VALUES
	(1, 'vulnerabilidad social-violecia intrafamiliar'),
	(2, 'Vulnerabilidad social-violencia sexual');
/*!40000 ALTER TABLE `pe_poblacion_condicion` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_poblacion_grupos
DROP TABLE IF EXISTS `pe_poblacion_grupos`;
CREATE TABLE IF NOT EXISTS `pe_poblacion_grupos` (
  `ID_POBLACION_GRUPOS` double NOT NULL,
  `POGR_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_POBLACION_GRUPOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_poblacion_grupos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_poblacion_grupos` DISABLE KEYS */;
REPLACE INTO `pe_poblacion_grupos` (`ID_POBLACION_GRUPOS`, `POGR_NOMBRE`) VALUES
	(1, 'Familia'),
	(2, 'Profesionales '),
	(3, 'Mujeres');
/*!40000 ALTER TABLE `pe_poblacion_grupos` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_programa
DROP TABLE IF EXISTS `pe_programa`;
CREATE TABLE IF NOT EXISTS `pe_programa` (
  `ID_PROGRAMA` double NOT NULL,
  `PRO_NOMBRE` varchar(50) NOT NULL,
  `ID_PE_FACULTAD` double NOT NULL,
  PRIMARY KEY (`ID_PROGRAMA`),
  KEY `PE_PROGRAMA_FK1` (`ID_PE_FACULTAD`),
  CONSTRAINT `PE_PROGRAMA_FK1` FOREIGN KEY (`ID_PE_FACULTAD`) REFERENCES `pe_facultad` (`ID_FACULTAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_programa: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_programa` DISABLE KEYS */;
REPLACE INTO `pe_programa` (`ID_PROGRAMA`, `PRO_NOMBRE`, `ID_PE_FACULTAD`) VALUES
	(1, 'Ingenieria de Sistemas ', 2),
	(2, 'Ingenieria Agropecuaria', 2),
	(3, 'Quimica', 3),
	(4, 'Derecho', 6),
	(5, 'Psicologia', 1),
	(7, ' Biologia', 2);
/*!40000 ALTER TABLE `pe_programa` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_proyecto
DROP TABLE IF EXISTS `pe_proyecto`;
CREATE TABLE IF NOT EXISTS `pe_proyecto` (
  `ID_PROYECTO` double NOT NULL,
  `PRO_NOMBRE` varchar(500) NOT NULL,
  `PRO_METODOLOGIA` longtext NOT NULL,
  `PRO_COMPONENTE_INNOVADOR` varchar(4000) NOT NULL,
  `PRO_RESULTADOS_ESPERADOS` varchar(4000) NOT NULL,
  `ID_COORDINADOR` double NOT NULL,
  `ID_PE_GRUPO_EXTENSION` double NOT NULL,
  `ID_PE_POBLACION` double NOT NULL,
  `ID_PE_DEPENDENCIA_PROYECTO` double NOT NULL,
  `PRO_ELIMINADO` varchar(1) NOT NULL DEFAULT '0',
  `PRO_PLANTEAMIENTO_PROBLEMA` longtext NOT NULL,
  `PRO_JUSTIFICACION` longtext NOT NULL,
  `PRO_FECHA_PRESENTACION` datetime NOT NULL,
  `PRO_FECHA_INICIO` datetime NOT NULL,
  `PRO_FECHA_FIN` datetime NOT NULL,
  PRIMARY KEY (`ID_PROYECTO`),
  KEY `PE_PROYECTO_FK1` (`ID_COORDINADOR`),
  KEY `PE_PROYECTO_FK3` (`ID_PE_GRUPO_EXTENSION`),
  KEY `PE_PROYECTO_FK4` (`ID_PE_POBLACION`),
  KEY `PE_PROYECTO_FK5` (`ID_PE_DEPENDENCIA_PROYECTO`),
  CONSTRAINT `PE_PROYECTO_FK1` FOREIGN KEY (`ID_COORDINADOR`) REFERENCES `pe_persona` (`ID_PERSONA`),
  CONSTRAINT `PE_PROYECTO_FK3` FOREIGN KEY (`ID_PE_GRUPO_EXTENSION`) REFERENCES `pe_grupo_extension` (`ID_GRUPO_EXTENSION`),
  CONSTRAINT `PE_PROYECTO_FK4` FOREIGN KEY (`ID_PE_POBLACION`) REFERENCES `pe_poblacion` (`ID_POBLACION`),
  CONSTRAINT `PE_PROYECTO_FK5` FOREIGN KEY (`ID_PE_DEPENDENCIA_PROYECTO`) REFERENCES `pe_dependecia_proyecto` (`ID_DEPENDENCIA_PROYECTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_proyecto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_proyecto` DISABLE KEYS */;
REPLACE INTO `pe_proyecto` (`ID_PROYECTO`, `PRO_NOMBRE`, `PRO_METODOLOGIA`, `PRO_COMPONENTE_INNOVADOR`, `PRO_RESULTADOS_ESPERADOS`, `ID_COORDINADOR`, `ID_PE_GRUPO_EXTENSION`, `ID_PE_POBLACION`, `ID_PE_DEPENDENCIA_PROYECTO`, `PRO_ELIMINADO`, `PRO_PLANTEAMIENTO_PROBLEMA`, `PRO_JUSTIFICACION`, `PRO_FECHA_PRESENTACION`, `PRO_FECHA_INICIO`, `PRO_FECHA_FIN`) VALUES
	(1, 'Fortalecimiento de las actividades academicas en barrios vulnerables', 'Metodologia x', 'Educación popular', 'Poblacion vulnerable con altos niveles de educación diferencial', 2, 4, 3, 1, '0', 'Ninguno', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum', '2020-02-27 16:10:40', '2020-02-15 16:10:45', '2020-04-24 16:10:49'),
	(2, 'Inteligencia artificial para la optimización de rutas en el transpote publico', 'Metodologia y ', 'Inteligencia artificial', 'Casco urbano', 7, 1, 4, 1, '0', 'Ninguno', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', '2020-07-15 16:14:58', '2020-02-05 16:15:10', '2020-06-11 16:15:13'),
	(3, 'Diagnostico de celulas dn cancer de mama', 'Metodologia z', 'Biologia', 'Paciente con posbiles diagnosticos de cancer', 8, 3, 3, 1, '0', 'Ninguno', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', '2020-02-29 16:21:11', '2020-03-05 16:21:17', '2020-09-20 16:21:22');
/*!40000 ALTER TABLE `pe_proyecto` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_proyecto_artr
DROP TABLE IF EXISTS `pe_proyecto_artr`;
CREATE TABLE IF NOT EXISTS `pe_proyecto_artr` (
  `ID_PRAR` double NOT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  `ID_PE_AREA_TRABAJO` double NOT NULL,
  `PRAR_ESTADO` char(1) NOT NULL,
  PRIMARY KEY (`ID_PRAR`,`ID_PE_PROYECTO`),
  KEY `PE_PROYECTO_ARTR_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_PROYECTO_ARTR_FK2` (`ID_PE_AREA_TRABAJO`),
  CONSTRAINT `PE_PROYECTO_ARTR_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`) ON DELETE CASCADE,
  CONSTRAINT `PE_PROYECTO_ARTR_FK2` FOREIGN KEY (`ID_PE_AREA_TRABAJO`) REFERENCES `pe_area_trabajo` (`ID_AREA_TRABAJO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_proyecto_artr: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_proyecto_artr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_artr` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_proyecto_persona
DROP TABLE IF EXISTS `pe_proyecto_persona`;
CREATE TABLE IF NOT EXISTS `pe_proyecto_persona` (
  `ID_PROYECTO_PERSONA` double NOT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  `ID_PE_PERSONA` double NOT NULL,
  `ID_PE_TIPO_VINCULACION` double NOT NULL,
  PRIMARY KEY (`ID_PROYECTO_PERSONA`),
  KEY `PE_PROYECTO_PERSONA_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_PROYECTO_PERSONA_FK2` (`ID_PE_PERSONA`),
  KEY `PE_PROYECTO_PERSONA_FK3` (`ID_PE_TIPO_VINCULACION`),
  CONSTRAINT `PE_PROYECTO_PERSONA_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`),
  CONSTRAINT `PE_PROYECTO_PERSONA_FK2` FOREIGN KEY (`ID_PE_PERSONA`) REFERENCES `pe_persona` (`ID_PERSONA`),
  CONSTRAINT `PE_PROYECTO_PERSONA_FK3` FOREIGN KEY (`ID_PE_TIPO_VINCULACION`) REFERENCES `pe_tipo_vinculacion` (`ID_TIPO_VINCULACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_proyecto_persona: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_proyecto_persona` DISABLE KEYS */;
REPLACE INTO `pe_proyecto_persona` (`ID_PROYECTO_PERSONA`, `ID_PE_PROYECTO`, `ID_PE_PERSONA`, `ID_PE_TIPO_VINCULACION`) VALUES
	(1, 1, 4, 4),
	(2, 1, 2, 3),
	(3, 1, 11, 5),
	(4, 2, 11, 5),
	(5, 2, 5, 4),
	(6, 1, 9, 5),
	(7, 3, 1, 4);
/*!40000 ALTER TABLE `pe_proyecto_persona` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_proyecto_poci
DROP TABLE IF EXISTS `pe_proyecto_poci`;
CREATE TABLE IF NOT EXISTS `pe_proyecto_poci` (
  `ID_PROYECTO_POCI` double NOT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  `ID_PE_POBLACION_CICLO` double NOT NULL,
  `PRPO_ESTADO` char(1) NOT NULL,
  PRIMARY KEY (`ID_PROYECTO_POCI`),
  KEY `PE_PROYECTO_POCI_FK1` (`ID_PE_POBLACION_CICLO`),
  KEY `PE_PROYECTO_POCI_FK2` (`ID_PE_PROYECTO`),
  CONSTRAINT `PE_PROYECTO_POCI_FK1` FOREIGN KEY (`ID_PE_POBLACION_CICLO`) REFERENCES `pe_poblacion_ciclo` (`ID_POBLACION_CICLO`),
  CONSTRAINT `PE_PROYECTO_POCI_FK2` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_proyecto_poci: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_proyecto_poci` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_poci` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_proyecto_poco
DROP TABLE IF EXISTS `pe_proyecto_poco`;
CREATE TABLE IF NOT EXISTS `pe_proyecto_poco` (
  `ID_PROYECTO_POCO` double NOT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  `ID_PE_POBLACION_CONDICION` double NOT NULL,
  `PRPO_ESTADO` char(1) NOT NULL,
  PRIMARY KEY (`ID_PROYECTO_POCO`),
  KEY `PE_PROYECTO_POCO_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_PROYECTO_POCO_FK2` (`ID_PE_POBLACION_CONDICION`),
  CONSTRAINT `PE_PROYECTO_POCO_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`),
  CONSTRAINT `PE_PROYECTO_POCO_FK2` FOREIGN KEY (`ID_PE_POBLACION_CONDICION`) REFERENCES `pe_poblacion_condicion` (`ID_POBLACION_CONDICION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_proyecto_poco: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_proyecto_poco` DISABLE KEYS */;
REPLACE INTO `pe_proyecto_poco` (`ID_PROYECTO_POCO`, `ID_PE_PROYECTO`, `ID_PE_POBLACION_CONDICION`, `PRPO_ESTADO`) VALUES
	(1, 3, 1, '1'),
	(2, 1, 1, '1');
/*!40000 ALTER TABLE `pe_proyecto_poco` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_proyecto_pogr
DROP TABLE IF EXISTS `pe_proyecto_pogr`;
CREATE TABLE IF NOT EXISTS `pe_proyecto_pogr` (
  `ID_PROYECTO_POGR` double NOT NULL,
  `ID_PE_PROYECTO` double NOT NULL,
  `ID_PE_POBLACION_GRUPOS` double NOT NULL,
  `PRPO_ESTADO` char(1) NOT NULL,
  PRIMARY KEY (`ID_PROYECTO_POGR`),
  KEY `PE_PROYECTO_POGR_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_PROYECTO_POGR_FK2` (`ID_PE_POBLACION_GRUPOS`),
  CONSTRAINT `PE_PROYECTO_POGR_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`),
  CONSTRAINT `PE_PROYECTO_POGR_FK2` FOREIGN KEY (`ID_PE_POBLACION_GRUPOS`) REFERENCES `pe_poblacion_grupos` (`ID_POBLACION_GRUPOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_proyecto_pogr: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_proyecto_pogr` DISABLE KEYS */;
REPLACE INTO `pe_proyecto_pogr` (`ID_PROYECTO_POGR`, `ID_PE_PROYECTO`, `ID_PE_POBLACION_GRUPOS`, `PRPO_ESTADO`) VALUES
	(1, 1, 1, '1'),
	(2, 2, 2, '1'),
	(3, 3, 3, '1');
/*!40000 ALTER TABLE `pe_proyecto_pogr` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_rol
DROP TABLE IF EXISTS `pe_rol`;
CREATE TABLE IF NOT EXISTS `pe_rol` (
  `ID_ROL` double NOT NULL,
  `ROL_NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_rol: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_rol` DISABLE KEYS */;
REPLACE INTO `pe_rol` (`ID_ROL`, `ROL_NOMBRE`) VALUES
	(2, 'Rector'),
	(3, 'Vicerrectoria de Investigaciones'),
	(4, 'Comite de Investigacion'),
	(5, 'Consejo de Facultad'),
	(6, 'Consejo superior'),
	(7, 'Comite de Curriculo'),
	(9, 'Administrador '),
	(10, 'Docentes');
/*!40000 ALTER TABLE `pe_rol` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_tipo_dependencia
DROP TABLE IF EXISTS `pe_tipo_dependencia`;
CREATE TABLE IF NOT EXISTS `pe_tipo_dependencia` (
  `ID_TIPO_DEPENDENCIA` double NOT NULL,
  `TIDE_NOMBRE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_DEPENDENCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_tipo_dependencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_tipo_dependencia` DISABLE KEYS */;
REPLACE INTO `pe_tipo_dependencia` (`ID_TIPO_DEPENDENCIA`, `TIDE_NOMBRE`) VALUES
	(1, 'nose'),
	(2, 'dasd');
/*!40000 ALTER TABLE `pe_tipo_dependencia` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_tipo_documento
DROP TABLE IF EXISTS `pe_tipo_documento`;
CREATE TABLE IF NOT EXISTS `pe_tipo_documento` (
  `ID_TIPO_DOCUMENTO` double NOT NULL,
  `TIDO_NOMBRE` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_TIPO_DOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_tipo_documento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_tipo_documento` DISABLE KEYS */;
REPLACE INTO `pe_tipo_documento` (`ID_TIPO_DOCUMENTO`, `TIDO_NOMBRE`) VALUES
	(1, 'Identidad '),
	(2, 'Cedula ciudadana');
/*!40000 ALTER TABLE `pe_tipo_documento` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_tipo_vinculacion
DROP TABLE IF EXISTS `pe_tipo_vinculacion`;
CREATE TABLE IF NOT EXISTS `pe_tipo_vinculacion` (
  `ID_TIPO_VINCULACION` double NOT NULL,
  `TIVI_NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TIPO_VINCULACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_tipo_vinculacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_tipo_vinculacion` DISABLE KEYS */;
REPLACE INTO `pe_tipo_vinculacion` (`ID_TIPO_VINCULACION`, `TIVI_NOMBRE`) VALUES
	(1, 'Estudiante'),
	(2, 'Funcionario'),
	(3, 'Docente'),
	(4, 'Coodinador'),
	(5, 'Evaluador');
/*!40000 ALTER TABLE `pe_tipo_vinculacion` ENABLE KEYS */;

-- Volcando estructura para tabla chaira_sigepi.pe_usuario
DROP TABLE IF EXISTS `pe_usuario`;
CREATE TABLE IF NOT EXISTS `pe_usuario` (
  `ID_USUARIO` double NOT NULL,
  `USU_CORREO` varchar(100) NOT NULL,
  `USU_CONTRASENA` varchar(300) NOT NULL,
  `ID_PE_PERSONA` double NOT NULL,
  `USU_ESTADO` char(1) NOT NULL DEFAULT '0',
  `ID_PE_ROL` double NOT NULL,
  `USU_ACTIVACION` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `PE_USUARIO_FK1` (`ID_PE_PERSONA`),
  KEY `PE_USUARIO_FK2` (`ID_PE_ROL`),
  CONSTRAINT `PE_USUARIO_FK1` FOREIGN KEY (`ID_PE_PERSONA`) REFERENCES `pe_persona` (`ID_PERSONA`) ON DELETE CASCADE,
  CONSTRAINT `PE_USUARIO_FK2` FOREIGN KEY (`ID_PE_ROL`) REFERENCES `pe_rol` (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla chaira_sigepi.pe_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pe_usuario` DISABLE KEYS */;
REPLACE INTO `pe_usuario` (`ID_USUARIO`, `USU_CORREO`, `USU_CONTRASENA`, `ID_PE_PERSONA`, `USU_ESTADO`, `ID_PE_ROL`, `USU_ACTIVACION`) VALUES
	(1, 'jp@udla.edu.co', '1234', 1, '1', 9, '1'),
	(2, 'rector@udla.edu.co', '1234', 2, '1', 2, '1'),
	(3, 'vice@udla.edu.co', '1234', 3, '1', 3, '1'),
	(4, 'comiinve@udla.edu.co', '1234', 4, '1', 4, '1'),
	(5, '5@udla.edu.co', '1234', 5, '1', 5, '1'),
	(6, '6@udla.edu.co', '1234', 6, '1', 6, '1'),
	(7, '7@udla.edu.co', '1234', 7, '1', 7, '1'),
	(8, '8@udla.edu.co', '1234', 8, '1', 10, '1'),
	(9, '9@udla.edu.co', '1234', 9, '1', 10, '1'),
	(10, 'par@udla.edu.co', '1234', 10, '1', 10, '1'),
	(11, 'par1@udla.edu.co', '1234', 11, '1', 10, '1'),
	(12, 'par2@udla.edu.co', '1234', 12, '1', 10, '1'),
	(13, 'par3@udla.edu.co', '1234', 13, '1', 10, '1');
/*!40000 ALTER TABLE `pe_usuario` ENABLE KEYS */;

-- Volcando estructura para procedimiento chaira_sigepi. consul_item
DROP PROCEDURE IF EXISTS ` consul_item`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE ` consul_item`()
BEGIN

SELECT * FROM pe_item;

END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.asignar_Puntaje_Item
DROP PROCEDURE IF EXISTS `asignar_Puntaje_Item`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_Puntaje_Item`(
	IN `id_Evaluacion` INT,
	IN `id_Item` INT,
	IN `Puntaje` INT








)
BEGIN


Declare exite int ;
Declare NUM int ;

SET NUM =(select IFNULL(MAX(pe_evaluacion_item.ID_EVALUACION_ITEM),0) FROM pe_evaluacion_item);


select COUNT(*) INTO exite from pe_evaluacion
 inner join pe_evaluacion_item ON pe_evaluacion_item.ID_PE_EVALUACION=pe_evaluacion.ID_EVALUACION

WHERE pe_evaluacion.ID_EVALUACION=id_Evaluacion AND id_Item=pe_evaluacion_item.ID_PE_ITEM;


if (exite=1) THEN

	
	UPDATE pe_evaluacion_item SET pe_evaluacion_item.EVIT_PUNTAJE=Puntaje ,
	 pe_evaluacion_item.EVIT_FECHA_CALIFICACION=NOW()
	WHERE pe_evaluacion_item.ID_PE_ITEM=id_Item and pe_evaluacion_item.ID_PE_EVALUACION=id_Evaluacion;
	select " Puntaje Actualizado" Mensaje , "3" TIPO;
else

	insert into pe_evaluacion_item
	(pe_evaluacion_item.ID_EVALUACION_ITEM	,
	pe_evaluacion_item.ID_PE_EVALUACION,
	pe_evaluacion_item.ID_PE_ITEM,
	pe_evaluacion_item.EVIT_PUNTAJE,
	pe_evaluacion_item.EVIT_FECHA_CALIFICACION) values(NUM+1, id_Evaluacion,id_Item,Puntaje,now()); 
	
	select "Nuevo Puntaje Guardado" Mensaje , "3" TIPO;
	
end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consultar_Observaciones_Evaluacion
DROP PROCEDURE IF EXISTS `consultar_Observaciones_Evaluacion`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_Observaciones_Evaluacion`(
	IN `ID_EVAL` INT
)
BEGIN
select pe_evaluacion.EVA_OBSERVACIONES OBSERVACIONES from pe_evaluacion
where pe_evaluacion.ID_EVALUACION= ID_EVAL;
END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.Consul_Es_par
DROP PROCEDURE IF EXISTS `Consul_Es_par`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consul_Es_par`(
	IN `ID_PER` INT
)
BEGIN
Declare exite int;

select COUNT(*) into exite FROM pe_persona 
inner join pe_evaluacion on pe_evaluacion.ID_PE_PERSONA=pe_persona.ID_PERSONA
where ID_PER=pe_persona.ID_PERSONA;

if(exite<>0) THEN
	
	select "si" Mensaje;
else
	select "no" Mensaje;
end if;


END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_Par_Evaluador_Docentes
DROP PROCEDURE IF EXISTS `consul_Par_Evaluador_Docentes`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_Par_Evaluador_Docentes`()
BEGIN

SELECT per.ID_PERSONA ID,per.PER_NOMBRES NOMBRE,per.PER_APELLIDOS ape, per.PER_CEDULA FROM pe_persona per
INNER JOIN pe_usuario usu ON usu.ID_PE_PERSONA = per.ID_PERSONA
WHERE usu.ID_PE_ROL=10;

END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_Par_Evaluador_Proye
DROP PROCEDURE IF EXISTS `consul_Par_Evaluador_Proye`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_Par_Evaluador_Proye`(
	IN `id_proyec` INT
)
BEGIN
SELECT per.ID_PERSONA ID,CONCAT (per.PER_NOMBRES ," ", per.PER_APELLIDOS) AS NOMBRE
 	FROM pe_persona per
INNER JOIN pe_evaluacion eva ON eva.ID_PE_PERSONA =per.ID_PERSONA

WHERE  eva.ID_PE_PROYECTO = id_proyec;


END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_Par_Evaluador_Proye1
DROP PROCEDURE IF EXISTS `consul_Par_Evaluador_Proye1`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_Par_Evaluador_Proye1`(
	IN `id_proyec` INT
)
BEGIN

SELECT per.ID_PERSONA ID, per.PER_NOMBRES NOMBRE, per.PER_APELLIDOS ape_per, per.PER_CEDULA cedu_per FROM pe_persona per
INNER JOIN pe_proyecto_persona proye_per ON proye_per.ID_PE_PERSONA=per.ID_PERSONA
INNER JOIN pe_tipo_vinculacion vincu ON vincu.ID_TIPO_VINCULACION=proye_per.ID_PE_TIPO_VINCULACION
WHERE proye_per.ID_PE_PROYECTO=id_proyec AND proye_per.ID_PE_TIPO_VINCULACION=5;

END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_proyectos
DROP PROCEDURE IF EXISTS `consul_proyectos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_proyectos`()
BEGIN

SELECT pro.ID_PROYECTO ID, pro.PRO_NOMBRE  PROYECTO, CONCAT (per.PER_NOMBRES ," ", per.PER_APELLIDOS) AS COORDINADOR , arc.ARC_URL ARCHIVO
FROM pe_proyecto pro
INNER JOIN pe_proyecto_persona pro_per ON pro_per.ID_PE_PROYECTO=pro.ID_PROYECTO
INNER JOIN pe_tipo_vinculacion vincu ON vincu.ID_TIPO_VINCULACION=pro_per.ID_PE_TIPO_VINCULACION
INNER JOIN pe_persona per ON per.ID_PERSONA=pro_per.ID_PE_PERSONA

INNER JOIN pe_archivo arc ON arc.ID_PE_PROYECTO = pro.ID_PROYECTO
 WHERE vincu.ID_TIPO_VINCULACION=4;

END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_Proyectos_del_Par
DROP PROCEDURE IF EXISTS `consul_Proyectos_del_Par`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_Proyectos_del_Par`(
	IN `ID_PER` INT







)
BEGIN
SELECT pro.ID_PROYECTO ID, pro.PRO_NOMBRE  PROYECTO, eva.EVA_ESTADO ESTADO,"Evaluar" ENLACE

from pe_persona per


inner join pe_evaluacion eva on eva.ID_PE_PERSONA = per.ID_PERSONA

inner join pe_proyecto pro on pro.ID_PROYECTO=eva.ID_PE_PROYECTO

where per.ID_PERSONA=ID_PER;
END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_Proyec_Evaulacion
DROP PROCEDURE IF EXISTS `consul_Proyec_Evaulacion`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_Proyec_Evaulacion`(
	IN `PROYECTO` INT,
	IN `ID_USER` INT







)
BEGIN



select eva.ID_EVALUACION EVALUACION,
pro.PRO_METODOLOGIA METODOLOGIA,
pro.PRO_JUSTIFICACION JUSTIFICACION,
pro.PRO_PLANTEAMIENTO_PROBLEMA PLANTEAMIENTO,
pro.PRO_COMPONENTE_INNOVADOR IMPACTO,
pro.PRO_RESULTADOS_ESPERADOS RESULTADOS,
obj.OBJ_DESCRIPCION GENERAL,
eva.EVA_ESTADO ESTADO,
pro.PRO_NOMBRE PROYECTO

  from pe_persona per
inner join pe_evaluacion eva on eva.ID_PE_PERSONA = per.ID_PERSONA
inner join pe_evaluacion_item eva_item on eva_item.ID_PE_EVALUACION=eva.ID_EVALUACION 
inner join pe_proyecto pro on eva.ID_PE_PROYECTO=pro.ID_PROYECTO
inner join pe_objetivos obj on obj.ID_PE_PROYECTO=pro.ID_PROYECTO

WHERE pro.ID_PROYECTO=PROYECTO and per.ID_PERSONA=ID_USER; 
END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_proyec_prueba
DROP PROCEDURE IF EXISTS `consul_proyec_prueba`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_proyec_prueba`()
BEGIN


SELECT pro.ID_PROYECTO idp_pro, pro.PRO_NOMBRE nom_pro, CONCAT (per.PER_NOMBRES ," ", per.PER_APELLIDOS) AS coord ,
(SELECT  COUNT(proye_per.ID_PROYECTO_PERSONA )AS cant FROM pe_rol rol
 INNER JOIN pe_usuario uss ON uss.ID_PE_ROL=rol.ID_ROL
 INNER JOIN pe_persona pers ON uss.ID_PE_PERSONA=pers.ID_PERSONA
 INNER JOIN pe_proyecto_persona proye_per ON proye_per.ID_PE_PERSONA=pers.ID_PERSONA
 INNER JOIN pe_tipo_vinculacion vincu ON vincu.ID_TIPO_VINCULACION=proye_per.ID_PE_TIPO_VINCULACION
 INNER JOIN pe_proyecto proyec ON proyec.ID_PROYECTO = proye_per.ID_PE_PROYECTO
 WHERE vincu.ID_TIPO_VINCULACION=5) AS CANTI

FROM pe_proyecto pro
INNER JOIN pe_proyecto_persona pro_per ON pro_per.ID_PE_PROYECTO=pro.ID_PROYECTO
INNER JOIN pe_tipo_vinculacion vincu ON vincu.ID_TIPO_VINCULACION=pro_per.ID_PE_TIPO_VINCULACION
INNER JOIN pe_persona per ON per.ID_PERSONA=pro_per.ID_PE_PERSONA
 WHERE vincu.ID_TIPO_VINCULACION=5;




END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.consul_Puntaje_Items_Evaluador
DROP PROCEDURE IF EXISTS `consul_Puntaje_Items_Evaluador`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consul_Puntaje_Items_Evaluador`(
	IN `id_Evaluacion` INT
)
BEGIN

select item.ITE_NOMBRE,eva_item.EVIT_PUNTAJE PUNTAJE from pe_evaluacion eva
inner join pe_evaluacion_item eva_item on eva_item.ID_PE_EVALUACION=eva.ID_EVALUACION
inner join pe_item item on eva_item.ID_PE_ITEM=item.ID_ITEM
where eva.ID_EVALUACION=id_Evaluacion; 

END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.insert_par_evaluador
DROP PROCEDURE IF EXISTS `insert_par_evaluador`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_par_evaluador`(
	IN `id_proyec` INT,
	IN `id_par` INT

)
BEGIN

declare num int;

SET num =(select IFNULL(MAX(pe_evaluacion.ID_EVALUACION),0) FROM pe_evaluacion);


INSERT INTO pe_evaluacion()VALUES(num+1,null,id_proyec,null,id_par,NOW(),"0");

SELECT "3" TIPO, "Lo lamento perro" MENSAJE FROM pe_evaluacion;



END//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.login
DROP PROCEDURE IF EXISTS `login`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
	IN `email_usuari` VARCHAR(50),
	IN `contra` VARCHAR(50)
)
begin 
 
 declare nombre varchar(60);
 declare id int;
 declare tipoUsuario varchar(60);

 
 
 
select 
	us.ID_USUARIO into id
	
from pe_usuario us 
where us.USU_CORREO=email_usuari 
and us.USU_CONTRASENA=contra;
 




if( id is null) then
	select "nada perroooo" as mensaje;
ELSE 
	select 
		"si" AS mensaje,
		per.ID_PERSONA AS ID_PER,
		per.PER_NOMBRES AS nombre,
		rol.ROL_NOMBRE AS rol,
		rol.ID_ROL 
		
		
		
	from pe_usuario usu
	INNER join pe_persona per ON per.ID_PERSONA=usu.ID_PE_PERSONA
	INNER join pe_rol rol ON rol.ID_ROL=usu.ID_PE_ROL
	where usu.USU_CORREO=email_usuari 
	and usu.USU_CONTRASENA=contra;
	
	
	
 	
	
	end if;


end//
DELIMITER ;

-- Volcando estructura para procedimiento chaira_sigepi.prueba_cantidad
DROP PROCEDURE IF EXISTS `prueba_cantidad`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba_cantidad`()
BEGIN
SELECT COUNT(proye_per.ID_PROYECTO_PERSONA ) AS cant FROM pe_rol rol
 INNER JOIN pe_usuario uss ON uss.ID_PE_ROL=rol.ID_ROL
 INNER JOIN pe_persona pers ON uss.ID_PE_PERSONA=pers.ID_PERSONA
 INNER JOIN pe_proyecto_persona proye_per ON proye_per.ID_PE_PERSONA=pers.ID_PERSONA
 INNER JOIN pe_tipo_vinculacion vincu ON vincu.ID_TIPO_VINCULACION=proye_per.ID_PE_TIPO_VINCULACION
 INNER JOIN pe_proyecto proyec ON proyec.ID_PROYECTO = proye_per.ID_PE_PROYECTO
 WHERE vincu.ID_TIPO_VINCULACION=4;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
