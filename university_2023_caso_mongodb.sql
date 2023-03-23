-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-03-2023 a las 12:42:08
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `university_2023_caso_mongodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advisor`
--

CREATE TABLE IF NOT EXISTS `advisor` (
  `s_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `i_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `i_ID` (`i_ID`),
  KEY `s_ID` (`s_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `advisor`
--

INSERT INTO `advisor` (`s_ID`, `i_ID`) VALUES
('00128', '45565'),
('12345', '10101'),
('23121', '76543'),
('44553', '22222'),
('45678', '22222'),
('76543', '45565'),
('76653', '98345'),
('98765', '98345'),
('98988', '76766');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classroom`
--

CREATE TABLE IF NOT EXISTS `classroom` (
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `classroom`
--

INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES
('Packard', '101', '500'),
('Painter', '514', '10'),
('Taylor', '3128', '70'),
('Watson', '100', '30'),
('Watson', '120', '50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  `programs` json NOT NULL,
  `programs_1` varchar(125) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `course`
--

INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`, `programs`, `programs_1`) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', '4', '[\"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"]', '\r\n    \"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"\r\n  '),
('BIO-301', 'Genetics', 'Biology', '4', '[\"Ciencias\", \"Técnica\", \"Informática\"]', ''),
('BIO-399', 'Computational Biology', 'Biology', '3', '[\"Ciencias\", \"Técnica\"]', ''),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4', '[\"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"]', ''),
('CS-190', 'Game Design', 'Comp. Sci.', '4', '[\"Ciencias\"]', ''),
('CS-315', 'Robotics', 'Comp. Sci.', '3', '[\"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"]', ''),
('CS-319', 'Image Processing', 'Comp. Sci.', '3', '[\"Ciencias\", \"Informática\", \"Sociales\"]', ''),
('CS-347', 'Database System Concepts', 'Comp. Sci.', '3', '[\"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"]', ''),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3', '[\"Ciencias\", \"Sociales\"]', ''),
('FIN-201', 'Investment Banking', 'Finance', '3', '[\"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"]', ''),
('HIS-351', 'World History', 'History', '3', '[\"Ciencias\", \"Sociales\"]', ''),
('MU-199', 'Music Video Production', 'Music', '3', '[\"Ciencias\", \"Técnica\", \"Informática\"]', ''),
('PHY-101', 'Physical Principles', 'Physics', '4', '[\"Ciencias\", \"Técnica\", \"Informática\", \"Sociales\"]', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  KEY `building` (`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `phone_extensions` set('"301"','"302"','"405"','"407"','"409"','"415"') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`, `activo`, `phone_extensions`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '65000.00', 0, '\"301\",\"302\",\"405\"'),
('12121', 'Wu', 'Finance', '90000.00', 1, '\"405\",\"407\"'),
('15151', 'Mozart', 'Music', '40000.00', 0, '\"409\",\"415\"'),
('22222', 'Einstein', 'Physics', '95000.00', 0, '\"302\",\"405\"'),
('32343', 'El Said', 'History', '60000.00', 1, '\"405\",\"407\"'),
('33456', 'Gold', 'Physics', '87000.00', 0, '\"407\",\"409\",\"415\"'),
('45565', 'Katz', 'Comp. Sci.', '75000.00', 1, '\"301\",\"302\"'),
('58583', 'Califieri', 'History', '62000.00', 1, '\"405\"'),
('76543', 'Singh', 'Finance', '80000.00', 0, '\"405\",\"409\",\"415\"'),
('76766', 'Crick', 'Biology', '72000.00', 0, '\"409\",\"415\"'),
('83821', 'Brandt', 'Comp. Sci.', '92000.00', 1, '\"405\",\"409\"'),
('98345', 'Kim', 'Elec. Eng.', '80000.00', 1, '\"409\",\"415\"');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prereq`
--

CREATE TABLE IF NOT EXISTS `prereq` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prereq_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prereq`
--

INSERT INTO `prereq` (`course_id`, `prereq_id`) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`,`building`,`room_number`,`time_slot_id`),
  KEY `building` (`building`,`room_number`),
  KEY `time_slot_id` (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `section`
--

INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES
('BIO-101', '1', 'Summer', '2017', 'Packard', '101', 'A'),
('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A'),
('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'A'),
('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A'),
('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A'),
('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B'),
('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B'),
('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B'),
('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C'),
('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C'),
('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C'),
('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D'),
('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D'),
('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'E'),
('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F'),
('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  `picture` longblob NOT NULL,
  `grades` json NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`ID`, `name`, `dept_name`, `tot_cred`, `picture`, `grades`) VALUES
('00128', 'Zhang', 'Comp. Sci.', '102', '', '[{\"2017\": {\"Física\": 5, \"Proyectos\": 7, \"Matemática\": 5, \"Programación I\": 7}}, {\"2018\": {\"Algorítmica\": 8, \"Bases de Datos I\": 4, \"Programación II\": 7}}, {\"2019\": {\"Ética\": 5, \"Sistemas Operativos\": 9, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 7}}, {\"2020\": {\"TFG\": 7, \"Debate\": 7, \"Prácticas\": 5, \"Páginas Web\": 5}}]'),
('12345', 'Shankar', 'Comp. Sci.', '32', '', '[{\"2017\": {\"Física\": 4, \"Proyectos\": 6, \"Matemática\": 5, \"Programación I\": 4}}, {\"2018\": {\"Algorítmica\": 3, \"Bases de Datos I\": 5, \"Programación II\": 4}}, {\"2019\": {\"Ética\": 8, \"Sistemas Operativos\": 5, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 3}}, {\"2020\": {\"TFG\": 3, \"Debate\": 7, \"Prácticas\": 4, \"Páginas Web\": 5}}]'),
('19991', 'Brandt', 'History', '80', '', '[{\"2017\": {\"Física\": 5, \"Proyectos\": 5, \"Matemática\": 4, \"Programación I\": 4}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 5, \"Programación II\": 7}}, {\"2019\": {\"Ética\": 8, \"Sistemas Operativos\": 5, \"Ingeniería de Software\": 3, \"Sistemas de Información\": 8}}, {\"2020\": {\"TFG\": 9, \"Debate\": 10, \"Prácticas\": 5, \"Páginas Web\": 4}}]'),
('23121', 'Chavez', 'Finance', '110', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('44553', 'Peltier', 'Physics', '56', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('45678', 'Levy', 'Physics', '46', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('54321', 'Williams', 'Comp. Sci.', '54', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('55739', 'Sanchez', 'Music', '38', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('70557', 'Snow', 'Physics', '56', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('76543', 'Brown', 'Comp. Sci.', '58', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('76653', 'Aoi', 'Elec. Eng.', '60', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('98765', 'Bourikas', 'Elec. Eng.', '98', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]'),
('98988', 'Tanaka', 'Biology', '120', '', '[{\"2017\": {\"Física\": 7, \"Proyectos\": 4, \"Matemática\": 8, \"Programación I\": 9}}, {\"2018\": {\"Algorítmica\": 4, \"Bases de Datos I\": 6, \"Programación II\": 9}}, {\"2019\": {\"Ética\": 4, \"Sistemas Operativos\": 4, \"Ingeniería de Software\": 5, \"Sistemas de Información\": 9}}, {\"2020\": {\"TFG\": 10, \"Debate\": 4, \"Prácticas\": 9, \"Páginas Web\": 2}}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `takes`
--

CREATE TABLE IF NOT EXISTS `takes` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update` date NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `takes`
--

INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`, `update`) VALUES
('00128', 'CS-101', '1', 'Fall', '2017', 'A', '2023-03-22'),
('00128', 'CS-347', '1', 'Fall', '2017', 'A-', '2023-03-22'),
('12345', 'CS-101', '1', 'Fall', '2017', 'C', '2023-03-22'),
('12345', 'CS-190', '2', 'Spring', '2017', 'A', '2023-03-22'),
('12345', 'CS-315', '1', 'Spring', '2018', 'A', '2023-03-22'),
('12345', 'CS-347', '1', 'Fall', '2017', 'A', '2023-03-22'),
('19991', 'HIS-351', '1', 'Spring', '2018', 'B', '2023-03-22'),
('23121', 'FIN-201', '1', 'Spring', '2018', 'C+', '2023-03-22'),
('44553', 'PHY-101', '1', 'Fall', '2017', 'B-', '2023-03-22'),
('45678', 'CS-101', '1', 'Fall', '2017', 'F', '2023-03-22'),
('45678', 'CS-101', '1', 'Spring', '2018', 'B+', '2023-03-22'),
('45678', 'CS-319', '1', 'Spring', '2018', 'B', '2023-03-22'),
('54321', 'CS-101', '1', 'Fall', '2017', 'A-', '2023-03-22'),
('54321', 'CS-190', '2', 'Spring', '2017', 'B+', '2023-03-22'),
('55739', 'MU-199', '1', 'Spring', '2018', 'A-', '2023-03-22'),
('76543', 'CS-101', '1', 'Fall', '2017', 'A', '2023-03-22'),
('76543', 'CS-319', '2', 'Spring', '2018', 'A', '2023-03-22'),
('76653', 'EE-181', '1', 'Spring', '2017', 'C', '2023-03-22'),
('98765', 'CS-101', '1', 'Fall', '2017', 'C-', '2023-03-22'),
('98765', 'CS-315', '1', 'Spring', '2018', 'B', '2023-03-22'),
('98988', 'BIO-101', '1', 'Summer', '2017', 'A', '2023-03-22'),
('98988', 'BIO-301', '1', 'Summer', '2018', NULL, '2023-03-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teaches`
--

CREATE TABLE IF NOT EXISTS `teaches` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `update` date NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `update`) VALUES
('10101', 'CS-101', '1', 'Fall', '2017', '2023-03-22'),
('10101', 'CS-315', '1', 'Spring', '2018', '2023-03-22'),
('10101', 'CS-347', '1', 'Fall', '2017', '2023-03-22'),
('12121', 'FIN-201', '1', 'Spring', '2018', '2023-03-22'),
('15151', 'MU-199', '1', 'Spring', '2018', '2023-03-22'),
('22222', 'PHY-101', '1', 'Fall', '2017', '2023-03-22'),
('32343', 'HIS-351', '1', 'Spring', '2018', '2023-03-22'),
('45565', 'CS-101', '1', 'Spring', '2018', '2023-03-22'),
('45565', 'CS-319', '1', 'Spring', '2018', '2023-03-22'),
('76766', 'BIO-101', '1', 'Summer', '2017', '2023-03-22'),
('76766', 'BIO-301', '1', 'Summer', '2018', '2023-03-22'),
('83821', 'CS-190', '1', 'Spring', '2017', '2023-03-22'),
('83821', 'CS-190', '2', 'Spring', '2017', '2023-03-22'),
('83821', 'CS-319', '2', 'Spring', '2018', '2023-03-22'),
('98345', 'EE-181', '1', 'Spring', '2017', '2023-03-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `time_slot`
--

CREATE TABLE IF NOT EXISTS `time_slot` (
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `time_slot`
--

INSERT INTO `time_slot` (`time_slot_id`, `day`, `start_hr`, `start_min`, `end_hr`, `end_min`) VALUES
('A', 'F', '8', '0', '8', '50'),
('A', 'M', '8', '0', '8', '50'),
('A', 'W', '8', '0', '8', '50'),
('B', 'F', '9', '0', '9', '50'),
('B', 'M', '9', '0', '9', '50'),
('B', 'W', '9', '0', '9', '50'),
('C', 'F', '11', '0', '11', '50'),
('C', 'M', '11', '0', '11', '50'),
('C', 'W', '11', '0', '11', '50'),
('D', 'F', '13', '0', '13', '50'),
('D', 'M', '13', '0', '13', '50'),
('D', 'W', '13', '0', '13', '50'),
('E', 'R', '10', '30', '11', '45'),
('E', 'T', '10', '30', '11', '45'),
('F', 'R', '14', '30', '15', '45'),
('F', 'T', '14', '30', '15', '45'),
('G', 'F', '16', '0', '16', '50'),
('G', 'M', '16', '0', '16', '50'),
('G', 'W', '16', '0', '16', '50'),
('H', 'W', '10', '0', '12', '30');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `advisor_ibfk_3` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `classroom`
--
ALTER TABLE `classroom`
  ADD CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `classroom_ibfk_2` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `prereq`
--
ALTER TABLE `prereq`
  ADD CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`,`room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
