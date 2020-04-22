-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 22 apr 2020 om 23:41
-- Serverversie: 10.4.11-MariaDB
-- PHP-versie: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinematicdb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cinematic_bot_info`
--

CREATE TABLE `cinematic_bot_info` (
  `bot_id` int(11) NOT NULL,
  `cinematic_id` int(11) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `angle` float DEFAULT NULL,
  `interior_id` int(11) DEFAULT NULL,
  `anim_lib` varchar(128) DEFAULT NULL,
  `anim_name` varchar(128) DEFAULT NULL,
  `loop` int(11) DEFAULT NULL,
  `lock_x` int(11) DEFAULT NULL,
  `lock_y` int(11) DEFAULT NULL,
  `freeze` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cinematic_bot_info`
--

INSERT INTO `cinematic_bot_info` (`bot_id`, `cinematic_id`, `model_id`, `pos_x`, `pos_y`, `pos_z`, `angle`, `interior_id`, `anim_lib`, `anim_name`, `loop`, `lock_x`, `lock_y`, `freeze`, `time`) VALUES
(1, 5, 0, 1481.49, -1697.64, 14.0469, 91.0486, 0, 'ON_LOOKERS', 'wave_loop', 1, 0, 0, 0, 0),
(2, 6, 47, 462.96, -1293.63, 15.3703, 121.069, 0, 'COP_AMBIENT', 'Coplook_loop', 1, 0, 0, 0, 0),
(3, 6, 100, 461.13, -1295.15, 15.3543, 305.841, 0, 'PED', 'IDLE_CHAT', 1, 0, 0, 0, 0),
(4, 8, 280, 1213.55, -939.627, 42.6951, 285.03, 0, 'PED', 'ARRESTgun', 0, 0, 0, 1, 0),
(5, 8, 107, 1223.71, -936.802, 42.6041, 101.811, 0, 'PED', 'gang_gunstand', 1, 0, 0, 0, 0),
(6, 9, 107, 376.906, -120.779, 1001.5, 2.5497, 5, 'PED', 'gang_gunstand', 1, 0, 0, 0, 0),
(7, 9, 155, 376.688, -116.767, 1001.49, 180.775, 5, 'ROB_BANK', 'SHP_HandsUp_Scr', 0, 0, 0, 1, 0),
(8, 10, 280, 1583.44, -1685.88, 6.2188, 266.668, 0, 'COP_AMBIENT', 'Coplook_loop', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cinematic_car_info`
--

CREATE TABLE `cinematic_car_info` (
  `car_id` int(11) NOT NULL,
  `cinematic_id` int(11) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `angle` float DEFAULT NULL,
  `color_1` int(11) DEFAULT NULL,
  `color_2` int(11) DEFAULT NULL,
  `interior_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cinematic_car_info`
--

INSERT INTO `cinematic_car_info` (`car_id`, `cinematic_id`, `model_id`, `pos_x`, `pos_y`, `pos_z`, `angle`, `color_1`, `color_2`, `interior_id`) VALUES
(1, 8, 492, 1221.85, -936.061, 42.3187, 200.889, 4, 16, 0),
(2, 8, 596, 1215.02, -940.256, 42.3647, 354.431, 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cinematic_lookat_info`
--

CREATE TABLE `cinematic_lookat_info` (
  `cinematic_id` int(11) NOT NULL,
  `from_x` float DEFAULT NULL,
  `from_y` float DEFAULT NULL,
  `from_z` float DEFAULT NULL,
  `to_x` float DEFAULT NULL,
  `to_y` float DEFAULT NULL,
  `to_z` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cinematic_lookat_info`
--

INSERT INTO `cinematic_lookat_info` (`cinematic_id`, `from_x`, `from_y`, `from_z`, `to_x`, `to_y`, `to_z`) VALUES
(1, 1536.73, -1676.73, 32.5994, 1546.2, -1636.42, 32.1383),
(2, 1023.94, -1122.17, 23.8736, 1021.12, -1122.56, 23.869),
(3, 1718.73, -986.757, 58.2734, 1738.37, -989.06, 54.3721),
(4, 2032.27, -1416.52, 16.9922, 2032.27, -1416.52, 16.9922),
(5, 1481.49, -1697.64, 14.0469, 1481.49, -1697.64, 14.0469),
(6, 462.208, -1294.36, 15.3619, 462.208, -1294.36, 15.3619),
(7, 723.307, -1701.41, 4.3283, 723.307, -1701.41, 4.3283),
(8, 1213.67, -938.87, 42.693, 1213.67, -938.87, 42.693),
(9, 376.657, -116.068, 1001.49, 376.657, -116.068, 1001.49),
(10, 1583.44, -1685.88, 6.2188, 1583.44, -1685.88, 6.2188),
(25, 1606.31, -2376.06, 59.9137, 1606.31, -2376.06, 59.9137);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cinematic_obj_info`
--

CREATE TABLE `cinematic_obj_info` (
  `obj_id` int(11) NOT NULL,
  `cinematic_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `rotate_x` float NOT NULL,
  `rotate_y` float NOT NULL,
  `rotate_z` float NOT NULL,
  `interior_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cinematic_obj_info`
--

INSERT INTO `cinematic_obj_info` (`obj_id`, `cinematic_id`, `model_id`, `pos_x`, `pos_y`, `pos_z`, `rotate_x`, `rotate_y`, `rotate_z`, `interior_id`) VALUES
(1, 8, 348, 1223.06, -936.769, 43.1742, -88.3, 0, -160.4, 0),
(2, 8, 346, 1214.09, -939.551, 43.047, 0, 0, 18.7, 0),
(3, 9, 348, 377.023, -120.164, 1002.06, -85.9, 0.699999, 95.8999, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cinematic_pos_info`
--

CREATE TABLE `cinematic_pos_info` (
  `cinematic_id` int(11) NOT NULL,
  `from_x` float DEFAULT NULL,
  `from_y` float DEFAULT NULL,
  `from_z` float DEFAULT NULL,
  `to_x` float DEFAULT NULL,
  `to_y` float DEFAULT NULL,
  `to_z` float DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `interior_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cinematic_pos_info`
--

INSERT INTO `cinematic_pos_info` (`cinematic_id`, `from_x`, `from_y`, `from_z`, `to_x`, `to_y`, `to_z`, `time`, `interior_id`) VALUES
(1, 1436.16, -1705.64, 74.4144, 1434.52, -1594.31, 74.4216, 30000, 0),
(2, 1006.18, -1148.64, 31.4101, 1042.16, -1148.32, 30.8647, 30000, 0),
(3, 1448.27, -952.31, 53.1053, 1610.93, -971.256, 59.6017, 30000, 0),
(4, 2017.29, -1464.68, 34.4165, 1987.32, -1425.34, 34.5056, 30000, 0),
(5, 1472.02, -1697.66, 14.0469, 1475.98, -1697.62, 14.0469, 30000, 0),
(6, 472.89, -1294.97, 15.3078, 460.594, -1304.61, 15.1766, 30000, 0),
(7, 725.717, -1548.23, 7.2588, 725.125, -1659.45, 6.6622, 30000, 0),
(8, 1227.96, -941.859, 42.5752, 1226.95, -932.713, 42.5632, 30000, 0),
(9, 379.898, -122.659, 1002.32, 374.166, -122.662, 1002.31, 30000, 5),
(10, 1597.15, -1685.83, 5.8906, 1589.74, -1685.92, 5.8906, 30000, 0),
(25, 1812.86, -2248.39, 70.7911, 1659.39, -2343.34, 66.389, 30000, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cinematic_text_info`
--

CREATE TABLE `cinematic_text_info` (
  `cinematic_id` int(11) NOT NULL,
  `text` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cinematic_text_info`
--

INSERT INTO `cinematic_text_info` (`cinematic_id`, `text`) VALUES
(1, 'Welcome to ~b~Los Santos Roleplay Cops and Robbers~w~,~n~This tutorial will cover up the main aspects of the server.'),
(2, 'If you want to skip the tutorial, press ~b~ENTER~w~. If you have~n~read the textdraw, press ~b~LMB~w~ to continue. If you have~n~further questions about the server after watching the~n~tutorial, make sure to use ~y~/ask~w~.'),
(3, '~r~THIS IS NOT A DEATHMATCH SERVER!~w~~n~When logged in, you will encounter a dialog which will~n~contain the cities in which you\'re able to play (basically~n~all cities in ~b~San Andreas~w~).~n~ '),
(4, 'When you\'ve chosen one, you will encounter the spawn~n~menu. This menu contains all classes available in the~n~server, such as ~b~Male/Female~w~, ~b~Police~w~, ~b~Pagati~w~ etc.'),
(5, '~b~Male/Female~w~ is a civilian class. They\'re just normal~n~players that do normal/criminal activities.'),
(6, 'When spawned as one, you will encounter a dialog with a~n~set of skills you\'re able to choose from. Some require a~n~specific criteria, some do not.~n~'),
(7, 'When spawned, make sure to use the command~n~~y~/commands~w~. This command contains more info about the~n~class/server. You can use ~y~/commands~w~ on every class to~n~display information.'),
(8, 'The criminal side of the civilian classes commit crimes. As~n~a ~r~criminal~w~, you\'re able to rob businesses located around~n~~b~San Andreas~w~ and more. Businesses are indicicated with icons~n~on the map and can be entered by pressing ~b~F~w~.'),
(9, 'To rob a ~b~business~w~, aim at the ~b~shopkeeper~w~ until the~n~robbery is complete. ~g~Robbery progress~w~ can be seen under~n~in your screen (the animated bar). For more information,~n~use the command ~y~/tutorial > Robbing~w~.'),
(10, 'As a ~b~police officer~w~, your job is to enforce law and order in~n~~b~San Andreas~w~.'),
(25, 'We have come to the end of the server tutorial (concept).~n~We hope that this tutorial has given you enough information~n~to be able to play on this server. Have fun and don\'t hesitate~n~to use ~y~/ask~w~ for server questions!');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `cinematic_bot_info`
--
ALTER TABLE `cinematic_bot_info`
  ADD PRIMARY KEY (`bot_id`),
  ADD KEY `cinematic_id` (`cinematic_id`);

--
-- Indexen voor tabel `cinematic_car_info`
--
ALTER TABLE `cinematic_car_info`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `cinematic_car_info_ibfk_1` (`cinematic_id`);

--
-- Indexen voor tabel `cinematic_lookat_info`
--
ALTER TABLE `cinematic_lookat_info`
  ADD PRIMARY KEY (`cinematic_id`),
  ADD KEY `fk_cinematic_text_info_cinematic_text_info_idx` (`cinematic_id`);

--
-- Indexen voor tabel `cinematic_obj_info`
--
ALTER TABLE `cinematic_obj_info`
  ADD PRIMARY KEY (`obj_id`),
  ADD KEY `cinematic_obj_info_cinematic_id_idx` (`cinematic_id`);

--
-- Indexen voor tabel `cinematic_pos_info`
--
ALTER TABLE `cinematic_pos_info`
  ADD PRIMARY KEY (`cinematic_id`),
  ADD KEY `fk_cinematic_pos_info_cinematic_text_info1_idx` (`cinematic_id`);

--
-- Indexen voor tabel `cinematic_text_info`
--
ALTER TABLE `cinematic_text_info`
  ADD PRIMARY KEY (`cinematic_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `cinematic_bot_info`
--
ALTER TABLE `cinematic_bot_info`
  MODIFY `bot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `cinematic_car_info`
--
ALTER TABLE `cinematic_car_info`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `cinematic_obj_info`
--
ALTER TABLE `cinematic_obj_info`
  MODIFY `obj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `cinematic_text_info`
--
ALTER TABLE `cinematic_text_info`
  MODIFY `cinematic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `cinematic_bot_info`
--
ALTER TABLE `cinematic_bot_info`
  ADD CONSTRAINT `fk_cinematic_bot_info_cinematic_id` FOREIGN KEY (`cinematic_id`) REFERENCES `cinematic_text_info` (`cinematic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `cinematic_car_info`
--
ALTER TABLE `cinematic_car_info`
  ADD CONSTRAINT `cinematic_car_info_ibfk_1` FOREIGN KEY (`cinematic_id`) REFERENCES `cinematic_text_info` (`cinematic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `cinematic_lookat_info`
--
ALTER TABLE `cinematic_lookat_info`
  ADD CONSTRAINT `fk_cinematic_text_info_cinematic_text_info` FOREIGN KEY (`cinematic_id`) REFERENCES `cinematic_text_info` (`cinematic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `cinematic_obj_info`
--
ALTER TABLE `cinematic_obj_info`
  ADD CONSTRAINT `fk_cinematic_obj_info_cinematic_id` FOREIGN KEY (`cinematic_id`) REFERENCES `cinematic_text_info` (`cinematic_id`);

--
-- Beperkingen voor tabel `cinematic_pos_info`
--
ALTER TABLE `cinematic_pos_info`
  ADD CONSTRAINT `fk_cinematic_pos_info_cinematic_text_info1` FOREIGN KEY (`cinematic_id`) REFERENCES `cinematic_text_info` (`cinematic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
