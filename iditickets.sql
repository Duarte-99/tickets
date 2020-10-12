-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2019 a las 17:07:03
-- Versión del servidor: 8.0.16
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iditickets`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_participante` (IN `_email` VARCHAR(50))  BEGIN

  DECLARE respuesta VARCHAR(255) DEFAULT 'ok';

  START TRANSACTION;

    DELETE FROM participantes
      WHERE email = _email;

    DELETE FROM registros
      WHERE email = _email;

    SELECT respuesta;

  COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_participante` (IN `_email` VARCHAR(50), IN `_nombre` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_nacimiento` DATE, IN `_actividad` CHAR(4))  BEGIN
  DECLARE existe_registro INT DEFAULT 0;
  DECLARE limite INT DEFAULT 0;
  DECLARE registrados INT DEFAULT 0;
  DECLARE respuesta VARCHAR(255) DEFAULT 'ok';

  START TRANSACTION;

    SELECT COUNT(*) INTO existe_registro FROM registros
      WHERE email = _email;

    IF existe_registro = 1 THEN

      SELECT 'Tu correo electronico ya ha sido registrado previamente, sólo puedes registrarte una vez.' AS respuesta;

    ELSE

      SELECT cupo INTO limite FROM actividades
        WHERE actividad_id = _actividad;

      SELECT COUNT(*) INTO registrados FROM registros
        WHERE actividad = _actividad;

      IF registrados < limite THEN

        INSERT INTO participantes (email, nombre, apellidos, nacimiento)
          VALUES (_email, _nombre, _apellidos, _nacimiento);

        INSERT INTO registros (email, actividad, fecha)
          VALUES (_email, _actividad, NOW());

        SELECT respuesta;

      ELSE

        SELECT 'El bloque y actividad seleccionados, ya no tiene lugares disponibles.' AS respuesta;

      END IF;

    END IF;

  COMMIT;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `actividad_id` char(4) NOT NULL,
  `bloque` enum('Bloque 1','Bloque 2','Bloque 3','Bloque 4') NOT NULL,
  `disciplina` enum('KICK BOXING','YOGA','PILATES','ZUMBA','KARATE') NOT NULL,
  `horario` varchar(30) NOT NULL,
  `cupo` int(11) NOT NULL,
  `costo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`actividad_id`, `bloque`, `disciplina`, `horario`, `cupo`, `costo`) VALUES
('1K', 'Bloque 1', 'KICK BOXING', '9:00 a 12:00', 10, '$25'),
('1KT', 'Bloque 1', 'KARATE', '21:00 a 24:00', 15, '$25'),
('1P', 'Bloque 1', 'PILATES', '9:00 a 12:00', 10, '$15'),
('1Y', 'Bloque 1', 'YOGA', '9:00 a 12:00', 20, '$20'),
('1Z', 'Bloque 1', 'ZUMBA', '9:00 a 12:00', 10, '$30'),
('2K', 'Bloque 2', 'KICK BOXING', '14:00 a 17:00', 10, '$25'),
('2KT', 'Bloque 2', 'KARATE', '21:00 a 24:00', 15, '$25'),
('2P', 'Bloque 2', 'PILATES', '14:00 a 17:00', 10, '$15'),
('2Y', 'Bloque 2', 'YOGA', '14:00 a 17:00', 20, '$20'),
('2Z', 'Bloque 2', 'ZUMBA', '14:00 a 17:00', 10, '$30'),
('3K', 'Bloque 3', 'KICK BOXING', '18:00 a 21:00', 10, '$25'),
('3KT', 'Bloque 3', 'KARATE', '21:00 a 24:00', 15, '$25'),
('3P', 'Bloque 3', 'PILATES', '18:00 a 21:00', 10, '$15'),
('3Y', 'Bloque 3', 'YOGA', '18:00 a 21:00', 20, '$20'),
('3Z', 'Bloque 3', 'ZUMBA', '18:00 a 21:00', 10, '$30'),
('4K', 'Bloque 4', 'KICK BOXING', '18:00 a 21:00', 10, '$25'),
('4KT', 'Bloque 4', 'KARATE', '21:00 a 24:00', 15, '$25'),
('4P', 'Bloque 4', 'PILATES', '9:00 a 12:00', 10, '$15'),
('4Y', 'Bloque 4', 'YOGA', '9:00 a 12:00', 20, '$20'),
('4Z', 'Bloque 4', 'ZUMBA', '9:00 a 12:00', 10, '$30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `registro_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `actividad` char(4) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`actividad_id`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`registro_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `actividad` (`actividad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `registro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`email`) REFERENCES `participantes` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`actividad`) REFERENCES `actividades` (`actividad_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
