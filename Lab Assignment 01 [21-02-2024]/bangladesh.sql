-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 06:43 PM
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
-- Database: `bangladesh`
--

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `C_ID` int(11) DEFAULT NULL,
  `C_NAME` varchar(50) DEFAULT NULL,
  `C_Home` varchar(50) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `OCCUPATION` varchar(20) DEFAULT NULL,
  `GENDER` varchar(8) DEFAULT NULL,
  `SALARY` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`C_ID`, `C_NAME`, `C_Home`, `AGE`, `OCCUPATION`, `GENDER`, `SALARY`) VALUES
(1, 'Alice', 'Dhaka', 25, 'Teacher', 'Male', 50000),
(2, 'Bob', 'Dhaka', 56, 'Service', 'Male', 60000),
(3, 'Charlie', 'Ctg', 71, 'Retired', 'Male', 10000),
(4, 'Erin', 'Ctg', 13, 'Student', 'Female', 500),
(5, 'Dave', 'Dhaka', 45, 'Service', 'Male', 40000),
(6, 'Faythe', 'Gajipur', 54, 'Doctor', 'Female', 55000),
(7, 'Grace', 'Gajipur', 65, 'Musician', 'Female', 5000),
(8, 'Ivan', 'Dhaka', 56, 'Engineer', 'Male', 60000),
(9, 'Frank', 'Ctg', 23, 'Student', 'Male', 1000),
(10, 'Micheal', 'Comilla', 32, 'Teacher', 'Male', 45000),
(11, 'Niaj', 'Comilla', 51, 'Farmer', 'Male', 20000),
(12, 'Heidi', 'Khulna', 15, 'Student', 'Female', 1500),
(13, 'Ted', 'Ctg', 25, 'Business', 'Male', 100000),
(14, 'Walter', 'Comilla', 52, 'Doctor', 'Male', 70000),
(15, 'Victor', 'Gajipur', 53, 'Teacher', 'Male', 50000),
(16, 'Judy', 'Dhaka', 35, 'Musician', 'Female', 50000),
(17, 'Pat', 'Khulna', 43, 'Teacher', 'Male', 50000),
(18, 'Olivia', 'Khulna', 34, 'Service', 'Female', 45000),
(19, 'Trent', 'Ctg', 16, 'Student', 'Male', 500),
(20, 'Peggy', 'Comilla', 32, 'Business', 'Female', 120000),
(21, 'Wendy', 'Ctg', 25, 'Musician', 'Female', 100000),
(22, 'Oscar', 'Gajipur', 14, 'Student', 'Male', 400),
(23, 'Mallet', 'Dhaka', 25, 'Engineer', 'Male', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_name` varchar(20) NOT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_name`, `city`) VALUES
('B K Corporation', 'New York'),
('Qujjhotika Bank', 'Los Angeles');

-- --------------------------------------------------------

--
-- Table structure for table `employment`
--

CREATE TABLE `employment` (
  `wrk_name` varchar(20) NOT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employment`
--

INSERT INTO `employment` (`wrk_name`, `company_name`, `salary`) VALUES
('Alice', 'B K Corporation', 80000),
('Bob', 'Qujjhotika Bank', 90000),
('Carol', 'B K Corporation', 75000),
('Davin', 'Qujjhotika Bank', 85000),
('Emily', 'B K Corporation', 82000);

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `wrk_name` varchar(20) NOT NULL,
  `manager_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`wrk_name`, `manager_name`) VALUES
('Alice', 'Abul'),
('Bob', 'Abul'),
('Carol', 'Abul'),
('Davin', 'Abul'),
('Emily', 'Abul');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `wrk_name` varchar(20) NOT NULL,
  `road` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`wrk_name`, `road`, `city`) VALUES
('Alice', 1, 'New York'),
('Bob', 2, 'Los Angeles'),
('Carol', 3, 'Chicago'),
('Davin', 4, 'Boston'),
('Emily', 5, 'italy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_name`);

--
-- Indexes for table `employment`
--
ALTER TABLE `employment`
  ADD PRIMARY KEY (`wrk_name`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`wrk_name`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`wrk_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
