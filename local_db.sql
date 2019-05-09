-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 09, 2019 at 08:02 PM
-- Server version: 5.6.41
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `local_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `concerts`
--

CREATE TABLE `concerts` (
  `id_conc` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_place` int(11) NOT NULL,
  `data` date NOT NULL,
  `cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `concerts`
--

INSERT INTO `concerts` (`id_conc`, `name`, `id_place`, `data`, `cena`) VALUES
(1, 'MAMA', 1, '2019-04-25', 52),
(2, 'Grammy', 2, '2019-05-06', NULL),
(3, 'AMA', 1, '2019-05-23', NULL),
(4, 'Japan Music Awards', 3, '2019-05-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `id_place` int(11) NOT NULL,
  `name` text NOT NULL,
  `adress` text NOT NULL,
  `location` text NOT NULL,
  `vmist` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`id_place`, `name`, `adress`, `location`, `vmist`) VALUES
(1, 'Seoul Arena', 'Songpa-gu, Seoul', 'South Korea', 100000),
(2, 'Sity Fild', 'New York', 'USA', 70000),
(3, 'Tokio Doum', 'Bunkyu, Tokio', 'Japan', 55000);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_conc` int(11) NOT NULL,
  `id_place` int(11) NOT NULL,
  `data` date NOT NULL,
  `kilk` int(11) NOT NULL,
  `sum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `id_user`, `id_conc`, `id_place`, `data`, `kilk`, `sum`) VALUES
(0, 4, 1, 1, '2011-11-20', 1, 1),
(0, 1, 1, 1, '0000-00-00', 1, 1),
(0, 14, 1, 1, '0000-00-00', 1, 1),
(0, 14, 1, 1, '0000-00-00', 1, 1),
(0, 17, 2, 2, '0000-00-00', 2, 1),
(0, 17, 2, 2, '2019-05-06', 2, 1),
(0, 19, 2, 2, '2019-05-06', 2, 1),
(0, 20, 2, 2, '2019-05-06', 3, 1),
(0, 20, 2, 2, '2019-05-06', 3, 1),
(0, 22, 3, 1, '2019-05-23', 2, 1),
(0, 4, 2, 2, '2019-05-06', 2, 1),
(0, 24, 1, 1, '2019-04-25', 4, 56),
(0, 24, 1, 1, '2019-04-25', 4, 56),
(0, 24, 1, 1, '2019-04-25', 4, 208),
(0, 24, 1, 1, '2019-04-25', 4, 208),
(0, 24, 1, 1, '2019-04-25', 5, 260),
(0, 24, 1, 1, '2019-04-25', 5, 260),
(0, 24, 1, 1, '2019-04-25', 5, 260);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(20) NOT NULL,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `full_name`, `email`, `username`, `password`) VALUES
(1, 'Юлія', 'miss.alaia@yandex.ru', 'ymkim', '12345'),
(2, 'Анна', 'anna@mail.ru', 'Anna', '123455'),
(3, '1', '2', '', ''),
(4, 'ВАЗ-2101', 'ad@s', '', ''),
(5, 'ВАЗ-2101', 'ad@s', '', ''),
(6, 'ВАЗ-2101', 'ad@s', '', ''),
(7, 'ВАЗ-2101', 'ad@s', '', ''),
(8, 'ВАЗ-2101', 'ad@s', '', ''),
(9, '', '', '', ''),
(10, '', '', '', ''),
(11, '', '', '', ''),
(12, '', '', '', ''),
(13, '', '', '', ''),
(14, 'ntq', 's@c', '', ''),
(15, 'ntq', 's@c', '', ''),
(16, 'ntq', 's@c', '', ''),
(17, 'fewfwr', 's@c', '', ''),
(18, 'fewfwr', 's@c', '', ''),
(19, 'ntq', 'ad@s', '', ''),
(20, 'фыв', 'dw@d', '', ''),
(21, 'фыв', 'dw@d', '', ''),
(22, 'adsdas', 'ad@s', '', ''),
(23, 'ВАЗ-2101', 'ad@s', '', ''),
(24, 'w', 'ad@sw', '', ''),
(25, 'w', 'ad@sw', '', ''),
(26, 'w', 'ad@sw', '', ''),
(27, 'w', 'ad@sw', '', ''),
(28, 'w', 'ad@sw', '', ''),
(29, 'w', 'ad@sw', '', ''),
(30, 'w', 'ad@sw', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `concerts`
--
ALTER TABLE `concerts`
  ADD PRIMARY KEY (`id_conc`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id_place`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `concerts`
--
ALTER TABLE `concerts`
  MODIFY `id_conc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `id_place` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
