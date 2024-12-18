-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 04:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_prak`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `idDokter` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `lihatData` varchar(50) DEFAULT NULL,
  `editData` varchar(50) DEFAULT NULL,
  `lihatJadwal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE  'mahasiswa' (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    nim VARCHAR(20) NOT NULL,
    fakultas VARCHAR(50) NOT NULL,
    jurusan VARCHAR(50) NOT NULL,
    bukti_pembayaran VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `registerlogin` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`username`, `email`, `password`, `role`) VALUES
('abelrhmn', 'rabiatulrahman15@gmail.com', '$2y$10$cGXiUFdRIAAhJ1XMR2.tg.K2tSCbxNoskUWjowIjlJZ', 'user'),
('irfarahidin', 'irfarahidin02@gmail.com', '$2y$10$1iKgMwxbE1ag77tqnfvhmuSGyxUixJhPun6dCMufiBB', 'admin'),
('putri', 'putrinarila@gmail.com', '$2y$10$KFY/xnz.024I6ODQp8/NuOZOU8DZIPqjluHlK2h01gs', 'doctor'),
('riska', 'riskalatif@gmail.com', '$2y$10$93VOHwDfNwE0f9b8VsGXnOSwa9b.XZEZYnlMZOMCquF', 'admin'),
('sultannuku', 'sultannuku01@gmail.com', '$2y$10$scRwyazMXflMt/q9wnyE9O81Xl5h6iG2G7AO/dqwZNL', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(50) NOT NULL,
   role ENUM('user', 'admin', 'doctor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUsers`, `username`, `hashed_password`, `role`) VALUES
(1, 'syavirarahman', 'abelrahman1507', 'admin'),
(3, 'riska', 'riska15', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`idDokter`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nama_mahasiswa`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `idDokter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
