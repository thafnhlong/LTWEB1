SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `friendship`;
CREATE TABLE `friendship` (
  `ID` int(10) NOT NULL,
  `Target` int(10) NOT NULL,
  `CreateAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`Target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friendship` (`ID`, `Target`, `CreateAt`) VALUES
(0,	0,	'2019-12-18 05:46:55');

DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CreateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PostID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text NOT NULL,
  `UserID` int(11) NOT NULL,
  `Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Privacy` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CodeForgot` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PhoneNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Chưa cập nhật',
  `FaceBook` varchar(255) DEFAULT 'Chưa cập nhật',
  `Address` varchar(255) DEFAULT 'Chưa cập nhật',
  `Job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Chưa cập nhật',
  PRIMARY KEY (`ID`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2019-12-18 10:08:44