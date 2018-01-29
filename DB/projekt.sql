-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 06 nov 2016 kl 21:03
-- Serverversion: 5.6.17
-- PHP-version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `projekt`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8 NOT NULL,
  `filename` varchar(20) NOT NULL,
  `filepath` varchar(40) NOT NULL,
  `filesize` int(11) NOT NULL,
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumpning av Data i tabell `files`
--

INSERT INTO `files` (`file_id`, `username`, `filename`, `filepath`, `filesize`, `upload_time`, `folder_id`) VALUES
(10, 'Tivor', 'folder.jpg', 'C:/uploads/Tivor/Unsorted/', 220374, '2016-10-21 16:29:46', 0),
(11, 'Tivor', 'Dump20161019.sql', 'C:/uploads/Tivor/Unsorted/', 2732, '2016-10-21 16:29:52', 0),
(12, 'Tivor', 'evaluation.rtf', 'C:/uploads/Tivor/Unsorted/', 15331, '2016-10-21 16:30:02', 0),
(13, 'Tivor', 'READ_ME.txt', 'C:/uploads/Tivor/Unsorted/', 2641, '2016-10-21 16:30:05', 0),
(14, 'Tivor', 'Lab5.odt', 'C:/uploads/Tivor/Hej Hannah/', 100938, '2016-10-21 16:33:42', 6),
(15, 'Tivor', 'Lab2.odt', 'C:/uploads/Tivor/Hej Hannah/', 18196, '2016-10-21 16:39:04', 6),
(23, 'test', 'folder.png', 'C:/uploads/test/', 2070, '2016-10-23 14:49:42', 0),
(24, 'test', 'folder.jpg', 'C:/uploads/test/', 220374, '2016-10-23 14:49:48', 0),
(25, 'test', 'READ_ME.txt', 'C:/uploads/test/', 2641, '2016-10-23 14:49:58', 0),
(28, 'svensson', 'delete.png', 'C:/uploads/svensson/unsorted/', 3917, '2016-10-26 11:56:47', 0),
(29, 'svensson', 'folder.png', 'C:/uploads/svensson/Unsorted/', 2070, '2016-10-26 11:56:53', 0),
(33, 'Tivor', 'folder.png', 'C:/uploads/Tivor/Hej/', 2070, '2016-10-26 13:22:19', 0);

-- --------------------------------------------------------

--
-- Tabellstruktur `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(20) NOT NULL,
  `owner` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`folder_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumpning av Data i tabell `folders`
--

INSERT INTO `folders` (`folder_id`, `folder_name`, `owner`) VALUES
(6, 'Hej Hannah', 'Tivor'),
(8, 'rolf', 'svensson'),
(22, 'test', 'Tivor');

-- --------------------------------------------------------

--
-- Tabellstruktur `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumpning av Data i tabell `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `create_time`) VALUES
(26, 'Tivor', 'mail@mail.se', '7f7916ead4bfd2d18235f7c636e69465', '2016-10-26 23:07:44'),
(27, 'test', NULL, '123', '2016-10-23 14:03:13'),
(29, 'asdasd', 'mail@tivor.se', '1ff76c4d9824627effc6ad083a26b14f', '2016-10-25 10:56:40'),
(30, 'rolflol', 'mail@rolf.se', '1ff76c4d9824627effc6ad083a26b14f', '2016-10-26 11:49:22'),
(31, 'svensson', 'mail@svensson.se', '1ff76c4d9824627effc6ad083a26b14f', '2016-10-26 11:52:55'),
(32, 'lol', 'lol@lol.lol', '7f7916ead4bfd2d18235f7c636e69465', '2016-10-26 23:07:44'),
(33, 'dasslock', 'asd@asd.asd', '797ee913722c1f479406daac4cde2276', '2016-10-27 12:10:32');

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Restriktioner för tabell `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `folders_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
