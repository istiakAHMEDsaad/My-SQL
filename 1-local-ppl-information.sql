-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 08:34 PM
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
-- Database: `youtube_practice`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_infromation`
--

CREATE TABLE `student_infromation` (
  `Roll` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `GPA` double(3,2) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_infromation`
--

INSERT INTO `student_infromation` (`Roll`, `Name`, `Gender`, `Age`, `GPA`, `City`) VALUES
(101, 'Rahim', 'Male', 18, 3.44, 'Sylhet'),
(102, 'Hasina', 'Female', 17, 4.50, 'Dhaka'),
(103, 'Sabul', 'Male', 18, 3.70, 'Sylhet'),
(104, 'Suhan', 'Male', 17, 4.50, 'Khulna'),
(105, 'Rahim', 'Male', 18, 3.44, 'Barisal'),
(106, 'Tanvir', 'Male', 17, 4.50, 'Sylhet'),
(107, 'Hazira', 'Female', 18, 3.44, 'Sylhet'),
(108, 'Hafiza', 'Female', 18, 4.50, 'Dhaka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_infromation`
--
ALTER TABLE `student_infromation`
  ADD PRIMARY KEY (`Roll`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
