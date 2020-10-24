-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-07-2020 a las 08:47:48
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acceso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `matricula_alum` int(6) NOT NULL,
  `nombre_alum` varchar(45) NOT NULL,
  `apellido_alum` varchar(45) NOT NULL,
  `tipo_alum` varchar(30) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `uid_alumno` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`matricula_alum`, `nombre_alum`, `apellido_alum`, `tipo_alum`, `id_carrera`, `uid_alumno`) VALUES
(100191, 'SDASD', 'ASADA', 'REGULAR', 4, ''),
(112235, 'ELADIO GIOVANY', 'ALFONSO', 'REGULAR', 4, ''),
(120098, 'CRISTIAN', 'ASE GH', 'UNIVERSITARIO', 3, ''),
(123456, 'SERGIO', 'ZALDIVAR YERBEZ', 'UNIVERSITARIO', 1, '04badcba'),
(129065, 'CHRISTIAN RENE', 'TREJO DE LA CRUZ', 'EXCELENCIA', 1, '05f25628'),
(170869, 'EFRAIN', 'MAY MAYO', 'EXCELENCIA', 2, '0442dbba'),
(190785, 'LUIS', 'BENTANCOURT', 'REGULAR', 1, ''),
(222336, 'SAMUEL', 'MIRANDA ', 'UNIVERSITARIO', 2, '\r'),
(234567, 'EDUARDO', 'GONZALES PEREZ', 'REGULAR', 3, '\r'),
(345000, 'FELIPE', 'MANZA ORION', 'UNIVERSITARIO', 0, ''),
(468789, 'ALEJANDRO', 'FLORES', 'UNIVERSITARIO', 2, '\r');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(2) NOT NULL,
  `nom_cargo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nom_cargo`) VALUES
(1, 'CONSERJE'),
(2, 'DOCENTE'),
(3, 'MAESTRO INVESTIGADOR'),
(4, 'CUIDADORES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(2) NOT NULL,
  `nom_carrera` varchar(45) NOT NULL,
  `facu_carrera` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `nom_carrera`, `facu_carrera`) VALUES
