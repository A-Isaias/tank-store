-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2024 a las 02:24:48
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tank-store`
--
-- NOTA FALTA EL SCRIPT PARA CREAR LA BASE DE DATOS tank-store CREARLA MANUALMENTE
-- Y LUEGO IMPORTAR EL SCRIPT DESDE PHPMYADMIN
-- PARA ESTE PROYECTO SE USAN SOLO LAS TABLAS COMICS Y USERS LO DEMAS QUEDO DEL PROYECTO DE COMICS
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colecciones`
--

CREATE TABLE `colecciones` (
  `id` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `colecciones`
--

INSERT INTO `colecciones` (`id`, `nombre`) VALUES
(2, 'Anderson'),
(6, 'Argentina'),
(10, 'Ariel en Moto'),
(11, 'choto'),
(3, 'ISAIAS'),
(7, 'Justice League of America'),
(9, 'Majes'),
(12, 'minotauro'),
(4, 'Pelado'),
(8, 'Super Javillo'),
(1, 'Superman'),
(13, 'TANQUES'),
(5, 'The Amazing Spiderman');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comics`
--

CREATE TABLE `comics` (
  `id` int NOT NULL,
  `portada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `editorial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `coleccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `novedad` enum('si','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'si',
  `costo` decimal(10,2) NOT NULL,
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `coleccion_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `comics`
--

INSERT INTO `comics` (`id`, `portada`, `nombre`, `numero`, `editorial`, `coleccion`, `fecha_ingreso`, `novedad`, `costo`, `observaciones`, `coleccion_id`) VALUES
(4, '015.png', 'FIAT PALIO / SIENA / FIRE CON ALETAS', '15', 'FIAT', 'TANQUE', '2024-05-01', 'si', 35000.00, 'CON ALETAS', 1),
(5, '017.png', 'FIAT PALIO /SIENA /FIRE', '17', 'FIAT', 'TANQUES', '2024-01-05', 'si', 35000.00, 'LISO', 2),
(6, '204B.PNG', 'CHEVROLET ASTRA/ZAFIRA MODELO VIEJO CON ALETAS', '204B', 'CHEVROLET', 'TANQUES', '2024-06-01', 'si', 42000.00, 'CON ALETAS', 2),
(7, '210.png', 'CHEVROLET CORSA NAFTA 2002-2011 LADO BOCA', '210', 'CHEVROLET', 'TANQUES', '2024-06-01', 'si', 0.00, 'TAMAÑO RADIADOR ORIGINAL', 2),
(8, '211.PNG\r\n', 'CHEVROLET CORSA OTRO LADO', '211', 'CHEVROLET', 'TANQUES', '2024-01-06', 'si', 37000.00, 'TAMAÑO RADIADOR ORIGINAL', 3),
(9, '212.PNG', 'SUZUKI FUN C/AA ', '212', 'SUZUKI', 'TANQUES', '2024-01-07', 'si', 24000.00, '', 4),
(10, '376.PNG', 'CHEVROLET CORSA 2', '376', 'CHEVROLET', 'TANQUES', '2024-07-01', 'si', 36000.00, '', 7),
(11, '218.PNG', 'CHEVROLET MERIVA', '218', 'CHEVROLET', 'TANQUE', '2024-01-07', 'si', 46000.00, '', 5),
(12, '219.PNG', 'CHEVROLET MERIVA', '219', 'CHEVROLET', 'TANQUES', '2024-01-07', 'si', 46000.00, '', 6),
(13, '249.PNG', 'CHEVROLET AGILE', '249', 'CHEVROLET', 'TANQUES', '2024-01-07', 'si', 36000.00, '', 8),
(14, '251.PNG', 'CHEVROLET ZAFIRA/ASTRA S 2010-', '251', 'CHEVROLET', 'TANQUES', '2024-01-07', 'si', 42000.00, 'CON ALETAS PARA RADIADOR ORIGINAL', 9),
(24, '259.PNG', 'CHEVROLET VECTRA CON BULBO', '259', 'CHEVROLET', 'TANQUES', '2024-01-10', 'si', 35000.00, '', 10),
(25, '301.PNG', 'VW GOL DIESEL IMPORTADO (LISO)', '301', 'VW', 'TANQUES', '2024-01-10', 'si', 32000.00, 'LISO', 11),
(26, '302.PNG', 'VW GOL DIESEL NACIONAL (CON ALETAS)', '302', 'VW', 'TANQUES', '2024-11-01', 'si', 32000.00, 'CON ALETAS', 12),
(27, '309.PNG', 'VW GOL NAFTA', '309', 'VW', 'TANQUES', '2024-01-20', 'si', 32000.00, '', 2),
(29, '311.PNG', 'VW GOLF/BORA (CON ACOPLE RAPIDO)', '311', 'VW', 'TANQUES', '2024-01-27', 'si', 45000.00, '', 1),
(30, '324.PNG', 'VW GOL TREND/ SURAN (LADO BOCAS/ABRAZADERA)', '324', 'VW', 'TANQUES', '2024-01-27', 'si', 40000.00, 'LADO MANGUERAS PARA MODELO CON ABRAZADERAS', 2),
(31, '336.PNG', 'PEUGEOT PARTNER/CITROEN XSARA/BERLINGO (INFERIOR)', '330', 'PEUGEOT/CITROEN (PSA)', 'TANQUES', '2024-01-27', 'si', 45000.00, 'TAMBIEN APLICA PARA PEUGEOT 306 /307 PARTNER PICO ALTO', 2),
(32, '336.PNG', 'PEUGEOT 208/408 CITROEN C3 SUPERIOR CORTO (PARA RADIADOR ORIGINAL)', '336', 'PEUGEOT/CITROEN (PSA)', 'TANQUES', '2024-01-27', 'si', 39000.00, '', 1),
(33, '354.PNG', 'RENAULT KANGOO/CLIO (RADIADOR CORTO 48X41)', '354', 'RENAULT', 'TANQUES', '2024-01-27', 'si', 45000.00, '', 2),
(35, '260.PNG\r\n', 'CHEVROLET VECTRA SIN BULBO', '260', 'CHEVROLET', 'TANQUES', '2024-01-10', 'si', 35000.00, '', 11),
(36, '364.png', 'TOYOTA HILUX 2005-2015', '364', 'TOYOTA', 'TANQUES', '2024-01-21', 'si', 50000.00, 'SIN TAPITA', 13),
(37, '5023.png', 'FORD FOCUS 2004/09 LADO BOCAS', '5023', 'FORD', 'TANQUES', '2024-01-21', 'si', 58200.00, '', 13),
(38, '5032.png', 'CHEVROLET ZAFIRA/ASTRA S (IMPORTADO)', '5032', 'CHEVROLET', 'TANQUES', '2024-01-21', 'si', 42000.00, 'LISTO', 13),
(39, '600.png', 'CHEVROLET SPIN/PRISMA NUEVO CORTO', '600', 'CHEVROLET', 'TANQUES', '2024-01-21', 'si', 50000.00, 'CORTO (38x3 cms)', 13),
(40, '5123.png', 'NISSAN TIIDA', '5123', 'NISSAN', 'TANQUES', '2024-01-21', 'si', 54400.00, '', 13),
(41, '5131.png', 'PEUGEOT 307/308/408 HDI', '5131', 'PEUGEOT/CITROEN (PSA)', 'TANQUES', '2024-01-21', 'si', 48000.00, '', 13),
(42, '5144.png', 'TOYOTA COROLLA', '5144', 'TOYOTA', 'TANQUES', '2024-01-21', 'si', 60000.00, '', 13),
(43, '5149.png', 'TOYOTA HILUX SW4', '5149', 'TOYOTA', 'TANQUES', '2024-01-21', 'si', 60000.00, '', 13),
(44, '5161.png', 'TOYOTA ETIOS / HILUX 2000-2005', '5161', 'TOYOTA', 'TANQUES', '2024-01-21', 'si', 0.00, '', 13),
(45, '5074.png', 'HONDA NEW CIVIC', '5074', 'HONDA', 'TANQUES', '2024-01-21', 'si', 53400.00, '', 13),
(46, '8002.png', 'CHEVROLET CORSA/SPIRIT (NUEVO 2012-)', '8002', 'CHEVROLET', 'TANQUES', '2024-01-21', 'si', 50000.00, '', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `mail`, `password`, `nombre`, `apellido`, `fecha_nac`, `telefono`, `direccion`, `ciudad`, `tipo`) VALUES
(1, 'ariel.r.isaias@gmail.com', '$2a$08$nesUk.Ntu/C1o8B5MugP8eeOEUG6sPuVbnTWyLEEmoifgD/XleB9O', 'Ariel Reinaldo', 'Isaias', '1975-03-17', '3364338670', 'Menendez 572', 'San Nicolás', 'admin'),
(30, 'ariel@ariel.com', '$2a$08$gsqcy4T1GY5gU49uvmN4Z.sLYAFH4NBBoUpqDZDAyzVSZY6ITR15e', 'Ariel ', 'Isaias', '2001-01-01', '1234', 'de la rua', 'San Nicolás', 'user'),
(34, 'arielisaias@yahoo.com.ar', '$2a$08$mrljE97IrJjXcFNk/FsBe.IgfGy1xLO4I8/G6wBeMSg7poPW9Lpta', 'Ariel', 'Isaias', '1975-03-17', '3364338670', 'Menendez 572', 'San Nicolas', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_collections`
--

CREATE TABLE `user_collections` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `collection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `user_collections`
--

INSERT INTO `user_collections` (`id`, `user_id`, `collection`) VALUES
(3, 1, 'Anderson'),
(7, 1, 'choto'),
(8, 1, 'minotauro'),
(4, 1, 'Pelado'),
(2, 1, 'Superman');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colecciones`
--
ALTER TABLE `colecciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_coleccion` (`coleccion_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indices de la tabla `user_collections`
--
ALTER TABLE `user_collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_collection` (`user_id`,`collection`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colecciones`
--
ALTER TABLE `colecciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `comics`
--
ALTER TABLE `comics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `user_collections`
--
ALTER TABLE `user_collections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user_collections`
--
ALTER TABLE `user_collections`
  ADD CONSTRAINT `user_collections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
