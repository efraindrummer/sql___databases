-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2019 a las 06:14:10
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoxx`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcula_carreras_por_equipo` (IN `IDEQUIPO` INT)  NO SQL
SELECT CARRERA, COUNT(MATRICULA) AS TOTAL 
FROM `alumno` natural join `equipo` 
WHERE ideq=IDEQUIPO
GROUP by CARRERA$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `MATRICULA` char(6) NOT NULL,
  `MATRICULA_JEFE` char(6) DEFAULT NULL,
  `NOMBREA` varchar(25) DEFAULT NULL,
  `APELLIDOA` varchar(25) DEFAULT NULL,
  `CARRERA` varchar(4) DEFAULT NULL,
  `TELA` char(10) DEFAULT NULL,
  `EMAILA` varchar(40) DEFAULT NULL,
  `IDEQ` int(11) DEFAULT NULL,
  `IDE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`MATRICULA`, `MATRICULA_JEFE`, `NOMBREA`, `APELLIDOA`, `CARRERA`, `TELA`, `EMAILA`, `IDEQ`, `IDE`) VALUES
('134254', '154157', 'RONALDO', 'RIVERA', 'ICO', '9381001313', 'ronaldo@gmail.com', 1, 1),
('140303', '154157', 'CRISTINA', 'ZAVALA', 'ISC', '9385005050', 'cristina@gmail.com', 1, 1),
('141562', '154157', 'CRISTIAN ALONSO', 'RAMAYO', 'ISC', '9381231414', 'ramayo@gmail.com', 1, 1),
('152119', '154157', 'LUCAS FRANCISCO', 'HIDALGO LOPEZ', 'ISC', '9384004040', 'lucas@gmail.com', 1, 1),
('152236', '154157', 'JOSE RUBEN', 'ARIASGONZALEZ', 'ISC', '9381235656', 'joseruben@gmail.com', 1, 1),
('152315', '154157', 'SERGIO', 'URIBE', 'ICO', '9381208989', 'sergiouribe@gmail.com', 1, 1),
('152790', '154157', 'HANNIA', 'ESCOBEDO', 'ISC', '9381242526', 'hannia@gmail.com', 1, 1),
('153686', '154157', 'IRVIN ALBERTO', 'CONTRERAS HUCHIN', 'ISC', '9381102020', 'contrerasairvin@gmail.com', 1, 1),
('154157', '154157', 'XIMENA', 'RODRIGUEZ TUNALES', 'ISC', '9381301515', 'ximena@gmail.com', 1, 1),
('170869', '154157', 'EFRAIN', 'MAY MAYO', 'ICO', '9381992020', 'EFRAINMAYO@GMAIL.COM', 1, 1),
('171032', '154157', 'CARLOS JOAQUIN', 'HERNANDEZ SANCHEZ', 'ISC', '9381102525', 'carlosjoaquin@gmail.com', 1, 1),
('181252', '154157', 'MARIA FERNANDA', 'GARCIA SANGUINO', 'ISC', '9388008080', 'maria@gmail.com', 1, 1),
('181274', '154157', 'MINETTE', 'MANZUR', 'ISC', '9811002121', 'manzur@gmail.com', 1, 1),
('181395', '154157', 'JAIME NOE', 'ALVAREZ FIGUEROA', 'ISC', '9382001010', 'jaime@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `alumno_por_carrera`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `alumno_por_carrera` (
`CARRERA` varchar(4)
,`TOTAL` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `IDEQ` int(11) NOT NULL,
  `NOMBREEQ` varchar(45) DEFAULT NULL,
  `IDESTADO` int(11) DEFAULT NULL,
  `IDR` int(11) DEFAULT NULL,
  `IDEVENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`IDEQ`, `NOMBREEQ`, `IDESTADO`, `IDR`, `IDEVENTO`) VALUES
(1, 'BOMBA YUCATECA', 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ide` int(11) NOT NULL,
  `nombree` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ide`, `nombree`) VALUES
