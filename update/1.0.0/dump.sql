-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 28 2019 г., 16:56
-- Версия сервера: 5.7.25-0ubuntu0.16.04.2
-- Версия PHP: 7.0.33-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `fend`
--

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_page`
--

CREATE TABLE `prefix_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(500) COLLATE utf8_bin NOT NULL,
  `title` varchar(500) COLLATE utf8_bin NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `prefix_page`
--

INSERT INTO `prefix_page` (`id`, `user_id`, `url`, `title`, `content_id`, `date_create`, `date_update`) VALUES
(1, 1, 'jkhgjghkghjghj', 'gdfhdfghdfggjhkfg', 17, '2019-05-17 17:57:34', '2019-05-28 16:26:39');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_page_content`
--

CREATE TABLE `prefix_page_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8_bin,
  `source` text COLLATE utf8_bin NOT NULL,
  `data` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `prefix_page_content`
--

INSERT INTO `prefix_page_content` (`id`, `text`, `source`, `data`) VALUES
(1, '', '', '{"descripton":"","keywords":""}'),
(2, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"descripton":"ggggggggggggggggggggggggggggggggggggg","keywords":"gggggggggggggggggggggggggggggggggggggggg"}'),
(3, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"keywords":"gggggggggggggggggggggggggggggggggggggggg"}'),
(4, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"keywords":"gggggggggggggggggggggggggggggggggggggggg"}'),
(5, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"keywords":"gggggggggggggggggggggggggggggggggggggggg"}'),
(6, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', NULL),
(7, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(8, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(9, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(10, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(11, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(12, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(13, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(14, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(15, '<p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</p>', '', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(16, '&lt;p&gt;gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg&lt;/p&gt;', '&lt;p&gt;gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg&lt;/p&gt;', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}'),
(17, '&lt;h1&gt;gggggggggggggggggg&lt;/h1&gt;&lt;br/&gt;\r\n&lt;p&gt;&lt;em&gt;ggggggggggggggggggg&lt;/em&gt;&lt;/p&gt;&lt;br/&gt;\r\n&lt;p&gt;&lt;strong&gt;ggggggggggggggggggggggggggggggggggggggggggg&lt;/strong&gt;&lt;/p&gt;&lt;br/&gt;\r\n&lt;ul&gt;&lt;li&gt;gggggggggggggggggggggggggggggggggggggggg&lt;/li&gt;&lt;br/&gt;\r\n&lt;li&gt;hhjhgjghjghjgh&lt;/li&gt;&lt;br/&gt;\r\n&lt;/ul&gt;&lt;br/&gt;\r\n&lt;p&gt; &lt;/p&gt;&lt;br/&gt;\r\n&lt;p&gt; &lt;/p&gt;', '&lt;h1&gt;gggggggggggggggggg&lt;/h1&gt;\r\n&lt;p&gt;&lt;em&gt;ggggggggggggggggggg&lt;/em&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;ggggggggggggggggggggggggggggggggggggggggggg&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;gggggggggggggggggggggggggggggggggggggggg&lt;/li&gt;\r\n&lt;li&gt;hhjhgjghjghjgh&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '{"description":"ddddddddddddddddd","keywords":"kkkkkkkkkkkkkkkkk"}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `prefix_page`
--
ALTER TABLE `prefix_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `prefix_page_content`
--
ALTER TABLE `prefix_page_content`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `prefix_page`
--
ALTER TABLE `prefix_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `prefix_page_content`
--
ALTER TABLE `prefix_page_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;