-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 04:29 AM
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
-- Database: `mvp_kandidat_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `posisi` varchar(100) NOT NULL,
  `domisili` varchar(100) NOT NULL,
  `skorTes` int(11) NOT NULL DEFAULT 0,
  `pengalamanTahun` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`id`, `nama`, `posisi`, `domisili`, `skorTes`, `pengalamanTahun`) VALUES
(1, 'Raka Pratama', 'Backend Developer', 'Bandung', 88, 3),
(2, 'Sinta Maharani', 'UI/UX Designer', 'Jakarta', 88, 2),
(3, 'Dimas Nugroho', 'Data Analyst', 'Yogyakarta', 85, 1),
(4, 'Nadia Kusuma', 'Frontend Developer', 'Surabaya', 75, 2),
(7, 'Rifqi', 'Backend Developer', 'Bandung Batujajar', 67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE `lowongan` (
  `id` int(11) NOT NULL,
  `judulPosisi` varchar(100) NOT NULL,
  `departemen` varchar(100) NOT NULL,
  `tipeKerja` varchar(50) NOT NULL,
  `kuota` int(11) NOT NULL DEFAULT 1,
  `status` varchar(50) NOT NULL DEFAULT 'Dibuka'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lowongan`
--

INSERT INTO `lowongan` (`id`, `judulPosisi`, `departemen`, `tipeKerja`, `kuota`, `status`) VALUES
(1, 'Backend Developer', 'Engineering', 'Full-time', 2, 'Dibuka'),
(2, 'UI/UX Designer', 'Product Design', 'Hybrid', 1, 'Dibuka'),
(3, 'Data Analyst', 'Business Intelligence', 'Remote', 1, 'Dibuka'),
(4, 'QA Engineer', 'Engineering', 'Full-time', 2, 'Ditutup'),
(5, 'Husser', 'Huss', 'Full-time', 99, 'Dibuka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
