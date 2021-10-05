-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2021 a las 16:18:09
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
  `id` int(11) NOT NULL,
  `correo` varchar(123) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(200) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `correo`, `usuario`, `clave`) VALUES
(7, 'pedro@.gamil.com', 'pedro', '4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a'),
(6, 'cristian@gmail.com', 'cristian', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2'),
(8, 'victoro8933@gmail.com', 'vsierra08', '647715c4668c69f531548b4c5630bd0eff793017c34a42ab92b2dfcea8ebd433eb9b0c0316fb172e8568b63332b83f896b977f7c709ef89cc568d43fbf9d82e5');

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
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `registro_equipo`
--
ALTER TABLE `registro_equipo`
  ADD PRIMARY KEY (`Id_Registro`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `Id_equipo` (`Id_equipo`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `registro_equipo`
--
ALTER TABLE `registro_equipo`
  MODIFY `Id_Registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

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
