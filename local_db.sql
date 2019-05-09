-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 25 2019 г., 20:40
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `local_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Concerts`
--

CREATE TABLE `Concerts` (
  `id_conc` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_place` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Concerts`
--

INSERT INTO `Concerts` (`id_conc`, `name`, `id_place`, `data`) VALUES
(1, 'MAMA', 1, '2019-04-25'),
(2, 'Grammy', 2, '2019-05-06'),
(3, 'AMA', 1, '2019-05-23'),
(4, 'Japan Music Awards', 3, '2019-05-15');

-- --------------------------------------------------------

--
-- Структура таблицы `Place`
--

CREATE TABLE `Place` (
  `id_place` int(11) NOT NULL,
  `name` text NOT NULL,
  `adress` text NOT NULL,
  `location` text NOT NULL,
  `vmist` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Place`
--

INSERT INTO `Place` (`id_place`, `name`, `adress`, `location`, `vmist`) VALUES
(1, 'Seoul Arena', 'Songpa-gu, Seoul', 'South Korea', 100000),
(2, 'Sity Fild', 'New York', 'USA', 70000),
(3, 'Tokio Doum', 'Bunkyu, Tokio', 'Japan', 55000);

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
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

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(20) NOT NULL,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `full_name`, `email`, `username`, `password`) VALUES
(1, 'Юлія', 'miss.alaia@yandex.ru', 'ymkim', '12345'),
(2, 'Анна', 'anna@mail.ru', 'Anna', '123455');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Concerts`
--
ALTER TABLE `Concerts`
  ADD PRIMARY KEY (`id_conc`);

--
-- Индексы таблицы `Place`
--
ALTER TABLE `Place`
  ADD PRIMARY KEY (`id_place`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Concerts`
--
ALTER TABLE `Concerts`
  MODIFY `id_conc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Place`
--
ALTER TABLE `Place`
  MODIFY `id_place` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
