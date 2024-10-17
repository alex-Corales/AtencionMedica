-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2024 a las 18:43:49
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
-- Base de datos: `atencionmedica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendas`
--

CREATE TABLE `agendas` (
  `id_agenda` int(11) NOT NULL,
  `id_profesional` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `id_alergia` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `importancia` text DEFAULT NULL,
  `id_historia_clinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentes_patologicos`
--

CREATE TABLE `antecedentes_patologicos` (
  `id_antecedente_patologico` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `id_historia_clinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `id_turno` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id_diagnostico` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo` text DEFAULT NULL,
  `id_historia_clinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evoluciones`
--

CREATE TABLE `evoluciones` (
  `id_evolucion` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_historia_clinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitos`
--

CREATE TABLE `habitos` (
  `id_habito` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `id_historia_clinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id_historia_clinica` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_consulta` int(11) DEFAULT NULL,
  `id_profesional` int(11) DEFAULT NULL,
  `motivo_consulta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `id_historia_clinica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mutuales`
--

CREATE TABLE `mutuales` (
  `id_mutual` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `numero_afiliado` int(11) DEFAULT NULL,
  `cobertura` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` text DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_mutual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `documento` int(11) DEFAULT NULL,
  `nombre` text DEFAULT NULL,
  `apellido` text DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `documento`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`, `direccion`) VALUES
(1, 32456456, 'Juan', 'Perez', '1985-05-12', 'juan.perez@example.com', 1167894567, 'Calle Falsa 123'),
(2, 35678945, 'Maria', 'Lopez', '1990-08-25', 'maria.lopez@example.com', 1178945632, 'Avenida Siempre Viva 456'),
(3, 28765432, 'Carlos', 'Gomez', '1978-11-03', 'carlos.gomez@example.com', 1145689321, 'Boulevard 9 de Julio 789'),
(4, 37568954, 'Lucia', 'Diaz', '1995-07-22', 'lucia.diaz@example.com', 1186543210, 'Calle Corrientes 250'),
(5, 31567982, 'Jorge', 'Martinez', '1982-02-15', 'jorge.martinez@example.com', 1167321945, 'Calle San Martin 320'),
(6, 35468712, 'Sofia', 'Fernandez', '1993-12-10', 'sofia.fernandez@example.com', 1198765432, 'Av. Belgrano 670'),
(7, 29876543, 'Pablo', 'Sanchez', '1989-05-29', 'pablo.sanchez@example.com', 1167891234, 'Calle Moreno 850'),
(8, 36789452, 'Ana', 'Rodriguez', '1991-09-17', 'ana.rodriguez@example.com', 1167123456, 'Calle Las Heras 450'),
(9, 31546897, 'Diego', 'Gonzalez', '1987-03-02', 'diego.gonzalez@example.com', 1145789632, 'Avenida Callao 350'),
(10, 32478569, 'Laura', 'Moreno', '1984-06-23', 'laura.moreno@example.com', 1167543210, 'Calle Lavalle 300'),
(11, 34879654, 'Fernando', 'Ruiz', '1992-01-16', 'fernando.ruiz@example.com', 1156789432, 'Calle Mitre 430'),
(12, 37895432, 'Gabriela', 'Silva', '1990-10-18', 'gabriela.silva@example.com', 1198763214, 'Calle Tucuman 290'),
(13, 31256789, 'Marcos', 'Cabrera', '1986-08-14', 'marcos.cabrera@example.com', 1167896543, 'Calle Moreno 560'),
(14, 36457823, 'Natalia', 'Torres', '1988-11-05', 'natalia.torres@example.com', 1178943210, 'Av. Rivadavia 780'),
(15, 30246789, 'Lucas', 'Ramirez', '1991-04-21', 'lucas.ramirez@example.com', 1167548932, 'Calle Caseros 590'),
(16, 31897654, 'Julieta', 'Acosta', '1994-12-19', 'julieta.acosta@example.com', 1167892145, 'Calle Independencia 210'),
(17, 37985412, 'Martin', 'Villalba', '1983-07-28', 'martin.villalba@example.com', 1178932145, 'Calle Entre Rios 620'),
(18, 32784512, 'Florencia', 'Castro', '1989-03-13', 'florencia.castro@example.com', 1167892143, 'Calle Luro 340'),
(19, 31546789, 'Gustavo', 'Iglesias', '1985-11-11', 'gustavo.iglesias@example.com', 1156789432, 'Calle Cordoba 370'),
(20, 34678912, 'Patricia', 'Garcia', '1992-05-04', 'patricia.garcia@example.com', 1198765432, 'Calle Santa Fe 680'),
(21, 42125797, 'Alex', 'Corales', '2000-01-11', 'alexcorales21@gmail.com', 2147483647, 'Barrio serranias puntanas mnz 171 casa 18'),
(22, 42125791, 'Alex', 'Corales', '2000-01-11', 'alexcorales2@gmail.com', 2147483647, 'Barrio serranias puntanas mnz 171 casa 18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id_profesional` int(11) NOT NULL,
  `matricula` text DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales_especialidades`
--

CREATE TABLE `profesionales_especialidades` (
  `id_profesionale_especialidade` int(11) NOT NULL,
  `id_profesional` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`) VALUES
(1, 'alexcorales21@gmail.com', '110100');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `id_profesional` (`id_profesional`);

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
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_paciente` (`id_paciente`);

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
  ADD KEY `id_paciente` (`id_paciente`),
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
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id_profesional`),
  ADD UNIQUE KEY `matricula` (`matricula`) USING HASH,
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_usuario` (`id_usuario`);

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
  ADD KEY `id_agenda` (`id_agenda`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `id_alergia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `antecedentes_patologicos`
--
ALTER TABLE `antecedentes_patologicos`
  MODIFY `id_antecedente_patologico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  MODIFY `id_evolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitos`
--
ALTER TABLE `habitos`
  MODIFY `id_habito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id_historia_clinica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mutuales`
--
ALTER TABLE `mutuales`
  MODIFY `id_mutual` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  MODIFY `id_profesional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesionales_especialidades`
--
ALTER TABLE `profesionales_especialidades`
  MODIFY `id_profesionale_especialidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `agendas_ibfk_1` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`);

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
  ADD CONSTRAINT `historias_clinicas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `historias_clinicas_ibfk_2` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`),
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
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`id_mutual`) REFERENCES `mutuales` (`id_mutual`);

--
-- Filtros para la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD CONSTRAINT `profesionales_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  ADD CONSTRAINT `profesionales_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `profesionales_especialidades`
--
ALTER TABLE `profesionales_especialidades`
  ADD CONSTRAINT `profesionales_especialidades_ibfk_1` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`),
  ADD CONSTRAINT `profesionales_especialidades_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agendas` (`id_agenda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
