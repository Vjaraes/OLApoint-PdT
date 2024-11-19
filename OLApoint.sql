
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-04:00";


--
-- Estructura tabla `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aemail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping de datos para  `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@OLApoint.com', '123');

-- --------------------------------------------------------

--
-- Estructura tabla `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appoid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`appoid`),
  KEY `pid` (`pid`),
  KEY `scheduleid` (`scheduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping de datos para `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(1, 1, 1, 1, '13-10-2024');

-- --------------------------------------------------------

--
-- Estructura tabla `specialist`
--

DROP TABLE IF EXISTS `specialist`;
CREATE TABLE IF NOT EXISTS `specialist` (
  `speid` int(11) NOT NULL AUTO_INCREMENT,
  `spemail` varchar(255) DEFAULT NULL,
  `spename` varchar(255) DEFAULT NULL,
  `spepassword` varchar(255) DEFAULT NULL,
  `sperut` varchar(15) DEFAULT NULL,
  `spetel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL,
  PRIMARY KEY (`speid`),
  KEY `specialties` (`specialties`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`speid`, `spemail`, `spname`, `sppassword`, `sprut`, `sptel`, `specialties`) VALUES
(1, 'especialista@OLAPoint.com', 'Especialista Prueba', '123', '000000000', '0110000000', 1);

-- --------------------------------------------------------

--
-- Estructura tabla `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `prut` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping de datos para `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `prut`, `pdob`, `ptel`) VALUES
(1, 'paciente@OLApoint.com', 'Paciente Prueba', '123', 'Chile', '0000000000', '01-01-2000', '0120000000'),
(2, 'vjaraes@gmail.com', 'Veronica Jara Esbry', '123', 'Chile', '0111000000', '17-08-1993', '0700000000');

-- --------------------------------------------------------

--
-- Estructura tabla `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `speid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `speid` (`speid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping de datos para `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `speid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(1, '1', 'Test Session', '20-09-2019', '18:00:00', 50),
(2, '1', '1', '13-10-2024', '20:36:00', 1),
(3, '1', '12', '13-10-2024', '20:33:00', 1),
(4, '1', '1', '13-10-2024', '12:32:00', 1),
(5, '1', '1', '13-10-2024', '20:35:00', 1),
(6, '1', '12', '13-10-2024', '20:35:00', 1),
(7, '1', '1', '13-10-2024', '20:36:00', 1),
(8, '1', '12', '13-10-2024', '13:33:00', 1);

-- --------------------------------------------------------

--
-- Estructura tabla `specialties`
--

DROP TABLE IF EXISTS `specialties`;
CREATE TABLE IF NOT EXISTS `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping de datos para `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Fonoaudiologia'),
(2, 'Kinesiologia'),
(3, 'Medicina General'),
(4, 'Nutricionista'),
(5, 'Psicologia'),
(6, 'Psicopedagogia'),
(7, 'Terapia Alternativa'),
(8, 'Terapia Ocupacional');

-- --------------------------------------------------------

--
-- Estructura tabla `webuser`
--

DROP TABLE IF EXISTS `webuser`;
CREATE TABLE IF NOT EXISTS `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping de datos para `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@OLApoint.com', 'a'),
('especialista@OLAPoint.com', 'd'),
('paciente@OLApoint.com', 'p'),
('vjaraes@gmail.com', 'p');
COMMIT;

