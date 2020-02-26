-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.21-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for chaira_sigepi
DROP DATABASE IF EXISTS `chaira_sigepi`;
CREATE DATABASE IF NOT EXISTS `chaira_sigepi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `chaira_sigepi`;

-- Dumping structure for table chaira_sigepi.pe_archivo
DROP TABLE IF EXISTS `pe_archivo`;
CREATE TABLE IF NOT EXISTS `pe_archivo` (
  `ARC_NOMBRE` varchar(500) NOT NULL,
  `ARC_URL` varchar(500) NOT NULL,
  `ID_PE_PROYECTO` double DEFAULT NULL,
  `ID_ARCHIVO` double NOT NULL,
  `ARC_TIPO` varchar(10) DEFAULT NULL,
  `ID_PE_TIPO_DOCUMENTO` double DEFAULT '1',
  `ARC_FECHA_CARGA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ARCHIVO`),
  KEY `PE_ARCHIVO_FK1` (`ID_PE_PROYECTO`),
  KEY `PE_ARCHIVO_FK2` (`ID_PE_TIPO_DOCUMENTO`),
  CONSTRAINT `PE_ARCHIVO_FK1` FOREIGN KEY (`ID_PE_PROYECTO`) REFERENCES `pe_proyecto` (`ID_PROYECTO`) ON DELETE CASCADE,
  CONSTRAINT `PE_ARCHIVO_FK2` FOREIGN KEY (`ID_PE_TIPO_DOCUMENTO`) REFERENCES `pe_tipo_documento` (`ID_TIPO_DOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_archivo: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_archivo` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_area_trabajo
DROP TABLE IF EXISTS `pe_area_trabajo`;
CREATE TABLE IF NOT EXISTS `pe_area_trabajo` (
  `ID_AREA_TRABAJO` double NOT NULL,
  `ARTR_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_AREA_TRABAJO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_area_trabajo: ~3 rows (approximately)
/*!40000 ALTER TABLE `pe_area_trabajo` DISABLE KEYS */;
REPLACE INTO `pe_area_trabajo` (`ID_AREA_TRABAJO`, `ARTR_NOMBRE`) VALUES
	(1, 'Educacion'),
	(2, 'TIC'),
	(3, 'Desarrollo agropecuario');
/*!40000 ALTER TABLE `pe_area_trabajo` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_dependecia_proyecto
DROP TABLE IF EXISTS `pe_dependecia_proyecto`;
CREATE TABLE IF NOT EXISTS `pe_dependecia_proyecto` (
  `ID_DEPENDENCIA_PROYECTO` double NOT NULL,
  `DEPR_NOMBRE` varchar(200) NOT NULL,
  `ID_PE_TIPO_DEPENDENCIA` double NOT NULL,
  PRIMARY KEY (`ID_DEPENDENCIA_PROYECTO`),
  KEY `PE_DEPENDECIA_PROYECTO_FK1` (`ID_PE_TIPO_DEPENDENCIA`),
  CONSTRAINT `PE_DEPENDECIA_PROYECTO_FK1` FOREIGN KEY (`ID_PE_TIPO_DEPENDENCIA`) REFERENCES `pe_tipo_dependencia` (`ID_TIPO_DEPENDENCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_dependecia_proyecto: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_dependecia_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_dependecia_proyecto` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_evaluacion
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

-- Dumping data for table chaira_sigepi.pe_evaluacion: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_evaluacion` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_evaluacion_item
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

-- Dumping data for table chaira_sigepi.pe_evaluacion_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_evaluacion_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_evaluacion_item` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_facultad
DROP TABLE IF EXISTS `pe_facultad`;
CREATE TABLE IF NOT EXISTS `pe_facultad` (
  `ID_FACULTAD` double NOT NULL,
  `FAC_NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_FACULTAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_facultad: ~3 rows (approximately)
/*!40000 ALTER TABLE `pe_facultad` DISABLE KEYS */;
REPLACE INTO `pe_facultad` (`ID_FACULTAD`, `FAC_NOMBRE`) VALUES
	(1, 'Faculta de ciencia contable '),
	(2, 'Faculta de Ingenieria '),
	(3, 'Faculta de ciencias basicas ');
