-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 14 2024 г., 07:54
-- Версия сервера: 10.4.6-MariaDB
-- Версия PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `klinika_db`
--
CREATE DATABASE IF NOT EXISTS `klinika_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `klinika_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `bemorlar`
--

CREATE TABLE `bemorlar` (
  `id` int(11) NOT NULL,
  `ism` varchar(50) NOT NULL,
  `familiya` varchar(50) NOT NULL,
  `tugilgan_sana` date NOT NULL,
  `jins` enum('Erkak','Ayol') NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `manzil` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `qabul`
--

CREATE TABLE `qabul` (
  `id` int(11) NOT NULL,
  `bemor_id` int(11) NOT NULL,
  `shifokor_id` int(11) NOT NULL,
  `qabul_sanasi` date NOT NULL,
  `qabul_vaqti` time NOT NULL,
  `sabab` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `shifokorlar`
--

CREATE TABLE `shifokorlar` (
  `id` int(11) NOT NULL,
  `ism` varchar(50) NOT NULL,
  `familiya` varchar(50) NOT NULL,
  `mutaxassislik` varchar(100) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `ish_vaqti` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `tibbiy_tarix`
--

CREATE TABLE `tibbiy_tarix` (
  `id` int(11) NOT NULL,
  `bemor_id` int(11) NOT NULL,
  `tashxis` text NOT NULL,
  `muolaja` text NOT NULL,
  `sana` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `tolovlar`
--

CREATE TABLE `tolovlar` (
  `id` int(11) NOT NULL,
  `bemor_id` int(11) NOT NULL,
  `summa` decimal(10,2) NOT NULL,
  `tolov_sanasi` date NOT NULL,
  `tolov_turi` enum('Naqd','Plastik','Online') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bemorlar`
--
ALTER TABLE `bemorlar`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `qabul`
--
ALTER TABLE `qabul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bemor_id` (`bemor_id`),
  ADD KEY `shifokor_id` (`shifokor_id`);

--
-- Индексы таблицы `shifokorlar`
--
ALTER TABLE `shifokorlar`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tibbiy_tarix`
--
ALTER TABLE `tibbiy_tarix`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bemor_id` (`bemor_id`);

--
-- Индексы таблицы `tolovlar`
--
ALTER TABLE `tolovlar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bemor_id` (`bemor_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bemorlar`
--
ALTER TABLE `bemorlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `qabul`
--
ALTER TABLE `qabul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shifokorlar`
--
ALTER TABLE `shifokorlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tibbiy_tarix`
--
ALTER TABLE `tibbiy_tarix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tolovlar`
--
ALTER TABLE `tolovlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `qabul`
--
ALTER TABLE `qabul`
  ADD CONSTRAINT `qabul_ibfk_1` FOREIGN KEY (`bemor_id`) REFERENCES `bemorlar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `qabul_ibfk_2` FOREIGN KEY (`shifokor_id`) REFERENCES `shifokorlar` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tibbiy_tarix`
--
ALTER TABLE `tibbiy_tarix`
  ADD CONSTRAINT `tibbiy_tarix_ibfk_1` FOREIGN KEY (`bemor_id`) REFERENCES `bemorlar` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tolovlar`
--
ALTER TABLE `tolovlar`
  ADD CONSTRAINT `tolovlar_ibfk_1` FOREIGN KEY (`bemor_id`) REFERENCES `bemorlar` (`id`) ON DELETE CASCADE;
--
-- База данных: `Kompyuter`
--
CREATE DATABASE IF NOT EXISTS `Kompyuter` DEFAULT CHARACTER SET big5 COLLATE big5_bin;
USE `Kompyuter`;
--
-- База данных: `Sirtqijon`
--
CREATE DATABASE IF NOT EXISTS `Sirtqijon` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Sirtqijon`;

-- --------------------------------------------------------

--
-- Структура таблицы `Talaba`
--

CREATE TABLE `Talaba` (
  `id` int(11) NOT NULL,
  `Ismi` varchar(15) NOT NULL,
  `Stipendiya` float NOT NULL,
  `Kurs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Talaba`
--
ALTER TABLE `Talaba`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Talaba`
--
ALTER TABLE `Talaba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- База данных: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- База данных: `Warchar`
--
CREATE DATABASE IF NOT EXISTS `Warchar` DEFAULT CHARACTER SET latin2 COLLATE latin2_bin;
USE `Warchar`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
