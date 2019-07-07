-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 13 Jun 2019 pada 08.23
-- Versi Server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ticket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL,
  `id_department` varchar(10) NOT NULL,
  `id_subdepartment` varchar(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `created_by` varchar(10) NOT NULL,
  `created_date` date NOT NULL,
  `modified_by` varchar(10) NOT NULL,
  `modified_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_department`, `id_subdepartment`, `nama_kategori`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, '1', '1', 'printer rusak tes edit teh', '001', '2019-06-04', '3', '2019-06-11'),
(2, '1', '1', 'jaringan bermsalah', '001', '2019-06-06', '', '0000-00-00'),
(3, '1', '', 'tes tambah kategori', '3', '2019-06-11', '', '0000-00-00'),
(4, '1', '', 'tes direct', '3', '2019-06-11', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lampiran`
--

CREATE TABLE IF NOT EXISTS `lampiran` (
  `id_lampiran` int(5) NOT NULL,
  `id_my_ticket` varchar(10) NOT NULL,
  `file` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lampiran`
--

INSERT INTO `lampiran` (`id_lampiran`, `id_my_ticket`, `file`) VALUES
(12, '20', '1560224501033Penguins.jpg'),
(13, '21', '1560234453390Chrysanthemum.jpg'),
(14, '22', '1560234562976Jellyfish.jpg'),
(15, '23', '1560236964457Koala.jpg'),
(16, '24', '1560236984304Jellyfish.jpg'),
(17, '25', '1560304065588Tulips.jpg'),
(18, '26', '1560304111152Hydrangeas.jpg'),
(19, '27', '1560322165597Tulips.jpg'),
(20, '28', '1560329460259Tulips.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `my_ticket`
--

CREATE TABLE IF NOT EXISTS `my_ticket` (
  `id_my_ticket` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `note_user` varchar(200) NOT NULL,
  `due_date` date NOT NULL,
  `dept_tujuan` varchar(10) NOT NULL,
  `sub_dept_tujuan` varchar(10) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `status_ticket` varchar(2) NOT NULL COMMENT '0 = open, 1= waiting proses, 2= riject, 3=closed',
  `created_date` date NOT NULL,
  `created_by` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `my_ticket`
--

INSERT INTO `my_ticket` (`id_my_ticket`, `id_kategori`, `judul`, `note_user`, `due_date`, `dept_tujuan`, `sub_dept_tujuan`, `id_user`, `status_ticket`, `created_date`, `created_by`) VALUES
(21, 2, 'tes edit 1 lagi 1 haha haha', 'ter', '0000-00-00', '2', '1', '', '1', '2019-06-11', '3'),
(22, 1, 'tes due date teh teh deui', 'ret', '2019-06-17', '2', '1', '', '1', '2019-06-11', '3'),
(23, 1, 'tes ret', 'ter', '2019-06-24', '1', '1', '', '3', '2019-06-11', '3'),
(24, 2, 'tesr', 'terh', '2019-06-25', '5', '2', '', '3', '2019-06-11', '3'),
(25, 1, 'tes post ulang', 'ters', '2019-06-26', '2', '1', '', '1', '2019-06-12', '3'),
(26, 1, 'terserah', 'teh', '2019-06-20', '1', '1', '', '1', '2019-06-12', '3'),
(27, 1, 'ter', 'tery', '2019-06-25', '2', '2', '', '2', '2019-06-12', '3'),
(28, 1, 'tolak jal', 'retna', '2019-06-25', '1', '1', '', '2', '2019-06-12', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket_riject`
--

CREATE TABLE IF NOT EXISTS `ticket_riject` (
  `id_ticket_riject` int(5) NOT NULL,
  `id_my_ticket` int(5) NOT NULL,
  `alasan` varchar(200) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ticket_riject`
--

INSERT INTO `ticket_riject` (`id_ticket_riject`, `id_my_ticket`, `alasan`, `created_date`, `created_by`) VALUES
(1, 27, 'tes solat', '2019-06-12', 3),
(2, 28, 'tes tolak', '2019-06-12', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket_task`
--

CREATE TABLE IF NOT EXISTS `ticket_task` (
  `id_ticket_task` int(5) NOT NULL,
  `id_my_ticket` int(10) NOT NULL,
  `id_pic_child` varchar(10) NOT NULL,
  `parent_due_date` date NOT NULL,
  `id_pic_parent` varchar(10) NOT NULL,
  `parent_note` varchar(200) NOT NULL,
  `child_start_date` date NOT NULL,
  `created_date` date NOT NULL,
  `child_note` varchar(500) NOT NULL,
  `child_finish_date` date NOT NULL,
  `status` int(2) NOT NULL COMMENT '0= open, 1=closed, 2=post_ulang, 3=ditolak'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ticket_task`
--

INSERT INTO `ticket_task` (`id_ticket_task`, `id_my_ticket`, `id_pic_child`, `parent_due_date`, `id_pic_parent`, `parent_note`, `child_start_date`, `created_date`, `child_note`, `child_finish_date`, `status`) VALUES
(1, 22, '13', '2019-06-19', '3', 'terserah', '0000-00-00', '2019-06-12', '', '0000-00-00', 0),
(2, 24, '3', '2019-06-26', '3', 'tolong di kerjakan secepatnya', '0000-00-00', '2019-06-12', 'tes pebaikan', '0000-00-00', 1),
(3, 23, '3', '2019-06-26', '3', 'ter', '2019-06-12', '2019-06-12', 'tes start dan finish', '2019-06-13', 1),
(4, 23, '3', '2019-06-13', '3', 'retna suhada', '0000-00-00', '2019-06-12', '', '0000-00-00', 2),
(5, 21, '3', '2019-06-27', '3', 'tes post ulang', '0000-00-00', '2019-06-12', '', '0000-00-00', 2),
(6, 21, '23', '2019-06-19', '3', 'retna ', '0000-00-00', '2019-06-12', '', '0000-00-00', 0),
(7, 25, '13', '2019-06-27', '3', 'tes', '0000-00-00', '2019-06-12', '', '0000-00-00', 0),
(8, 26, '3', '2019-06-13', '3', 'retna', '0000-00-00', '2019-06-12', '', '0000-00-00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `lampiran`
--
ALTER TABLE `lampiran`
  ADD PRIMARY KEY (`id_lampiran`);

--
-- Indexes for table `my_ticket`
--
ALTER TABLE `my_ticket`
  ADD PRIMARY KEY (`id_my_ticket`);

--
-- Indexes for table `ticket_riject`
--
ALTER TABLE `ticket_riject`
  ADD PRIMARY KEY (`id_ticket_riject`);

--
-- Indexes for table `ticket_task`
--
ALTER TABLE `ticket_task`
  ADD PRIMARY KEY (`id_ticket_task`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lampiran`
--
ALTER TABLE `lampiran`
  MODIFY `id_lampiran` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `my_ticket`
--
ALTER TABLE `my_ticket`
  MODIFY `id_my_ticket` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `ticket_riject`
--
ALTER TABLE `ticket_riject`
  MODIFY `id_ticket_riject` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ticket_task`
--
ALTER TABLE `ticket_task`
  MODIFY `id_ticket_task` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
