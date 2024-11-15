-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: bhztsaqp8h8hxdnlggr4-mysql.services.clever-cloud.com:3306
-- Tiempo de generación: 15-11-2024 a las 18:43:53
-- Versión del servidor: 8.0.22-13
-- Versión de PHP: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bhztsaqp8h8hxdnlggr4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendas`
--

CREATE TABLE `agendas` (
  `id_agenda` int NOT NULL,
  `id_profesional` int DEFAULT NULL,
  `id_profesionale_especialidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agendas`
--

INSERT INTO `agendas` (`id_agenda`, `id_profesional`, `id_profesionale_especialidade`) VALUES
(2, 1, 3),
(5, 1, 1),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `id_alergia` int NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `importancia` text COLLATE utf8mb4_general_ci,
  `id_historia_clinica` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alergias`
--

INSERT INTO `alergias` (`id_alergia`, `nombre`, `fecha_desde`, `fecha_hasta`, `importancia`, `id_historia_clinica`) VALUES
(11, 'Alergia al polen - 418689008', '2024-11-11', NULL, 'Alta', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentes_patologicos`
--

CREATE TABLE `antecedentes_patologicos` (
  `id_antecedente_patologico` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `id_historia_clinica` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `antecedentes_patologicos`
--

INSERT INTO `antecedentes_patologicos` (`id_antecedente_patologico`, `descripcion`, `fecha_desde`, `fecha_hasta`, `id_historia_clinica`) VALUES
(7, 'Tos', '2024-11-11', '2024-11-30', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int NOT NULL,
  `id_turno` int DEFAULT NULL,
  `id_paciente` int DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consulta`, `id_turno`, `id_paciente`, `fecha`) VALUES
