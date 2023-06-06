-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 06, 2023 at 11:27 PM
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
(3, ' Alergia al polen', 'Moderada', '1720836400'),
(4, '  Alergia al moho', 'Leve', '0100421213'),
(5, '  Alergia al látex', 'Moderada', '1709694846'),
(6, '  Alergia al maíz', 'Moderada', '1307748051');

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
(3, 'Diabetis', '2023-05-05', 'Nada', 'No activa', 'Ninguno', 's/n', 'Diabetis', '1304812306'),
(4, 'Diabetis', '2023-05-24', 'Nada', 'No activa', 'Abuelo/a', 'Mercedes', 'Diabetis', '1720836400'),
(5, 'Anemia', '2011-06-09', 'Ninguno', 'Avanzado', 'Madre', 'Maria Perez', 'Anemia', '0100421213'),
(6, 'Diabetes', '2014-06-06', 'Normal', 'Cronico', 'Padre', 'José Mina', 'Diabetes', '1709694846');

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
  `fecha_registrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `atencion`
--

INSERT INTO `atencion` (`id_atencion`, `cedula_paciente`, `cedula_medico`, `id_usuario`, `id_tipo`, `estado_paciente_inicio`, `descripcion`, `fecha_inicio`, `fecha_fin`, `fecha_registrada`) VALUES
(1, '1720836400', '2300514045', 1, 2, ' diagnostico y tratamiento', '', '2023-05-24', '2023-05-24', '2023-05-24'),
(3, '1304812306', '1720836400', 1, 5, 'Casa', 'le  duele  estomago  por  intoxicacion de  marisco', '2023-06-05', '2023-06-05', '2023-05-24'),
(4, '2350327306', '1720836400', 1, 3, ' diagnostico y tratamiento', 'operacion craneal amputacion de miembros inferiores y reconstruccion  superiores ', '2023-06-06', '2023-06-06', '2023-05-24'),
(5, '0100421213', '1720836400', 1, 2, ' diagnostico y tratamiento', '', '2023-06-06', '2023-06-06', '2023-06-06'),
(6, '1709694846', '1720836400', 1, 5, 'Casa', 'Tos', '2023-06-06', '2023-06-06', '2023-06-06'),
(7, '1307748051', '1720836400', 1, 5, 'Casa', '', '2023-06-06', '2023-06-06', '2023-06-06');

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
  `observacionn` varchar(300) NOT NULL,
  `id_pr_medica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `detalle_examen`
--

INSERT INTO `detalle_examen` (`id_det_examen`, `id_examen`, `observacionn`, `id_pr_medica`) VALUES
(4, 2, '', 109),
(5, 2, '', 1),
(6, 2, '', 3),
(7, 2, '', 14),
(8, 3, '', 100),
(9, 3, '', 37),
(10, 3, '', 232);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_tratamiento`
--

CREATE TABLE `detalle_tratamiento` (
  `id_detalle_tratamiento` int(11) NOT NULL,
  `id_tratamiento` int(11) NOT NULL,
  `hora_consumo` varchar(50) NOT NULL,
  `id_medicamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `detalle_tratamiento`
--

INSERT INTO `detalle_tratamiento` (`id_detalle_tratamiento`, `id_tratamiento`, `hora_consumo`, `id_medicamento`) VALUES
(1, 1, '7 am  13 pm  22 pm', 398),
(3, 2, '7 am  13 pm  22 pm', 90),
(5, 3, '7 am  13 pm  22 pm', 523),
(8, 5, '7 am  13 pm  22 pm', 15),
(9, 5, '7 am  13 pm  22 pm', 582),
(10, 6, 'Cada 8 horas', 220),
(11, 6, 'Cada 8 horas', 227),
(12, 6, 'Cada 8 horas', 218);

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

--
-- Dumping data for table `examen`
--

INSERT INTO `examen` (`id_examen`, `id_atencion`, `descripcion_examen`) VALUES
(2, 3, 'Embarazo'),
(3, 7, 'Embarazo');

-- --------------------------------------------------------

--
-- Table structure for table `medicamento`
--

