-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 12 2019 г., 11:05
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
-- Структура таблицы `prefix_admin_users_ban`
--

CREATE TABLE `prefix_admin_users_ban` (
  `id` int(11) NOT NULL,
  `restriction_type` tinyint(4) NOT NULL DEFAULT '1',
  `block_type` tinyint(4) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` int(10) UNSIGNED DEFAULT NULL,
  `ip_start` int(10) UNSIGNED DEFAULT NULL,
  `ip_finish` int(10) UNSIGNED DEFAULT NULL,
  `time_type` tinyint(4) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_finish` datetime NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_date` datetime DEFAULT NULL,
  `reason_for_user` varchar(500) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_category`
--

CREATE TABLE `prefix_category` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `url_full` varchar(250) NOT NULL,
  `date_create` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `count_target` int(11) NOT NULL DEFAULT '0',
  `data` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_category_target`
--

CREATE TABLE `prefix_category_target` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target_id` int(11) NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_category_type`
--

CREATE TABLE `prefix_category_type` (
  `id` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` datetime NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_cron_task`
--

CREATE TABLE `prefix_cron_task` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `method` varchar(500) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `count_run` int(11) NOT NULL DEFAULT '0',
  `period_run` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_run_last` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_media`
--

CREATE TABLE `prefix_media` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `type` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_name` varchar(500) NOT NULL,
  `file_size` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_media`
--

INSERT INTO `prefix_media` (`id`, `user_id`, `type`, `target_type`, `file_path`, `file_name`, `file_size`, `width`, `height`, `date_add`, `data`) VALUES
(1, 1, 1, 'user1', '[relative]/uploads/media/user1/2018/12/18/10/d3bce4c423e9db5110f6.jpg', 'batut-s-ograzhdeniem-310-sm-sl-26052017-19', 191449, 900, 559, '2018-12-18 10:20:44', 'a:1:{s:11:"image_sizes";a:8:{s:1:"w";s:3:"900";s:1:"h";N;s:4:"crop";b:1;i:0;a:3:{s:1:"w";s:3:"900";s:1:"h";N;s:4:"crop";b:1;}i:1;a:3:{s:1:"w";s:3:"900";s:1:"h";N;s:4:"crop";b:1;}i:2;a:3:{s:1:"w";s:3:"900";s:1:"h";N;s:4:"crop";b:1;}i:3;a:3:{s:1:"w";s:3:"900";s:1:"h";N;s:4:"crop";b:1;}i:4;a:3:{s:1:"w";N;s:1:"h";s:3:"200";s:4:"crop";b:1;}}}'),
(2, 1, 1, 'user1', '[relative]/uploads/media/user1/2018/12/22/14/71819bc34707a6fab08c.jpg', 'лада', 548905, 2560, 1707, '2018-12-22 14:44:08', 'a:1:{s:11:"image_sizes";a:9:{i:0;a:3:{s:1:"w";i:1000;s:1:"h";N;s:4:"crop";b:0;}i:1;a:3:{s:1:"w";i:200;s:1:"h";N;s:4:"crop";b:0;}i:2;a:3:{s:1:"w";i:500;s:1:"h";N;s:4:"crop";b:0;}i:3;a:3:{s:1:"w";i:100;s:1:"h";i:100;s:4:"crop";b:1;}i:4;a:3:{s:1:"w";i:50;s:1:"h";i:50;s:4:"crop";b:1;}i:5;a:3:{s:1:"w";s:4:"1500";s:1:"h";N;s:4:"crop";b:1;}i:6;a:3:{s:1:"w";s:4:"1500";s:1:"h";N;s:4:"crop";b:1;}i:7;a:4:{s:1:"w";N;s:1:"h";N;s:4:"crop";b:0;s:6:"avatar";b:1;}i:8;a:3:{s:1:"w";N;s:1:"h";s:3:"200";s:4:"crop";b:1;}}}'),
(3, 1, 1, 'user1', '[relative]/uploads/media/user1/2018/12/22/14/d09e2825f48815e80abb.jpg', 'foto', 580561, 1427, 1592, '2018-12-22 14:52:14', 'a:1:{s:11:"image_sizes";a:10:{i:0;a:3:{s:1:"w";i:1000;s:1:"h";N;s:4:"crop";b:0;}i:1;a:3:{s:1:"w";i:200;s:1:"h";N;s:4:"crop";b:0;}i:2;a:3:{s:1:"w";i:500;s:1:"h";N;s:4:"crop";b:0;}i:3;a:3:{s:1:"w";i:100;s:1:"h";i:100;s:4:"crop";b:1;}i:4;a:3:{s:1:"w";i:50;s:1:"h";i:50;s:4:"crop";b:1;}i:5;a:3:{s:1:"w";s:4:"1427";s:1:"h";N;s:4:"crop";b:1;}i:6;a:3:{s:1:"w";i:300;s:1:"h";N;s:4:"crop";b:1;}i:7;a:3:{s:1:"w";i:50;s:1:"h";N;s:4:"crop";b:1;}i:8;a:3:{s:1:"w";i:30;s:1:"h";N;s:4:"crop";b:1;}i:9;a:3:{s:1:"w";N;s:1:"h";s:3:"200";s:4:"crop";b:1;}}}'),
(4, 7, 1, 'user7', '[relative]/uploads/media/user7/2018/12/26/08/5425c214c1db8bf00595.jpg', 'баттут', 310376, 1713, 1606, '2018-12-26 08:12:19', 'a:1:{s:11:"image_sizes";a:6:{i:0;a:3:{s:1:"w";i:1000;s:1:"h";N;s:4:"crop";b:0;}i:1;a:3:{s:1:"w";i:200;s:1:"h";N;s:4:"crop";b:0;}i:2;a:3:{s:1:"w";i:500;s:1:"h";N;s:4:"crop";b:0;}i:3;a:3:{s:1:"w";i:100;s:1:"h";i:100;s:4:"crop";b:1;}i:4;a:3:{s:1:"w";i:50;s:1:"h";i:50;s:4:"crop";b:1;}i:5;a:3:{s:1:"w";N;s:1:"h";s:3:"200";s:4:"crop";b:1;}}}'),
(5, 10, 1, 'user', '[relative]/uploads/media/user/10/2019/01/18/13/12e9b7e477d50219f379.png', 'Налог', 2545379, 1041, 610, '2019-01-18 13:31:58', 'a:1:{s:11:"image_sizes";a:5:{i:0;a:3:{s:1:"w";i:200;s:1:"h";N;s:4:"crop";b:0;}i:1;a:3:{s:1:"w";i:500;s:1:"h";N;s:4:"crop";b:0;}i:2;a:3:{s:1:"w";N;s:1:"h";i:200;s:4:"crop";b:1;}i:3;a:3:{s:1:"w";i:50;s:1:"h";i:50;s:4:"crop";b:1;}i:4;a:3:{s:1:"w";s:3:"100";s:1:"h";s:3:"100";s:4:"crop";b:1;}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_media_target`
--

CREATE TABLE `prefix_media_target` (
  `id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) UNSIGNED NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(50) NOT NULL,
  `target_tmp` varchar(50) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `is_preview` tinyint(1) NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_media_target`
--

INSERT INTO `prefix_media_target` (`id`, `media_id`, `target_id`, `target_type`, `target_tmp`, `date_add`, `is_preview`, `data`) VALUES
(1, 1, 11, 'ser', NULL, '2018-12-19 00:00:00', 0, ''),
(17, 4, 16, 'response', NULL, '2018-12-26 15:06:21', 0, 'a:0:{}'),
(18, 4, 2, 'proposal', NULL, '2018-12-27 09:49:40', 0, 'a:0:{}'),
(19, 4, 2, 'proposal', NULL, '2018-12-27 09:49:41', 0, 'a:0:{}'),
(20, 4, 3, 'proposal', NULL, '2018-12-27 09:52:26', 0, 'a:0:{}'),
(21, 4, 3, 'proposal', NULL, '2018-12-27 09:52:26', 0, 'a:0:{}'),
(22, 4, 4, 'proposal', NULL, '2018-12-27 09:52:41', 0, 'a:0:{}'),
(23, 4, 4, 'proposal', NULL, '2018-12-27 09:52:41', 0, 'a:0:{}'),
(24, 4, 5, 'proposal', NULL, '2018-12-27 09:53:33', 0, 'a:0:{}'),
(25, 4, 5, 'proposal', NULL, '2018-12-27 09:53:33', 0, 'a:0:{}'),
(27, 3, 19, 'proposal', NULL, '2019-01-13 12:26:56', 0, 'a:0:{}'),
(28, 1, 21, 'response', NULL, '2019-01-14 07:37:28', 0, 'a:0:{}'),
(29, 1, 22, 'response', NULL, '2019-01-14 08:12:46', 0, 'a:0:{}'),
(30, 2, 23, 'proposal', NULL, '2019-01-14 08:17:14', 0, 'a:0:{}'),
(31, 3, 29, 'arbitrage', NULL, '2019-01-14 13:32:50', 0, 'a:0:{}'),
(32, 3, 30, 'response', NULL, '2019-01-14 14:25:27', 0, 'a:0:{}'),
(34, 2, 39, 'answer', NULL, '2019-02-14 08:10:58', 0, 'a:0:{}'),
(36, 3, 1, 'user_photo', NULL, '2019-02-15 07:47:29', 0, 'a:1:{s:4:"size";s:5:"photo";}');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_menu`
--

CREATE TABLE `prefix_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `title` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `prefix_menu`
--

INSERT INTO `prefix_menu` (`id`, `name`, `title`, `state`) VALUES
(1, 'main', 'Главное', 1),
(2, 'user', 'Пользователь', 1),
(3, 'settings', 'Настройка профиля', 1),
(4, 'profile', 'Меню профиля', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_menu_item`
--

CREATE TABLE `prefix_menu_item` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_menu_item`
--

INSERT INTO `prefix_menu_item` (`id`, `name`, `url`, `menu_id`, `pid`, `title`, `state`, `priority`) VALUES
(1, 'people', 'people', 1, 0, 'menu.humans.text', 1, 100),
(5, 'companies', 'companies', 1, 0, 'menu.companies.text', 1, 99);

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_notify_task`
--

CREATE TABLE `prefix_notify_task` (
  `notify_task_id` int(10) UNSIGNED NOT NULL,
  `user_login` varchar(30) DEFAULT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `notify_subject` varchar(200) DEFAULT NULL,
  `notify_text` text,
  `date_created` datetime DEFAULT NULL,
  `notify_task_status` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_page`
--

CREATE TABLE `prefix_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8_bin NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_page_content`
--

CREATE TABLE `prefix_page_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8_bin,
  `data` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_plugin_migration`
--

CREATE TABLE `prefix_plugin_migration` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `date_create` datetime NOT NULL,
  `file` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_plugin_migration`
--

INSERT INTO `prefix_plugin_migration` (`id`, `code`, `version`, `date_create`, `file`) VALUES
(1, 'widjet', '1.0.0', '2019-04-06 09:45:31', 'CreateTable.php');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_plugin_version`
--

CREATE TABLE `prefix_plugin_version` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `date_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_plugin_version`
--

INSERT INTO `prefix_plugin_version` (`id`, `code`, `version`, `date_update`) VALUES
(1, 'admin', '1.0.2', '2018-12-06 07:49:30'),
(2, 'widjet', '1.0.0', '2019-04-06 09:45:31');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_profile_target`
--

CREATE TABLE `prefix_profile_target` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `target_id` bigint(20) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_property`
--

CREATE TABLE `prefix_property` (
  `id` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `type` enum('int','float','varchar','text','checkbox','select','tags','video_link') NOT NULL DEFAULT 'text',
  `code` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `date_create` datetime NOT NULL,
  `sort` int(11) NOT NULL,
  `validate_rules` varchar(500) DEFAULT NULL,
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_property_select`
--

CREATE TABLE `prefix_property_select` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `value` varchar(250) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_property_target`
--

CREATE TABLE `prefix_property_target` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_property_value`
--

CREATE TABLE `prefix_property_value` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `property_type` varchar(30) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target_id` int(11) NOT NULL,
  `value_int` int(11) DEFAULT NULL,
  `value_float` float(11,2) DEFAULT NULL,
  `value_varchar` varchar(250) DEFAULT NULL,
  `value_text` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_property_value_select`
--

CREATE TABLE `prefix_property_value_select` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target_id` int(11) NOT NULL,
  `select_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_property_value_tag`
--

CREATE TABLE `prefix_property_value_tag` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target_id` int(11) NOT NULL,
  `text` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rating_stat`
--

CREATE TABLE `prefix_rating_stat` (
  `id` int(10) UNSIGNED NOT NULL,
  `target_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `target_id` int(10) UNSIGNED NOT NULL,
  `rating` float DEFAULT '0',
  `count_vote` bigint(20) UNSIGNED DEFAULT '0',
  `data` text COLLATE utf8_bin,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rating_vote`
--

CREATE TABLE `prefix_rating_vote` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `vote` smallint(6) NOT NULL,
  `target_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `target_id` int(10) UNSIGNED NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `prefix_rating_vote`
--

INSERT INTO `prefix_rating_vote` (`id`, `user_id`, `from_id`, `vote`, `target_type`, `target_id`, `date_update`, `date_create`) VALUES
(5, 0, 0, 3, 'user', 1, '2019-01-06 16:09:38', '2019-01-06 16:09:38'),
(6, 0, 0, 3, 'user', 1, '2019-01-06 16:09:40', '2019-01-06 16:09:40'),
(7, 0, 0, 3, 'user', 7, '2019-01-09 16:22:03', '2019-01-09 16:22:03'),
(8, 0, 0, 3, 'user', 7, '2019-01-09 16:31:24', '2019-01-09 16:31:24'),
(9, 0, 0, 2, 'user', 7, '2019-01-09 17:38:13', '2019-01-09 17:38:13');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rbac_group`
--

CREATE TABLE `prefix_rbac_group` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_rbac_group`
--

INSERT INTO `prefix_rbac_group` (`id`, `code`, `title`, `date_create`) VALUES
(1, 'user', 'Пользователи', '2018-12-31 08:22:14');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rbac_permission`
--

CREATE TABLE `prefix_rbac_permission` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `msg_error` varchar(250) DEFAULT NULL,
  `date_create` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_rbac_permission`
--

INSERT INTO `prefix_rbac_permission` (`id`, `group_id`, `code`, `plugin`, `title`, `msg_error`, `date_create`, `state`) VALUES
(1, 1, 'moderation', '', 'Модерация', '', '2018-12-31 05:26:17', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rbac_role`
--

CREATE TABLE `prefix_rbac_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `date_create` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_rbac_role`
--

INSERT INTO `prefix_rbac_role` (`id`, `pid`, `code`, `title`, `date_create`, `state`) VALUES
(1, NULL, 'user', 'Личность', '2018-12-31 08:24:40', 1),
(2, NULL, 'company', 'Компания', '2018-12-31 08:24:40', 1),
(3, NULL, 'moderator', 'Модератор', '2018-12-31 05:25:36', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rbac_role_permission`
--

CREATE TABLE `prefix_rbac_role_permission` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_rbac_role_permission`
--

INSERT INTO `prefix_rbac_role_permission` (`id`, `role_id`, `permission_id`, `date_create`) VALUES
(0, 3, 1, '2018-12-31 05:26:30');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_rbac_role_user`
--

CREATE TABLE `prefix_rbac_role_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_rbac_role_user`
--

INSERT INTO `prefix_rbac_role_user` (`id`, `user_id`, `role_id`, `date_create`) VALUES
(2, 7, 3, '2019-01-13 10:24:48'),
(3, 9, 1, '2019-01-14 08:40:15'),
(4, 10, 2, '2019-01-14 09:16:19'),
(5, 1, 1, '2019-01-22 11:42:31');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_reminder`
--

CREATE TABLE `prefix_reminder` (
  `code` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_used` datetime DEFAULT '0000-00-00 00:00:00',
  `date_expire` datetime NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_session`
--

CREATE TABLE `prefix_session` (
  `key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_create` varchar(40) NOT NULL,
  `ip_last` varchar(40) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_last` datetime NOT NULL,
  `date_close` datetime DEFAULT NULL,
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_session`
--

INSERT INTO `prefix_session` (`key`, `user_id`, `ip_create`, `ip_last`, `date_create`, `date_last`, `date_close`, `extra`) VALUES
('07be2389fee415d464967b00a412672e', 1, '127.0.0.1', '127.0.0.1', '2019-01-14 08:27:19', '2019-01-14 08:31:44', '2019-01-14 08:31:44', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('361910c742088d0cb9c58d943740e229', 1, '127.0.0.1', '127.0.0.1', '2019-02-14 08:05:32', '2019-02-15 07:48:04', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('38e8b7fc16e9160ba6f1456de66097bf', 1, '127.0.0.1', '127.0.0.1', '2019-01-25 08:40:24', '2019-01-30 10:40:36', '2019-01-30 10:40:36', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('54cd94249a0ab54a83b297fd85c52685', 1, '127.0.0.1', '127.0.0.1', '2019-04-22 11:27:48', '2019-04-23 11:38:05', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('5e747b7c0728a5b30340644f96b82146', 1, '127.0.0.1', '127.0.0.1', '2019-01-30 10:40:52', '2019-01-30 15:17:01', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('744019587518f1557e056b4e73306e94', 1, '127.0.0.1', '127.0.0.1', '2019-04-06 07:45:47', '2019-04-15 12:15:57', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('8b8e0e8320478356b799aaf24bd44881', 10, '127.0.0.1', '127.0.0.1', '2019-01-17 09:26:52', '2019-01-21 08:06:28', '2019-01-21 08:06:28', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('a78a5dfb5c7fd835a48194a4714c5b57', 1, '127.0.0.1', '127.0.0.1', '2019-01-14 11:47:10', '2019-01-17 09:26:41', '2019-01-17 09:26:41', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('b5b68d20dff92c1643e152c9f2b5a906', 7, '127.0.0.1', '127.0.0.1', '2018-12-26 07:48:05', '2018-12-27 10:17:04', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/64.0.3282.167 Chrome\\/64.0.3282.167 Safari\\/537.36"}'),
('b6016a71fd90f8b27e97fa7ede8a6aeb', 7, '127.0.0.1', '127.0.0.1', '2018-12-30 15:09:33', '2018-12-31 11:40:22', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/64.0.3282.167 Chrome\\/64.0.3282.167 Safari\\/537.36"}'),
('c4f270b6974449fe6a65e6143df87855', 1, '127.0.0.1', '127.0.0.1', '2019-01-13 11:56:12', '2019-01-13 12:06:37', '2019-01-13 12:06:37', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('c69d4772d05b73008436e1db49fdb9b9', 10, '127.0.0.1', '127.0.0.1', '2019-01-14 09:21:43', '2019-01-14 11:47:02', '2019-01-14 11:47:02', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('cab8caafbdc5e35e6325d6018c68916d', 1, '127.0.0.1', '127.0.0.1', '2019-01-13 12:22:43', '2019-01-14 08:27:07', '2019-01-14 08:27:07', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('ccbd291a01a16fee9d32967cf310cae9', 7, '127.0.0.1', '127.0.0.1', '2019-01-14 14:26:56', '2019-01-14 14:32:16', NULL, '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('d6e4631c22bf947bf7dc6d379d569cc9', 7, '127.0.0.1', '127.0.0.1', '2019-02-07 08:08:56', '2019-02-14 08:01:59', '2019-02-14 08:01:59', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}'),
('fcee19fdeaf4e3616190b71b9adef606', 1, '127.0.0.1', '127.0.0.1', '2019-01-21 08:06:35', '2019-01-22 12:02:41', '2019-01-22 12:02:41', '{"user_agent":"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Ubuntu Chromium\\/71.0.3578.98 Chrome\\/71.0.3578.98 Safari\\/537.36"}');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_stat`
--

CREATE TABLE `prefix_stat` (
  `id` int(10) UNSIGNED NOT NULL,
  `target_type` varchar(20) NOT NULL,
  `target_id` int(10) UNSIGNED NOT NULL,
  `rating` float DEFAULT '0',
  `count_vote` bigint(20) UNSIGNED DEFAULT '0',
  `data` text,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_storage`
--

CREATE TABLE `prefix_storage` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  `instance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_storage`
--

INSERT INTO `prefix_storage` (`id`, `key`, `value`, `instance`) VALUES
(1, 'plugin_admin', 'a:1:{s:23:"admin_last_visit_data_1";a:2:{s:4:"date";s:19:"2019-04-07 09:38:06";s:2:"ip";s:9:"127.0.0.1";}}', 'default'),
(11, '__default__', 'a:1:{s:10:"__config__";a:6:{s:4:"view";a:4:{s:4:"name";s:4:"Fend";s:11:"description";s:21:"Description your site";s:8:"keywords";s:4:"eeee";s:4:"skin";s:9:"bootstrap";}s:7:"general";a:1:{s:10:"admin_mail";s:15:"admin@admin.adm";}s:6:"module";a:4:{s:4:"user";a:2:{s:24:"captcha_use_registration";i:1;s:10:"user_guest";i:1;}s:6:"notify";a:3:{s:7:"delayed";i:0;s:13:"insert_single";i:0;s:11:"per_process";s:2:"10";}s:5:"asset";a:2:{s:3:"css";a:2:{s:5:"merge";i:0;s:8:"compress";i:0;}s:2:"js";a:2:{s:5:"merge";i:0;s:8:"compress";i:0;}}s:2:"ls";a:2:{s:12:"send_general";i:0;s:11:"use_counter";i:0;}}s:6:"smarty";a:2:{s:13:"compile_check";i:0;s:13:"force_compile";i:1;}s:3:"sys";a:2:{s:6:"cookie";a:1:{s:4:"path";s:1:"/";}s:4:"mail";a:5:{s:4:"type";s:4:"mail";s:10:"from_email";s:15:"admin@admin.adm";s:9:"from_name";s:26:"Почтовик Your Site";s:7:"charset";s:5:"UTF-8";s:4:"smtp";a:6:{s:4:"host";s:9:"localhost";s:4:"port";s:2:"25";s:4:"user";s:0:"";s:8:"password";s:0:"";s:6:"secure";s:0:"";s:4:"auth";i:1;}}}s:3:"seo";a:4:{s:5:"title";s:31:"{$global_title} - fgfgfgc c c c";s:2:"h1";s:10:"fgfgc c c ";s:8:"keywords";s:46:"{$login} , {$name}, {$rating}, {$count_vote}, ";s:11:"description";s:8:"{$about}";}}}', 'default'),
(66, 'plugin_save', 'a:1:{s:10:"__config__";N;}', 'default');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_talk_message`
--

CREATE TABLE `prefix_talk_message` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `target_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `rating` float NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `prefix_talk_message`
--

INSERT INTO `prefix_talk_message` (`id`, `type`, `user_id`, `user_name`, `target_type`, `target_id`, `text`, `state`, `rating`, `date_create`, `date_update`) VALUES
(1, 'response', 7, '', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'publish', 4, '2018-12-30 18:10:27', '2019-02-14 11:08:37'),
(2, 'response', 7, '', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'publish', 5, '2018-12-31 11:17:02', '2019-02-14 11:08:37'),
(3, 'response', 7, '', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'arbitrage', 4, '2018-12-31 11:17:39', '2019-02-14 11:43:25'),
(4, 'response', 7, '', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'delete', 4, '2018-12-31 11:19:29', '2019-02-14 11:08:37'),
(5, 'response', 0, '', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'delete', 3, '2019-01-06 14:32:55', '2019-02-14 11:08:37'),
(6, 'response', 0, '', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'delete', 3, '2019-01-06 15:00:32', '2019-02-14 11:08:37'),
(7, 'response', 0, 'Оленнг', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'chat', 3, '2019-01-06 15:01:48', '2019-02-14 13:23:37'),
(8, 'response', 0, 'sdsdsd', 'user', 1, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'publish', 3, '2019-01-06 15:43:19', '2019-02-14 11:08:37'),
(9, 'proposal', 0, '', 'user', 1, 'dfsfdsfsdfsdf', 'publish', 0, '2019-01-06 15:49:25', '2019-01-06 15:49:25'),
(10, 'response', 0, 'Тестовый ость', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'moderate', 3, '2019-01-09 16:07:02', '2019-02-14 11:08:37'),
(11, 'response', 0, 'Тестовый uость2', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'publish', 3, '2019-01-09 16:09:34', '2019-02-14 11:08:37'),
(12, 'response', 0, 'Тестовый uость3', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'publish', 3, '2019-01-09 16:21:18', '2019-02-14 11:08:37'),
(13, 'response', 0, 'Тестовый 1', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'publish', 2, '2019-01-09 17:34:26', '2019-02-14 11:08:37'),
(14, 'proposal', 0, '', 'user', 7, 'Предлагаю 3', 'publish', 0, '2019-01-09 17:49:13', '2019-01-09 17:49:13'),
(15, 'proposal', 0, '', 'user', 7, 'dfdfdfdfdfdfdf', 'publish', 0, '2019-01-09 17:55:51', '2019-01-09 17:55:51'),
(16, 'proposal', 0, '', 'user', 7, 'dfdfdfdfdfd', 'publish', 0, '2019-01-09 17:58:12', '2019-01-09 17:58:12'),
(17, 'proposal', 0, '', 'user', 7, 'dfhdfhdfghdfhdfghdfghdfh', 'publish', 0, '2019-01-09 18:00:08', '2019-01-09 18:00:08'),
(18, 'proposal', 0, 'dfgdfgdfgdfgdfgdf', 'user', 7, 'dfgdfgdfgdfgdf', 'publish', 0, '2019-01-09 18:02:37', '2019-01-09 18:02:37'),
(19, 'proposal', 1, '', 'user', 7, 'dfdfdfdffdfdf', 'publish', 0, '2019-01-13 15:26:56', '2019-01-13 15:26:56'),
(20, 'arbitrage', 1, '', 'response', 8, 'тесесесесес', 'closed', 0, '2019-01-13 18:13:51', '2019-01-14 16:46:35'),
(21, 'response', 0, '', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'moderate', 4, '2019-01-14 10:37:28', '2019-02-14 11:08:37'),
(22, 'response', 1, '', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'delete', 4, '2019-01-14 11:12:46', '2019-02-14 11:08:37'),
(23, 'proposal', 1, '', 'user', 7, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'publish', 0, '2019-01-14 11:17:14', '2019-01-14 11:17:14'),
(24, 'arbitrage', 1, '', 'response', 8, 'Ответ модератора', 'closed', 0, '2019-01-14 14:49:40', '2019-01-14 16:46:36'),
(25, 'arbitrage', 1, '', 'response', 8, 'Ответ модератора\n', 'closed', 0, '2019-01-14 16:20:59', '2019-01-14 16:46:36'),
(28, 'arbitrage', 1, '', 'response', 8, 'Ответ пользователя', 'closed', 0, '2019-01-14 16:30:52', '2019-01-14 16:46:36'),
(29, 'arbitrage', 1, '', 'response', 8, 'ааааааааааааа', 'closed', 0, '2019-01-14 16:32:50', '2019-01-14 16:46:36'),
(30, 'response', 1, '', 'user', 7, 'Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв Тестовый отзыв ', 'delete', 4, '2019-01-14 17:25:27', '2019-02-14 11:08:37'),
(31, 'arbitrage', 7, '', 'response', 30, 'Отзыв от админа?', 'closed', 0, '2019-01-14 17:27:21', '2019-01-14 17:29:18'),
(32, 'arbitrage', 1, '', 'response', 30, 'Ответккпп ', 'closed', 0, '2019-01-14 17:28:53', '2019-01-14 17:29:18'),
(33, 'arbitrage', 7, '', 'response', 30, 'ссссссссссс', 'chat', 0, '2019-01-14 17:29:44', '2019-01-14 17:29:44'),
(34, 'arbitrage', 7, '', 'response', 30, ' мимимимророр', 'moderate', 0, '2019-01-14 17:32:16', '2019-01-14 17:32:16'),
(36, 'answer', 7, '', 'proposal', 23, 'dffgdfgdfgdfg', 'publish', 0, '2019-02-07 13:16:30', '2019-02-07 13:16:30'),
(37, 'answer', 7, '', 'response', 13, 'sdfsdfsdfdsf', 'publish', 0, '2019-02-07 13:27:02', '2019-02-07 13:27:02'),
(38, 'answer', 1, '', 'proposal', 9, 'Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ ', 'publish', 0, '2019-02-14 11:10:26', '2019-02-14 11:10:26'),
(39, 'answer', 1, '', 'response', 8, 'Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ Тестовый ответ ', 'publish', 0, '2019-02-14 11:10:58', '2019-02-14 11:10:58'),
(40, 'arbitrage', 1, '', 'response', 3, 'dfdfdfdf ddfdf ', 'moderate', 0, '2019-02-14 11:43:25', '2019-02-14 11:43:25'),
(41, 'arbitrage', 1, '', 'response', 30, 'fdgfgdfgdfgdfg', 'chat', 0, '2019-02-14 13:21:51', '2019-02-14 13:21:51'),
(42, 'arbitrage', 1, '', 'response', 7, 'Арбитражвав', 'moderate', 0, '2019-02-14 13:22:43', '2019-02-14 13:22:43'),
(43, 'arbitrage', 1, '', 'response', 3, 'укеукукеукеуке', 'chat', 0, '2019-02-14 13:23:08', '2019-02-14 13:23:08'),
(44, 'arbitrage', 1, '', 'response', 7, 'укекуеукеукеук', 'chat', 0, '2019-02-14 13:23:37', '2019-02-14 13:23:37');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_user`
--

CREATE TABLE `prefix_user` (
  `id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `about` text,
  `site` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(500) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_activate` datetime DEFAULT NULL,
  `ip_create` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `rating` float NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `activate` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `activate_key` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefix_user`
--

INSERT INTO `prefix_user` (`id`, `login`, `mail`, `name`, `role`, `about`, `site`, `phone`, `address`, `photo`, `password`, `date_create`, `date_activate`, `ip_create`, `active`, `rating`, `is_admin`, `activate`, `confirmed`, `activate_key`) VALUES
(1, 'administrator', 'end-fin@mail.ru', 'Администратор', 'user', 'sddsvf sd ddf df vdfv df vdfv df vdfv df vdf vdf bfg ht hи вапвапвапрварпваварвапв вавр вае рва в в врваервервапва вапр ва вап вапр вапр вап вапр вап вапрвапрвапр вап рвапрвапр вапрd sd sd vsd sd vsd vsdv sd vsd vsdv ds vsd vsd vsd sdv sdv sdv sdv', '', '', '', '[relative]/uploads/media/user1/2018/12/22/14/d09e2825f48815e80abb_photo.jpg', 'a05b8b200f2d0a95117b8db1418c6d44', '2018-12-01 00:00:00', '2018-12-01 00:00:00', '', 1, 0, 1, 1, 0, NULL),
(7, 'oleg', 'end-fin@yandex.ru', 'Олег', 'user', NULL, '', '', '', NULL, 'a05b8b200f2d0a95117b8db1418c6d44', '2018-12-07 14:26:29', NULL, '127.0.0.1', 1, 0, 0, 1, 0, NULL),
(8, 'Ivan23', 'dsdf@fgrg.tr', 'Иван', 'user', NULL, '', '', '', NULL, '21379', '2018-12-07 14:26:29', NULL, '127.0.0.1', 1, 0, 0, 1, 0, NULL),
(10, 'www', 'boxmilo@gmail.com', 'olezhik demidov', 'company', 'Это тестовый текст Это тестовый текст Это тестовый текст Это тестовый текст Это тестовый текст\nЭто тестовый текст Это тестовый текст Это тестовый текст Это тестовый текст Это тестовый текст', 'zzzzzz', '7145523197', 'Shkolnaia 24', '', 'a05b8b200f2d0a95117b8db1418c6d44', '2019-01-14 09:16:19', '2019-01-14 09:21:43', '127.0.0.1', 1, 0, 0, 1, 0, '287d8b91bd7f9799ea80f0b74d0cc865');

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_vote`
--

CREATE TABLE `prefix_vote` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vote` smallint(6) NOT NULL,
  `target_type` varchar(20) NOT NULL,
  `target_id` int(10) UNSIGNED NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_widjet`
--

CREATE TABLE `prefix_widjet` (
  `id` int(11) NOT NULL,
  `template` varchar(50) COLLATE utf8_bin NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_widjet_token`
--

CREATE TABLE `prefix_widjet_token` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(200) COLLATE utf8_bin NOT NULL,
  `token` varchar(500) COLLATE utf8_bin NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `prefix_widjet_token`
--

INSERT INTO `prefix_widjet_token` (`id`, `user_id`, `domain`, `token`, `date_create`) VALUES
(3, 1, 'vbbv.hjh', '4c087a48525e015b25d02e6ec6a2a1e5', '2019-04-10 12:10:52'),
(4, 1, 'fend.loc', '6c10452f687986853cda9a12ee303dd8', '2019-04-11 14:00:36');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `prefix_admin_users_ban`
--
ALTER TABLE `prefix_admin_users_ban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restriction_type` (`restriction_type`),
  ADD KEY `block_type` (`block_type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `ip_start` (`ip_start`),
  ADD KEY `ip_finish` (`ip_finish`),
  ADD KEY `time_type` (`time_type`),
  ADD KEY `date_start` (`date_start`),
  ADD KEY `date_finish` (`date_finish`),
  ADD KEY `add_date` (`add_date`),
  ADD KEY `edit_date` (`edit_date`);

--
-- Индексы таблицы `prefix_category`
--
ALTER TABLE `prefix_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `title` (`title`),
  ADD KEY `order` (`order`),
  ADD KEY `state` (`state`),
  ADD KEY `url` (`url`),
  ADD KEY `url_full` (`url_full`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `count_target` (`count_target`);

--
-- Индексы таблицы `prefix_category_target`
--
ALTER TABLE `prefix_category_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `prefix_category_type`
--
ALTER TABLE `prefix_category_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `state` (`state`),
  ADD KEY `target_type` (`target_type`);

--
-- Индексы таблицы `prefix_cron_task`
--
ALTER TABLE `prefix_cron_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `count_run` (`count_run`),
  ADD KEY `state` (`state`),
  ADD KEY `plugin` (`plugin`),
  ADD KEY `method` (`method`(255)),
  ADD KEY `period_run` (`period_run`);

--
-- Индексы таблицы `prefix_media`
--
ALTER TABLE `prefix_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`),
  ADD KEY `file_size` (`file_size`),
  ADD KEY `width` (`width`),
  ADD KEY `height` (`height`),
  ADD KEY `date_add` (`date_add`),
  ADD KEY `target_type` (`target_type`);

--
-- Индексы таблицы `prefix_media_target`
--
ALTER TABLE `prefix_media_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_id` (`media_id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `target_tmp` (`target_tmp`),
  ADD KEY `date_add` (`date_add`),
  ADD KEY `is_preview` (`is_preview`);

--
-- Индексы таблицы `prefix_menu`
--
ALTER TABLE `prefix_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `prefix_menu_item`
--
ALTER TABLE `prefix_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `state` (`state`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `prefix_notify_task`
--
ALTER TABLE `prefix_notify_task`
  ADD PRIMARY KEY (`notify_task_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Индексы таблицы `prefix_page`
--
ALTER TABLE `prefix_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `content_id` (`content_id`);

--
-- Индексы таблицы `prefix_page_content`
--
ALTER TABLE `prefix_page_content`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prefix_plugin_migration`
--
ALTER TABLE `prefix_plugin_migration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file` (`file`(255)),
  ADD KEY `code` (`code`),
  ADD KEY `version` (`version`);

--
-- Индексы таблицы `prefix_plugin_version`
--
ALTER TABLE `prefix_plugin_version`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `version` (`version`);

--
-- Индексы таблицы `prefix_profile_target`
--
ALTER TABLE `prefix_profile_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_property`
--
ALTER TABLE `prefix_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `code` (`code`),
  ADD KEY `type` (`type`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `sort` (`sort`);

--
-- Индексы таблицы `prefix_property_select`
--
ALTER TABLE `prefix_property_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `sort` (`sort`);

--
-- Индексы таблицы `prefix_property_target`
--
ALTER TABLE `prefix_property_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `state` (`state`);

--
-- Индексы таблицы `prefix_property_value`
--
ALTER TABLE `prefix_property_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `value_int` (`value_int`),
  ADD KEY `property_type` (`property_type`),
  ADD KEY `value_float` (`value_float`),
  ADD KEY `value_varchar` (`value_varchar`);

--
-- Индексы таблицы `prefix_property_value_select`
--
ALTER TABLE `prefix_property_value_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `select_id` (`select_id`);

--
-- Индексы таблицы `prefix_property_value_tag`
--
ALTER TABLE `prefix_property_value_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `text` (`text`),
  ADD KEY `property_id` (`property_id`);

--
-- Индексы таблицы `prefix_rating_stat`
--
ALTER TABLE `prefix_rating_stat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `rating` (`rating`),
  ADD KEY `count_vote` (`count_vote`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_rating_vote`
--
ALTER TABLE `prefix_rating_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vote` (`vote`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `target_type` (`target_type`) USING BTREE,
  ADD KEY `from_id` (`from_id`);

--
-- Индексы таблицы `prefix_rbac_group`
--
ALTER TABLE `prefix_rbac_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Индексы таблицы `prefix_rbac_permission`
--
ALTER TABLE `prefix_rbac_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `state` (`state`),
  ADD KEY `plugin` (`plugin`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `prefix_rbac_role`
--
ALTER TABLE `prefix_rbac_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `state` (`state`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `code` (`code`);

--
-- Индексы таблицы `prefix_rbac_role_permission`
--
ALTER TABLE `prefix_rbac_role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_rbac_role_user`
--
ALTER TABLE `prefix_rbac_role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_reminder`
--
ALTER TABLE `prefix_reminder`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `prefix_session`
--
ALTER TABLE `prefix_session`
  ADD PRIMARY KEY (`key`),
  ADD KEY `date_last` (`date_last`),
  ADD KEY `date_close` (`date_close`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `prefix_stat`
--
ALTER TABLE `prefix_stat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_type` (`target_type`),
  ADD KEY `rating` (`rating`),
  ADD KEY `count_vote` (`count_vote`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_storage`
--
ALTER TABLE `prefix_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_instance` (`key`,`instance`),
  ADD KEY `instance` (`instance`);

--
-- Индексы таблицы `prefix_talk_message`
--
ALTER TABLE `prefix_talk_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `state` (`state`),
  ADD KEY `rating` (`rating`),
  ADD KEY `target_type` (`target_type`);
ALTER TABLE `prefix_talk_message` ADD FULLTEXT KEY `text` (`text`);
ALTER TABLE `prefix_talk_message` ADD FULLTEXT KEY `text_2` (`text`);

--
-- Индексы таблицы `prefix_user`
--
ALTER TABLE `prefix_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `mail` (`mail`),
  ADD KEY `password` (`password`),
  ADD KEY `activate_key` (`activate_key`),
  ADD KEY `active` (`active`),
  ADD KEY `activate` (`activate`),
  ADD KEY `rating` (`rating`),
  ADD KEY `role` (`role`);

--
-- Индексы таблицы `prefix_vote`
--
ALTER TABLE `prefix_vote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `target_type` (`target_type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vote` (`vote`),
  ADD KEY `date_update` (`date_update`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_widjet`
--
ALTER TABLE `prefix_widjet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template` (`template`),
  ADD KEY `date_create` (`date_create`);

--
-- Индексы таблицы `prefix_widjet_token`
--
ALTER TABLE `prefix_widjet_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date_create` (`date_create`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `prefix_admin_users_ban`
--
ALTER TABLE `prefix_admin_users_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_category`
--
ALTER TABLE `prefix_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_category_target`
--
ALTER TABLE `prefix_category_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_category_type`
--
ALTER TABLE `prefix_category_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_cron_task`
--
ALTER TABLE `prefix_cron_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_media`
--
ALTER TABLE `prefix_media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `prefix_media_target`
--
ALTER TABLE `prefix_media_target`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT для таблицы `prefix_menu`
--
ALTER TABLE `prefix_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `prefix_menu_item`
--
ALTER TABLE `prefix_menu_item`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `prefix_notify_task`
--
ALTER TABLE `prefix_notify_task`
  MODIFY `notify_task_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_page`
--
ALTER TABLE `prefix_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_page_content`
--
ALTER TABLE `prefix_page_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_plugin_migration`
--
ALTER TABLE `prefix_plugin_migration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `prefix_plugin_version`
--
ALTER TABLE `prefix_plugin_version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `prefix_profile_target`
--
ALTER TABLE `prefix_profile_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_property`
--
ALTER TABLE `prefix_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_property_select`
--
ALTER TABLE `prefix_property_select`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_property_target`
--
ALTER TABLE `prefix_property_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_property_value`
--
ALTER TABLE `prefix_property_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_property_value_select`
--
ALTER TABLE `prefix_property_value_select`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_property_value_tag`
--
ALTER TABLE `prefix_property_value_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_rating_stat`
--
ALTER TABLE `prefix_rating_stat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_rating_vote`
--
ALTER TABLE `prefix_rating_vote`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `prefix_rbac_permission`
--
ALTER TABLE `prefix_rbac_permission`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `prefix_rbac_role`
--
ALTER TABLE `prefix_rbac_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `prefix_rbac_role_user`
--
ALTER TABLE `prefix_rbac_role_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `prefix_stat`
--
ALTER TABLE `prefix_stat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_storage`
--
ALTER TABLE `prefix_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT для таблицы `prefix_talk_message`
--
ALTER TABLE `prefix_talk_message`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `prefix_user`
--
ALTER TABLE `prefix_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `prefix_vote`
--
ALTER TABLE `prefix_vote`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_widjet`
--
ALTER TABLE `prefix_widjet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prefix_widjet_token`
--
ALTER TABLE `prefix_widjet_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;