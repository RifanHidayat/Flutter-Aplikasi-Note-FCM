-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09 Okt 2020 pada 02.42
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbnote`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_notes`
--

CREATE TABLE `tb_notes` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_notes`
--

INSERT INTO `tb_notes` (`id`, `judul`, `isi`, `datetime`, `id_user`) VALUES
(17, 'Note 1', 'Isi untuk note 1', '2020-09-12 11:38:14', 18),
(18, 'Note', 'isi dari note', '2020-09-29 11:44:21', 18),
(20, 'Note 2 ', 'Isi dari note 2\n', '2020-09-30 07:11:37', 26),
(39, 'babb', 'ajwjwne', '2020-10-08 15:58:03', 34),
(40, 'bsbb', 'nwn', '2020-10-09 00:20:56', 34),
(41, 'bzbzb', '2nbwb', '2020-10-09 00:36:37', 35),
(42, 'hah', 'hwhwhs', '2020-10-09 00:40:30', 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telp` int(13) DEFAULT NULL,
  `jk` enum('Pria','Wanita') DEFAULT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `email`, `telp`, `jk`, `password`) VALUES
(18, 'Rifan Hidayat', 'rifanhidayat0811@gmail.com', 2147483647, 'Pria', '$2y$10$R/pLh9.Xa32VPTTd3EXqdudYUkXbjMtrRYlye1KaKhzgQ.6SeeXhS'),
(19, 'Rifan Hidayat', 'rifan@gmail.com', 2147483647, 'Pria', '$2y$10$y.sCjlLsBjpQOSNtnVImL.gLRoOZDlFAkSTv2gna8YYQA8Ll0MTtq'),
(20, 'Rerea', ' rifanhidayat0811@gmail.com', 32432, 'Pria', '$2y$10$N3t/qfwnq0Zf2GVfd/AjYuULOv6pJsaAMipN2RZ3vShO/dSmiBtiu'),
(22, 'RifanH', 'rifan0811@gmail.com', 2147483647, 'Pria', '$2y$10$YkGsKAB4jH4D7q0V//ByyOFUXB/JZRCIoyUlc9BuQsV2NpwoeRBOW'),
(23, NULL, NULL, NULL, NULL, '$2y$10$GE/5hX3AP9wQKjQQlPEgOecikYimwl.K7vL6E6HoRDJRUrxr2gfFi'),
(24, 'RifanHidayat', 'rifanhidayat11@gmail.com', 2147483647, 'Pria', '$2y$10$G5/N/OBczwcd9YKksw7k/OO70Opl.w4wJ8sUjJLdOhGY8iiQ7yuYe'),
(25, 'RifanHidayat', 'rifanhidayat11@gmail.com', 2147483647, 'Pria', '$2y$10$g0MT69yFRCmwsl0AciLtbu8uHCHyG7onvvAxJYExrC7qWhYicF3nK'),
(26, 'Rifan H', 'rifanhi@gmail.com', 8494949, 'Pria', '$2y$10$Gz3mOvAKmpz7Qp9Thxb3w.nmJlMH6R8cgtbc8hnqDnrgEFjqWLf12'),
(27, '9j8hu', 'bubub@.com', 97949, 'Pria', '$2y$10$r2B7YLZK6nk/vWv4O49QreymaxDH1sbTRLCC0tny8ymUkF2tlyCLi'),
(28, '9j8hu', 'bubub@.com', 97949, 'Pria', '$2y$10$olZeRAqW/xE0LHayIdyybe6QSWrT4QZXQFG5Fo1WIjXZEKPSWYQ4O'),
(29, '9j8hu', 'bbebubub@.com', 97949, 'Pria', '$2y$10$l99qnbqpd29hIrLpyDTWc.LkFXIBCvq3vRKlRCPgXFk2NjBCpRzqW'),
(30, '9j8hu', 'bbebbbubub@.com', 97949, 'Pria', '$2y$10$q2EY20wDELOh6NTYiSyq6.MRrBBn7IlYNPN01Jrns84Y9jsN4b0mq'),
(31, '9j8hu', 'bbebbb66ubub@.com', 97949, 'Pria', '$2y$10$cSg8UW/jiY.cUlUu2fH11eIC4zriJ3H8sQdgd2KHiFuWVZ3XQcYPS'),
(32, '9j8hu', 'bbebbbbh66ubub@.com', 97949, 'Pria', '$2y$10$dINL3ImSg/6hgrGnlgs/wOizn5T4i75Ovc0..6ngvSV6LyXnuQdRq'),
(33, '9j8hu', 'bbehhsbbbbh66ubub@.com', 97949, 'Pria', '$2y$10$lDK7rlXrmUnLYFlJsli9jurRic.sJKTLarCqxCfgJXi9RMc4Zm31m'),
(34, 'Rifanhidayay', 'rifanhidayatt@gmail.com', 894646, 'Pria', '$2y$10$2x7iNQfAYWHtWlB4AZ7YAO9UbgQVdGkG4zdF.GQ/VIaBTUZ63wLbe'),
(35, 'rifa ', 'rifanh@gmail.com', 2147483647, 'Pria', '$2y$10$outqAaq4/LN/AUxFCYk/K.5fX1obRCSqlIeYHTkPPrAvrO3lhHDPK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_notes`
--
ALTER TABLE `tb_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_notes`
--
ALTER TABLE `tb_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
