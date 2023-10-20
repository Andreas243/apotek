-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 09:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotekagung`
--

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategory` enum('obat bebas','obat bebas terbatas','obat keras','jamu','obat herbal terstandar','fitofarmaka') NOT NULL,
  `khasiat` varchar(255) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama`, `harga`, `stok`, `kategory`, `khasiat`, `expired`) VALUES
(11, 'dsas', 112, 2, 'obat bebas', 'pusing', '2023-10-20'),
(12, '222', 222, 22, 'obat bebas', 'pusing, sakit kepala', '2023-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `tanggal` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `level` enum('pegawai','apoteker','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(7, 'Annatasya Zahra Napu', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(8, 'Bagus Prasetyo Usman', 'apoteker', '326dd0e9d42a3da01b50028c51cf21fc', 'apoteker'),
(9, 'Rizky Tuloli', 'pegawai1', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(10, 'Usman Ibrahim', 'pegawai2', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(11, 'Virawati Hamal', 'pegawai3', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(12, 'Idris Male', 'pegawai4', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(13, 'gf', 'dgf', '202cb962ac59075b964b07152d234b70', 'pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