(2, 'YUCATAN'),
(3, 'TABASCO'),
(4, 'QUINTANA ROO'),
(5, 'VERACRUZ'),
(6, 'SINALOA'),
(7, 'NAYARIT'),
(8, 'TLAXCALA'),
(9, 'SONORA'),
(10, 'DURANGO'),
(11, 'OAXACA'),
(12, 'AGUASCALIENTES'),
(13, 'TAMAULIPAS'),
(14, 'CHIAPAS'),
(15, 'SAN LUIS POTOSI'),
(16, 'ZACATECAS'),
(17, 'JALISCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `IDE` int(11) NOT NULL,
  `DESCRIPCION` varchar(60) DEFAULT NULL,
  `NOMBREE` varchar(45) DEFAULT NULL,
  `FECHA_EVENTO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`IDE`, `DESCRIPCION`, `NOMBREE`, `FECHA_EVENTO`) VALUES
(1, 'MUESTRA GASTRONOMICA CON MOTIVO DEL 15 DE SEP', 'FIESTA MEXICANA 2019', '2019-09-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez`
--

CREATE TABLE `juez` (
  `IDJ` int(11) NOT NULL,
  `APELLIDOJ` varchar(25) DEFAULT NULL,
  `TELJ` char(10) DEFAULT NULL,
  `NOMBREJ` varchar(20) DEFAULT NULL,
  `IDE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez_equipo`
--

CREATE TABLE `juez_equipo` (
  `IDEQ` int(11) NOT NULL,
  `AMBIENTACION` int(11) DEFAULT NULL,
  `PREPARACION_PLAT` int(11) DEFAULT NULL,
  `CULTURA` int(11) DEFAULT NULL,
  `HIGIENE` int(11) DEFAULT NULL,
  `PRESENTACION` int(11) DEFAULT NULL,
  `IDJ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `IDR` int(11) NOT NULL,
  `NOMBRER` varchar(20) DEFAULT NULL,
  `APELLIDOR` varchar(20) DEFAULT NULL,
  `TELR` char(10) DEFAULT NULL,
  `IDE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`IDR`, `NOMBRER`, `APELLIDOR`, `TELR`, `IDE`) VALUES
(1, 'JUAN CARLOS', 'CANTO', '9381005708', 1),
(2, 'JOSE FELIPE', 'COCON', '9381951921', 1),
(3, 'JOSE GABRIEL', 'REDING DOMINGUEZ', '9381204455', 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `alumno_por_carrera`
--
DROP TABLE IF EXISTS `alumno_por_carrera`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `alumno_por_carrera`  AS  select `alumno`.`CARRERA` AS `CARRERA`,count(`alumno`.`MATRICULA`) AS `TOTAL` from `alumno` group by `alumno`.`CARRERA` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`MATRICULA`),
  ADD KEY `IDE` (`IDE`),
  ADD KEY `IDEQ` (`IDEQ`),
  ADD KEY `MATRICULA_JEFE` (`MATRICULA_JEFE`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`IDEQ`),
  ADD KEY `IDE` (`IDESTADO`),
  ADD KEY `IDR` (`IDR`),
  ADD KEY `IDEVENTO` (`IDEVENTO`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ide`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`IDE`);

--
-- Indices de la tabla `juez`
--
ALTER TABLE `juez`
  ADD PRIMARY KEY (`IDJ`),
  ADD KEY `IDE` (`IDE`);

--
-- Indices de la tabla `juez_equipo`
--
ALTER TABLE `juez_equipo`
  ADD PRIMARY KEY (`IDEQ`,`IDJ`),
  ADD KEY `IDJ` (`IDJ`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`IDR`),
  ADD KEY `IDE` (`IDE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `IDEQ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `ide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `IDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `juez`
--
ALTER TABLE `juez`
  MODIFY `IDJ` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `juez_equipo`
--
ALTER TABLE `juez_equipo`
  MODIFY `IDEQ` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `IDR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`IDE`) REFERENCES `evento` (`IDE`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`IDEQ`) REFERENCES `equipo` (`IDEQ`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `alumno_ibfk_3` FOREIGN KEY (`MATRICULA_JEFE`) REFERENCES `alumno` (`MATRICULA`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `alumno_ibfk_4` FOREIGN KEY (`MATRICULA_JEFE`) REFERENCES `alumno` (`MATRICULA`) ON DELETE SET NULL;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`IDESTADO`) REFERENCES `estado` (`ide`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`IDR`) REFERENCES `responsable` (`IDR`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `equipo_ibfk_3` FOREIGN KEY (`IDEVENTO`) REFERENCES `evento` (`IDE`);

--
-- Filtros para la tabla `juez`
--
ALTER TABLE `juez`
  ADD CONSTRAINT `juez_ibfk_1` FOREIGN KEY (`IDE`) REFERENCES `evento` (`IDE`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `juez_equipo`
--
ALTER TABLE `juez_equipo`
  ADD CONSTRAINT `juez_equipo_ibfk_1` FOREIGN KEY (`IDJ`) REFERENCES `juez` (`IDJ`),
  ADD CONSTRAINT `juez_equipo_ibfk_2` FOREIGN KEY (`IDEQ`) REFERENCES `equipo` (`IDEQ`);

--
-- Filtros para la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `responsable_ibfk_1` FOREIGN KEY (`IDE`) REFERENCES `evento` (`IDE`) ON DELETE SET NULL ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
