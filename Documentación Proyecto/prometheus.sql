-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2021 a las 15:20:33
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prometheus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_computo`
--

CREATE TABLE `equipo_computo` (
  `Id_Equipo_Computo` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Nombre_Equipo` varchar(50) NOT NULL,
  `Serial` varchar(45) NOT NULL,
  `Marca` varchar(60) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `Fecha_Salida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Id_Login` int(11) NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `User` int(11) NOT NULL,
  `Pass` int(11) NOT NULL,
  `Estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_equipo`
--

CREATE TABLE `registro_equipo` (
  `Id_Registro` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_equipo` int(11) NOT NULL,
  `fecha_entrada` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='registro de entrada de equpos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(50) NOT NULL,
  `Descripcion` varchar(245) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_Rol`, `Nombre_Rol`, `Descripcion`) VALUES
(1, 'administrador', 'Crea Modifica y consulta ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Numero_Documento` varchar(60) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellidos` varchar(60) NOT NULL,
  `Direccion` varchar(245) NOT NULL,
  `Estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo_computo`
--
ALTER TABLE `equipo_computo`
  ADD PRIMARY KEY (`Id_Equipo_Computo`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Usuario_2` (`Id_Usuario`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Id_Login`),
  ADD KEY `Id_Rol` (`Id_Rol`);

--
-- Indices de la tabla `registro_equipo`
--
ALTER TABLE `registro_equipo`
  ADD PRIMARY KEY (`Id_Registro`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `Id_equipo` (`Id_equipo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo_computo`
--
ALTER TABLE `equipo_computo`
  MODIFY `Id_Equipo_Computo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `Id_Login` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_equipo`
--
ALTER TABLE `registro_equipo`
  MODIFY `Id_Registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`);

--
-- Filtros para la tabla `registro_equipo`
--
ALTER TABLE `registro_equipo`
  ADD CONSTRAINT `registro_equipo_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`Id_Usuario`),
  ADD CONSTRAINT `registro_equipo_ibfk_2` FOREIGN KEY (`Id_equipo`) REFERENCES `equipo_computo` (`Id_Equipo_Computo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
