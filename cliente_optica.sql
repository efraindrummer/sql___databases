-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2018 a las 01:21:50
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cliente_optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `numCL` int(2) NOT NULL,
  `nombreCL` varchar(45) NOT NULL,
  `apellidoCL` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `pedido` int(2) NOT NULL,
  `color1` varchar(45) NOT NULL,
  `color2` varchar(45) NOT NULL,
  `color3` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lentes`
--

CREATE TABLE `lentes` (
  `cveArmazon` int(3) NOT NULL,
  `tipoArmazon` varchar(45) NOT NULL,
  `graduacionIzq` decimal(4,2) NOT NULL,
  `graduacionDer` decimal(4,2) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lentes_clientes`
--

CREATE TABLE `lentes_clientes` (
  `numCL` int(2) NOT NULL,
  `cveArmazon` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `numCL` int(2) NOT NULL,
  `pedido` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `cveT` int(2) NOT NULL,
  `nombreT` varchar(45) NOT NULL,
  `sucursalT` varchar(45) NOT NULL,
  `direccionT` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas_cliente`
--

CREATE TABLE `tiendas_cliente` (
  `numCL` int(2) NOT NULL,
  `cveT` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `pedido` int(2) NOT NULL,
  `tipo1` varchar(45) NOT NULL,
  `tipo2` varchar(45) NOT NULL,
  `tipo3` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`numCL`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD KEY `pedido` (`pedido`);

--
-- Indices de la tabla `lentes`
--
ALTER TABLE `lentes`
  ADD PRIMARY KEY (`cveArmazon`);

--
-- Indices de la tabla `lentes_clientes`
--
ALTER TABLE `lentes_clientes`
  ADD KEY `numCL` (`numCL`),
  ADD KEY `cveArmazon` (`cveArmazon`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido`),
  ADD KEY `numCL` (`numCL`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`cveT`);

--
-- Indices de la tabla `tiendas_cliente`
--
ALTER TABLE `tiendas_cliente`
  ADD KEY `numCL` (`numCL`),
  ADD KEY `cveT` (`cveT`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD KEY `pedido` (`pedido`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `colores`
--
ALTER TABLE `colores`
  ADD CONSTRAINT `colores_ibfk_1` FOREIGN KEY (`pedido`) REFERENCES `pedidos` (`pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lentes_clientes`
--
ALTER TABLE `lentes_clientes`
  ADD CONSTRAINT `lentes_clientes_ibfk_1` FOREIGN KEY (`numCL`) REFERENCES `clientes` (`numCL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lentes_clientes_ibfk_2` FOREIGN KEY (`cveArmazon`) REFERENCES `lentes` (`cveArmazon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`numCL`) REFERENCES `clientes` (`numCL`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tiendas_cliente`
--
ALTER TABLE `tiendas_cliente`
  ADD CONSTRAINT `tiendas_cliente_ibfk_1` FOREIGN KEY (`numCL`) REFERENCES `clientes` (`numCL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tiendas_cliente_ibfk_2` FOREIGN KEY (`cveT`) REFERENCES `tiendas` (`cveT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD CONSTRAINT `tipos_ibfk_1` FOREIGN KEY (`pedido`) REFERENCES `pedidos` (`pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
