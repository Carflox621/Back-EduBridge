-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2025 a las 22:31:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemploo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `rol` enum('ALUMNO','PROFESOR','ADMIN') NOT NULL,
  `firebase_uid` varchar(100) NOT NULL,
  `grado` tinyint(4) DEFAULT NULL,
  `grupo` varchar(10) DEFAULT NULL,
  `materia` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `matricula`, `nombre`, `correo`, `rol`, `firebase_uid`, `grado`, `grupo`, `materia`, `area`) VALUES
(2, '12345', 'Juan P?rez', '12345@escuela.com', 'ALUMNO', 'P4GQagEYt5alcppN30cBF68Wo7X2', 2, 'A', NULL, NULL),
(3, '202124010', 'Carla Cristalinas', 'juan123@escuela.com', 'PROFESOR', '1RKYSYgicPbfME1vPlcw7WrqGhC3', 2, 'A', NULL, NULL),
(4, '2025001', 'Ana Perez', '2025001@escuela.com', 'ALUMNO', 'UID_DE_PRUEBA', 3, 'A', NULL, NULL),
(5, 'A00123', 'carla', 'carla123@gmail.com', 'ALUMNO', 'VN44mLVfVGdnQb7Kg9tFs0KmNJ53', 3, 'B', ' ', ' '),
(6, 'B00200', 'juan', 'juan123@escuela.com', 'PROFESOR', 'rsKt6XpgOVcIwWpMtqv8P0RO6FZ2', 3, 'B', ' ', ' ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD UNIQUE KEY `firebase_uid` (`firebase_uid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
