-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 06:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labevaluation01`
--

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `student_id` varchar(11) DEFAULT NULL,
  `gpa` double(3,2) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`student_id`, `gpa`, `semester`) VALUES
('1', 3.75, 'summer'),
('1', 2.75, 'winter'),
('2', 3.30, 'summer'),
('3', 3.60, 'summer'),
('2', 3.96, 'winter'),
('4', 4.00, 'summer'),
('5', 2.99, 'winter');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` varchar(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `department_name` varchar(10) DEFAULT NULL,
  `mobile_number` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `NAME`, `age`, `blood_group`, `department_name`, `mobile_number`) VALUES
('1', 'tamim', 23, 'A+ve', 'CSE', '01412345678'),
('2', 'kayes', 22, 'B-ve', 'EEE', '01912345679'),
('3', 'MOMINUL', 20, 'AB+ve', 'MCE', '01912345680'),
('4', 'sakib', 24, 'O+ve', 'CSE', '01912345681'),
('5', 'mushfiq', 24, 'O+ve', 'CSE', '01912345682');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