/*!40000 ALTER TABLE `pe_facultad` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_grupo_extension
DROP TABLE IF EXISTS `pe_grupo_extension`;
CREATE TABLE IF NOT EXISTS `pe_grupo_extension` (
  `ID_GRUPO_EXTENSION` double NOT NULL,
  `GREX_NOMBRE` varchar(500) NOT NULL,
  PRIMARY KEY (`ID_GRUPO_EXTENSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_grupo_extension: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_grupo_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_grupo_extension` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_item
DROP TABLE IF EXISTS `pe_item`;
CREATE TABLE IF NOT EXISTS `pe_item` (
  `ID_ITEM` double NOT NULL,
  `ITE_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ITEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_item` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_objetivos
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

-- Dumping data for table chaira_sigepi.pe_objetivos: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_objetivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_objetivos` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_persona
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

-- Dumping data for table chaira_sigepi.pe_persona: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_persona` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_persona_programa
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

-- Dumping data for table chaira_sigepi.pe_persona_programa: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_persona_programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_persona_programa` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_poblacion
DROP TABLE IF EXISTS `pe_poblacion`;
CREATE TABLE IF NOT EXISTS `pe_poblacion` (
  `ID_POBLACION` double NOT NULL,
  `POB_NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_POBLACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_poblacion: ~2 rows (approximately)
/*!40000 ALTER TABLE `pe_poblacion` DISABLE KEYS */;
REPLACE INTO `pe_poblacion` (`ID_POBLACION`, `POB_NOMBRE`) VALUES
	(1, 'primera infancia'),
	(2, 'Niñez');
/*!40000 ALTER TABLE `pe_poblacion` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_poblacion_ciclo
DROP TABLE IF EXISTS `pe_poblacion_ciclo`;
CREATE TABLE IF NOT EXISTS `pe_poblacion_ciclo` (
  `ID_POBLACION_CICLO` double NOT NULL,
  `POCI_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_POBLACION_CICLO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_poblacion_ciclo: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_poblacion_ciclo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_poblacion_ciclo` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_poblacion_condicion
DROP TABLE IF EXISTS `pe_poblacion_condicion`;
CREATE TABLE IF NOT EXISTS `pe_poblacion_condicion` (
  `ID_POBLACION_CONDICION` double NOT NULL,
  `POCO_NOMRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_POBLACION_CONDICION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_poblacion_condicion: ~2 rows (approximately)
/*!40000 ALTER TABLE `pe_poblacion_condicion` DISABLE KEYS */;
REPLACE INTO `pe_poblacion_condicion` (`ID_POBLACION_CONDICION`, `POCO_NOMRE`) VALUES
	(1, 'vulnerabilidad social-violecia intrafamiliar'),
	(2, 'Vulnerabilidad social-violencia sexual');
/*!40000 ALTER TABLE `pe_poblacion_condicion` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_poblacion_grupos
DROP TABLE IF EXISTS `pe_poblacion_grupos`;
CREATE TABLE IF NOT EXISTS `pe_poblacion_grupos` (
  `ID_POBLACION_GRUPOS` double NOT NULL,
  `POGR_NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_POBLACION_GRUPOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_poblacion_grupos: ~3 rows (approximately)
/*!40000 ALTER TABLE `pe_poblacion_grupos` DISABLE KEYS */;
REPLACE INTO `pe_poblacion_grupos` (`ID_POBLACION_GRUPOS`, `POGR_NOMBRE`) VALUES
	(1, 'Familia'),
	(2, 'Profesionales '),
	(3, 'Mujeres');
