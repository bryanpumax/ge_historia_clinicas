-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2023 at 10:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab_hospita`
--

-- --------------------------------------------------------

--
-- Table structure for table `alergias`
--

CREATE TABLE `alergias` (
  `id_alergias` int(11) NOT NULL,
  `alergias` varchar(100) NOT NULL,
  `gravedad` varchar(100) NOT NULL,
  `cedula_paciente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `alergias`
--

INSERT INTO `alergias` (`id_alergias`, `alergias`, `gravedad`, `cedula_paciente`) VALUES
(6, '  Alergia al látex', 'Moderada', '1720836400'),
(7, ' Alergia al polen', 'Grave', '1720836400'),
(8, '  Alergia a la pera', 'Moderada', '1720836400'),
(9, '  Alergia al huevo', 'Leve', '1720836400');

-- --------------------------------------------------------

--
-- Table structure for table `antecedentes_paciente`
--

CREATE TABLE `antecedentes_paciente` (
  `id_antecedentes` int(11) NOT NULL,
  `tipo_enfermedad` varchar(100) NOT NULL,
  `fecha_dianostico` date NOT NULL,
  `tratamiento_recibido` varchar(500) NOT NULL,
  `estado_actual` varchar(100) NOT NULL,
  `parentesco_familiar` varchar(100) NOT NULL,
  `nombre_familiar` varchar(100) NOT NULL,
  `antecedentes_enf_familia` varchar(100) NOT NULL,
  `cedula_paciente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `antecedentes_paciente`
--

INSERT INTO `antecedentes_paciente` (`id_antecedentes`, `tipo_enfermedad`, `fecha_dianostico`, `tratamiento_recibido`, `estado_actual`, `parentesco_familiar`, `nombre_familiar`, `antecedentes_enf_familia`, `cedula_paciente`) VALUES
(1, 'Diabetis', '2023-05-03', 'Nada', 'No activa', 'Madre', 'Mercedes', 'Diabetis', '1720836400'),
(2, 'Anemia ', '2023-03-30', 'ibuprofeno', 'leve', 'Padre', 'walter', 'Anemia ', '1720836400');

-- --------------------------------------------------------

--
-- Table structure for table `atencion`
--

CREATE TABLE `atencion` (
  `id_atencion` int(11) NOT NULL,
  `cedula_paciente` varchar(10) NOT NULL,
  `cedula_medico` varchar(15) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `estado_paciente_inicio` varchar(120) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_registrada` date NOT NULL,
  `hora_registrada` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL,
  `cedula_contacto` varchar(10) NOT NULL,
  `nombre_contacto` varchar(80) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `parentesco` varchar(10) NOT NULL,
  `cedula_paciente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_examen`
--

CREATE TABLE `detalle_examen` (
  `id_det_examen` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `id_pr_medica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `especialidad`) VALUES
(1, 'Anestesiología'),
(2, 'Cardiología'),
(3, 'Dermatología'),
(4, 'Endocrinología'),
(5, 'Gastroenterología'),
(6, 'Geriatría'),
(7, 'Ginecología'),
(8, 'Hematología'),
(9, 'Infectología'),
(10, 'Medicina de Emergencia'),
(11, 'Medicina Familiar'),
(12, 'Medicina Física y Rehabilitación'),
(13, 'Medicina Interna'),
(14, 'Neurología'),
(15, 'Obstetricia'),
(16, 'Oncología'),
(17, 'Oftalmología'),
(18, 'Ortopedia'),
(19, 'Otorrinolaringología'),
(20, 'Pediatría'),
(21, 'Psiquiatría'),
(22, 'Radiología'),
(23, 'Reumatología'),
(24, 'Urología');

-- --------------------------------------------------------

--
-- Table structure for table `examen`
--

CREATE TABLE `examen` (
  `id_examen` int(11) NOT NULL,
  `id_atencion` int(11) NOT NULL,
  `descripcion_examen` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `cedula_medico` varchar(15) NOT NULL,
  `nombre_medico` varchar(100) NOT NULL,
  `sexo_medico` varchar(30) NOT NULL,
  `telefono_medico` varchar(10) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `estado_medico` varchar(25) NOT NULL DEFAULT 'Disponible' COMMENT 'co-consultorio\r\nEm->Emergencia\r\nHp->hospitalizacion\r\nQr->Quirofano\r\nCa->Casa'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, `id_especialidad`, `estado_medico`) VALUES
('2300514045', 'VEINTIMILLA JAPON KERLY ANAHI', 'FEMENINO', '0963245614', 7, 'Qr');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `archivo` varchar(50) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`, `icono`, `archivo`, `id_rol`) VALUES
(2, 'Atencion', 'fa-sharp fa-solid fa-bed fa-beat', 'paciente', 2);

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `cedula_paciente` varchar(10) NOT NULL,
  `nombre_paciente` varchar(120) NOT NULL,
  `sexo_paciente` varchar(30) NOT NULL,
  `fecha_nacimiento` varchar(25) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `tipo_sangre` varchar(25) NOT NULL,
  `telefono_paciente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`cedula_paciente`, `nombre_paciente`, `sexo_paciente`, `fecha_nacimiento`, `estado_civil`, `tipo_sangre`, `telefono_paciente`) VALUES
('1', '', '', '', 'soltero', '', ''),
('1234567890', 'SAD', 'MASCULINO', '2023-05-14', 'SOLTERO/A', 'O ', '1234567890'),
('1720836400', 'BONILLA CNEJO BRYAN RICARDO', 'MASCULINO', '1997-08-08', 'SOLTERO/A', 'AB-', '0959113935');

-- --------------------------------------------------------

--
-- Table structure for table `Prueba_medica`
--

CREATE TABLE `Prueba_medica` (
  `id_pr_medica` int(11) NOT NULL,
  `prueba_medica` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'doctor'),
(2, 'enfermero'),
(3, 'administrador'),
(4, 'programador');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_atencion`
--

CREATE TABLE `tipo_atencion` (
  `id_tipo` int(11) NOT NULL,
  `tipo_atencion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `tipo_atencion`
--

INSERT INTO `tipo_atencion` (`id_tipo`, `tipo_atencion`) VALUES
(1, 'nivel de prevención'),
(2, 'nivel de diagnostico y tratamiento'),
(3, 'nivel de quirúrgicas específicas');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `cedula_usu` varchar(10) NOT NULL,
  `nombre_usu` varchar(120) NOT NULL,
  `estado_usu` varchar(5) NOT NULL,
  `usuario_usuario` varchar(120) NOT NULL,
  `contrase` varchar(120) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `cedula_usu`, `nombre_usu`, `estado_usu`, `usuario_usuario`, `contrase`, `id_rol`) VALUES
(1, '1720836400', 'Bryan Bonilla', 'A', '1720836400', 'e807f1fcf82d132f9bb018ca6738a19f', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`id_alergias`),
  ADD KEY `paciente_alergias_fk` (`cedula_paciente`);

--
-- Indexes for table `antecedentes_paciente`
--
ALTER TABLE `antecedentes_paciente`
  ADD PRIMARY KEY (`id_antecedentes`),
  ADD KEY `paciente_antecedentes_paciente_fk` (`cedula_paciente`);

--
-- Indexes for table `atencion`
--
ALTER TABLE `atencion`
  ADD PRIMARY KEY (`id_atencion`),
  ADD KEY `tipo_atencion_atencion_fk` (`id_tipo`),
  ADD KEY `medico_atencion_fk` (`cedula_medico`),
  ADD KEY `paciente_atencion_fk` (`cedula_paciente`),
  ADD KEY `usuario_atencion_fk` (`id_usuario`);

--
-- Indexes for table `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `paciente_contacto_fk` (`cedula_paciente`);

--
-- Indexes for table `detalle_examen`
--
ALTER TABLE `detalle_examen`
  ADD PRIMARY KEY (`id_det_examen`),
  ADD KEY `prueba_medica_detalle_examen_fk` (`id_pr_medica`),
  ADD KEY `examen_detalle_examen_fk` (`id_examen`);

--
-- Indexes for table `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indexes for table `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id_examen`),
  ADD KEY `atencion_examen_fk` (`id_atencion`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`cedula_medico`),
  ADD KEY `especialidad_medico_fk` (`id_especialidad`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `rol_menu_fk` (`id_rol`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cedula_paciente`);

--
-- Indexes for table `Prueba_medica`
--
ALTER TABLE `Prueba_medica`
  ADD PRIMARY KEY (`id_pr_medica`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `tipo_atencion`
--
ALTER TABLE `tipo_atencion`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `rol_usuario_fk` (`id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alergias`
--
ALTER TABLE `alergias`
  MODIFY `id_alergias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `antecedentes_paciente`
--
ALTER TABLE `antecedentes_paciente`
  MODIFY `id_antecedentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `atencion`
--
ALTER TABLE `atencion`
  MODIFY `id_atencion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detalle_examen`
--
ALTER TABLE `detalle_examen`
  MODIFY `id_det_examen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `examen`
--
ALTER TABLE `examen`
  MODIFY `id_examen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Prueba_medica`
--
ALTER TABLE `Prueba_medica`
  MODIFY `id_pr_medica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipo_atencion`
--
ALTER TABLE `tipo_atencion`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alergias`
--
ALTER TABLE `alergias`
  ADD CONSTRAINT `paciente_alergias_fk` FOREIGN KEY (`cedula_paciente`) REFERENCES `paciente` (`cedula_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `antecedentes_paciente`
--
ALTER TABLE `antecedentes_paciente`
  ADD CONSTRAINT `paciente_antecedentes_paciente_fk` FOREIGN KEY (`cedula_paciente`) REFERENCES `paciente` (`cedula_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `atencion`
--
ALTER TABLE `atencion`
  ADD CONSTRAINT `medico_atencion_fk` FOREIGN KEY (`cedula_medico`) REFERENCES `medico` (`cedula_medico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `paciente_atencion_fk` FOREIGN KEY (`cedula_paciente`) REFERENCES `paciente` (`cedula_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipo_atencion_atencion_fk` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_atencion` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_atencion_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `paciente_contacto_fk` FOREIGN KEY (`cedula_paciente`) REFERENCES `paciente` (`cedula_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalle_examen`
--
ALTER TABLE `detalle_examen`
  ADD CONSTRAINT `examen_detalle_examen_fk` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_medica_detalle_examen_fk` FOREIGN KEY (`id_pr_medica`) REFERENCES `Prueba_medica` (`id_pr_medica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `atencion_examen_fk` FOREIGN KEY (`id_atencion`) REFERENCES `atencion` (`id_atencion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `especialidad_medico_fk` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `rol_menu_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `rol_usuario_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