CREATE TABLE `medicamento` (
  `id_medicamento` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` longtext NOT NULL,
  `forma` longtext NOT NULL,
  `concentracion` longtext NOT NULL,
  `viaadmin` longtext NOT NULL,
  `indicaciones` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `codigo`, `descripcion`, `forma`, `concentracion`, `viaadmin`, `indicaciones`) VALUES
(1, 'Código', 'Descripción', 'Forma', 'Concentración', 'Vía Adm.', 'Indicaciones'),
(2, 'A02AF01', 'Magaldrato con simeticona (Hidróxido de Al y Mg)', 'Liquido oral', '800 mg/10 mL +  60 mg/10 mL', 'O        Oral', 'Antiácido - demulcente: Coadyuvante en el alivio sintomático y temporal de los síntomas relacionados con la hiperacidez ocasional, incluidas dispepsia y pirosis. Antiflatulento: Apoyo en el manejo de los trastornos gastrointestinales asociados a exceso de gas, flatulencias y meteorismo.'),
(3, 'A02BC01', 'Omeprazol', 'Solido oral', '20 mg', 'O        Oral', 'Enfermedad por reflujo gastroesofágico en adultos y niñosEsofagitis erosiva o no erosiva en adultos y niños Esófago de Barret con o sin estenosis esofágica Erradicación de Helicobacter pylori Enfermedad de úlcera péptica duodenales o gástricas de cualquier etiología Síndrome de Zollinger-Ellison (gastrinoma) Hipersecreción ácida nocturna o diurna'),
(4, 'A02BC01', 'Omeprazol', 'Solido oral (polvo)', '10 mg/5 mL', 'O        Oral', 'Enfermedad por reflujo gastroesofágico en adultos y niñosEsofagitis erosiva o no erosiva en adultos y niños Esófago de Barret con o sin estenosis esofágica Erradicación de Helicobacter pylori Enfermedad de úlcera péptica duodenales o gástricas de cualquier etiología Síndrome de Zollinger-Ellison (gastrinoma) Hipersecreción ácida nocturna o diurna'),
(5, 'A02BC01', 'Omeprazol', 'Solido parenteral', '40 mg', 'P         Parenteral', 'Enfermedad por reflujo gastroesofágico en adultos y niñosEsofagitis erosiva o no erosiva en adultos y niños Esófago de Barret con o sin estenosis esofágica Erradicación de Helicobacter pylori Enfermedad de úlcera péptica duodenales o gástricas de cualquier etiología Síndrome de Zollinger-Ellison (gastrinoma) Hipersecreción ácida nocturna o diurna'),
(6, 'A03BA01', 'Atropina', 'Liquido parenteral', '1 mg/mL', 'P         Parenteral', 'Indicación general:Alivio sintomático de trastornos gastro-intestinales caracterizados por espasmo del músculo liso, premedicación anestésica.Tratamiento de arritmias cardíacas y bradicardia sinusal asociada o no a medicamentos como propofol. Bradicardia transoperatoria. Antídoto:Intoxicación por organofosforados y carbamatos.Coadyuvante de neostigmina para revertir bloqueo neuromuscular no despolarizante. Tratamiento de sobredosis por parasimpaticomiméticos.'),
(7, 'A03BB01', 'Butilescopolamina(N-butilbromuro de hioscina)', 'Liquido parenteral', '20 mg/mL', 'P         Parenteral', 'Indicación general: Antiespasmódico (vías biliares, intestino y vías urinarias), al disminuir el peristaltismo ayuda a mejorar la calidad de imagen y visualizacion de estructuras en estudios de RM abdominal y TAC.'),
(8, 'A03FA01', 'Metoclopramida', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general:Náusea y vómito de causa conocida, postquirúrgico o inducido por quimioterapia y radioterapia. Gastroparesia, reflujo gastro - esofágico, vaciamiento gástrico lento, hipo.Coadyuvante para intubación gastrointestinal o radiografías de contraste del tubo gastrointestinal.'),
(9, 'A03FA01', 'Metoclopramida', 'Solido oral', '10 mg', 'O        Oral', 'Indicación general:Náusea y vómito de causa conocida, postquirúrgico o inducido por quimioterapia y radioterapia. Gastroparesia, reflujo gastro - esofágico, vaciamiento gástrico lento, hipo.Coadyuvante para intubación gastrointestinal o radiografías de contraste del tubo gastrointestinal.'),
(10, 'A04AA01', 'Ondansetrón', 'Liquido parenteral', '2 mg/mL', 'P         Parenteral', 'Indicación general: Profilaxis y manejo de la náusea y el vómito inducidos por quimioterapia con medicamentos citotóxicos de riesgo emético moderado y alto.Profilaxis y manejo de la náusea y el vómito inducidos por radioterapia. Alternativa para el vómito postoperatorio.Prurito causado por colestasis u opioides. '),
(11, 'A04AA01', 'Ondansetrón', 'Solido oral', '4 mg y 8 mg', 'O        Oral', 'Indicación general: Profilaxis y manejo de la náusea y el vómito inducidos por quimioterapia con medicamentos citotóxicos de riesgo emético moderado y alto.Profilaxis y manejo de la náusea y el vómito inducidos por radioterapia. Alternativa para el vómito postoperatorio.Prurito causado por colestasis u opioides. '),
(12, 'A04AD12', 'Aprepitant', 'Solido oral', '80 mg y 125 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB:  Prevención de las náuseas y los vómitos que se asocian con la quimioterapia antineoplásica y altamente emetógena. 11a rev.'),
(13, 'A06AD11', 'Lactulosa', 'Liquido oral', '65 %', 'O        Oral', 'Indicación general:Estreñimiento. Encefalopatía hepática, excepto en niños.'),
(14, 'A06AD65', 'Macrogol (polietilenglicol) en combinaciones', 'Solido oral (granulado)', '', 'O        Oral', 'Indicación general:Preparación para endoscopias, colonoscopias, cirugía de abdomen, estudios de imagen con medios de contraste. Constipación crónica. Impactación fecal sin obstrucción intestinal. Antídoto:Puede considerarse para ingestiones potencialmente tóxicas de medicamentos de liberación sostenida o con cubierta entérica como el ácido valproico, teofilina, ácido acetil salicilico, verapamilo, diltiazem, medicamentos que no se adsorben con carbón activado como el litio, potasio y hierro, y para la eliminación de drogas ilícitas que son transportados en \"packer\" o \"stuffers\".'),
(15, 'A06AG04', 'Glicerol', 'Solido rectal', '0,88 g - 3 g', 'R          Rectal', 'Indicación general: Estreñimiento o impactación fecal si los laxantes orales no han sido útiles.'),
(16, 'A07AA02', 'Nistatina', 'Liquido oral', '100.000 UI/mL', 'O        Oral', 'Indicación general:Tratamiento de candidiasis orofaringea, esofágica e intestinal.    '),
(17, 'A07BA01', 'Carbón medicinal (activado)', 'Solido oral (polvo)', '', 'O        Oral', 'Antídoto: Descontaminación gastrointestinal en la mayoría de las intoxicaciones, puede usarse en dosis única, dosis repetidas (multidosis) o combinarse con otros métodos.'),
(18, 'A07CA', 'Sales de rehidratación oral', 'Solido oral (polvo)', 'Glucosa  13,5 g/L - 20 g/L Cloruro de Sodio  2,6 g/L - 3,5 g/L Cloruro de Potasio   1,5 g/L Citrato trisódico dihidrato  2,9 g/L Nota: se pueden adherir otros elementos como el zinc, siempre y cuando se cumplan con los requerimientos aquí detallados', 'O        Oral', 'Indicación general: Terapia de Rehidratación Oral (TRO), en niños y adultos, con deshidratación por vómito y diarrea.'),
(19, 'A07DA03', 'Loperamida', 'Solido oral', '2 mg', 'O        Oral', 'Indicación general:Diarrea crónica. Diarrea aguda del viajero.'),
(20, 'A07EC01', 'Sulfasalazina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general:Colitis ulcerosa. Enfermedad de Crohn. Artritis reumatoide.'),
(21, 'A07EC02', 'Mesalazina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada.'),
(22, 'A07EC02', 'Mesalazina', 'Solido oral (polvo)', '1 g y 2 g', 'O        Oral', 'Indicación exclusiva: Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada.'),
(23, 'A07EC02', 'Mesalazina', 'Solido rectal', '1 g', 'R          Rectal', 'Indicación exclusiva: Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada.'),
(24, 'A07EC02', 'Mesalazina', 'Liquido rectal', '1 g - 4 g', 'R          Rectal', 'Indicación exclusiva: Tratamiento de la fase aguda de la colitis ulcerosa leve a moderada.'),
(25, 'A09AA02', 'Multienzimas  (lipasa, proteasa, amilasa)', 'Solido oral ( capsula con microesferas gastroresistentes)', 'Pancreatina: 150 mg (Amilasa: 8.000 UI Lipasa: 10.000 UI Proteasa: 600 UI) Nota: se consideran equivalentes las unidades de la farmacopea europea (U.Ph.Eur) y unidades de la farmacopea americana (USP)', 'O        Oral', 'Indicación exclusiva: Insuficiencia pancreática exócrina provocada por fibrosis quística, pancreatitis crónica, pancreatectomía, gastrectomía total y resecciones gástricas parciales, obstrucción de conductos por neoplasias. Malformaciones de la vía biliar en neonatos.'),
(26, 'A10AB01', 'Insulina humana  (acción rápida)', 'Liquido parenteral', '100 UI/mL', 'P         Parenteral', 'Indicación general:Diabetes mellitus (tipo I y II). Diabetes mellitus gestacional.'),
(27, 'A10AB04', 'Insulina Ultrarápida (lispro)', 'Liquido parenteral (plumas/cartuchos )', '100 UI/mL', 'P         Parenteral', 'Indicación exclusiva: Pacientes adultos y niños con diabetes tipo  I.Pacientes con diabetes mellitus gestacional.'),
(28, 'A10AB05', 'Insulina Ultrarápida (asparta)', 'Liquido parenteral', '100 UI/mL', 'P         Parenteral', 'Indicación exclusiva:Pacientes adultos y niños con diabetes tipo  I.Pacientes con diabetes mellitus gestacional.'),
(29, 'A10AB05', 'Insulina Ultrarápida (asparta)', 'Liquido parenteral (plumas/cartuchos )', '100 UI/mL', 'P         Parenteral', 'Indicación exclusiva:Pacientes adultos y niños con diabetes tipo  I.Pacientes con diabetes mellitus gestacional.'),
(30, 'A10AC01', 'Insulina humana NPH  (acción intermedia)', 'Liquido parenteral', '100 UI/mL', 'P         Parenteral', 'Indicación general:Diabetes tipo 1.Diabetes tipo 2.Diabetes mellitus gestacional.Coadyuvante en estados hiperglicémicos.  '),
(31, 'A10AE04', 'Insulina Glargina', 'Liquido parenteral', '100 UI/mL', 'P         Parenteral', 'Indicación exclusiva: Diabetes mellitus tipo 1.Diabetes mellitus tipo 2 en insulinoterapia con NPH que presentan riesgo de hipoglicemia severa (Hipoglicemia severa: una hipoglicemia que requiere ayuda de otra persona para superarla).'),
(32, 'A10AE04', 'Insulina Glargina', 'Liquido parenteral (plumas/cartuchos )', '100 UI/mL', 'P         Parenteral', 'Indicación exclusiva: Diabetes mellitus tipo 1.Diabetes mellitus tipo 2 en insulinoterapia con NPH que presentan riesgo de hipoglicemia severa (Hipoglicemia severa: una hipoglicemia que requiere ayuda de otra persona para superarla).'),
(33, 'A10BA02', 'Metformina', 'Solido oral', '500 mg - 1000 mg', 'O        Oral', 'Indicación general: Terapia farmacológica inicial y preferida para el tratamiento de la diabetes mellitus tipo 2 en niños y adultos.'),
(34, 'A10BB09', 'Gliclazida', 'Solido parenteral (Liberacion prolongada)', '30 mg y 60 mg', 'O        Oral', 'Indicación exclusiva: Diabetes mellitus tipo 2, cuando metformina en monoterapia a dosis máxima no es suficiente para lograr control glicémico individualizado.'),
(35, 'A10BK01', 'Dapagliflozina', 'Solido oral', '10 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tercer escalón de tratamiento en pacientes con insuficiencia cardíaca con fracción de eyección pese a tratamiento médico óptimo, con o sin diabetes mellitus, y tasa de filtración glomerular superior a los valores bajo los cuales estaría contraindicado su uso.'),
(36, 'A10BK03', 'Empagliflozina', 'Solido oral', '10 mg - 25 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tercer escalón de tratamiento en pacientes con insuficiencia cardíaca con fracción de eyección pese a tratamiento médico óptimo, con o sin diabetes mellitus, y tasa de filtración glomerular superior a los valores bajo los cuales estaría contraindicado su uso.'),
(37, 'A11AA03', 'Multivitaminas y otros minerales, incluido combinaciones: •Tiamina (Vitamina B1) •Nicotinamida (Vitamina B3) •Piridoxina (Vitamina B6) •Cianocobalamina  (Vitamina B12) •Ácido ascórbico  (Vitamina C) •Vitamina A •Zinc', 'Liquido oral (jarabe/gotas)', 'Tiamina 0,5 - 1,2 mg/5 mL  Nicotinamida  6 - 16 mg/5 mL Piridoxina  0,5 - 1 mg/5 mL Cianocobalamina  1 - 2 mcg/5 mL Ácido Ascórbico  15 - 50 mg/5 mL Vitamina A  1.000 - 3. 000 UI/5 mL Zinc  3 - 8 mg/5 mL Nota: se describen los componentes y concentraciones  mínimas necesarios  de esta combinación, se pueden adherir otros micronutrientes, siempre y cuando se cumplan con los requerimientos aquí detallados. Se entiende esta equivalencia de jarabe  para  líquido oral en gotas.', 'O        Oral', 'Indicación general:Uso exclusiva en trastornos por deficiencias nutricionales.'),
(38, 'A11CA01', 'Retinol (Vitamina A)', 'Liquido oral', '50.000 UI', 'O        Oral', 'Indicación exclusiva: Tratamiento y profilaxis de la deficiencia de vitamina A.'),
(39, 'A11CA01', 'Retinol (Vitamina A)', 'Solido oral ( capsula blanda)', '50.000 UI', 'O        Oral', 'Indicación exclusiva: Tratamiento y profilaxis de la deficiencia de vitamina A.'),
(40, 'A11CC04', 'Calcitriol', 'Solido oral', '0,5 mcg', 'O        Oral', 'Indicación general: Hiperparatiroidismo secundario a insuficiencia renal crónica. Hipoparatiroidismo y pseudo hipoparatiroidismo.'),
(41, 'A11DA01', 'Tiamina (Vitamina B1)', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general:Profilaxis y tratamiento de su deficiencia (Beriberi). Profilaxis y tratamiento de la encefalopatía de Wernicke y síndrome de Korsakoff.Tratamiento de enfermedades metabólicas como cetoaciduria y deficiencia de piruvato deshigrogenasa.'),
(42, 'A11DA01', 'Tiamina (Vitamina B1)', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general:Profilaxis y tratamiento de su deficiencia (Beriberi). Profilaxis y tratamiento de la encefalopatía de Wernicke y síndrome de Korsakoff.Tratamiento de enfermedades metabólicas como cetoaciduria y deficiencia de piruvato deshigrogenasa.'),
(43, 'A11DB', 'Complejo B:   Tiamina (Vitamina B1)  Piridoxina (Vitamina B6)   Cianocobalamina  (Vitamina B12)', 'Liquido parenteral', '100 mg  100 mg  1 mg', 'P(IM) Parenteral (Intramuscular)', 'Indicación general:Profilaxis y tratamiento de sus deficiencias: Neuropatía asociada a toxicidad de isoniazida, cicloserina y otros medicamentos. Anemia perniciosa por falta o inhibición del factor intrínseco.'),
(44, 'A11DB', 'Complejo B:  Tiamina (Vitamina B1) Piridoxina (Vitamina B6)  Cianocobalamina  (Vitamina B12)', 'Solido oral', '>= 4 mg >= 1 mg >= 1 mcg', 'O        Oral', 'Indicación general:Profilaxis y tratamiento de sus deficiencias: Neuropatía asociada a toxicidad de isoniazida, cicloserina y otros medicamentos. Anemia perniciosa por falta o inhibición del factor intrínseco.'),
(45, 'A11DB', 'Complejo B:  Tiamina (Vitamina B1) Piridoxina (Vitamina B6)  Cianocobalamina  (Vitamina B12)', 'Solido parenteral', '200 mg  50 mg  0,03 mg Nota: se pueden adherir otras vitaminas del complejo B, siempre y cuando se cumplan con los requerimientos aquí detallados.', 'P(IV)  Parenteral (Intravenosa)', 'Indicación general:Profilaxis y tratamiento de sus deficiencias: Neuropatía asociada a toxicidad de isoniazida, cicloserina y otros medicamentos. Anemia perniciosa por falta o inhibición del factor intrínseco.'),
(46, 'A11GA01', 'Ácido ascórbico (Vitamina C)', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Indicación general:Deficiencia de ácido ascórbico (Escorbuto).'),
(47, 'A11HA02', 'Piridoxina (Vitamina B6)', 'Liquido parenteral', '150 mg/mL', 'P         Parenteral', 'Indicación general:Profilaxis y tratamiento de su deficiencia.Prevenir y tratar neuropatía asociada a toxicidad de isoniazida, cicloserina y otros medicamentos. Síndrome de dependencia a la piridoxina. Crisis convulsiva en neonatos, lactantes y menores de 3 años.'),
(48, 'A11HA02', 'Piridoxina (Vitamina B6)', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general:Profilaxis y tratamiento de su deficiencia.Prevenir y tratar neuropatía asociada a toxicidad de isoniazida, cicloserina y otros medicamentos. Síndrome de dependencia a la piridoxina. Crisis convulsiva en neonatos, lactantes y menores de 3 años.'),
(49, 'A11JA', 'Combinaciones de vitaminas compatibles con NPT', 'Liquido parenteral/Solido parenteral', '', 'P         Parenteral', 'Indicación general:En pacientes adultos y niños para cubrir las necesidades diarias de vitaminas en nutrición parenteral cuando no es posible usar la vía oral.  '),
(50, 'A12AA03', 'Gluconato de calcio', 'Liquido parenteral', '10 %', 'P         Parenteral', 'Indicación general: Hipocalcemia aguda (tetania por hipocalcemia, hipoparatiroidismo). Paro cardiaco en presencia de hiperkalemia, hipocalcemia o hipermagnesemia. Antídoto:Intoxicación por calcio antagonistas (administrar en caso de que no exista respuesta a la administración de fluidos).'),
(51, 'A12AA04', 'Carbonato de calcio', 'Solido oral', '500 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en mujeres con alto riesgo de preeclampsia, en embarazadas que viven en áreas donde la ingesta de calcio es baja y en pacientes que se encuentran en uso crónico de corticoides.'),
(52, 'A12CB01', 'Sulfato de Zinc', 'Liquido oral', '2 mg/mL y 5 mg/mL', 'O        Oral', 'Indicación general: Déficit de zinc por carencia alimentariao como asplemento en condicciones en las que se pierda zinc (trauma, quemadra, enfermedad de wilson.) Diarrea aguda en niños menores de 5 años.'),
(53, 'A12CB01', 'Sulfato de Zinc', 'Liquido oral', '20 mg/5 mL', 'O        Oral', 'Indicación general: Déficit de zinc por carencia alimentariao como asplemento en condicciones en las que se pierda zinc (trauma, quemadra, enfermedad de wilson.) Diarrea aguda en niños menores de 5 años.'),
(54, 'A12CB01', 'Sulfato de Zinc', 'Solido oral (dispersable)', '20 mg', 'O        Oral', 'Indicación general: Déficit de zinc por carencia alimentariao como asplemento en condicciones en las que se pierda zinc (trauma, quemadra, enfermedad de wilson.) Diarrea aguda en niños menores de 5 años.'),
(55, 'B01AA03', 'Warfarina', 'Solido oral', '1 mg - 5 mg', 'O        Oral', 'Indicación general: Tratamiento y profilaxis de trombosis venosa y trombo embolismo pulmonar.Profilaxis del trombo embolismo en cardiopatía reumática, fibrilación auricular o sustitución de válvulas cardíacas.Mantenimiento de anticoagulación iniciada con heparina u otro anticoagulante.'),
(56, 'B01AB01', 'Heparina (no fraccionada)', 'Liquido parenteral', '5.000 UI/mL', 'P         Parenteral', 'Indicación general: Profilaxis de tromboembolismo, inicio de tratamiento de trombosis venosa profunda y embolia pulmonar. Coadyuvante en el manejo de tromboembolia recurrente a pesar de anticoagulación oral. Pacientes seleccionados que presentan Coagulación Intravascular Diseminada. Infarto agudo de miocardio con elevación del ST.Coadyuvante en el manejo de angina de pecho inestable e infarto de miocardio sin elevación del ST. Mantenimiento de acceso venoso pulmonar, fibrilación auricular con embolismo.'),
(57, 'B01AB05', 'Enoxaparina', 'Liquido parenteral', '2.000 UI - 10.000 UI (20 mg - 100 mg)', 'P         Parenteral', 'Indicación general: Profilaxis de trombosis venosa profunda postoperatoria en cirugías abdominales, en elevación aguda del segmento ST en infarto miocárdico, profilaxis de trombosis venosa profunda en artroplastias cadera, rodilla y tobillo entre otras, profilaxis de trombosis venosa profunda en pacientes con restricción de la movilidad por enfermedades agudas, profilaxis en angina inestable, alternativa para tratamiento de trombosis arterial coronaria aguda, estados hipercoagulables.'),
(58, 'B01AC04', 'Clopidogrel', 'Solido oral', '75 mg y 300 mg', 'O        Oral', 'Indicación general: Síndrome coronario agudo sin elevación del segmento ST.Infarto de miocardio con elevación del segmento ST.Profilaxis de eventos tromboembólicos (arteriales).Prevención secundaria de accidente cerebrovascular. Conjuntamente con ASA: posterior a angioplastia y colocación de endoprótesis coronarias (4-6 semanas mínimo). Prevención de eventos trombóticos y embólicos en pacientes con fibrilación auricular.'),
(59, 'B01AC06', 'Ácido acetilsalicílico', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Antiagregante plaquetario, para profilaxis de eventos trombóticos arteriales: cerebrales y cardiacos. Síndrome coronario agudo.'),
(60, 'B01AC17', 'Tirofibán', 'Liquido parenteral', '0,25 mg/mL', 'P         Parenteral', 'Indicación exclusiva: En pacientes sin elevación del segmento ST y con episodio de dolor torácico de hasta 12 horas de evolución.'),
(61, 'B01AC24', 'Ticagrelor', 'Solido oral', '60 mg  y 90 mg', 'O        Oral', 'Indicación exclusiva: Síndrome coronario agudo en pacientes que requieren revascularización.Pacientes con síndrome coronario agudo en tratamiento a largo plazo con resistencia demostrada a clopidogrel.'),
(62, 'B01AD01', 'Estreptoquinasa', 'Solido parenteral', '1´500.000 UI', 'P         Parenteral', 'Indicación general: Infarto agudo de miocardio.Tromboembolia pulmonar.Tromboembolismo arterial y venoso agudo.'),
(63, 'B01AD02', 'Alteplasa', 'Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación exclusiva: Ictus isquémico agudo entre las 3 a 4 horas y media del inicio de los síntomas. Infarto agudo de miocardio. Tromboembolismo pulmonar agudo masivo.'),
(64, 'B01AF01', 'Rivaroxabán', 'Solido oral', '2,5 mg  - 20 mg', 'O        Oral', 'Indicación exclusiva:Anticoagulación en pacientes con mayor riesgo de hemorragia o resistencia a warfarina.'),
(65, 'B02AA02', 'Ácido tranexámico', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Indicación general: Tratamiento y profilaxis de hemorragia asociada a hiperfibrinolisis excesiva. Profilaxis de angioedema hereditario. Profilaxis de hemorragia Postparto. Prevención de mortalidad en pacientes con shock traumático hemorrágico.Epistaxis.Superficie sangrante de tumores ulcerados, cavidad nasal y otros órganos (vejiga, útero, recto, estómago y pulmones).'),
(66, 'B02AA02', 'Ácido tranexámico', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Tratamiento y profilaxis de hemorragia asociada a hiperfibrinolisis excesiva. Profilaxis de angioedema hereditario. Profilaxis de hemorragia Postparto. Prevención de mortalidad en pacientes con shock traumático hemorrágico.Epistaxis.Superficie sangrante de tumores ulcerados, cavidad nasal y otros órganos (vejiga, útero, recto, estómago y pulmones).'),
(67, 'B02BA01', 'Fitomenadiona', 'Liquido parenteral', '10 mg/mL', 'P(IV,IM)  Parenteral (Intravenoso/Intramuscular)', 'Indicación general: Profilaxis y tratamiento de hipoprotrombinemia debida a sobredosificación de anticoagulantes cumarínicos e hipovitaminosis K causada por factores limitantes de la absorción o síntesis de vitamina K (obstrucción de las vías biliares, alteraciones intestinales o hepáticas y tras tratamiento prolongado con antibióticos, sulfonamidas o salicilatos); y en profilaxis y tratamiento de enfermedad hemorrágica del recién nacido.'),
(68, 'B02BB01', 'Fibrinógeno Humano  (Factor I)', 'Solido parenteral', '1 g', 'P(IV)  Parenteral (Intravenosa)', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de emergencia para coagulopatías de consumo con hemorragia masiva que amenaza la vida.'),
(69, 'B02BD01', 'Factor de coagulación IX, II, VII y X, en combinación  (complejo de Protrombina Humana)', 'Solido parenteral', 'Factor II (280 -760 UI),  VII (180 - 480 UI), IX (500 UI),  X (360 - 600 UI),  proteína C (260 - 620 UI) y  proteína S (240 - 640 UI)', 'P(IV)  Parenteral (Intravenosa)', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento y profilaxis perioperatoria de las hemorragias en el déficit adquirido de los factores de coagulación del complejo de protrombina, tales como el déficit causado por el tratamiento con antagonistas de la vitamina K, o en caso de sobredosis de antagonistas de la vitamina K, cuando se requiere una rápida corrección del déficit.'),
(70, 'B02BD02', 'Factor de coagulación VIII Plasmático', 'Solido parenteral', '250 UI - 2.000 UI', 'P         Parenteral', 'Indicación exclusiva: Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A. .'),
(71, 'B02BD02', 'Factor de coagulación VIII Recombinante', 'Solido parenteral', '250 UI - 2.000 UI', 'P         Parenteral', 'Indicación exclusiva: Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo A. .'),
(72, 'B02BD04', 'Factor de coagulación IX Plasmático', 'Solido parenteral', '250 UI - 1.200 UI', 'P         Parenteral', 'Indicación general: Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo B.'),
(73, 'B02BD04', 'Factor de coagulación IX Recombinante', 'Solido parenteral', '250 UI - 1.200 UI', 'P         Parenteral', 'Indicación general: Tratamiento y profilaxis de episodios hemorrágicos en pacientes con hemofilia tipo B.'),
(74, 'B02BX06', 'Emicizumab', 'Liquido parenteral', '30mg/mL y 150 mg/mL', 'P(SC)  Parenteral (Subcutánea)', 'Emicizumab está indicado para la profilaxis de rutina de los episodios de sangrado en pacientes con: - hemofilia A (deficiencia congénita del factor VIII) con inhibidores del factor VIII - hemofilia A grave (deficiencia congénita del factor VIII, FVIII < 1%) sin inhibidores del factor VIII. Emicizumab puede usarse en todos los grupos de edad.'),
(75, 'B03AA07', 'Sulfato ferroso', 'Liquido oral', '25 mg/mL (equivalente a hierro elemental)', 'O        Oral', 'Indicación general: Profilaxis y tratamiento de anemia ferropénica y secundarias a pérdidas cuando no existan signos de descompensación.'),
(76, 'B03AA07', 'Sulfato ferroso', 'Liquido oral', '25 - 50 mg/5 mL (equivalente a hierro elemental)', 'O        Oral', 'Indicación general: Profilaxis y tratamiento de anemia ferropénica y secundarias a pérdidas cuando no existan signos de descompensación.'),
(77, 'B03AA07', 'Sulfato ferroso', 'Solido oral', '50 mg - 100 mg (equivalente a hierro elemental)', 'O        Oral', 'Indicación general: Profilaxis y tratamiento de anemia ferropénica y secundarias a pérdidas cuando no existan signos de descompensación.'),
(78, 'B03AC', 'Hierro sacarato  (complejo de sacarosa e hidróxido de hierro III)', 'Liquido parenteral', '100 mg/5 mL (equivalente a hierro elemental)', 'P(IV)  Parenteral (Intravenosa)', 'Indicación general: Profilaxis y tratamiento de anemia ferropénica, en casos de intolerancia oral o cuando la misma es inefectiva o impracticable.'),
(79, 'B03AD', 'Sales de hierro + Ácido fólico', 'Solido oral', '60 mg + 400 mcg', 'O        Oral', 'Indicación general: Anemia relacionada con: dieta muy pobre, desnutrición comprobada, embarzo o lactancia.'),
(80, 'B03AE04', 'Hierro, multivitaminas y minerales: •Hierro •Zinc •Vitamina A •Ácido fólico •Ácido ascórbico', 'Solido oral (polvo)', '• 12,5 mg • 5 mg • 300 mcg • 160 mcg • 30 mg', 'O        Oral', 'Indicación general: Suplemento nutricional y en deficiencias vitamínicas.'),
(81, 'B03BB01', 'Ácido fólico', 'Solido oral', '1 mg y 5 mg', 'O        Oral', 'Indicación general: Anemia megaloblástica.Profilaxis durante el embarazo (para prevenir defectos del tubo neural) y lactancia.Deficiencia de ácido fólico.Prevención de los efectos secundarios inducidos por metotrexato en la enfermedad de Crohn severa.Profilaxis en estados hemolíticos crónicos.Profilaxis de la deficiencia de folato en la diálisis.'),
(82, 'B03XA01', 'Eritropoyetina (epoetina)', 'Liquido parenteral/Solido parenteral', '2.000 UI - 30.000 UI', 'P         Parenteral', 'Indicación general: Tratamiento de anemia asociada con insuficiencia renal crónica y en anemia severa asociada con terapia con zidovudina en VIH.Anemia asociada con quimioterapia antineoplásica o con neoplasias.'),
(83, 'B05AA01', 'Albúmina Humana', 'Liquido parenteral', '20 %', 'P         Parenteral', 'Indicación exclusiva:Plasmaféresis.Ascitis refractaria.Recambio plasmático en neonatos.Compensación en caso de trasplantes. '),
(84, 'B05AA06', 'Agentes de gelatina', 'Liquido parenteral', '3,5 %, 4 % y 5,5 %', 'P         Parenteral', 'Indicación general: Utilizado como expansor plasmático en shock hipovolémico; en presentación de film absorbente o esponja, son utilizados como hemostáticos en procedimientos quirúrgicos.'),
(85, 'B05BA01', 'Aminoácidos', 'Liquido parenteral', '10 % y 15 %', 'P         Parenteral', 'Indicación general: Nutrición parenteral total o parcial, su uso es apropiado cuando la vía enteral es desaconsejable, inadecuada o imposible.'),
(86, 'B05BA02', 'Emulsiones grasas (lípidos)', 'Liquido parenteral', '10 % y 20 %', 'P         Parenteral', 'Indicación general: Nutrición parenteral total o parcial, cuando la nutrición oral o enteral es imposible, insuficiente o está contraindicada.'),
(87, 'B05BA03', 'Carbohidratos  (dextrosa en agua)', 'Liquido parenteral', '5 %', 'P         Parenteral', 'Indicación general: Profilaxis y tratamiento de la deshidratación.Vehículo para administrar soluciones electrolíticas o de diversos medicamentos.Tratamiento de hipoglicemia y aporte calórico en nutrición parenteral total o parcial.'),
(88, 'B05BA03', 'Carbohidratos  (dextrosa en agua)', 'Liquido parenteral', '0.1', 'P         Parenteral', 'Indicación general: Profilaxis y tratamiento de la deshidratación.Vehículo para administrar soluciones electrolíticas o de diversos medicamentos.Tratamiento de hipoglicemia y aporte calórico en nutrición parenteral total o parcial.'),
(89, 'B05BA03', 'Carbohidratos  (dextrosa en agua)', 'Liquido parenteral', '0.5', 'P         Parenteral', 'Indicación general: Profilaxis y tratamiento de la deshidratación.Vehículo para administrar soluciones electrolíticas o de diversos medicamentos.Tratamiento de hipoglicemia y aporte calórico en nutrición parenteral total o parcial.'),
(90, 'B05BB02', 'Electrolitos con carbohidratos (dextrosa en solución salina)', 'Liquido parenteral', '5 % + 0,9 %', 'P         Parenteral', 'Indicación general: Tratamiento de deshidratación por vómito y diarrea o por otras causas que produzcan pérdidas de líquidos y electrolitos.Manejo inicial de la hipovolemia por sangrado agudo.Vehículo para administrar diversos medicamentos.'),
(91, 'B05BC01', 'Manitol', 'Liquido parenteral', '20 %', 'P         Parenteral', 'Indicación general: Manejo del edema cerebral e hipertensión intracranealTratamiento de insuficiencia renal aguda (fase oligúrica).Tratamiento inespecífico de algunas intoxicaciones, para aumentar excreción de tóxicos (Etilenglicol, Alcohol metílico y Litio) y glaucoma (cuando no se puede bajar por otros medios).'),
(92, 'B05CB01', 'Cloruro de sodio', 'Liquido parenteral', '0,9 %', 'P         Parenteral', 'Indicación general: Profilaxis y tratamiento de deshidratación y choque de diversa etiología. Manejo inicial de la hipovolemia por sangrado agudoVehículo para administrar diversos medicamentos, adecuado para uso en pacientes con diabetes e indicado en la depleción de sal, lo que puede surgir de las condiciones tales como la gastroenteritis, la cetoacidosis diabética y ascitis.'),
(93, 'B05CB10', 'Combinaciones  (lactato de Ringer)', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Tratamiento de deshidratación.Manejo inicial de la hipovolemia por sangrado agudo, adecuado para uso en pacientes con acidosis diabética.'),
(94, 'B05DB', 'Soluciones hipertónicas  (diálisis peritoneal)', 'Liquido parenteral', '1,5 % - 4,5 %', 'P         Parenteral', 'Indicación general: Diálisis peritoneal en insuficiencia renal crónica terminal.'),
(95, 'B05XA01', 'Cloruro de potasio', 'Liquido parenteral', '2 mEq/mL', 'P         Parenteral', 'Indicación general:Profilaxis y tratamiento de hipokalemia'),
(96, 'B05XA02', 'Bicarbonato de sodio', 'Liquido parenteral', '1 mEq/mL (8,4%)', 'P         Parenteral', 'Indicación general: Tratamiento de acidosis metabólica.Reanimación cardiopulmonar avanzada.Hiperkalemia.Intoxicación por antidepresivos tricíclicos (por la cardiotoxicidad) y en la alcalinización de la orina.'),
(97, 'B05XA03', 'Cloruro de sodio', 'Liquido parenteral', '3,4 mEq/mL (20%)', 'P         Parenteral', 'Indicación general: Profilaxis y tratamiento de hiponatremia.'),
(98, 'B05XA05', 'Sulfato de magnesio (heptahidratado)', 'Liquido parenteral', '0.2', 'P         Parenteral', 'Indicación general: Hipomagnesemia sintomática.Tratamiento de convulsiones asociadas a eclampsia o pre-eclampsia y arritmias graves, (sobre todo en presencia de hipopotasemia y en salvas en taquicardia ventricular rápida).'),
(99, 'B05XX', 'Oligoelementos', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Nutrición parenteral total.'),
(100, 'C01AA05', 'Digoxina', 'Liquido parenteral', '0,25 mg/mL', 'P         Parenteral', 'Indicación general:Fibrilación auricular crónica.Insuficiencia cardíaca con fracción de eyección reducida.'),
(101, 'C01AA05', 'Digoxina', 'Solido oral', '62,5 mcg y 250 mcg', 'O        Oral', 'Indicación general:Fibrilación auricular crónica.Insuficiencia cardíaca con fracción de eyección reducida.'),
(102, 'C01AA05', 'Digoxina', 'Liquido oral', '50 mcg/mL', 'O        Oral', 'Indicación general:Fibrilación auricular crónica.Insuficiencia cardíaca con fracción de eyección reducida.'),
(103, 'C01BD01', 'Amiodarona', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general: Tratamiento de las arritmias graves, cuando no respondan o no toleren otros antiarrítmicos: Taquiarritmias asociadas con el síndrome de Wolff-Parkinson-White. Prevención de la recidiva de la fibrilación y \"flutter\" auricular. Todos los tipos de taquiarritmias de naturaleza paroxística incluyendo: taquicardias supraventricular, nodal y ventricular, fibrilación ventricular.'),
(104, 'C01BD01', 'Amiodarona', 'Solido oral', '200 mg', 'O        Oral', 'Indicación general: Tratamiento de las arritmias graves, cuando no respondan o no toleren otros antiarrítmicos: Taquiarritmias asociadas con el síndrome de Wolff-Parkinson-White. Prevención de la recidiva de la fibrilación y \"flutter\" auricular. Todos los tipos de taquiarritmias de naturaleza paroxística incluyendo: taquicardias supraventricular, nodal y ventricular, fibrilación ventricular.'),
(105, 'C01CA03', 'Norepinefrina', 'Liquido parenteral', '1 mg/mL', 'P         Parenteral', 'Indicación general:Como medida de emergencia en el restablecimiento de la presión arterial en casos de hipotensión aguda, severa. (Ej. feocromocitomectomía, simpatectomía, poliomielitis, raquianestesia, infarto de miocardio, septicemia, transfusión de sangre, anafilaxia y reacciones a medicamentos).Coadyuvante temporal en el tratamiento de la parada cardíaca y de la hipotensión aguda.'),
(106, 'C01CA04', 'Dopamina', 'Liquido parenteral', '40 mg/mL', 'P         Parenteral', 'Indicación general: Choque refractario a la reanimación con líquidos cuando no existe otra alternativa.'),
(107, 'C01CA07', 'Dobutamina', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general:Choque cardiogénico.Insuficiencia cardiaca congestiva.Soporte inotrópico en cirugía cardiaca.Cardiomiopatías. Choque séptico, para prueba diagnóstica especializada (prueba de estrés farmacológico).'),
(108, 'C01CA24', 'Epinefrina (adrenalina)', 'Liquido parenteral', '1 mg/mL', 'P         Parenteral', 'Indicación general: Reanimación cardio-pulmonar.Choque anafiláctico.Angioedema.Broncoespasmo severo (cuando no hay otra alternativa).Es un medicamento de soporte vital.'),
(109, 'C01CA26', 'Efedrina', 'Liquido parenteral', '60 mg/mL', 'P         Parenteral', 'Indicación general:Reversión de hipotensión por anestesia espinal o epidural.'),
(110, 'C01CX08', 'Levosimendán', 'Liquido parenteral', '2.5 mg/mL', 'P(IV)  Parenteral (Intravenosa)', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento a corto plazo de la descompensación aguda severa de la insuficiencia cardiaca donde se considere apropiado un soporte inotrópico.'),
(111, 'C01DA02', 'Trinitrato de glicerilo (nitroglicerina)', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Infarto agudo de miocardio con elevación del segmento ST (IC) en ausencia de hipotensión, especialmente con falla cardiaca. Hipertensión arterial o dolor persistente pese a terapia oral. Síndrome coronario agudo.Para manejo de isquemia cardíaca durante y después de cirugía cardiaca.Insuficiencia cardíaca y angina inestable.'),
(112, 'C01DA08', 'Dinitrato de isosorbida', 'Solido oral (Sublingual)', '5 mg', 'O        Oral', 'Indicación general: Tratamiento de angina de pecho aguda y crónica.'),
(113, 'C01DA14', 'Mononitrato de isosorbida', 'Solido oral', '20 mg', 'O        Oral', 'Indicación general: Tratamiento a largo plazo de la angina de pecho.'),
(114, 'C01EA01', 'Alprostadil', 'Liquido parenteral', '20 mcg/mL y 500 mcg/mL', 'P         Parenteral', 'Indicación exclusiva: Cardiopatías simples o complejas (Cardiopatías Ductus Dependiente) con estenosis severa o atresia pulmonar cuya circulación depende exclusivamente del ductus. Tratamiento sintomático de la arteriopatía oclusiva arterioesclerótica de miembros inferiores en estadios III y IV de Leriche-Fontaine, excluyendo los pacientes candidatos a amputación.'),
(115, 'C01EB10', 'Adenosina', 'Liquido parenteral', '3 mg/mL', 'P         Parenteral', 'Indicación general: Tratamiento de primera elección para reversión rápida a ritmo sinusal de taquicardia paroxística supraventricular, incluyendo la asociada a Síndrome de Wolf-Parkinson-White. Taquicardia RCP.Prueba de estrésAyuda para el diagnóstico de las taquicardias supraventriculares complejas amplias o estrechasSensibilización de las investigaciones electrofisiológicas intra-cavitarias.'),
(116, 'C02AB01', 'Metildopa (levógira)', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Hipertensión durante el embarazo.Hipertensión arterial moderada a severa.'),
(117, 'C02CA04', 'Doxazosina', 'Solido oral', '2 mg y 4 mg', 'O        Oral', 'Indicación general: Coadyuvante en el manejo de la hipertensión arterial resistente.Tratamiento de los signos y síntomas de la hiperplasia prostática benigna.'),
(118, 'C02DB02', 'Hidralazina', 'Liquido parenteral', '20 mg/mL', 'P         Parenteral', 'Indicación general: Tratamiento de hipertensión moderada a severa.Emergencias hipertensiva.Insuficiencia cardíaca (con nitrato de acción prolongada.'),
(119, 'C02DB02', 'Hidralazina', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Tratamiento de hipertensión moderada a severa.Emergencias hipertensiva.Insuficiencia cardíaca (con nitrato de acción prolongada.'),
(120, 'C02DD01', 'Nitroprusiato sódico', 'Liquido parenteral/Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación general: Crisis hipertensiva. Inducción de hipotensión en anestesia general.Insuficiencia cardíaca severa con el objetivo de reducir pre y post carga, incluyendo a aquellas asociadas con infarto de miocardio.'),
(121, 'C03BA04', 'Clortalidona', 'Solido oral', '25 mg y 50 mg', 'O        Oral', 'Indicación general:Tratamiento de hipertensión arterial esencial (medicamento de primera línea).'),
(122, 'C03CA01', 'Furosemida', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general:Hipertensión arterial.Edema agudo de pulmón.Ascitis maligna (junto a espironolactona) asociada a hipertensión portal o a hiperaldosteronismo.Hipercalcemia.'),
(123, 'C03CA01', 'Furosemida', 'Solido oral', '40 mg', 'O        Oral', 'Indicación general:Hipertensión arterial.Edema agudo de pulmón.Ascitis maligna (junto a espironolactona) asociada a hipertensión portal o a hiperaldosteronismo.Hipercalcemia.'),
(124, 'C03DA01', 'Espironolactona', 'Solido oral', '25 mg y 100 mg', 'O        Oral', 'Indicación general:Coadyuvante en el tratamiento de la hipertensión resistente.Insuficiencia cardiaca grave (clases funcionales III-IV de la NYHA).Hiperaldosteronismo primario (síndrome de Conn)Cirrosis hepática con ascitis y edema.Síndrome nefrótico.Edema asociado a insuficiencia cardíaca congestiva.'),
(125, 'C05BB02', 'Polidocanol', 'Liquido parenteral', '3 %', 'P         Parenteral', 'Indicación general: Tratamiento esclerosante de hemorroides.Tratamiento esclerosante de venas varicosas. Telangiectasias.Venas reticulares, no complicadas, en las extremidades inferiores (< 3mm de diámetro).'),
(126, 'C07AA05', 'Propranolol', 'Liquido parenteral', '1 mg/mL', 'P         Parenteral', 'Indicación general: Uso exclusivo en prevención de sangrado de várices esofágicas en pacientes con enfermedad hepática avanzada.'),
(127, 'C07AA05', 'Propranolol', 'Solido oral', '10 mg, 40 mg y 80 mg', 'O        Oral', 'Indicación general: Uso exclusivo en prevención de sangrado de várices esofágicas en pacientes con enfermedad hepática avanzada.'),
(128, 'C07AB03', 'Atenolol', 'Solido oral', '50 mg y 100 mg', 'O        Oral', 'Indicación general:Tratamiento de hipertensión arterial esencial.Terapia en angina de pecho.Prevención secundaria del infarto agudo de miocardio. Arritmias cardiacas.'),
(129, 'C07AG01', 'Labetalol', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Crisis hipertensivasControl de taquiarritmias.'),
(130, 'C07AG01', 'Labetalol', 'Solido oral', '200 mg', 'O        Oral', 'Indicación exclusiva: Crisis hipertensivasControl de taquiarritmias.'),
(131, 'C07AG02', 'Carvedilol', 'Solido oral', '6,25 mg - 25 mg', 'O        Oral', 'Indicación general:Hipertensión esencial.Síndrome de la cardiopatía isquémica: angina crónica estable, isquemia miocárdica silente, angina inestable y disfunción isquémica del ventrículo izquierdo.Tratamiento coadyuvante de la insuficiencia cardiaca sintomática congestiva de moderada a severa.'),
(132, 'C08CA01', 'Amlodipina', 'Solido oral', '5 mg y 10 mg', 'O        Oral', 'Indicación general: Hipertensión arterial.Alternativa para angina crónica estable. Angina vasoespástica (angina de Prinzmetal) y enfermedad arterial coronaria demostrada angiográficamente y en pacientes sin falla cardíaca o Fracción de Eyección menor al 40%. Alivio sintomático de dolor anginoso en pacientes que reciben nitratos y beta bloqueadores o en intolerancia al beta bloqueador en Síndrome Coronario Agudo sin elevación del segmento ST.'),
(133, 'C08CA05', 'Nifedipina', 'Solido oral', '10 mg', 'O        Oral', 'Indicación general:Útero inhibición en labor de parto prematura.'),
(134, 'C08DB01', 'Diltiazem', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Angina estable, crónica Hipertensión Arterial leve y moderada Taquicardia paroxística supraventricular Arritmia auricular.'),
(135, 'C08DB01', 'Diltiazem', 'Solido parenteral', '25 mg', 'P         Parenteral', 'Indicación general: Angina estable, crónica Hipertensión Arterial leve y moderada Taquicardia paroxística supraventricular Arritmia auricular.'),
(136, 'C08DB01', 'Diltiazem', 'Solido oral', '60 mg', 'O        Oral', 'Indicación general: Angina estable, crónica Hipertensión Arterial leve y moderada Taquicardia paroxística supraventricular Arritmia auricular.'),
(137, 'C08DB01', 'Diltiazem', 'Solido oral (liberacion prolongada)', '90 mg y 120 mg', 'O        Oral', 'Indicación general: Angina estable, crónica Hipertensión Arterial leve y moderada Taquicardia paroxística supraventricular Arritmia auricular.'),
(138, 'C09AA02', 'Enalapril', 'Liquido parenteral', '1,25 mg/mL', 'P         Parenteral', 'Indicación general: Tratamiento de hipertensión arterial esencial. Hipertensión reno-vascular refractaria (excepto en estenosis renal bilateral). Insuficiencia cardíaca. Disfunción ventricular izquierda asintomática. Prevención secundaria del infarto agudo de miocardio.Prevención de nefropatía diabética en insulino dependientes.'),
(139, 'C09AA02', 'Enalapril', 'Solido oral', '5 mg, 10 mg y 20 mg', 'O        Oral', 'Indicación general: Tratamiento de hipertensión arterial esencial. Hipertensión reno-vascular refractaria (excepto en estenosis renal bilateral). Insuficiencia cardíaca. Disfunción ventricular izquierda asintomática. Prevención secundaria del infarto agudo de miocardio.Prevención de nefropatía diabética en insulino dependientes.'),
(140, 'C09CA01', 'Losartán', 'Solido oral', '50 mg y 100 mg', 'O        Oral', 'Indicación general: Hipertensión arterial (alternativa a enalapril). Nefropatía diabética. Insuficiencia cardiaca crónica. Prevención de ACV isquémico en pacientes con hipertrofia ventricular izquierda. Reduce la tasa de dilatación aórtica en adultos con el síndrome de Marfán.'),
(141, 'C09DB04', 'Telmisartán y Amlodipino', 'Solido oral', '80 mg + 10 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de la hipertensión arterial esencial en adultos: Terapia de combinación Telmisartán + amlodipina está indicado en adultos cuya presión arterial no puede controlarse adecuadamente con amlodipina sola. Terapia sustitutiva Los pacientes adultos que reciban comprimidos de telmisartán y amlodipina por separado pueden en su lugar tomar comprimidos de telmisartán amlodipina que contengan las mismas dosis de estos componentes.'),
(142, 'C10AA01', 'Simvastatina', 'Solido oral', '20 mg y 40 mg', 'O        Oral', 'Indicación general: Dislipidemia mixta.Hipercolesterolemia primaria.Hipertrigliceridemia.Disbetalipoproteinemia primaria.Hipercolesterolemia familiar homocigótica y heterocigótica.Prevención de evento cardiovascular.'),
(143, 'C10AA05', 'Atorvastatina', 'Solido oral', '80 mg*', 'O        Oral', 'Indicación exclusiva: Síndrome coronario agudo de alto y muy alto riesgo que requieren dosis altas de estatinas (80 mg) para manejo intensivo. Manejo de dislipidemias en pacientes con VIH (20 mg, 40 mg).'),
(144, 'C10AB04', 'Gemfibrozilo', 'Solido oral', '600 mg', 'O        Oral', 'Indicación general:Hipertrigliceridemia grave con o sin colesterol HDL bajo.Hiperlipidemia mixta cuando las estatinas están contraindicadas o son intolerables.Hipercolesterolemia primaria cuando las estatinas están contraindicadas o son intolerables.Prevención primaria:Reducción de la morbilidad cardiovascular en hombres con colesterol no-HDL alto y que corren gran riesgo de sufrir un primer episodio cardiovascular, cuando las estatinas están contraindicadas o son intolerables.'),
(145, 'D01AA20', 'Zinc + Nistatina', 'Semisolido cutaneo', '', 'T           Topico', 'Indicación general:Infecciones micóticas cutáneas y mucocutáneas causadas por especies de Candida.'),
(146, 'D01AC01', 'Clotrimazol', 'Semisolido cutaneo', '1 %', 'T           Topico', 'Indicación general: Candidiasis cutánea. Tinea (capitis, barbae, corporis, cruris, pedis, versicolor).'),
(147, 'D01AC01', 'Clotrimazol', 'Liquido cutaneo', '1 %', 'T           Topico', 'Indicación general: Candidiasis cutánea. Tinea (capitis, barbae, corporis, cruris, pedis, versicolor).'),
(148, 'D01AE15', 'Terbinafina', 'Semisolido cutaneo', '1 %', 'T           Topico', 'Indicación general: Tinea corporis, cruris, pedis.'),
(149, 'D01BA01', 'Griseofulvina', 'Solido oral', '125 mg - 500 mg', 'O        Oral', 'Indicación general: Onicomicosis por dermatofitos. Tinea capitis, tinea barbae, tinea cruris, tinea pedís. Especialmente para T. capitis en niños.'),
(150, 'D01BA02', 'Terbinafina', 'Solido oral', '250 mg', 'O        Oral', 'Indicación general: Onicomicosis producida por dermatofitos como: Tinea capitis, corporis, cruris, pedis.'),
(151, 'D02AB', 'Zinc', 'Semisolido cutaneo', '', 'T           Topico', 'Indicación general: Dermatitis perineal.'),
(152, 'D02AE01', 'Carbamida (urea)', 'Semisolido cutaneo', '5 % - 20 %', 'T           Topico', 'Indicación general: Hiperqueratosis cutánea como: piel seca o xerosis.'),
(153, 'D03AX12', 'Trolamina', 'Liquido cutaneo', '0,67 %', 'T           Topico', 'Indicación exclusiva: Uso exclusivo en pacientes con quemaduras cutáneas debido a radioterapia. En caso de heridas infectadas deberá tratarse la infección y concomitantemente podrá aplicarse trolamina.'),
(154, 'D04AB01', 'Lidocaína', 'Semisolido cutaneo', '2 % y 5 %', 'T           Topico', 'Indicación general:Anestésico local superficial.Lesiones menores de la piel. Quemaduras de sol, picaduras de insectos.Alternativa en intervenciones quirúrgicas menores superficiales y punciones en piel sana.Facilitador en limpieza mecánica y desbridamiento de úlceras en extremidades. Tratamiento sintomático de hemorroides.'),
(155, 'D04AB01', 'Lidocaína', 'Liquido cutaneo', '10 %', 'T           Topico', 'Indicación general:Anestésico local superficial.Lesiones menores de la piel. Quemaduras de sol, picaduras de insectos.Alternativa en intervenciones quirúrgicas menores superficiales y punciones en piel sana.Facilitador en limpieza mecánica y desbridamiento de úlceras en extremidades. Tratamiento sintomático de hemorroides.'),
(156, 'D05AA', 'Alquitrán de hulla', 'Liquido cutaneo', '5 %', 'T           Topico', 'Indicación general: Psoriasis.'),
(157, 'D05AA', 'Alquitrán de hulla', 'Liquido cutaneo', '5 %', 'T           Topico', 'Indicación general:Psoriasis.'),
(158, 'D05AX52', 'Calcipotriol + Betametasona dipropionato', 'Semisolido cutaneo', '(50 mcg + 0,5 mg)/g', 'T           Topico', 'Indicación general: Psoriasis, incluyendo psoriasis del cuero cabelludo.'),
(159, 'D06AX01', 'Ácido fusídico', 'Semisolido cutaneo', '2 %', 'T           Topico', 'Indicación general:Infecciones superficiales de la piel por gérmenes gram positivos, incluyendo Staphilococcus aureus y Staphilococcus epidermidis. Tratamiento a corto plazo de impétigo localizado y combinado con antibiótico sistémico.'),
(160, 'D06BA01', 'Sulfadiazina de plata', 'Semisolido cutaneo', '1 %', 'T           Topico', 'Indicación general:Profilaxis y tratamiento de infecciones en quemaduras. Coadyuvante en el manejo de infecciones de ulceras en miembros inferiores y en escaras por presión. Profilaxis de infecciones cutáneas en abrasiones extensas y donadores de piel para injerto.'),
(161, 'D07AA02', 'Hidrocortisona', 'Semisolido cutaneo/Liquido cutaneo', '0,5 % y 1 %', 'T           Topico', 'Indicación general:Alternativa en el tratamiento de dermatitis atópica, de contacto, seborreica, intertrigo y otras lesiones inflamatorias de la piel sensibles a corticoides de baja potencia.'),
(162, 'D07AC01', 'Betametasona', 'Semisolido cutaneo/Liquido cutaneo', '0,05 % y 0,1 %', 'T           Topico', 'Indicación general:Psoriasis del cuero cabelludo. Alternativa en el tratamiento de dermatitis atópica, de contacto, numular, seborreica, intertrigo, dermatosis y otras lesiones inflamatorias de la piel sensibles a corticoides de alta potencia.'),
(163, 'D10AD03', 'Adapaleno', 'Semisolido cutaneo', '0,1 %', 'T           Topico', 'Indicación general:Tratamiento de acné vulgar leve a moderado.');
INSERT INTO `medicamento` (`id_medicamento`, `codigo`, `descripcion`, `forma`, `concentracion`, `viaadmin`, `indicaciones`) VALUES
(164, 'D10AD04', 'Isotretinoina', 'Solido oral', '10 mg y 20 mg', 'O        Oral', 'Indicación exclusiva: Formas graves de acné: acné nodular, quístico, cicatrizal, conglobata.'),
(165, 'D10AE01', 'Peróxido de Benzoilo', 'Semisolido cutaneo/Liquido cutaneo', '5 % y 10 %', 'T           Topico', 'Indicación general:Acné vulgar, de leve a moderado.'),
(166, 'D10AF01', 'Clindamicina', 'Liquido cutaneo', '1 %', 'T           Topico', 'Indicación general:Tratamiento del acne vulgar.'),
(167, 'D10AF02', 'Eritromicina', 'Liquido cutaneo', '4 %', 'T           Topico', 'Indicación general:Tratamiento del acne vulgar.'),
(168, 'G01AA10', 'Clindamicina', 'Solido vaginal', '100 mg', 'V           Vaginal', 'Indicación general:Vaginosis bacteriana.'),
(169, 'G01AF01', 'Metronidazol', 'Solido vaginal', '500 mg y 1.000 mg', 'V           Vaginal', 'Indicación general: Afecciones por Trichomonas  como uretritis y vaginitis.'),
(170, 'G01AF02', 'Clotrimazol', 'Solido vaginal', '100 mg - 500 mg', 'V           Vaginal', 'Indicación general: Candidiasis vulvovaginal a partir de los 12 años.'),
(171, 'G01AF02', 'Clotrimazol', 'Semisolido vaginal', '1 % y 2 %', 'V           Vaginal', 'Indicación general: Candidiasis vulvovaginal a partir de los 12 años.'),
(172, 'G02AB01', 'Metilergometrina (o G02AB03 Ergometrina)', 'Liquido parenteral', '0,2 mg/mL', 'P         Parenteral', 'Indicación general:Atonía y hemorragias del parto y del posparto.Parto dirigido, maniobra de Credé.Hemorragias uterinas en el curso de cesáreas.Subinvolución uterina, loquiómetra.Hemorragias tardías del parto.Hemorragias del aborto, abortos iniciados e incompletos.Legrados.'),
(173, 'G02AB01', 'Metilergometrina (o G02AB03 Ergometrina)', 'Solido oral', '0,125 mg', 'O        Oral', 'Indicación general:Atonía y hemorragias del parto y del posparto.Parto dirigido, maniobra de Credé.Hemorragias uterinas en el curso de cesáreas.Subinvolución uterina, loquiómetra.Hemorragias tardías del parto.Hemorragias del aborto, abortos iniciados e incompletos.Legrados.'),
(174, 'G02AD06', 'Misoprostol', 'Solido oral', '200 mcg', 'O/V   Oral/Vaginal', 'Indicación general:Manejo farmacológico del aborto incompleto, diferido, hemorragia postparto.Maduración cervical e inducción del parto a término, especialmente en casos de cuello uterino inmaduro, siempre que no existan contraindicaciones fetales o maternas.'),
(175, 'G02CB03', 'Cabergolina', 'Solido oral', '0,5 mg', 'O        Oral', 'Hiperprolactinemia.Supresión de lactación (por razones médicas).'),
(176, 'G03AA05', 'Estradiol valerato + Noretisterona enantato', 'Liquido parenteral', '(5 mg + 50 mg)/mL', 'P         Parenteral', 'Indicación general: Anticoncepción (vía parenteral).'),
(177, 'G03AA07', 'Levonorgestrel + Etinilestradiol', 'Solido oral', '150 mcg + 30 mcg', 'O        Oral', 'Indicación general:Anticoncepción oral,dismenorreas, endometriosis, crisis ovulatorias.Reposo ovárico. Terapia hormonal sustitutiva de la menopausia.'),
(178, 'G03AC03', 'Levonorgestrel', 'Solido oral', '0,030 mg', 'O        Oral', 'Indicación general: Sólido oral: Anticoncepción oral diaria durante la lactancia. Sólido parenteral (implante subdérmico): Anticoncepción.   Indicación exclusiva: Sistema intrauterino: Menorragia idiopática.'),
(179, 'G03AC03', 'Levonorgestrel', 'Solido parenteral (Implante subdermico)', '150 mg  (2 varillas de 75 mg)', 'P         Parenteral', 'Indicación general: Sólido oral: Anticoncepción oral diaria durante la lactancia. Sólido parenteral (implante subdérmico): Anticoncepción.   Indicación exclusiva: Sistema intrauterino: Menorragia idiopática.'),
(180, 'G03AC03', 'Levonorgestrel', 'Sistema intrauterino', '52 mg', 'IU       Intrauterina', 'Indicación general: Sólido oral: Anticoncepción oral diaria durante la lactancia. Sólido parenteral (implante subdérmico): Anticoncepción.   Indicación exclusiva: Sistema intrauterino: Menorragia idiopática.'),
(181, 'G03AD01', 'Levonorgestrel', 'Solido oral', '0,75 mg y 1,5 mg', 'O        Oral', 'Indicación general:Anticonceptivo oral de emergencia, dentro de las 72 horas siguientes a haber mantenido relaciones sexuales sin protección o al fallo de un método anticonceptivo. '),
(182, 'G03BA03', 'Testosterona', 'Liquido parenteral', '250 mg/mL', 'P         Parenteral', 'Indicación general:Hipogonadismo masculino, carcinoma mamario avanzado, retraso en pubertad masculina.'),
(183, 'G03CA03', 'Estradiol', 'Solido cutaneo (parche transdermico)', '3,9 mg', 'T           Topico', 'Indicación general: Terapia de remplazo hormonal (TRH).Hipoestrogenismo. Tratamiento paliativo de cáncer de mama y de próstata.'),
(184, 'G03CA03', 'Estradiol', 'Solido oral', '1 mg', 'O        Oral', 'Indicación general: Terapia de remplazo hormonal (TRH).Hipoestrogenismo. Tratamiento paliativo de cáncer de mama y de próstata.'),
(185, 'G03CA04', 'Estriol', 'Semisolido vaginal', '0,1 %', 'V           Vaginal', 'Indicación general: Atrofia vulvovaginal menopáusica.'),
(186, 'G03DA04', 'Progesterona', 'Solido oral', '100 mg', 'O/V   Oral/Vaginal', 'Indicación general: Vía oral: Trastornos ligados a una insuficiencia en progesterona.Irregularidades del ciclo menstrual por disovulación o anovulación. Síndrome premenstrual. Premenopausia. Menopausia: Complemento del tratamiento estrogénico en mujeres con útero intacto. Vía vaginal: Esta vía se utiliza de manera particular en los siguientes casos:- Reposición en progesterona durante el curso de déficits completos en mujeres ovario privadas (transplante de óvulos)- Suplementación de la fase luteal durante el curso de ciclos de fecundación in vitro (FIV)- Suplementación de la fase luteal durante el curso de ciclos espontáneos o inducidos en caso de hipofertilidad o esterilidad primaria o secundaria por disovulación.- Amenaza de aborto o prevención de abortos repetitivos por insuficiencia luteal.'),
(187, 'G03FA12', 'Medroxiprogesterona + Estrógenos conjugados', 'Solido oral', '2,5 mg + 0,625 mg', 'O        Oral', 'Indicación general: Menopausia, disfunción vasomotora menopáusica. Atrofia vaginal menopáusica. Profilaxis de osteoporosis postmenopáusica.'),
(188, 'G03GB02', 'Clomifeno', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Infertilidad femenina anovulatoria (inductor de la ovulación).'),
(189, 'G04BE03', 'Sildenafilo', 'Solido oral', '25 mg - 100 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en hipertensión pulmonar.'),
(190, 'G04CA02', 'Tamsulosina', 'Solido oral', '0,4 mg', 'O        Oral', 'Indicación general: Hipertrofia prostática benigna.'),
(191, 'G04CB02', 'Dutasterida', 'Solido oral', '0,5 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento de la hiperplasia prostática benigna con sintomatología moderada o severa y en aquellos pacientes con alto riesgo quirúrgico que no pueden ser sometidos a prostatectomía.'),
(192, 'H01AB01', 'Tirotropina Alfa', 'Solido parenteral', '0,9 mg', 'P         Parenteral', 'Indicación exclusiva: Estimulación pre terapéutica en combinación con yodo para la ablación de remanentes de tejido tiroideo.'),
(193, 'H01AC01', 'Somatotropina', 'Liquido parenteral/Solido parenteral', '5,3 mg - 20 mg', 'P         Parenteral', 'Indicación exclusiva: Déficit de hormona de crecimiento (medicamento sujeto a seguimiento y reporte de resultados).'),
(194, 'H01BA02', 'Desmopresina', 'Liquido para inhalacion', '100 mcg/mL', 'N          Nasal', 'Indicación general: Diabetes insípida central. Hemofilia A (niveles de factor VIII ≥5%).'),
(195, 'H01BA02', 'Desmopresina', 'Liquido parenteral', '15 mcg/mL', 'P         Parenteral', 'Indicación general: Diabetes insípida central. Hemofilia A (niveles de factor VIII ≥5%).'),
(196, 'H01BA02', 'Desmopresina', 'Solido oral', '0,1 mg', 'O        Oral', 'Indicación general: Diabetes insípida central. Hemofilia A (niveles de factor VIII ≥5%).'),
(197, 'H01BA04', 'Terlipresina', 'Liquido parenteral/Solido parenteral', '1 mg que equivale a  0,86 mg', 'P         Parenteral', 'Indicación exclusiva: Várices esofágicas sangrantes.'),
(198, 'H01BB02', 'Oxitocina', 'Liquido parenteral', '10 UI/mL', 'P         Parenteral', 'Indicación general:Prevención de hemorragia uterina postparto. Prevención de hemorragia uterina postaborto. Tratamiento de hemorragia post parto. Inducción de la labor de parto.'),
(199, 'H01CB02', 'Octreotida', 'Liquido parenteral', '0,1 mg/mL', 'P(IV,IM,SC)   Parenteral (Intravenoso/Intramuscular/Subcutáneo)', 'Indicación exclusiva: Uso exclusivo en pacientes con acromegalia, tumores carcinoides, VIPomas y glucagonomas.'),
(200, 'H01CB02', 'Octreotida', 'Solido parenteral (Liberacion prolongada)', '20 mg y 30 mg', 'P         Parenteral', 'Indicación exclusiva: Uso exclusivo en pacientes con acromegalia, tumores carcinoides, VIPomas y glucagonomas.'),
(201, 'H02AA02', 'Fludrocortisona', 'Solido oral', '0,1 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requiere reemplazo mineralocorticoide.'),
(202, 'H02AB01', 'Betametasona', 'Liquido parenteral', '4 mg/mL', 'P         Parenteral', 'Indicación general: Desordenes endocrinológicos.Enfermedades inflamatorias y alérgicas severas. Maduración pulmonar fetal.'),
(203, 'H02AB02', 'Dexametasona', 'Liquido parenteral', '4 mg/mL', 'P         Parenteral', 'Indicación general: Hiperplasia suprarrenal congénita en el adulto.Tiroiditis subaguda no supurativa.Control alergias severas.Insuficiencia suprarrenal.Enfermedades inflamatorias.Enfermedades del colágeno, reumáticas y extra-articulares.Shock anafiláctico que no responde a otros medicamentos.Coadyuvante de la terapia antineoplásica (hipercalcemia y vómito por quimioterapia).Edema cerebral agudo.Prevención del síndrome de dificultad respiratoria del neonato pretérmino.Croup en niños.Otras similares a las de betametasona.Diagnóstico de síndrome de Cushing.En exacerbación aguda de esclerosis múltiple, púrpura trombocitopénica idiopática, edema macular de retina, triquinosis con afectación neurológica o miocárdica.Coadyuvante en la meningitis tuberculosa.Síndrome nefrótico idiopático o por lupus eritematoso sistémico.Uveítis posterior no infecciosa.En cuidados paliativos para náusea, vómito, compresión medular, compresión de nervio, disnea (pneumonitis luego de radioterapia, linfangitis carcinomatosa, compresión traqueal/estridor) obstrucción de vena cava superior, obstrucción de víscera hueca (bronquio, uréter, intestino), inflamación inducida por la radiación, secreción rectal, dolor óseo, mejorar el apetito, mejorar la sensación de bienestar, fatiga, hipercalcemia maligna, hipertensión endocraneana.'),
(204, 'H02AB02', 'Dexametasona', 'Solido oral', '4 mg y 8 mg', 'O        Oral', 'Indicación general: Hiperplasia suprarrenal congénita en el adulto.Tiroiditis subaguda no supurativa.Control alergias severas.Insuficiencia suprarrenal.Enfermedades inflamatorias.Enfermedades del colágeno, reumáticas y extra-articulares.Shock anafiláctico que no responde a otros medicamentos.Coadyuvante de la terapia antineoplásica (hipercalcemia y vómito por quimioterapia).Edema cerebral agudo.Prevención del síndrome de dificultad respiratoria del neonato pretérmino.Croup en niños.Otras similares a las de betametasona.Diagnóstico de síndrome de Cushing.En exacerbación aguda de esclerosis múltiple, púrpura trombocitopénica idiopática, edema macular de retina, triquinosis con afectación neurológica o miocárdica.Coadyuvante en la meningitis tuberculosa.Síndrome nefrótico idiopático o por lupus eritematoso sistémico.Uveítis posterior no infecciosa.En cuidados paliativos para náusea, vómito, compresión medular, compresión de nervio, disnea (pneumonitis luego de radioterapia, linfangitis carcinomatosa, compresión traqueal/estridor) obstrucción de vena cava superior, obstrucción de víscera hueca (bronquio, uréter, intestino), inflamación inducida por la radiación, secreción rectal, dolor óseo, mejorar el apetito, mejorar la sensación de bienestar, fatiga, hipercalcemia maligna, hipertensión endocraneana.'),
(205, 'H02AB04', 'Metilprednisolona, acetato', 'Liquido parenteral', '40 mg/mL', 'P         Parenteral', 'Indicación general: Metilprednisolona acetato: Enfermedades inflamatorias, inflamaciones articulares. Metilprednisolona succinato: Enfermedades inflamatorias, nefritis lúpica estadio III y IV (episodios agudos).Shock anafiláctico (medicamento de segunda línea), lesiones de la médula espinal, crisis asmática severa, anemia aplásica primaria refractaria, eritema multiforme (Síndrome de Steven-Johnson), enfermedad de Crohn, colitis ulcerosa, edema cerebral asociado a tumor maligno, polimiositis y dermatomiositis. Insuficiencia adrenal primaria o secundaria, hiperplasia adrenal congénita, tiroiditis subaguda no supurativa (la hidrocortisona y cortisona son los medicamentos de primera elección para esta patología).'),
(206, 'H02AB04', 'Metilprednisolona, succinato', 'Solido parenteral', '125 mg y 500 mg', 'P         Parenteral', 'Indicación general: Metilprednisolona acetato: Enfermedades inflamatorias, inflamaciones articulares. Metilprednisolona succinato: Enfermedades inflamatorias, nefritis lúpica estadio III y IV (episodios agudos).Shock anafiláctico (medicamento de segunda línea), lesiones de la médula espinal, crisis asmática severa, anemia aplásica primaria refractaria, eritema multiforme (Síndrome de Steven-Johnson), enfermedad de Crohn, colitis ulcerosa, edema cerebral asociado a tumor maligno, polimiositis y dermatomiositis. Insuficiencia adrenal primaria o secundaria, hiperplasia adrenal congénita, tiroiditis subaguda no supurativa (la hidrocortisona y cortisona son los medicamentos de primera elección para esta patología).'),
(207, 'H02AB06', 'Prednisolona', 'Solido oral', '5 mg y 20 mg', 'O        Oral', 'Indicación general:Insuficiencia suprarrenal.Enfermedades inflamatorias o alérgicas, esclerosis múltiple, artritis reumatoide, asma.Síndrome nefrótico en niños, enfermedades inflamatorias intestinales, croup.'),
(208, 'H02AB07', 'Prednisona', 'Solido oral', '5 mg y 20 mg', 'O        Oral', 'Indicación general: Insuficiencia suprarrenal, enfermedades inflamatorias o alérgicas, esclerosis múltiple, artritis reumatoide, asma y síndrome nefrótico en niños, enfermedades inflamatorias intestinales, púrpura trombocitopénica idiopática.Premedicación para tratamiento oncológico.'),
(209, 'H02AB09', 'Hidrocortisona', 'Solido oral', '5 mg - 20 mg', 'O        Oral', 'Indicación general: Sólido parenteral: Insuficiencia suprarrenal aguda, enfermedades inflamatorias o alérgicas, estatus asmático, antiinflamatorio o inmunosupresor, coadyuvante en el manejo de pacientes politraumatizados e intubados, eritema multiforme severo (Stevens- Johnson), insuficiencia adrenal primaria o secundraria, hiperplasia adrenal congénita, tiroiditis subaguda no supurativa. Indicación exclusiva: Sólido oral: Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requieren reemplazo glucocorticoide.'),
(210, 'H02AB09', 'Hidrocortisona, succinato sódico', 'Solido parenteral', '100 mg y 500 mg', 'P         Parenteral', 'Indicación general: Sólido parenteral: Insuficiencia suprarrenal aguda, enfermedades inflamatorias o alérgicas, estatus asmático, antiinflamatorio o inmunosupresor, coadyuvante en el manejo de pacientes politraumatizados e intubados, eritema multiforme severo (Stevens- Johnson), insuficiencia adrenal primaria o secundraria, hiperplasia adrenal congénita, tiroiditis subaguda no supurativa. Indicación exclusiva: Sólido oral: Uso exclusivo en pacientes con hiperplasia suprarrenal congénita o insuficiencia suprarrenal primaria que requieren reemplazo glucocorticoide.'),
(211, 'H03AA01', 'Levotiroxina sódica', 'Solido oral', '25 mcg - 200 mcg', 'O        Oral', 'Indicación general: Hipotiroidismo primario y secundario.'),
(212, 'H03BB02', 'Tiamazol (metimazol)', 'Solido oral', '5 mg', 'O        Oral', 'Indicación general: Hipertiroidismo, incluyendo enfermedad de graves, manejo de tormenta tiroidea, preparación para tiroidectomía en pacientes hipertiroideos, como coadyuvante de terapia con yodo radiactivo.'),
(213, 'H04AA01', 'Glucagón', 'Solido parenteral', '1 mg (1UI)', 'P         Parenteral', 'Indicación general: Tratamiento de reacciones hipoglucémicas severas, en pacientes con diabetes tratados con insulina. Antídoto:Antídoto para intoxicación por betabloqueadores.'),
(214, 'H05BX02', 'Paricalcitol', 'Liquido parenteral', '5 mcg/mL', 'P         Parenteral', 'Indicación exclusiva: Exclusivamente como segunda opción en el manejo de hiperparatiroidismo secundario, cuando existe intolerancia a calcitriol en pacientes con insuficiencia renal crónica grado 5 en hemodiálisis.'),
(215, 'J01AA02', 'Doxiciclina', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general:Infecciones por Chlamydia trachomatis (linfogranuloma venéreo).Uretritis y/o cervicitis no gonocócica (en terapia dual combinado con ceftriaxona u otro agente contra gonococo). Otras infecciones de transmisión sexual. Tratamiento de enfermedad pélvica inflamatoria (EPI). Prostatitis crónica. Acné vulgar. Rosácea. Profilaxis de leptospirosis y malaria. Enfermedad periodontal. Infecciones por Brucelosis. Infección Chancroide por Haemophilus ducreyi. Sinusitis. Sífilis.Coadyuvante en amebiasis intestinal aguda.Infecciones por Rickettsias.'),
(216, 'J01AA12', 'Tigeciclina', 'Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación exclusiva: Infecciones complicadas de piel y tejidos blandos; intrabdominales o neumonía por patógenos sensibles.'),
(217, 'J01CA01', 'Ampicilina', 'Solido parenteral', '500 mg y 1.000 mg', 'P         Parenteral', 'Indicación general: Infecciones causadas por microorganismos sensibles al medicamento, tales como:Infecciones otorrinolaringológicas.Infecciones respiratorias.Infecciones del tracto gastrointestinal.Infecciones genitourinarias.Meningitis.Endocarditis bacteriana.Septicemia.'),
(218, 'J01CA04', 'Amoxicilina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general:Infecciones de garganta, nariz y oídos: amigdalitis, otitis media, sinusitis.Infecciones del tracto respiratorio inferior.Infecciones del tracto genitourinario.Infecciones de la piel y tejidos blandos.Endocarditis bacteriana. Tratamiento de infecciones por Helicobacter pylori. Enfermedad de Lyme. '),
(219, 'J01CA04', 'Amoxicilina', 'Solido oral (polvo)', '100 mg/mL', 'O        Oral', 'Indicación general:Infecciones de garganta, nariz y oídos: amigdalitis, otitis media, sinusitis.Infecciones del tracto respiratorio inferior.Infecciones del tracto genitourinario.Infecciones de la piel y tejidos blandos.Endocarditis bacteriana. Tratamiento de infecciones por Helicobacter pylori. Enfermedad de Lyme. '),
(220, 'J01CA04', 'Amoxicilina', 'Solido oral (polvo)', '250 mg/5 mL', 'O        Oral', 'Indicación general:Infecciones de garganta, nariz y oídos: amigdalitis, otitis media, sinusitis.Infecciones del tracto respiratorio inferior.Infecciones del tracto genitourinario.Infecciones de la piel y tejidos blandos.Endocarditis bacteriana. Tratamiento de infecciones por Helicobacter pylori. Enfermedad de Lyme. '),
(221, 'J01CE01', 'Bencilpenicilina  (Penicilina G cristalina)', 'Solido parenteral', '1´000.000 UI y 5´000.000 UI', 'P         Parenteral', 'Indicación general: Septicemia, neumonía, pericarditis, endocarditis, meningitis.Actinomicosis (enfermedad cérvico-facial y enfermedad torácica y abdominal).Botulismo (terapia complementaria a la antitoxina), gangrena gaseosa y tétanos (terapia complementaria a la inmunoglobulina antitetánica).Difteria (terapia adyuvante a la antitoxina y prevención del estado de portador).Endocarditis por Erysipelothrix.Fusoespiroquetosis (infecciones graves de la orofaringe - DVicent, el tracto respiratorio inferior y el área genital).Infecciones producidas por Listeria, incluidas meningitis y endocarditis.Infecciones producidas por Pasteurella, incluidas bacteriemia y meningitis.Fiebre por mordedura de rata.Infecciones gonocócicas diseminadas.Sífilis.'),
(222, 'J01CE08', 'Bencilpenicilina benzatínica (Penicilina G benzatínica)', 'Solido parenteral', '600.000 UI - 2´400.000 UI', 'P         Parenteral', 'Indicación general: Sífilis (sífilis congénita, sífilis latente tardía, latente temprana, sífilis latente sin duración conocida, neurosífilis, sífilis primaria, secundaria). Infecciones por Streptococcus beta hemolítico del grupo A. Profilaxis secundaria de Fiebre Reumática. Infecciones durante el embarazo.'),
(223, 'J01CF01', 'Dicloxacilina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Infecciones ocasionadas por Staphylococcus aureus productores de penicilinasas.'),
(224, 'J01CF01', 'Dicloxacilina', 'Solido oral (polvo)', '125 mg/5 mL y 250 mg/5 mL', 'O        Oral', 'Indicación general: Infecciones ocasionadas por Staphylococcus aureus productores de penicilinasas.'),
(225, 'J01CF04', 'Oxacilina', 'Solido parenteral', '1.000 mg', 'P         Parenteral', 'Indicación general: Infecciones debidas a Staphylococcus productores de beta-lactamasas incluyendo la otitis externa, coadyuvante en el tratamiento de neumonías, impétigos, celulitis, osteomielitis y endocarditis estafilocócicas.'),
(226, 'J01CR01', 'Ampicilina + Sulbactam', 'Solido parenteral', '1.000 mg + 500 mg', 'P         Parenteral', 'Indicación general: Infecciones ginecológicas.Infecciones intraabdominales.Infecciones de la piel y la estructura de la piel.Celulitis orbital.Enfermedad pélvica inflamatoria.Neumonía, sinusitis.Infecciones del tracto urinario.'),
(227, 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Solido oral', '500 mg + 125 mg', 'O        Oral', 'Indicación general: Infecciones del tracto respiratorio inferior.Sinusitis bacteriana aguda.Otitis media aguda. Neumonía adquirida en la comunidad.Infección de piel o tejido celular subcutáneo. Infecciones del tracto urinario.'),
(228, 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Solido parenteral', '1.000 mg + 200 mg', 'P         Parenteral', 'Indicación general: Infecciones del tracto respiratorio inferior.Sinusitis bacteriana aguda.Otitis media aguda. Neumonía adquirida en la comunidad.Infección de piel o tejido celular subcutáneo. Infecciones del tracto urinario.'),
(229, 'J01CR02', 'Amoxicilina + Ácido clavulánico', 'Solido oral (polvo)', '(125 mg + 31,25 mg)/5 mL y (250 mg + 62,5 mg)/5 mL', 'O        Oral', 'Indicación general: Infecciones del tracto respiratorio inferior.Sinusitis bacteriana aguda.Otitis media aguda. Neumonía adquirida en la comunidad.Infección de piel o tejido celular subcutáneo. Infecciones del tracto urinario.'),
(230, 'J01CR04', 'Sultamicilina', 'Solido oral', '375 mg y 750 mg', 'O        Oral', 'Indicación general:Tratamiento de infecciones por microorganismos sensibles.'),
(231, 'J01CR05', 'Piperacilina + Tazobactam', 'Solido parenteral', '4.000 mg + 500 mg', 'P         Parenteral', 'Indicación general: Infecciones bacterianas abdominales complicadas. Septicemia. Infecciones complicadas del tracto genito urinario (endometritis puerperal), piel y tejidos blandos.Neumonía nosocomial.'),
(232, 'J01DB01', 'Cefalexina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Infecciones bacterianas.Infecciones dérmicas. Faringitis estreptocócica, infección de vías urinarias no complicadas. Profilaxis de endocarditis bacteriana.Otitis media en niños. Sinusitis.'),
(233, 'J01DB01', 'Cefalexina', 'Solido oral', '250 mg/5 mL', 'O        Oral', 'Indicación general: Infecciones bacterianas.Infecciones dérmicas. Faringitis estreptocócica, infección de vías urinarias no complicadas. Profilaxis de endocarditis bacteriana.Otitis media en niños. Sinusitis.'),
(234, 'J01DB04', 'Cefazolina', 'Solido parenteral', '1.000 mg', 'P         Parenteral', 'Indicación general: Infecciones bacterianas. Infecciones dérmicas. Faringitis estreptocócica, infecciones de las vías urinarias no complicadas. Profilaxis de endocarditis bacteriana.Otitis media en niños. Profilaxis prequirúrgica.'),
(235, 'J01DC02', 'Cefuroxima', 'Solido oral (polvo)', '125 mg/5 mL  y 250 mg/5 mL', 'O        Oral', 'Tratamiento de infecciones del tracto respiratorio superior de adultos y niños a partir de 3 meses de edad. Infecciones urinarias altas y bajas.Infecciones no complicadas de la piel y de los tejidos blandos. Tratamiento inicial de la enfermedad de Lyme. Uso intravítreo en casos de endoftalmitis.'),
(236, 'J01DC02', 'Cefuroxima', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Tratamiento de infecciones del tracto respiratorio superior de adultos y niños a partir de 3 meses de edad. Infecciones urinarias altas y bajas.Infecciones no complicadas de la piel y de los tejidos blandos. Tratamiento inicial de la enfermedad de Lyme. Uso intravítreo en casos de endoftalmitis.'),
(237, 'J01DC02', 'Cefuroxima', 'Solido parenteral', '750 mg', 'P         Parenteral', 'Tratamiento de infecciones del tracto respiratorio superior de adultos y niños a partir de 3 meses de edad. Infecciones urinarias altas y bajas.Infecciones no complicadas de la piel y de los tejidos blandos. Tratamiento inicial de la enfermedad de Lyme. Uso intravítreo en casos de endoftalmitis.'),
(238, 'J01DD01', 'Cefotaxima', 'Solido parenteral', '1.000 mg', 'P         Parenteral', 'Primera línea: Meningitis bacteriana aguda, neumonía adquirida en la comunidad (grave), neunomía adquirida en el hospital, infecciones intraabdominales complicadas, pielonefritis o prostatitis (grave).Segunda línea: Infecciones óseas y articulares, pielonefritis o prostatitis (leve a moderada), sepsis en neonatos y niños.'),
(239, 'J01DD02', 'Ceftazidima', 'Solido parenteral', '500 mg y 1.000 mg', 'P         Parenteral', 'Indicación general: Infecciones bacterianas severas producidas por gérmenes sensibles. Esta indicado espacialmente en infecciones producidas por Pseudomonas aeruginosa, identificada mediante cultivo.'),
(240, 'J01DD04', 'Ceftriaxona', 'Solido parenteral', '500 mg y 1.000 mg', 'P         Parenteral', 'Indicación general: Meningitis bacteriana, neumonía adquirida en la comunidad, neumonía nosocomial, otitis media aguda, peritonitis, infección de las vías biliares, pielonefritis, infección ósea y articular. Infección complicada de la piel y tejidos blandos, gonorrea, sífilis, endocarditis bacteriana, enfermedad de Lyme (Estadios II y III), infecciones intraabdominales, enfermedad pélvica inflamatoria, infección de prótesis articular, cirugía contaminada cardiovascular, procedimientos urológicos y cirugía colorrectal.'),
(241, 'J01DD52', 'Ceftazidima + Avibactam', 'Solido parenteral', '2.000 mg + 500 mg', 'P(IV)  Parenteral (Intravenosa)', 'Indicación aprobada en la 11ª Revisión del CNMB: Ceftazidima + Avibactam está indicado en adultos para el tratamiento de Neumonía Adquirida en el Hospital (NAH), incluyendo Neumonía asociada a Ventilación mecánica (NAV) producida por enterobacterias productoras de BLEE y/o carbapenemasa tipo KPC u OXA-48 y/o Pseudomonas aeruginosa resistente a carbapenémicos, en pacientes adultos. Se deben tener en cuenta las recomendaciones oficiales sobre el uso adecuado de agentes antibacterianos.'),
(242, 'J01DE01', 'Cefepima', 'Solido parenteral', '1.000 mg', 'P         Parenteral', 'Indicación general:Infecciones causadas por patógenos sensibles, neumonía nosocomial, infecciones graves del tracto urinario, infecciones graves de la piel y de los tejidos blandos, neutropenia febril, infecciones en pacientes con neutropenia grave o prolongada, infecciones graves en pacientes con trasplante de médula ósea reciente, infecciones intraabdominales graves/complicadas, meningitis bacteriana.'),
(243, 'J01DH02', 'Meropenem', 'Solido parenteral', '500 mg y 1.000 mg', 'P         Parenteral', 'Indicación general: Neumonía grave, incluyendo neumonía adquirida en el hospital y asociada a ventilación, infecciones broncopulmonares en fibrosis quística, infecciones complicadas del tracto urinario, infecciones complicadas intraabdominales, infecciones maternas asociadas con el parto, infecciones complicadas de la piel y tejidos blandos, meningitis bacteriana aguda, neutropenia febril con riesgo de sepsis o shock séptico'),
(244, 'J01DH51', 'Imipenem + Cilastatina', 'Solido parenteral', '500 mg + 500 mg', 'P         Parenteral', 'Indicación general:Neumonía hospitalaria y asociada a ventilación, infecciones intra-abdominales complicadas, infecciones intraparto y posparto, infecciones complicadas del tracto urinario, infecciones complicadas de piel y tejidos blandos, infecciones por Pseudomonas spp, sepsis, melioidosis, absceso hepático piógeno, fibrosis quística.'),
(245, 'J01EC02', 'Sulfadiazina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en pacientes con toxoplasmosis, incluido embarazadas.'),
(246, 'J01EE01', 'Cotrimoxazol  (Sulfametoxazol + Trimetoprim)', 'Liquido parenteral/Solido parenteral', '(400 mg + 80 mg) y  (800 mg + 160 mg)', 'P         Parenteral', 'Indicación general: Tratamiento de la neumonía producida por Pneumocystis jiroveci (P. carinii).  Nocardiosis, toxoplasmosis, listeriosis, infecciones por cepas de Staphylococcus aureus resistentes a meticilina (MRSA) como osteomielitis y artritis séptica o infecciones de la piel y de los tejidos blandos por MRSA.'),
(247, 'J01EE01', 'Cotrimoxazol  (Sulfametoxazol + Trimetoprim)', 'Solido oral', '(400 mg + 80 mg)  y  (800 mg + 160 mg)', 'O        Oral', 'Indicación general: Tratamiento de la neumonía producida por Pneumocystis jiroveci (P. carinii).  Nocardiosis, toxoplasmosis, listeriosis, infecciones por cepas de Staphylococcus aureus resistentes a meticilina (MRSA) como osteomielitis y artritis séptica o infecciones de la piel y de los tejidos blandos por MRSA.'),
(248, 'J01EE01', 'Cotrimoxazol  (Sulfametoxazol + Trimetoprim)', 'Liquido oral', '(200 mg + 40 mg)/5 mL', 'O        Oral', 'Indicación general: Tratamiento de la neumonía producida por Pneumocystis jiroveci (P. carinii).  Nocardiosis, toxoplasmosis, listeriosis, infecciones por cepas de Staphylococcus aureus resistentes a meticilina (MRSA) como osteomielitis y artritis séptica o infecciones de la piel y de los tejidos blandos por MRSA.'),
(249, 'J01FA01', 'Eritromicina', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Infecciones del tracto respiratorio superior e inferior, leves a moderadas, causadas por Streptococcus pyogenes, Streptococcus pneumoniae, o Haemophilus influenzae.   Amigdalitis, faringitis, difteria, neumonía adquirida en la comunidad, infecciones de la piel, músculos y tendones, enterocolitis, uretritis no gonocócica, prostatitis, cervicitis, tosferina, linfogranuloma venéreo y conjuntivitis del recién nacido causadas por Chlamydia trachomatis. Prevención de recaídas de la fiebre reumática, sífilis primaria en pacientes alérgicos a penicilina.  Prevención postexposición a Corynebacterium diphteriae y a Bordetella pertussis, acné vulgaris.'),
(250, 'J01FA01', 'Eritromicina', 'Solido oral (polvo)', '200 mg/5 mL y 400 mg/5 mL', 'O        Oral', 'Indicación general: Infecciones del tracto respiratorio superior e inferior, leves a moderadas, causadas por Streptococcus pyogenes, Streptococcus pneumoniae, o Haemophilus influenzae.   Amigdalitis, faringitis, difteria, neumonía adquirida en la comunidad, infecciones de la piel, músculos y tendones, enterocolitis, uretritis no gonocócica, prostatitis, cervicitis, tosferina, linfogranuloma venéreo y conjuntivitis del recién nacido causadas por Chlamydia trachomatis. Prevención de recaídas de la fiebre reumática, sífilis primaria en pacientes alérgicos a penicilina.  Prevención postexposición a Corynebacterium diphteriae y a Bordetella pertussis, acné vulgaris.'),
(251, 'J01FA02', 'Espiramicina', 'Solido oral', '3´000.000 UI', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en pacientes con toxoplasmosis, incluido embarazadas.'),
(252, 'J01FA09', 'Claritromicina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general:Infecciones del tracto respiratorio superior e inferior: faringitis, amigdalitis, sinusitis, exacerbación aguda de bronquitis, neumonía bacteriana.Infecciones no complicadas de la piel y tejidos blandos: foliculitis, celulitis y erisipela en caso de alergia a la penicilina.En esquemas de erradicación del Helicobacter Pylori.Exacerbación aguda de bronquitis.Infección por Mycobacterium complejo avium fortuito, Pénfigo bulloso.'),
(253, 'J01FA09', 'Claritromicina', 'Solido parenteral', '500 mg', 'P         Parenteral', 'Indicación general:Infecciones del tracto respiratorio superior e inferior: faringitis, amigdalitis, sinusitis, exacerbación aguda de bronquitis, neumonía bacteriana.Infecciones no complicadas de la piel y tejidos blandos: foliculitis, celulitis y erisipela en caso de alergia a la penicilina.En esquemas de erradicación del Helicobacter Pylori.Exacerbación aguda de bronquitis.Infección por Mycobacterium complejo avium fortuito, Pénfigo bulloso.'),
(254, 'J01FA09', 'Claritromicina', 'Solido oral (polvo)', '125 mg/5 mL y 250 mg/5 mL', 'O        Oral', 'Indicación general:Infecciones del tracto respiratorio superior e inferior: faringitis, amigdalitis, sinusitis, exacerbación aguda de bronquitis, neumonía bacteriana.Infecciones no complicadas de la piel y tejidos blandos: foliculitis, celulitis y erisipela en caso de alergia a la penicilina.En esquemas de erradicación del Helicobacter Pylori.Exacerbación aguda de bronquitis.Infección por Mycobacterium complejo avium fortuito, Pénfigo bulloso.'),
(255, 'J01FA10', 'Azitromicina', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general:Exacerbación de EPOC y otitis media por H. influenzae, faringitis, amigdalitis.Neumonía atípica, enfermedad pélvica inflamatoria, uretritis, cervicitis debido a infección por C. trachomatis.Gonorrea, Chancroide.Infección de la piel o tejido subcutáneo (no complicadas).'),
(256, 'J01FA10', 'Azitromicina', 'Solido oral (polvo)', '200 mg/5 mL', 'O        Oral', 'Indicación general:Exacerbación de EPOC y otitis media por H. influenzae, faringitis, amigdalitis.Neumonía atípica, enfermedad pélvica inflamatoria, uretritis, cervicitis debido a infección por C. trachomatis.Gonorrea, Chancroide.Infección de la piel o tejido subcutáneo (no complicadas).'),
(257, 'J01FF01', 'Clindamicina', 'Liquido parenteral', '150 mg/mL', 'P         Parenteral', 'Indicación general:Infecciones bacterianas severas ocasionadas por organismos anaeróbicos especialmente Bacteroides fragilis, estafilococos, estreptococos, neumococos en pacientes con hipersensibilidad a la penicilina.Infecciones óseas y articulares, infecciones dentales, infecciones ginecológicas. Septicemia, enfermedad pélvica inflamatoria.Erisipela, celulitis, bronquiectasias, neumonía por broncoaspiración, empiema, absceso pulmonar. '),
(258, 'J01FF01', 'Clindamicina', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general:Infecciones bacterianas severas ocasionadas por organismos anaeróbicos especialmente Bacteroides fragilis, estafilococos, estreptococos, neumococos en pacientes con hipersensibilidad a la penicilina.Infecciones óseas y articulares, infecciones dentales, infecciones ginecológicas. Septicemia, enfermedad pélvica inflamatoria.Erisipela, celulitis, bronquiectasias, neumonía por broncoaspiración, empiema, absceso pulmonar. '),
(259, 'J01GA01', 'Estreptomicina', 'Solido parenteral', '1.000 mg', 'P         Parenteral', 'Indicación general: Tuberculosis activa, plaga (Yersinia pestis), tularemia (Francisella tularensis), Brucella spp, Haemophilus influenzae y H. ducreyi.Endocarditis por bacterias gram positivas (Streptococcus viridans y Enterococcus faecalis).'),
(260, 'J01GB01', 'Tobramicina', 'Liquido para inhalacion', '60 mg/mL', 'I           Inhalatoria', 'Indicación exclusiva: Uso exclusivo en pacientes con fibrosis quística.'),
(261, 'J01GB01', 'Tobramicina', 'Solido para inhalacion', '28 mg', 'I           Inhalatoria', 'Indicación exclusiva: Uso exclusivo en pacientes con fibrosis quística.'),
(262, 'J01GB03', 'Gentamicina', 'Liquido parenteral', '10 mg/mL - 140 mg/mL', 'P         Parenteral', 'Indicación general: Infecciones por bacterias Gram-negativas como infecciones urinarias, infecciones quirúrgicas abdominales en asociación con otros antimicrobianos, infecciones gonocócicas no complicadas, Enfermedad Pélvica Inflmatoria severa asocida a clindamicina.Infecciones respiratorias en niños con enfermedad fibroquística.Meningitis, septicemias, infecciones de la piel por gérmenes sensibles, infecciones oculares.Septicemia y sepsis neonatal, la meningitis, infección del tracto biliar, prostatitis, neumonía nosocomial, coadyuvante en la meningitis por Listeria.'),
(263, 'J01GB06', 'Amikacina', 'Liquido parenteral', '50 mg/mL - 250 mg/mL', 'P         Parenteral', 'Indicación general: Infecciones severas por enterobacterias que incluyen: Pseudomona aeruginosa, klebsiella, enterobacter, etc., infecciones óseas, infecciones respiratorias nosocomiales, endocarditis, septicemia.'),
(264, 'J01MA02', 'Ciprofloxacina', 'Liquido parenteral', '2 mg/mL, 10 mg/mL y  20 mg/mL', 'P         Parenteral', 'Indicación general:Infecciones por bacterias susceptibles al medicamento (Gram-positivas y Gram-negativas, con mayor actividad sobre las Gram-negativas incluyendo Salmonella, Shigella, Campylobacter, Neisseria spp. y Pseudomonas).Infecciones de vías urinarias, prostatitis, infecciones respiratoriasFiebre tifoidea.'),
(265, 'J01MA02', 'Ciprofloxacina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general:Infecciones por bacterias susceptibles al medicamento (Gram-positivas y Gram-negativas, con mayor actividad sobre las Gram-negativas incluyendo Salmonella, Shigella, Campylobacter, Neisseria spp. y Pseudomonas).Infecciones de vías urinarias, prostatitis, infecciones respiratoriasFiebre tifoidea.'),
(266, 'J01MA12', 'Levofloxacina', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Tuberculosis resistente, en combinación con otras drogas antituberculosis.Sinusitis bacteriana aguda.Exacerbación aguda de la bronquitis crónica.Neumonía adquirida en la comunidad.Infecciones complicadas de piel y tejidos blandos.Prostatitis bacteriana crónica, infección de las vías urinarias.Ántrax.'),
(267, 'J01MA12', 'Levofloxacina', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Tuberculosis resistente, en combinación con otras drogas antituberculosis.Sinusitis bacteriana aguda.Exacerbación aguda de la bronquitis crónica.Neumonía adquirida en la comunidad.Infecciones complicadas de piel y tejidos blandos.Prostatitis bacteriana crónica, infección de las vías urinarias.Ántrax.'),
(268, 'J01XA01', 'Vancomicina', 'Solido parenteral', '500 mg y 1.000 mg', 'P         Parenteral', 'Indicación general:Infecciones severas causadas por Staphylococcus aureus (MRSA) resistente a la meticilina, Staphylococcus albus coagulasa negativa, Enterococcus faecalis, Streptococcus spp., Streptococcus pneumoniae, Enterococcus spp., Staphylococcus spp., Clostridium difficile. Infecciones de la piel y los tejidos blandos, infecciones en los huesos y las articulaciones, neumonía adquirida en la comunidad (NAC), neumonía intrahospitalaria, incluyendo la neumonía asociada a la ventilación mecánica (NAV), endocarditis infecciosa, profilaxis perioperatoria en pacientes con alto riesgo de desarrollar endocarditis bacteriana, septicemia.'),
(269, 'J01XB01', 'Colistina', 'Solido parenteral', '100 mg', 'P         Parenteral', 'Indicación exclusiva: Uso exclusivo en pacientes con cultivos bacterianos de  K. pneumoniae, E. coli y otras enterobacterias, así como de bacterias no fermentadoras como Pseudomonas aeruginosa, Acinetobacter. baumannii,  sensibles a colistina y resistente a otros antibióticos como los carbapenémicos por presencia de carbapenemasas o metalobetalactamasas.'),
(270, 'J01XD01', 'Metronidazol', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Infecciones por bacterias anaerobias y protozoos.DiverticulitisColitis por Clostridium difficile Infecciones por Bacteroides fragilis. Coadyuvante en el manejo de determinadas infecciones intrabdominales, ginecológicas, septicemia, sistema nervioso central, piel. Profilaxis perioperatoria colorectal. Rosácea y erradicación de H. pylori. Absceso hepático amebiano, tratamiento codyuvante en Helicobacter pylori, Giardiasis y Dracunculiasis.'),
(271, 'J01XE01', 'Nitrofurantoína', 'Liquido oral', '5 mg/mL', 'O        Oral', 'Indicación general: Infección de las vías urinarias (cistitis no complicada e infecciones recurrentes).Activa contra infecciones causadas por enterococos resistentes a la vancomicina y enterobacterias productoras de betalactamasas de espectro extendido (BLEE) excepto Klebsiella, Proteus y Serratias que son intrísicamente resistentes.'),
(272, 'J01XE01', 'Nitrofurantoína', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Infección de las vías urinarias (cistitis no complicada e infecciones recurrentes).Activa contra infecciones causadas por enterococos resistentes a la vancomicina y enterobacterias productoras de betalactamasas de espectro extendido (BLEE) excepto Klebsiella, Proteus y Serratias que son intrísicamente resistentes.'),
(273, 'J01XX01', 'Fosfomicina', 'Solido oral', '500 mg', 'O        Oral', 'Indicacion general: Tratamiento de infecciones del tracto urinario en el embarazo (trometamol). Infecciones del tracto urinario no complicadas. Infecciones del tracto gastrointestinal. Infecciones quirúrgicas e infecciones dermatológicas producidas por gérmenes sensibles a fosfomicina.'),
(274, 'J01XX01', 'Fosfomicina', 'Solido oral (granulos) Trometamol', '3 g', 'O        Oral', 'Indicacion general: Tratamiento de infecciones del tracto urinario en el embarazo (trometamol). Infecciones del tracto urinario no complicadas. Infecciones del tracto gastrointestinal. Infecciones quirúrgicas e infecciones dermatológicas producidas por gérmenes sensibles a fosfomicina.'),
(275, 'J01XX01', 'Fosfomicina', 'Solido oral (polvo)', '250 mg/5 mL', 'O        Oral', 'Indicacion general: Tratamiento de infecciones del tracto urinario en el embarazo (trometamol). Infecciones del tracto urinario no complicadas. Infecciones del tracto gastrointestinal. Infecciones quirúrgicas e infecciones dermatológicas producidas por gérmenes sensibles a fosfomicina.'),
(276, 'J01XX01', 'Fosfomicina', 'Solido parenteral', '1 g', 'P         Parenteral', 'Indicacion general: Tratamiento de infecciones del tracto urinario en el embarazo (trometamol). Infecciones del tracto urinario no complicadas. Infecciones del tracto gastrointestinal. Infecciones quirúrgicas e infecciones dermatológicas producidas por gérmenes sensibles a fosfomicina.'),
(277, 'J01XX08', 'Linezolid', 'Liquido parenteral', '2 mg/mL', 'P         Parenteral', 'Indicación exclusiva:Infecciones causadas por Enterococcus faecium resistente a la vancomicina, Staphylococcus aureus sensible a la meticilina, Streptococcus pyogenes, Streptococcus pnemoniae. Infecciones de la piel y tejidos blandos, neumonía adquirida en la comunidad y neumonía nosocomial en adultos. TB resistente en asociación a otros medicamentos en esquema individualizado.'),
(278, 'J01XX08', 'Linezolid', 'Solido oral', '600 mg', 'O        Oral', 'Indicación exclusiva:Infecciones causadas por Enterococcus faecium resistente a la vancomicina, Staphylococcus aureus sensible a la meticilina, Streptococcus pyogenes, Streptococcus pnemoniae. Infecciones de la piel y tejidos blandos, neumonía adquirida en la comunidad y neumonía nosocomial en adultos. TB resistente en asociación a otros medicamentos en esquema individualizado.'),
(279, 'J02AA01', 'Amfotericina B', 'Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación general:AnfotericinaMicosis profundas sistémicas. Infecciones graves del sistema nervioso central y sistémico causadas por hongos susceptibles. Indicación exclusiva:Anfotericina formas lipídicasMicosis sistémica en pacientes con alto riesgo de desarrollar falla renal. Uso exclusivo bajo resolución de comité de infecciones.'),
(280, 'J02AA01', 'Amfotericina B  (formas lipidicas)', 'Liquido parenteral/Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación general:AnfotericinaMicosis profundas sistémicas. Infecciones graves del sistema nervioso central y sistémico causadas por hongos susceptibles. Indicación exclusiva:Anfotericina formas lipídicasMicosis sistémica en pacientes con alto riesgo de desarrollar falla renal. Uso exclusivo bajo resolución de comité de infecciones.'),
(281, 'J02AC01', 'Fluconazol', 'Liquido parenteral', '2 mg/mL', 'P         Parenteral', 'Indicación general: Prevención y tratamiento de infecciones fúngicas por Candida de la piel y mucosas; meningitis provocada por Cryptococcus neoformans., candidiasis invasiva. Infección por Coccidioides immitis.'),
(282, 'J02AC01', 'Fluconazol', 'Solido oral', '150 mg', 'O        Oral', 'Indicación general: Prevención y tratamiento de infecciones fúngicas por Candida de la piel y mucosas; meningitis provocada por Cryptococcus neoformans., candidiasis invasiva. Infección por Coccidioides immitis.'),
(283, 'J02AC02', 'Itraconazol', 'Liquido oral', '10 mg/mL', 'O        Oral', 'Indicación general: Tratamiento de Aspergilosis invasiva, blastomicosis pulmonar y extra pulmonar en pacientes inmuno comprometido o no.Candidiasis esofágica, orofaríngea. Histoplasmosis diseminada, histoplasmosis pulmonar, histoplasmosis diseminada no meníngea en pacientes inmunocomprometidos.Onicomicosis por dermatofitos.'),
(284, 'J02AC02', 'Itraconazol', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Tratamiento de Aspergilosis invasiva, blastomicosis pulmonar y extra pulmonar en pacientes inmuno comprometido o no.Candidiasis esofágica, orofaríngea. Histoplasmosis diseminada, histoplasmosis pulmonar, histoplasmosis diseminada no meníngea en pacientes inmunocomprometidos.Onicomicosis por dermatofitos.'),
(285, 'J02AC03', 'Voriconazol', 'Solido oral', '200 mg', 'O        Oral', 'Indicación general: Sólido parenteral: Tratamiento de aspergilosis invasiva, candidemia en pacientes no neutropénicos, candidiasis esofágica, infecciones invasivas graves por Cándida (incluyendo C. krusei) resistente a fluconazol, infecciones por Scedosporium spp. y Fusarium spp. Profilaxis en caso de trasplantes. Indicación exclusiva: Sólido oral: Uso exclusivo en pacientes que requieren terapia ambulatoria luego de recibir voriconazol parenteral.'),
(286, 'J02AC03', 'Voriconazol', 'Solido parenteral', '200 mg', 'P         Parenteral', 'Indicación general: Sólido parenteral: Tratamiento de aspergilosis invasiva, candidemia en pacientes no neutropénicos, candidiasis esofágica, infecciones invasivas graves por Cándida (incluyendo C. krusei) resistente a fluconazol, infecciones por Scedosporium spp. y Fusarium spp. Profilaxis en caso de trasplantes. Indicación exclusiva: Sólido oral: Uso exclusivo en pacientes que requieren terapia ambulatoria luego de recibir voriconazol parenteral.'),
(287, 'J02AX04', 'Caspofungina', 'Solido parenteral', '50 mg y 70 mg', 'P         Parenteral', 'Indicación exclusiva: Neutropenia febril con sospecha de infección fúngica . 11a. rev. Candidiasis invasiva en pacientes adultos y pediátricos. 11a. rev Uso exclusivo en pacientes con Aspergilosis resistente a voriconazol y cuando esté contraindicado el uso de Anfotericina B. 10ma.rev.'),
(288, 'J04AB01', 'Cicloserina', 'Solido oral', '250 mg', 'O        Oral', 'Indicación general: Tuberculosis activa, resistente a medicamentos de primera línea en combinación con otros medicamentos.'),
(289, 'J04AB02', 'Rifampicina', 'Liquido oral', '100 mg/5 mL', 'O        Oral', 'Indicación general: Tuberculosis activa.Lepra. Brucelosis.Portadores de meningnococos.'),
(290, 'J04AB02', 'Rifampicina', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general: Tuberculosis activa.Lepra. Brucelosis.Portadores de meningnococos.'),
(291, 'J04AB30', 'Capreomicina', 'Solido parenteral', '1.000 mg', 'P         Parenteral', 'Indicación general: Tuberculosis resistente, en combinación con otros antituberculosos, como terapia de segunda línea.'),
(292, 'J04AC01', 'Isoniazida', 'Solido oral', '100 mg y 300 mg', 'O        Oral', 'Indicación general: Tuberculosis activa y latente. Tuberculosis latente en pacientes portadores de VIH y otras inmunosupresiones.'),
(293, 'J04AD03', 'Etionamida', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Tuberculosis resistente o por intolerancia a medicamentos de primera línea.'),
(294, 'J04AK01', 'Pirazinamida', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Tuberculosis en combinación con otros medicamentos.'),
(295, 'J04AK02', 'Etambutol', 'Solido oral', '400 mg', 'O        Oral', 'Indicación general: Tuberculosis en combinación con otros medicamentos.'),
(296, 'J04AK05', 'Bedaquilina', 'Solido oral', '100 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes adultos y pediátricos con tuberculosis pulmonar multirresistente (TB-MDR). Se deben seguir las recomendaciones oficiales sobre el uso adecuado de los antibacterianos.'),
(297, 'J04AK06', 'Delamanida', 'Solido oral', '50 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes adultos y pediátricos con tuberculosis pulmonar multirresistente (TB-MDR). Se deben tener en cuenta las recomendaciones oficiales sobre el uso adecuado de agentes antibacterianos.'),
(298, 'J04AK08', 'Pretomanida', 'Solido oral', '200 mg', 'O        Oral', 'Indicación exclusiva. Pretomanid está indicado en combinación con bedaquilina y linezolid en adultos para el tratamiento de la tuberculosis (TB) pulmonar extremadamente resistente (XDR, por sus siglas en inglés) o multirresistente (MDR, por sus siglas en inglés) con intolerancia al tratamiento o sin respuesta al tratamiento. inclusión 11ra. revisión Deben tenerse en cuenta las directrices oficiales sobre el uso apropiado de los antibacterianos.');
INSERT INTO `medicamento` (`id_medicamento`, `codigo`, `descripcion`, `forma`, `concentracion`, `viaadmin`, `indicaciones`) VALUES
(299, 'J04AM02', 'Rifampicina + Isoniazida', 'Solido oral', '75 mg + 50 mg 150 mg + 75 mg 150 mg + 150 mg 300 mg + 150 mg', 'O        Oral', 'Indicación general: Tuberculosis, tratamiento a dosis fijas. Uso en la fase de continuación de tuberculosis.'),
(300, 'J04AM03', 'Etambutol + Isoniazida', 'Solido oral', '400 mg + 150 mg', 'O        Oral', 'Indicación general: Tuberculosis en combinación con otros medicamentos.'),
(301, 'J04AM05', 'Rifampicina + Pirazinamida + Isoniazida', 'Solido oral', '120 mg + 300 mg + 60 mg 150 mg + 400 mg + 75 mg', 'O        Oral', 'Indicación general: Tuberculosis; profilaxis de tuberculosis. Uso en la fase inicial de tuberculosis.'),
(302, 'J04AM06', 'Rifampicina + Pirazinamida + Etambutol + Isoniazida', 'Solido oral', '150 mg + 400 mg + 275 mg + 75 mg', 'O        Oral', 'Indicación general: Tuberculosis dosis fija. Uso en la fase inicial de tuberculosis.'),
(303, 'J04BA01', 'Clofazimina', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general:Lepra multibacilar.'),
(304, 'J04BA02', 'Dapsona', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Lepra. Neumonía por Pneumocystis jiroveci.'),
(305, 'J05AB01', 'Aciclovir', 'Liquido oral', '200 mg/5 mL', 'O        Oral', 'Indicación general: Indicado en el tratamiento de infecciones por virus del herpes simplex, herpes genital y herpes mucocutáneo.Herpes Zoster (culebrilla), varicela Zoster (varicela).'),
(306, 'J05AB01', 'Aciclovir', 'Solido oral', '200 mg - 800 mg', 'O        Oral', 'Indicación general: Indicado en el tratamiento de infecciones por virus del herpes simplex, herpes genital y herpes mucocutáneo.Herpes Zoster (culebrilla), varicela Zoster (varicela).'),
(307, 'J05AB01', 'Aciclovir', 'Solido parenteral', '250 mg', 'P         Parenteral', 'Indicación general: Indicado en el tratamiento de infecciones por virus del herpes simplex, herpes genital y herpes mucocutáneo.Herpes Zoster (culebrilla), varicela Zoster (varicela).'),
(308, 'J05AB14', 'Valganciclovir', 'Solido oral', '450 mg', 'O        Oral', 'Indicación general: Tratamiento de inducción y mantenimiento de la retinitis por citomegalovirus (CMV) en pacientes adultos con síndrome de inmunodeficiencia adquirida (SIDA).Prevención de la enfermedad por CMV en adultos y niños seronegativos al CMV que han recibido un trasplante de órgano sólido de un donante seropositivo al CMV.'),
(309, 'J05AE03', 'Ritonavir', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Indicado en combinación con otros agentes antirretrovirales para el tratamiento de la infección por VIH. Refuerzo de inhibidores de proteasa en el tratamiento de la infección por VIH.'),
(310, 'J05AE08', 'Atazanavir', 'Solido oral', '150 mg y 200 mg', 'O        Oral', 'Indicación general:Tratamiento de pacientes adultos y pediátricos mayores de 6 años de edad usado como tercera droga en el esquema de terapia antirretroviral en infección por el Virus de la Inmunodeficiencia Humana (VIH), administrado de forma conjunta con dosis baja de ritonavir y en combinación con otros antirretrovirales.'),
(311, 'J05AE10', 'Darunavir', 'Solido oral', '400 mg - 800 mg', 'O        Oral', 'Indicación general:Indicado para el tratamiento de adultos y niños mayores de 3 años infectados por el Virus de la Inmunodeficiencia Humana (resistencia a la terapia estándar con otros inhibidores de la proteasa), puede administrarse con dosis bajas de ritonavir o con otros agentes antirretrovirales.'),
(312, 'J05AF01', 'Zidovudina', 'Liquido oral', '50 mg/5 mL', 'O        Oral', 'Indicación general:Tratamiento de la infección producida por el Virus de la Inmunodeficiencia Humana (VIH) en adultos y niños, en combinación con otros agentes antirretrovirales. En monoterapia está indicada para mujeres embarazadas VIH positivas (con más de 14 semanas de gestación) y en sus hijos recién nacidos para profilaxis primaria de la transmisión materno-fetal del VIH.'),
(313, 'J05AF01', 'Zidovudina', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general:Tratamiento de la infección producida por el Virus de la Inmunodeficiencia Humana (VIH) en adultos y niños, en combinación con otros agentes antirretrovirales. En monoterapia está indicada para mujeres embarazadas VIH positivas (con más de 14 semanas de gestación) y en sus hijos recién nacidos para profilaxis primaria de la transmisión materno-fetal del VIH.'),
(314, 'J05AF01', 'Zidovudina', 'Solido oral', '100 mg y 300 mg', 'O        Oral', 'Indicación general:Tratamiento de la infección producida por el Virus de la Inmunodeficiencia Humana (VIH) en adultos y niños, en combinación con otros agentes antirretrovirales. En monoterapia está indicada para mujeres embarazadas VIH positivas (con más de 14 semanas de gestación) y en sus hijos recién nacidos para profilaxis primaria de la transmisión materno-fetal del VIH.'),
(315, 'J05AF05', 'Lamivudina', 'Liquido oral', '50 mg/5 mL', 'O        Oral', 'Indicación general: Indicado en terapia de combinación antirretroviral para el tratamiento de adultos y niños infectados por el Virus de la Inmunodeficiencia Humana (VIH).   Tratamiento de hepatitis B crónica en adultos con enfermedad hepática compensada con evidencia de replicación viral activa, niveles de alanina aminotransferasa (ALT) sérica elevados de forma persistente y evidencia histológica de inflamación hepática activa y/o fibrosis. Sólo se debe considerar el comienzo del tratamiento con lamivudina cuando no está disponible o no sea apropiado el uso de un agente antiviral alternativo con una barrera genética más alta a resistencia.'),
(316, 'J05AF05', 'Lamivudina', 'Solido oral', '150 mg', 'O        Oral', 'Indicación general: Indicado en terapia de combinación antirretroviral para el tratamiento de adultos y niños infectados por el Virus de la Inmunodeficiencia Humana (VIH).   Tratamiento de hepatitis B crónica en adultos con enfermedad hepática compensada con evidencia de replicación viral activa, niveles de alanina aminotransferasa (ALT) sérica elevados de forma persistente y evidencia histológica de inflamación hepática activa y/o fibrosis. Sólo se debe considerar el comienzo del tratamiento con lamivudina cuando no está disponible o no sea apropiado el uso de un agente antiviral alternativo con una barrera genética más alta a resistencia.'),
(317, 'J05AF06', 'Abacavir', 'Liquido oral', '10 mg/mL y 20 mg/mL', 'O        Oral', 'Indicación general:Infección por VIH en combinación con otro inhibidor de la transcriptasa inversa análogo nucleosídico, como eje del esquema de la terapia antirretroviral.'),
(318, 'J05AF06', 'Abacavir', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general:Infección por VIH en combinación con otro inhibidor de la transcriptasa inversa análogo nucleosídico, como eje del esquema de la terapia antirretroviral.'),
(319, 'J05AF07', 'Tenofovir disoproxil fumarato', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general: Indicado en combinación con otros agentes antirretrovirales para el tratamiento de la infección por VIH.Hepatitis B crónica.'),
(320, 'J05AF09', 'Emtricitabina', 'Liquido oral', '10 mg/mL', 'O        Oral', 'Indicación general:Infección por VIH, en combinación con otros antirretrovirales HIV profilaxis post-exposición 200 mg vía oral cada día Como parte de un regimen multidroga'),
(321, 'J05AF09', 'Emtricitabina', 'Solido oral', '200 mg', 'O        Oral', 'Indicación general:Infección por VIH, en combinación con otros antirretrovirales HIV profilaxis post-exposición 200 mg vía oral cada día Como parte de un regimen multidroga'),
(322, 'J05AG01', 'Nevirapina', 'Liquido oral', '50 mg/5 mL', 'O        Oral', 'Indicación general:Infección por VIH, en combinación con otros antirretrovirales.'),
(323, 'J05AG01', 'Nevirapina', 'Solido oral', '200 mg', 'O        Oral', 'Indicación general:Infección por VIH, en combinación con otros antirretrovirales.'),
(324, 'J05AG03', 'Efavirenz', 'Liquido oral', '30 mg/mL', 'O        Oral', 'Indicación general: Infección por VIH, en combinación con otros antiretrovirales.'),
(325, 'J05AG03', 'Efavirenz', 'Solido oral', '50 mg - 600 mg', 'O        Oral', 'Indicación general: Infección por VIH, en combinación con otros antiretrovirales.'),
(326, 'J05AG04', 'Etravirina', 'Solido oral', '100 mg y 200 mg', 'O        Oral', 'Indicación general:Tratamiento de la infección por Virus de la Inmunodeficiencia Humana tipo-1 (VIH-1), en combinación con dos o más agentes agentes antirretrovirales adicionales; en pacientes con tratamiento previo, que exhiben replicación viral con resistencia documentada a inhibidores no nucleótidos de la transcriptasa inversa (INNTI).'),
(327, 'J05AH02', 'Oseltamivir', 'Solido oral', '75 mg', 'O        Oral', 'Indicación general:Tratamiento y profilaxis para la Influenza A y B.Tratamiento y profilaxis para la Influenza A H1N1.'),
(328, 'J05AJ01', 'Raltegravir', 'Solido oral', '400 mg', 'O        Oral', 'Indicación general: Infección por VIH, en combinación con otros antiretrovirales.'),
(329, 'J05AJ03', 'Dolutegravir sódico', 'Solido oral', '50 mg', 'O        Oral', 'Indicación exclusiva: Combinado con otros medicamentos para el tratamiento de adultos, adolescentes y niños mayores de 6 años infectados por el Virus de Inmunodeficiencia Humana (VIH). Uso en combinación con inhibidores de la transcriptasa reversa.'),
(330, 'J05AP01', 'Ribavirina', 'Solido oral', '200 mg - 600 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento de la infección por el virus de la hepatitis C.'),
(331, 'J05AP08', 'Sofosbuvir', 'Solido oral', '400 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento de hepatitis C.'),
(332, 'J05AR01', 'Zidovudina + Lamivudina', 'Solido oral', '300 mg + 150 mg', 'O        Oral', 'Indicación general: Infección por VIH, en combinación con otros antirretrovirales.'),
(333, 'J05AR02', 'Lamivudina + Abacavir', 'Solido oral', '300 mg + 600 mg', 'O        Oral', 'Indicación general: Infección por VIH, en combinación con otros antirretrovirales.'),
(334, 'J05AR03', 'Tenofovir Disoproxil Fumarato + Emtricitabina', 'Solido oral', '300 mg + 200 mg', 'O        Oral', 'Indicación general: Infección por VIH, en combinación con otros antirretrovirales. En adultos y adolescentes que pesen al menos 35 Kg.Profilaxis previa a la exposición al VIH-1Indicado en combinación con prácticas sexuales más seguras para reducir el riesgo de VIH-1 adquirido sexualmente en adultos y adolescentes en riesgo que pesen ≥35 Kg  '),
(335, 'J05AR06', 'Tenofovir Disoproxil Fumarato+ Emtricitabina + Efavirenz', 'Solido oral', '300 mg + 200 mg + 600 mg', 'O        Oral', 'Indicación general: Tratamiento de  infección por VIH, virus de inmunodeficiencia humana 1.'),
(336, 'J05AR10', 'Lopinavir + Ritonavir', 'Liquido oral', '80 mg + 20 mg/mL', 'O        Oral', 'Indicación general:Infección por VIH, en combinación con otros antirretrovirales.'),
(337, 'J05AR10', 'Lopinavir + Ritonavir', 'Solido oral', '(100 mg + 25 mg) y  (200 mg + 50 mg)', 'O        Oral', 'Indicación general:Infección por VIH, en combinación con otros antirretrovirales.'),
(338, 'J06AA01', 'Diftérica antitoxina', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización pasiva contra difteria o sospecha de difteria (sin confirmación bacteriológica de la infección).'),
(339, 'J06AA02', 'Tetánica antitoxina', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización pasiva contra tétanos.'),
(340, 'J06AA03', 'Suero antiofídico polivalente', 'Liquido parenteral/Solido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización pasiva en envenenamiento por accidente ofídico evidente, con signos precoces como: edema, flictenas, parálisis neurotóxica, alteración de la coagulación y/o hemorragia; por especies venenosas como: Familia Viperidae: Bothrops asper, Bothrops atrox, Bothrops xantograma, Bothrops microphthalmus, Bothriopsis bilineata, Bothriopsis taeniata, Lachesis muta, entre otras.Familia Elapidae: Micrurus spp.'),
(341, 'J06BA02', 'Inmunoglobulina humana normal', 'Liquido parenteral/Solido parenteral', '50 mg - 200 mg', 'P         Parenteral', 'Indicación general: Inmunodeficiencia primaria, inmunodeficiencia secundaria. Púrpura trombocitopénica idiopática. Polineuropatía desmielinizante inflamatoria crónica. Trasplante de médula ósea. Leucemia linfoide de células B crónica. Neuropatía multifocal.'),
(342, 'J06BB01', 'Inmunoglobulina anti D (rh)', 'Liquido parenteral', '125 mcg - 300 mcg  (625 UI - 1500 UI)', 'P         Parenteral', 'Indicación general: Incompatibilidad Rh en embarazo. Incompatibilidad Rh en transfusiones.'),
(343, 'J06BB02', 'Inmunoglobulina antitetánica', 'Liquido parenteral/Solido parenteral', '200 UI - 500 Ul', 'P         Parenteral', 'Indicación general: Inmunización pasiva contra el tétanos como parte del tratamiento de las heridas tetanígenas en personas: no inmunizadas o incompletamente inmunizadas, con historia desconocida de inmunización, aquellas que recibieron la última dosis de vacuna antitetánica hace más de 10 años y pacientes con disminución de la inmunidad.'),
(344, 'J06BB04', 'Inmunoglobulina antihepatitis B', 'Liquido parenteral', '10 mcg/0,5 mL y  20 mcg/mL', 'P         Parenteral', 'Indicación exclusiva: Profilaxis para no respondedores conocidos a la vacuna o rechazo de la vacuna de hepatitis B.En caso de exposición accidental o abuso sexual en sujetos no inmunizados (incluidas personas cuya vacunación es incompleta o desconocida), incluir a la pareja sexual no infectada.En pacientes en hemodiálisis, hasta que surta efecto la vacuna.En recién nacidos de madres portadoras del virus de la hepatitis B.Prevención de la reinfección por virus de la hepatitis B después de trasplante hepático debido a insuficiencia hepática inducida por la hepatitis B.'),
(345, 'J06BB05', 'Inmunoglobulina antirrábica', 'Liquido parenteral', '150 UI/mL - 1500Ul/mL', 'P         Parenteral', 'Indicación general: Profilaxis post exposición de rabia, en personas expuestas a mordeduras o arañazos de animales que se conoce o sospecha sean transmisores de rabia. En individuos no inmunizados (junto con la vacuna contra la rabia). Inmunización previa a personas en alto riesgo (veterinarios, laboratoristas, administradores de vacuna con riesgo de punturas, viajantes a países con rabia endémica).'),
(346, 'J07AH02', 'Vacuna antimeningococo', 'Liquido parenteral/Solido parenteral', '', 'P         Parenteral', 'Indicación general:Inmunización activa para la prevención de la enfermedad meningocócica.'),
(347, 'J07AJ52', 'Toxoide diftérico tetánico + Vacuna pertussis  (Vacuna triple DPT)', 'Liquido parenteral', '> 30 UI > 40 UI', 'P         Parenteral', 'Indicación general: Prevención y control de la difteria toxigénica, tosferina y toxina del tetanos.'),
(348, 'J07AL02', 'Vacuna antineumococo (polisacárido y conjugado)', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra neumococo.'),
(349, 'J07AM01', 'Toxoide tetánico', 'Liquido parenteral', '> 40 UI/0,5 mL', 'P         Parenteral', 'Indicación general: Inmunización activa contra Clostridium tetani (tétanos). Co-tratamiento del manejo de heridas con riesgo de provocar tétanos, si la inmunización primaria fue incompleta o los refuerzos no se han efectuado oportunamente.'),
(350, 'J07AM51', 'Toxoide tetánico, combinaciones con toxoide diftérico', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general:Inmunización activa contra tétanos y difteria.'),
(351, 'J07AN01', 'Vacuna BCG antituberculosa', 'Solido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra formas graves de tuberculosis (miliar o meníngea).'),
(352, 'J07BB02', 'Vacuna de la Influenza Inactivado y Separado, o Antígeno Superficial', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general:Inmunización activa para prevenir la influenza.'),
(353, 'J07BC01', 'Vacuna antihepatitis B', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra la infección de la hepatitis B.'),
(354, 'J07BC02', 'Vacuna antihepatitis A', 'Liquido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra hepatitis A.'),
(355, 'J07BD52', 'Vacuna triple viral (Parotiditis-Sarampión- Rubéola)', 'Solido parenteral', '', 'P         Parenteral', 'Indicación general: Prevención del sarampión, rubéola y parotiditis.'),
(356, 'J07BD53', 'Vacuna Sarampión, Virus Vivo Atenuado Combinado con la Vacuna contra la Rubéola', 'Solido parenteral', '', 'P         Parenteral', 'Indicación general:Inmunización activa contra el sarampión y rubéola.'),
(357, 'J07BF02', 'Vacuna antipoliomielítica (tOPV)', 'Liquido oral', '', 'O        Oral', 'Indicación general: Inmunización activa contra poliomielitis.'),
(358, 'J07BF03', 'Vacuna Poliomielitis, Inactivado, Virus Entero, Trivalente', 'Liquido parenteral', '', 'P         Parenteral', 'Indicacion general:Inmunización activa contra poliomielitis cuando la vacuna oral está contraindicada. '),
(359, 'J07BF04', 'Vacuna Poliomielitis, Virus Vivo Atenuado, Bivalente (bOPV)', 'Liquido oral', '', 'O        Oral', 'Indicación general: Inmunización activa contra la poliovirus tipo 1 y tipo 3.'),
(360, 'J07BG01', 'Vacuna antirrábica, Virus completo Inactivado', 'Liquido parenteral/Solido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra la rabia.'),
(361, 'J07BH01', 'Vacuna antirotavirus, Virus vivo Atenuado', 'Liquido oral', '', 'O        Oral', 'Indicación general: Inmunización activa contra rotavirus de los serotipos contenidos en la vacuna.'),
(362, 'J07BK01', 'Vacuna Varicela, Virus Vivo Atenuado', 'Solido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra varicela.'),
(363, 'J07BL01', 'Vacuna antiamarílica, Virus Vivo Atenuado', 'Solido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra la fiebre amarilla.'),
(364, 'J07CA11', 'Vacuna pentavalente  viral  (Difteria - haemophilus influenzae B - pertussis -  tétanos - hepatitis B )', 'Liquido parenteral/Solido parenteral', '', 'P         Parenteral', 'Indicación general: Inmunización activa contra difteria, Haemophilus influenza B, tosferina, tétanos y hepatitis B.'),
(365, 'L01AA01', 'Ciclofosfamida', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general:Neoplasias sólidas y hematológicas (monoterapia o en combinación con otros agentes).Acondicionamiento para trasplante de médula ósea.Enfermedades autoinmunes que comprometen la vida como: formas progresivas graves de nefritis lúpica y granulomatosis de Wegener. Antídoto:Intoxicación por paraquat. '),
(366, 'L01AA01', 'Ciclofosfamida', 'Solido parenteral', '500 mg y 1.000 mg', 'P         Parenteral', 'Indicación general:Neoplasias sólidas y hematológicas (monoterapia o en combinación con otros agentes).Acondicionamiento para trasplante de médula ósea.Enfermedades autoinmunes que comprometen la vida como: formas progresivas graves de nefritis lúpica y granulomatosis de Wegener. Antídoto:Intoxicación por paraquat. '),
(367, 'L01AA02', 'Clorambucilo', 'Solido oral', '2 mg', 'O        Oral', 'Indicación general: Linfoma de Hodgkin.Linfoma no Hodgkin.Leucemia linfocítica crónica.Macroglobulinemia de Waldestrom.'),
(368, 'L01AA03', 'Melfalán', 'Solido oral', '2 mg', 'O        Oral', 'Indicación general:Melanoma maligno, sarcoma de tejidos blandos.Mieloma múltiple.Cáncer de ovario.Neuroblastoma en la infancia junto con trasplante de progenitores hematopoyéticos, monoterapia o en combinación con radioterapia y/o otros fármacos citotóxicos. Acondicionamiento para trasplante de progenitores hematopoyéticos.'),
(369, 'L01AA03', 'Melfalán', 'Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación general:Melanoma maligno, sarcoma de tejidos blandos.Mieloma múltiple.Cáncer de ovario.Neuroblastoma en la infancia junto con trasplante de progenitores hematopoyéticos, monoterapia o en combinación con radioterapia y/o otros fármacos citotóxicos. Acondicionamiento para trasplante de progenitores hematopoyéticos.'),
(370, 'L01AA06', 'Ifosfamida', 'Solido parenteral', '1 g', 'P         Parenteral', 'Indicación general:Cáncer de testículo  (seminoma, teratoma, teratocarcinoma).  Sarcomas de partes blandas, osteosarcomas.Linfomas de Hodgkin y no Hodgkin.Cáncer de páncreas.Cáncer de ovario.Cáncer de endometrio.Cáncer de cuello uterinoCáncer de mama.Cáncer de pulmón de células pequeñas.Hipernefroma.'),
(371, 'L01AA09', 'Bendamustina', 'Solido parenteral', '25 mg y 100 mg', 'P         Parenteral', 'Indicación exclusiva: Leucemia linfocítica crónica. Linfoma folicular (indolente). Uso exclusivo bajo protocolo.'),
(372, 'L01AX03', 'Temozolomida', 'Solido oral', '20 mg - 250 mg', 'O        Oral', 'Indicación general:Glioblastoma multiforme de nuevo diagnóstico concomitante con radioterapia (RT) y posteriormente como tratamiento en monoterapia.Niños a partir de tres años de edad, adolescentes y pacientes adultos con astrocitoma anaplásico, glioblastoma multiforme que presentan recurrencia o progresión después de terapia estándar.'),
(373, 'L01AX04', 'Dacarbazina', 'Solido parenteral', '100 mg y 200 mg', 'P         Parenteral', 'Indicación general: Linfoma de Hodgkin.Melanoma metastásico.Sarcomas de tejidos blandos.'),
(374, 'L01BA01', 'Metotrexato', 'Liquido parenteral', '25 mg/mL', 'P         Parenteral', 'Indicación general: Leucemia linfoide aguda.Cáncer de mama.Cáncer de cabeza y cuello.Micosis fungoides.Osteosarcoma.Neoplasia trofoblástica gestacional (coriocarcinoma).Artritis reumatoide activa en pacientes adultos.Psoriasis severa incapacitante. Embarazo ectópico no accidentado.Cáncer de vejiga. Linfoma no Hodgkin.'),
(375, 'L01BA01', 'Metotrexato', 'Solido oral', '2,5 mg', 'O        Oral', 'Indicación general: Leucemia linfoide aguda.Cáncer de mama.Cáncer de cabeza y cuello.Micosis fungoides.Osteosarcoma.Neoplasia trofoblástica gestacional (coriocarcinoma).Artritis reumatoide activa en pacientes adultos.Psoriasis severa incapacitante. Embarazo ectópico no accidentado.Cáncer de vejiga. Linfoma no Hodgkin.'),
(376, 'L01BA01', 'Metotrexato', 'Solido parenteral', '50 mg y 500 mg', 'P         Parenteral', 'Indicación general: Leucemia linfoide aguda.Cáncer de mama.Cáncer de cabeza y cuello.Micosis fungoides.Osteosarcoma.Neoplasia trofoblástica gestacional (coriocarcinoma).Artritis reumatoide activa en pacientes adultos.Psoriasis severa incapacitante. Embarazo ectópico no accidentado.Cáncer de vejiga. Linfoma no Hodgkin.'),
(377, 'L01BA04', 'Pemetrexed', 'Solido parenteral', '500 mg', 'P         Parenteral', 'Indicación general: Mesotelioma pleural maligno.Cáncer pulmonar de células no pequeñas.'),
(378, 'L01BB02', 'Mercaptopurina', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general:Leucemia linfoidea aguda, leucemia mieloide aguda y crónica.Colitis ulcerativa, enfermedad de Crohn.Histiocitosis.Linfoma no Hodgkin.'),
(379, 'L01BB03', 'Tioguanina', 'Solido oral', '40 mg', 'O        Oral', 'Indicación general:Leucemia linfoidea aguda, leucemia mieloide aguda y leucemia granulocítica crónica.'),
(380, 'L01BB05', 'Fludarabina', 'Solido parenteral', '50 mg', 'P         Parenteral', 'Indicación general: Tratamiento de leucemia linfocítica crónica de células B (LLC) en pacientes con suficiente reserva medular. El tratamiento en primera línea con fludarabina debe instaurarse sólo en pacientes con enfermedad avanzada, estadios de Rai III/IV (estadio de Binet C), o en estadios de Rai I/II (estadio de Binet A/B) si el paciente presenta síntomas relacionados con la enfermedad o evidencia de enfermedad progresiva, linfoma no Hodgkin, enfermedad de Hodgkin y esquema de acondicionamiento pre-transplante.'),
(381, 'L01BC01', 'Citarabina', 'Solido parenteral', '100 mg - 1.000 mg', 'P         Parenteral', 'Indicación general:Leucemia mieloide aguda, leucemia linfoide aguda, linfomas. Leucemia meningea. Otras leucemias agudas y en la leucemia mieloide crónica (fase blástica). '),
(382, 'L01BC02', 'Fluoruracilo', 'Liquido parenteral', '25 mg/mL - 50 mg/mL', 'P         Parenteral', 'Indicación general:Cáncer del tracto gastrointestinal (colorrectal, gástrico, pancreático, vías biliares esófago, ano).Mama, ovario, cuello uterino, cabeza y cuello.Carcinoma basocelular.'),
(383, 'L01BC02', 'Fluoruracilo', 'Semisolido cutaneo', '5 %', 'T           Topico', 'Indicación general:Cáncer del tracto gastrointestinal (colorrectal, gástrico, pancreático, vías biliares esófago, ano).Mama, ovario, cuello uterino, cabeza y cuello.Carcinoma basocelular.'),
(384, 'L01BC05', 'Gemcitabina', 'Solido parenteral', '200 mg y 1.000 mg', 'P         Parenteral', 'Indicación general: Cáncer de mama metastásico o localmente avanzado, cáncer de ovario localmente avanzado o metastásico, cérvix como radiosensibilizador, sarcoma uterino.  Cáncer de pulmón de células no pequeñas localmente avanzado o metastásico, Cáncer pancreático localmente avanzado o metastásico. Cáncer de vejiga localmente avanzado o metastásico, cáncer de vesícula y vías biliares.Linfoma no Hodking.Cáncer primario desconocido.'),
(385, 'L01BC06', 'Capecitabina', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general:Cáncer de colon estadio III (estadio C de Dukes), adyuvante luego de cirugía.Cáncer colorrectal metastásico.Cáncer gástrico avanzado.Cáncer de mama localmente avanzado o metastásico se usa en 1era línea o tras fallo de otra quimioterapia citotóxica.Cáncer del tracto gastrointestinal (colorrectal, gástrico, pancreático, vías biliares esófago, ano).Cabeza y cuello.'),
(386, 'L01BC07', 'Azacitidina', 'Solido parenteral', '100 mg', 'P         Parenteral', 'Indicación aprobada en la 11ª Revisión del CNMB: Síndromes mielo displásicos intermedios 2 y de alto riesgo, según el sistema internacional de puntuación pronóstica (IPSS).'),
(387, 'L01CA01', 'Vinblastina', 'Solido parenteral', '10 mg/mL', 'P         Parenteral', 'Enfermedad de Hodgkin generalizada (fases III y IV).Linfoma linfocítico (nodular y difuso, poco y bien diferenciado).Linfoma histiocítico.Enfermedad de Letter-Siwe (Histiocitosis X).Sarcoma de Kaposi.Micosis fungoides (fases avanzadas).Carcinoma testicular avanzado.Cáncer de células escamosas de cabeza y cuello.'),
(388, 'L01CA02', 'Vincristina Sulfato', 'Liquido parenteral', '1 mg/mL', 'P         Parenteral', 'Indicación general: Leucemia linfoblastica aguda.Enfermedad de Hodgkin.Linfoma No Hodgkin. Rabdomiosarcoma.Neuroblastoma.Tumor de Wilms.Sarcoma de Ewing.Melanoma.Púrpura trombocitopenica idiopática.Sarcoma osteogénico. Cáncer de mama. Cáncer de pulmón de células pequeñas'),
(389, 'L01CA02', 'Vincristina Sulfato', 'Solido parenteral', '1 mg', 'P         Parenteral', 'Indicación general: Leucemia linfoblastica aguda.Enfermedad de Hodgkin.Linfoma No Hodgkin. Rabdomiosarcoma.Neuroblastoma.Tumor de Wilms.Sarcoma de Ewing.Melanoma.Púrpura trombocitopenica idiopática.Sarcoma osteogénico. Cáncer de mama. Cáncer de pulmón de células pequeñas'),
(390, 'L01CA04', 'Vinorelbina', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Cáncer de pulmón de células no pequeñas.Cáncer de mama metastásico.'),
(391, 'L01CB01', 'Etopósido', 'Liquido parenteral', '20 mg/mL', 'P         Parenteral', 'Indicación general:Tumor germinal.Cáncer pulmonar de células pequeñas.Linfomas.Leucemia mieloide aguda.Leucemia linfoblástica aguda.Cáncer de ovario.Tumor neuroendócrino.Neoplasia trofoblástica gestacional'),
(392, 'L01CB01', 'Etopósido', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general:Tumor germinal.Cáncer pulmonar de células pequeñas.Linfomas.Leucemia mieloide aguda.Leucemia linfoblástica aguda.Cáncer de ovario.Tumor neuroendócrino.Neoplasia trofoblástica gestacional'),
(393, 'L01CD01', 'Paclitaxel', 'Liquido parenteral', '6 mg/mL', 'P         Parenteral', 'Indicación exclusiva. Combinado con Gemcitabina, está indicado en el tratamiento de primera línea del adenocarcinoma metstásico de páncreas.11a rev. Indicación general: Cáncer de ovario.Cáncer de mama.Cáncer de pulmón.Sarcoma de Kaposi asociado a SIDA.Cáncer de cérvix.Cáncer de vejiga.Cáncer de esófago.Cáncer de estómago.Angiosarcoma.'),
(394, 'L01CD01', 'Nab-Paclitaxel', 'Solido parenteral', '100 mg', 'P         Parenteral', 'Indicación exclusiva. Combinado con Gemcitabina, está indicado en el tratamiento de primera línea del adenocarcinoma metstásico de páncreas.11a rev. Indicación general: Cáncer de ovario.Cáncer de mama.Cáncer de pulmón.Sarcoma de Kaposi asociado a SIDA.Cáncer de cérvix.Cáncer de vejiga.Cáncer de esófago.Cáncer de estómago.Angiosarcoma.'),
(395, 'L01CD02', 'Docetaxel', 'Liquido parenteral', '20 mg y 80 mg', 'P         Parenteral', 'Indicación general: Cáncer de mama metastásico, cáncer gastrointestinal.Cáncer de próstata, cáncer de cabeza y cuello, y cáncer de pulmón de células no pequeñas.'),
(396, 'L01CE02', 'Irinotecán', 'Liquido parenteral', '20 mg/mL', 'P         Parenteral', 'Quimioterapia, antineoplásica para cáncer metastásico de colon.'),
(397, 'L01DA01', 'Dactinomicina', 'Solido parenteral', '0,5 mg', 'P         Parenteral', 'Indicación general: Tumor de Wilms.Sarcoma de Ewing.Neoplasia trofoblástica gestacional.Carcinoma testicular (metastásico no seminomatoso).Rabdomiosarcoma en niños.'),
(398, 'L01DB01', 'Doxorubicina', 'Solido parenteral', '10 mg y 50 mg', 'P         Parenteral', 'Indicación general: Leucemia linfoblastica aguda.Leucemia mieloide aguda.Tumores sólidos.Cáncer (mama, estomago, tiroides, pulmonar de células pequeñas, células escamosas de cuello y cabeza, mieloma múltiple, linfomas).Sarcoma de tejidos blandos y osteosarcoma.Rabdomiosarcoma.Neuroblastoma.Tumor de Wilms.Hepatoma.Cáncer avanzado de ovario, intravesical para cáncer de vejiga, carcinoma endometrial avanzado recurrente. '),
(399, 'L01DB02', 'Daunorubicina', 'Solido parenteral', '20 mg', 'P         Parenteral', 'Indicación general: Leucemia mieloide aguda, leucemia linfoide aguda. '),
(400, 'L01DB03', 'Epirubicina', '', '10 mg y 50 mg', 'P         Parenteral', 'Indicación general: Cáncer de mama, cáncer de ovario, cáncer gástrico, cáncer de esófago.Osteosarcoma, sarcoma de tejidos blandos.'),
(401, 'L01DB06', 'Idarubicina', '', '10 mg', 'P         Parenteral', 'Indicación general: Leucemia mieloide aguda, leucemia linfoide aguda. '),
(402, 'L01DB07', 'Mitoxantrona', 'Liquido parenteral', '2 mg/mL', 'P         Parenteral', 'Indicación general: Leucemia mieloide aguda.Cáncer de próstata resistente a la castración.Linfomas, sarcomas pediátricos.Esclerosis múltiple progresiva secundaria (recaídas).'),
(403, 'L01DC01', 'Bleomicina', 'Solido parenteral', '15 UI', 'P         Parenteral', 'Indicación general: Carcinoma de células escamosas (cabeza, cuello, pene, vulva, cérvix).Linfoma, tumor germinal.Agente esclerosante para el tratamiento de derrame pleural maligno.Melanoma.Enfermedad de Hodking.'),
(404, 'L01DC03', 'Mitomicina', 'Solido parenteral', '20 mg', 'P         Parenteral', 'Indicación general: Cáncer refractario de estómago.Cáncer de canal anal.Cáncer de vejiga, superficial.'),
(405, 'L01EA01', 'Imatinib', 'Solido oral', '100 mg - 400 mg', 'O        Oral', 'Indicación general: Uso exclusivo en pacientes con Leucemia Mieloidea Crónica con cromosoma Philadelfia positivo.'),
(406, 'L01EA03', 'Nilotinib', 'Solido oral', '150 mg  y 200 mg', 'O        Oral', 'Indicación exclusiva:Pacientes con leucemia mieloide crónica que tengan la presencia de cromosoma Filadelfia + y que han fracasado a Imatinib o cualquier inhibidor de tirosina quinasa sea por resistencia o intolerancia.'),
(407, 'L01EB03', 'Afatinib', 'Solido oral', '20-50 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento de pacientes adultos con cáncer de pulmón de células no pequeñas (CPCNP) localmente avanzado o metastásico, con mutaciones del EGFR específicamente deleción del exón 19. Antes de comenzar el tratamiento con Afatinib, los pacientes deber ser diagnosticados de mutación EGFR positiva en el tumor, confirmada por un método validado.'),
(408, 'L01EC01', 'Vemurafenib', 'Solido oral', '240 mg', 'O        Oral', 'Indicación exclusiva:Tratamiento de pacientes con melanoma metastásico o irresecable con mutación de BRAF V600+, detectada por una prueba validada. Karnofsky mayor a 70%. '),
(409, 'L01ED03', 'Alectinib', 'Solido oral', '150 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de primera línea de pacientes adultos con cáncer de pulmón no microcítico avanzado, positivo para la quinasa del linfoma anaplásico (ALK+).'),
(410, 'L01EJ01', 'Ruxolitinib', 'Solido oral', '5 mg - 20 mg', 'O        Oral', 'Indicación exclusiva:Pacientes adultos con mielofibrosis que presenten esplenomegalia y síntomas constitucionales.'),
(411, 'L01EK01', 'Axitinib', 'Solido oral', '5 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento para carcinoma avanzado de células (claras) renales tras fracaso a un tratamiento sistémico previo.'),
(412, 'L01EL01', 'Ibrutinib', 'Solido oral', '140 mg', 'O        Oral', 'Indicaciones aprobadas en la 11ª Revisión del CNMB: Tratamiento de pacientes con leucemia linfocítica crónica en primera línea, que tengan alteraciones de alto riesgo. Tratamiento de pacientes con leucemia linfocítica crónica en segunda línea.'),
(413, 'L01EX01', 'Sunitinib', 'Solido oral', '12,5 mg - 50 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en pacientes con carcinoma de células claras de riñón estadio avanzado o metastásico con índice Karnofsky del 60% o ECOG 0-2.'),
(414, 'L01EX02', 'Sorafenib', 'Solido oral', '200 mg', 'O        Oral', 'Indicación exclusiva:Carcinoma hepatocelular avanzado o metastásico irresecable. Carcinoma diferenciado de tiroides (papilar/folicular/de células de Hurthle) en progresión, localmente avanzado, resistente al  tratamiento de yodo radioactivo.'),
(415, 'L01EX08', 'Lenvatinib', 'Solido oral', '4 mg y 10 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento en cáncer diferenciado de tiroides en progresión, localmente avanzado o metastásico, resistente a la terapia con yodo radioactivo.'),
(416, 'L01FA01', 'Rituximab', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general: Linfoma no Hodgkin. Granulomatosis de Wegener.Leucemia linfocítica crónica.Poliangitis microscópica.Púrpura trombocitopénica inmune.Leucemias linfocíticas agudas CD20 positivas.Artritis reumatoide de moderada a severa.'),
(417, 'L01FA01', 'Rituximab', 'Liquido parenteral', '1400 mg/11,7 mL', 'P(SC)  Parenteral (Subcutánea)', 'Indicación general: Linfoma no Hodgkin. Granulomatosis de Wegener.Leucemia linfocítica crónica.Poliangitis microscópica.Púrpura trombocitopénica inmune.Leucemias linfocíticas agudas CD20 positivas.Artritis reumatoide de moderada a severa.'),
(418, 'L01FD01', 'Trastuzumab', 'Liquido parenteral', '120 mg/mL', 'P(SC)  Parenteral (Subcutánea)', 'Indicación exclusiva: Uso exclusivo en pacientes con cáncer de mama que presentan HER 2 Neu positivo +++ (tres cruces) por inmunohistoquímica o Fish positivo.'),
(419, 'L01FD01', 'Trastuzumab', 'Solido parenteral', '440 mg', 'P         Parenteral', 'Indicación exclusiva: Uso exclusivo en pacientes con cáncer de mama que presentan HER 2 Neu positivo +++ (tres cruces) por inmunohistoquímica o Fish positivo.'),
(420, 'L01FD02', 'Pertuzumab', 'Liquido parenteral', '30 mg/mL', 'P         Parenteral', 'Indicación exclusiva:En combinación con trastuzumab y/o docetaxel para el tratamiento de adultos con cáncer de mama con expresión de HER2+(positivo) localmente avanzado o metastásico, que no han recibido tratamiento previo para enfermedad metastásica anti Her 2 (Inmunohistoquímica +++, FISH + o CISH +), ECOG 0-1, función cardíaca normal.'),
(421, 'L01FD03', 'Trastuzumab Emtansina', 'Solido parenteral', '100 mg', 'P         Parenteral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento adyuvante de pacientes con cáncer de mama temprano HER2 positivo que tienen enfermedad invasiva residual después de terapia neoadyuvante basada en taxanos y trastuzumab.'),
(422, 'L01FE01', 'Cetuximab', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Cáncer de células escamosas de cabeza y cuello, en combinación con radioterapia.Cáncer colorrectal metastásico irresecable con expresión del receptor del factor de crecimiento epidérmico (EGFR) y con genes K-RAS, N-RAS, B-RAF de tipo nativo no mutado, diagnosticado con un método validado.'),
(423, 'L01FF02', 'Pembrolizumab', 'Liquido parenteral', '25 mg/mL', 'P(IV)  Parenteral (Intravenosa)', 'Indicación aprobada en la 11ª Revisión del CNMB: Monoterapia para el tratamiento del melanoma avanzado (irresecable o metastásico) en adultos.  '),
(424, 'L01FG01', 'Bevacizumab', 'Liquido parenteral', '25 mg/mL', 'P         Parenteral', 'Indicaciones exclusivas: Uso exclusivo en pacientes con carcinoma de células renales, cáncer avanzado de pulmón (no microcítico), cáncer de ovario epitelial, trompa de Falopio, cáncer de cérvix,  peritoneal primario, cáncer de colon metástico  bajo estricto protocolo. Degeneración macular asociada a la edad y otros trastornos oftalmológicos relacionados   fisiopatológicamente con el VEGEF.'),
(425, 'L01XA01', 'Cisplatino', 'Liquido parenteral/Solido parenteral', '10 mg y 50 mg', 'P         Parenteral', 'Indicación general: Cáncer avanzado de vejiga.Tumores germinales.Cáncer de pulmón.Cáncer de mamá.Cáncer neuroendócrino.Cáncer de cabeza y cuello.Cáncer del canal anal.Osteosarcoma.Linfoma No Hodgkin.Cáncer de endometrio.Cáncer de cérvix.Mesotelioma.Cáncer metastásico primario de origen desconocido.Tumores pediátricos, cáncer de ovario, cancer testicular.'),
(426, 'L01XA02', 'Carboplatino', 'Liquido parenteral/Solido parenteral', '150 mg y 450 mg', 'P         Parenteral', 'Indicación general: Sarcoma.Tumor cerebral.Retinoblastoma.Cáncer avanzado de vejiga.Tumores germinales.Cáncer de pulmón.Cáncer de mamá.Cáncer neuroendócrino.Cáncer de cabeza y cuello.Cáncer del canal anal.Osteosarcoma.Linfoma No Hodgkin.Cáncer de endometrio.Cáncer de cérvix.Mesotelioma.Cáncer metastásico primario de origen desconocido.Tumores pediátricos.'),
(427, 'L01XA03', 'Oxaliplatino', 'Liquido parenteral/Solido parenteral', '50 mg y 100 mg', 'P         Parenteral', 'Indicación general: Tumores malignos gastrointestinales.Linfoma No Hodgkin.'),
(428, 'L01XB01', 'Procarbazina', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Linfoma de Hodgkin.Oligodendroglioma.'),
(429, 'L01XF01', 'Ácido Trans Retinoico  (Tretinoína)', 'Solido oral', '10 mg', 'O        Oral', 'Indicación exclusiva: Leucemia promielocitica aguda (LPA), en pacientes de nuevo diagnóstico, recidivantes o refractarios a la quimioterapia.'),
(430, 'L01XG01', 'Bortezomib', 'Solido parenteral', '3,5 mg', 'P         Parenteral', 'Indicación exclusiva: Mieloma múltiple.'),
(431, 'L01XK01', 'Olaparib', 'Solido oral', '50 mg - 150 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes con cáncer de ovario, epitelial, seroso de alto grado, recién diagnosticado en estadío III-IV con mutaciones BRCA 1/2 germinales o somáticas tras haber completado una primera línea de quimioterapia basada en platino.'),
(432, 'L01XX02', 'Asparaginasa', 'Solido parenteral', '10.000 UI', 'P         Parenteral', 'Indicación general: Tratamiento de leucemia linfocítica aguda en pacientes pediátricos (desde el nacimiento) y en adultos.'),
(433, 'L01XX05', 'Hidroxicarbamida  (hidroxiurea)', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Síndromes mieloproliferativos crónicos, anemia drepanocítica (Hbs) severa.'),
(434, 'L02AE02', 'Leuprorelina', 'Liquido parenteral/Solido parenteral', '3,75 mg - 11,25 mg', 'P         Parenteral', 'Indicación general: Cáncer de próstata.Endometriosis.Pubertad central precoz.Cáncer de mama.'),
(435, 'L02AE04', 'Triptorelina', 'Solido parenteral', '3,75 mg - 22,5 mg', 'P(IM) Parenteral (Intramuscular)', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes con diagnóstico de cáncer de próstata hormono-sensible localmente avanzado y metastásico.'),
(436, 'L02BA01', 'Tamoxifeno', 'Solido oral', '10 mg - 20 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos.'),
(437, 'L02BA03', 'Fulvestrant', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación exclusiva:Pacientes post-menopaúsicas con cáncer de mama localmente avanzado o metastásico cuyos receptores hormonales son positivos y que hayan tenido una recurrencia o progresión luego del uso de anti-estrógenos y luego del uso de inhibidores de aromatasa.'),
(438, 'L02BB01', 'Flutamida', 'Solido oral', '250 mg', 'O        Oral', 'Indicación general: Cáncer de próstata.'),
(439, 'L02BB03', 'Bicalutamida', 'Solido oral', '50 mg', 'O        Oral', 'Indicación exclusiva: Cáncer de próstata metastásico.'),
(440, 'L02BB04', 'Enzalutamida', 'Solido oral', '40 mg', 'O        Oral', 'Indicación exclusiva:  Tratamiento de pacientes con cácner de pr+ostata resistente a la castración ( CPRC) sin metástasis (M0). 11a. rev. Tratamiento en pacientes con cácner de próstata resistente a la castración metastásico. 11a. rev. Cáncer de próstata metastásico resistente a la castración, no resecable que han progresado a pesar de la terapia de deprivación androgénica, en pacientes con Karnofsky mayor a 70%. 1oma. rev.'),
(441, 'L02BB05', 'Apalutamida', 'Solido oral', '60 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes con cáncer de próstata no metastásico resistente a la castración con alto riesgo de desarrollar metástasis.'),
(442, 'L02BG04', 'Letrozol', 'Solido oral', '2,5 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos.'),
(443, 'L02BG06', 'Exemestano', 'Solido oral', '25 mg', 'O        Oral', 'Indicación exclusiva:Uso exclusivo en mujeres con cáncer de mama receptores hormonales positivos'),
(444, 'L03AA02', 'Filgrastim', 'Liquido parenteral', '300 mcg', 'P         Parenteral', 'Indicación general: Neutropenia post inmunoquimioterapia.Neutropenia post trasplante medular.Neutropenia severa crónica congénita y cíclica, colección de células progenitoras de sangre periférica.Neutropenia grado III-IV por síindromes mielodisplásicos.'),
(445, 'L03AA13', 'Pegfilgrastim', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Exclusivamente en lugares donde no se puede garantizar cadena de frío de filgrastim.'),
(446, 'L03AB05', 'Interferón alfa 2b', 'Liquido parenteral/Solido parenteral', '3´000.000 UI -  30´000.000 UI', 'P(SC)  Parenteral (Subcutánea)', 'Indicación general:Hepatitis B crónica, hepatitis C crónica, melanoma, condiloma acuminado externo,  sarcoma de Kaposi asociado a SIDA.'),
(447, 'L03AB07', 'Interferón beta 1a', 'Liquido parenteral/Solido parenteral', '6´000.000 UI -  36´000.000 UI', 'P         Parenteral', 'Indicación general: Esclerosis múltiple recurrente.'),
(448, 'L03AB08', 'Interferón beta 1b', 'Liquido parenteral', '8´000.000 UI', 'P         Parenteral', 'Indicación general: Esclerosis múltiple recurrente.'),
(449, 'L03AB10', 'Peginterferón alfa 2b', 'Liquido parenteral', '100 mcg', 'P         Parenteral', 'Indicación exclusiva: Para ser utilizado en combinación con ribavirina para el tratamiento de la hepatitis C.'),
(450, 'L03AX03', 'Vacuna BCG', 'Liquido intravesical/ solido intravesical', '', 'IVES   Intravesical', 'Indicación exclusiva: Cáncer de vejiga en etapa inicial.'),
(451, 'L04AA03', 'Inmunoglobulina Antitimocítica (equina )', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general:Anemia aplásica moderada a severa o cuando ha existido falla terapéutica a inmunoglobulina antitimocítica de conejo.Inducción y acondicionamiento para trasplante de órganos y tejidos.Tratamiento para rechazo de órganos y tejidos en trasplante.'),
(452, 'L04AA04', 'Inmunoglobulina Antitimocítica (conejo)', 'Solido parenteral', '25 mg', 'P         Parenteral', 'Indicación general: Primera línea de tratamiento en pacientes con anemia aplásica moderada a severa o cuando ha existido falla terapéutica a inmunoglobulina antitimocítica equina.Inducción y acondicionamiento para trasplante de órganos y tejidos.Tratamiento para rechazo de órganos y tejidos en trasplante.'),
(453, 'L04AA06', 'Micofenolato', 'Solido oral', '180 mg - 500 mg', 'O        Oral', 'Indicación general: Profilaxis de rechazo en transplante renal, cardíaco y hepático.'),
(454, 'L04AA10', 'Sirolimús', 'Solido oral', '1 mg', 'O        Oral', 'Indicación general: Profilaxis de rechazo en transplante renal.'),
(455, 'L04AA13', 'Leflunomida', 'Solido oral', '20 mg', 'O        Oral', 'Indicación exclusiva: Pacientes adultos con Artritis Reumatoide activa, refractaria, antes de decidir uso de terapia biológica.'),
(456, 'L04AA18', 'Everólimus', 'Solido oral', '0,50 mg y 0,75 mg', 'O        Oral', 'Indicación general: Prevención de rechazo en trasplante de órganos (renal o hepático), cáncer de mama con receptor hormonal positivo, carcinoma avanzado de células renales, tumores neuroendocrinos pancreáticos no resecable o metastásico, tumores neuroendocrinos de origen gastrointestinal o pulmonar no funcionantes, no resecables o metastásicos, angiomiolipoma renal, astrocitoma subependimario de células gigantes.'),
(457, 'L04AA33', 'Vedolizumab', 'Solido parenteral', '300 mg', 'P(IV)  Parenteral (Intravenosa)', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de la colitis ulcerosa activa, de moderada a grave, en pacientes adultos que hayan tenido una respuesta inadecuada, presenten pérdida de respuesta o sean intolerantes al tratamiento convencional o con un antagonista del factor de necrosis tumoral alfa (TNFα).'),
(458, 'L04AA36', 'Ocrelizumab', 'Liquido parenteral', '30 mg/mL', 'P(IV)  Parenteral (Intravenosa)', 'Indicaciones aprobadas en la 11ª Revisión del CNMB: Tratamiento de pacientes adultos con esclerosis múltiple progresiva primaria (EMPP). Tratamiento de pacientes adultos con esclerosis múltiple recurrente activa (EMRA).'),
(459, 'L04AB01', 'Etanercept', 'Liquido parenteral', '25 mg y 50 mg', 'P         Parenteral', 'Indicación general: Tratamiento de artritis reumatoide moderada a severa, con respuesta inadecuada.Espondilitis anquilosante activa grave en adultos que han tenido una respuesta inadecuada a la terapia convencional.Artritis idiopática juvenil en niños a partir de dos años y adolescentes que han tenido una respuesta inadecuada.Artritis psoriásica activa y progresiva que no cede a terapia convencional.'),
(460, 'L04AB01', 'Etanercept', 'Solido parenteral', '25 mg', 'P         Parenteral', 'Indicación general: Tratamiento de artritis reumatoide moderada a severa, con respuesta inadecuada.Espondilitis anquilosante activa grave en adultos que han tenido una respuesta inadecuada a la terapia convencional.Artritis idiopática juvenil en niños a partir de dos años y adolescentes que han tenido una respuesta inadecuada.Artritis psoriásica activa y progresiva que no cede a terapia convencional.'),
(461, 'L04AB02', 'Infliximab', 'Solido parenteral', '100 mg', 'P         Parenteral', 'Indicación general: Artritis reumatoide.Artritis psoriásica.Enfermedad de Crohn activa, de moderada a grave en adultos y en enfermedad activa, grave en niños y adolescentes entre 6 y 17 años.Colitis ulcerativa activa, de moderada a grave en adultos y en enfermedad activa, grave en niños y adolescentes entre 6 y 17 años.Espondilitis anquilosante.Artritis reactiva y psoriasis que no ceden a terapia convencional.'),
(462, 'L04AB04', 'Adalimumab', 'Liquido parenteral', '40 mg', 'P         Parenteral', 'Indicación exclusiva:  Tratamiento de la Enfermedad de Crohn. 11a. rev. Artritis reumatoidea activa de intensidad moderada y grave que no ceden a otros anti TNF.Psoriasis; Artritis psoriásica. 10ma. rev.'),
(463, 'L04AC02', 'Basiliximab', 'Solido parenteral', '10 mg y 20 mg', 'P         Parenteral', 'Indicación general: Inducción en trasplante de órganos y tejidos.'),
(464, 'L04AC07', 'Tocilizumab', 'Liquido parenteral', '20 mg/mL y 162 mg/0,9 mL', 'P         Parenteral', 'Indicación exclusiva: Tratamiento de pacientes con neumonía por COVID 19, severa, hospitalizados. 11a. rev. Para el tratamiento de la artritis reumatoide activa de moderada a grave en pacientes adultos con respuesta inadecuada o intolerancia a un tratamiento previo. Artritis Idiopática juvenil en sus formas sistémicas y poliarticular. 10ma. rev.'),
(465, 'L04AC16', 'Guselkumab', 'Liquido parenteral', '100 mg/mL', 'P(SC)  Parenteral (Subcutánea)', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes adultos con psoriasis en placas moderadas a graves, candidatos a tratamiento sistémico o fototerapia.'),
(466, 'L04AD01', 'Ciclosporina', 'Liquido oral', '100 mg/mL', 'O        Oral', 'Indicación general: Profilaxis en rechazo de trasplantes alogénicos de riñón, hígado, corazón.Artritis reumatoide severa.Psoriasis severa.'),
(467, 'L04AD01', 'Ciclosporina', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general: Profilaxis en rechazo de trasplantes alogénicos de riñón, hígado, corazón.Artritis reumatoide severa.Psoriasis severa.'),
(468, 'L04AD01', 'Ciclosporina', 'Solido oral', '25 mg - 100 mg', 'O        Oral', 'Indicación general: Profilaxis en rechazo de trasplantes alogénicos de riñón, hígado, corazón.Artritis reumatoide severa.Psoriasis severa.'),
(469, 'L04AD02', 'Tacrólimus', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Tratamiento para prevención del rechazo al trasplante.Síndrome nefrótico cortico resistente.Nefropatía lúpica.'),
(470, 'L04AD02', 'Tacrólimus', 'Solido oral', '0,5 mg, 1 mg y 5 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento para prevención del rechazo al trasplante.Síndrome nefrótico cortico resistente.Nefropatía lúpica.');
INSERT INTO `medicamento` (`id_medicamento`, `codigo`, `descripcion`, `forma`, `concentracion`, `viaadmin`, `indicaciones`) VALUES
(471, 'L04AD02', 'Tacrólimus', 'Solido oral (polvo)', '0,5 mg/mL y 1 mg/mL', 'O        Oral', 'Indicación exclusiva: Tratamiento para prevención del rechazo al trasplante.Síndrome nefrótico cortico resistente.Nefropatía lúpica.'),
(472, 'L04AX01', 'Azatioprina', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Profilaxis de rechazo en trasplante de riñón.Artritis reumatoide.'),
(473, 'L04AX02', 'Talidomida', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Mieloma múltiple.Sarcoma de Kaposi.Diarrea por VIH.Síndrome mielodisplásico.'),
(474, 'L04AX04', 'Lenalidomida', 'Solido oral', '2,5 mg - 25 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento de pacientes adultos de nuevo diagnóstico de mieloma múltiple no candidatos a transplante, sin tratamiento previo. 11a. rev. Tratamiento continuo de los pacientes adultos con dignóstico de mieloma múltiple como mantenimeinto hasta la recaída o progresión de la enfermedad en pacientes no candidatos a trasplante de células progenitoras hematopoyéticas. 11a. rev. Tratamiento de pacientes adultos con mieloma múltiple refractarios o recaídos a dos terapias previas de tratamiento. 10ma. rev.'),
(475, 'L04AX05', 'Pirfenidona', 'Solido oral', '200 mg - 801 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento de pacientes adultos con fibrosis pulmonar idiopática (FPI) leve a moderada.'),
(476, 'M01AB05', 'Diclofenaco', 'Liquido parenteral', '25 mg/mL', 'P         Parenteral', 'Indicación general: Dolor agudo, leve – moderado. Dolor asociado a enfermedades reumáticas, crónicas e inflamatorias, dismenorrea. Tratamiento sintomático de la fiebre'),
(477, 'M01AB05', 'Diclofenaco', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Dolor agudo, leve – moderado. Dolor asociado a enfermedades reumáticas, crónicas e inflamatorias, dismenorrea. Tratamiento sintomático de la fiebre'),
(478, 'M01AB15', 'Ketorolaco', 'Liquido parenteral', '30 mg/mL', 'P         Parenteral', 'Indicación general:Tratamiento del dolor agudo moderado a severo, dolor oncológico y cuidados paliativos.Tratamiento a corto plazo del dolor postoperatorio agudo moderado a severo (duración máxima del tratamiento 2 días). '),
(479, 'M01AE01', 'Ibuprofeno', 'Liquido oral', '200 mg/5 mL', 'O        Oral', 'Tratamiento de procesos dolorosos de intensidad leve ha moderado como migraña, dolor dental, oncológico, dismenorrea, tenesmo vesicalTratamiento de enfermedades reumáticas crónicas inflamatorias, artritis reumatoide, artritis idiopatica juvenil.Tratamiento sintomático de la fiebre en cuadros febriles de etiología diversa incluye fiebre neoplásica.'),
(480, 'M01AE01', 'Ibuprofeno', 'Solido oral', '400 mg', 'O        Oral', 'Tratamiento de procesos dolorosos de intensidad leve ha moderado como migraña, dolor dental, oncológico, dismenorrea, tenesmo vesicalTratamiento de enfermedades reumáticas crónicas inflamatorias, artritis reumatoide, artritis idiopatica juvenil.Tratamiento sintomático de la fiebre en cuadros febriles de etiología diversa incluye fiebre neoplásica.'),
(481, 'M01AE01', 'Ibuprofeno', 'Liquido parenteral', '4 mg/mL y 6 mg/mL', 'P(IV)  Parenteral (Intravenosa)', 'Tratamiento de procesos dolorosos de intensidad leve ha moderado como migraña, dolor dental, oncológico, dismenorrea, tenesmo vesicalTratamiento de enfermedades reumáticas crónicas inflamatorias, artritis reumatoide, artritis idiopatica juvenil.Tratamiento sintomático de la fiebre en cuadros febriles de etiología diversa incluye fiebre neoplásica.'),
(482, 'M01CC01', 'Penicilamina', 'Solido oral', '125 mg y 250 mg', 'O        Oral', 'Antídoto:Intoxicación por metales pesados como cobre, oro, arsénico, mercurio, zinc, plomo.'),
(483, 'M03AB01', 'Suxametonio', 'Liquido parenteral', '20 mg/mL', 'P         Parenteral', 'Indicación general: Inducción anestésica de secuencia rápida.Intubación endotraqueal.Bloqueo Neuromuscular.'),
(484, 'M03AC01', 'Pancuronio', 'Liquido parenteral', '2 mg/mL', 'P         Parenteral', 'Indicación general: Bloqueo neuromuscular (larga duración, no despolarizante) en procedimientos quirúrgicos o durante el cuidado intensivo.Intubación endotraqueal.'),
(485, 'M03AC09', 'Bromuro de Rocuronio', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general: Bloqueo neuromuscular (duración corta – intermedia, no despolarizante) en procedimientos quirúrgicos o durante el cuidado intensivo.Intubación endotraqueal.'),
(486, 'M03AX01', 'Toxina botulínica', 'Solido parenteral', '100 U y 500 U', 'P         Parenteral', 'Indicación general: Espasticidad focal de la mun?eca y de la mano secundaria a un ictus en el adulto.Espasticidad focal del tobillo y pie secundaria a un ictus en el adulto.Pie equino a causa de espasticidad en pacientes pediátricos con parálisis cerebral.Blefaroespasmo.Estrabismo.Espasmo hemifacial. Torticolis espasmódica. Tratamiento de incontinencia urinaria asociada a condición neurológica.Profilaxis de migrañas crónicas.Tratamiento de espaticidad de miembros superiores en adultos.Hiperhidrosis axilar severa.Coadyuvante en el manejo de hiperactividad neurogénica del detrusor y vejiga hiperactiva (vía cistoscopia).'),
(487, 'M03CA01', 'Dantroleno', 'Solido parenteral', '20 mg', 'P         Parenteral', 'Indicación general: Hipertermia maligna. Espasticidad.Rabdomiolisis inducida por drogas que incrementan contractura muscular.'),
(488, 'M04AA01', 'Alopurinol', 'Solido oral', '100 mg y 300 mg', 'O        Oral', 'Indicación general: Hiperuricemia primaria o secundaria a quimioterapia antineoplásica.Psoriasis y enfermedades hematológicas.'),
(489, 'M04AC01', 'Colchicina', 'Solido oral', '0,5 mg', 'O        Oral', 'Indicación general: Profilaxis y tratamiento gota aguda. Hiperuricemia secundaria a quimioterapia.Cálculos renales recurrentes de oxalato de calcio. Antídoto: Intoxicación con Paraquat.'),
(490, 'M05BA04', 'Ácido alendrónico (alendronato sódico)', 'Solido oral', '70 mg', 'O        Oral', 'Indicación general: Tratamiento de osteoporosis posmenopáusica donde el riesgo de fractura sea elevado.Osteoporosis inducida por glucocorticoides.Enfermedad ósea de Paget.Hipercalcemia. Coadyuvante para manejo del hiperparatiroidismo.'),
(491, 'M05BA08', 'Ácido zoledrónico', 'Liquido parenteral/Solido parenteral', '4 mg', 'P         Parenteral', 'Indicación general: Hipercalcemia maligna. Metástasis ósea desde tumores sólidos. Mieloma múltiple.Osteoporosis. Osteoporosis secundaria a tratamiento con corticoides.Enfermedad de Paget.'),
(492, 'N01AB08', 'Sevoflurano', 'Liquido para inhalacion', '1 mg/mL', 'I           Inhalatoria', 'Indicación general: Anestesia general, ya sea inducción o mantenimiento.'),
(493, 'N01AF03', 'Tiopental sódico', 'Solido parenteral', '1 g', 'P         Parenteral', 'Indicación general: Anestesia general, ya sea inducción o mantenimiento.Hipertensión intracraneal.'),
(494, 'N01AH01', 'Fentanilo', 'Liquido parenteral', '0,05 mg/mL', 'P         Parenteral', 'Indicación general:Analgesia preoperatoria, asociado a anestesia general o regional.Dolor severo, dolor irruptivo, dolor severo en pacientes con insuficiencia renal.Rotación de opioides.Tratamiento del dolor crónico (parche).Junto con un neuroléptico como premedicación anestésica, para la inducción de anestesia y como complemento en el mantenimiento de la anestesia general y regional.'),
(495, 'N01AH01', 'Fentanilo', 'Solido cutaneo', '4,2 mg (25 mcg/hora)', 'T           Topico', 'Indicación general:Analgesia preoperatoria, asociado a anestesia general o regional.Dolor severo, dolor irruptivo, dolor severo en pacientes con insuficiencia renal.Rotación de opioides.Tratamiento del dolor crónico (parche).Junto con un neuroléptico como premedicación anestésica, para la inducción de anestesia y como complemento en el mantenimiento de la anestesia general y regional.'),
(496, 'N01AH06', 'Remifentanilo', 'Solido parenteral', '2 mg y 5 mg', 'P         Parenteral', 'Indicación general: Anestesia general (inducción o mantenimiento).'),
(497, 'N01AX10', 'Propofol', 'Liquido parenteral', '10 mg/mL y 20 mg/mL', 'P         Parenteral', 'Indicación general: Inducción anestesia general.Mantenimiento anestesia general'),
(498, 'N01BB01', 'Bupivacaína (sin epinefrina)', 'Liquido parenteral', '0,5 % y 0,75 %', 'P         Parenteral', 'Indicación general: Anestesia local. Anestesia regional.'),
(499, 'N01BB02', 'Lidocaína', 'Solido cutaneo (parche)', '5 %', 'T           Topico', 'Indicaciones:Líquido parenteral: Anestesia local. Arritmias ventriculares sin pulso después de desfibrilación, RCP y administración de vasodepresores.Sólido cutáneo: Uso exclusivo en dolor neuropático '),
(500, 'N01BB02', 'Lidocaína (sin epinefrina)', 'Liquido parenteral', '2 %', 'P         Parenteral', 'Indicaciones:Líquido parenteral: Anestesia local. Arritmias ventriculares sin pulso después de desfibrilación, RCP y administración de vasodepresores.Sólido cutáneo: Uso exclusivo en dolor neuropático '),
(501, 'N01BB51', 'Bupivacaína hiperbárica', 'Liquido parenteral', '0,5 % y 0,75 %', 'P         Parenteral', 'Indicación general: Anestesia espinal (bloqueo subaracnoideo).'),
(502, 'N01BB52', 'Lidocaína con Epinefrina', 'Liquido parenteral', '2 % + 1:200.000 2 % + 1:80.000  (cartucho dental)', 'P         Parenteral', 'Indicación general: Anestesia local o regional.'),
(503, 'N02AA01', 'Morfina', 'Liquido parenteral', '10 mg/mL y 20 mg/mL', 'P         Parenteral', 'Indicación general:Dolor severo, dolor oncológico, manejo de dolor en cuidados paliativos.DisneaTos'),
(504, 'N02AA01', 'Morfina', 'Solido oral', '10 mg', 'O        Oral', 'Indicación general:Dolor severo, dolor oncológico, manejo de dolor en cuidados paliativos.DisneaTos'),
(505, 'N02AA01', 'Morfina', 'Solido oral (liberacion prolongada)', '10 mg, 30 mg y 60 mg', 'O        Oral', 'Indicación general:Dolor severo, dolor oncológico, manejo de dolor en cuidados paliativos.DisneaTos'),
(506, 'N02AA01', 'Morfina', 'Liquido oral', '2 mg/mL y 20 mg/mL', 'O        Oral', 'Indicación general:Dolor severo, dolor oncológico, manejo de dolor en cuidados paliativos.DisneaTos'),
(507, 'N02AA03', 'Hidromorfona', 'Liquido parenteral', '2 mg/mL', 'P         Parenteral', 'Indicación general: Dolor severo que no cede a otras alternativas.Manejo de dolor oncológico y en cuidados paliativos.'),
(508, 'N02AA03', 'Hidromorfona', 'Solido oral', '2,5 mg y 5 mg', 'O        Oral', 'Indicación general: Dolor severo que no cede a otras alternativas.Manejo de dolor oncológico y en cuidados paliativos.'),
(509, 'N02AA05', 'Oxicodona', 'Solido oral', '5 mg', 'O        Oral', 'Indicación general:Dolor severo oncológico y no oncológico.Manejo de dolor en cuidados paliativos.Rotación de opioides.'),
(510, 'N02AA05', 'Oxicodona', 'Solido oral (liberacion prolongada)', '10 mg, 20 mg y 40 mg', 'O        Oral', 'Indicación general:Dolor severo oncológico y no oncológico.Manejo de dolor en cuidados paliativos.Rotación de opioides.'),
(511, 'N02AA08', 'Dihidrocodeína (codeína)', 'Liquido oral', '10 mg/5 mL', 'O        Oral', 'Indicación exclusiva: Dolor moderado.Tos.Diarrea crónica.'),
(512, 'N02AA08', 'Dihidrocodeína (codeína)', 'Solido oral', '10 mg y 30 mg', 'O        Oral', 'Indicación exclusiva: Dolor moderado.Tos.Diarrea crónica.'),
(513, 'N02AE01', 'Buprenorfina', 'Liquido parenteral', '0,3 mg/mL', 'P         Parenteral', 'Indicación general:Dolor moderado a severo incluido pacientes con insuficiencia renal.'),
(514, 'N02AE01', 'Buprenorfina', 'Semisolido cutaneo', '5 mg - 20 mg', 'T           Topico', 'Indicación general:Dolor moderado a severo incluido pacientes con insuficiencia renal.'),
(515, 'N02AE01', 'Buprenorfina', 'Solido oral (Sublingual)', '0,2 mg', 'O        Oral', 'Indicación general:Dolor moderado a severo incluido pacientes con insuficiencia renal.'),
(516, 'N02AX02', 'Tramadol', 'Liquido oral', '100 mg/mL', 'O        Oral', 'Indicación general: Dolor moderado '),
(517, 'N02AX02', 'Tramadol', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general: Dolor moderado '),
(518, 'N02AX02', 'Tramadol', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Dolor moderado '),
(519, 'N02AX06', 'Tapentadol', 'Solido oral', '50 mg y 100 mg', 'O        Oral', 'Indicaciones aprobadas en la 11ª Revisión del CNMB: Dolor crónico oncológico de moderado a severo. Dolor lumbar crónico moderado a severo.'),
(520, 'N02BA01', 'Ácido acetilsalicílico', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Dolor e inflamación, fiebre.'),
(521, 'N02BE01', 'Paracetamol', 'Liquido oral', '120 mg/5 mL 150 mg/5 mL 160 mg/5 mL', 'O        Oral', 'Indicación general: Fiebre.Dolor leve a moderado.'),
(522, 'N02BE01', 'Paracetamol', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general: Fiebre.Dolor leve a moderado.'),
(523, 'N02BE01', 'Paracetamol', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Fiebre.Dolor leve a moderado.'),
(524, 'N02BE01', 'Paracetamol', 'Solido rectal', '100 mg y 300 mg', 'R          Rectal', 'Indicación general: Fiebre.Dolor leve a moderado.'),
(525, 'N02BE01', 'Paracetamol', 'Liquido oral (gotas)', '100 mg/mL', 'O        Oral', 'Indicación general: Fiebre.Dolor leve a moderado.'),
(526, 'N03AA02', 'Fenobarbital', 'Liquido oral', '4 mg/mL', 'O        Oral', 'Indicación general: Convulsiones.Sedación.Estatus epiléptico que no responde a benzodiacepinas y fenitoina.'),
(527, 'N03AA02', 'Fenobarbital', 'Liquido parenteral', '60 mg/mL', 'P         Parenteral', 'Indicación general: Convulsiones.Sedación.Estatus epiléptico que no responde a benzodiacepinas y fenitoina.'),
(528, 'N03AA02', 'Fenobarbital', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Convulsiones.Sedación.Estatus epiléptico que no responde a benzodiacepinas y fenitoina.'),
(529, 'N03AB02', 'Fenitoína', 'Liquido oral', '125 mg/5 mL', 'O        Oral', 'Indicación general: Estatus epiléptico.Desórdenes convulsivos.'),
(530, 'N03AB02', 'Fenitoína', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general: Estatus epiléptico.Desórdenes convulsivos.'),
(531, 'N03AB02', 'Fenitoína', 'Solido oral', '100 mg', 'O        Oral', 'Indicación general: Estatus epiléptico.Desórdenes convulsivos.'),
(532, 'N03AE01', 'Clonazepam', 'Liquido oral', '2,5 mg/mL', 'O        Oral', 'Indicación general: Convulsiones.Trastornos del pánico.'),
(533, 'N03AE01', 'Clonazepam', 'Solido oral', '0,5 mg - 2 mg', 'O        Oral', 'Indicación general: Convulsiones.Trastornos del pánico.'),
(534, 'N03AF01', 'Carbamazepina', 'Liquido oral', '100 mg/5 mL', 'O        Oral', 'Indicación general: Convulsiones.Neuralgia del trigémino.'),
(535, 'N03AF01', 'Carbamazepina', 'Solido oral', '200 mg', 'O        Oral', 'Indicación general: Convulsiones.Neuralgia del trigémino.'),
(536, 'N03AF01', 'Carbamazepina', 'Solido oral (liberacion prolongada)', '400 mg', 'O        Oral', 'Indicación general: Convulsiones.Neuralgia del trigémino.'),
(537, 'N03AG01', 'Ácido valproico (sal sódica)', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Indicación general: Crisis generalizadas.Convulsiones parciales complejas.Episodios de ausencia simples y complejos.Tratamiento de episodios maníacos a trastorno bipolar.Profilaxis de migraña.'),
(538, 'N03AG01', 'Ácido valproico (sal sódica)', 'Liquido oral', '250 mg/5 mL', 'O        Oral', 'Indicación general: Crisis generalizadas.Convulsiones parciales complejas.Episodios de ausencia simples y complejos.Tratamiento de episodios maníacos a trastorno bipolar.Profilaxis de migraña.'),
(539, 'N03AG01', 'Ácido valproico (sal sódica)', 'Liquido oral', '200 mg/mL y 375 mg/mL', 'O        Oral', 'Indicación general: Crisis generalizadas.Convulsiones parciales complejas.Episodios de ausencia simples y complejos.Tratamiento de episodios maníacos a trastorno bipolar.Profilaxis de migraña.'),
(540, 'N03AG01', 'Ácido valproico (sal sódica)', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Crisis generalizadas.Convulsiones parciales complejas.Episodios de ausencia simples y complejos.Tratamiento de episodios maníacos a trastorno bipolar.Profilaxis de migraña.'),
(541, 'N03AX09', 'Lamotrigina', 'Solido oral', '25 mg - 100 mg', 'O        Oral', 'Indicación general: Convulsiones parciales.Tratamiento de convulsiones en Síndrome de Lennox- Gastaut.Convulsiones primarias, tónico clónicas generalizadas.Trastorno bipolar.Prevención de los episodios depresivos asociados con el trastorno bipolar.'),
(542, 'N03AX11', 'Topiramato', 'Solido oral', '25 mg', 'O        Oral', 'Indicación aprobada en la 11ª Revisión del CNMB: Tratamiento profiláctico de migraña en pacientes con 12 años en adelante.'),
(543, 'N03AX12', 'Gabapentina', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general: Coadyuvante en el tratamiento de crisis convulsivas focales con o sin generalización secundaria.Dolor neuropático periférico que no cede a otras alternativas.Síndrome de piernas inquietas.Hipo.'),
(544, 'N03AX14', 'Levetiracetam', 'Liquido oral', '500 mg/5 mL', 'O        Oral', 'Indicación exclusiva: Convulsiones tónico clónicas, inicio parcial y mioclónicas 11a. rev. Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB. 10ma. rev.'),
(545, 'N03AX14', 'Levetiracetam', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Convulsiones tónico clónicas, inicio parcial y mioclónicas 11a. rev. Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB. 10ma. rev.'),
(546, 'N03AX14', 'Levetiracetam', 'Solido oral', '500 mg y 1000 mg', 'O        Oral', 'Indicación exclusiva: Convulsiones tónico clónicas, inicio parcial y mioclónicas 11a. rev. Epilepsia refractaria que no cede a otras alternativas presentes en el CNMB. 10ma. rev.'),
(547, 'N04AA02', 'Biperideno', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Enfermedad de Parkinson (No como tratamiento de primera línea en la actualidad).Trastornos extrapiramidales, incluso los inducidos por medicamentos.'),
(548, 'N04AA02', 'Biperideno', 'Solido oral', '2 mg y 4 mg', 'O        Oral', 'Indicación general: Enfermedad de Parkinson (No como tratamiento de primera línea en la actualidad).Trastornos extrapiramidales, incluso los inducidos por medicamentos.'),
(549, 'N04BA02', 'Levodopa + Carbidopa', 'Solido oral', '(100 mg + 10 mg) y  (250 mg + 25 mg)', 'O        Oral', 'Indicación general: Enfermedad de Parkinson.'),
(550, 'N04BC06', 'Cabergolina', 'Solido oral', '0,5 mg', 'O        Oral', 'Indicación general: Enfermedad de Parkinson(no de primera elección).'),
(551, 'N04BD01', 'Selegilina', 'Solido oral', '5 mg', 'O        Oral', 'Indicación general: Enfermedad de Parkinson al inicio de la enfermedad o coadyuvante de levodopa.'),
(552, 'N05AA01', 'Clorpromazina', 'Liquido parenteral', '12,5 mg/mL', 'P         Parenteral', 'Indicación general: Manifestaciones psicóticos.Episodios maniacos en pacientes bipolares.Antiemético.Hipo intratable.Sedación preoperatoria.Coadyuvante en el tratamiento de tétanos.Porfiria intermitente aguda.Problemas graves de conducta en niños (1-12años) y en el tratamiento a corto plazo de los niños hiperactivos.'),
(553, 'N05AA01', 'Clorpromazina', 'Solido oral', '25 mg y 100 mg', 'O        Oral', 'Indicación general: Manifestaciones psicóticos.Episodios maniacos en pacientes bipolares.Antiemético.Hipo intratable.Sedación preoperatoria.Coadyuvante en el tratamiento de tétanos.Porfiria intermitente aguda.Problemas graves de conducta en niños (1-12años) y en el tratamiento a corto plazo de los niños hiperactivos.'),
(554, 'N05AA02', 'Levomepromazina', 'Liquido oral', '40 mg/mL', 'O        Oral', 'Indicación general: Esquizofrenia.Psicosis. Cuidados paliativos'),
(555, 'N05AA02', 'Levomepromazina', 'Liquido parenteral', '25 mg/mL', 'P         Parenteral', 'Indicación general: Esquizofrenia.Psicosis. Cuidados paliativos'),
(556, 'N05AA02', 'Levomepromazina', 'Solido oral', '25 mg y 100 mg', 'O        Oral', 'Indicación general: Esquizofrenia.Psicosis. Cuidados paliativos'),
(557, 'N05AD01', 'Haloperidol', 'Liquido oral', '2 mg/mL', 'O        Oral', 'Indicación general: Psicosis agudas y crónicas.Síndrome de Gilles de la Tourette.Segunda línea en el transtorno de comportamiento en el niño.Segunda línea en el tratamiento a corto plazo en Transtorno de déficit de atención con hiperreactividad (TDAH), como coadyuvante en el manejo y agitación psicomotríz.'),
(558, 'N05AD01', 'Haloperidol', 'Liquido parenteral', '5 mg/mL', 'P(IM) Parenteral (Intramuscular)', 'Indicación general: Psicosis agudas y crónicas.Síndrome de Gilles de la Tourette.Segunda línea en el transtorno de comportamiento en el niño.Segunda línea en el tratamiento a corto plazo en Transtorno de déficit de atención con hiperreactividad (TDAH), como coadyuvante en el manejo y agitación psicomotríz.'),
(559, 'N05AD01', 'Haloperidol', 'Solido oral', '5 mg y 10 mg', 'O        Oral', 'Indicación general: Psicosis agudas y crónicas.Síndrome de Gilles de la Tourette.Segunda línea en el transtorno de comportamiento en el niño.Segunda línea en el tratamiento a corto plazo en Transtorno de déficit de atención con hiperreactividad (TDAH), como coadyuvante en el manejo y agitación psicomotríz.'),
(560, 'N05AD01', 'Haloperidol decanoato', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Indicación general: Psicosis agudas y crónicas.Síndrome de Gilles de la Tourette.Segunda línea en el transtorno de comportamiento en el niño.Segunda línea en el tratamiento a corto plazo en Transtorno de déficit de atención con hiperreactividad (TDAH), como coadyuvante en el manejo y agitación psicomotríz.'),
(561, 'N05AH04', 'Quetiapina', 'Solido oral', '25 mg - 300 mg', 'O        Oral', 'Indicación general: Esquizofrenia en adultos y niños. Trastorno bipolar fase maniacal y depresiva en adultos y niños.Insomnio cuando otras alternativas han fracasado.Alteraciones de conducta y psicosis en demencia .Coadyuvante en trastorno depresivo. Dependencia alcohólica.'),
(562, 'N05AN01', 'Litio, carbonato', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general: Síndrome bipolar.Adyuvante en depresión refractaria.'),
(563, 'N05AX08', 'Risperidona', 'Liquido oral', '1 mg/mL', 'O        Oral', 'Indicación general: Esquizofrenia.Transtorno bipolar fase maniacal.Transtorno de comportamiento en niños.Trastorno de comportamiento y psicosis en demencia.'),
(564, 'N05AX08', 'Risperidona', 'Solido oral', '1 mg y 2 mg', 'O        Oral', 'Indicación general: Esquizofrenia.Transtorno bipolar fase maniacal.Transtorno de comportamiento en niños.Trastorno de comportamiento y psicosis en demencia.'),
(565, 'N05AX08', 'Risperidona', 'Solido parenteral', '25 mg y 37,5 mg', 'P         Parenteral', 'Indicación general: Esquizofrenia.Transtorno bipolar fase maniacal.Transtorno de comportamiento en niños.Trastorno de comportamiento y psicosis en demencia.'),
(566, 'N05BA01', 'Diazepam', 'Liquido oral', '0,4 mg/mL', 'O        Oral', 'Indicación general: Ansiedad.Sedación preoperatoria.Sedación para procedimientos (cardioversión, endoscopia). Enfermedad por abstinencia de alcohol. Convulsiones.Estatus epiléptico (niños y adultos), Espasmos musculares, asociado al tratamiento del tétanos en niños.'),
(567, 'N05BA01', 'Diazepam', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Ansiedad.Sedación preoperatoria.Sedación para procedimientos (cardioversión, endoscopia). Enfermedad por abstinencia de alcohol. Convulsiones.Estatus epiléptico (niños y adultos), Espasmos musculares, asociado al tratamiento del tétanos en niños.'),
(568, 'N05BA01', 'Diazepam', 'Solido oral', '5 mg y 10 mg', 'O        Oral', 'Indicación general: Ansiedad.Sedación preoperatoria.Sedación para procedimientos (cardioversión, endoscopia). Enfermedad por abstinencia de alcohol. Convulsiones.Estatus epiléptico (niños y adultos), Espasmos musculares, asociado al tratamiento del tétanos en niños.'),
(569, 'N05BA06', 'Lorazepam', 'Liquido parenteral', '2 mg/mL y 4 mg/mL', 'P         Parenteral', 'Indicación exclusiva:Líquido parenteral: Manejo de status convulsivo.Sólido oral: Benzodiazepina de acción corta en adultos mayores, manejo de síndrome de abstinencia alcohólica en pacientes ancianos con potencial riesgo de daño hepático.'),
(570, 'N05BA06', 'Lorazepam', 'Solido oral', '1 mg y 2 mg', 'O        Oral', 'Indicación exclusiva:Líquido parenteral: Manejo de status convulsivo.Sólido oral: Benzodiazepina de acción corta en adultos mayores, manejo de síndrome de abstinencia alcohólica en pacientes ancianos con potencial riesgo de daño hepático.'),
(571, 'N05BA09', 'Clobazam', 'Solido oral', '10 mg', 'O        Oral', 'Indicación exclusiva: Tratamiento coadyuvante en pacientes con epilepsia generalizada.'),
(572, 'N05BA12', 'Alprazolam', 'Solido oral', '0,25 mg y 0,50 mg', 'O        Oral', 'Indicación general: Trastorno de ansiedad. Ansiedad generalizada y transtorno de pánico.Ansiedad asociada con depresión.Síndrome de adaptación.Insomnio.'),
(573, 'N05CC01', 'Hidrato de cloral', 'Liquido oral', '100 mg/mL', 'O        Oral', 'Indicación general: Sedación para procedimientos médicos e hipnótico para tratamiento de insomnio simple.'),
(574, 'N05CD08', 'Midazolam', 'Liquido oral (solucion bucal)', '10 mg/mL', 'O        Oral', 'Indicación general: Sedación para procedimientos médicos.Sedación pre-operatoria.Mantenimiento de anestesia general.Inducción anestésica.Sedación para ventilación mecánica.Sedación en cuidados intensivos y status epilépticus (valorar por especialista).'),
(575, 'N05CD08', 'Midazolam', 'Liquido parenteral', '1 mg/mL y 5 mg/mL', 'P         Parenteral', 'Indicación general: Sedación para procedimientos médicos.Sedación pre-operatoria.Mantenimiento de anestesia general.Inducción anestésica.Sedación para ventilación mecánica.Sedación en cuidados intensivos y status epilépticus (valorar por especialista).'),
(576, 'N05CM18', 'Dexmedetomidina', 'Liquido parenteral', '100 mcg/mL', 'P         Parenteral', 'Indicación exclusiva: Para sedación de pacientes con alto riesgo de presentar delirio con ventilación mecánica asistida durante el tratamiento en unidades de cuidados intensivos.'),
(577, 'N06AA09', 'Amitriptilina', 'Solido oral', '10 mg y 25 mg', 'O        Oral', 'Indicación general: Depresión endógena.Dolor neuropático.Tenesmo vesical.Espasmos de vejiga.Sialorrea.Trastorno de pánico.'),
(578, 'N06AB03', 'Fluoxetina', 'Solido oral', '20 mg', 'O        Oral', 'Indicación general: Depresión mayor.Trastorno obsesivo-compulsivo.Bulimia nerviosa.Pánico.Síndrome disfórico premenstrual.'),
(579, 'N06AB06', 'Sertralina', 'Solido oral', '50 mg y 100 mg', 'O        Oral', 'Indicación general: Depresión mayor.Trastorno obsesivo-compulsivo, trastorno de ansiedad social, trastorno de pánico.Estrés postraumáticoSíndrome disfórico premenstrual.Llanto y risa patológica, prurito por colestasis y por uremia.'),
(580, 'N06BC01', 'Cafeína', 'Solido oral', '100 mg y 200 mg', 'O        Oral', 'Indicación exclusiva: Apnea en prematuros.'),
(581, 'N06BC01', 'Cafeína', 'Liquido parenteral', '20 mg/mL', 'P         Parenteral', 'Indicación exclusiva: Apnea en prematuros.'),
(582, 'N07AA01', 'Neostigmina', 'Liquido parenteral', '0,5 mg/mL', 'P         Parenteral', 'Indicación general: Diagnóstico de miastenia gravis.Reversión de bloqueo neuro-muscular por relajantes musculares no despolarizantes y retención urinaria postoperatoria.'),
(583, 'N07AA02', 'Piridostigmina', 'Solido oral', '60 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en pacientes con miastenia gravis.'),
(584, 'N07BB01', 'Disulfiram', 'Solido oral', '500 mg', 'O        Oral', 'Indicación general: Coadyuvante en el tratamiento de dependencia alcohólica.'),
(585, 'N07BC02', 'Metadona', 'Liquido parenteral', '5 mg/mL', 'P         Parenteral', 'Indicación general: Dolor moderado a severo. Dolor neuropático. Dependencia a los opioides.Rotación de opioides. Hiperalgesia inducida por opioides. Pacientes con insuficiencia renal.'),
(586, 'N07BC02', 'Metadona', 'Solido oral', '10 mg', 'O        Oral', 'Indicación general: Dolor moderado a severo. Dolor neuropático. Dependencia a los opioides.Rotación de opioides. Hiperalgesia inducida por opioides. Pacientes con insuficiencia renal.'),
(587, 'P01AB01', 'Metronidazol', 'Liquido oral', '125 mg/5 mL y 250 mg/5 mL', 'O        Oral', 'Indicación general: Antiprotozoarios.Amebiasis.Giardiasis.Tricomoniasis.Vaginitis bacteriana.Infecciones por bacterias anaerobias (Clostridium sp, Bacteroides sp).'),
(588, 'P01AB01', 'Metronidazol', 'Solido oral', '250 mg y 500 mg', 'O        Oral', 'Indicación general: Antiprotozoarios.Amebiasis.Giardiasis.Tricomoniasis.Vaginitis bacteriana.Infecciones por bacterias anaerobias (Clostridium sp, Bacteroides sp).'),
(589, 'P01AB02', 'Tinidazol', 'Solido oral', '1.000 mg', 'O        Oral', 'Indicación general: Amebiasis intestinal.Absceso hepático amebiano.Giardiasis.Tricomoniasis vaginal.'),
(590, 'P01AB02', 'Tinidazol', 'Solido vaginal', '150 mg', 'V           Vaginal', 'Indicación general: Amebiasis intestinal.Absceso hepático amebiano.Giardiasis.Tricomoniasis vaginal.'),
(591, 'P01BA01', 'Cloroquina', 'Liquido parenteral', '40 mg/mL', 'P         Parenteral', 'Indicación general: Profilaxis de malaria.Malaria no complicada.Alternativa en absceso hepático amebiano.Artritis reumatoide activa.'),
(592, 'P01BA01', 'Cloroquina', 'Solido oral', '250 mg', 'O        Oral', 'Indicación general: Profilaxis de malaria.Malaria no complicada.Alternativa en absceso hepático amebiano.Artritis reumatoide activa.'),
(593, 'P01BA02', 'Hidroxicloroquina', 'Solido oral', '200 mg y 400 mg', 'O        Oral', 'Indicación exclusiva: Fármacos antirreumáticos modificadores de la enfermedad (FARME).'),
(594, 'P01BA03', 'Primaquina', 'Solido oral', '7,5 mg y 15 mg', 'O        Oral', 'Indicación general: Prevención y tratamiento de malaria.'),
(595, 'P01BC01', 'Quinina', 'Liquido parenteral', '300 mg/mL', 'P         Parenteral', 'Indicación general: Malaria por Plasmodium falciparum (grave o complicada) resistente a cloroquina.'),
(596, 'P01BC01', 'Quinina', 'Solido oral', '300 mg', 'O        Oral', 'Indicación general: Malaria por Plasmodium falciparum (grave o complicada) resistente a cloroquina.'),
(597, 'P01BD01', 'Pirimetamina', 'Solido oral', '25 mg', 'O        Oral', 'Indicación exclusiva: Uso exclusivo en pacientes con toxoplasmosis, incluido embarazadas.'),
(598, 'P01BE03', 'Artesunato', 'Solido parenteral', '60 mg', 'P         Parenteral', 'Indicación exclusiva: Manejo hospitalario de malaria severa.'),
(599, 'P01BF01', 'Arteméter + Lumefantrina', 'Solido oral', '20 mg + 120 mg', 'O        Oral', 'Indicación general:Tratamiento de las infecciones de paludismo/malaria agudas y no complicadas por Plasmodium falciparum incluídas las resistente a cloroquina.'),
(600, 'P01CA02', 'Benznidazol', 'Solido oral', '50 mg y 100 mg', 'O        Oral', 'Indicación general: Tratamiento de la fase aguda de la tripanosomiasis (Enfermedad de Chagas).'),
(601, 'P01CB01', 'Antimoniato de meglumina', 'Liquido parenteral', '300 mg/mL', 'P         Parenteral', 'Indicación general: Leishmaniasis.'),
(602, 'P01CX04', 'Miltefosina', 'Solido oral', '10 mg y 50 mg', 'O        Oral', 'Leishmaniasis visceral y cutánea.'),
(603, 'P02BA01', 'Praziquantel', 'Solido oral', '600 mg', 'O        Oral', 'Indicación general: Esquistosomiasis.Duela hepática.Cisticercosis.Teniasis.'),
(604, 'P02CA03', 'Albendazol', 'Liquido oral', '20 mg/mL', 'O        Oral', 'Indicación general: Ascaridiasis.Anquilostomiasis.Oxiuriasis.Teniasis.Larva migrans cutánea.Trichuriasis. Giardiasis. Neurocisticercosis.Enfermedad hidatídica. Estrongiloidiasis.'),
(605, 'P02CA03', 'Albendazol', 'Solido oral', '400 mg', 'O        Oral', 'Indicación general: Ascaridiasis.Anquilostomiasis.Oxiuriasis.Teniasis.Larva migrans cutánea.Trichuriasis. Giardiasis. Neurocisticercosis.Enfermedad hidatídica. Estrongiloidiasis.'),
(606, 'P02CF01', 'Ivermectina', 'Liquido oral', '6 mg/mL', 'O        Oral', 'Indicación general: Oncocercosis (microfilaria).Estrongiloidiasis intestinal.Larva migrans cutánea.'),
(607, 'P02CF01', 'Ivermectina', 'Solido oral', '6 mg', 'O        Oral', 'Indicación general: Oncocercosis (microfilaria).Estrongiloidiasis intestinal.Larva migrans cutánea.'),
(608, 'P03AC04', 'Permetrina', 'Semisolido cutaneo', '1 %', 'T           Topico', 'Indicación general: Escabiosis. Pediculosis.'),
(609, 'P03AC04', 'Permetrina', 'Liquido cutaneo (champu)', '1 %', 'T           Topico', 'Indicación general: Escabiosis. Pediculosis.'),
(610, 'R01AD09', 'Mometasona', 'Liquido para inhalacion nasal', '50 mcg', 'I           Inhalatoria', 'Indicación general: Rinitis alérgica.'),
(611, 'R03AA01', 'Epinefrina (adrenalina) racémica', 'Liquido para inhalacion', '22,5 mg/mL (2,25 %)', 'I           Inhalatoria', 'Indicación general: Crup. Broncoespasmo agudo por asma bronquial. Hipereactividad bronquial adquirida y heredada que no cede a 2 agonistas de acción corta.'),
(612, 'R03AC02', 'Salbutamol', 'Liquido para inhalacion', '0,1 mg/dosis', 'I           Inhalatoria', 'Indicación general: Hipereactividad bronquial heredada y adquirida en cualquier estadio de gravedad.Broncoespasmo.Broncoespasmo agudo severo. Broncoespasmo inducido por ejercicio.'),
(613, 'R03AC02', 'Salbutamol', 'Liquido para inhalacion/Liquido para nebulización', '5 mg/mL', 'I           Inhalatoria', 'Indicación general: Hipereactividad bronquial heredada y adquirida en cualquier estadio de gravedad.Broncoespasmo.Broncoespasmo agudo severo. Broncoespasmo inducido por ejercicio.'),
(614, 'R03AC18', 'Indacaterol', 'Solido para inhalacion', '150 mcg y 300 mcg', 'I           Inhalatoria', 'Indicación exclusiva:Enfermedad pulmonar obstructiva crónica (EPOC)'),
(615, 'R03AK06', 'Salmeterol + Fluticasona', 'Liquido para inhalacion/Solido para inhalacion', '25 mcg a 50 mcg de Salmeterol + 50 mcg, 125 mcg o 250 mcg de Fluticasona', 'I           Inhalatoria', 'Indicación exclusiva. 11a. rev.   Adultos con diagnóstico de asma no controlada que no responden al tratamiento con monoterapia de corticoide inhalado (ICS).'),
(616, 'R03BA01', 'Beclometasona', 'Liquido para inhalacion', '50 mcg/dosis y  250 mcg/dosis', 'I           Inhalatoria', 'Indicación general: AsmaTratamiento de mantenimiento.'),
(617, 'R03BA05', 'Fluticasona', 'Liquido para inhalacion', '125 mcg y 250 mcg', 'I           Inhalatoria', 'Indicación exclusiva:Tratamiento y seguimiento del asma moderado y persistente. Síndrome overlap. Enfermedad pulmonar obstructiva crónica (EPOC) tipo C y D. Hiperreactividad bronquial. Aspergilosis broncopulmonar.'),
(618, 'R03BB01', 'Bromuro de ipratropio', 'Liquido para inhalacion', '0,02 mg/dosis', 'I           Inhalatoria', 'Indicación general: Mantenimiento del tratamiento de EPOC. Mantenimiento del tratamiento del broncoespasmo en asma, como coadyuvante.'),
(619, 'R03BB01', 'Bromuro de ipratropio', 'Liquido para inhalacion/Liquido para nebulización', '0,25 mg/mL', 'I           Inhalatoria', 'Indicación general: Mantenimiento del tratamiento de EPOC. Mantenimiento del tratamiento del broncoespasmo en asma, como coadyuvante.'),
(620, 'R03BB04', 'Bromuro de tiotropio', 'Solido para inhalacion', '22,5 mcg (equivalente a  18 mcg de tiotropio base)', 'I           Inhalatoria', 'Indicación general: Enfermedad Pulmonar Obstructiva Crónica.'),
(621, 'R03DA05', 'Aminofilina', 'Liquido parenteral', '25 mg/mL', 'P         Parenteral', 'Indicación general: Bronco espasmo agudo.Mantenimiento de asma mas EPOC. Apnea del prematuro.'),
(622, 'R05CB01', 'Acetilcisteína', 'Liquido para inhalacion', '100 mg/mL', 'I           Inhalatoria', 'Indicación general: Mucolítico. Fibrosis quística.'),
(623, 'R05CB13', 'Dornasa alfa (desoxirribonucleasa)', 'Liquido para inhalacion', '2,5 mg/2,5 mL (2.500 UI)', 'I           Inhalatoria', 'Indicación exclusiva: Uso exclusivo en pacientes con fibrosis quística.'),
(624, 'R06AA02', 'Difenhidramina', 'Liquido oral', '10 mg/5 mL y 12,5 mg/5 mL', 'O        Oral', 'Indicación general: Reacciones alérgicas. Síntomas extrapiramidales.Insomnio (a corto plazo). Cinetosis.'),
(625, 'R06AA02', 'Difenhidramina', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general: Reacciones alérgicas. Síntomas extrapiramidales.Insomnio (a corto plazo). Cinetosis.'),
(626, 'R06AA02', 'Difenhidramina', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general: Reacciones alérgicas. Síntomas extrapiramidales.Insomnio (a corto plazo). Cinetosis.'),
(627, 'R06AA11', 'Dimenhidrinato', 'Solido oral', '50 mg', 'O        Oral', 'Indicación general:Cinetosis.'),
(628, 'R06AX13', 'Loratadina', 'Liquido oral', '5 mg/5 mL', 'O        Oral', 'Indicación general: Rinitis alérgica.Urticaria crónica idiopática.Prurito por uremia y prurito por piel seca.'),
(629, 'R06AX13', 'Loratadina', 'Solido oral', '10 mg', 'O        Oral', 'Indicación general: Rinitis alérgica.Urticaria crónica idiopática.Prurito por uremia y prurito por piel seca.'),
(630, 'R07AA02', 'Fosfolípidos naturales (surfactante pulmonar)', 'Liquido intravesical/ solido intravesical', '25 mg/mL y 27 mg/mL', 'IT        Intratraqueal', 'Indicación general: Síndrome de Dificultad Respiratoria (SDR) en neonatos prematuros de alto riesgo.Enfermedad de membrana hialina.'),
(631, 'S01AA01', 'Cloranfenicol', 'Liquido oftalmico', '0,25 % y 0,5 %', 'Oc      Ocular', 'Indicación general: Infecciones oculares superficiales producidas por bacterias susceptibles (Conjuntivitis bacteriana).'),
(632, 'S01AA01', 'Cloranfenicol', 'Semisolido oftalmico', '1 %', 'Oc      Ocular', 'Indicación general: Infecciones oculares superficiales producidas por bacterias susceptibles (Conjuntivitis bacteriana).'),
(633, 'S01AA12', 'Tobramicina', 'Liquido oftalmico', '0,3 %', 'Oc      Ocular', 'Indicación general: Infecciones oculares moderadas a severas (incluye infecciones por Pseudomona aeruginosa).'),
(634, 'S01AA12', 'Tobramicina', 'Semisolido oftalmico', '0,3 %', 'Oc      Ocular', 'Indicación general: Infecciones oculares moderadas a severas (incluye infecciones por Pseudomona aeruginosa).'),
(635, 'S01AA17', 'Eritromicina', 'Semisolido oftalmico', '0,5 %', 'Oc      Ocular', 'Indicación general: Infecciones oculares bacterianas superficiales (incluida conjuntiva y cornea).Profilaxis de oftalmia neonatal (por gonococo o chlamydia).'),
(636, 'S01AD03', 'Aciclovir', 'Semisolido oftalmico', '3 %', 'Oc      Ocular', 'Indicación general: Queratitis herpética.'),
(637, 'S01AE03', 'Ciprofloxacina', 'Liquido oftalmico', '0,3 %', 'Oc      Ocular', 'Indicación general: Conjuntivitis bacterianas para gérmenes sensibles (Staphylococcus, Streptococcus, Haemophilus, Pseudomonas)'),
(638, 'S01BA01', 'Dexametasona', 'Liquido oftalmico', '1 mg/mL', 'Oc      Ocular', 'Indicación general: Procesos inflamatorios oculares.'),
(639, 'S01BA04', 'Prednisolona', 'Liquido oftalmico', '0,12 % y 1 %', 'Oc      Ocular', 'Indicación general: Procesos inflamatorios oculares.'),
(640, 'S01BA07', 'Fluorometolona', 'Liquido oftalmico', '0,1 %', 'Oc      Ocular', 'Indicación general: Procesos inflamatorios oculares.'),
(641, 'S01BC03', 'Diclofenaco', 'Liquido oftalmico', '0,1 %', 'Oc      Ocular', 'Indicación general: Inflamación ocular post extracción de cataratas. En cirugía corneal refractiva. Inhibición de miosis durante la cirugía de catarata. Alternativa en conjuntivitis alérgica.'),
(642, 'S01CA01', 'Dexametasona + Tobramicina', 'Liquido oftalmico', '0,1 % + 0,3 %', 'Oc      Ocular', 'Indicación general: Inflamación ocular, donde está indicado un corticosteroide, en coexistencia con infección ocular bacteriana superficial o con riesgo de infección ocular bacteriana.'),
(643, 'S01CA01', 'Dexametasona + Tobramicina', 'Semisolido oftalmico', '0,1 % + 0,3 %', 'Oc      Ocular', 'Indicación general: Inflamación ocular, donde está indicado un corticosteroide, en coexistencia con infección ocular bacteriana superficial o con riesgo de infección ocular bacteriana.'),
(644, 'S01EC01', 'Acetazolamida', 'Solido oral', '250 mg', 'O        Oral', 'Indicación general:Glaucoma de ángulo cerrado. Reducción de la presión intraocular en glaucoma de ángulo abierto.Glaucoma secundario. Prevención del mal agudo de montaña. Coadyuvante en epilepsia.'),
(645, 'S01ED01', 'Timolol', 'Liquido oftalmico', '0,25 % y 0,5 %', 'Oc      Ocular', 'Indicación general: Glaucoma de ángulo abierto. Aumento de la presión intraocular.'),
(646, 'S01EE01', 'Latanoprost', 'Liquido oftalmico', '0,005 %', 'Oc      Ocular', 'Indicación general:Glaucoma de ángulo abierto.Aumento de la presión intraocular.'),
(647, 'S01FA01', 'Atropina', 'Liquido oftalmico', '0,5 % y 1 %', 'Oc      Ocular', 'Indicación general: Refracción ciclopléjica.Uveítis.'),
(648, 'S01FA06', 'Tropicamida', 'Liquido oftalmico', '1 %', 'Oc      Ocular', 'Indicación general: Midriasis. Reacción ciclopéjica.'),
(649, 'S01GX09', 'Olopatadina', 'Liquido oftalmico', '0,1 % y 0,2 %', 'Oc      Ocular', 'Indicación exclusiva: Tratamiento de la conjuntivitis alérgica y prurito ocular asociado.'),
(650, 'S01HA', 'Anestésico local oftálmico', 'Liquido oftalmico', '', 'Oc      Ocular', 'Indicación general: Anestesia local oftálmica.'),
(651, 'S01LA05', 'Aflibercept', 'Liquido parenteral', '40 mg/mL', 'P(IVTR) Parenteral intravitrea', 'Indicaciones aprobadas en la 11ª Revisión del CNMB: Edema macular diabético. Degeneración macular relacionada con la edad.'),
(652, 'S01XA20', 'Lágrimas artificiales y otros preparados inertes', 'Liquido oftalmico', '', 'Oc      Ocular', 'Indicación general:Sequedad ocular.'),
(653, 'S01XA20', 'Lágrimas artificiales y otros preparados inertes', 'Semisolido oftalmico', '', 'Oc      Ocular', 'Indicación general:Sequedad ocular.'),
(654, 'V03AB04', 'Pralidoxima', 'Liquido parenteral', '50 mg/mL', 'P         Parenteral', 'Antídoto:  Antídoto para la intoxicación por organofosforados anticolinesterásicos.'),
(655, 'V03AB09', 'Dimercaprol', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Antídoto:Tratamiento en la intoxicación por arsénico, mercurio, sales de oro, antimonio, bismuto, níquel y plomo.'),
(656, 'V03AB14', 'Protamina', 'Liquido parenteral', '10 mg/mL (1.000 UH/mL) 10 mg/mL (1.000 UI/mL)', 'P         Parenteral', 'Antídoto: Neutralización de la acción anticoagulante de la heparina.'),
(657, 'V03AB15', 'Naloxona', 'Liquido parenteral', '0,4 mg/mL', 'P         Parenteral', 'Antídoto:Reversión total o parcial de la depresión del sistema nervioso central y depresión respiratoria causada por opiáceos naturales o sintéticos.Intoxicaciones graves que cursa con depresión severa del SNC.'),
(658, 'V03AB23', 'Acetilcisteína', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Antídoto: Tratamiento en la intoxicación por paracetamol.'),
(659, 'V03AB25', 'Flumazenil', 'Liquido parenteral', '0,1 mg/mL', 'P         Parenteral', 'Antídoto: Neutralización total o parcial del efecto sedante central de las benzodiazepinas.'),
(660, 'V03AB33', 'Hidroxocobalamina  (Vitamina B12)', 'Liquido parenteral', '1 mg/mL', 'P         Parenteral', 'Antídoto: Toxicidad por cianuro.'),
(661, 'V03AB34', 'Fomepizol', 'Liquido parenteral', '1 g/mL', 'P         Parenteral', 'Antídoto: Antídoto para metanol, etilenglicol y otros glicoles.Actúa inhibiendo competitivamente la alcohol dehidrogenasa.'),
(662, 'V03AB35', 'Sugammadex', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Indicación exclusiva: En casos de emergencia en pacientes en fallo a la intubación endotraqueal que se encuentran bajo efectos de relajación neuromuscular profunda con rocuronio o vecuronio medidos según TOF (Train of Four).'),
(663, 'V03AC03', 'Deferasirox', 'Solido oral', '125 mg - 500 mg', 'O        Oral', 'Indicación general:Tratamiento de sobrecarga crónica de hierro debido a transfusión sanguínea en pacientes mayores de 2 años. Tratamiento de sobrecarga de hierro en pacientes con síndrome talasémico no dependiente de transfusiones.'),
(664, 'V03AF01', 'Mesna', 'Liquido parenteral', '100 mg/mL', 'P         Parenteral', 'Indicación general: Prevención de la toxicidad urotelial incluyendo cistitis hemorrágica, microhematuria y macrohematuria en pacientes tratados con oxazafosforina (ifosfamida, ciclofosfamida), en dosis que se consideran urotóxicas.'),
(665, 'V03AF02', 'Dexrazoxano', 'Solido parenteral', '500 mg', 'P         Parenteral', 'Indicación exclusiva: Cardioprotector previo al uso de antraciclinas en población pediátrica evaluando que el beneficio supere el riesgo.Prevención de cardiotoxicidad acumulativa causada por antraciclinasPacientes con insuficiencia cardiaca grado I y II documentada que requieren uso de antraciclinas y donde el uso de éstas supere los riesgos.'),
(666, 'V03AF03', 'Folinato cálcico (leucovorina)', 'Liquido parenteral', '10 mg/mL', 'P         Parenteral', 'Indicación general: Disminución de la toxicidad y antagonista de los antagonistas del ácido fólico (metotrexato) en terapia citotóxica y sobredosis.Administración conjunta con fluoruracilo en cáncer colorectal. Anemia megaloblástica por deficiencia de folatos.'),
(667, 'V03AF03', 'Folinato cálcico (leucovorina)', 'Solido oral', '15 mg', 'O        Oral', 'Indicación general: Disminución de la toxicidad y antagonista de los antagonistas del ácido fólico (metotrexato) en terapia citotóxica y sobredosis.Administración conjunta con fluoruracilo en cáncer colorectal. Anemia megaloblástica por deficiencia de folatos.'),
(668, 'V03AF05', 'Amifostina', 'Solido parenteral', '500 mg', 'P         Parenteral', 'Indicación general: Para disminuir la nefrotoxicidad acumulada por la administración repetida de cisplatino en cáncer avanzado de ovario.Para disminuir la xerostomía asociada a radioterapia post quirúrgica de cabeza y cuello, con inclusión de la glándula parótida.'),
(669, 'V06DB', 'Fórmulas para nutrición enteral', 'Liquido oral', '', 'O        Oral', 'Indicación general: Pacientes con desnutrición o con alta probabilidad de desarrollar desnutrición durante su estadía hospitalaria. Pacientes en los que se espera restituir la vía oral.'),
(670, 'V06DB', 'Fórmulas para nutrición enteral', 'Solido oral', '', 'O        Oral', 'Indicación general: Pacientes con desnutrición o con alta probabilidad de desarrollar desnutrición durante su estadía hospitalaria. Pacientes en los que se espera restituir la vía oral.'),
(671, 'V07AB', 'Agua para inyección', 'Liquido parenteral', '5 mL - 250 mL', 'P         Parenteral', 'Indicación general: Agua para inyección: Disolvente para uso parenteral (vehículo para dilución y reconstitución de medicamentes de administración parenteral). Agua para irrigación: Uso externo para irrigación de cavidades, areas quirurgicas y heridas.'),
(672, 'V07AB', 'Agua para irrigación', 'Liquido parenteral', '3.000 mL', 'P         Parenteral', 'Indicación general: Agua para inyección: Disolvente para uso parenteral (vehículo para dilución y reconstitución de medicamentes de administración parenteral). Agua para irrigación: Uso externo para irrigación de cavidades, areas quirurgicas y heridas.');

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
  `estado_medico` varchar(5) DEFAULT NULL COMMENT 'co-consultorio\\r\\nEm->Emergencia\\r\\nHp->hospitalizacion\\r\\nQr->Quirofano\\r\\nCa->Casa'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, `id_especialidad`, `estado_medico`) VALUES
('1720836400', 'Bonilla Bryan', 'Masculino', '0959113935', 2, 'CA'),
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
(1, 'Atencion', 'fa-sharp fa-solid fa-bed fa-beat', 'paciente', 2),
(2, 'Signo Vitales', 'fa-sharp fa-solid fa-bed fa-beat', 'signovitales', 2),
(3, 'Consultorio', 'fa-solid fa-user-doctor', 'consultorio', 1),
(4, 'Quirofano', 'fa-solid fa-radiation', 'quirofano', 1),
(5, 'Emergencia', 'fa-solid fa-truck-medical', 'emergencia', 1),
(6, 'Hospitilizacion', 'fa-solid fa-hospital', 'hospitilizacion', 1);

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
('0100421213', 'LLIGUISUPA PAIDA ANGEL FLORENCIO', 'MASCULINO', '1945-12-14', 'SOLTERO/A', 'O-', '0967861333'),
('1304812306', 'CORNEJO CEDENO MERCEDES DOLORES', 'FEMENINO', '1965-08-16', 'UNION DE HECHO', 'A', '0985130360'),
('1307748051', 'BRAVO ALCIVAR SONNI MONCERRATE', 'FEMENINO', '1972-06-25', 'UNION DE HECHO', 'A', '0967861333'),
('1709694846', 'MINA PILLAJO JOSE NEPTALI', 'MASCULINO', '1967-12-24', 'UNION DE HECHO', 'O-', '0967861333'),
('1720836400', 'BONILLA CORNEJO BRYAN RICARDO', 'MASCULINO', '1997-08-08', 'SOLTERO/A', 'AB', '0959113935'),
('2350327306', 'MINA BRAVO ALEXANDER LEONARDO', 'MASCULINO', '2000-07-05', 'SOLTERO/A', 'O', '123444');

-- --------------------------------------------------------

--
-- Table structure for table `Prueba_medica`
--

CREATE TABLE `Prueba_medica` (
  `id_pr_medica` int(11) NOT NULL,
  `prueba_medica` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `Prueba_medica`
--

INSERT INTO `Prueba_medica` (`id_pr_medica`, `prueba_medica`) VALUES
(1, 'Amniocentesis (análisis del líquido amniótico)'),
(2, 'Amplitud de distribución eritrocitaria'),
(3, 'Análisis de cálculos renales'),
(4, 'Análisis de globulinas'),
(5, 'Análisis de hemoglobina'),
(6, 'Análisis de sangre de glucagón'),
(7, 'Análisis de sangre de la brecha aniónica'),
(8, 'Análisis de sangre de lipoproteína (a)'),
(9, 'Análisis de semen'),
(10, 'Análisis del complemento'),
(11, 'Análisis del líquido cefalorraquídeo'),
(12, 'Análisis del líquido pleural'),
(13, 'Análisis del líquido sinovial'),
(14, 'Anoscopia'),
(15, 'Anticuerpos antitiroideos'),
(16, 'Ayuno para exámenes de sangre'),
(17, 'Biopsia de ganglio centinela'),
(18, 'Biopsia de piel'),
(19, 'Biopsia de seno'),
(20, 'Broncoscopia con lavado broncoalveolar'),
(21, 'Cadenas ligeras libres'),
(22, 'Cociente de microalbúmina y creatinina'),
(23, 'Colposcopia'),
(24, 'Cómo afrontar la ansiedad causada por los exámenes médicos'),
(25, 'Cómo entender el resultado de sus pruebas de laboratorio'),
(26, 'Cómo preparar a su hijo para una prueba de laboratorio'),
(27, 'Cómo prepararse para una prueba de laboratorio'),
(28, 'Conteo de glóbulos blancos'),
(29, 'Conteo de glóbulos rojos'),
(30, 'Conteo de reticulocitos'),
(31, 'Conteo sanguíneo completo'),
(32, 'Creatina cinasa'),
(33, 'Cultivo de esputo'),
(34, 'Densitometría ósea'),
(35, 'Diagnóstico diferencial'),
(36, 'Dióxido de carbono (CO2) en la sangre'),
(37, 'Ecografía'),
(38, 'Ecografía Doppler'),
(39, 'Elastasa fecal'),
(40, 'Elastografía'),
(41, 'Electrocardiograma'),
(42, 'Electroforesis de hemoglobina'),
(43, 'Electromiografía y estudios de conducción nerviosa'),
(44, 'Estudio del sueño'),
(45, 'Evaluación de depresión'),
(46, 'Evaluación de la depresión posparto'),
(47, 'Evaluación de obesidad'),
(48, 'Evaluación de quemaduras'),
(49, 'Evaluación de salud mental'),
(50, 'Evaluación de sarpullido'),
(51, 'Evaluación de trastornos del espectro alcohólico fetal (TEAF)'),
(52, 'Evaluación de trastornos del espectro autista (TEA)'),
(53, 'Evaluación del consumo de alcohol'),
(54, 'Evaluación del riesgo de caídas'),
(55, 'Evaluación del riesgo de enfermedad cardíaca'),
(56, 'Evaluación del riesgo de suicidio'),
(57, 'Evaluación del TDAH'),
(58, 'Examen de bilirrubina en sangre'),
(59, 'Examen de cáncer de piel'),
(60, 'Examen de isoenzimas de la lactato deshidrogenasa (LDH)'),
(61, 'Examen de la vista'),
(62, 'Examen de nitrógeno ureico en sangre (NUS)'),
(63, 'Examen del pie diabético'),
(64, 'Examen dental'),
(65, 'Examen neurológico'),
(66, 'Fluoroscopia'),
(67, 'Fórmula leucocitaria'),
(68, 'Fosfatasa alcalina'),
(69, 'Frotis de sangre'),
(70, 'Gammagrafía V/Q'),
(71, 'Glóbulos blancos en las heces'),
(72, 'Hematocrito'),
(73, 'Hisopado nasal'),
(74, 'Histeroscopia'),
(75, 'Hormona adrenocorticotrópica (ACTH)'),
(76, 'Índice de IgG en LCR'),
(77, 'Índices de glóbulos rojos'),
(78, 'Insulina en la sangre'),
(79, 'Ionograma'),
(80, 'Laparoscopia'),
(81, 'Marcadores tumorales'),
(82, 'Medición de la presión arterial'),
(83, 'Mielografía'),
(84, 'Monitorización de fármacos'),
(85, 'Muestra de vellosidades coriónicas'),
(86, 'Nivel de acetaminofén'),
(87, 'Nivel de salicilatos'),
(88, 'Niveles de amoníaco'),
(89, 'Niveles de colesterol'),
(90, 'Niveles de prolactina'),
(91, 'Panel de patógenos respiratorios'),
(92, 'Panel metabólico básico'),
(93, 'Panel metabólico completo (PMC)'),
(94, 'Pielografía intravenosa (PIV)'),
(95, 'Proteínas totales y relación albúmina/globulina (A/G)'),
(96, 'Prueba de ACE'),
(97, 'Prueba de ácido láctico'),
(98, 'Prueba de ácido metilmalónico'),
(99, 'Prueba de ácido úrico'),
(100, 'Prueba de ADN fetal libre'),
(101, 'Prueba de AFP (alfafetoproteína)'),
(102, 'Prueba de albúmina en la sangre'),
(103, 'Prueba de alcohol en la sangre'),
(104, 'Prueba de aldosterona'),
(105, 'Prueba de alergias'),
(106, 'Prueba de alergias en la piel'),
(107, 'Prueba de alfa-1 antitripsina'),
(108, 'Prueba de amilasa'),
(109, 'Prueba de anticuerpos antinucleares'),
(110, 'Prueba de anticuerpos antipéptido cíclico citrulinado (anti-CCP)'),
(111, 'Prueba de anticuerpos contra el músculo liso'),
(112, 'Prueba de anticuerpos contra los glóbulos rojos'),
(113, 'Prueba de anticuerpos frente al citoplasma de los neutrófilos'),
(114, 'Prueba de antidepresivos tricíclicos'),
(115, 'Prueba de antígeno de cáncer 125 (para cáncer de ovario)'),
(116, 'Prueba de AST'),
(117, 'Prueba de calcio en la sangre'),
(118, 'Prueba de calcio en orina'),
(119, 'Prueba de calcitonina'),
(120, 'Prueba de cáncer de seno HER2'),
(121, 'Prueba de carga viral'),
(122, 'Prueba de cariotipo'),
(123, 'Prueba de CA-19-9 en sangre (cáncer de páncreas)'),
(124, 'Prueba de ceruloplasmina'),
(125, 'Prueba de cetonas en la orina'),
(126, 'Prueba de cetonas en sangre'),
(127, 'Prueba de clamidia'),
(128, 'Prueba de cloruro en sangre'),
(129, 'Prueba de cortisol'),
(130, 'Prueba de creatinina'),
(131, 'Prueba de cristales en la orina'),
(132, 'Prueba de cultivo de bacterias'),
(133, 'Prueba de cultivo fúngico'),
(134, 'Prueba de detección de fenilcetonuria (FCU)'),
(135, 'Prueba de embarazo'),
(136, 'Prueba de enfermedad celíaca'),
(137, 'Prueba de estimulación por frío'),
(138, 'Prueba de estreptococos A'),
(139, 'Prueba de estreptococos del grupo B'),
(140, 'Prueba de estrógeno'),
(141, 'Prueba de factor reumatoideo (FR)'),
(142, 'Prueba de fosfato en la orina'),
(143, 'Prueba de fosfato en la sangre'),
(144, 'Prueba de galactosemia'),
(145, 'Prueba de gamma-glutamil transferasa (GGT)'),
(146, 'Prueba de gasometría arterial'),
(147, 'Prueba de glucosa en la orina'),
(148, 'Prueba de glucosa en la sangre'),
(149, 'Prueba de gonorrea'),
(150, 'Prueba de G6PD'),
(151, 'Prueba de haptoglobina'),
(152, 'Prueba de hemoglobina A1c'),
(153, 'Prueba de hepatitis'),
(154, 'Prueba de homocisteína'),
(155, 'Prueba de hormona paratiroidea (PTH)'),
(156, 'Prueba de huevos y parásitos'),
(157, 'Prueba de IGF-1 (factor de crecimiento similar a la insulina 1)'),
(158, 'Prueba de inmunofijación'),
(159, 'Prueba de la fiebre del dengue'),
(160, 'Prueba de la gripe (influenza)'),
(161, 'Prueba de la hormona antimulleriana'),
(162, 'Prueba de la médula ósea'),
(163, 'Prueba de lactato deshidrogenasa (LDH)'),
(164, 'Prueba de lipasa'),
(165, 'Prueba de magnesio en la sangre'),
(166, 'Prueba de marcador tumoral AFP (alfafetoproteína)'),
(167, 'Prueba de marcador tumoral de microglobulina Beta-2 (B2M)'),
(168, 'Prueba de marcadores tumorales de cáncer de pulmón'),
(169, 'Prueba de moco en la orina'),
(170, 'Prueba de mutaciones de MTHFR'),
(171, 'Prueba de nitritos en la orina'),
(172, 'Prueba de niveles de la hormona foliculoestimulante (FSH)'),
(173, 'Prueba de niveles de la hormona luteinizante (HL)'),
(174, 'Prueba de niveles de testosterona'),
(175, 'Prueba de Papanicolaou'),
(176, 'Prueba de parainfluenza'),
(177, 'Prueba de PD-L1 (inmunoterapia)'),
(178, 'Prueba de péptido C'),
(179, 'Prueba de pH esofágico'),
(180, 'Prueba de potasio en sangre'),
(181, 'Prueba de procalcitonina'),
(182, 'Prueba de progesterona'),
(183, 'Prueba de proteína C reactiva (PCR)'),
(184, 'Prueba de proteínas en la orina'),
(185, 'Prueba de PSA (antígeno prostático específico)'),
(186, 'Prueba de renina'),
(187, 'Prueba de sangre de ALT'),
(188, 'Prueba de sangre de ferritina'),
(189, 'Prueba de sangre de inmunoglobulinas'),
(190, 'Prueba de sangre de metales pesados'),
(191, 'Prueba de sangre de prealbúmina'),
(192, 'Prueba de sangre de SHBG'),
(193, 'Prueba de sangre de VCM'),
(194, 'Prueba de sangre de VPM'),
(195, 'Prueba de sangre en la orina'),
(196, 'Prueba de sangre oculta en heces'),
(197, 'Prueba de sensibilidad a los antibióticos'),
(198, 'Prueba de síndrome de Down'),
(199, 'Prueba de sodio en la sangre'),
(200, 'Prueba de sudor'),
(201, 'Prueba de sulfato de DHEA'),
(202, 'Prueba de tasa de filtración glomerular (TFG)'),
(203, 'Prueba de tiempo de protrombina e INR (TP/INR)'),
(204, 'Prueba de tiroxina (T4)'),
(205, 'Prueba de tos ferina'),
(206, 'Prueba de TPT (tiempo parcial de tromboplastina)'),
(207, 'Prueba de tricomoniasis'),
(208, 'Prueba de triglicéridos'),
(209, 'Prueba de troponina'),
(210, 'Prueba de TSH'),
(211, 'Prueba de tuberculosis'),
(212, 'Prueba de uribilinógeno en orina'),
(213, 'Prueba de vaginosis bacteriana'),
(214, 'Prueba de varicela y herpes zóster'),
(215, 'Prueba de VIH'),
(216, 'Prueba de vitamina B'),
(217, 'Prueba de vitamina D'),
(218, 'Prueba de vitamina E (tocoferol)'),
(219, 'Prueba del dímero D'),
(220, 'Prueba del trastorno de pánico'),
(221, 'Prueba del trastorno obsesivo-compulsivo (TOC)'),
(222, 'Prueba del virus del herpes simple (VHS)'),
(223, 'Prueba del virus del papiloma humano (VPH)'),
(224, 'Prueba del virus del Zika'),
(225, 'Prueba del virus sincicial respiratorio (VSR)'),
(226, 'Prueba genética BCR-ABL'),
(227, 'Prueba genética de BRCA'),
(228, 'Prueba genética del BRAF'),
(229, 'Prueba genética del PTEN'),
(230, 'Prueba genética TP 53 (proteína tumoral 53)'),
(231, 'Prueba sin estrés'),
(232, 'Pruebas autonómicas'),
(233, 'Pruebas cognitivas'),
(234, 'Pruebas de alergias alimentarias'),
(235, 'Pruebas de apendicitis'),
(236, 'Pruebas de audición para adultos'),
(237, 'Pruebas de audición para niños'),
(238, 'Pruebas de bacilos acidorresistentes (BAAR)'),
(239, 'Pruebas de bilirrubina en la orina'),
(240, 'Pruebas de C. difficile'),
(241, 'Pruebas de catecolaminas'),
(242, 'Pruebas de células epiteliales en la orina'),
(243, 'Pruebas de citomegalovirus (CMV)'),
(244, 'Pruebas de conmoción cerebral'),
(245, 'Pruebas de detección de cáncer colorrectal'),
(246, 'Pruebas de detección del uso de drogas'),
(247, 'Pruebas de diabetes'),
(248, 'Pruebas de disfagia'),
(249, 'Pruebas de drogas'),
(250, 'Pruebas de enfermedades de transmisión sexual (ETS)'),
(251, 'Pruebas de esfuerzo'),
(252, 'Pruebas de evaluación del desarrollo y el comportamiento'),
(253, 'Pruebas de función pulmonar'),
(254, 'Pruebas de glaucoma'),
(255, 'Pruebas de Helicobacter pylori (H. Pylori)'),
(256, 'Pruebas de hierro'),
(257, 'Pruebas de la enfermedad de Lyme'),
(258, 'Pruebas de la hormona del crecimiento'),
(259, 'Pruebas de legionela'),
(260, 'Pruebas de los factores de la coagulación'),
(261, 'Pruebas de malaria'),
(262, 'Pruebas de miastenia grave (MG)'),
(263, 'Pruebas de mononucleosis'),
(264, 'Pruebas de opiáceos'),
(265, 'Pruebas de osmolalidad'),
(266, 'Pruebas de PCR'),
(267, 'Pruebas de péptidos natriuréticos (BNP, NT-proBNP)'),
(268, 'Pruebas de plaquetas'),
(269, 'Pruebas de porfirina'),
(270, 'Pruebas de proteína C y proteína S'),
(271, 'Pruebas de receptores de estrógeno y de progesterona'),
(272, 'Pruebas de sarampión y paperas'),
(273, 'Pruebas de SARM'),
(274, 'Pruebas de serología de anticuerpos'),
(275, 'Pruebas de sífilis'),
(276, 'Pruebas de tolerancia a la lactosa'),
(277, 'Pruebas de triyodotironina (T3)'),
(278, 'Pruebas de vaciamiento gástrico'),
(279, 'Pruebas de xilosa'),
(280, 'Pruebas del equilibrio'),
(281, 'Pruebas farmacogenéticas'),
(282, 'Pruebas funcionales hepáticas'),
(283, 'Pruebas médicas en el hogar'),
(284, 'Pruebas para detectar infecciones por cándida'),
(285, 'Pruebas prenatales'),
(286, 'Pruebas rápidas'),
(287, 'Pruebas y bancos de sangre del cordón umbilical'),
(288, 'Pulsioximetría'),
(289, 'Quimotripsina en heces'),
(290, 'Recuento de linfocitos CD4'),
(291, 'Tasa de sedimentación eritrocítica'),
(292, 'Tinción de Gram'),
(293, 'Tiroglobulina'),
(294, 'Tomografía por emisión de positrones'),
(295, 'Tránsito esofagogastroduodenal'),
(296, 'Videonistagmografía (VNG)'),
(297, '17-hidroxiprogesterona');

-- --------------------------------------------------------

--
-- Table structure for table `resultado`
--

CREATE TABLE `resultado` (
  `id_resultados` int(11) NOT NULL,
  `id_det_examen` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL
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
-- Table structure for table `signosvitales`
--

CREATE TABLE `signosvitales` (
  `id_signos` int(11) NOT NULL,
  `id_atencion` int(11) NOT NULL,
  `pulso` varchar(25) NOT NULL,
  `presion` varchar(25) NOT NULL,
  `respiracion` varchar(25) NOT NULL,
  `temperatura` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `signosvitales`
--

INSERT INTO `signosvitales` (`id_signos`, `id_atencion`, `pulso`, `presion`, `respiracion`, `temperatura`) VALUES
(1, 1, '22pp', '80/120', '100', '25C'),
(2, 3, '70', '120', '80', '36.5C'),
(3, 4, '0', '0', '0', '0'),
(4, 5, 'Normal', '120', '12', '38'),
(5, 6, 'Normal', '80/120', 'Alta', '40'),
(6, 7, 'Normal', '120', 'Alta', '37');

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
(1, 'nivel de prevención-Consultorio'),
(2, 'nivel de diagnostico y tratamiento-Hospitalizacion'),
(3, 'nivel de quirúrgicas específicas -Quirofano'),
(4, 'nivel de emergencia-Emergencia'),
(5, 'Casa');

-- --------------------------------------------------------

--
-- Table structure for table `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL,
  `id_atencion` int(11) NOT NULL,
  `tratamiento` varchar(60) NOT NULL,
  `estado_tratamiento` varchar(50) NOT NULL,
  `fecha_registrado` date NOT NULL,
  `duracion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Dumping data for table `tratamiento`
--

INSERT INTO `tratamiento` (`id_tratamiento`, `id_atencion`, `tratamiento`, `estado_tratamiento`, `fecha_registrado`, `duracion`) VALUES
(3, 3, 'dolor de cabeza', 'Inicia', '2023-06-04', '2023-06-08'),
(5, 4, 'que  tome  calmates musculares y estres', 'Inicia', '2023-06-06', '2023-06-08'),
(6, 6, 'Por cada comida', 'Inicia', '2023-06-06', '2023-06-15');

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
(1, '1720836400', 'Bryan Bonilla', 'A', '1720836400', 'e807f1fcf82d132f9bb018ca6738a19f', 1);

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
  ADD KEY `examen_detalle_examen_fk` (`id_examen`),
  ADD KEY `id_pr_medica` (`id_pr_medica`);

--
-- Indexes for table `detalle_tratamiento`
--
ALTER TABLE `detalle_tratamiento`
  ADD PRIMARY KEY (`id_detalle_tratamiento`),
  ADD KEY `medicamento_detalle_tratamiento_fk` (`id_medicamento`);

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
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id_medicamento`);

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
-- Indexes for table `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id_resultados`),
  ADD KEY `detalle_examen_resultado_fk` (`id_det_examen`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `signosvitales`
--
ALTER TABLE `signosvitales`
  ADD PRIMARY KEY (`id_signos`),
  ADD KEY `atencion_signosvitales_fk` (`id_atencion`);

--
-- Indexes for table `tipo_atencion`
--
ALTER TABLE `tipo_atencion`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id_tratamiento`);

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
  MODIFY `id_alergias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `antecedentes_paciente`
--
ALTER TABLE `antecedentes_paciente`
  MODIFY `id_antecedentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `atencion`
--
ALTER TABLE `atencion`
  MODIFY `id_atencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detalle_examen`
--
ALTER TABLE `detalle_examen`
  MODIFY `id_det_examen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detalle_tratamiento`
--
ALTER TABLE `detalle_tratamiento`
  MODIFY `id_detalle_tratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `examen`
--
ALTER TABLE `examen`
  MODIFY `id_examen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=673;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Prueba_medica`
--
ALTER TABLE `Prueba_medica`
  MODIFY `id_pr_medica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id_resultados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `signosvitales`
--
ALTER TABLE `signosvitales`
  MODIFY `id_signos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tipo_atencion`
--
ALTER TABLE `tipo_atencion`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `detalle_examen_ibfk_1` FOREIGN KEY (`id_pr_medica`) REFERENCES `Prueba_medica` (`id_pr_medica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `examen_detalle_examen_fk` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalle_tratamiento`
--
ALTER TABLE `detalle_tratamiento`
  ADD CONSTRAINT `medicamento_detalle_tratamiento_fk` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `detalle_examen_resultado_fk` FOREIGN KEY (`id_det_examen`) REFERENCES `detalle_examen` (`id_det_examen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `signosvitales`
--
ALTER TABLE `signosvitales`
  ADD CONSTRAINT `atencion_signosvitales_fk` FOREIGN KEY (`id_atencion`) REFERENCES `atencion` (`id_atencion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `rol_usuario_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