/*!40000 ALTER TABLE `pe_poblacion_grupos` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_programa
DROP TABLE IF EXISTS `pe_programa`;
CREATE TABLE IF NOT EXISTS `pe_programa` (
  `ID_PROGRAMA` double NOT NULL,
  `PRO_NOMBRE` varchar(50) NOT NULL,
  `ID_PE_FACULTAD` double NOT NULL,
  PRIMARY KEY (`ID_PROGRAMA`),
  KEY `PE_PROGRAMA_FK1` (`ID_PE_FACULTAD`),
  CONSTRAINT `PE_PROGRAMA_FK1` FOREIGN KEY (`ID_PE_FACULTAD`) REFERENCES `pe_facultad` (`ID_FACULTAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_programa: ~3 rows (approximately)
/*!40000 ALTER TABLE `pe_programa` DISABLE KEYS */;
REPLACE INTO `pe_programa` (`ID_PROGRAMA`, `PRO_NOMBRE`, `ID_PE_FACULTAD`) VALUES
	(1, 'Ingenieria de Sistemas ', 2),
	(2, 'Ingenieria Agropecuaria', 2),
	(3, 'Quimica', 3);
/*!40000 ALTER TABLE `pe_programa` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_proyecto
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

-- Dumping data for table chaira_sigepi.pe_proyecto: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_proyecto_artr
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

-- Dumping data for table chaira_sigepi.pe_proyecto_artr: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_proyecto_artr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_artr` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_proyecto_persona
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

-- Dumping data for table chaira_sigepi.pe_proyecto_persona: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_proyecto_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_persona` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_proyecto_poci
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

-- Dumping data for table chaira_sigepi.pe_proyecto_poci: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_proyecto_poci` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_poci` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_proyecto_poco
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

-- Dumping data for table chaira_sigepi.pe_proyecto_poco: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_proyecto_poco` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_poco` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_proyecto_pogr
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

-- Dumping data for table chaira_sigepi.pe_proyecto_pogr: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_proyecto_pogr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_proyecto_pogr` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_rol
DROP TABLE IF EXISTS `pe_rol`;
CREATE TABLE IF NOT EXISTS `pe_rol` (
  `ID_ROL` double NOT NULL,
  `ROL_NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_rol: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_rol` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_tipo_dependencia
DROP TABLE IF EXISTS `pe_tipo_dependencia`;
CREATE TABLE IF NOT EXISTS `pe_tipo_dependencia` (
  `ID_TIPO_DEPENDENCIA` double NOT NULL,
  `TIDE_NOMBRE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_DEPENDENCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_tipo_dependencia: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_tipo_dependencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_tipo_dependencia` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_tipo_documento
DROP TABLE IF EXISTS `pe_tipo_documento`;
CREATE TABLE IF NOT EXISTS `pe_tipo_documento` (
  `ID_TIPO_DOCUMENTO` double NOT NULL,
  `TIDO_NOMBRE` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_TIPO_DOCUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_tipo_documento: ~2 rows (approximately)
/*!40000 ALTER TABLE `pe_tipo_documento` DISABLE KEYS */;
REPLACE INTO `pe_tipo_documento` (`ID_TIPO_DOCUMENTO`, `TIDO_NOMBRE`) VALUES
	(1, 'Identidad '),
	(2, 'Cedula ciudadana');
/*!40000 ALTER TABLE `pe_tipo_documento` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_tipo_vinculacion
DROP TABLE IF EXISTS `pe_tipo_vinculacion`;
CREATE TABLE IF NOT EXISTS `pe_tipo_vinculacion` (
  `ID_TIPO_VINCULACION` double NOT NULL,
  `TIVI_NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TIPO_VINCULACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table chaira_sigepi.pe_tipo_vinculacion: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_tipo_vinculacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_tipo_vinculacion` ENABLE KEYS */;

-- Dumping structure for table chaira_sigepi.pe_usuario
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

-- Dumping data for table chaira_sigepi.pe_usuario: ~0 rows (approximately)
/*!40000 ALTER TABLE `pe_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `pe_usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