(194, 863, 13, '2024-10-19 00:00:00'),
(195, 864, 14, '2024-10-19 00:00:00'),
(196, 865, 15, '2024-10-19 00:00:00'),
(197, 869, 19, '2024-11-11 00:00:00'),
(198, 870, 20, '2024-11-11 00:00:00'),
(199, 909, 19, '2024-11-11 00:00:00'),
(200, 889, 19, '2024-11-11 00:00:00'),
(201, 929, 19, '2024-11-11 00:00:00'),
(202, 949, 19, '2024-11-11 00:00:00'),
(203, 969, 19, '2024-11-11 00:00:00'),
(204, 969, 19, '2024-11-11 00:00:00'),
(205, 871, 1, '2024-11-11 00:00:00'),
(206, 891, 1, '2024-11-11 00:00:00'),
(207, 891, 1, '2024-11-11 00:00:00'),
(208, 911, 1, '2024-11-11 00:00:00'),
(209, 936, 6, '2024-11-11 00:00:00'),
(210, 961, 11, '2024-11-11 00:00:00'),
(211, 951, 1, '2024-11-11 00:00:00'),
(212, 971, 1, '2024-11-11 00:00:00'),
(213, 872, 2, '2024-11-11 00:00:00'),
(214, 796, 6, '2024-11-11 00:00:00'),
(215, 821, 11, '2024-11-11 00:00:00'),
(216, 826, 16, '2024-11-11 00:00:00'),
(217, 811, 1, '2024-11-11 00:00:00'),
(218, 812, 2, '2024-11-11 00:00:00'),
(219, 813, 3, '2024-11-11 00:00:00'),
(220, 814, 4, '2024-11-11 00:00:00'),
(221, 814, 4, '2024-11-11 00:00:00'),
(222, 816, 6, '2024-11-11 00:00:00'),
(223, 876, 6, '2024-11-11 00:00:00'),
(224, 873, 3, '2024-11-11 00:00:00'),
(225, 882, 12, '2024-11-15 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id_diagnostico` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `tipo` text COLLATE utf8mb4_general_ci,
  `id_historia_clinica` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnosticos`
--

INSERT INTO `diagnosticos` (`id_diagnostico`, `descripcion`, `tipo`, `id_historia_clinica`) VALUES
(43, 'Presion arterial alta', 'Confirmado', 44),
(44, 'Consulta', 'Preliminar', 45),
(45, 'asdsad', 'Preliminar', 46),
(46, 'aaa', 'Preliminar', 47),
(47, 'aaaa', 'Preliminar', 48),
(48, 'nefrológica', 'Preliminar', 49),
(49, 'test', 'Preliminar', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci,
  `descripcion` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `nombre`, `descripcion`) VALUES
(1, 'Cardiología', 'Especialidad médica que se ocupa del estudio, diagnóstico y tratamiento de las enfermedades del corazón y del sistema circulatorio.'),
(2, 'Dermatología', 'Rama de la medicina dedicada al diagnóstico y tratamiento de enfermedades de la piel, cabello, uñas y mucosas.'),
(3, 'Ginecología', 'Especialidad centrada en el cuidado del sistema reproductor femenino, así como la salud de la mujer en general.'),
(4, 'Pediatría', 'Rama de la medicina enfocada en la atención y tratamiento de los niños, desde el nacimiento hasta la adolescencia.'),
(5, 'Neurología', 'Estudio de las enfermedades del sistema nervioso central y periférico, como la epilepsia, el Parkinson y la esclerosis múltiple.'),
(6, 'Psiquiatría', 'Rama de la medicina que diagnostica y trata trastornos mentales y emocionales, como la depresión, ansiedad y esquizofrenia.'),
(7, 'Oncología', 'Especialidad médica dedicada al estudio y tratamiento del cáncer, así como la investigación sobre la prevención y tratamiento del mismo.'),
(8, 'Oftalmología', 'Rama de la medicina que trata las enfermedades y trastornos relacionados con los ojos y la visión.'),
(9, 'Traumatología', 'Especialidad médica que se encarga del diagnóstico y tratamiento de lesiones del sistema musculoesquelético, como fracturas y dislocaciones.'),
(10, 'Urología', 'Rama de la medicina dedicada al diagnóstico y tratamiento de enfermedades del aparato urinario y del sistema reproductor masculino.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evoluciones`
--

CREATE TABLE `evoluciones` (
  `id_evolucion` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `id_historia_clinica` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evoluciones`
--

INSERT INTO `evoluciones` (`id_evolucion`, `descripcion`, `id_historia_clinica`) VALUES
(37, '<h1>Lucia Rojas</h1><p><br></p><p>Se encuentra mejor</p>', 44),
(38, '<h1>Agustin ortiz</h1>', 45),
(39, '<h1>asdsa</h1>', 46),
(40, '<h1>Lucas Pérez</h1>', 47),
(41, '<h1>Control general</h1>', 48),
(42, '<h3>Situación Actual</h3><p>Descripción: ____</p><h3>Signos de Alarma</h3><p>Descripción: ____</p><h3>Medidas Inmediatas</h3><p>Descripción: ____</p>', 49),
(43, '<h3>Cabeza y Cuello</h3><p>Descripción: ____ testtttt</p><h3>Tórax</h3><p>Descripción: ____</p><h3>Abdomen</h3><p>Descripción: ____</p><h3>Extremidades</h3><p>Descripción: ____</p>', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitos`
--

CREATE TABLE `habitos` (
  `id_habito` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `id_historia_clinica` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitos`
--

INSERT INTO `habitos` (`id_habito`, `descripcion`, `fecha_desde`, `fecha_hasta`, `id_historia_clinica`) VALUES
(7, 'Fumador ocacional', '2024-11-11', '2024-11-21', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id_historia_clinica` int NOT NULL,
  `id_paciente` int DEFAULT NULL,
  `id_consulta` int DEFAULT NULL,
  `id_profesional` int DEFAULT NULL,
  `motivo_consulta` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id_historia_clinica`, `id_paciente`, `id_consulta`, `id_profesional`, `motivo_consulta`) VALUES
(44, 19, 197, 1, 'control de presión arterial'),
(45, 20, 198, 1, 'consulta \r\nurológica'),
(46, 19, 204, 1, 'control de presión arterial'),
(47, 1, 205, 1, 'consulta \r\ngeriátrica'),
(48, 1, 212, 1, 'control general'),
(49, 6, 223, 1, 'consulta \r\nnefrológica'),
(50, 12, 225, 1, 'consulta \r\nde otorrinolaringología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci,
  `dosis` text COLLATE utf8mb4_general_ci,
  `frecuencia` text COLLATE utf8mb4_general_ci,
  `id_historia_clinica` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `nombre`, `dosis`, `frecuencia`, `id_historia_clinica`) VALUES
(6, 'Ibuprofeno', 'Una pastilla', 'Cada 8 Horas', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mutuales`
--

CREATE TABLE `mutuales` (
  `id_mutual` int NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci,
  `numero_afiliado` int DEFAULT NULL,
  `cobertura` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mutuales`
--

INSERT INTO `mutuales` (`id_mutual`, `nombre`, `numero_afiliado`, `cobertura`) VALUES
(10, 'Mutual Salud', 12345, 'Cobertura completa'),
(11, 'Mutual Bienestar', 9876, 'Cobertura parcial'),
(12, 'Mutual Protegidos', 67890, 'Cobertura completa'),
(13, 'Mutual Vida', 54321, 'Cobertura básica'),
(14, 'Mutual Total', 11223, 'Cobertura completa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL,
  `genero` text COLLATE utf8mb4_general_ci,
  `id_persona` int DEFAULT NULL,
  `id_mutual` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `genero`, `id_persona`, `id_mutual`) VALUES
(1, 'Masculino', 84, 10),
(2, 'Masculino', 85, 11),
(3, 'Femenino', 86, 12),
(4, 'Femenino', 87, 13),
(5, 'Masculino', 88, 14),
(6, 'Femenino', 89, 10),
(7, 'Masculino', 90, 11),
(8, 'Femenino', 91, 12),
(9, 'Masculino', 92, 13),
(10, 'Femenino', 93, 14),
(11, 'Masculino', 94, 10),
(12, 'Femenino', 95, 11),
(13, 'Masculino', 96, 12),
(14, 'Femenino', 97, 13),
(15, 'Masculino', 98, 14),
(16, 'Femenino', 99, 10),
(17, 'Masculino', 100, 11),
(18, 'Femenino', 101, 12),
(19, 'Masculino', 102, 13),
(20, 'Femenino', 103, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int NOT NULL,
  `documento` int DEFAULT NULL,
  `nombre` text COLLATE utf8mb4_general_ci,
  `apellido` text COLLATE utf8mb4_general_ci,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `telefono` int DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `documento`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`, `direccion`) VALUES
(23, 42125797, 'Alex', 'Corales', '0000-00-00', 'alexcorales21@gmail.com', 2147483647, 'barrio serranias puntanas mnz 171 casa 18'),
(84, 49691182, 'Lucas', 'Pérez', '2001-03-15', 'lucas@gmail.com', 2147483647, 'avenida siempreviva 45'),
(85, 49691183, 'Matías', 'Gómez', '1998-06-20', 'matias@gmail.com', 2147483647, 'calle libertad 100'),
(86, 49691184, 'María', 'López', '1995-12-05', 'maria@gmail.com', 2147483647, 'boulevard belgrano 250'),
(87, 49691185, 'Clara', 'Rodríguez', '2000-08-25', 'clara@gmail.com', 2147483647, 'avenida san martin 400'),
(88, 49691186, 'Federico', 'Fernández', '2003-04-10', 'fede@gmail.com', 2147483647, 'pasaje mitre 78'),
(89, 49691187, 'Sofía', 'Martínez', '2004-11-30', 'sofia@gmail.com', 2147483647, 'calle sarmiento 150'),
(90, 49691188, 'Nicolás', 'Sánchez', '2002-07-12', 'nico@gmail.com', 2147483647, 'avenida libertad 54'),
(91, 49691189, 'Julián', 'Ramírez', '1997-09-22', 'julian@gmail.com', 2147483647, 'boulevard las heras 98'),
(92, 49691190, 'Camila', 'Torres', '1999-01-18', 'camila@gmail.com', 2147483647, 'calle colon 275'),
(93, 49691191, 'Sebastián', 'Flores', '2006-05-28', 'sebastian@gmail.com', 2147483647, 'pasaje rivadavia 59'),
(94, 49691192, 'Valentina', 'González', '2001-10-05', 'valentina@gmail.com', 2147483647, 'calle san juan 80'),
(95, 49691193, 'Martín', 'Morales', '2005-03-19', 'martin@gmail.com', 2147483647, 'avenida belgrano 120'),
(96, 49691194, 'Micaela', 'Silva', '2007-12-01', 'mica@gmail.com', 2147483647, 'boulevard mitre 15'),
(97, 49691195, 'Pablo', 'Vega', '1996-07-17', 'pablo@gmail.com', 2147483647, 'calle roca 205'),
(98, 49691196, 'Ana', 'Suárez', '1994-06-25', 'ana@gmail.com', 2147483647, 'calle alvear 190'),
(99, 49691197, 'Tomás', 'Ramos', '1999-02-14', 'tomas@gmail.com', 2147483647, 'avenida mitre 111'),
(100, 49691198, 'Florencia', 'Benítez', '1998-09-30', 'flor@gmail.com', 2147483647, 'calle belgrano 60'),
(101, 49691199, 'Alejandro', 'Mendoza', '2002-05-10', 'alejandro@gmail.com', 2147483647, 'pasaje libertad 222'),
(102, 49691200, 'Lucía', 'Rojas', '2003-11-12', 'lucia@gmail.com', 2147483647, 'calle sarmiento 340'),
(103, 49691201, 'Agustín', 'Ortiz', '2004-08-07', 'agustin@gmail.com', 2147483647, 'avenida las heras 88'),
(104, 49696181, 'Brain', 'Corales', '0000-00-00', 'Braian@gmail.com', 2147483647, 'direccion 123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantillas`
--

CREATE TABLE `plantillas` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantillas`
--

INSERT INTO `plantillas` (`id`, `nombre`, `contenido`, `fecha_creacion`) VALUES
(1, 'Evaluación Inicial', '<h3>Motivo de Consulta</h3><p>Descripción: ____</p><h3>Historia Clínica</h3><p>Antecedentes: ____</p><h3>Signos Vitales</h3><ul><li>Frecuencia cardíaca: ____</li><li>Presión arterial: ____</li><li>Temperatura: ____</li></ul>', '2024-11-11 19:25:14'),
(2, 'Examen Físico General', '<h3>Cabeza y Cuello</h3><p>Descripción: ____</p><h3>Tórax</h3><p>Descripción: ____</p><h3>Abdomen</h3><p>Descripción: ____</p><h3>Extremidades</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(3, 'Seguimiento de Tratamiento', '<h3>Diagnóstico Actual</h3><p>Condición: ____</p><h3>Tratamiento en Curso</h3><p>Descripción: ____</p><h3>Recomendaciones</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(4, 'Consulta de Urgencia', '<h3>Situación Actual</h3><p>Descripción: ____</p><h3>Signos de Alarma</h3><p>Descripción: ____</p><h3>Medidas Inmediatas</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(5, 'Evaluación Neurológica', '<h3>Estado Mental</h3><p>Descripción: ____</p><h3>Cranial Nerves</h3><p>Descripción: ____</p><h3>Reflejos</h3><p>Descripción: ____</p><h3>Motor System</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(6, 'Control Postoperatorio', '<h3>Procedimiento Realizado</h3><p>Descripción: ____</p><h3>Evolución</h3><p>Descripción: ____</p><h3>Recomendaciones Postoperatorias</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(7, 'Consulta Pediátrica', '<h3>Antecedentes Perinatales</h3><p>Descripción: ____</p><h3>Desarrollo Psicomotor</h3><p>Descripción: ____</p><h3>Vacunas</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(8, 'Consulta Geriátrica', '<h3>Antecedentes Médicos</h3><p>Descripción: ____</p><h3>Medicación Actual</h3><p>Descripción: ____</p><h3>Evaluación Cognitiva</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(9, 'Evaluación Cardiológica', '<h3>Antecedentes Cardiovasculares</h3><p>Descripción: ____</p><h3>Signos Vitales</h3><ul><li>Frecuencia cardíaca: ____</li><li>Presión arterial: ____</li></ul><h3>Examen Cardiológico</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14'),
(10, 'Evaluación Psicológica', '<h3>Motivo de Consulta</h3><p>Descripción: ____</p><h3>Historia Familiar</h3><p>Descripción: ____</p><h3>Evaluación del Estado de Ánimo</h3><p>Descripción: ____</p><h3>Conclusión</h3><p>Descripción: ____</p>', '2024-11-11 19:25:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id_profesional` int NOT NULL,
  `matricula` text COLLATE utf8mb4_general_ci,
  `id_persona` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesionales`
--

INSERT INTO `profesionales` (`id_profesional`, `matricula`, `id_persona`, `id_usuario`) VALUES
(1, '18171', 23, 1),
(2, '123456', 104, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales_especialidades`
--

CREATE TABLE `profesionales_especialidades` (
  `id_profesionale_especialidade` int NOT NULL,
  `id_profesional` int DEFAULT NULL,
  `id_especialidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesionales_especialidades`
--

INSERT INTO `profesionales_especialidades` (`id_profesionale_especialidade`, `id_profesional`, `id_especialidad`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` text COLLATE utf8mb4_general_ci,
  `motivo` text COLLATE utf8mb4_general_ci,
  `id_agenda` int DEFAULT NULL,
  `id_paciente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id_turno`, `fecha`, `hora`, `estado`, `motivo`, `id_agenda`, `id_paciente`) VALUES
(746, '2024-10-19', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(747, '2024-10-19', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(748, '2024-10-19', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(749, '2024-10-19', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(750, '2024-10-19', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(751, '2024-10-20', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(752, '2024-10-20', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(753, '2024-10-20', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(754, '2024-10-20', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(755, '2024-10-20', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(756, '2024-10-21', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(757, '2024-10-21', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(758, '2024-10-21', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(759, '2024-10-21', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(760, '2024-10-21', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(761, '2024-10-22', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(762, '2024-10-22', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(763, '2024-10-22', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(764, '2024-10-22', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(765, '2024-10-22', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(766, '2024-10-23', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(767, '2024-10-23', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(768, '2024-10-23', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(769, '2024-10-23', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(770, '2024-10-23', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(771, '2024-10-24', '08:00:00', 'Disponible', 'control general', 2, 1),
(772, '2024-10-24', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(773, '2024-10-24', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(774, '2024-10-24', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(775, '2024-10-24', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(776, '2024-10-25', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(777, '2024-10-25', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(778, '2024-10-25', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(779, '2024-10-25', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(780, '2024-10-25', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(781, '2024-10-26', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(782, '2024-10-26', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(783, '2024-10-26', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(784, '2024-10-26', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(785, '2024-10-26', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(786, '2024-10-27', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(787, '2024-10-27', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(788, '2024-10-27', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(789, '2024-10-27', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(790, '2024-10-27', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(791, '2024-10-28', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(792, '2024-10-28', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(793, '2024-10-28', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(794, '2024-10-28', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(795, '2024-10-28', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(796, '2024-10-29', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(797, '2024-10-29', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(798, '2024-10-29', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(799, '2024-10-29', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(800, '2024-10-29', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(801, '2024-10-30', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(802, '2024-10-30', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(803, '2024-10-30', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(804, '2024-10-30', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(805, '2024-10-30', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(806, '2024-10-31', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(807, '2024-10-31', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(808, '2024-10-31', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(809, '2024-10-31', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(810, '2024-10-31', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(811, '2024-11-01', '08:00:00', 'Disponible', 'control general', 2, 1),
(812, '2024-11-01', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(813, '2024-11-01', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(814, '2024-11-01', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(815, '2024-11-01', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(816, '2024-11-02', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(817, '2024-11-02', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(818, '2024-11-02', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(819, '2024-11-02', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(820, '2024-11-02', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(821, '2024-11-03', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(822, '2024-11-03', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(823, '2024-11-03', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(824, '2024-11-03', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(825, '2024-11-03', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(826, '2024-11-04', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(827, '2024-11-04', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(828, '2024-11-04', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(829, '2024-11-04', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(830, '2024-11-04', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(831, '2024-11-05', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(832, '2024-11-05', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(833, '2024-11-05', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(834, '2024-11-05', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(835, '2024-11-05', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(836, '2024-11-06', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(837, '2024-11-06', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(838, '2024-11-06', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(839, '2024-11-06', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(840, '2024-11-06', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(841, '2024-11-07', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(842, '2024-11-07', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(843, '2024-11-07', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(844, '2024-11-07', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(845, '2024-11-07', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(846, '2024-11-08', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(847, '2024-11-08', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(848, '2024-11-08', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(849, '2024-11-08', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(850, '2024-11-08', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(851, '2024-11-09', '08:00:00', 'Disponible', 'control general', 2, 1),
(852, '2024-11-09', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(853, '2024-11-09', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(854, '2024-11-09', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(855, '2024-11-09', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(856, '2024-11-10', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(857, '2024-11-10', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(858, '2024-11-10', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(859, '2024-11-10', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(860, '2024-11-10', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(861, '2024-11-11', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(862, '2024-11-11', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(863, '2024-11-11', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(864, '2024-11-11', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(865, '2024-11-11', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(866, '2024-11-12', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(867, '2024-11-12', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(868, '2024-11-12', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(869, '2024-11-12', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(870, '2024-11-12', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(871, '2024-11-13', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(872, '2024-11-13', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(873, '2024-11-13', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(874, '2024-11-13', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(875, '2024-11-13', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(876, '2024-11-14', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(877, '2024-11-14', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(878, '2024-11-14', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(879, '2024-11-14', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(880, '2024-11-14', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(881, '2024-11-15', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(882, '2024-11-15', '10:00:00', 'Atendido', 'consulta \r\nde otorrinolaringología', 2, 12),
(883, '2024-11-15', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(884, '2024-11-15', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(885, '2024-11-15', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(886, '2024-11-16', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(887, '2024-11-16', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(888, '2024-11-16', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(889, '2024-11-16', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(890, '2024-11-16', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(891, '2024-11-17', '08:00:00', 'Disponible', 'control general', 2, 1),
(892, '2024-11-17', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(893, '2024-11-17', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(894, '2024-11-17', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(895, '2024-11-17', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(896, '2024-11-18', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(897, '2024-11-18', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(898, '2024-11-18', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(899, '2024-11-18', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(900, '2024-11-18', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(901, '2024-11-19', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(902, '2024-11-19', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(903, '2024-11-19', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(904, '2024-11-19', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(905, '2024-11-19', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(906, '2024-11-20', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(907, '2024-11-20', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(908, '2024-11-20', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(909, '2024-11-20', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(910, '2024-11-20', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(911, '2024-11-21', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(912, '2024-11-21', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(913, '2024-11-21', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(914, '2024-11-21', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(915, '2024-11-21', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(916, '2024-11-22', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(917, '2024-11-22', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(918, '2024-11-22', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(919, '2024-11-22', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(920, '2024-11-22', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(921, '2024-11-23', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(922, '2024-11-23', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(923, '2024-11-23', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(924, '2024-11-23', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(925, '2024-11-23', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(926, '2024-11-24', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(927, '2024-11-24', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(928, '2024-11-24', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(929, '2024-11-24', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(930, '2024-11-24', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(931, '2024-11-25', '08:00:00', 'Disponible', 'control general', 2, 1),
(932, '2024-11-25', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(933, '2024-11-25', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(934, '2024-11-25', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(935, '2024-11-25', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(936, '2024-11-26', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(937, '2024-11-26', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(938, '2024-11-26', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(939, '2024-11-26', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(940, '2024-11-26', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(941, '2024-11-27', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(942, '2024-11-27', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(943, '2024-11-27', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(944, '2024-11-27', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(945, '2024-11-27', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(946, '2024-11-28', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(947, '2024-11-28', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(948, '2024-11-28', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(949, '2024-11-28', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(950, '2024-11-28', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(951, '2024-11-29', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(952, '2024-11-29', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(953, '2024-11-29', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(954, '2024-11-29', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(955, '2024-11-29', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(956, '2024-11-30', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(957, '2024-11-30', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(958, '2024-11-30', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(959, '2024-11-30', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(960, '2024-11-30', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(961, '2024-12-01', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(962, '2024-12-01', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(963, '2024-12-01', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(964, '2024-12-01', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(965, '2024-12-01', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(966, '2024-12-02', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(967, '2024-12-02', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(968, '2024-12-02', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(969, '2024-12-02', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(970, '2024-12-02', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(971, '2024-12-03', '08:00:00', 'Disponible', 'control general', 2, 1),
(972, '2024-12-03', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(973, '2024-12-03', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(974, '2024-12-03', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(975, '2024-12-03', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(976, '2024-12-04', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(977, '2024-12-04', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(978, '2024-12-04', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(979, '2024-12-04', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(980, '2024-12-04', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(981, '2024-12-05', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(982, '2024-12-05', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(983, '2024-12-05', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(984, '2024-12-05', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(985, '2024-12-05', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(986, '2024-12-06', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(987, '2024-12-06', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(988, '2024-12-06', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(989, '2024-12-06', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(990, '2024-12-06', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(991, '2024-12-07', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(992, '2024-12-07', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(993, '2024-12-07', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(994, '2024-12-07', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(995, '2024-12-07', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(996, '2024-12-08', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(997, '2024-12-08', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(998, '2024-12-08', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(999, '2024-12-08', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(1000, '2024-12-08', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(1001, '2024-12-09', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(1002, '2024-12-09', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(1003, '2024-12-09', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(1004, '2024-12-09', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(1005, '2024-12-09', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(1006, '2024-12-10', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(1007, '2024-12-10', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(1008, '2024-12-10', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(1009, '2024-12-10', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(1010, '2024-12-10', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(1011, '2024-12-11', '08:00:00', 'Disponible', 'control general', 2, 1),
(1012, '2024-12-11', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(1013, '2024-12-11', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(1014, '2024-12-11', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(1015, '2024-12-11', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(1016, '2024-12-12', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(1017, '2024-12-12', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(1018, '2024-12-12', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(1019, '2024-12-12', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(1020, '2024-12-12', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(1021, '2024-12-13', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(1022, '2024-12-13', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(1023, '2024-12-13', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(1024, '2024-12-13', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(1025, '2024-12-13', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(1026, '2024-12-14', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(1027, '2024-12-14', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(1028, '2024-12-14', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(1029, '2024-12-14', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(1030, '2024-12-14', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(1031, '2024-12-15', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(1032, '2024-12-15', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(1033, '2024-12-15', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(1034, '2024-12-15', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(1035, '2024-12-15', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(1036, '2024-12-16', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(1037, '2024-12-16', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(1038, '2024-12-16', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(1039, '2024-12-16', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(1040, '2024-12-16', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(1041, '2024-12-17', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(1042, '2024-12-17', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(1043, '2024-12-17', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(1044, '2024-12-17', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(1045, '2024-12-17', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(1046, '2024-12-18', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(1047, '2024-12-18', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(1048, '2024-12-18', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(1049, '2024-12-18', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(1050, '2024-12-18', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(1051, '2024-12-19', '08:00:00', 'Disponible', 'control general', 2, 1),
(1052, '2024-12-19', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(1053, '2024-12-19', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(1054, '2024-12-19', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(1055, '2024-12-19', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(1056, '2024-12-20', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(1057, '2024-12-20', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(1058, '2024-12-20', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(1059, '2024-12-20', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(1060, '2024-12-20', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(1061, '2024-12-21', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(1062, '2024-12-21', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(1063, '2024-12-21', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(1064, '2024-12-21', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(1065, '2024-12-21', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(1066, '2024-12-22', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(1067, '2024-12-22', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(1068, '2024-12-22', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(1069, '2024-12-22', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(1070, '2024-12-22', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(1071, '2024-12-23', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(1072, '2024-12-23', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(1073, '2024-12-23', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(1074, '2024-12-23', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(1075, '2024-12-23', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(1076, '2024-12-24', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(1077, '2024-12-24', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(1078, '2024-12-24', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(1079, '2024-12-24', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(1080, '2024-12-24', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10),
(1081, '2024-12-25', '08:00:00', 'Disponible', 'consulta \r\nde alergias', 2, 11),
(1082, '2024-12-25', '10:00:00', 'Disponible', 'consulta \r\nde otorrinolaringología', 2, 12),
(1083, '2024-12-25', '12:00:00', 'Disponible', 'control de peso', 2, 13),
(1084, '2024-12-25', '14:00:00', 'Disponible', 'consulta \r\nde gastroenterología', 2, 14),
(1085, '2024-12-25', '16:00:00', 'Disponible', 'control de asma', 2, 15),
(1086, '2024-12-26', '08:00:00', 'Disponible', 'consulta \r\nde medicina deportiva', 2, 16),
(1087, '2024-12-26', '10:00:00', 'Disponible', 'consulta \r\nde geriatría', 2, 17),
(1088, '2024-12-26', '12:00:00', 'Disponible', 'consulta \r\nde hematología', 2, 18),
(1089, '2024-12-26', '14:00:00', 'Disponible', 'control de tiroides', 2, 19),
(1090, '2024-12-26', '16:00:00', 'Disponible', 'consulta \r\nde nefrología', 2, 20),
(1091, '2024-12-27', '08:00:00', 'Disponible', 'control general', 2, 1),
(1092, '2024-12-27', '10:00:00', 'Disponible', 'consulta \r\npediátrica', 2, 2),
(1093, '2024-12-27', '12:00:00', 'Disponible', 'consulta \r\nginecológica', 2, 3),
(1094, '2024-12-27', '14:00:00', 'Disponible', 'seguimiento de tratamiento', 2, 4),
(1095, '2024-12-27', '16:00:00', 'Disponible', 'consulta \r\ntraumatológica', 2, 5),
(1096, '2024-12-28', '08:00:00', 'Disponible', 'consulta \r\npsicológica', 2, 6),
(1097, '2024-12-28', '10:00:00', 'Disponible', 'consulta \r\ncardiológica', 2, 7),
(1098, '2024-12-28', '12:00:00', 'Disponible', 'control de diabetes', 2, 8),
(1099, '2024-12-28', '14:00:00', 'Disponible', 'consulta \r\nnutricional', 2, 9),
(1100, '2024-12-28', '16:00:00', 'Disponible', 'consulta \r\ndermatológica', 2, 10),
(1101, '2024-12-29', '08:00:00', 'Disponible', 'evaluación prequirúrgica', 2, 11),
(1102, '2024-12-29', '10:00:00', 'Disponible', 'control postoperatorio', 2, 12),
(1103, '2024-12-29', '12:00:00', 'Disponible', 'consulta \r\nalergológica', 2, 13),
(1104, '2024-12-29', '14:00:00', 'Disponible', 'consulta \r\noftalmológica', 2, 14),
(1105, '2024-12-29', '16:00:00', 'Disponible', 'consulta \r\nodontológica', 2, 15),
(1106, '2024-12-30', '08:00:00', 'Disponible', 'consulta \r\nneurológica', 2, 16),
(1107, '2024-12-30', '10:00:00', 'Disponible', 'consulta \r\nfonoaudiológica', 2, 17),
(1108, '2024-12-30', '12:00:00', 'Disponible', 'consulta \r\nreumatológica', 2, 18),
(1109, '2024-12-30', '14:00:00', 'Disponible', 'control de presión arterial', 2, 19),
(1110, '2024-12-30', '16:00:00', 'Disponible', 'consulta \r\nurológica', 2, 20),
(1111, '2024-12-31', '08:00:00', 'Disponible', 'consulta \r\ngeriátrica', 2, 1),
(1112, '2024-12-31', '10:00:00', 'Disponible', 'consulta \r\nendocrinológica', 2, 2),
(1113, '2024-12-31', '12:00:00', 'Disponible', 'control de colesterol', 2, 3),
(1114, '2024-12-31', '14:00:00', 'Disponible', 'consulta \r\nhematológica', 2, 4),
(1115, '2024-12-31', '16:00:00', 'Disponible', 'consulta \r\nde medicina general', 2, 5),
(1116, '2025-01-01', '08:00:00', 'Disponible', 'consulta \r\nnefrológica', 2, 6),
(1117, '2025-01-01', '10:00:00', 'Disponible', 'consulta \r\nde inmunología', 2, 7),
(1118, '2025-01-01', '12:00:00', 'Disponible', 'consulta \r\nde fisioterapia', 2, 8),
(1119, '2025-01-01', '14:00:00', 'Disponible', 'consulta \r\npsiquiátrica', 2, 9),
(1120, '2025-01-01', '16:00:00', 'Disponible', 'consulta \r\nde dolor crónico', 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `email` text COLLATE utf8mb4_general_ci,
  `password` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`) VALUES
(1, 'doctor1@gmail.com', 'admin'),
(2, 'doctor2@gmail.com', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `id_profesional` (`id_profesional`),
  ADD KEY `id_profesionale_especialidade` (`id_profesionale_especialidade`);

--
-- Indices de la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`id_alergia`),
  ADD KEY `id_historia_clinica` (`id_historia_clinica`);

--
-- Indices de la tabla `antecedentes_patologicos`
--
ALTER TABLE `antecedentes_patologicos`
  ADD PRIMARY KEY (`id_antecedente_patologico`),
  ADD KEY `id_historia_clinica` (`id_historia_clinica`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_turno` (`id_turno`) USING BTREE;

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`id_diagnostico`),
  ADD KEY `id_historia_clinica` (`id_historia_clinica`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  ADD PRIMARY KEY (`id_evolucion`),
  ADD KEY `id_historia_clinica` (`id_historia_clinica`);

--
-- Indices de la tabla `habitos`
--
ALTER TABLE `habitos`
  ADD PRIMARY KEY (`id_habito`),
  ADD KEY `id_historia_clinica` (`id_historia_clinica`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id_historia_clinica`),
  ADD KEY `id_paciente` (`id_paciente`,`id_consulta`,`id_profesional`),
  ADD KEY `id_consulta` (`id_consulta`),
  ADD KEY `id_profesional` (`id_profesional`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`),
  ADD KEY `id_historia_clinica` (`id_historia_clinica`);

--
-- Indices de la tabla `mutuales`
--
ALTER TABLE `mutuales`
  ADD PRIMARY KEY (`id_mutual`),
  ADD UNIQUE KEY `numero_afiliado` (`numero_afiliado`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_mutual` (`id_mutual`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id_profesional`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `profesionales_especialidades`
--
ALTER TABLE `profesionales_especialidades`
  ADD PRIMARY KEY (`id_profesionale_especialidade`),
  ADD KEY `id_profesional` (`id_profesional`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `fk_id_paciente` (`id_paciente`),
  ADD KEY `turnos_ibfk_1` (`id_agenda`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id_agenda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `id_alergia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `antecedentes_patologicos`
--
ALTER TABLE `antecedentes_patologicos`
  MODIFY `id_antecedente_patologico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id_diagnostico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  MODIFY `id_evolucion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `habitos`
--
ALTER TABLE `habitos`
  MODIFY `id_habito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id_historia_clinica` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mutuales`
--
ALTER TABLE `mutuales`
  MODIFY `id_mutual` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesionales_especialidades`
--
ALTER TABLE `profesionales_especialidades`
  MODIFY `id_profesionale_especialidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `agendas_ibfk_1` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`),
  ADD CONSTRAINT `agendas_ibfk_2` FOREIGN KEY (`id_profesionale_especialidade`) REFERENCES `profesionales_especialidades` (`id_profesionale_especialidade`);

--
-- Filtros para la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD CONSTRAINT `alergias_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historias_clinicas` (`id_historia_clinica`);

--
-- Filtros para la tabla `antecedentes_patologicos`
--
ALTER TABLE `antecedentes_patologicos`
  ADD CONSTRAINT `antecedentes_patologicos_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historias_clinicas` (`id_historia_clinica`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historias_clinicas` (`id_historia_clinica`);

--
-- Filtros para la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  ADD CONSTRAINT `evoluciones_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historias_clinicas` (`id_historia_clinica`);

--
-- Filtros para la tabla `habitos`
--
ALTER TABLE `habitos`
  ADD CONSTRAINT `habitos_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historias_clinicas` (`id_historia_clinica`);

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `historias_clinicas_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`),
  ADD CONSTRAINT `historias_clinicas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `historias_clinicas_ibfk_3` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`);

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historias_clinicas` (`id_historia_clinica`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_mutual`) REFERENCES `mutuales` (`id_mutual`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD CONSTRAINT `profesionales_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `profesionales_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `profesionales_especialidades`
--
ALTER TABLE `profesionales_especialidades`
  ADD CONSTRAINT `profesionales_especialidades_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `profesionales_especialidades_ibfk_2` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agendas` (`id_agenda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
