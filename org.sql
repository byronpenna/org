-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2014 a las 01:54:16
-- Versión del servidor: 5.5.34
-- Versión de PHP: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `org`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodorenovacion_ptc`
--

CREATE TABLE IF NOT EXISTS `periodorenovacion_ptc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPeriodo_fk` int(11) NOT NULL,
  `idPtc_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periodoRenovacionPtc_periodoRenovacion` (`idPeriodo_fk`),
  KEY `periodoRenovacionPtc_ptc` (`idPtc_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_renovacion`
--

CREATE TABLE IF NOT EXISTS `periodo_renovacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` int(11) NOT NULL COMMENT 'los dias del periodo',
  `costo` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ptc`
--

CREATE TABLE IF NOT EXISTS `ptc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) COLLATE utf32_spanish_ci NOT NULL,
  `pagoPorReferidoDirecto` decimal(5,3) NOT NULL,
  `pagoPorReferidoRentado` decimal(5,3) NOT NULL,
  `ganancias` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reciclaje`
--

CREATE TABLE IF NOT EXISTS `reciclaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idReferido_fk` int(11) NOT NULL,
  `referido` varchar(50) COLLATE utf32_spanish_ci NOT NULL COMMENT 'para saber que referido se reciclo',
  PRIMARY KEY (`id`),
  KEY `reciclaje_referido` (`idReferido_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referidos`
--

CREATE TABLE IF NOT EXISTS `referidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referido` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `ganancias` decimal(10,3) NOT NULL,
  `usuarioPtc_fk` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL COMMENT 'para saber si esta activo o inactivo',
  PRIMARY KEY (`id`),
  KEY `referidos_usuarioPtc` (`usuarioPtc_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renovaciones`
--

CREATE TABLE IF NOT EXISTS `renovaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clicRenovacion` int(11) NOT NULL,
  `clicActual` int(11) NOT NULL,
  `idPeriodo_fk` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idReferido_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `renovaciones_periodoRenovacionPtc` (`idPeriodo_fk`),
  KEY `renovaciones_referidos` (`idReferido_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(25) COLLATE utf32_spanish_ci NOT NULL,
  `pass` varchar(200) COLLATE utf32_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_ptc`
--

CREATE TABLE IF NOT EXISTS `usuario_ptc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_fk` varchar(25) COLLATE utf32_spanish_ci NOT NULL,
  `ptc_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioPtc_usuario` (`usuario_fk`),
  KEY `usuarioPtc_ptc` (`ptc_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `periodorenovacion_ptc`
--
ALTER TABLE `periodorenovacion_ptc`
  ADD CONSTRAINT `periodoRenovacionPtc_ptc` FOREIGN KEY (`idPtc_fk`) REFERENCES `ptc` (`id`),
  ADD CONSTRAINT `periodoRenovacionPtc_periodoRenovacion` FOREIGN KEY (`idPeriodo_fk`) REFERENCES `periodo_renovacion` (`id`);

--
-- Filtros para la tabla `reciclaje`
--
ALTER TABLE `reciclaje`
  ADD CONSTRAINT `reciclaje_referido` FOREIGN KEY (`idReferido_fk`) REFERENCES `referidos` (`id`);

--
-- Filtros para la tabla `referidos`
--
ALTER TABLE `referidos`
  ADD CONSTRAINT `referidos_usuarioPtc` FOREIGN KEY (`usuarioPtc_fk`) REFERENCES `usuario_ptc` (`id`);

--
-- Filtros para la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
  ADD CONSTRAINT `renovaciones_referidos` FOREIGN KEY (`idReferido_fk`) REFERENCES `referidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `renovaciones_periodoRenovacionPtc` FOREIGN KEY (`idPeriodo_fk`) REFERENCES `periodorenovacion_ptc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_ptc`
--
ALTER TABLE `usuario_ptc`
  ADD CONSTRAINT `usuarioPtc_ptc` FOREIGN KEY (`ptc_fk`) REFERENCES `ptc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarioPtc_usuario` FOREIGN KEY (`usuario_fk`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