(1, 'INGIENERIA EN SISTEMAS', 'CIENCIAS DE LA INFORMACION'),
(2, 'INGIENERIA EN COMPUTACION', 'CIENCIAS DE LA INFORMACION'),
(3, 'INGIENERIA EN DISEÑO MULTIMEDIA', 'CIENCIAS DE LA INFORMACION'),
(4, 'INGIENERIA EN TELECOMUNICACIONES', 'CIENCIAS DE LA INFORMACION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inout_alumnos`
--

CREATE TABLE `inout_alumnos` (
  `id_IOA` int(11) NOT NULL,
  `in_alum` datetime NOT NULL DEFAULT current_timestamp(),
  `out_alum` datetime DEFAULT NULL,
  `matricula_alum` int(6) NOT NULL,
  `id_salon` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inout_alumnos`
--

INSERT INTO `inout_alumnos` (`id_IOA`, `in_alum`, `out_alum`, `matricula_alum`, `id_salon`) VALUES
(5, '2020-06-26 18:50:25', '2020-06-29 18:50:25', 120098, 216),
(6, '2020-06-29 18:50:25', '2020-06-30 18:50:25', 123456, 219),
(7, '2020-06-05 18:52:07', '2020-06-06 18:52:07', 123456, 216),
(8, '2020-06-29 18:52:07', '2020-06-30 18:52:07', 123456, 218),
(9, '2020-06-21 18:54:39', '2020-06-22 18:54:39', 170869, 217),
(10, '2020-06-30 18:54:39', '2020-06-30 20:54:39', 345000, 217),
(14, '2020-06-25 20:27:11', '0000-00-00 00:00:00', 123456, 210),
(15, '2020-06-25 20:31:42', '2020-06-25 20:32:44', 170869, 210),
(16, '2020-06-25 20:32:14', '2020-06-25 20:32:32', 123456, 210),
(17, '2020-06-25 20:42:49', '2020-06-25 20:43:00', 170869, 210),
(18, '2020-06-25 20:43:30', '2020-06-25 20:43:39', 123456, 301),
(19, '2020-06-25 20:51:05', '2020-06-25 20:51:47', 129065, 301),
(20, '2020-06-25 20:51:17', '2020-06-25 20:57:07', 170869, 301),
(21, '2020-06-25 20:56:40', '2020-06-25 20:56:48', 123456, 210),
(22, '2020-06-25 20:57:35', '2020-06-25 20:57:56', 170869, 210);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inout_personal`
--

CREATE TABLE `inout_personal` (
  `in_pers` datetime NOT NULL DEFAULT current_timestamp(),
  `out_pers` datetime DEFAULT NULL,
  `matricula_pers` int(4) NOT NULL,
  `id_salon` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inout_personal`
--

INSERT INTO `inout_personal` (`in_pers`, `out_pers`, `matricula_pers`, `id_salon`) VALUES
('2020-06-13 00:52:01', '2020-06-24 00:52:01', 4455, 301),
('2020-06-03 00:52:01', '2020-06-05 00:52:01', 98, 217),
('2020-06-01 01:01:26', '2020-06-03 01:01:26', 9001, 301),
('2020-06-22 01:01:26', '2020-06-24 01:01:26', 9064, 301);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `matricula_pers` int(4) NOT NULL,
  `nombre_pers` varchar(45) NOT NULL,
  `apellido_pers` varchar(45) NOT NULL,
  `id_cargo` int(2) NOT NULL,
  `uid_personal` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`matricula_pers`, `nombre_pers`, `apellido_pers`, `id_cargo`, `uid_personal`) VALUES
(98, 'FERNANDO ENRIQUE', 'SANCHEZ MARTINEZ', 2, ''),
(4455, 'ABRIL ', 'SANCHEZ AYALA', 2, ''),
(9001, 'JESUS ANTONIO', 'SANCHEZ', 1, ''),
(9043, 'ANTONIO', 'SANCHEZ', 1, ''),
(9064, 'YUDITH', 'SANCHEZ HERRERA', 2, ''),
(156980, 'REDING', 'DOMINGUEZ', 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `id_salon` int(3) NOT NULL,
  `desc_salon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`id_salon`, `desc_salon`) VALUES
(101, 'CENTRO DE COMPUTO'),
(210, 'REDES'),
(216, 'LABORATORIO DE BASE DE DATOS'),
(217, 'LABORATORIO DE PROGRAMACION'),
(218, 'LABORATORIO DE BASE DE DATOS'),
(219, 'LABORATORIO DE BASE DE DATOS'),
(301, 'BASES DE DATOS'),
(319, 'LABORATORIO DE ROBOTICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `NombreC` varchar(70) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `NombreC`, `Correo`, `usuario`, `password`) VALUES
(11, 'EFRAIN MAY MAYO', 'EFRAIN@HOTMAIL.COM', 'EFRAIN', '8cb2237d0679ca88db6464eac60da96345513964'),
(12, 'samuel', 'samuel@hotmail.com', 'samu', '8cb2237d0679ca88db6464eac60da96345513964');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`matricula_alum`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `inout_alumnos`
--
ALTER TABLE `inout_alumnos`
  ADD PRIMARY KEY (`id_IOA`),
  ADD KEY `id_salon` (`id_salon`),
  ADD KEY `matricula_alum` (`matricula_alum`);

--
-- Indices de la tabla `inout_personal`
--
ALTER TABLE `inout_personal`
  ADD KEY `id_salon` (`id_salon`),
  ADD KEY `matricula_pers` (`matricula_pers`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`matricula_pers`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id_salon`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id_carrera` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inout_alumnos`
--
ALTER TABLE `inout_alumnos`
  MODIFY `id_IOA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `inout_alumnos`
--
ALTER TABLE `inout_alumnos`
  ADD CONSTRAINT `inout_alumnos_ibfk_1` FOREIGN KEY (`id_salon`) REFERENCES `salones` (`id_salon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inout_alumnos_ibfk_2` FOREIGN KEY (`matricula_alum`) REFERENCES `alumnos` (`matricula_alum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inout_personal`
--
ALTER TABLE `inout_personal`
  ADD CONSTRAINT `inout_personal_ibfk_1` FOREIGN KEY (`matricula_pers`) REFERENCES `personal` (`matricula_pers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inout_personal_ibfk_2` FOREIGN KEY (`id_salon`) REFERENCES `salones` (`id_salon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
