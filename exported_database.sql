-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 01:50 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mta_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(30) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `registerdate` datetime DEFAULT current_timestamp(),
  `ip` mediumtext DEFAULT NULL,
  `admin` float NOT NULL DEFAULT 0,
  `supporter` float NOT NULL DEFAULT 0,
  `vct` float NOT NULL DEFAULT 0,
  `mapper` float NOT NULL DEFAULT 0,
  `scripter` float NOT NULL DEFAULT 0,
  `fmt` float NOT NULL DEFAULT 0,
  `credits` int(11) NOT NULL DEFAULT 0,
  `referrer` int(11) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forumid` int(11) DEFAULT NULL,
  `require_password_change` tinyint(1) NOT NULL DEFAULT 0,
  `ucp_lastlogin` datetime(6) DEFAULT NULL,
  `punishpoints` int(11) NOT NULL DEFAULT 0,
  `punishdate` datetime DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `account_id` int(11) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `warn_style` int(1) NOT NULL DEFAULT 1,
  `hiddenadmin` tinyint(3) UNSIGNED DEFAULT 0,
  `adminjail` tinyint(3) UNSIGNED DEFAULT 0,
  `adminjail_time` int(11) DEFAULT NULL,
  `adminjail_by` text DEFAULT NULL,
  `adminjail_reason` text DEFAULT NULL,
  `muted` tinyint(3) UNSIGNED DEFAULT 0,
  `globalooc` tinyint(3) UNSIGNED DEFAULT 1,
  `friendsmessage` varchar(255) NOT NULL DEFAULT 'Hi!',
  `adminjail_permanent` tinyint(3) UNSIGNED DEFAULT 0,
  `adminreports` int(11) DEFAULT 0,
  `warns` tinyint(3) UNSIGNED DEFAULT 0,
  `chatbubbles` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `adminnote` text DEFAULT NULL,
  `appstate` tinyint(1) DEFAULT 0,
  `appdatetime` datetime DEFAULT NULL,
  `appreason` longtext DEFAULT NULL,
  `help` int(1) NOT NULL DEFAULT 1,
  `adblocked` int(1) NOT NULL DEFAULT 0,
  `newsblocked` int(1) DEFAULT 0,
  `mtaserial` text DEFAULT NULL,
  `d_addiction` text DEFAULT NULL,
  `loginhash` varchar(64) DEFAULT NULL,
  `transfers` int(11) DEFAULT 0,
  `monitored` varchar(255) NOT NULL DEFAULT '',
  `autopark` int(1) NOT NULL DEFAULT 1,
  `forceUpdate` smallint(1) NOT NULL DEFAULT 0,
  `anotes` text DEFAULT NULL,
  `oldAdminRank` int(11) DEFAULT 0,
  `suspensionTime` bigint(20) DEFAULT NULL,
  `car_license` int(1) NOT NULL DEFAULT 0,
  `adminreports_saved` int(3) DEFAULT 0,
  `cpa_earned` double DEFAULT 0,
  `electionsvoted` int(11) NOT NULL DEFAULT 0,
  `serial_whitelist_cap` int(2) NOT NULL DEFAULT 2,
  `max_characters` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `remember_token` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_loa`
--

CREATE TABLE `account_loa` (
  `loa_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `from` datetime NOT NULL DEFAULT current_timestamp(),
  `to` datetime NOT NULL,
  `reason` text NOT NULL,
  `effective` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_settings`
--

CREATE TABLE `account_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adminhistory`
--

CREATE TABLE `adminhistory` (
  `id` int(10) NOT NULL,
  `user` int(10) NOT NULL,
  `user_char` int(11) DEFAULT 0,
  `admin` int(10) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `action` tinyint(3) NOT NULL DEFAULT 6,
  `duration` int(10) NOT NULL DEFAULT 0,
  `reason` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_teleports`
--

CREATE TABLE `admin_teleports` (
  `id` int(11) NOT NULL,
  `location_value` text NOT NULL COMMENT '/gotoplace #v',
  `location_description` text DEFAULT NULL,
  `location_creator` int(10) NOT NULL COMMENT 'User ID',
  `posX` float(10,6) NOT NULL DEFAULT 0.000000,
  `posY` float(10,6) NOT NULL DEFAULT 0.000000,
  `posZ` float(10,6) NOT NULL DEFAULT 0.000000,
  `rot` float(10,6) NOT NULL DEFAULT 0.000000 COMMENT 'rotation',
  `int` int(6) NOT NULL DEFAULT 0 COMMENT 'interior',
  `dim` int(6) NOT NULL DEFAULT 0 COMMENT 'dimension'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='/tps manager';

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `advertisement` varchar(200) NOT NULL,
  `start` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `faction` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `apb`
--

CREATE TABLE `apb` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `applicant` int(11) NOT NULL DEFAULT 0,
  `dateposted` timestamp NOT NULL DEFAULT current_timestamp(),
  `datereviewed` datetime DEFAULT NULL,
  `reviewer` int(11) NOT NULL DEFAULT 0,
  `note` varchar(500) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `question1` varchar(500) DEFAULT NULL,
  `question2` varchar(500) DEFAULT NULL,
  `question3` varchar(500) DEFAULT NULL,
  `question4` varchar(500) DEFAULT NULL,
  `answer1` varchar(500) DEFAULT NULL,
  `answer2` varchar(500) DEFAULT NULL,
  `answer3` varchar(500) DEFAULT NULL,
  `answer4` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applications_questions`
--

CREATE TABLE `applications_questions` (
  `id` int(4) NOT NULL,
  `question` text DEFAULT NULL,
  `answer1` text DEFAULT NULL,
  `answer2` text DEFAULT NULL,
  `answer3` text DEFAULT NULL,
  `key` tinyint(1) NOT NULL DEFAULT 1,
  `createdBy` int(8) NOT NULL DEFAULT 0,
  `updatedBy` int(8) NOT NULL DEFAULT 0,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atms`
--

CREATE TABLE `atms` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `rotation` decimal(10,6) DEFAULT 0.000000,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `deposit` tinyint(3) UNSIGNED DEFAULT 0,
  `limit` int(10) UNSIGNED DEFAULT 5000
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `atms`
--

INSERT INTO `atms` (`id`, `x`, `y`, `z`, `rotation`, `dimension`, `interior`, `deposit`, `limit`) VALUES
(1, '1928.583008', '-1778.829102', '13.246875', '271.913025', 0, 0, 1, 0),
(3, '1833.233398', '-1839.770508', '13.278125', '88.213318', 0, 0, 1, 0),
(4, '1413.476563', '-1696.825195', '13.239486', '230.131393', 0, 0, 1, 0),
(5, '1367.223633', '-1276.567383', '13.246875', '96.804779', 0, 0, 1, 0),
(6, '1172.080078', '-1328.360352', '15.110348', '274.423431', 0, 0, 1, 0),
(7, '1111.920898', '-1790.497070', '16.293750', '89.531708', 0, 0, 1, 0),
(8, '-78.954102', '-1171.261719', '1.833606', '70.305328', 0, 0, 1, 0),
(9, '1836.907227', '-1687.832031', '13.028341', '89.394379', 0, 0, 1, 0),
(10, '2312.619141', '-1645.020508', '14.527047', '189.415436', 0, 0, 1, 0),
(11, '2110.308594', '-2126.810547', '13.332813', '272.357971', 0, 0, 1, 0),
(12, '2116.744141', '-1121.715820', '24.984878', '269.743195', 0, 0, 1, 0),
(13, '524.741211', '-1293.929688', '16.942188', '5.644318', 0, 0, 1, 0),
(14, '2105.454102', '-1807.956055', '13.254688', '90.624847', 0, 0, 1, 0),
(15, '599.630859', '-1244.538086', '17.965717', '18.064545', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `atm_cards`
--

CREATE TABLE `atm_cards` (
  `card_id` int(11) NOT NULL,
  `card_owner` int(11) DEFAULT NULL,
  `card_number` text DEFAULT NULL,
  `card_pin` varchar(4) NOT NULL DEFAULT '0000',
  `card_locked` tinyint(1) NOT NULL DEFAULT 0,
  `card_type` tinyint(1) NOT NULL DEFAULT 1,
  `limit_type` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `mta_serial` varchar(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `reason` mediumtext NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `until` datetime DEFAULT NULL,
  `threadid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Handle serial bans instead of using MTA built-in / Maxime';

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `book` text DEFAULT NULL,
  `readOnly` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This is used for the book system. // Chaos';

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `charactername` varchar(255) DEFAULT NULL,
  `account` int(11) DEFAULT 0,
  `x` float DEFAULT 1169.73,
  `y` float DEFAULT -1413.91,
  `z` float DEFAULT 13.48,
  `rotation` float DEFAULT 359.388,
  `interior_id` int(5) DEFAULT 0,
  `dimension_id` int(5) DEFAULT 0,
  `health` float DEFAULT 100,
  `armor` float DEFAULT 0,
  `skin` int(3) DEFAULT 264,
  `money` bigint(20) DEFAULT 500,
  `gender` int(1) DEFAULT 0,
  `cuffed` int(11) DEFAULT 0,
  `duty` int(3) DEFAULT 0,
  `fightstyle` int(2) DEFAULT 4,
  `pdjail` int(1) DEFAULT 0,
  `pdjail_time` int(11) DEFAULT 0,
  `cked` int(1) DEFAULT 0,
  `lastarea` varchar(255) DEFAULT NULL,
  `age` int(3) DEFAULT 18,
  `skincolor` int(1) DEFAULT 0,
  `weight` int(3) DEFAULT 180,
  `height` int(3) DEFAULT 180,
  `description` text DEFAULT NULL,
  `deaths` int(11) DEFAULT 0,
  `faction_leader` int(1) DEFAULT 0,
  `fingerprint` varchar(255) DEFAULT NULL,
  `casualskin` int(3) DEFAULT 0,
  `bankmoney` bigint(20) DEFAULT 1000,
  `car_license` int(1) DEFAULT 0,
  `bike_license` int(1) DEFAULT 0,
  `pilot_license` int(1) DEFAULT 0,
  `fish_license` int(1) DEFAULT 0,
  `boat_license` int(1) DEFAULT 0,
  `gun_license` int(1) DEFAULT 0,
  `gun2_license` int(1) DEFAULT 0,
  `tag` int(3) DEFAULT 1,
  `hoursplayed` int(11) DEFAULT 0,
  `pdjail_station` int(1) DEFAULT 0,
  `timeinserver` int(2) DEFAULT 0,
  `restrainedobj` int(11) DEFAULT 0,
  `restrainedby` int(11) DEFAULT 0,
  `dutyskin` int(3) DEFAULT -1,
  `fish` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `blindfold` tinyint(4) NOT NULL DEFAULT 0,
  `lang1` tinyint(2) DEFAULT 1,
  `lang1skill` tinyint(3) DEFAULT 100,
  `lang2` tinyint(2) DEFAULT 0,
  `lang2skill` tinyint(3) DEFAULT 0,
  `lang3` tinyint(2) DEFAULT 0,
  `lang3skill` tinyint(3) DEFAULT 0,
  `currlang` tinyint(1) DEFAULT 1,
  `lastlogin` datetime DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `election_candidate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `election_canvote` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `election_votedfor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `marriedto` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `photos` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxvehicles` int(4) UNSIGNED NOT NULL DEFAULT 5,
  `ck_info` varchar(500) DEFAULT NULL,
  `alcohollevel` float NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `recovery` int(1) DEFAULT 0,
  `recoverytime` bigint(20) DEFAULT NULL,
  `walkingstyle` int(3) NOT NULL DEFAULT 0,
  `job` int(3) NOT NULL DEFAULT 0,
  `day` tinyint(2) NOT NULL DEFAULT 1,
  `month` tinyint(2) NOT NULL DEFAULT 1,
  `maxinteriors` int(4) NOT NULL DEFAULT 10,
  `clothingid` int(10) UNSIGNED DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `max_clothes` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `date_of_birth` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_faction`
--

CREATE TABLE `characters_faction` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `faction_rank` int(11) NOT NULL,
  `faction_leader` int(11) NOT NULL,
  `faction_phone` int(11) DEFAULT NULL,
  `faction_perks` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_settings`
--

CREATE TABLE `character_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clothing`
--

CREATE TABLE `clothing` (
  `id` int(11) UNSIGNED NOT NULL,
  `skin` int(11) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'A set of clean clothes.',
  `price` int(11) UNSIGNED NOT NULL DEFAULT 50,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `creator_char` int(10) NOT NULL DEFAULT 0,
  `for_sale_until` datetime DEFAULT NULL,
  `distribution` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `manufactured_date` datetime DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `command` text DEFAULT NULL,
  `hotkey` text DEFAULT NULL,
  `explanation` text DEFAULT NULL,
  `permission` int(3) NOT NULL DEFAULT 0,
  `category` int(2) NOT NULL DEFAULT 1,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves all info about all kinds of supported commands and con';

-- --------------------------------------------------------

--
-- Table structure for table `dancers`
--

CREATE TABLE `dancers` (
  `id` int(10) UNSIGNED NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `skin` smallint(5) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `interior` int(10) UNSIGNED NOT NULL,
  `dimension` int(10) UNSIGNED NOT NULL,
  `offset` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dog_users`
--

CREATE TABLE `dog_users` (
  `id` int(11) NOT NULL,
  `charactername` varchar(45) NOT NULL,
  `attack` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `donators`
--

CREATE TABLE `donators` (
  `id` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `charID` int(11) NOT NULL DEFAULT -1,
  `perkID` int(4) NOT NULL,
  `perkValue` varchar(10) NOT NULL DEFAULT '1',
  `expirationDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `don_purchases`
--

CREATE TABLE `don_purchases` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `cost` int(11) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `duty_allowed`
--

CREATE TABLE `duty_allowed` (
  `id` int(11) NOT NULL,
  `faction` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `itemValue` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used for an admin allow list.';

-- --------------------------------------------------------

--
-- Table structure for table `duty_custom`
--

CREATE TABLE `duty_custom` (
  `id` int(11) NOT NULL,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `skins` text NOT NULL,
  `locations` text NOT NULL,
  `items` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used for custom duties.';

-- --------------------------------------------------------

--
-- Table structure for table `duty_locations`
--

CREATE TABLE `duty_locations` (
  `id` int(11) NOT NULL,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `dimension` int(11) DEFAULT 0,
  `interior` int(11) DEFAULT 0,
  `vehicleid` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used for custom duty locations.';

-- --------------------------------------------------------

--
-- Table structure for table `elections`
--

CREATE TABLE `elections` (
  `id` int(11) NOT NULL,
  `electionsname` varchar(45) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `elevators`
--

CREATE TABLE `elevators` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `tpx` decimal(10,6) DEFAULT 0.000000,
  `tpy` decimal(10,6) DEFAULT 0.000000,
  `tpz` decimal(10,6) DEFAULT 0.000000,
  `dimensionwithin` int(5) DEFAULT 0,
  `interiorwithin` int(5) DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `car` tinyint(3) UNSIGNED DEFAULT 0,
  `disabled` tinyint(3) UNSIGNED DEFAULT 0,
  `rot` decimal(10,6) DEFAULT 0.000000,
  `tprot` decimal(10,6) DEFAULT 0.000000,
  `oneway` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `elevators`
--

INSERT INTO `elevators` (`id`, `x`, `y`, `z`, `tpx`, `tpy`, `tpz`, `dimensionwithin`, `interiorwithin`, `dimension`, `interior`, `car`, `disabled`, `rot`, `tprot`, `oneway`) VALUES
(6, '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', 0, 0, 0, 0, 0, 0, '0.000000', '0.000000', 0),
(7, '2122.051758', '-1626.212891', '389.732819', '2124.594727', '-1626.271484', '389.732819', 8, 56, 8, 56, 0, 0, '271.462585', '89.191101', 0),
(8, '2128.383789', '-1619.040039', '389.732819', '2128.261719', '-1622.480469', '389.732819', 8, 56, 8, 56, 0, 0, '182.543365', '358.838165', 0),
(9, '2141.751953', '-1619.251953', '389.732819', '2141.707031', '-1622.442383', '389.732819', 8, 56, 8, 56, 0, 0, '182.515915', '2.035217', 0),
(10, '1588.893555', '-1632.053711', '13.382813', '1922.118164', '-2406.629883', '14.180569', 0, 0, 109, 56, 2, 0, '179.598999', '89.603149', 0);

-- --------------------------------------------------------

--
-- Table structure for table `emailaccounts`
--

CREATE TABLE `emailaccounts` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `creator` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `sender` text DEFAULT NULL,
  `receiver` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `inbox` int(1) NOT NULL DEFAULT 0,
  `outbox` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faa_registry`
--

CREATE TABLE `faa_registry` (
  `codeid` int(11) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `bankbalance` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rank_order` text DEFAULT NULL,
  `motd` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fnote` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `max_interiors` int(11) UNSIGNED NOT NULL DEFAULT 20,
  `max_vehicles` int(11) UNSIGNED NOT NULL DEFAULT 40,
  `free_custom_ints` tinyint(1) UNSIGNED DEFAULT 0,
  `free_custom_skins` tinyint(1) UNSIGNED DEFAULT 0,
  `before_tax_value` int(6) NOT NULL DEFAULT 0,
  `before_wage_charge` int(6) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`id`, `name`, `bankbalance`, `type`, `rank_order`, `motd`, `note`, `fnote`, `phone`, `max_interiors`, `max_vehicles`, `free_custom_ints`, `free_custom_skins`, `before_tax_value`, `before_wage_charge`) VALUES
(1, 'Los Santos Policijas Departaments', 1000042, 2, '1,2', 'Welcome to the faction.', '', NULL, NULL, 20, 40, 1, 1, 15000, 500),
(2, 'Los Santos GlÄbÅ¡anas Dienests', 1002070, 4, '3,4,', '', '', NULL, NULL, 20, 40, 1, 1, 0, 0),
(3, 'Los Santos ValdÄ«ba', 1228826, 3, '5,6,', 'Welcome to the faction.', '', NULL, NULL, 20, 40, 1, 1, 0, 0),
(4, 'Los Santos Auto KonfiscÄ“tuve', 1004925, 5, '7,8,', 'Welcome to the faction.', '', NULL, NULL, 20, 40, 1, 1, 0, 0),
(20, 'Los Santos ZiÅ†u Dienests', 1000000, 6, '9,10,', 'Laipni lÅ«gti frakcijÄ!', '', NULL, NULL, 20, 40, 1, 1, 0, 0),
(21, 'testnelegala', 0, 1, '12,13,', 'Laipni lÅ«gti frakcijÄ!', '', NULL, NULL, 20, 40, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faction_ranks`
--

CREATE TABLE `faction_ranks` (
  `id` int(11) NOT NULL,
  `faction_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `isDefault` int(11) NOT NULL DEFAULT 0,
  `isLeader` int(11) NOT NULL DEFAULT 0,
  `wage` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faction_ranks`
--

INSERT INTO `faction_ranks` (`id`, `faction_id`, `name`, `permissions`, `isDefault`, `isLeader`, `wage`) VALUES
(1, 1, 'PriekÅ¡nieks', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17', 0, 1, 3500),
(2, 1, 'Kadets', '', 1, 0, 0),
(3, 2, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17', 0, 1, 4000),
(4, 2, 'Default Rank', '', 1, 0, 0),
(5, 3, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17', 0, 1, 2500),
(6, 3, 'Default Rank', '', 1, 0, 0),
(7, 4, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18', 0, 1, 0),
(8, 4, 'Default Rank', '', 1, 0, 0),
(9, 5, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18', 0, 1, 0),
(10, 5, 'Default Rank', '', 1, 0, 0),
(12, 21, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18', 0, 1, 0),
(13, 21, 'Default Rank', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `file` mediumblob NOT NULL,
  `file_type` varchar(64) NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `dateline` datetime NOT NULL DEFAULT current_timestamp(),
  `connected_interior` int(11) DEFAULT NULL COMMENT 'The purpose of this field is to auto delete file record on interior delete.',
  `avatar_for_account` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store file up to 21MB per record / By Maxime / Consult with him if you''re unsure of something.';

-- --------------------------------------------------------

--
-- Table structure for table `force_apps`
--

CREATE TABLE `force_apps` (
  `id` int(11) NOT NULL,
  `account` int(11) DEFAULT NULL,
  `forceapp_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Save forceapped players information to keep them from resubm' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `friend_account_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fuelpeds`
--

CREATE TABLE `fuelpeds` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT 0,
  `dimension` int(11) NOT NULL DEFAULT 0,
  `skin` int(3) DEFAULT 50,
  `name` varchar(50) NOT NULL,
  `deletedBy` int(11) DEFAULT 0,
  `shop_link` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `id` int(11) NOT NULL,
  `objectID` int(11) NOT NULL,
  `startX` float NOT NULL,
  `startY` float NOT NULL,
  `startZ` float NOT NULL,
  `startRX` float NOT NULL,
  `startRY` float NOT NULL,
  `startRZ` float NOT NULL,
  `endX` float NOT NULL,
  `endY` float NOT NULL,
  `endZ` float NOT NULL,
  `endRX` float NOT NULL,
  `endRY` float NOT NULL,
  `endRZ` float NOT NULL,
  `gateType` tinyint(3) UNSIGNED NOT NULL,
  `autocloseTime` int(4) NOT NULL,
  `movementTime` int(4) NOT NULL,
  `objectDimension` int(11) NOT NULL,
  `objectInterior` int(11) NOT NULL,
  `gateSecurityParameters` text DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `adminNote` varchar(300) NOT NULL DEFAULT '',
  `triggerDistance` float DEFAULT NULL,
  `triggerDistanceVehicle` float DEFAULT NULL,
  `sound` varchar(50) DEFAULT 'metalgate'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `google_authenticator`
--

CREATE TABLE `google_authenticator` (
  `secret` varchar(16) NOT NULL,
  `userid` int(11) NOT NULL,
  `recovery_code` varchar(19) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Authenticator Integration By Maxime';

-- --------------------------------------------------------

--
-- Table structure for table `health_diagnose`
--

CREATE TABLE `health_diagnose` (
  `uniqueID` int(11) DEFAULT NULL,
  `int_diagnose` varchar(255) DEFAULT NULL,
  `ext_diagnose` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_data`
--

CREATE TABLE `insurance_data` (
  `policyid` int(11) NOT NULL,
  `customername` varchar(45) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `protection` varchar(45) NOT NULL,
  `deductible` int(11) NOT NULL,
  `date` date NOT NULL,
  `claims` float NOT NULL,
  `cashout` float NOT NULL,
  `premium` int(11) NOT NULL,
  `insurancefaction` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_factions`
--

CREATE TABLE `insurance_factions` (
  `factionID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gen_maxi` float NOT NULL DEFAULT 0.005,
  `news` text DEFAULT NULL,
  `subscription` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interiors`
--

CREATE TABLE `interiors` (
  `id` int(11) NOT NULL,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `type` int(1) DEFAULT 0,
  `owner` int(11) DEFAULT -1,
  `locked` int(1) DEFAULT 0,
  `cost` int(11) DEFAULT 0,
  `name` text DEFAULT NULL,
  `interior` int(5) DEFAULT 0,
  `interiorx` float DEFAULT 0,
  `interiory` float DEFAULT 0,
  `interiorz` float DEFAULT 0,
  `dimensionwithin` int(5) DEFAULT 0,
  `interiorwithin` int(5) DEFAULT 0,
  `angle` float DEFAULT 0,
  `angleexit` float DEFAULT 0,
  `supplies` text DEFAULT NULL,
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `disabled` tinyint(3) UNSIGNED DEFAULT 0,
  `lastused` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` varchar(45) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  `creator` varchar(45) DEFAULT NULL,
  `isLightOn` tinyint(4) NOT NULL DEFAULT 0,
  `keypad_lock` int(11) DEFAULT NULL,
  `keypad_lock_pw` varchar(32) DEFAULT NULL,
  `keypad_lock_auto` tinyint(1) DEFAULT NULL,
  `faction` int(11) DEFAULT 0,
  `protected_until` datetime DEFAULT NULL,
  `furniture` int(1) NOT NULL DEFAULT 1,
  `interior_id` int(11) DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interiors`
--

INSERT INTO `interiors` (`id`, `x`, `y`, `z`, `type`, `owner`, `locked`, `cost`, `name`, `interior`, `interiorx`, `interiory`, `interiorz`, `dimensionwithin`, `interiorwithin`, `angle`, `angleexit`, `supplies`, `safepositionX`, `safepositionY`, `safepositionZ`, `safepositionRZ`, `disabled`, `lastused`, `deleted`, `deletedDate`, `createdDate`, `creator`, `isLightOn`, `keypad_lock`, `keypad_lock_pw`, `keypad_lock_auto`, `faction`, `protected_until`, `furniture`, `interior_id`, `tokenUsed`, `settings`, `address`) VALUES
(20, 2233.29, -1159.7, 25.8906, 2, 0, 0, 0, 'Jefferson HoteÄ¼i', 1, 2266.32, 1647.59, 1084.23, 0, 0, 270, 265.431, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-12-03 13:44:49', '0', NULL, '2021-11-26 17:16:13', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 64, 0, NULL, NULL),
(2, 1480.89, -1772.01, 18.7958, 2, -1, 0, 0, 'Los Santos Dome', 3, 390.44, 173.91, 1008.38, 0, 0, 90, 179.16, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-12-02 12:28:46', '0', NULL, '2021-11-22 15:37:13', 'LoneWolf', 0, NULL, NULL, NULL, 3, NULL, 1, 12, 0, NULL, NULL),
(1, 1555.5, -1675.64, 16.1953, 2, -1, 0, 0, 'Los Santos Policijas Departaments', 10, 246.457, 107.3, 1003.22, 0, 0, 0, 179.484, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-27 18:35:26', '0', NULL, '2021-11-22 15:55:17', 'LoneWolf', 0, NULL, NULL, NULL, 1, NULL, 1, 138, 0, NULL, NULL),
(8, 597.228, -1249.5, 18.3012, 2, 0, 0, 0, 'Los Santos Banka', 56, 2132.87, -1638.89, 389.733, 0, 0, 0, 199.424, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-12-02 19:07:28', '0', NULL, '2021-11-22 15:57:48', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 155, 0, NULL, NULL),
(4, 1111.92, -1797.05, 16.5938, 2, 0, 0, 0, 'CeÄ¼u Satiksmes DroÅ¡Ä«bas Direkcija', 5, 1104.17, -778.245, 976.252, 0, 0, 0, 267.046, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:22:40', '0', NULL, '2021-11-22 16:04:38', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 143, 0, NULL, NULL),
(6, 1172.08, -1323.44, 15.4032, 2, -1, 0, 0, 'Los Santos GlÄbÅ¡anas Dienests', 3, 288.557, 167.115, 1007.17, 0, 0, 0, 183.746, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-27 18:02:16', '0', NULL, '2021-11-22 16:08:03', 'LoneWolf', 0, NULL, NULL, NULL, 2, NULL, 1, 102, 0, NULL, NULL),
(3, 1797.86, -1578.88, 14.0905, 2, 0, 0, 0, 'Los Santos FederÄlais cietums', 5, 772.43, -5.19, 1000.72, 0, 0, 0, 102.798, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-22 18:27:06', 'solidshock', '2021-11-24 09:22:33', '2021-11-22 16:51:09', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 3, 0, NULL, NULL),
(5, 607.102, -1459.6, 14.3971, 2, 0, 0, 0, 'Los Santos Dupont ApÄ£Ä“rbu Veikals', 3, 207.01, -139.91, 1003.5, 0, 0, 0, 89.9107, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-25 19:50:35', '0', NULL, '2021-11-22 16:55:34', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 13, 0, NULL, NULL),
(7, 841.096, -1596.58, 13.5469, 2, 0, 0, 0, 'Los Santos BibliotÄ“ka', 22, 1910.78, -2395.6, 13.56, 0, 0, 0, 46.8272, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-12-03 14:31:15', '0', NULL, '2021-11-22 16:57:30', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 120, 0, NULL, NULL),
(9, 1928.58, -1776.39, 13.5469, 2, 0, 0, 0, 'Idlewood BenzÄ«ntanks', 16, -25.68, -140.99, 1003.54, 0, 0, 0, 92.976, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-12-03 12:30:12', '0', NULL, '2021-11-22 20:26:27', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 45, 0, NULL, NULL),
(19, 1679.91, -1826.72, 13.5469, 2, 0, 0, 0, 'ElektropreÄu veikals', 27, 1877.89, -2466.96, 13.58, 0, 0, 0, 88.521, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 14:04:49', '0', NULL, '2021-11-26 14:00:37', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 125, 0, NULL, NULL),
(10, 2105.49, -1806.62, 13.5547, 1, -1, 1, 100000, 'Idlewood Pizza Stack', 5, 372.18, -133.28, 1001.49, 0, 0, 0, 87.3509, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 12:59:30', '0', NULL, '2021-11-26 12:58:48', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 18, 0, NULL, NULL),
(11, 1837.02, -1682.42, 13.3238, 1, -1, 1, 150000, 'Alhambra', 17, 493.34, -24.48, 1000.67, 0, 0, 0, 87.4333, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:58:39', '0', NULL, '2021-11-26 13:33:18', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 42, 0, NULL, NULL),
(12, 1833.78, -1842.66, 13.5781, 1, -1, 1, 50000, 'Idlewood 24-7 Veikals', 16, -25.68, -140.99, 1003.54, 0, 0, 268.776, 90.1854, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:38:08', '0', NULL, '2021-11-26 13:37:13', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 45, 0, NULL, NULL),
(13, 2310.08, -1643.53, 14.827, 1, -1, 1, 65000, 'Ten Green Bottles', 11, 501.84, -67.84, 998.75, 0, 0, 180, 315.914, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:40:45', '0', NULL, '2021-11-26 13:40:36', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 2, 0, NULL, NULL),
(14, 1310.2, -1366.8, 13.5065, 1, -1, 1, 75000, 'Pasadena Kazino', 10, 2019.02, 1017.93, 996.87, 0, 0, 90, 0.453186, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:47:49', '0', NULL, '2021-11-26 13:47:29', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 29, 0, NULL, NULL),
(15, 1000.6, -919.945, 42.3281, 1, -1, 1, 60000, 'Vinewood BenzÄ«ntanks', 16, -25.68, -140.99, 1003.54, 0, 0, 0, 282.141, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:49:33', '0', NULL, '2021-11-26 13:49:27', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 45, 0, NULL, NULL),
(16, 810.486, -1616.18, 13.5469, 1, -1, 1, 85000, 'McDonald', 10, 362.88, -75.11, 1001.5, 0, 0, 315, 88.076, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:52:50', '0', NULL, '2021-11-26 13:52:08', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 31, 0, NULL, NULL),
(17, 1199.15, -918.156, 43.1238, 1, -1, 1, 85000, 'Burger MaÄ·Ä«ts', 10, 362.88, -75.11, 1001.5, 0, 0, 315, 6.5397, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:53:54', '0', NULL, '2021-11-26 13:53:44', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 31, 0, NULL, NULL),
(18, 2421.57, -1219.24, 25.5615, 1, -1, 1, 125000, 'Pig Pen StriptÄ«zklubs', 2, 1204.81, -13.6, 1000.92, 0, 0, 0, 356.487, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 13:58:03', '0', NULL, '2021-11-26 13:57:30', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 28, 0, NULL, NULL),
(21, 2142.64, -1604.75, 14.3516, 0, -1, 1, 30000, 'Grove Street MÄja 1', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 344.567, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:17:16', '0', NULL, '2021-11-26 17:17:04', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(22, 2150.24, -1584.09, 14.336, 0, -1, 1, 30000, 'Grove Street MÄja 1', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 328.669, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:17:28', 'MartinRPierce', '2021-11-26 17:17:36', '2021-11-26 17:17:28', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(23, 2150.25, -1584.27, 14.336, 0, -1, 1, 30000, 'Grove Street MÄja 2', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 343.073, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:17:39', '0', NULL, '2021-11-26 17:17:39', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(24, 2179.13, -1599.99, 14.346, 0, -1, 1, 30000, 'Grove Street MÄja 3', 5, 318.55, 1114.47, 1083.88, 0, 0, 249.676, 240.623, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:17:52', '0', '2021-11-26 17:20:27', '2021-11-26 17:17:52', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(27, 2282.4, -1641.97, 15.6279, 0, -1, 1, 30000, 'Grove Street MÄja 6', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 0.332336, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:22:37', '0', NULL, '2021-11-26 17:22:37', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(26, 2244.41, -1637.8, 15.9074, 0, -1, 1, 30000, 'Grove Street MÄja 4', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 342.941, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:21:57', '0', NULL, '2021-11-26 17:20:19', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(25, 2257.27, -1644.07, 15.8082, 0, -1, 1, 30000, 'Grove Street MÄja 5', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 355.96, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:21:34', '0', NULL, '2021-11-26 17:21:01', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(28, 2362.91, -1643.38, 14.2968, 0, -1, 1, 30000, 'Grove Street MÄja 7', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 352.092, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:22:50', '0', NULL, '2021-11-26 17:22:50', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(29, 2393.08, -1646.04, 13.9051, 0, -1, 1, 30000, 'Grove Street MÄja 8', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 354.867, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:23:11', '0', NULL, '2021-11-26 17:22:58', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(30, 2413.99, -1646.79, 14.0119, 0, -1, 1, 30000, 'Grove Street MÄja 9', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 354.196, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:23:20', '0', NULL, '2021-11-26 17:23:20', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(31, 2451.96, -1641.5, 14.0662, 0, -1, 1, 30000, 'Grove Street MÄja 10', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 1.77158, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:23:32', '0', NULL, '2021-11-26 17:23:32', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(32, 2469.36, -1646.52, 13.7801, 0, -1, 1, 30000, 'Grove Street MÄja 11', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 349.291, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:23:43', '0', NULL, '2021-11-26 17:23:43', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(33, 2266.05, 1642.26, 1084.23, 3, -1, 1, 400, 'Motelis 1', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 90.2074, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:55', '0', NULL, '2021-11-26 17:23:49', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(34, 2266.05, 1633.54, 1084.23, 3, -1, 1, 400, 'Motelis 2', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 92.8276, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:03', '0', NULL, '2021-11-26 17:24:03', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(35, 2271.34, 1633.59, 1084.23, 3, -1, 1, 400, 'Motelis 3', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 271.518, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:08', '0', NULL, '2021-11-26 17:24:08', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(36, 2271.33, 1642.25, 1084.23, 3, -1, 1, 400, 'Motelis 4', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 271.518, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:13', '0', NULL, '2021-11-26 17:24:13', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(37, 2271.34, 1652.7, 1084.23, 3, -1, 1, 400, 'Motelis 5', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 270.803, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:18', '0', NULL, '2021-11-26 17:24:18', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(38, 2271.34, 1662.6, 1084.23, 3, -1, 1, 400, 'Motelis 6', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 270.803, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:24', '0', NULL, '2021-11-26 17:24:24', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(39, 2266.04, 1662.62, 1084.23, 3, -1, 1, 400, 'Motelis 7', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 93.0748, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:28', '0', NULL, '2021-11-26 17:24:28', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(40, 2266.05, 1652.72, 1084.23, 3, -1, 1, 400, 'Motelis 8', 5, 2233.57, -1115.08, 1050.88, 20, 1, 0, 94.8656, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:24:35', '0', NULL, '2021-11-26 17:24:35', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 71, 0, NULL, NULL),
(41, 2486.49, -1644.77, 14.0703, 0, -1, 1, 35000, 'Grove Street MÄja 12', 5, 226.56, 1114.19, 1080.99, 0, 0, 270, 11.588, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:25:53', '0', NULL, '2021-11-26 17:25:24', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 78, 0, NULL, NULL),
(42, 2498.43, -1642.5, 13.7826, 0, -1, 1, 30000, 'Grove Street MÄja 13', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 351.159, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:26:21', '0', NULL, '2021-11-26 17:26:21', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(43, 2513.53, -1650.31, 14.3557, 0, -1, 1, 30000, 'Grove Street MÄja 14', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 311.256, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:26:29', '0', NULL, '2021-11-26 17:26:29', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(44, 2524.33, -1658.7, 15.4935, 0, -1, 1, 30000, 'Grove Street MÄja 15', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 266.87, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:26:38', '0', NULL, '2021-11-26 17:26:38', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(45, 2523.26, -1679.38, 15.497, 0, -1, 1, 32500, 'Grove Street MÄja 16', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 263.909, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:27:20', '0', NULL, '2021-11-26 17:27:20', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(46, 2514, -1691.71, 14.046, 0, -1, 1, 32500, 'Grove Street MÄja 17', 4, 299.781, 311.1, 1003.3, 0, 0, 270, 217.288, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:27:29', '0', NULL, '2021-11-26 17:27:29', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 140, 0, NULL, NULL),
(47, 2495.36, -1690.92, 14.7656, 0, -1, 1, 40000, 'Grove Street MÄja 18', 3, 2496.03, -1692.17, 1014.74, 0, 0, 180, 192.667, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-28 15:51:03', '0', NULL, '2021-11-26 17:30:05', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 86, 0, NULL, NULL),
(48, 2437.97, -2020.85, 13.9025, 0, -1, 1, 35000, 'Willowfield Maja 1', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 175.814, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:31:27', '0', NULL, '2021-11-26 17:30:10', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 0, 110, 0, NULL, NULL),
(49, 2459.3, -1691.21, 13.5478, 0, -1, 1, 35000, 'Grove Street MÄja 19', 5, 22.98, 1403.6, 1084.42, 0, 0, 0, 174.611, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:31:38', '0', NULL, '2021-11-26 17:31:38', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 94, 0, NULL, NULL),
(50, 2459.3, -1691.21, 13.5478, 0, -1, 1, 35000, 'Grove Street MÄja 19', 5, 22.98, 1403.6, 1084.42, 0, 0, 0, 174.611, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:46', '0', NULL, '2021-11-26 17:31:49', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 94, 0, NULL, NULL),
(51, 2465.43, -2020.79, 14.1242, 0, -1, 1, 35000, 'Willowfield Maja 2', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 177.517, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:31:54', '0', NULL, '2021-11-26 17:31:54', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(52, 2486.51, -2021.55, 13.9988, 0, -1, 1, 35000, 'Willowfield Maja 3', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 179.308, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:01', '0', NULL, '2021-11-26 17:32:01', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(53, 2507.84, -2021.05, 14.2101, 0, -1, 1, 35000, 'Willowfield Maja 4', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 181.456, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:09', '0', NULL, '2021-11-26 17:32:09', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(54, 2522.8, -2018.95, 14.0744, 0, -1, 1, 35000, 'Willowfield Maja 5', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 228.725, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:15', '0', NULL, '2021-11-26 17:32:15', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(55, 2524.33, -1998.29, 14.1131, 0, -1, 1, 35000, 'Willowfield Maja 6', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 315.744, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:23', '0', NULL, '2021-11-26 17:32:23', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(56, 2508.3, -1998.37, 13.9025, 0, -1, 1, 35000, 'Willowfield Maja 7', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 1.22226, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:30', '0', NULL, '2021-11-26 17:32:30', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(57, 2483.41, -1995.34, 13.8343, 0, -1, 1, 35000, 'Willowfield Maja 8', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 6.23758, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:38', '0', NULL, '2021-11-26 17:32:38', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(58, 2465.19, -1995.75, 14.0193, 0, -1, 1, 35000, 'Willowfield Maja 9', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 3.72717, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:32:48', '0', NULL, '2021-11-26 17:32:48', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(59, 2409.07, -1674.59, 14.2483, 0, -1, 1, 30000, 'Grove Street MÄja 20', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 181.439, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:34:34', '0', NULL, '2021-11-26 17:34:34', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(60, 2384.63, -1675.83, 15.2457, 0, -1, 1, 30000, 'Grove Street MÄja 21', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 170.986, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:34:44', '0', NULL, '2021-11-26 17:34:44', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(61, 2368.32, -1675.34, 14.1682, 0, -1, 1, 30000, 'Grove Street MÄja 22', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 175.144, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:34:53', '0', NULL, '2021-11-26 17:34:53', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(62, 2307.04, -1679.2, 14.3316, 0, -1, 1, 30000, 'Grove Street MÄja 23', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 174.183, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:35:09', '0', NULL, '2021-11-26 17:35:09', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(63, 1802, -2098.94, 14.021, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 1', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 358.201, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:40:26', '0', NULL, '2021-11-26 17:35:17', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(64, 1781.39, -2101.27, 14.0566, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 2', 6, 2308.8, -1212.94, 1049.02, 0, 0, 0, 359.162, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:46:03', '0', NULL, '2021-11-26 17:36:27', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 0, 108, 0, NULL, NULL),
(65, 2327.21, -1681.67, 14.9297, 0, -1, 1, 32500, 'Keneddy Ave MÄja 1', 8, -42.65, 1405.46, 1084.42, 0, 0, 0, 96.4037, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:36:58', '0', NULL, '2021-11-26 17:36:44', 'MartinRPierce', 0, NULL, NULL, NULL, 0, NULL, 1, 67, 0, NULL, NULL),
(66, 1762.5, -2101.98, 13.857, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 3', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 1.33762, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:44:02', '0', NULL, '2021-11-26 17:39:59', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 0, 110, 0, NULL, NULL),
(67, 1734.12, -2097.98, 14.0366, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 4', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 3.12842, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:41:11', '0', NULL, '2021-11-26 17:41:11', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(68, 1711.71, -2101.24, 14.021, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 5', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 2.41431, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:41:20', '0', NULL, '2021-11-26 17:41:20', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(69, 1684.89, -2098.16, 13.8343, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 6', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 2.77136, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:41:37', '0', NULL, '2021-11-26 17:41:37', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(70, 1667.49, -2106.94, 14.0723, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 7', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 3.84253, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:41:46', '0', NULL, '2021-11-26 17:41:46', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(71, 1673.73, -2122.52, 14.146, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 8', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 137.526, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:41:54', '0', NULL, '2021-11-26 17:41:54', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(72, 1695.56, -2125.84, 13.8101, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 9', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 184.439, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:42:02', '0', NULL, '2021-11-26 17:42:02', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(73, 1715.15, -2125.45, 14.0566, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 10', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 183.362, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:42:09', '0', NULL, '2021-11-26 17:42:09', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(74, 1734.7, -2130.36, 14.021, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 11', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 180.857, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:42:16', '0', NULL, '2021-11-26 17:42:16', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(75, 1761.3, -2125.45, 14.0566, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 12', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 181.571, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:42:24', '0', NULL, '2021-11-26 17:42:24', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(76, 1782.12, -2126.51, 14.0679, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 13', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 181.928, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:42:31', '0', NULL, '2021-11-26 17:42:31', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(77, 1804.28, -2124.9, 13.9424, 0, -1, 1, 35000, 'Verdant Bluffs MÄja 14', 5, 318.55, 1114.47, 1083.88, 0, 0, 0, 182.648, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:42:38', '0', NULL, '2021-11-26 17:42:38', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 110, 0, NULL, NULL),
(78, 2067.05, -1731.61, 14.2066, 0, -1, 1, 50000, 'Idlewood mÄja 1', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 92.3607, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:48:21', '0', NULL, '2021-11-26 17:48:04', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(79, 2066.24, -1717.13, 14.1363, 0, -1, 1, 50000, 'Idlewood mÄja 2', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 89.8503, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:48:29', '0', NULL, '2021-11-26 17:48:29', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(80, 2065.1, -1703.67, 14.1484, 0, -1, 1, 60000, 'Idlewood mÄja 3', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 92.7178, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:48:54', '0', NULL, '2021-11-26 17:48:41', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(81, 2066.74, -1656.59, 14.1328, 0, -1, 1, 50000, 'Idlewood mÄja 4', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 90.5699, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:49:07', '0', NULL, '2021-11-26 17:49:07', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(82, 2067.56, -1643.83, 14.1363, 0, -1, 1, 50000, 'Idlewood mÄja 5', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 89.7404, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:49:14', '0', NULL, '2021-11-26 17:49:14', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(83, 2067.7, -1628.9, 14.2066, 0, -1, 1, 50000, 'Idlewood mÄja 6', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 96.1895, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:49:20', '0', NULL, '2021-11-26 17:49:20', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(84, 2018.06, -1629.84, 14.0426, 0, -1, 1, 50000, 'Idlewood mÄja 7', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 274.05, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:51:02', '0', NULL, '2021-11-26 17:51:02', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(85, 2016.54, -1641.72, 14.1129, 0, -1, 1, 50000, 'Idlewood mÄja 8', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 274.05, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:51:09', '0', NULL, '2021-11-26 17:51:09', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(86, 2013.58, -1656.47, 14.1363, 0, -1, 1, 50000, 'Idlewood mÄja 9', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 270.111, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:51:16', '0', NULL, '2021-11-26 17:51:16', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(87, 2018.24, -1703.2, 14.2344, 0, -1, 1, 60000, 'Idlewood mÄja 10', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 272.616, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:51:41', '0', NULL, '2021-11-26 17:51:29', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(88, 2016.2, -1716.99, 14.125, 0, -1, 1, 50000, 'Idlewood mÄja 11', 1, 223.22, 1287.17, 1082.14, 0, 0, 274.05, 272.616, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:52:18', '0', NULL, '2021-11-26 17:52:18', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(89, 2015.35, -1732.54, 14.2344, 0, -1, 1, 60000, 'Idlewood mÄja 12', 1, 223.22, 1287.17, 1082.14, 0, 0, 0, 271.188, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:53:20', '0', NULL, '2021-11-26 17:52:36', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 77, 0, NULL, NULL),
(90, 1980.38, -1718.96, 17.0304, 0, -1, 1, 100000, 'Idlewood mÄja 13', 4, -260.78, 1456.73, 1084.36, 0, 0, 90, 87.7299, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:54:59', '0', NULL, '2021-11-26 17:54:37', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 93, 0, NULL, NULL),
(91, 1981, -1682.88, 17.0538, 0, -1, 1, 100000, 'Idlewood mÄja 14', 4, -260.78, 1456.73, 1084.36, 0, 0, 90, 88.9384, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 17:55:34', '0', NULL, '2021-11-26 17:55:34', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 93, 0, NULL, NULL),
(92, 2244.32, -1665.54, 15.4766, 2, 0, 0, 0, 'Grove Street Binco', 15, 207.58, -111, 1005.13, 0, 0, 0, 160.312, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:00:57', '0', NULL, '2021-11-26 17:59:15', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 48, 0, NULL, NULL),
(93, 1421.9, -886.231, 50.6864, 0, -1, 1, 75000, 'Vinewood MÄja 1', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 180.84, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:11:37', '0', NULL, '2021-11-26 18:11:18', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(94, 1468.61, -906.183, 54.8359, 0, -1, 1, 75000, 'Vinewood MÄja 2', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 179.429, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:13:07', '0', NULL, '2021-11-26 18:13:00', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(95, 1540.47, -851.421, 64.3361, 0, -1, 1, 140000, 'Vinewood mÄja 3', 12, 2324.42, -1149.2, 1050.71, 0, 0, 0, 260.141, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:15:15', '0', NULL, '2021-11-26 18:14:44', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 96, 0, NULL, NULL),
(96, 1496.97, -687.893, 95.5633, 0, -1, 1, 700000, 'Vinewood Villa 1', 5, 140.39, 1366.36, 1083.85, 0, 0, 0, 356.828, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-28 15:49:35', '0', NULL, '2021-11-26 18:16:49', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 95, 0, NULL, NULL),
(97, 1535.04, -800.095, 72.8495, 0, -1, 1, 75000, 'Vinewood MÄja 4', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 267.93, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:19:03', '0', NULL, '2021-11-26 18:18:57', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(98, 1527.83, -772.589, 80.5781, 0, -1, 1, 75000, 'Vinewood MÄja 5', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 313.519, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:19:12', '0', NULL, '2021-11-26 18:19:12', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(99, 1442.51, -628.831, 95.7186, 0, -1, 1, 150000, 'Vinewood MÄja 6', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 0.431213, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:20:29', '0', NULL, '2021-11-26 18:20:04', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(100, 1332.28, -633.447, 109.135, 0, -1, 1, 200000, 'Vinewood MÄja 7', 10, 24, 1340.33, 1084.37, 0, 0, 0, 197.199, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:37:58', '0', NULL, '2021-11-26 18:35:22', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 97, 0, NULL, NULL),
(101, 1094.91, -647.915, 113.648, 0, -1, 1, 1000000, 'Vinewood Villa 2', 5, 140.39, 1366.36, 1083.85, 0, 0, 0, 180.643, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:39:22', '0', NULL, '2021-11-26 18:38:22', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 95, 0, NULL, NULL),
(102, 1045.19, -642.935, 120.117, 0, -1, 1, 700000, 'Vinewood Villa 3', 5, 140.39, 1366.36, 1083.85, 0, 0, 0, 190.668, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:40:13', '0', NULL, '2021-11-26 18:40:13', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 95, 0, NULL, NULL),
(103, 980.439, -677.287, 121.976, 0, -1, 1, 700000, 'Vinewood Villa 4', 5, 140.39, 1366.36, 1083.85, 0, 0, 0, 214.305, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:40:28', '0', NULL, '2021-11-26 18:40:28', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 95, 0, NULL, NULL),
(104, 897.89, -677.163, 116.89, 0, -1, 1, 75000, 'Vinewood MÄja 8', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 57.4841, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:42:01', '0', NULL, '2021-11-26 18:41:52', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(105, 946.414, -710.644, 122.62, 0, -1, 1, 75000, 'Vinewood MÄja 9', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 210.389, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:42:18', '0', NULL, '2021-11-26 18:42:18', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(106, 867.442, -717.556, 105.68, 0, -1, 1, 75000, 'Vinewood MÄja 10', 2, 2237.52, -1081.64, 1049.02, 0, 0, 0, 155.962, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:42:30', '0', NULL, '2021-11-26 18:42:30', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 88, 0, NULL, NULL),
(107, 891.199, -783.152, 101.314, 0, -1, 1, 700000, 'Vinewood Villa 5', 5, 140.39, 1366.36, 1083.85, 0, 0, 0, 204.302, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:42:42', '0', NULL, '2021-11-26 18:42:42', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 95, 0, NULL, NULL),
(108, 835.942, -894.845, 68.7689, 0, -1, 1, 700000, 'Vinewood Villa 6', 5, 140.39, 1366.36, 1083.85, 0, 0, 0, 148.106, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-11-26 18:43:43', '0', NULL, '2021-11-26 18:43:43', 'LoneWolf', 0, NULL, NULL, NULL, 0, NULL, 1, 95, 0, NULL, NULL),
(109, 1583.63, -1637.5, 13.3905, 2, -1, 0, 0, 'Los Santos Policijas Departamenta GarÄÅ¾a', 56, 1914.86, -2386.42, 13.5669, 0, 0, 270, 181.961, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2021-12-07 15:21:08', '0', NULL, '2021-11-27 18:21:35', 'LoneWolf', 0, NULL, NULL, NULL, 1, NULL, 1, 157, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interior_business`
--

CREATE TABLE `interior_business` (
  `intID` int(11) NOT NULL,
  `businessNote` varchar(101) NOT NULL DEFAULT 'Welcome to our business!'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves info about businesses - Maxime';

--
-- Dumping data for table `interior_business`
--

INSERT INTO `interior_business` (`intID`, `businessNote`) VALUES
(12, 'Welcome to our business!'),
(10, 'Welcome to our business!'),
(11, 'Welcome to our business!'),
(13, 'Welcome to our business!'),
(14, 'Welcome to our business!'),
(15, 'Welcome to our business!'),
(16, 'Welcome to our business!'),
(17, 'Welcome to our business!'),
(18, 'Welcome to our business!');

-- --------------------------------------------------------

--
-- Table structure for table `interior_logs`
--

CREATE TABLE `interior_logs` (
  `log_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `intID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all admin actions on interiors - Monitored by Interio';

-- --------------------------------------------------------

--
-- Table structure for table `interior_notes`
--

CREATE TABLE `interior_notes` (
  `id` int(11) NOT NULL,
  `intid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT 0,
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interior_textures`
--

CREATE TABLE `interior_textures` (
  `id` int(11) NOT NULL,
  `interior` int(11) NOT NULL,
  `texture` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rotation` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ippc_airlines`
--

CREATE TABLE `ippc_airlines` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ippc_airline_pilots`
--

CREATE TABLE `ippc_airline_pilots` (
  `id` int(11) NOT NULL,
  `airline` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `leader` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ippc_flights`
--

CREATE TABLE `ippc_flights` (
  `id` int(11) NOT NULL,
  `callsign` varchar(50) NOT NULL,
  `adep` varchar(50) NOT NULL,
  `ades` varchar(50) NOT NULL,
  `etd` datetime NOT NULL,
  `eta` datetime DEFAULT NULL,
  `vin` int(11) NOT NULL,
  `pilot1` int(11) DEFAULT NULL,
  `pilot2` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `airline` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tickets` tinyint(1) NOT NULL,
  `seats1` int(3) DEFAULT NULL,
  `seats2` int(3) DEFAULT NULL,
  `seats3` int(3) DEFAULT NULL,
  `price1` int(3) DEFAULT NULL,
  `price2` int(3) DEFAULT NULL,
  `price3` int(3) DEFAULT NULL,
  `submitter` int(11) NOT NULL,
  `submitted` datetime NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `index` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `itemID` int(10) NOT NULL,
  `itemValue` varchar(255) NOT NULL,
  `protected` int(100) NOT NULL DEFAULT 0,
  `metadata` text DEFAULT NULL COMMENT 'additional data for the item that can be edited per individual item, JSON'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jailed`
--

CREATE TABLE `jailed` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `charactername` text NOT NULL,
  `jail_time` bigint(12) NOT NULL,
  `jail_time_online` int(10) NOT NULL DEFAULT 0,
  `convictionDate` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedBy` text NOT NULL,
  `charges` text NOT NULL,
  `cell` text NOT NULL,
  `fine` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `jobID` int(11) NOT NULL DEFAULT 0,
  `jobCharID` int(11) NOT NULL DEFAULT -1,
  `jobLevel` int(11) NOT NULL DEFAULT 1,
  `jobProgress` int(11) NOT NULL DEFAULT 0,
  `jobTruckingRuns` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves job info, skill level and progress - Maxime' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs_trucker_orders`
--

CREATE TABLE `jobs_trucker_orders` (
  `orderID` int(11) NOT NULL,
  `orderX` float NOT NULL DEFAULT 0,
  `orderY` float NOT NULL DEFAULT 0,
  `orderZ` float NOT NULL DEFAULT 0,
  `orderName` text NOT NULL,
  `orderInterior` int(11) NOT NULL DEFAULT 0,
  `orderSupplies` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves info about customer orders to create markers for truck';

--
-- Dumping data for table `jobs_trucker_orders`
--

INSERT INTO `jobs_trucker_orders` (`orderID`, `orderX`, `orderY`, `orderZ`, `orderName`, `orderInterior`, `orderSupplies`) VALUES
(16, 1178.1, -906.066, 43.3394, 'Vinewood BurgernÄ«ca', 0, '[ [ ] ]'),
(15, 1087.73, -927.839, 43.1822, 'Vinewood Sex Veikals', 0, '[ [ ] ]'),
(14, 1037.27, -949.415, 42.5387, 'Vila Gardumu Veikals', 0, '[ [ ] ]'),
(13, 622.204, -1460.2, 14.4488, 'Dupont DrÄ“bju Veikals', 0, '[ [ ] ]'),
(17, 1323.55, -864.175, 39.5781, 'Robina PÄrtikas veikals', 0, '[ [ ] ]'),
(18, 1271.61, -1154.55, 23.8281, 'DÄvanu VeikaliÅ†Å¡', 0, '[ [ ] ]'),
(19, 1149.52, -1135.86, 23.6562, 'DVD Veikals', 0, '[ [ ] ]'),
(20, 866.597, -1245.43, 14.9354, 'A Stage reklÄmaparatÅ«ra', 0, '[ [ ] ]'),
(21, 881.319, -1332.67, 13.5469, 'AntÄ«kvariÄtu veikals', 0, '[ [ ] ]'),
(22, 1138.54, -1410.99, 13.6483, 'Lielveikals', 0, '[ [ ] ]'),
(23, 1980.89, -1280, 23.8203, 'Glen Park Optiku Veikals', 0, '[ [ ] ]'),
(24, 2111.92, -1216.6, 23.8047, 'Sub Urban drÄ“bju veikals', 0, '[ [ ] ]'),
(25, 2662.72, -1090.88, 69.3079, '98 centu veikals', 0, '[ [ ] ]'),
(26, 2699.32, -1091.28, 69.3491, 'AmerikÄÅ†u Sport Lands', 0, '[ [ ] ]'),
(27, 2802.19, -1087.52, 30.7236, 'Pludmales Ofiss', 0, '[ [ ] ]'),
(28, 2870.73, -1457.63, 10.7891, 'Jara DÄrglietu veikals', 0, '[ [ ] ]'),
(29, 2719.09, -2026.35, 13.2803, 'Berija VeikaliÅ†Å¡', 0, '[ [ ] ]'),
(30, 2793.97, -2400.54, 13.6322, 'Ocean Docks kuÄ£is', 0, '[ [ ] ]'),
(31, 2225.24, -2679.71, 13.5409, 'Ocean Docks garÄÅ¾a', 0, '[ [ ] ]'),
(32, 1634.72, -2323.96, 13.3828, 'LSSL', 0, '[ [ ] ]'),
(33, 1851.23, -1862.84, 13.5781, 'Unity Station LiÄ·ieru Veikals', 0, '[ [ ] ]'),
(34, 1933.55, -1775.12, 13.3828, 'IGS', 0, '[ [ ] ]'),
(35, 2157.24, -1010.5, 62.9689, 'PÄrtikas Veikals', 0, '[ [ ] ]'),
(36, 2339.54, -67.0234, 26.3359, 'Buba AparatÅ«ra', 0, '[ [ ] ]'),
(37, 2267.56, -83.8105, 26.5205, 'Polomino Creek bibliotÄ“ka', 0, '[ [ ] ]'),
(38, 2247.82, 46.4609, 26.3359, 'Polomino Creek PreÄu Veikals', 0, '[ [ ] ]'),
(39, 1920.8, 176.336, 37.2812, 'Polomino Creek Ferma', 0, '[ [ ] ]'),
(40, 1358.66, 250.106, 19.5669, 'Montgomery Well Stacked Pizza Co.', 0, '[ [ ] ]'),
(41, 1356.87, 301.041, 19.4062, 'Montgomery Locals Only veikals', 0, '[ [ ] ]'),
(42, 1252.52, 347.212, 19.4062, 'Montgomery Noliktavu veikals', 0, '[ [ ] ]'),
(43, 1250.67, 248.786, 19.5547, 'Montgomery Millers un dÄ“ls veikals', 0, '[ [ ] ]'),
(44, 324.011, -50.1758, 1.54565, 'Blueberry BÅ«vniecÄ«bas laukums', 0, '[ [ ] ]'),
(45, 277.749, -158.069, 1.57045, 'Blueberry Local Only veikals', 0, '[ [ ] ]'),
(46, 212.396, -207.085, 1.43169, 'Blueberry Well Stacked Pizza Co.', 0, '[ [ ] ]'),
(47, 115.662, -161.509, 1.57812, 'Blueberry GarÄÅ¾as', 0, '[ [ ] ]'),
(48, 220.158, 25.1572, 2.57812, 'Blueberry Xoomer garÄÅ¾a', 0, '[ [ ] ]'),
(49, -80.1035, -5.39844, 3.1094, 'Blueberry Fermas', 0, '[ [ ] ]'),
(50, -121.11, -213.94, 1.42969, 'Blueberry FleichBerg Noliktava', 0, '[ [ ] ]'),
(51, -547.713, -187.432, 78.4062, 'Blueberry KokzÄÄ£Ä“tava', 0, '[ [ ] ]'),
(52, -505.208, -548.712, 25.5234, 'Fallen Tree Noliktava', 0, '[ [ ] ]'),
(53, -369.893, -1052.31, 59.3024, 'Ferma KalnÄ', 0, '[ [ ] ]'),
(54, -581.852, -1057.12, 23.7003, 'MeÅ¾a BÅ«diÅ†as', 0, '[ [ ] ]'),
(55, -410.093, -1760.06, 5.90186, 'VientuÄ¼Ä KÄrÄ¼a MÄja', 0, '[ [ ] ]'),
(56, -272.83, -2205.3, 28.6657, 'LielceÄ¼a Noliktavas', 0, '[ [ ] ]'),
(57, 21.5732, -2658.05, 40.5256, '69 veikaliÅ†Å¡', 0, '[ [ ] ]'),
(58, 613.394, -490.273, 16.3359, 'Watson Auto DetaÄ¼u Veikals', 0, '[ [ ] ]'),
(59, 607.002, -518.549, 16.3359, 'LielÄ Mike Dilimore veikals', 0, '[ [ ] ]'),
(60, 701.016, -525.328, 16.1875, 'Granta RiteÅ†u Å Ä·Å«nis', 0, '[ [ ] ]'),
(61, 687.185, -622.21, 16.3359, 'Dilimore DrÄ“bju veikals', 0, '[ [ ] ]'),
(62, 815.062, -1056.67, 24.8687, 'POWER Filmu Ä«res veikals', 0, '[ [ ] ]'),
(63, 434.794, -1649.72, 25.5938, 'Vinewood aptieka', 0, '[ [ ] ]');

-- --------------------------------------------------------

--
-- Table structure for table `leo_impound_lot`
--

CREATE TABLE `leo_impound_lot` (
  `lane` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `int` float NOT NULL,
  `dim` float NOT NULL,
  `faction` int(11) NOT NULL,
  `veh` int(11) NOT NULL DEFAULT 0,
  `fine` int(11) NOT NULL DEFAULT 0,
  `release_date` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leo_impound_lot`
--

INSERT INTO `leo_impound_lot` (`lane`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `int`, `dim`, `faction`, `veh`, `fine`, `release_date`) VALUES
(22, 2658.67, -2661.67, 15.1989, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:55'),
(21, 2658.68, -2665.2, 14.9734, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:52'),
(20, 2658.82, -2669.07, 14.7263, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:49'),
(19, 2658.26, -2672.3, 14.5198, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:44'),
(18, 2658.5, -2675.94, 14.2876, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:39'),
(17, 2658.56, -2679.55, 14.057, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:36'),
(16, 2631.06, -2668.68, 14.7358, 0, 0, 88.5978, 0, 0, 4, 0, 0, '2021-11-21 18:23:30'),
(15, 2631.06, -2672.33, 14.5024, 0, 0, 88.5978, 0, 0, 4, 0, 0, '2021-11-21 18:23:26'),
(14, 2631, -2676.14, 14.2592, 0, 0, 88.5978, 0, 0, 4, 0, 0, '2021-11-21 18:23:23'),
(13, 2630.83, -2679.54, 14.0421, 0, 0, 92.0421, 0, 0, 4, 0, 0, NULL),
(12, 2630.66, -2683.14, 13.8121, 0, 0, 92.0421, 0, 0, 4, 0, 0, NULL),
(23, 2658.72, -2657.98, 15.4344, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:23:58'),
(24, 2658.71, -2654.41, 15.6469, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:01'),
(25, 2658.24, -2650.9, 15.8712, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:04'),
(26, 2658.5, -2647.42, 16.0934, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:07'),
(27, 2659.2, -2643.78, 16.3257, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:09'),
(28, 2658.3, -2640.01, 16.5668, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:12'),
(29, 2658.11, -2636.56, 16.7866, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:15'),
(30, 2658.47, -2632.83, 17.0407, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:18'),
(31, 2658.34, -2629.47, 17.2555, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:21'),
(32, 2658.03, -2625.91, 17.4823, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:24'),
(33, 2658.93, -2622.39, 17.7076, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:29'),
(34, 2658.6, -2618.87, 17.9324, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:32'),
(35, 2658.5, -2615.23, 18.1645, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:36'),
(36, 2659.31, -2611.72, 18.3886, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:39'),
(37, 2658.24, -2607.87, 18.6347, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:42'),
(38, 2658.47, -2604.52, 18.8489, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:45'),
(39, 2659.55, -2600.85, 19.0829, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:48'),
(40, 2659.82, -2597.22, 19.3151, 0, 0, 268.743, 0, 0, 4, 0, 0, '2021-11-21 18:24:54'),
(41, 2659.43, -2593.69, 19.5404, 0, 0, 269.996, 0, 0, 4, 0, 0, '2021-11-21 18:25:00'),
(42, 2659.82, -2590.12, 19.7685, 0, 0, 269.996, 0, 0, 4, 0, 0, '2021-11-21 18:25:06'),
(43, 2631, -2661.68, 15.1827, 0, 0, 91.707, 0, 0, 4, 0, 0, '2021-11-21 18:25:14'),
(44, 2631.09, -2658.1, 15.4116, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:19'),
(45, 2630.16, -2654.54, 15.6384, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:23'),
(46, 2630.77, -2650.98, 15.8658, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:26'),
(47, 2630.92, -2647.21, 16.1069, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:30'),
(48, 2631.39, -2643.8, 16.3245, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:33'),
(49, 2631.21, -2640.18, 16.5558, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:36'),
(50, 2630.31, -2636.7, 16.7782, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:40'),
(51, 2631.02, -2633.12, 17.0222, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:43'),
(52, 2630.93, -2629.51, 17.2529, 0, 0, 91.0808, 0, 0, 4, 0, 0, '2021-11-21 18:25:46'),
(53, 2630.95, -2626.01, 17.4761, 0, 0, 88.889, 0, 0, 4, 0, 0, '2021-11-21 18:25:50'),
(54, 2630.66, -2622.29, 17.7136, 0, 0, 88.889, 0, 0, 4, 0, 0, '2021-11-21 18:25:54'),
(55, 2631.09, -2618.79, 17.9373, 0, 0, 88.889, 0, 0, 4, 0, 0, '2021-11-21 18:25:58'),
(56, 2630.8, -2615.21, 18.1658, 0, 0, 88.889, 0, 0, 4, 0, 0, '2021-11-21 18:26:01'),
(57, 2630.78, -2611.75, 18.3866, 0, 0, 88.889, 0, 0, 4, 0, 0, '2021-11-21 18:26:07'),
(58, 2631.4, -2608, 18.6263, 0, 0, 88.889, 0, 0, 4, 0, 0, '2021-11-21 18:26:10'),
(59, 1545.94, -1614.81, 13.3828, 0, 0, 96.8487, 0, 0, 1, 7, 0, '2021-11-23 17:36:40'),
(60, 1600.89, -1684.02, 5.89062, 0, 0, 271.188, 0, 0, 1, 0, 0, NULL),
(61, 1600.38, -1688.08, 5.89062, 0, 0, 271.902, 0, 0, 1, 0, 0, '2021-11-26 13:16:17'),
(62, 1600.83, -1692.03, 5.89062, 0, 0, 267.249, 0, 0, 1, 0, 0, '2021-11-26 13:16:22'),
(63, 1601.04, -1696.09, 5.89062, 0, 0, 272.259, 0, 0, 1, 0, 0, '2021-11-26 13:16:27'),
(64, 1600.52, -1699.95, 5.89062, 0, 0, 267.249, 0, 0, 1, 0, 0, '2021-11-26 13:16:32'),
(65, 1600.88, -1704.08, 5.89062, 0, 0, 268.677, 0, 0, 1, 0, 0, '2021-11-26 13:16:37'),
(66, 1595.63, -1709.78, 5.89062, 0, 0, 177.006, 0, 0, 1, 0, 0, '2021-11-26 13:16:42'),
(67, 1591.52, -1709.72, 5.89062, 0, 0, 177.006, 0, 0, 1, 0, 0, '2021-11-26 13:16:48'),
(68, 1587.38, -1709.42, 5.89062, 0, 0, 177.72, 0, 0, 1, 0, 0, '2021-11-26 13:16:53'),
(69, 1583.5, -1709.83, 5.89062, 0, 0, 178.797, 0, 0, 1, 0, 0, '2021-11-26 13:16:57'),
(70, 1578.47, -1709.87, 5.89062, 0, 0, 180.588, 0, 0, 1, 0, 0, '2021-11-26 13:17:03'),
(71, 1574.41, -1710.04, 5.89062, 0, 0, 178.577, 0, 0, 1, 0, 0, '2021-11-26 13:17:17'),
(72, 1570.36, -1710.04, 5.89062, 0, 0, 179.291, 0, 0, 1, 0, 0, '2021-11-26 13:17:21'),
(73, 1558.82, -1710.03, 5.89062, 0, 0, 179.648, 0, 0, 1, 0, 0, '2021-11-26 13:17:27'),
(74, 1544.9, -1684.25, 5.89062, 0, 0, 269.892, 0, 0, 1, 0, 0, '2021-11-26 13:17:36'),
(75, 1544.43, -1680, 5.89062, 0, 0, 268.458, 0, 0, 1, 0, 0, '2021-11-26 13:17:40'),
(76, 1544.65, -1676.24, 5.89062, 0, 0, 270.249, 0, 0, 1, 0, 0, '2021-11-26 13:17:44'),
(77, 1544.44, -1671.74, 5.89062, 0, 0, 270.249, 0, 0, 1, 0, 0, '2021-11-26 13:17:48'),
(78, 1544.74, -1667.76, 5.89062, 0, 0, 270.963, 0, 0, 1, 0, 0, '2021-11-26 13:17:52'),
(79, 1544.79, -1663.07, 5.89062, 0, 0, 272.039, 0, 0, 1, 0, 0, '2021-11-26 13:17:56'),
(80, 1544.94, -1659.02, 5.89062, 0, 0, 271.682, 0, 0, 1, 0, 0, '2021-11-26 13:17:59'),
(81, 1544.05, -1654.95, 5.89062, 0, 0, 268.815, 0, 0, 1, 0, 0, '2021-11-26 13:18:03'),
(82, 1544.49, -1651.14, 5.89062, 0, 0, 270.606, 0, 0, 1, 0, 0, '2021-11-26 13:18:06'),
(83, 1538.92, -1646.02, 5.89062, 0, 0, 359.772, 0, 0, 1, 0, 0, '2021-11-26 13:18:10'),
(84, 1534.58, -1645.72, 5.89062, 0, 0, 358.338, 0, 0, 1, 0, 0, '2021-11-26 13:18:14'),
(85, 1530.4, -1645.68, 5.89062, 0, 0, 5.5015, 0, 0, 1, 0, 0, '2021-11-26 13:18:17'),
(86, 1526.2, -1644.38, 5.89062, 0, 0, 358.338, 0, 0, 1, 0, 0, '2021-11-26 13:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `lifts`
--

CREATE TABLE `lifts` (
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lift_floors`
--

CREATE TABLE `lift_floors` (
  `id` int(11) NOT NULL,
  `lift` int(11) NOT NULL,
  `x` float(10,6) DEFAULT 0.000000,
  `y` float(10,6) DEFAULT 0.000000,
  `z` float(10,6) DEFAULT 0.000000,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `floor` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lottery`
--

CREATE TABLE `lottery` (
  `characterid` int(255) NOT NULL,
  `ticketnumber` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `preview` text NOT NULL,
  `purposes` text NOT NULL,
  `used_by` text NOT NULL,
  `reasons` text NOT NULL,
  `approved` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `uploader` int(10) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'exterior',
  `upload_date` datetime NOT NULL DEFAULT current_timestamp(),
  `reviewer` int(10) UNSIGNED DEFAULT NULL,
  `note` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `preview`, `purposes`, `used_by`, `reasons`, `approved`, `enabled`, `uploader`, `type`, `upload_date`, `reviewer`, `note`) VALUES
(1, 'LSAK', '.', 'LSAK', 'LSAK', 'LSAK', 1, 1, 3, 'exterior', '2021-11-21 17:35:10', 3, '[21/11/2021] Head Admin LoneWolf: ACCEPTED. 1\n\n[21/11/2021] Head Admin LoneWolf: Implemented map.\n'),
(2, 'LSPD', 'LSPD', 'LSPD', 'LSPD', 'LSDP', 1, 1, 3, 'exterior', '2021-11-24 18:32:55', 3, '[24/11/2021] Head Admin LoneWolf: ACCEPTED. yee\n\n[24/11/2021] Head Admin LoneWolf: Implemented map.\n[25/11/2021] Head Admin LoneWolf: Disabled map.\n[25/11/2021] Head Admin LoneWolf: Implemented map.\n'),
(4, 'CSDD', 'CSDD', 'CSDD', 'CSDD', 'CSDD', 1, 1, 3, 'exterior', '2021-11-25 22:19:52', 3, '[25/11/2021] Head Admin LoneWolf: ACCEPTED. test\n\n[25/11/2021] Head Admin LoneWolf: Implemented map.\n'),
(5, 'IGS', 'IGS', 'IGS', 'IGS', 'IGS', 1, 1, 3, 'exterior', '2021-11-25 22:23:12', 3, '[25/11/2021] Head Admin LoneWolf: ACCEPTED. test\n\n[25/11/2021] Head Admin LoneWolf: Implemented map.\n[26/11/2021] Head Admin solidshock: Disabled map.\n[26/11/2021] Head Admin solidshock: Implemented map.\n'),
(6, 'LSGD', 'LSGD', 'LSGD', 'LSGD', 'LSGD', 1, 1, 3, 'exterior', '2021-11-25 22:27:13', 3, '[25/11/2021] Head Admin LoneWolf: ACCEPTED. test\n\n[25/11/2021] Head Admin LoneWolf: Implemented map.\n'),
(7, 'LSV', 'LSV', 'LSV', 'LSV', 'LSV', 1, 1, 3, 'exterior', '2021-11-25 22:29:32', 3, '[25/11/2021] Head Admin LoneWolf: ACCEPTED. test\n\n[25/11/2021] Head Admin LoneWolf: Implemented map.\n'),
(9, 'Last Misijas Caurums', 'Last Misijas Caurums', 'Last Misijas Caurums', 'Last Misijas Caurums', 'Last Misijas Caurums', 1, 1, 13, 'exterior', '2021-11-27 17:29:55', 13, '[27/11/2021] Head Admin solidshock: ACCEPTED. cav\n\n[27/11/2021] Head Admin solidshock: Implemented map.\n'),
(13, 'Toll', 'Toll', 'Toll', 'Toll', 'Toll', 1, 1, 13, 'exterior', '2021-12-02 14:13:55', 13, '[2/12/2021] Head Admin solidshock: ACCEPTED. cav\n\n[2/12/2021] Head Admin solidshock: Implemented map.\n');

-- --------------------------------------------------------

--
-- Table structure for table `maps_objects`
--

CREATE TABLE `maps_objects` (
  `index` int(10) UNSIGNED NOT NULL,
  `map_id` int(10) UNSIGNED NOT NULL,
  `id` text DEFAULT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) DEFAULT NULL,
  `collisions` tinyint(1) DEFAULT NULL,
  `breakable` tinyint(1) DEFAULT NULL,
  `radius` double UNSIGNED DEFAULT NULL,
  `model` int(10) UNSIGNED NOT NULL,
  `lodModel` int(10) UNSIGNED DEFAULT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  `posZ` double NOT NULL,
  `rotX` double NOT NULL,
  `rotY` double NOT NULL,
  `rotZ` double NOT NULL,
  `doublesided` tinyint(1) UNSIGNED DEFAULT NULL,
  `scale` double UNSIGNED DEFAULT NULL,
  `alpha` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maps_objects`
--

INSERT INTO `maps_objects` (`index`, `map_id`, `id`, `interior`, `dimension`, `collisions`, `breakable`, `radius`, `model`, `lodModel`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`, `doublesided`, `scale`, `alpha`) VALUES
(1, 1, 'removeWorldObject (rdwarhusmed) (1)', 0, NULL, NULL, NULL, 56.626904, 3707, 3708, 2720.3203, -2530.9141, 19.976561, 0, 0, 0, NULL, NULL, NULL),
(2, 1, 'object (multicarpark01_lvS) (1)', 0, 0, 1, 1, NULL, 8390, NULL, 2674.7363, -2635, 32, 0, 0, 0, 1, 1, 255),
(3, 1, 'object (vgsSairportland15) (1)', 0, 0, 1, 1, NULL, 8356, NULL, 2624.76, -2584.9697, -81, 90, 0, 90, 1, 1, 255),
(4, 1, 'object (vgsSairportland15) (2)', 0, 0, 1, 1, NULL, 8356, NULL, 2624.76, -2624.7998, -81, 90, 0, 90, 1, 1, 255),
(5, 1, 'object (vgsSairportland15) (3)', 0, 0, 1, 1, NULL, 8356, NULL, 2624.76, -2664.7002, -81, 90, 0, 90, 1, 1, 255),
(6, 1, 'object (vgsSairportland15) (4)', 0, 0, 1, 1, NULL, 8356, NULL, 2624.7598, -2684.8994, -81, 90, 0, 90, 1, 1, 255),
(7, 1, 'object (vgsSairportland15) (5)', 0, 0, 1, 1, NULL, 8356, NULL, 2644.75, -2704.8994, -81, 90, 90, 90, 1, 1, 255),
(8, 1, 'object (vgsSairportland15) (6)', 0, 0, 1, 1, NULL, 8356, NULL, 2677.2998, -2719, -81.25, 90, 90, 90, 1, 1, 255),
(9, 1, 'object (vgsSairportland15) (7)', 0, 0, 1, 1, NULL, 8356, NULL, 2717.2998, -2719, -81.25, 90, 90, 90, 1, 1, 255),
(10, 1, 'removeWorldObject (lasdkrtgrp2) (1)', 0, NULL, NULL, NULL, 13.891983, 3574, 3744, 2771.0703, -2520.5469, 15.21875, 0, 0, 0, NULL, NULL, NULL),
(11, 1, 'removeWorldObject (lasdkrtgrp2) (2)', 0, NULL, NULL, NULL, 13.891983, 3574, 3744, 2774.7969, -2534.9531, 15.21875, 0, 0, 0, NULL, NULL, NULL),
(12, 1, 'object (vgsSairportland15) (8)', 0, 0, 1, 1, NULL, 8356, NULL, 2644.7002, -2564.9648, -81, 90, 270, 90, 1, 1, 255),
(13, 1, 'object (arprtcrprk04_lvS) (1)', 0, 0, 1, 1, NULL, 8420, NULL, 2697.3105, -2679, 12.48, 0, 0, 270, 1, 1, 255),
(14, 1, 'object (arprtcrprk04_lvS) (2)', 0, 0, 1, 1, NULL, 8420, NULL, 2697.3506, -2619.5, 12.47, 0, 0, 0, 1, 1, 255),
(15, 1, 'object (vgsSairportland15) (9)', 0, 0, 1, 1, NULL, 8356, NULL, 2657.3203, -2698.9902, -81.300003, 90, 0, 90, 1, 1, 255),
(16, 1, 'object (arprtcrprk04_lvS) (3)', 0, 0, 1, 1, NULL, 8420, NULL, 2724.4004, -2554, 12.6, 0, 0, 270, 1, 1, 255),
(17, 1, 'object (vgsSairportland15) (10)', 0, 0, 1, 1, NULL, 8356, NULL, 2764.5, -2574, -81.139999, 90, 0, 90, 1, 1, 255),
(18, 1, 'object (vgsSairportland15) (11)', 0, 0, 1, 1, NULL, 8356, NULL, 2744.51, -2594, -81.139999, 90, 90, 90, 1, 1, 255),
(19, 1, 'object (vgsSairportland15) (12)', 0, 0, 1, 1, NULL, 8356, NULL, 2737.2998, -2613.5, -81.199997, 90, 0, 90, 1, 1, 255),
(20, 1, 'object (vgsSairportland15) (13)', 0, 0, 1, 1, NULL, 8356, NULL, 2737.2998, -2653.3994, -81.25, 90, 0, 90, 1, 1, 255),
(21, 1, 'object (vgsSairportland15) (14)', 0, 0, 1, 1, NULL, 8356, NULL, 2737.2998, -2693.2998, -81.300003, 90, 0, 90, 1, 1, 255),
(22, 1, 'object (vgsSairportland15) (15)', 0, 0, 1, 1, NULL, 8356, NULL, 2737.2998, -2699, -81.400002, 90, 0, 90, 1, 1, 255),
(23, 1, 'object (csrsfence03_lvs) (1)', 0, 0, 1, 1, NULL, 8673, NULL, 2667.7002, -2718.8994, 13.9, 0, 0, 0, 0, 1, 255),
(24, 1, 'object (csrsfence03_lvs) (2)', 0, 0, 1, 1, NULL, 8673, NULL, 2688.1001, -2718.8999, 13.9, 0, 0, 0, 0, 1, 255),
(25, 1, 'object (csrsfence03_lvs) (3)', 0, 0, 1, 1, NULL, 8673, NULL, 2708.5, -2718.8999, 13.9, 0, 0, 0, 0, 1, 255),
(26, 1, 'object (csrsfence03_lvs) (4)', 0, 0, 1, 1, NULL, 8673, NULL, 2727.2998, -2718.8994, 13.9, 0, 0, 0, 0, 1, 255),
(27, 1, 'object (csrsfence03_lvs) (5)', 0, 0, 1, 1, NULL, 8673, NULL, 2737.1006, -2708.5996, 13.8, 0, 0, 90, 0, 1, 255),
(28, 1, 'object (csrsfence03_lvs) (6)', 0, 0, 1, 1, NULL, 8673, NULL, 2737.2002, -2678.8994, 13.9, 0, 0, 90, 0, 1, 255),
(29, 1, 'object (csrsfence03_lvs) (7)', 0, 0, 1, 1, NULL, 8673, NULL, 2737.2002, -2658.5, 13.9, 0, 0, 90, 0, 1, 255),
(30, 1, 'object (csrsfence03_lvs) (8)', 0, 0, 1, 1, NULL, 8673, NULL, 2737.2002, -2638.0996, 13.9, 0, 0, 90, 0, 1, 255),
(31, 1, 'object (csrsfence03_lvs) (9)', 0, 0, 1, 1, NULL, 8673, NULL, 2737.2002, -2617.7002, 13.9, 0, 0, 90, 0, 1, 255),
(32, 1, 'object (csrsfence03_lvs) (10)', 0, 0, 1, 1, NULL, 8673, NULL, 2737.2002, -2603.8994, 13.9, 0, 0, 90, 0, 1, 255),
(33, 1, 'object (csrsfence03_lvs) (11)', 0, 0, 1, 1, NULL, 8673, NULL, 2747.7002, -2594, 14, 0, 0, 0, 0, 1, 255),
(34, 1, 'object (csrsfence03_lvs) (12)', 0, 0, 1, 1, NULL, 8673, NULL, 2754.5, -2594, 14, 0, 0, 0, 0, 1, 255),
(35, 1, 'object (csrsfence03_lvs) (13)', 0, 0, 1, 1, NULL, 8673, NULL, 2764.2998, -2583.5996, 13.9, 0, 0, 90, 0, 1, 255),
(36, 1, 'object (DockBarr1_LA) (3)', 0, 0, 1, 1, NULL, 3578, NULL, 2736.5, -2694.0498, 13.3, 0, 0, 90, 0, 1, 255),
(37, 1, 'object (cuntw_shed2_) (1)', 0, 0, 1, 1, NULL, 18234, NULL, 2724.1001, -2559.8999, 12.6, 0, 0, 179.995, 0, 1, 255),
(38, 1, 'object (csrsfence03_lvs) (14)', 0, 0, 1, 1, NULL, 8673, NULL, 2754.4004, -2564.0996, 14.1, 0, 0, 0, 0, 1, 255),
(39, 1, 'object (csrsfence03_lvs) (15)', 0, 0, 1, 1, NULL, 8673, NULL, 2744.2002, -2553.7002, 14.2, 0, 0, 90, 0, 1, 255),
(40, 1, 'object (csrsfence03_lvs) (16)', 0, 0, 1, 1, NULL, 8673, NULL, 2744.2, -2533.2998, 14.2, 0, 0, 90, 0, 1, 255),
(41, 1, 'object (csrsfence03_lvs) (17)', 0, 0, 1, 1, NULL, 8673, NULL, 2744.2, -2524, 14.2, 0, 0, 90, 0, 1, 255),
(42, 1, 'object (csrsfence03_lvs) (19)', 0, 0, 1, 1, NULL, 8673, NULL, 2734.2, -2514, 14.2, 0, 0, 0, 0, 1, 255),
(43, 1, 'object (csrsfence03_lvs) (20)', 0, 0, 1, 1, NULL, 8673, NULL, 2713.7998, -2514, 14.2, 0, 0, 0, 0, 1, 255),
(44, 1, 'object (csrsfence03_lvs) (21)', 0, 0, 1, 1, NULL, 8673, NULL, 2687.5, -2554.5996, 14.2, 0, 0, 90, 0, 1, 255),
(45, 1, 'object (bar_gatebar01) (3)', 0, 0, 1, 1, NULL, 966, NULL, 2736.8, -2564.3, 12.6, 0, 0, 0, 0, 1, 255),
(46, 1, 'object (cjgaragedoor) (1)', 0, 0, 1, 1, NULL, 17951, NULL, 2664.7, -2599, 14.5, 0, 0, 359.5, 0, 1, 255),
(47, 1, 'object (kmb_lockeddoor) (1)', 0, 0, 1, 1, NULL, 2949, NULL, 2664.8, -2594.3, 12.7, 0, 0, 179.995, 0, 1, 255),
(48, 1, 'object (new_bushsm) (1)', 0, 0, 1, 1, NULL, 647, NULL, 2733.7002, -2696.0996, 14, 0, 0, 0, 1, 1, 255),
(49, 1, 'object (new_bushsm) (2)', 0, 0, 1, 1, NULL, 647, NULL, 2732.2998, -2693.5996, 14, 0, 0, 0, 1, 1, 255),
(50, 1, 'object (new_bushsm) (3)', 0, 0, 1, 1, NULL, 647, NULL, 2734.6006, -2692.7002, 14.5, 0, 0, 0, 1, 1, 255),
(51, 1, 'object (new_bushsm) (4)', 0, 0, 1, 1, NULL, 647, NULL, 2732.7998, -2691, 14, 0, 0, 0, 1, 1, 255),
(52, 1, 'object (aw_streettree1) (2)', 0, 0, 1, 1, NULL, 792, NULL, 2686.1006, -2556.2998, 12.9, 0, 0, 0, 0, 1, 255),
(53, 1, 'object (aw_streettree1) (3)', 0, 0, 1, 1, NULL, 792, NULL, 2686.1006, -2550.2998, 12.9, 0, 0, 0, 0, 1, 255),
(54, 1, 'object (aw_streettree1) (4)', 0, 0, 1, 1, NULL, 792, NULL, 2686.1001, -2544.3, 12.9, 0, 0, 0, 0, 1, 255),
(55, 1, 'object (new_bushsm) (5)', 0, 0, 1, 1, NULL, 647, NULL, 2761.7998, -2566.5, 14.6, 0, 0, 0, 1, 1, 255),
(56, 1, 'object (new_bushsm) (6)', 0, 0, 1, 1, NULL, 647, NULL, 2759.4004, -2568.2002, 14.5, 0, 0, 0, 1, 1, 255),
(57, 1, 'object (new_bushsm) (7)', 0, 0, 1, 1, NULL, 647, NULL, 2761.7998, -2570.2998, 14.6, 0, 0, 0, 1, 1, 255),
(58, 1, 'object (new_bushsm) (8)', 0, 0, 1, 1, NULL, 647, NULL, 2760.2998, -2572.3994, 14.4, 0, 0, 0, 1, 1, 255),
(59, 1, 'object (DockBarr1_LA) (6)', 0, 0, 1, 1, NULL, 3578, NULL, 2763.7002, -2569.2998, 13.4, 0, 0, 90, 0, 1, 255),
(60, 1, 'object (vgElkup) (1)', 0, 0, 1, 1, NULL, 8947, NULL, 2657.5, -2572.3994, 15.7, 0, 0, 270, 0, 1, 255),
(61, 1, 'object (vgElkup) (2)', 0, 0, 1, 1, NULL, 8947, NULL, 2657.5, -2582.8, 15.7, 0, 0, 269.995, 0, 1, 255),
(62, 1, 'object (vgElkup) (3)', 0, 0, 1, 1, NULL, 8947, NULL, 2638.7998, -2577.3203, 15.7, 0, 0, 0, 0, 1, 255),
(63, 1, 'object (vgsSairportland15) (16)', 0, 0, 1, 1, NULL, 8356, NULL, 2663.8999, -2564.8999, -81, 90, 270, 90, 1, 1, 255),
(64, 1, 'removeWorldObject (sub_floodlite) (1)', 0, NULL, NULL, NULL, 16.251438, 1278, 0, 2674.5234, -2557.4922, 26.703131, 0, 0, 0, NULL, NULL, NULL),
(65, 1, 'object (csrsfence03_lvs) (24)', 0, 0, 1, 1, NULL, 8673, NULL, 2687.5, -2544.3994, 14.2, 0, 0, 90, 0, 1, 255),
(66, 1, 'object (fencesmallb) (1)', 0, 0, 1, 1, NULL, 970, NULL, 2741.8, -2564.1001, 13.3, 0, 0, 0, 0, 1, 255),
(67, 1, 'object (fencesmallb) (3)', 0, 0, 1, 1, NULL, 970, NULL, 2739.7, -2564.1001, 13.3, 0, 0, 0, 0, 1, 255),
(68, 1, 'object (csrsfence03_lvs) (25)', 0, 0, 1, 1, NULL, 8673, NULL, 2666.2002, -2554.5996, 14.1, 0, 0, 90, 0, 1, 255),
(69, 1, 'object (csrsfence03_lvs) (26)', 0, 0, 1, 1, NULL, 8673, NULL, 2666.2002, -2534.2002, 14.1, 0, 0, 90, 0, 1, 255),
(70, 1, 'object (csrsfence03_lvs) (26)', 0, 0, 1, 1, NULL, 8673, NULL, 2666.2, -2523.1001, 14.1, 0, 0, 90, 0, 1, 255),
(71, 1, 'object (kb_couch05) (1)', 0, 0, 1, 1, NULL, 1712, NULL, 579.40002, -1877.5, 10.3, 0, 0, 0, 0, 1, 255),
(72, 1, 'object (elecfence_BAR) (1)', 0, 0, 1, 1, NULL, 987, NULL, 2714.8, -2565.2, 14, 0, 0, 180, 0, 1, 255),
(73, 1, 'object (elecfence_BAR) (2)', 0, 0, 1, 1, NULL, 987, NULL, 2696.7002, -2565.2002, 14, 0, 0, 179.995, 0, 1, 255),
(74, 1, 'object (elecfence_BAR) (3)', 0, 0, 1, 1, NULL, 987, NULL, 2708.7002, -2565.2002, 14, 0, 0, 179.995, 0, 1, 255),
(75, 1, 'object (elecfence_BAR) (4)', 0, 0, 1, 1, NULL, 987, NULL, 2724.3999, -2574.7, 14, 0, 0, 180, 0, 1, 255),
(76, 1, 'object (elecfence_BAR) (5)', 0, 0, 1, 1, NULL, 987, NULL, 2724.3999, -2598.2, 14, 0, 0, 90, 0, 1, 255),
(77, 1, 'object (elecfence_BAR) (6)', 0, 0, 1, 1, NULL, 987, NULL, 2724.46, -2586.2998, 14, 0, 0, 90, 0, 1, 255),
(78, 1, 'object (elecfence_BAR) (7)', 0, 0, 1, 1, NULL, 987, NULL, 2724.3999, -2610.2, 14, 0, 0, 90, 0, 1, 255),
(79, 1, 'object (elecfence_BAR) (8)', 0, 0, 1, 1, NULL, 987, NULL, 2724.3999, -2646, 14, 0, 0, 90, 0, 1, 255),
(80, 1, 'object (elecfence_BAR) (9)', 0, 0, 1, 1, NULL, 987, NULL, 2724.4004, -2622.0996, 14, 0, 0, 90, 0, 1, 255),
(81, 1, 'object (elecfence_BAR) (10)', 0, 0, 1, 1, NULL, 987, NULL, 2724.4004, -2634.0996, 14, 0, 0, 90, 0, 1, 255),
(82, 1, 'object (elecfence_BAR) (12)', 0, 0, 1, 1, NULL, 987, NULL, 2724.4004, -2657.3994, 14, 0, 0, 90, 0, 1, 255),
(83, 1, 'object (elecfence_BAR) (13)', 0, 0, 1, 1, NULL, 987, NULL, 2663, -2704.4099, 12.7, 0, 0, 0, 0, 1, 255),
(84, 1, 'object (elecfence_BAR) (14)', 0, 0, 1, 1, NULL, 987, NULL, 2635.5, -2694, 14, 0, 0, 180.25, 0, 1, 255),
(85, 1, 'object (elecfence_BAR) (15)', 0, 0, 1, 1, NULL, 987, NULL, 2652.7998, -2704.5996, 14, 0, 0, 0, 0, 1, 255),
(86, 1, 'object (elecfence_BAR) (16)', 0, 0, 1, 1, NULL, 987, NULL, 2640.7998, -2704.5996, 14, 0, 0, 0, 0, 1, 255),
(87, 1, 'object (elecfence_BAR) (17)', 0, 0, 1, 1, NULL, 987, NULL, 2635.1006, -2704.5996, 14, 0, 0, 0, 0, 1, 255),
(88, 1, 'object (elecfence_BAR) (18)', 0, 0, 1, 1, NULL, 987, NULL, 2624.8999, -2611.1001, 14, 0, 0, 270, 0, 1, 255),
(89, 1, 'object (elecfence_BAR) (19)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1201, -2692.98, 12.7, 0, 0, 270, 0, 1, 255),
(90, 1, 'object (elecfence_BAR) (20)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2671.0098, 14, 0, 0, 270, 0, 1, 255),
(91, 1, 'object (elecfence_BAR) (21)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2659.0996, 14, 0, 0, 270, 0, 1, 255),
(92, 1, 'object (elecfence_BAR) (22)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2647.0996, 14, 0, 0, 270, 0, 1, 255),
(93, 1, 'object (elecfence_BAR) (23)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2635.0996, 14, 0, 0, 270, 0, 1, 255),
(94, 1, 'object (elecfence_BAR) (24)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2599.1001, 14, 0, 0, 270, 0, 1, 255),
(95, 1, 'object (elecfence_BAR) (25)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2623.0996, 14, 0, 0, 270, 0, 1, 255),
(96, 1, 'object (elecfence_BAR) (26)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2623.0996, 14, 0, 0, 270, 0, 1, 255),
(97, 1, 'object (elecfence_BAR) (27)', 0, 0, 1, 1, NULL, 987, NULL, 2624.9004, -2683, 14, 0, 0, 270, 0, 1, 255),
(98, 1, 'object (elecfence_BAR) (28)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2649.1001, 12.7, 0, 0, 270, 0, 1, 255),
(99, 1, 'object (elecfence_BAR) (29)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2661.0996, 12.7, 0, 0, 270, 0, 1, 255),
(100, 1, 'object (elecfence_BAR) (30)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2637.1201, 12.7, 0, 0, 270, 0, 1, 255),
(101, 1, 'object (elecfence_BAR) (31)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2625.1499, 12.7, 0, 0, 270, 0, 1, 255),
(102, 1, 'object (elecfence_BAR) (32)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2601.23, 12.7, 0, 0, 270, 0, 1, 255),
(103, 1, 'object (elecfence_BAR) (33)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2613.2002, 12.7, 0, 0, 270, 0, 1, 255),
(104, 1, 'object (elecfence_BAR) (34)', 0, 0, 1, 1, NULL, 987, NULL, 2664.1299, -2673.0098, 12.7, 0, 0, 270, 0, 1, 255),
(105, 1, 'object (elecfence_BAR) (35)', 0, 0, 1, 1, NULL, 987, NULL, 2679.7998, -2704.5996, 12.9, 0, 0, 0, 0, 1, 255),
(106, 1, 'object (elecfence_BAR) (36)', 0, 0, 1, 1, NULL, 987, NULL, 2668.2002, -2704.3994, 12.7, 0, 0, 0, 0, 1, 255),
(107, 1, 'object (Gen_doorEXT15) (1)', 0, 0, 1, 1, NULL, 1536, NULL, 2667.7, -2565.01, 12.66, 0, 0, 0, 0, 1, 255),
(108, 1, 'object (aw_streettree1) (1)', 0, 0, 1, 1, NULL, 792, NULL, 2671, -2563.2, 12.7, 0, 0, 0, 0, 1, 255),
(109, 1, 'object (elecfence_BAR) (37)', 0, 0, 1, 1, NULL, 987, NULL, 2692.5, -2565.3999, 12.7, 0, 0, 179.995, 0, 1, 255),
(110, 1, 'object (elecfence_BAR) (38)', 0, 0, 1, 1, NULL, 987, NULL, 2672.6001, -2565.25, 12.7, 0, 0, 180, 0, 1, 255),
(111, 1, 'object (aw_streettree1) (5)', 0, 0, 1, 1, NULL, 792, NULL, 2686, -2538.3, 12.83, 0, 0, 0, 0, 1, 255),
(112, 1, 'removeWorldObject (tlgraphpolegen) (1)', 0, NULL, NULL, NULL, 12.421588, 1306, 0, 2669.9063, -2518.6641, 19.84375, 0, 0, 0, NULL, NULL, NULL),
(113, 1, 'object (Vgs_guardhouse01) (1)', 0, 0, 1, 1, NULL, 8168, NULL, 2688.1006, -2534.2998, 14.3, 0, 1, 196.414, 0, 1, 255),
(114, 1, 'object (ferspaces) (1)', 0, 0, 1, 1, NULL, 10183, NULL, 2707.8999, -2558.5, 12.7, 0, 0, 225.34599, 0, 1, 255),
(115, 1, 'removeWorldObject (lamppost3) (1)', 0, NULL, NULL, NULL, 6.614927, 1226, 0, 2674.4963, -2509.1877, 13.35307, 0, 0, 0, NULL, NULL, NULL),
(116, 1, 'object (arrows01_lvs) (1)', 0, 0, 1, 1, NULL, 8843, NULL, 2676.8, -2522.8, 12.4, 0, 0, 179.995, 0, 1, 255),
(117, 1, 'object (lasairfbed_LAS) (2)', 0, 0, 1, 1, NULL, 3660, NULL, 2713.2, -2514.8999, 15.1, 0, 0, 0, 0, 1, 255),
(118, 1, 'object (lasairfbed_LAS) (7)', 0, 0, 1, 1, NULL, 3660, NULL, 2729.8, -2514.8999, 15.4, 0, 0, 0, 0, 1, 255),
(119, 1, 'object (lasairfbed_LAS) (8)', 0, 0, 1, 1, NULL, 3660, NULL, 2734.3, -2514.8999, 15.4, 0, 0, 0, 0, 1, 255),
(120, 1, 'object (lasairfbed_LAS) (9)', 0, 0, 1, 1, NULL, 3660, NULL, 2742.8, -2525.5, 15.4, 0, 0, 90, 0, 1, 255),
(121, 1, 'object (lasairfbed_LAS) (10)', 0, 0, 1, 1, NULL, 3660, NULL, 2742.8, -2544.8, 15.4, 0, 0, 90, 0, 1, 255),
(122, 1, 'object (lasairfbed_LAS) (11)', 0, 0, 1, 1, NULL, 3660, NULL, 2742.8, -2554.1001, 15.4, 0, 0, 90, 0, 1, 255),
(123, 1, 'object (sfx_plant03) (1)', 0, 0, 1, 1, NULL, 3802, NULL, 2667, -2565, 14.4, 0, 0, 89.754997, 0, 1, 255),
(124, 1, 'object (vgsbboardsigns09) (1)', 0, 0, 1, 1, NULL, 8323, NULL, 2656, -2565, 16.4, 0, 0, 93.098, 0, 0.452316, 255),
(125, 1, 'object (storm_drain_cover) (1)', 0, 0, 1, 1, NULL, 3058, NULL, 2721.7002, -2574.5996, 22.9, 0, 0, 24.999001, 0, 1, 255),
(126, 1, 'object (elecfence_BAR) (39)', 0, 0, 1, 1, NULL, 987, NULL, 2703.8, -2704.6001, 12.9, 0, 0, 0, 0, 1, 255),
(127, 1, 'object (elecfence_BAR) (41)', 0, 0, 1, 1, NULL, 987, NULL, 2691.7998, -2704.5996, 12.9, 0, 0, 0, 0, 1, 255),
(128, 1, 'object (elecfence_BAR) (40)', 0, 0, 1, 1, NULL, 987, NULL, 2724.2998, -2668.7998, 14, 0, 0, 90, 0, 1, 255),
(129, 1, 'object (elecfence_BAR) (42)', 0, 0, 1, 1, NULL, 987, NULL, 2724.4004, -2680.7998, 14.1, 0, 0, 90, 0, 1, 255),
(130, 1, 'object (elecfence_BAR) (43)', 0, 0, 1, 1, NULL, 987, NULL, 2724.3, -2692.8, 14, 0, 0, 90, 0, 1, 255),
(131, 2, 'object (nt_securecam2_01) (1)', 0, 0, 1, 1, NULL, 1622, NULL, 1542.7, -1637, 28.200001, 0, 0, 281, 0, 1, 255),
(132, 2, 'object (Vgs_guardhouse01) (1)', 0, 0, 1, 1, NULL, 8168, NULL, 1547, -1620.3, 14.3, 0, 0, 17, 0, 1, 255),
(133, 2, 'removeWorldObject (billbrdlan_08) (1)', 0, NULL, NULL, NULL, 119.06626, 4230, 4229, 1597.9063, -1699.75, 30.210939, 0, 0, 0, NULL, NULL, NULL),
(134, 2, 'removeWorldObject (BillBd3) (1)', 0, NULL, NULL, NULL, 18.336557, 1260, 1266, 1538.5234, -1609.8047, 19.84375, 0, 0, 0, NULL, NULL, NULL),
(135, 2, 'object (xref_garagedoor) (1)', 0, 0, 1, 1, NULL, 2885, NULL, 1545.1, -1617.5, 15.9, 0, 0, 0.75, 0, 1, 255),
(136, 2, 'object (xref_garagedoor) (4)', 0, 0, 1, 1, NULL, 2885, NULL, 1539.8, -1612.3, 15.9, 0, 0, 270.24701, 0, 1, 255),
(137, 2, 'object (xref_garagedoor) (5)', 0, 0, 1, 1, NULL, 2885, NULL, 1539.8, -1608, 15.9, 0, 0, 270.24701, 0, 1, 255),
(138, 2, 'object (xref_garagedoor) (8)', 0, 0, 1, 1, NULL, 2885, NULL, 1545.1, -1602.5, 15.9, 0, 0, 179.995, 0, 1, 255),
(139, 2, 'object (xref_garagedoor) (9)', 0, 0, 1, 1, NULL, 2885, NULL, 1555.9, -1602.5, 15.9, 0, 0, 179.995, 0, 1, 255),
(140, 2, 'object (xref_garagedoor) (22)', 0, 0, 1, 1, NULL, 2885, NULL, 1602.6, -1637.9, 15.9, 0, 0, 359.98401, 0, 1, 255),
(141, 2, 'object (xref_garagedoor) (23)', 0, 0, 1, 1, NULL, 2885, NULL, 1607.9, -1632.6, 15.9, 0, 0, 89.984001, 0, 1, 255),
(142, 2, 'object (xref_garagedoor) (24)', 0, 0, 1, 1, NULL, 2885, NULL, 1607.9, -1626.5, 15.9, 0, 0, 89.984001, 0, 1, 255),
(143, 2, 'object (xref_garagedoor) (25)', 0, 0, 1, 1, NULL, 2885, NULL, 1607.9, -1618.5, 15.9, 0, 0, 89.984001, 0, 1, 255),
(144, 2, 'object (xref_garagedoor) (26)', 0, 0, 1, 1, NULL, 2885, NULL, 1607.9, -1607.8, 15.9, 0, 0, 89.984001, 0, 1, 255),
(145, 2, 'object (xref_garagedoor) (27)', 0, 0, 1, 1, NULL, 2885, NULL, 1602.6, -1602.6, 15.9, 0, 0, 179.989, 0, 1, 255),
(146, 2, 'object (xref_garagedoor) (28)', 0, 0, 1, 1, NULL, 2885, NULL, 1597, -1602.6, 15.9, 0, 0, 179.989, 0, 1, 255),
(147, 2, 'object (xref_garagedoor) (29)', 0, 0, 1, 1, NULL, 2885, NULL, 1587.4, -1602.6, 15.9, 0, 0, 179.989, 0, 1, 255),
(148, 2, 'object (xref_garagedoor) (30)', 0, 0, 1, 1, NULL, 2885, NULL, 1576.6, -1602.6, 15.9, 0, 0, 179.989, 0, 1, 255),
(149, 2, 'object (xref_garagedoor) (31)', 0, 0, 1, 1, NULL, 2885, NULL, 1566.7, -1602.6, 15.9, 0, 0, 179.989, 0, 1, 255),
(150, 2, 'object (elecfence_BAR) (1)', 0, 0, 1, 1, NULL, 987, NULL, 1540.1, -1617.1, 12.4, 0, 0, 0, 0, 1, 255),
(151, 2, 'object (elecfence_BAR) (2)', 0, 0, 1, 1, NULL, 987, NULL, 1540.2, -1605.4, 12.4, 0, 0, 270, 0, 1, 255),
(152, 2, 'object (elecfence_BAR) (3)', 0, 0, 1, 1, NULL, 987, NULL, 1540.1, -1602.8, 12.4, 0, 0, 270, 0, 1, 255),
(153, 2, 'object (elecfence_BAR) (4)', 0, 0, 1, 1, NULL, 987, NULL, 1552.1, -1602.9, 12.4, 0, 0, 180, 0, 1, 255),
(154, 2, 'object (elecfence_BAR) (9)', 0, 0, 1, 1, NULL, 987, NULL, 1564.1, -1602.9, 12.4, 0, 0, 179.995, 0, 1, 255),
(155, 2, 'object (elecfence_BAR) (10)', 0, 0, 1, 1, NULL, 987, NULL, 1576.1, -1603, 12.4, 0, 0, 179.745, 0, 1, 255),
(156, 2, 'object (elecfence_BAR) (11)', 0, 0, 1, 1, NULL, 987, NULL, 1588, -1603, 12.4, 0, 0, 179.742, 0, 1, 255),
(157, 2, 'object (elecfence_BAR) (12)', 0, 0, 1, 1, NULL, 987, NULL, 1600, -1603, 12.4, 0, 0, 179.992, 0, 1, 255),
(158, 2, 'object (elecfence_BAR) (13)', 0, 0, 1, 1, NULL, 987, NULL, 1607.6, -1603, 12.4, 0, 0, 179.742, 0, 1, 255),
(159, 2, 'object (elecfence_BAR) (14)', 0, 0, 1, 1, NULL, 987, NULL, 1607.5, -1615, 12.4, 0, 0, 89.991997, 0, 1, 255),
(160, 2, 'object (elecfence_BAR) (15)', 0, 0, 1, 1, NULL, 987, NULL, 1607.5, -1627, 12.4, 0, 0, 89.988998, 0, 1, 255),
(161, 2, 'object (elecfence_BAR) (16)', 0, 0, 1, 1, NULL, 987, NULL, 1607.5, -1637.5, 12.4, 0, 0, 89.988998, 0, 1, 255),
(162, 2, 'object (elecfence_BAR) (17)', 0, 0, 1, 1, NULL, 987, NULL, 1595.3, -1637.5, 12.4, 0, 0, 359.98901, 0, 1, 255),
(163, 2, 'object (vgElkup) (1)', 0, 0, 1, 1, NULL, 8947, NULL, 1552.1, -1610, 15.4, 0, 0, 90, 0, 1, 255),
(164, 2, 'object (elecfence_BAR) (18)', 0, 0, 1, 1, NULL, 987, NULL, 1545.2, -1632.8, 12.4, 0, 0, 269.742, 0, 1, 255),
(165, 2, 'object (trafficcone) (1)', 0, 0, 1, 1, NULL, 1238, NULL, 1544.7, -1623.2, 12.7, 0, 0, 0, 0, 1, 255),
(166, 2, 'object (fenceshit3) (1)', 0, 0, 1, 1, NULL, 983, NULL, 1553.7, -1617.5, 13.2, 0, 0, 89.25, 0, 1, 255),
(167, 2, 'object (fenceshit3) (2)', 0, 0, 1, 1, NULL, 983, NULL, 1560.1, -1617.6, 13.2, 0, 0, 89.247002, 0, 1, 255),
(168, 2, 'object (fenceshit3) (3)', 0, 0, 1, 1, NULL, 983, NULL, 1566.5, -1617.7, 13.2, 0, 0, 89.247002, 0, 1, 255),
(169, 2, 'object (fenceshit3) (4)', 0, 0, 1, 1, NULL, 983, NULL, 1572.9, -1617.8, 13.2, 0, 0, 89.747002, 0, 1, 255),
(170, 2, 'object (kmb_lockeddoor) (1)', 0, 0, 1, 1, NULL, 2949, NULL, 1584.1, -1637.9, 14.88, 0, 0, 270, 0, 1, 255),
(171, 2, 'object (kmb_lockeddoor) (2)', 0, 0, 1, 1, NULL, 2949, NULL, 1584.0996, -1637.9004, 12.4, 0, 0, 270, 0, 1, 255),
(172, 2, 'object (chinaTgate) (1)', 0, 0, 1, 1, NULL, 2930, NULL, 1577.3, -1635.8, 15.2, 0, 0, 0, 0, 1, 255),
(174, 4, 'object (DYN_GARRAGE2) (1)', 0, 0, 1, 1, NULL, 1483, NULL, 1100.6, -1773.7, 14.3, 0, 0, 179.5, 0, 1, 255),
(175, 4, 'object (DYN_GARRAGE2) (2)', 0, 0, 1, 1, NULL, 1483, NULL, 1100.7, -1767, 14.3, 0, 0, 179.245, 0, 1, 255),
(176, 4, 'object (DYN_GARRAGE2) (3)', 0, 0, 1, 1, NULL, 1483, NULL, 1100.8, -1760.3, 14.3, 0, 0, 179.242, 0, 1, 255),
(177, 4, 'object (DYN_GARRAGE2) (4)', 0, 0, 1, 1, NULL, 1483, NULL, 1100.8, -1756.9, 14.3, 0, 0, 179.242, 0, 1, 255),
(178, 4, 'object (DYN_GARRAGE2) (5)', 0, 0, 1, 1, NULL, 1483, NULL, 1082.5, -1773.5, 14.1, 0, 0, 359.492, 0, 1, 255),
(179, 4, 'object (DYN_GARRAGE2) (8)', 0, 0, 1, 1, NULL, 1483, NULL, 1082.6, -1760.1, 14.1, 0, 0, 359.23901, 0, 1, 255),
(180, 4, 'object (DYN_GARRAGE2) (9)', 0, 0, 1, 1, NULL, 1483, NULL, 1082.5, -1766.8, 14.1, 0, 0, 359.48901, 0, 1, 255),
(181, 4, 'object (DYN_GARRAGE2) (10)', 0, 0, 1, 1, NULL, 1483, NULL, 1082.6, -1756.8, 14.1, 0, 0, 359.23599, 0, 1, 255),
(182, 4, 'object (fencesmallb) (1)', 0, 0, 1, 1, NULL, 970, NULL, 1082.7, -1752.8, 12.9, 0, 0, 0, 0, 1, 255),
(183, 4, 'object (fencesmallb) (3)', 0, 0, 1, 1, NULL, 970, NULL, 1076.6, -1752.8, 12.9, 0, 0, 0, 0, 1, 255),
(184, 4, 'object (fencesmallb) (4)', 0, 0, 1, 1, NULL, 970, NULL, 1074.3, -1750.5, 12.9, 0, 0, 270, 0, 1, 255),
(185, 4, 'object (fencesmallb) (5)', 0, 0, 1, 1, NULL, 970, NULL, 1087.4, -1750.5, 12.9, 0, 0, 270, 0, 1, 255),
(186, 4, 'object (fencesmallb) (6)', 0, 0, 1, 1, NULL, 970, NULL, 1085.1, -1748, 12.9, 0, 0, 0, 0, 1, 255),
(187, 4, 'object (fencesmallb) (7)', 0, 0, 1, 1, NULL, 970, NULL, 1080.7998, -1748, 12.9, 0, 0, 0, 0, 1, 255),
(188, 4, 'object (fencesmallb) (8)', 0, 0, 1, 1, NULL, 970, NULL, 1076.5, -1748, 12.9, 0, 0, 0, 0, 1, 255),
(189, 4, 'object (fencesmallb) (10)', 0, 0, 1, 1, NULL, 970, NULL, 1099.8, -1752.9, 12.9, 0, 0, 0, 0, 1, 255),
(190, 4, 'object (fencesmallb) (11)', 0, 0, 1, 1, NULL, 970, NULL, 1096.7, -1752.9, 12.9, 0, 0, 0, 0, 1, 255),
(191, 4, 'object (fencesmallb) (12)', 0, 0, 1, 1, NULL, 970, NULL, 1100, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(192, 4, 'object (fencesmallb) (13)', 0, 0, 1, 1, NULL, 970, NULL, 1081.3, -1754.7, 12.9, 0, 0, 269.75, 0, 1, 255),
(193, 4, 'object (fencesmallb) (14)', 0, 0, 1, 1, NULL, 970, NULL, 1081.2, -1758.6, 12.9, 0, 0, 269.74701, 0, 1, 255),
(194, 4, 'object (fencesmallb) (15)', 0, 0, 1, 1, NULL, 970, NULL, 1081.2, -1762.7, 12.9, 0, 0, 269.74701, 0, 1, 255),
(195, 4, 'object (fencesmallb) (16)', 0, 0, 1, 1, NULL, 970, NULL, 1081.2, -1766.9, 12.9, 0, 0, 269.74701, 0, 1, 255),
(196, 4, 'object (fencesmallb) (17)', 0, 0, 1, 1, NULL, 970, NULL, 1081.1, -1770.9, 12.9, 0, 0, 269.74701, 0, 1, 255),
(197, 4, 'object (fencesmallb) (18)', 0, 0, 1, 1, NULL, 970, NULL, 1081.1, -1775, 12.9, 0, 0, 269.74701, 0, 1, 255),
(198, 4, 'object (fencesmallb) (19)', 0, 0, 1, 1, NULL, 970, NULL, 1102.1, -1775.2, 12.9, 0, 0, 269.74701, 0, 1, 255),
(199, 4, 'object (fencesmallb) (20)', 0, 0, 1, 1, NULL, 970, NULL, 1102.1, -1771, 12.9, 0, 0, 269.74701, 0, 1, 255),
(200, 4, 'object (fencesmallb) (21)', 0, 0, 1, 1, NULL, 970, NULL, 1102.1, -1766.9, 12.9, 0, 0, 269.74701, 0, 1, 255),
(201, 4, 'object (fencesmallb) (22)', 0, 0, 1, 1, NULL, 970, NULL, 1102.1, -1762.8, 12.9, 0, 0, 269.74701, 0, 1, 255),
(202, 4, 'object (fencesmallb) (23)', 0, 0, 1, 1, NULL, 970, NULL, 1102.1, -1758.7, 12.9, 0, 0, 269.74701, 0, 1, 255),
(203, 4, 'object (fencesmallb) (24)', 0, 0, 1, 1, NULL, 970, NULL, 1102, -1754.7002, 12.9, 0, 0, 269.742, 0, 1, 255),
(204, 4, 'object (fencesmallb) (25)', 0, 0, 1, 1, NULL, 970, NULL, 1095.8, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(205, 4, 'object (fencesmallb) (26)', 0, 0, 1, 1, NULL, 970, NULL, 1089.8, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(206, 4, 'object (fencesmallb) (27)', 0, 0, 1, 1, NULL, 970, NULL, 1085.6, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(207, 4, 'object (fencesmallb) (28)', 0, 0, 1, 1, NULL, 970, NULL, 1081.4, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(208, 4, 'object (fencesmallb) (29)', 0, 0, 1, 1, NULL, 970, NULL, 1077.2, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(209, 4, 'object (fencesmallb) (30)', 0, 0, 1, 1, NULL, 970, NULL, 1073.1, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(210, 4, 'object (fencesmallb) (32)', 0, 0, 1, 1, NULL, 970, NULL, 1064.9, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(211, 4, 'object (fencesmallb) (33)', 0, 0, 1, 1, NULL, 970, NULL, 1061.2, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(212, 4, 'object (fencesmallb) (34)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1775.3, 13.1, 0, 0, 269.75, 0, 1, 255),
(213, 4, 'object (fencesmallb) (35)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1771.2, 13.1, 0, 0, 269.74701, 0, 1, 255),
(214, 4, 'object (fencesmallb) (36)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1767.1, 13.1, 0, 0, 269.74701, 0, 1, 255),
(215, 4, 'object (fencesmallb) (37)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1763, 13.1, 0, 0, 269.74701, 0, 1, 255),
(216, 4, 'object (fencesmallb) (38)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1758.9, 13.1, 0, 0, 269.74701, 0, 1, 255),
(217, 4, 'object (fencesmallb) (39)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1754.8, 13.1, 0, 0, 269.74701, 0, 1, 255),
(218, 4, 'object (fencesmallb) (40)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1750.7, 13.1, 0, 0, 269.74701, 0, 1, 255),
(219, 4, 'object (fencesmallb) (41)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1746.6, 13.1, 0, 0, 269.74701, 0, 1, 255),
(220, 4, 'object (fencesmallb) (42)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1742.5, 13.1, 0, 0, 269.74701, 0, 1, 255),
(221, 4, 'object (fencesmallb) (43)', 0, 0, 1, 1, NULL, 970, NULL, 1059, -1738.3, 13.1, 0, 0, 269.74701, 0, 1, 255),
(222, 4, 'object (fencesmallb) (44)', 0, 0, 1, 1, NULL, 970, NULL, 1061.3, -1735.6, 13, 0, 0, 179.24699, 0, 1, 255),
(223, 4, 'object (fencesmallb) (45)', 0, 0, 1, 1, NULL, 970, NULL, 1065.5, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(224, 4, 'object (fencesmallb) (46)', 0, 0, 1, 1, NULL, 970, NULL, 1071.1, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(225, 4, 'object (fencesmallb) (47)', 0, 0, 1, 1, NULL, 970, NULL, 1075.2, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(226, 4, 'object (fencesmallb) (48)', 0, 0, 1, 1, NULL, 970, NULL, 1079.3, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(227, 4, 'object (fencesmallb) (49)', 0, 0, 1, 1, NULL, 970, NULL, 1083.4004, -1735.5996, 13, 0, 0, 0, 0, 1, 255),
(228, 4, 'object (fencesmallb) (50)', 0, 0, 1, 1, NULL, 970, NULL, 1087.5, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(229, 4, 'object (fencesmallb) (51)', 0, 0, 1, 1, NULL, 970, NULL, 1091.6, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(230, 4, 'object (fencesmallb) (52)', 0, 0, 1, 1, NULL, 970, NULL, 1095.8, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(231, 4, 'object (fencesmallb) (53)', 0, 0, 1, 1, NULL, 970, NULL, 1099.9, -1735.6, 13, 0, 0, 0, 0, 1, 255),
(232, 4, 'object (fencesmallb) (54)', 0, 0, 1, 1, NULL, 970, NULL, 1071, -1777.3, 13, 0, 0, 0, 0, 1, 255),
(233, 4, 'object (bollardlight) (1)', 0, 0, 1, 0, NULL, 1215, NULL, 1102.3, -1749.3, 13.1, 0, 0, 0, 0, 1, 255),
(234, 4, 'object (bollardlight) (2)', 0, 0, 1, 0, NULL, 1215, NULL, 1087.6, -1752.7, 12.9, 0, 0, 0, 0, 1, 255),
(235, 4, 'object (bollardlight) (3)', 0, 0, 1, 0, NULL, 1215, NULL, 1102.1, -1735.6, 13.2, 0, 0, 0, 0, 1, 255),
(236, 4, 'object (bollardlight) (4)', 0, 0, 1, 0, NULL, 1215, NULL, 1093.6, -1777.3, 13.1, 0, 0, 0, 0, 1, 255),
(237, 4, 'object (bollardlight) (5)', 0, 0, 1, 0, NULL, 1215, NULL, 1092, -1777.3, 13.1, 0, 0, 0, 0, 1, 255),
(238, 4, 'object (bollardlight) (6)', 0, 0, 1, 0, NULL, 1215, NULL, 1068.8, -1777.3, 13.1, 0, 0, 0, 0, 1, 255),
(239, 4, 'object (bollardlight) (7)', 0, 0, 1, 0, NULL, 1215, NULL, 1067.1, -1777.3, 13.1, 0, 0, 0, 0, 1, 255),
(240, 4, 'object (bar_gatebar01) (1)', 0, 0, 1, 1, NULL, 966, NULL, 1087.5, -1753.1, 12.4, 0, 0, 180, 0, 1, 255),
(241, 4, 'object (smashbar) (1)', 0, 0, 1, 1, NULL, 1251, NULL, 1090.9, -1753, 12.4, 0, 0, 90, 0, 1, 255),
(242, 4, 'object (smashbar) (2)', 0, 0, 1, 1, NULL, 1251, NULL, 1090.9, -1753.1, 12.4, 0, 0, 270, 0, 1, 255),
(243, 4, 'object (bar_gatebox01) (1)', 0, 0, 1, 1, NULL, 967, NULL, 1086.5, -1752.6, 12.4, 0, 0, 90, 0, 1, 255),
(244, 4, 'object (fencesmallb) (9)', 0, 0, 1, 1, NULL, 970, NULL, 1078.6, -1752.8, 12.9, 0, 0, 0, 0, 1, 255),
(245, 4, 'object (fencesmallb) (31)', 0, 0, 1, 1, NULL, 970, NULL, 1084.5, -1750.9, 12.9, 0, 0, 99.5, 0, 1, 255),
(246, 4, 'object (fencesmallb) (55)', 0, 0, 1, 1, NULL, 970, NULL, 1102.1, -1751.4, 13, 0, 0, 269.742, 0, 1, 255),
(247, 4, 'object (bollardlight) (8)', 0, 0, 1, 0, NULL, 1215, NULL, 1094.5, -1752.9004, 12.9, 0, 0, 0, 0, 1, 255),
(248, 4, 'object (Streetlamp1) (1)', 0, 0, 1, 1, NULL, 1232, NULL, 1059, -1735.9, 15.3, 0, 0, 0, 0, 1, 255),
(249, 4, 'object (Streetlamp1) (2)', 0, 0, 1, 1, NULL, 1232, NULL, 1058.3, -1746.7, 15.3, 0, 0, 0, 0, 1, 255),
(250, 4, 'object (Streetlamp1) (3)', 0, 0, 1, 1, NULL, 1232, NULL, 1058.4, -1756.9, 15.3, 0, 0, 0, 0, 1, 255),
(251, 4, 'object (Streetlamp1) (4)', 0, 0, 1, 1, NULL, 1232, NULL, 1058.3, -1766.9, 15.3, 0, 0, 0, 0, 1, 255),
(252, 4, 'object (Streetlamp1) (5)', 0, 0, 1, 1, NULL, 1232, NULL, 1058.5, -1777.5, 15.3, 0, 0, 0, 0, 1, 255),
(253, 4, 'object (Streetlamp1) (6)', 0, 0, 1, 1, NULL, 1232, NULL, 1102.6, -1777.5, 15.3, 0, 0, 0, 0, 1, 255),
(254, 4, 'object (Streetlamp1) (7)', 0, 0, 1, 1, NULL, 1232, NULL, 1102.8, -1768.6, 15.3, 0, 0, 0, 0, 1, 255),
(255, 4, 'object (Streetlamp1) (8)', 0, 0, 1, 1, NULL, 1232, NULL, 1102.7, -1757.1, 15.3, 0, 0, 0, 0, 1, 255),
(256, 5, 'object (kb_canopy_test) (1)', 0, 0, 1, 1, NULL, 642, NULL, 1928.9, -1764.3, 14, 0, 0, 0, 0, 1, 255),
(257, 5, 'object (chairsntable) (1)', 0, 0, 1, 1, NULL, 1594, NULL, 1928.9, -1764.3, 13, 0, 0, 0, 0, 1, 255),
(258, 5, 'object (chairsntable) (2)', 0, 0, 1, 1, NULL, 1594, NULL, 1925.6, -1764.3, 13, 0, 0, 0, 0, 1, 255),
(259, 5, 'object (kb_canopy_test) (2)', 0, 0, 1, 1, NULL, 642, NULL, 1925.6, -1764.3, 14, 0, 0, 0, 0, 1, 255),
(260, 5, 'object (kb_planter_bush2) (1)', 0, 0, 1, 1, NULL, 640, NULL, 1928.7998, -1762.2998, 13.3, 0, 0, 270, 0, 1, 255),
(261, 5, 'object (kb_planter_bush2) (2)', 0, 0, 1, 1, NULL, 640, NULL, 1923.4, -1762.3, 13.3, 0, 0, 270, 0, 1, 255),
(262, 5, 'object (kb_planter_bush2) (3)', 0, 0, 1, 1, NULL, 640, NULL, 1920.4, -1764.6, 13.3, 0, 0, 180, 0, 1, 255),
(263, 5, 'object (chairsntable) (3)', 0, 0, 1, 1, NULL, 1594, NULL, 1922.3, -1764.4, 13, 0, 0, 0, 0, 1, 255),
(264, 5, 'object (kb_canopy_test) (3)', 0, 0, 1, 1, NULL, 642, NULL, 1922.3, -1764.4, 14, 0, 0, 0, 0, 1, 255),
(265, 5, 'object (CJ_BUSH_PROP) (1)', 0, 0, 1, 1, NULL, 1364, NULL, 1929, -1769.7, 13.2, 0, 0, 90, 0, 1, 255),
(266, 5, 'object (CJ_BUSH_PROP) (2)', 0, 0, 1, 1, NULL, 1364, NULL, 1928.9, -1782.4, 13.2, 0, 0, 90, 0, 1, 255),
(267, 5, 'object (CJ_PHONE_KIOSK2) (1)', 0, 0, 1, 1, NULL, 1346, NULL, 1917.5, -1765.5996, 13.9, 0, 0, 180.748, 0, 1, 255),
(268, 5, 'object (bollardlight) (1)', 0, 0, 1, 1, NULL, 1215, NULL, 1920.4004, -1762.4004, 13.5, 0, 0, 0, 0, 1, 255),
(269, 5, 'object (bollardlight) (2)', 0, 0, 1, 1, NULL, 1215, NULL, 1926.0996, -1762.2998, 13.5, 0, 0, 0, 0, 1, 255),
(270, 5, 'object (bollardlight) (3)', 0, 0, 1, 1, NULL, 1215, NULL, 1931.2998, -1762.4004, 13.5, 0, 0, 0, 0, 1, 255),
(271, 5, 'object (bollardlight) (4)', 0, 0, 1, 1, NULL, 1215, NULL, 1920.4, -1765.9, 13.5, 0, 0, 0, 0, 1, 255),
(272, 5, 'object (bollardlight) (5)', 0, 0, 1, 1, NULL, 1215, NULL, 1941.5996, -1765, 13.1, 0, 0, 0, 0, 1, 255),
(273, 5, 'object (bollardlight) (6)', 0, 0, 1, 1, NULL, 1215, NULL, 1941.5, -1780.7998, 13.1, 0, 0, 0, 0, 1, 255),
(274, 5, 'object (fencesmallb) (1)', 0, 0, 1, 1, NULL, 970, NULL, 1941.1, -1766.6, 12.9, 0, 0, 270, 0, 1, 255),
(275, 5, 'object (fencesmallb) (2)', 0, 0, 1, 1, NULL, 970, NULL, 1941.1, -1770.8, 12.9, 0, 0, 270, 0, 1, 255),
(276, 5, 'object (fencesmallb) (3)', 0, 0, 1, 1, NULL, 970, NULL, 1941.1, -1774.9, 12.9, 0, 0, 270, 0, 1, 255),
(277, 5, 'object (fencesmallb) (4)', 0, 0, 1, 1, NULL, 970, NULL, 1941.1, -1779, 12.9, 0, 0, 270, 0, 1, 255),
(278, 5, 'object (fencesmallb) (5)', 0, 0, 1, 1, NULL, 970, NULL, 1942.2, -1778.9, 12.9, 0, 0, 270, 0, 1, 255),
(279, 5, 'object (fencesmallb) (6)', 0, 0, 1, 1, NULL, 970, NULL, 1942.2, -1774.8, 12.9, 0, 0, 270, 0, 1, 255),
(280, 5, 'object (fencesmallb) (7)', 0, 0, 1, 1, NULL, 970, NULL, 1942.2, -1770.7, 12.9, 0, 0, 270, 0, 1, 255),
(281, 5, 'object (fencesmallb) (8)', 0, 0, 1, 1, NULL, 970, NULL, 1942.2, -1766.6, 12.9, 0, 0, 270, 0, 1, 255),
(282, 5, 'object (CJ_BUSH_PROP) (3)', 0, 0, 1, 1, NULL, 1364, NULL, 1952.3, -1768.1, 13.2, 0, 0, 90, 0, 1, 255),
(283, 5, 'object (CJ_BUSH_PROP) (4)', 0, 0, 1, 1, NULL, 1364, NULL, 1952.3, -1764, 13.2, 0, 0, 90, 0, 1, 255),
(284, 5, 'object (CJ_BUSH_PROP) (5)', 0, 0, 1, 1, NULL, 1364, NULL, 1952.3, -1772.2, 13.2, 0, 0, 90, 0, 1, 255),
(285, 5, 'object (CJ_BUSH_PROP) (6)', 0, 0, 1, 1, NULL, 1364, NULL, 1952.3, -1776.3, 13.2, 0, 0, 90, 0, 1, 255),
(286, 5, 'object (sm_bevhiltreepv) (1)', 0, 0, 1, 1, NULL, 717, NULL, 1951.7, -1766, 12.6, 0, 0, 0, 0, 1, 255),
(287, 5, 'object (sm_bevhiltreepv) (2)', 0, 0, 1, 1, NULL, 717, NULL, 1951.7, -1770.1, 12.6, 0, 0, 0, 0, 1, 255),
(288, 5, 'object (sm_bevhiltreepv) (3)', 0, 0, 1, 1, NULL, 717, NULL, 1951.7, -1774.2, 12.6, 0, 0, 0, 0, 1, 255),
(289, 5, 'object (bollardlight) (7)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.2, -1777.9, 14, 0, 0, 0, 0, 1, 255),
(290, 5, 'object (bollardlight) (8)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.2, -1774.7, 14, 0, 0, 0, 0, 1, 255),
(291, 5, 'object (bollardlight) (9)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.2, -1773.6, 14, 0, 0, 0, 0, 1, 255),
(292, 5, 'object (bollardlight) (10)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.2, -1770.7, 14, 0, 0, 0, 0, 1, 255),
(293, 5, 'object (bollardlight) (11)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.2, -1769.6, 14, 0, 0, 0, 0, 1, 255),
(294, 5, 'object (bollardlight) (12)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.3, -1766.5, 14, 0, 0, 0, 0, 1, 255),
(295, 5, 'object (bollardlight) (13)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.3, -1765.5, 14, 0, 0, 0, 0, 1, 255),
(296, 5, 'object (bollardlight) (14)', 0, 0, 1, 1, NULL, 1215, NULL, 1952.3, -1762.5, 14, 0, 0, 0, 0, 1, 255),
(297, 5, 'object (Streetlamp1) (1)', 0, 0, 1, 1, NULL, 1232, NULL, 1949.8, -1796.9, 15.2, 0, 0, 0, 0, 1, 255),
(298, 5, 'object (Streetlamp1) (2)', 0, 0, 1, 1, NULL, 1232, NULL, 1941.1, -1797, 15.2, 0, 0, 0, 0, 1, 255),
(299, 5, 'object (Streetlamp1) (3)', 0, 0, 1, 1, NULL, 1232, NULL, 1932.4, -1796.9, 15.2, 0, 0, 0, 0, 1, 255),
(300, 5, 'object (Streetlamp1) (4)', 0, 0, 1, 1, NULL, 1232, NULL, 1912.9, -1796.9, 15.2, 0, 0, 0, 0, 1, 255),
(301, 5, 'object (Streetlamp1) (5)', 0, 0, 1, 1, NULL, 1232, NULL, 1904, -1790.5, 15.2, 0, 0, 0, 0, 1, 255),
(302, 5, 'object (Streetlamp1) (6)', 0, 0, 1, 1, NULL, 1232, NULL, 1903.9, -1781.2, 15.2, 0, 0, 0, 0, 1, 255),
(303, 5, 'object (Streetlamp1) (7)', 0, 0, 1, 1, NULL, 1232, NULL, 1904, -1771.3, 15.2, 0, 0, 0, 0, 1, 255),
(304, 5, 'object (Streetlamp1) (8)', 0, 0, 1, 1, NULL, 1232, NULL, 1904, -1762.3, 15.2, 0, 0, 0, 0, 1, 255),
(305, 5, 'object (shbbyhswall13_lvs) (1)', 0, 0, 1, 1, NULL, 9131, NULL, 1908.7, -1772.2, 13.5, 0, 0, 0, 0, 1, 255),
(306, 5, 'object (shbbyhswall13_lvs) (2)', 0, 0, 1, 1, NULL, 9131, NULL, 1908.7, -1772.2, 15.7, 0, 0, 0, 0, 1, 255),
(307, 5, 'object (shbbyhswall13_lvs) (3)', 0, 0, 1, 1, NULL, 9131, NULL, 1913.7, -1772.2, 13.5, 0, 0, 1, 0, 1, 255),
(308, 5, 'object (shbbyhswall13_lvs) (5)', 0, 0, 1, 1, NULL, 9131, NULL, 1913.7, -1772.2, 15.7, 0, 0, 1, 0, 1, 255),
(309, 5, 'object (shbbyhswall13_lvs) (6)', 0, 0, 1, 1, NULL, 9131, NULL, 1908.8, -1780.5, 13.4, 0, 0, 0, 0, 1, 255),
(310, 5, 'object (shbbyhswall13_lvs) (7)', 0, 0, 1, 1, NULL, 9131, NULL, 1908.8, -1780.5, 15.6, 0, 0, 0, 0, 1, 255),
(311, 5, 'object (shbbyhswall13_lvs) (8)', 0, 0, 1, 1, NULL, 9131, NULL, 1913.8, -1780.5, 15.6, 0, 0, 0, 0, 1, 255),
(312, 5, 'object (shbbyhswall13_lvs) (9)', 0, 0, 1, 1, NULL, 9131, NULL, 1913.8, -1780.5, 13.4, 0, 0, 0, 0, 1, 255),
(313, 5, 'object (bollardlight) (15)', 0, 0, 1, 1, NULL, 1215, NULL, 1913.5, -1771.5, 12.8, 0, 0, 0, 0, 1, 255),
(314, 5, 'object (bollardlight) (16)', 0, 0, 1, 1, NULL, 1215, NULL, 1908.7998, -1771.5996, 12.8, 0, 0, 0, 0, 1, 255),
(315, 5, 'object (bollardlight) (17)', 0, 0, 1, 1, NULL, 1215, NULL, 1908.9004, -1781.0996, 13, 0, 0, 0, 0, 1, 255),
(316, 5, 'object (bollardlight) (18)', 0, 0, 1, 1, NULL, 1215, NULL, 1913.5996, -1781.0996, 13, 0, 0, 0, 0, 1, 255),
(317, 5, 'object (csrsfence02_lvs) (1)', 0, 0, 1, 1, NULL, 8674, NULL, 1901.7002, -1792.9004, 13.6, 0, 0, 296.99899, 0, 1, 255),
(318, 5, 'object (fencesmallb) (9)', 0, 0, 1, 1, NULL, 970, NULL, 1830.4, -1746.2, 13.1, 0, 0, 340.25, 0, 1, 255),
(319, 5, 'object (fencesmallb) (10)', 0, 0, 1, 1, NULL, 970, NULL, 1827.7, -1743.6, 13.1, 0, 0, 291.24899, 0, 1, 255),
(320, 5, 'object (fencesmallb) (11)', 0, 0, 1, 1, NULL, 970, NULL, 1827, -1739.6, 13.1, 0, 0, 268.74799, 0, 1, 255),
(321, 5, 'object (fencesmallb) (12)', 0, 0, 1, 1, NULL, 970, NULL, 1834.4, -1746.9, 13.1, 0, 0, 359.746, 0, 1, 255),
(322, 5, 'object (fencesmallb) (13)', 0, 0, 1, 1, NULL, 970, NULL, 1809.6, -1737.5, 13.1, 0, 0, 179.498, 0, 1, 255),
(323, 5, 'object (fencesmallb) (14)', 0, 0, 1, 1, NULL, 970, NULL, 1813.5, -1738.5, 13.1, 0, 0, 152.245, 0, 1, 255),
(324, 5, 'object (fencesmallb) (15)', 0, 0, 1, 1, NULL, 970, NULL, 1815.8, -1741.5, 13.1, 0, 0, 102.993, 0, 1, 255),
(325, 5, 'object (bollardlight) (19)', 0, 0, 1, 1, NULL, 1215, NULL, 1836.5996, -1746.9004, 13.1, 0, 0, 0, 0, 1, 255),
(326, 5, 'object (bollardlight) (20)', 0, 0, 1, 1, NULL, 1215, NULL, 1827.0996, -1737.4004, 13.1, 0, 0, 0, 0, 1, 255),
(327, 5, 'object (bollardlight) (21)', 0, 0, 1, 1, NULL, 1215, NULL, 1816.2002, -1747.9004, 13.1, 0, 0, 0, 0, 1, 255),
(328, 5, 'object (bollardlight) (22)', 0, 0, 1, 0, NULL, 1215, NULL, 1803.0996, -1737.5996, 13.1, 0, 0, 0, 0, 1, 255),
(329, 5, 'removeWorldObject (MTraffic1) (1)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1816.0009, -1740.5562, 18.336491, 0, 0, 0, NULL, NULL, NULL),
(330, 5, 'removeWorldObject (MTraffic1) (2)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1833.3571, -1746.4285, 18.50658, 0, 0, 0, NULL, NULL, NULL),
(331, 5, 'removeWorldObject (MTraffic1) (3)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1827.7346, -1762.8519, 17.97472, 0, 0, 0, NULL, NULL, NULL),
(332, 5, 'object (fencesmallb) (16)', 0, 0, 1, 1, NULL, 970, NULL, 1816.3, -1745.6, 13.1, 0, 0, 91.490997, 0, 1, 255),
(333, 5, 'object (fencesmallb) (17)', 0, 0, 1, 1, NULL, 970, NULL, 1805.5, -1737.5, 13.1, 0, 0, 180.495, 0, 1, 255),
(334, 5, 'object (fencesmallb) (18)', 0, 0, 1, 1, NULL, 970, NULL, 1809.9004, -1727, 13.1, 0, 0, 181.741, 0, 1, 255),
(335, 5, 'object (fencesmallb) (19)', 0, 0, 1, 1, NULL, 970, NULL, 1813.7002, -1725.9004, 13.1, 0, 0, 211.24001, 0, 1, 255),
(336, 5, 'object (fencesmallb) (20)', 0, 0, 1, 1, NULL, 970, NULL, 1815.8, -1722.8, 13.1, 0, 0, 260.48999, 0, 1, 255),
(337, 5, 'object (fencesmallb) (21)', 0, 0, 1, 1, NULL, 970, NULL, 1816.2, -1718.7, 13.1, 0, 0, 267.73599, 0, 1, 255),
(338, 5, 'object (bollardlight) (23)', 0, 0, 1, 1, NULL, 1215, NULL, 1807.5996, -1727, 13.1, 0, 0, 0, 0, 1, 255),
(339, 5, 'object (bollardlight) (24)', 0, 0, 1, 1, NULL, 1215, NULL, 1816.2002, -1716.2998, 13.1, 0, 0, 0, 0, 1, 255),
(340, 5, 'object (fencesmallb) (22)', 0, 0, 1, 1, NULL, 970, NULL, 1827, -1764.4004, 13.1, 0, 0, 90.241997, 0, 1, 255),
(341, 5, 'object (fencesmallb) (23)', 0, 0, 1, 1, NULL, 970, NULL, 1828, -1760.5, 13.1, 0, 0, 60.742001, 0, 1, 255),
(342, 5, 'object (fencesmallb) (24)', 0, 0, 1, 1, NULL, 970, NULL, 1831, -1758.2, 13.1, 0, 0, 13.738, 0, 1, 255),
(343, 5, 'object (fencesmallb) (25)', 0, 0, 1, 1, NULL, 970, NULL, 1835.1, -1757.7, 13.1, 0, 0, 0.483, 0, 1, 255),
(344, 5, 'object (bollardlight) (25)', 0, 0, 1, 1, NULL, 1215, NULL, 1827.0996, -1766.7002, 13.1, 0, 0, 0, 0, 1, 255),
(345, 5, 'object (bollardlight) (26)', 0, 0, 1, 1, NULL, 1215, NULL, 1837.4004, -1757.7998, 13.1, 0, 0, 0, 0, 1, 255),
(346, 5, 'object (fencesmallb) (26)', 0, 0, 1, 1, NULL, 970, NULL, 1914.4, -1764.2, 13.1, 0, 0, 270, 0, 1, 255),
(347, 5, 'object (fencesmallb) (27)', 0, 0, 1, 1, NULL, 970, NULL, 1908.5, -1769.5996, 13.1, 0, 0, 270, 0, 1, 255),
(348, 5, 'object (fencesmallb) (28)', 0, 0, 1, 1, NULL, 970, NULL, 1908.5, -1765.5, 13.1, 0, 0, 270, 0, 1, 255),
(349, 5, 'object (fencesmallb) (29)', 0, 0, 1, 1, NULL, 970, NULL, 1908.5, -1763.9, 13.1, 0, 0, 270, 0, 1, 255),
(350, 5, 'object (bollardlight) (27)', 0, 0, 1, 1, NULL, 1215, NULL, 1914.4004, -1762, 13.1, 0, 0, 0, 0, 1, 255),
(351, 5, 'object (bollardlight) (28)', 0, 0, 1, 1, NULL, 1215, NULL, 1908.5, -1761.7998, 13.1, 0, 0, 0, 0, 1, 255),
(352, 5, 'object (fencesmallb) (30)', 0, 0, 1, 1, NULL, 970, NULL, 1908.4004, -1783, 13.1, 0, 0, 270, 0, 1, 255),
(353, 5, 'object (fencesmallb) (31)', 0, 0, 1, 1, NULL, 970, NULL, 1908.4, -1787.1, 13.1, 0, 0, 270, 0, 1, 255),
(354, 5, 'object (fencesmallb) (32)', 0, 0, 1, 1, NULL, 970, NULL, 1908.4, -1790.3, 13.1, 0, 0, 270, 0, 1, 255),
(355, 5, 'object (fencesmallb) (33)', 0, 0, 1, 1, NULL, 970, NULL, 1910.3, -1793.2, 13.1, 0, 0, 338, 0, 1, 255),
(356, 5, 'object (csrsfence02_lvs) (2)', 0, 0, 1, 1, NULL, 8674, NULL, 1946.6, -1826.6, 13.1, 0, 0, 346.49899, 0, 1, 255),
(357, 5, 'object (csrsfence02_lvs) (3)', 0, 0, 1, 1, NULL, 8674, NULL, 1936.6, -1824.2, 13.1, 0, 0, 346.49799, 0, 1, 255),
(358, 5, 'object (csrsfence02_lvs) (4)', 0, 0, 1, 1, NULL, 8674, NULL, 1926.5, -1822.2, 13.1, 0, 0, 350.74799, 0, 1, 255),
(359, 5, 'object (csrsfence02_lvs) (5)', 0, 0, 1, 1, NULL, 8674, NULL, 1916.3, -1820.5, 13.1, 0, 0, 350.49399, 0, 1, 255),
(360, 5, 'object (csrsfence02_lvs) (6)', 0, 0, 1, 1, NULL, 8674, NULL, 1903.7, -1813.2, 13.1, 0, 0, 268.99399, 0, 1, 255),
(361, 5, 'object (csrsfence02_lvs) (7)', 0, 0, 1, 1, NULL, 8674, NULL, 1906.1, -1818.8, 13.1, 0, 0, 350.73901, 0, 1, 255),
(362, 5, 'object (bar_gatebox01) (1)', 0, 0, 1, 1, NULL, 967, NULL, 1904.6, -1798.4, 12.5, 0, 0, 180, 0, 1, 255),
(363, 5, 'object (bar_gatebar01) (1)', 0, 0, 1, 1, NULL, 966, NULL, 1904, -1800.2, 12.5, 0, 0, 88.75, 0, 1, 255),
(364, 5, 'object (fencesmallb) (35)', 0, 0, 1, 1, NULL, 970, NULL, 1951.7, -1826.1, 13.1, 0, 0, 270, 0, 1, 255),
(365, 5, 'object (csrsfence02_lvs) (8)', 0, 0, 1, 1, NULL, 8674, NULL, 1896, -1816.7, 13.1, 0, 0, 345.73901, 0, 1, 255),
(366, 5, 'object (csrsfence02_lvs) (9)', 0, 0, 1, 1, NULL, 8674, NULL, 1886, -1814.2, 13.1, 0, 0, 345.98401, 0, 1, 255),
(367, 5, 'object (csrsfence02_lvs) (10)', 0, 0, 1, 1, NULL, 8674, NULL, 1876, -1811.8, 13.1, 0, 0, 346.98099, 0, 1, 255),
(368, 5, 'object (csrsfence02_lvs) (11)', 0, 0, 1, 1, NULL, 8674, NULL, 1866, -1809.4, 13.1, 0, 0, 345.98099, 0, 1, 255),
(369, 5, 'object (csrsfence02_lvs) (12)', 0, 0, 1, 1, NULL, 8674, NULL, 1856, -1807, 13.1, 0, 0, 346.97601, 0, 1, 255),
(370, 5, 'object (csrsfence02_lvs) (13)', 0, 0, 1, 1, NULL, 8674, NULL, 1846, -1804.6, 13.1, 0, 0, 345.97601, 0, 1, 255),
(371, 5, 'object (csrsfence02_lvs) (14)', 0, 0, 1, 1, NULL, 8674, NULL, 1838, -1802.6, 13.1, 0, 0, 345.97, 0, 1, 255),
(372, 5, 'removeWorldObject (MTraffic1) (4)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1755.0039, -1720.182, 15.88669, 0, 0, 0, NULL, NULL, NULL),
(373, 5, 'removeWorldObject (MTraffic1) (5)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1754.9863, -1719.9149, 14.49275, 0, 0, 0, NULL, NULL, NULL),
(374, 5, 'removeWorldObject (MTraffic1) (6)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1762.507, -1737.5975, 13.71257, 0, 0, 0, NULL, NULL, NULL),
(375, 5, 'removeWorldObject (MTraffic1) (7)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1762.507, -1737.5215, 14.12989, 0, 0, 0, NULL, NULL, NULL),
(376, 5, 'removeWorldObject (MTraffic1) (8)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1755.1238, -1720.1376, 15.37861, 0, 0, 0, NULL, NULL, NULL),
(377, 5, 'removeWorldObject (MTraffic1) (9)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1754.8123, -1720.1007, 15.89381, 0, 0, 0, NULL, NULL, NULL),
(378, 6, 'removeWorldObject (archshop07_laW02) (1)', 0, NULL, NULL, NULL, 27.495707, 5737, 5935, 1120.1563, -1303.4531, 18.570311, 0, 0, 0, NULL, NULL, NULL),
(379, 6, 'object (csrsfence03_lvs) (1)', 0, 0, 1, 1, NULL, 8673, NULL, 1104.6, -1291.1, 14, 0, 0, 1.25, 0, 1, 255),
(380, 6, 'object (csrsfence03_lvs) (2)', 0, 0, 1, 1, NULL, 8673, NULL, 1125, -1290.9, 14, 0, 0, 0, 0, 1, 255),
(381, 6, 'object (gatehouse1_SFSe) (1)', 0, 0, 1, 1, NULL, 10829, NULL, 1145.1, -1295.7, 12.6, 0, 0, 359.25, 0, 1, 255),
(382, 6, 'object (bar_gatebar01) (1)', 0, 0, 1, 1, NULL, 966, NULL, 1142.5, -1291.1, 12.6, 0, 0, 359.5, 0, 1, 255),
(383, 6, 'object (csrsfence03_lvs) (3)', 0, 0, 1, 1, NULL, 8673, NULL, 1138.2, -1342.1, 14.2, 0, 0, 0, 0, 1, 255),
(384, 6, 'object (csrsfence03_lvs) (4)', 0, 0, 1, 1, NULL, 8673, NULL, 1085.6, -1336.5, 14.1, 0, 0, 0, 0, 1, 255),
(385, 6, 'object (kmb_crash3door) (1)', 0, 0, 1, 1, NULL, 2924, NULL, 1148.7, -1318.4, 13.9, 0, 0, 0, 0, 1, 255),
(386, 6, 'object (fencesmallb) (1)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1331.6, 13.1, 0, 0, 270, 0, 1, 255),
(387, 6, 'object (fencesmallb) (2)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1327.5, 13.1, 0, 0, 270, 0, 1, 255),
(388, 6, 'object (fencesmallb) (4)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1315.2, 13.1, 0, 0, 270, 0, 1, 255),
(389, 6, 'object (fencesmallb) (5)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1319.3, 13.1, 0, 0, 270, 0, 1, 255),
(390, 6, 'removeWorldObject (lamppost1) (1)', 0, NULL, NULL, NULL, 6.011632, 1297, 0, 1190.7734, -1320.8594, 15.94531, 0, 0, 0, NULL, NULL, NULL),
(391, 6, 'object (fencesmallb) (8)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1335.7, 13.1, 0, 0, 270, 0, 1, 255),
(392, 6, 'object (fencesmallb) (9)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1344.1, 13.1, 0, 0, 270, 0, 1, 255),
(393, 6, 'object (fencesmallb) (10)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1311.1, 13.1, 0, 0, 270, 0, 1, 255),
(394, 6, 'object (fencesmallb) (11)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1303.2, 13.1, 0, 0, 270, 0, 1, 255),
(395, 6, 'object (fencesmallb) (12)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1299.1, 13.1, 0, 0, 270, 0, 1, 255),
(396, 6, 'removeWorldObject (lamppost1) (2)', 0, NULL, NULL, NULL, 6.011632, 1297, 0, 1190.7734, -1299.7422, 15.94531, 0, 0, 0, NULL, NULL, NULL),
(397, 6, 'object (fencesmallb) (13)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1295, 13.1, 0, 0, 270, 0, 1, 255),
(398, 6, 'removeWorldObject (MTraffic1) (1)', 0, NULL, NULL, NULL, 11.08576, 1283, 0, 1194.7969, -1290.8516, 15.71094, 0, 0, 0, NULL, NULL, NULL),
(399, 6, 'object (fencesmallb) (14)', 0, 0, 1, 1, NULL, 970, NULL, 1189.8, -1290.9, 13.1, 0, 0, 278, 0, 1, 255),
(400, 6, 'removeWorldObject (lamppost1) (3)', 0, NULL, NULL, NULL, 6.011632, 1297, 0, 1190.7734, -1350.4141, 15.94531, 0, 0, 0, NULL, NULL, NULL),
(401, 6, 'object (fencesmallb) (15)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1348.2, 13.1, 0, 0, 270, 0, 1, 255),
(402, 6, 'object (fencesmallb) (16)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1352.3, 13.1, 0, 0, 270, 0, 1, 255),
(403, 6, 'object (fencesmallb) (17)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1356.4, 13.1, 0, 0, 270, 0, 1, 255),
(404, 6, 'object (fencesmallb) (18)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1360.5, 13.1, 0, 0, 270, 0, 1, 255),
(405, 6, 'object (fencesmallb) (19)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1364.6, 13.1, 0, 0, 270, 0, 1, 255),
(406, 6, 'object (fencesmallb) (20)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1368.7, 13.1, 0, 0, 270, 0, 1, 255),
(407, 6, 'object (fencesmallb) (21)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1372.8, 13.1, 0, 0, 270, 0, 1, 255),
(408, 6, 'object (fencesmallb) (22)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1376.9, 13.1, 0, 0, 270, 0, 1, 255),
(409, 6, 'object (fencesmallb) (23)', 0, 0, 1, 1, NULL, 970, NULL, 1190.1, -1381, 13.1, 0, 0, 270, 0, 1, 255),
(410, 6, 'removeWorldObject (lamppost1) (4)', 0, NULL, NULL, NULL, 6.011632, 1297, 0, 1190.7734, -1383.2734, 15.94531, 0, 0, 0, NULL, NULL, NULL),
(411, 6, 'object (fencesmallb) (24)', 0, 0, 1, 1, NULL, 970, NULL, 1189.8, -1385.1, 13.1, 0, 0, 260.75, 0, 1, 255),
(412, 6, 'object (Streetlamp1) (1)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.7, -1381.2, 15.2, 0, 0, 0, 0, 1, 255),
(413, 6, 'object (Streetlamp1) (2)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.8, -1372.8, 15.2, 0, 0, 0, 0, 1, 255),
(414, 6, 'object (Streetlamp1) (3)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.7, -1364.6, 15.2, 0, 0, 0, 0, 1, 255),
(415, 6, 'object (Streetlamp1) (4)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.8, -1356.4, 15.2, 0, 0, 0, 0, 1, 255),
(416, 6, 'object (Streetlamp1) (5)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.8, -1348.2, 15.2, 0, 0, 0, 0, 1, 255),
(417, 6, 'object (Streetlamp1) (6)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.7, -1335.7, 15.2, 0, 0, 0, 0, 1, 255),
(418, 6, 'object (Streetlamp1) (7)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.7, -1327.4, 15.2, 0, 0, 0, 0, 1, 255),
(419, 6, 'object (Streetlamp1) (8)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.8, -1319.3, 15.2, 0, 0, 0, 0, 1, 255),
(420, 6, 'object (Streetlamp1) (9)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.8, -1311.1, 15.2, 0, 0, 0, 0, 1, 255),
(421, 6, 'object (Streetlamp1) (10)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.7, -1303.2, 15.2, 0, 0, 0, 0, 1, 255),
(422, 6, 'object (Streetlamp1) (11)', 0, 0, 1, 1, NULL, 1232, NULL, 1189.7, -1297, 15.2, 0, 0, 0, 0, 1, 255),
(423, 6, 'object (parkbench1) (1)', 0, 0, 1, 1, NULL, 1280, NULL, 1181, -1334.1, 13, 0, 0, 180, 0, 1, 255),
(424, 6, 'object (parkbench1) (2)', 0, 0, 1, 1, NULL, 1280, NULL, 1181, -1330.2, 13, 0, 0, 179.995, 0, 1, 255),
(425, 6, 'object (parkbench1) (3)', 0, 0, 1, 1, NULL, 1280, NULL, 1181, -1317.2, 13, 0, 0, 179.995, 0, 1, 255),
(426, 6, 'object (parkbench1) (4)', 0, 0, 1, 1, NULL, 1280, NULL, 1181, -1313.1, 13, 0, 0, 179.995, 0, 1, 255),
(427, 6, 'object (CJ_BIN1) (1)', 0, 0, 1, 1, NULL, 1359, NULL, 1181.3, -1332.2, 13.3, 0, 0, 0, 0, 1, 255),
(428, 6, 'object (CJ_BIN1) (2)', 0, 0, 1, 1, NULL, 1359, NULL, 1181, -1315.0996, 13.3, 0, 0, 0, 0, 1, 255),
(429, 7, 'object (fencesmallb) (1)', 0, 0, 1, 1, NULL, 970, NULL, 1453.3, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(430, 7, 'object (fencesmallb) (2)', 0, 0, 1, 1, NULL, 970, NULL, 1457.4, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(431, 7, 'object (fencesmallb) (3)', 0, 0, 1, 1, NULL, 970, NULL, 1461.5, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(432, 7, 'object (fencesmallb) (4)', 0, 0, 1, 1, NULL, 970, NULL, 1465.6, -1742.3, 13.1, 0, 0, 0, 0, 1, 255);
INSERT INTO `maps_objects` (`index`, `map_id`, `id`, `interior`, `dimension`, `collisions`, `breakable`, `radius`, `model`, `lodModel`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`, `doublesided`, `scale`, `alpha`) VALUES
(433, 7, 'object (fencesmallb) (5)', 0, 0, 1, 1, NULL, 970, NULL, 1469.7, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(434, 7, 'object (fencesmallb) (6)', 0, 0, 1, 1, NULL, 970, NULL, 1473.8, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(435, 7, 'object (fencesmallb) (7)', 0, 0, 1, 1, NULL, 970, NULL, 1484.1, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(436, 7, 'object (fencesmallb) (8)', 0, 0, 1, 1, NULL, 970, NULL, 1488.2, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(437, 7, 'object (fencesmallb) (9)', 0, 0, 1, 1, NULL, 970, NULL, 1492.3, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(438, 7, 'object (fencesmallb) (10)', 0, 0, 1, 1, NULL, 970, NULL, 1496.4, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(439, 7, 'object (fencesmallb) (11)', 0, 0, 1, 1, NULL, 970, NULL, 1500.5, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(440, 7, 'object (fencesmallb) (12)', 0, 0, 1, 1, NULL, 970, NULL, 1504.6, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(441, 7, 'object (fencesmallb) (13)', 0, 0, 1, 1, NULL, 970, NULL, 1508.7, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(442, 7, 'object (Streetlamp1) (1)', 0, 0, 1, 1, NULL, 1232, NULL, 1484.9, -1773.6, 19.9, 45, 0, 184, 0, 1, 255),
(443, 7, 'object (Streetlamp1) (2)', 0, 0, 1, 1, NULL, 1232, NULL, 1477.4, -1773.6, 19.9, 44.994999, 0, 183.99899, 0, 1, 255),
(444, 7, 'object (fencesmallb) (15)', 0, 0, 1, 1, NULL, 970, NULL, 1443.1, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(445, 7, 'object (fencesmallb) (16)', 0, 0, 1, 1, NULL, 970, NULL, 1447.2, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(446, 7, 'object (fencesmallb) (17)', 0, 0, 1, 1, NULL, 970, NULL, 1451.3, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(447, 7, 'object (fencesmallb) (18)', 0, 0, 1, 1, NULL, 970, NULL, 1455.4, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(448, 7, 'object (fencesmallb) (19)', 0, 0, 1, 1, NULL, 970, NULL, 1459.5, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(449, 7, 'object (fencesmallb) (20)', 0, 0, 1, 1, NULL, 970, NULL, 1463.6, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(450, 7, 'object (fencesmallb) (21)', 0, 0, 1, 1, NULL, 970, NULL, 1467.7, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(451, 7, 'object (fencesmallb) (22)', 0, 0, 1, 1, NULL, 970, NULL, 1471.8, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(452, 7, 'object (fencesmallb) (24)', 0, 0, 1, 1, NULL, 970, NULL, 1487.2, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(453, 7, 'object (fencesmallb) (25)', 0, 0, 1, 1, NULL, 970, NULL, 1491.3, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(454, 7, 'object (fencesmallb) (26)', 0, 0, 1, 1, NULL, 970, NULL, 1495.4, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(455, 7, 'object (fencesmallb) (27)', 0, 0, 1, 1, NULL, 970, NULL, 1499.5, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(456, 7, 'object (fencesmallb) (28)', 0, 0, 1, 1, NULL, 970, NULL, 1503.6, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(457, 7, 'object (fencesmallb) (29)', 0, 0, 1, 1, NULL, 970, NULL, 1507.7, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(458, 7, 'object (fencesmallb) (30)', 0, 0, 1, 1, NULL, 970, NULL, 1511.8, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(459, 7, 'object (fencesmallb) (32)', 0, 0, 1, 1, NULL, 970, NULL, 1515.9, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(460, 7, 'object (sw_farment02) (1)', 0, 0, 1, 1, NULL, 12922, NULL, 1444.1, -1717.6, 9.2, 0, 0, 270, 0, 1, 255),
(461, 7, 'object (fencesmallb) (33)', 0, 0, 1, 1, NULL, 970, NULL, 1441.1, -1723.1, 13.1, 0, 0, 272, 0, 1, 255),
(462, 7, 'object (fencesmallb) (34)', 0, 0, 1, 1, NULL, 970, NULL, 1518, -1722.9, 13.1, 0, 0, 271.25, 0, 1, 255),
(463, 7, 'object (sw_farment02) (2)', 0, 0, 1, 1, NULL, 12922, NULL, 1447.2, -1717.8, 9.2, 0, 0, 270, 0, 1, 255),
(464, 7, 'object (sw_farment02) (3)', 0, 0, 1, 1, NULL, 12922, NULL, 1450.3, -1717.8, 9.2, 0, 0, 270, 0, 1, 255),
(465, 7, 'object (sw_farment02) (4)', 0, 0, 1, 1, NULL, 12922, NULL, 1453.4, -1717.9, 9.2, 0, 0, 270, 0, 1, 255),
(466, 7, 'object (sw_farment02) (7)', 0, 0, 1, 1, NULL, 12922, NULL, 1456.6, -1717.9, 9.2, 0, 0, 270, 0, 1, 255),
(467, 7, 'removeWorldObject (lamppost3) (1)', 0, NULL, NULL, NULL, 6.614927, 1226, 0, 1467.8506, -1726.713, 13.82731, 0, 0, 0, NULL, NULL, NULL),
(468, 7, 'removeWorldObject (lamppost3) (2)', 0, NULL, NULL, NULL, 6.614927, 1226, 0, 1451.4634, -1726.713, 14.41283, 0, 0, 0, NULL, NULL, NULL),
(469, 7, 'removeWorldObject (lamppost3) (3)', 0, NULL, NULL, NULL, 6.614927, 1226, 0, 1484.9852, -1726.7996, 13.6522, 0, 0, 0, NULL, NULL, NULL),
(470, 7, 'removeWorldObject (lamppost3) (4)', 0, NULL, NULL, NULL, 6.614927, 1226, 0, 1505.0367, -1726.713, 14.12549, 0, 0, 0, NULL, NULL, NULL),
(471, 7, 'object (fencesmallb) (35)', 0, 0, 1, 1, NULL, 970, NULL, 1477.9, -1742.3, 13.1, 0, 0, 0, 0, 1, 255),
(472, 7, 'object (sw_farment02) (18)', 0, 0, 1, 1, NULL, 12922, NULL, 1459.5, -1718, 9.2, 0, 0, 270, 0, 1, 255),
(473, 7, 'object (sw_farment02) (19)', 0, 0, 1, 1, NULL, 12922, NULL, 1462.7, -1718, 9.2, 0, 0, 270, 0, 1, 255),
(474, 7, 'object (sw_farment02) (20)', 0, 0, 1, 1, NULL, 12922, NULL, 1465.7, -1718.1, 9.2, 0, 0, 270, 0, 1, 255),
(475, 7, 'object (sw_farment02) (21)', 0, 0, 1, 1, NULL, 12922, NULL, 1468.8, -1718.2, 9.2, 0, 0, 270, 0, 1, 255),
(476, 7, 'object (fencesmallb) (36)', 0, 0, 1, 1, NULL, 970, NULL, 1475.9, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(477, 7, 'object (fencesmallb) (37)', 0, 0, 1, 1, NULL, 970, NULL, 1483.1, -1720.8, 13.1, 0, 0, 0, 0, 1, 255),
(478, 7, 'object (sw_farment02) (25)', 0, 0, 1, 1, NULL, 12922, NULL, 1471.8, -1718.4, 9.2, 0, 0, 270, 0, 1, 255),
(479, 7, 'object (sw_farment02) (26)', 0, 0, 1, 1, NULL, 12922, NULL, 1474.8, -1718.4, 9.2, 0, 0, 270, 0, 1, 255),
(480, 7, 'object (sw_farment02) (27)', 0, 0, 1, 1, NULL, 12922, NULL, 1477.9, -1718.5, 9.2, 0, 0, 270, 0, 1, 255),
(481, 7, 'object (sw_farment02) (28)', 0, 0, 1, 1, NULL, 12922, NULL, 1481.1, -1718.5, 9.2, 0, 0, 270, 0, 1, 255),
(482, 7, 'object (sw_farment02) (29)', 0, 0, 1, 1, NULL, 12922, NULL, 1484.2, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(483, 7, 'object (sw_farment02) (30)', 0, 0, 1, 1, NULL, 12922, NULL, 1487.2, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(484, 7, 'object (sw_farment02) (31)', 0, 0, 1, 1, NULL, 12922, NULL, 1490.4, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(485, 7, 'object (sw_farment02) (32)', 0, 0, 1, 1, NULL, 12922, NULL, 1493.4, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(486, 7, 'object (sw_farment02) (33)', 0, 0, 1, 1, NULL, 12922, NULL, 1496.6, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(487, 7, 'object (sw_farment02) (34)', 0, 0, 1, 1, NULL, 12922, NULL, 1499.5, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(488, 7, 'object (sw_farment02) (35)', 0, 0, 1, 1, NULL, 12922, NULL, 1502.7, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(489, 7, 'object (sw_farment02) (36)', 0, 0, 1, 1, NULL, 12922, NULL, 1507.7, -1718.6, 9.2, 0, 0, 270, 0, 1, 255),
(490, 7, 'object (sw_farment02) (37)', 0, 0, 1, 1, NULL, 12922, NULL, 1510.8, -1718.5, 9.2, 0, 0, 270, 0, 1, 255),
(491, 7, 'object (sw_farment02) (39)', 0, 0, 1, 1, NULL, 12922, NULL, 1513.9, -1718.7, 9.2, 0, 0, 270, 0, 1, 255),
(492, 7, 'object (lamppost3) (1)', 0, 0, 1, 1, NULL, 1226, NULL, 1508.5, -1741.7, 16.4, 0, 0, 275.995, 0, 1, 255),
(493, 7, 'object (lamppost3) (2)', 0, 0, 1, 1, NULL, 1226, NULL, 1502.2, -1741.5, 16.4, 0, 0, 275.99301, 0, 1, 255),
(494, 7, 'object (lamppost3) (3)', 0, 0, 1, 1, NULL, 1226, NULL, 1496.1, -1741.4, 16.4, 0, 0, 275.99301, 0, 1, 255),
(495, 7, 'object (lamppost3) (4)', 0, 0, 1, 1, NULL, 1226, NULL, 1490, -1741.5, 16.4, 0, 0, 275.99301, 0, 1, 255),
(496, 7, 'object (lamppost3) (5)', 0, 0, 1, 1, NULL, 1226, NULL, 1483.8, -1741.5, 16.4, 0, 0, 275.99301, 0, 1, 255),
(497, 7, 'object (lamppost3) (6)', 0, 0, 1, 1, NULL, 1226, NULL, 1477.6, -1741.6, 16.4, 0, 0, 275.99301, 0, 1, 255),
(498, 7, 'object (lamppost3) (7)', 0, 0, 1, 1, NULL, 1226, NULL, 1471.5, -1741.5, 16.4, 0, 0, 275.99301, 0, 1, 255),
(499, 7, 'object (lamppost3) (8)', 0, 0, 1, 1, NULL, 1226, NULL, 1465.3, -1741.4, 16.4, 0, 0, 275.99301, 0, 1, 255),
(500, 7, 'object (lamppost3) (9)', 0, 0, 1, 1, NULL, 1226, NULL, 1459.2, -1741.5, 16.4, 0, 0, 275.99301, 0, 1, 255),
(501, 7, 'object (lamppost3) (10)', 0, 0, 1, 1, NULL, 1226, NULL, 1453, -1741.5, 16.4, 0, 0, 275.99301, 0, 1, 255),
(552, 9, 'object (savehousegdoor_SFS) (1)', 0, 0, 1, 1, NULL, 10671, NULL, 2521.8, -1272.9, 35.799999, 0, 0, 358, 0, 1, 255),
(551, 9, 'object (michdr) (2)', 0, 0, 1, 1, NULL, 10182, NULL, 2607.3999, -1291.8, 14.2, 0, 0, 0, 0, 1, 255),
(819, 13, 'object (lhouse_barrier3) (15)', 0, 0, 1, 1, NULL, 997, NULL, 1741, 528.79999, 26.6, 0, 356.98999, 250.24699, 0, 1, 255),
(816, 13, 'object (bar_gatebar01) (13)', 0, 0, 1, 1, NULL, 966, NULL, 1738.5, 525.40002, 26.700001, 0, 0, 339.99899, 0, 1, 255),
(817, 13, 'object (bar_gatebar01) (14)', 0, 0, 1, 1, NULL, 966, NULL, 1730.4, 528.20001, 26.700001, 0, 0, 339.99899, 0, 1, 255),
(818, 13, 'object (lhouse_barrier3) (14)', 0, 0, 1, 1, NULL, 997, NULL, 1720.9, 531.70001, 26.9, 0, 0, 339.99899, 0, 1, 255),
(814, 13, 'object (lhouse_barrier3) (12)', 0, 0, 1, 1, NULL, 997, NULL, 1743.6, 536.20001, 26.1, 0, 357, 250.24899, 0, 1, 255),
(815, 13, 'object (lhouse_barrier3) (13)', 0, 0, 1, 1, NULL, 997, NULL, 1742.3, 532.5, 26.4, 0, 356.98999, 250.24699, 0, 1, 255),
(812, 13, 'object (bar_gatebar01) (12)', 0, 0, 1, 1, NULL, 966, NULL, 1752.6, 533.20001, 26, 0, 0, 159.99899, 0, 1, 255),
(813, 13, 'object (lhouse_barrier3) (11)', 0, 0, 1, 1, NULL, 997, NULL, 1759.2002, 530.7998, 26.1, 0, 0, 339.99899, 0, 1, 255),
(810, 13, 'object (bar_gatebar01) (10)', 0, 0, 1, 1, NULL, 966, NULL, 518.20001, 475.60001, 17.799999, 0, 0, 214.25, 0, 1, 255),
(811, 13, 'object (bar_gatebar01) (11)', 0, 0, 1, 1, NULL, 966, NULL, 1745.1, 535.70001, 26, 0, 0, 160, 0, 1, 255),
(808, 13, 'object (lhouse_barrier3) (10)', 0, 0, 1, 1, NULL, 997, NULL, 518.59998, 475, 17.9, 0, 0, 304.5, 0, 1, 255),
(809, 13, 'object (bar_gatebar01) (9)', 0, 0, 1, 1, NULL, 966, NULL, 523.79999, 468.29999, 17.799999, 0, 0, 34.75, 0, 1, 255),
(806, 13, 'object (lhouse_barrier3) (8)', 0, 0, 1, 1, NULL, 997, NULL, -158.3, 404.20001, 11.1, 0, 0, 255.498, 0, 1, 255),
(807, 13, 'object (lhouse_barrier3) (9)', 0, 0, 1, 1, NULL, 997, NULL, 522.70001, 469.10001, 17.9, 0, 0, 124.5, 0, 1, 255),
(804, 13, 'object (bar_gatebar01) (8)', 0, 0, 1, 1, NULL, 966, NULL, -157.10001, 408.5, 10.9, 0, 0, 163.75, 0, 1, 255),
(805, 13, 'object (lhouse_barrier3) (7)', 0, 0, 1, 1, NULL, 997, NULL, -157.3, 408.10001, 11.1, 0, 0, 255.5, 0, 1, 255),
(802, 13, 'object (bar_gatebar01) (6)', 0, 0, 1, 1, NULL, 966, NULL, 617.09998, -1198.7, 17.1, 0, 0, 18.245001, 0, 1, 255),
(803, 13, 'object (bar_gatebar01) (7)', 0, 0, 1, 1, NULL, 966, NULL, -159.2, 400.10001, 10.9, 0, 0, 345, 0, 1, 255),
(800, 13, 'object (lhouse_barrier3) (6)', 0, 0, 1, 1, NULL, 997, NULL, 617.29999, -1198.7, 17.4, 0, 0, 16.5, 0, 1, 255),
(801, 13, 'object (bar_gatebar01) (5)', 0, 0, 1, 1, NULL, 966, NULL, 604.09998, -1203.2, 17.1, 0, 0, 200, 0, 1, 255),
(797, 13, 'object (lhouse_barrier3) (3)', 0, 0, 1, 1, NULL, 997, NULL, 76, -1251.6, 13.5, 0, 0, 306.25, 0, 1, 255),
(798, 13, 'object (lhouse_barrier3) (4)', 0, 0, 1, 1, NULL, 997, NULL, 86, -1265.7, 13.5, 0, 0, 306.24899, 0, 1, 255),
(799, 13, 'object (lhouse_barrier3) (5)', 0, 0, 1, 1, NULL, 997, NULL, 601.20001, -1204.4, 17.4, 0, 0, 21.75, 0, 1, 255),
(795, 13, 'object (bar_gatebar01) (3)', 0, 0, 1, 1, NULL, 966, NULL, 77.900002, -1254.2, 13.5, 0, 0, 126, 0, 1, 255),
(796, 13, 'object (bar_gatebar01) (4)', 0, 0, 1, 1, NULL, 966, NULL, 86, -1265.4, 13.5, 0, 0, 305.74701, 0, 1, 255),
(793, 13, 'object (bar_gatebar01) (1)', 0, 0, 1, 1, NULL, 966, NULL, 74, -1540.2, 4.2, 0, 0, 80, 0, 1, 255),
(794, 13, 'object (bar_gatebar01) (2)', 0, 0, 1, 1, NULL, 966, NULL, 70.699997, -1529, 3.7, 0, 0, 258.24701, 0, 1, 255),
(790, 13, 'object (airsecbooth_SFSe) (1)', 0, 0, 1, 1, NULL, 3881, NULL, 71.5, -1535, 5.9, 0, 0, 352, 0, 1, 255),
(791, 13, 'object (lhouse_barrier3) (1)', 0, 0, 1, 1, NULL, 997, NULL, 74.099998, -1539.9, 4.2, 0, 0, 89.25, 0, 1, 255),
(792, 13, 'object (lhouse_barrier3) (2)', 0, 0, 1, 1, NULL, 997, NULL, 73.199997, -1531, 4.2, 0, 0, 141.496, 0, 1, 255);

-- --------------------------------------------------------

--
-- Table structure for table `mdc_apb`
--

CREATE TABLE `mdc_apb` (
  `id` int(11) NOT NULL,
  `person_involved` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `organization` varchar(10) NOT NULL DEFAULT 'LSPD'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_calls`
--

CREATE TABLE `mdc_calls` (
  `id` int(11) NOT NULL,
  `caller` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_crimes`
--

CREATE TABLE `mdc_crimes` (
  `id` int(11) NOT NULL,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_criminals`
--

CREATE TABLE `mdc_criminals` (
  `character` int(11) NOT NULL,
  `dob` varchar(10) NOT NULL DEFAULT 'mm/dd/yyyy',
  `ethnicity` varchar(50) NOT NULL DEFAULT 'Unknown',
  `phone` varchar(10) NOT NULL DEFAULT 'Unknown',
  `occupation` varchar(50) NOT NULL DEFAULT 'Unknown',
  `address` varchar(50) NOT NULL DEFAULT 'Unknown',
  `photo` int(11) NOT NULL DEFAULT -1,
  `details` varchar(255) DEFAULT 'None.',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `wanted` int(11) NOT NULL DEFAULT 0,
  `wanted_by` int(11) NOT NULL DEFAULT 0,
  `wanted_details` varchar(255) DEFAULT NULL,
  `pilot_details` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_dmv`
--

CREATE TABLE `mdc_dmv` (
  `id` int(11) NOT NULL,
  `char` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vehicle` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_faa_events`
--

CREATE TABLE `mdc_faa_events` (
  `id` int(11) NOT NULL,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` varchar(100) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_faa_licenses`
--

CREATE TABLE `mdc_faa_licenses` (
  `id` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `license` int(2) NOT NULL,
  `value` int(4) DEFAULT NULL,
  `officer` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_groups`
--

CREATE TABLE `mdc_groups` (
  `faction_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `haveMdcInAllVehicles` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canSeeWarrants` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canSeeCalls` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canAddAPB` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canSeeVehicles` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canSeeProperties` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canSeeLicenses` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canSeePilotStuff` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `impound_can_see` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `settingUsernameFormat` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User group''s permissions based on factions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdc_impounds`
--

CREATE TABLE `mdc_impounds` (
  `id` int(11) NOT NULL,
  `veh` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `reporter` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_users`
--

CREATE TABLE `mdc_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `charid` int(11) UNSIGNED NOT NULL,
  `level` int(11) UNSIGNED NOT NULL,
  `organization` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_users_old`
--

CREATE TABLE `mdc_users_old` (
  `id` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `level` int(11) NOT NULL,
  `organization` varchar(30) NOT NULL DEFAULT 'LSPD'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `resource` varchar(45) DEFAULT NULL,
  `migration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_payments`
--

CREATE TABLE `mobile_payments` (
  `payment_id` int(11) UNSIGNED NOT NULL,
  `sender_phone` varchar(45) NOT NULL,
  `operator` varchar(45) DEFAULT 'N/A',
  `country` varchar(45) DEFAULT 'N/A',
  `game_coin` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `account` int(11) UNSIGNED NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `cost` double NOT NULL DEFAULT 0,
  `revenue` double NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `transaction_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `motds`
--

CREATE TABLE `motds` (
  `id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `content` text NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `expiration_date` datetime DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `dismissable` tinyint(1) NOT NULL DEFAULT 1,
  `audiences` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `motd_read`
--

CREATE TABLE `motd_read` (
  `id` int(11) NOT NULL,
  `motdid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Note down everyone that read and dismissed the motd.';

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'other'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `objects`
--

CREATE TABLE `objects` (
  `id` int(11) NOT NULL,
  `model` int(6) NOT NULL DEFAULT 0,
  `posX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `solid` int(1) NOT NULL DEFAULT 1,
  `doublesided` int(1) NOT NULL DEFAULT 0,
  `scale` float(12,7) DEFAULT NULL,
  `breakable` int(1) NOT NULL DEFAULT 0,
  `alpha` int(11) NOT NULL DEFAULT 255
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `online_sessions`
--

CREATE TABLE `online_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `minutes_online` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `minutes_duty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paynspray`
--

CREATE TABLE `paynspray` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `paynspray`
--

INSERT INTO `paynspray` (`id`, `x`, `y`, `z`, `dimension`, `interior`) VALUES
(1, '2064.918945', '-1831.410156', '13.546875', 0, 0),
(3, '-71.961914', '-1183.450195', '1.750000', 0, 0),
(5, '487.584961', '-1740.175781', '11.137200', 0, 0),
(6, '1024.527344', '-1023.703125', '32.101562', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pd_tickets`
--

CREATE TABLE `pd_tickets` (
  `id` int(11) NOT NULL,
  `vehid` int(11) NOT NULL,
  `reason` text NOT NULL,
  `amount` int(11) NOT NULL,
  `issuer` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peds`
--

CREATE TABLE `peds` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `behaviour` int(3) DEFAULT 1,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `skin` int(1) DEFAULT NULL,
  `money` bigint(20) NOT NULL DEFAULT 0,
  `gender` int(1) DEFAULT NULL,
  `stats` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `owner_type` int(1) NOT NULL DEFAULT 0,
  `owner` int(11) DEFAULT NULL,
  `animation` varchar(255) DEFAULT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT 0,
  `nametag` tinyint(1) NOT NULL DEFAULT 1,
  `frozen` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peds`
--

INSERT INTO `peds` (`id`, `name`, `type`, `behaviour`, `x`, `y`, `z`, `rotation`, `interior`, `dimension`, `skin`, `money`, `gender`, `stats`, `description`, `owner_type`, `owner`, `animation`, `synced`, `nametag`, `frozen`, `comment`, `created_by`, `created_at`) VALUES
(1, 'Jacob Smith', 'dmv.license', 2, 1043.62, -1784.25, 13.6624, 352.647, 0, 0, 453, 0, 0, NULL, NULL, 0, NULL, '', 0, 1, 0, '', 3, '2021-11-10 19:24:14'),
(21, 'Jonathan Smithers', 'pd.tickets', 0, 242.244, 120.397, 1003.37, 187.526, 10, 1, 267, 0, 0, NULL, NULL, 0, NULL, '', 0, 1, 1, '', 4, '2021-11-22 18:56:08'),
(22, 'Taylor Jablinski', 'ch.reception', 0, 359.714, 173.586, 1008.39, 270, 3, 2, 93, 0, 0, NULL, NULL, 0, NULL, '', 0, 1, 1, '', 4, '2021-11-22 19:59:47'),
(23, NULL, 'locksmith', 0, 356.031, 168.832, 1008.38, 270, 3, 2, 17, 0, 0, NULL, NULL, 0, NULL, '', 0, 1, 1, '', 4, '2021-11-22 20:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `phonenumber` int(9) NOT NULL,
  `turnedon` smallint(1) NOT NULL DEFAULT 1,
  `secretnumber` smallint(1) NOT NULL DEFAULT 0,
  `phonebook` varchar(40) NOT NULL DEFAULT '0',
  `ringtone` smallint(1) NOT NULL DEFAULT 3,
  `contact_limit` int(5) NOT NULL DEFAULT 50,
  `boughtby` int(11) NOT NULL DEFAULT -1,
  `bought_date` datetime NOT NULL DEFAULT current_timestamp(),
  `sms_tone` smallint(1) NOT NULL DEFAULT 7,
  `keypress_tone` smallint(1) NOT NULL DEFAULT 1,
  `tone_volume` smallint(2) NOT NULL DEFAULT 10
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone_contacts`
--

CREATE TABLE `phone_contacts` (
  `id` int(11) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `entryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryNumber` varchar(50) NOT NULL,
  `entryEmail` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryFavorited` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone_history`
--

CREATE TABLE `phone_history` (
  `id` int(11) NOT NULL,
  `from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `private` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_sms`
--

CREATE TABLE `phone_sms` (
  `id` int(11) NOT NULL,
  `from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `private` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pilot_notams`
--

CREATE TABLE `pilot_notams` (
  `id` int(11) NOT NULL,
  `information` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publicphones`
--

CREATE TABLE `publicphones` (
  `id` int(10) UNSIGNED NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `dimension` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `order_id` int(11) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `payer_email` varchar(75) NOT NULL,
  `mc_gross` float(9,2) NOT NULL,
  `donor` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `donated_for` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `radio_stations`
--

CREATE TABLE `radio_stations` (
  `id` int(11) NOT NULL,
  `station_name` text DEFAULT NULL,
  `source` text DEFAULT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `register_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Dynamic radio stations.';

--
-- Dumping data for table `radio_stations`
--

INSERT INTO `radio_stations` (`id`, `station_name`, `source`, `owner`, `register_date`, `expire_date`, `enabled`, `order`) VALUES
(3, 'Latvijas Radio 2', 'http://lr2mp1.latvijasradio.lv:8002/listen.pls', 0, NULL, NULL, 1, 3),
(4, 'Latvijas Radio 3', 'http://lr3mp0.latvijasradio.lv:8004/listen.pls', 0, NULL, NULL, 1, 4),
(2, 'Latvijas Radio 1', 'http://lr1mp1.latvijasradio.lv:8012/listen.pls', 0, NULL, NULL, 1, 2),
(5, 'Radio Skonto', 'http://www.radioskonto.lv/online_radio/stereo.m3u', 0, NULL, NULL, 1, 5),
(6, 'Latvijas Radio 4', 'http://lr4mp1.latvijasradio.lv:8020/listen.pls', 0, NULL, NULL, 1, 6),
(7, 'SWH', 'http://80.232.162.149:8000/swh96mp3.m3u', 0, NULL, NULL, 1, 7),
(8, 'SWH +', 'http://80.232.162.149:8000/plus96mp3.m3u', 0, NULL, NULL, 1, 8),
(9, 'SWH Rock', 'http://80.232.162.149:8000/rock96mp3.m3u', 0, NULL, NULL, 1, 9),
(10, 'Eiropas Hitu Radio', 'http://stream.europeanhitradio.com:8000/ehr64.m3u', 0, NULL, NULL, 1, 10),
(11, 'TopRadio', 'http://195.13.200.164:8000/listen.pls', 0, NULL, NULL, 1, 11),
(12, 'Pieci FM', 'http://live.pieci.lv/live19-hq.mp3.m3u', 0, NULL, NULL, 1, 12),
(13, 'Spin FM', 'http://80.232.162.149:8000/spin96mp3.m3u', 0, NULL, NULL, 1, 13),
(14, 'Radio Tev', 'http://www.radiotev.lv/radiotev.pls', 0, NULL, NULL, 1, 14),
(15, 'KristÄ«gais Radio', 'http://91.203.71.10:8006/listen.pls', 0, NULL, NULL, 1, 15),
(16, 'Kurzemes Radio', 'http://80.70.23.50:8000/listen.pls', 0, NULL, NULL, 1, 16),
(17, 'Jazz Radio', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://us4.internet-radio.com:8266/listen.pls&t=.m3u', 0, NULL, NULL, 1, 17),
(18, 'Drum And Bass Radio', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://www.partyviberadio.com:8004/listen.pls?sid=1&t=.m3u', 0, NULL, NULL, 1, 18),
(19, 'Christmas Radio', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://us5.internet-radio.com:8121/listen.pls&t=.m3u', 0, NULL, NULL, 1, 19),
(20, 'Deep House', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk2.internet-radio.com:8024/listen.pls&t=.m3u', 0, NULL, NULL, 1, 20),
(21, 'Heavy Metal Radio', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk1.internet-radio.com:8294/live.m3u&t=.m3u', 0, NULL, NULL, 1, 21),
(22, 'Classic Hits Radio', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://us2.internet-radio.com:8075/listen.pls&t=.m3u', 0, NULL, NULL, 1, 22),
(23, 'Hardstyle FM', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk5.internet-radio.com:8270/listen.pls&t=.m3u', 0, NULL, NULL, 1, 23),
(24, 'Country Music', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk3.internet-radio.com:8405/live.m3u&t=.m3u', 0, NULL, NULL, 1, 24),
(25, 'Dance UK Radio', 'https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk2.internet-radio.com:8024/listen.pls&t=.m3u', 0, NULL, NULL, 1, 25),
(26, 'Martin\'s Hardcore FM', 'http://stream.zeno.fm/k5h44as73c9uv.m3u', 0, NULL, NULL, 1, 26),
(27, 'Martin\'s DnB FM', 'http://stream.zeno.fm/enhyfaw73c9uv.m3u', 0, NULL, NULL, 1, 27),
(28, 'LoneFM', 'http://stream.zeno.fm/vgmcuf60ba9uv.pls', 0, NULL, NULL, 1, 28),
(29, 'SolidSound', 'http://stream.zeno.fm/u0n8tdvm0c9uv.pls', 0, NULL, NULL, 1, 29);

-- --------------------------------------------------------

--
-- Table structure for table `ramps`
--

CREATE TABLE `ramps` (
  `id` int(2) NOT NULL,
  `position` text DEFAULT NULL,
  `interior` int(2) DEFAULT NULL,
  `dimension` int(2) DEFAULT NULL,
  `rotation` int(5) DEFAULT NULL,
  `creator` text DEFAULT NULL,
  `liftposition` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `handler` int(11) NOT NULL,
  `reporter` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restricted_freqs`
--

CREATE TABLE `restricted_freqs` (
  `id` int(11) NOT NULL,
  `frequency` text DEFAULT NULL,
  `limitedto` int(5) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sapt_destinations`
--

CREATE TABLE `sapt_destinations` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `destinationID` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sapt_locations`
--

CREATE TABLE `sapt_locations` (
  `id` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `stopID` int(11) NOT NULL,
  `name` text NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sapt_routes`
--

CREATE TABLE `sapt_routes` (
  `id` int(11) NOT NULL,
  `line` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `destination` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `serial_whitelist`
--

CREATE TABLE `serial_whitelist` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `serial` varchar(32) NOT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `last_login_ip` varchar(15) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sfia_pilots`
--

CREATE TABLE `sfia_pilots` (
  `id` int(11) NOT NULL,
  `charactername` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `shoptype` tinyint(4) DEFAULT 0,
  `rotationz` float NOT NULL DEFAULT 0,
  `skin` varchar(50) DEFAULT NULL,
  `sPendingWage` int(11) NOT NULL DEFAULT 0,
  `sIncome` bigint(20) NOT NULL DEFAULT 0,
  `sCapacity` int(11) NOT NULL DEFAULT 10,
  `sSales` varchar(5000) NOT NULL DEFAULT '',
  `pedName` varchar(255) DEFAULT NULL,
  `faction_belong` int(11) NOT NULL DEFAULT 0,
  `faction_access` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_contacts_info`
--

CREATE TABLE `shop_contacts_info` (
  `npcID` int(11) NOT NULL,
  `sOwner` varchar(255) DEFAULT NULL,
  `sPhone` varchar(255) DEFAULT NULL,
  `sEmail` varchar(255) DEFAULT NULL,
  `sForum` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves data about business''s owners in shop system - MAXIME';

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `npcID` int(11) DEFAULT NULL,
  `pItemID` int(11) DEFAULT NULL,
  `pItemValue` varchar(500) DEFAULT NULL,
  `pMetadata` text DEFAULT NULL,
  `pDesc` varchar(500) DEFAULT NULL,
  `pPrice` int(11) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pID` int(11) NOT NULL,
  `pQuantity` int(11) NOT NULL DEFAULT 1,
  `pSetQuantity` int(11) NOT NULL DEFAULT 1,
  `pRestockInterval` int(11) DEFAULT 0,
  `pRestockedDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves on-sale products from players, business system by Maxi';

-- --------------------------------------------------------

--
-- Table structure for table `solid_news`
--

CREATE TABLE `solid_news` (
  `id` int(11) NOT NULL,
  `newsstandmodel` float NOT NULL DEFAULT 1288,
  `locx` float NOT NULL DEFAULT 0,
  `locy` float NOT NULL DEFAULT 0,
  `locz` float NOT NULL DEFAULT 0,
  `rotz` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `solid_xmas_event`
--

CREATE TABLE `solid_xmas_event` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `charactername` varchar(255) NOT NULL,
  `characterid` int(11) NOT NULL,
  `deliveredvehs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speedcams`
--

CREATE TABLE `speedcams` (
  `id` int(11) NOT NULL,
  `x` float(11,7) NOT NULL DEFAULT 0.0000000,
  `y` float(11,7) NOT NULL DEFAULT 0.0000000,
  `z` float(11,7) NOT NULL DEFAULT 0.0000000,
  `interior` int(3) NOT NULL DEFAULT 0 COMMENT 'Stores the location of the pernament speedcams',
  `dimension` int(5) NOT NULL DEFAULT 0,
  `maxspeed` int(4) NOT NULL DEFAULT 120,
  `radius` int(4) NOT NULL DEFAULT 2,
  `enabled` smallint(1) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `speedingviolations`
--

CREATE TABLE `speedingviolations` (
  `id` int(11) NOT NULL,
  `carID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `speed` int(5) NOT NULL,
  `area` varchar(50) NOT NULL,
  `personVisible` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_changelogs`
--

CREATE TABLE `staff_changelogs` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `from_rank` int(11) NOT NULL,
  `to_rank` int(11) DEFAULT NULL,
  `by` int(11) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maxime 2015.01.08';

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT NULL,
  `y` decimal(10,6) DEFAULT NULL,
  `z` decimal(10,6) DEFAULT NULL,
  `interior` int(5) DEFAULT NULL,
  `dimension` int(5) DEFAULT NULL,
  `rx` decimal(10,6) DEFAULT NULL,
  `ry` decimal(10,6) DEFAULT NULL,
  `rz` decimal(10,6) DEFAULT NULL,
  `modelid` int(5) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT -1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tc_comments`
--

CREATE TABLE `tc_comments` (
  `id` int(11) NOT NULL,
  `poster` int(11) NOT NULL,
  `comment` text CHARACTER SET latin1 NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `internal` tinyint(1) NOT NULL DEFAULT 0,
  `tcid` int(11) NOT NULL,
  `system_message` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tc_subscribers`
--

CREATE TABLE `tc_subscribers` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tc_tickets`
--

CREATE TABLE `tc_tickets` (
  `id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `assign_to` int(11) DEFAULT NULL,
  `subscribers` varchar(500) DEFAULT ',',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `subject` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tempinteriors`
--

CREATE TABLE `tempinteriors` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `interior` int(5) NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `amount_paid` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tempobjects`
--

CREATE TABLE `tempobjects` (
  `id` int(11) NOT NULL,
  `model` int(6) NOT NULL DEFAULT 0,
  `posX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `solid` int(1) NOT NULL DEFAULT 1,
  `doublesided` int(1) NOT NULL DEFAULT 0,
  `scale` float(12,7) NOT NULL DEFAULT 1.0000000,
  `breakable` int(1) NOT NULL DEFAULT 0,
  `alpha` tinyint(3) UNSIGNED NOT NULL DEFAULT 255
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `textures_animated`
--

CREATE TABLE `textures_animated` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `frames` text NOT NULL,
  `speed` int(4) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `towstats`
--

CREATE TABLE `towstats` (
  `id` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(8) DEFAULT NULL COMMENT 'vehicle plate at the time of towing, if any',
  `date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'date of towing'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detailed information for TTR leaders who towed what and when';

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `model` int(3) DEFAULT 0,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `rotx` decimal(10,6) DEFAULT 0.000000,
  `roty` decimal(10,6) DEFAULT 0.000000,
  `rotz` decimal(10,6) DEFAULT 0.000000,
  `currx` decimal(10,6) DEFAULT 0.000000,
  `curry` decimal(10,6) DEFAULT 0.000000,
  `currz` decimal(10,6) DEFAULT 0.000000,
  `currrx` decimal(10,6) DEFAULT 0.000000,
  `currry` decimal(10,6) DEFAULT 0.000000,
  `currrz` decimal(10,6) NOT NULL DEFAULT 0.000000,
  `fuel` int(3) DEFAULT 100,
  `engine` int(1) DEFAULT 0,
  `locked` int(1) DEFAULT 0,
  `lights` int(1) DEFAULT 0,
  `sirens` int(1) DEFAULT 0,
  `paintjob` int(11) DEFAULT 0,
  `hp` float DEFAULT 1000,
  `color1` varchar(50) DEFAULT '0',
  `color2` varchar(50) DEFAULT '0',
  `color3` varchar(50) DEFAULT NULL,
  `color4` varchar(50) DEFAULT NULL,
  `plate` text DEFAULT NULL,
  `faction` int(11) DEFAULT -1,
  `owner` int(11) DEFAULT -1,
  `job` int(11) DEFAULT -1,
  `tintedwindows` int(1) DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `currdimension` int(5) DEFAULT 0,
  `currinterior` int(5) DEFAULT 0,
  `enginebroke` int(1) DEFAULT 0,
  `items` text DEFAULT NULL,
  `itemvalues` text DEFAULT NULL,
  `Impounded` int(3) DEFAULT 0,
  `handbrake` int(1) DEFAULT 0,
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `upgrades` varchar(150) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]',
  `wheelStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0 ] ]',
  `panelStates` varchar(40) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]',
  `doorStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0, 0, 0 ] ]',
  `odometer` int(15) DEFAULT 0,
  `headlights` varchar(30) DEFAULT '[ [ 255, 255, 255 ] ]',
  `variant1` int(3) DEFAULT NULL,
  `variant2` int(3) DEFAULT NULL,
  `descriptionadmin` varchar(300) DEFAULT NULL,
  `description1` varchar(300) NOT NULL DEFAULT '',
  `description2` varchar(300) NOT NULL DEFAULT '',
  `description3` varchar(300) NOT NULL DEFAULT '',
  `description4` varchar(300) NOT NULL DEFAULT '',
  `description5` varchar(300) NOT NULL DEFAULT '',
  `suspensionLowerLimit` float DEFAULT NULL,
  `driveType` char(5) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `deletedDate` datetime DEFAULT NULL,
  `chopped` tinyint(4) NOT NULL DEFAULT 0,
  `stolen` tinyint(4) NOT NULL DEFAULT 0,
  `lastUsed` datetime NOT NULL DEFAULT current_timestamp(),
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `trackingdevice` varchar(255) DEFAULT NULL,
  `registered` int(2) NOT NULL DEFAULT 1,
  `show_plate` int(2) NOT NULL DEFAULT 1,
  `show_vin` int(2) NOT NULL DEFAULT 1,
  `paintjob_url` varchar(255) DEFAULT NULL,
  `vehicle_shop_id` int(11) DEFAULT NULL,
  `bulletproof` tinyint(4) NOT NULL DEFAULT 0,
  `textures` varchar(300) NOT NULL DEFAULT '[ [ ] ]',
  `business` int(11) NOT NULL DEFAULT -1,
  `protected_until` datetime DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT 0,
  `settings` varchar(500) DEFAULT NULL,
  `hotwired` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_custom`
--

CREATE TABLE `vehicles_custom` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdby` int(11) NOT NULL DEFAULT 0,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `doortype` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_shop`
--

CREATE TABLE `vehicles_shop` (
  `id` int(11) NOT NULL,
  `vehmtamodel` int(11) DEFAULT 0,
  `vehbrand` varchar(255) DEFAULT NULL,
  `vehmodel` varchar(500) DEFAULT NULL,
  `vehyear` int(11) DEFAULT 2014,
  `vehprice` int(11) DEFAULT 0,
  `vehtax` int(11) DEFAULT 0,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdby` int(11) NOT NULL DEFAULT 0,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `notes` varchar(500) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 1000,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `spawnto` tinyint(2) NOT NULL DEFAULT 0,
  `doortype` tinyint(4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `spawn_rate` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_auctions`
--

CREATE TABLE `vehicle_auctions` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starting_bid` int(11) NOT NULL,
  `minimum_increase` int(11) NOT NULL,
  `current_bid` int(11) DEFAULT NULL,
  `current_bidder_id` int(11) DEFAULT NULL COMMENT 'Character ID of current bidder.',
  `buyout` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_faction` int(11) DEFAULT NULL COMMENT 'Filled in when the vehicle belongs to a faction.',
  `awaiting_key_pickup` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'When the auction is completed, but the buyer has not picked up the car yet'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_logs`
--

CREATE TABLE `vehicle_logs` (
  `log_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vehID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all admin actions on vehicles - Monitored by Vehicle ';

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_notes`
--

CREATE TABLE `vehicle_notes` (
  `id` int(11) NOT NULL,
  `vehid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT 0,
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wiretransfers`
--

CREATE TABLE `wiretransfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(11) DEFAULT 0,
  `to` int(11) DEFAULT 0,
  `amount` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) NOT NULL,
  `from_card` varchar(45) DEFAULT NULL,
  `to_card` varchar(45) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worlditems`
--

CREATE TABLE `worlditems` (
  `id` int(11) NOT NULL,
  `itemid` int(11) DEFAULT 0,
  `itemvalue` text DEFAULT NULL,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `creationdate` datetime DEFAULT NULL,
  `rx` float DEFAULT 0,
  `ry` float DEFAULT 0,
  `rz` float DEFAULT 0,
  `creator` int(10) UNSIGNED DEFAULT 0,
  `protected` int(100) NOT NULL DEFAULT 0,
  `perm_use` int(2) NOT NULL DEFAULT 1,
  `perm_move` int(2) NOT NULL DEFAULT 1,
  `perm_pickup` int(2) NOT NULL DEFAULT 1,
  `perm_use_data` text DEFAULT NULL,
  `perm_move_data` text DEFAULT NULL,
  `perm_pickup_data` text DEFAULT NULL,
  `useExactValues` int(1) NOT NULL DEFAULT 0,
  `metadata` text DEFAULT NULL COMMENT 'additional data for the item that can be edited per individual item, JSON'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worlditems_data`
--

CREATE TABLE `worlditems_data` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_username_5a6e02bd_uniq` (`username`),
  ADD UNIQUE KEY `forumid_UNIQUE` (`forumid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_admin` (`admin`);

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_loa`
--
ALTER TABLE `account_loa`
  ADD PRIMARY KEY (`loa_id`),
  ADD KEY `account_link_idx` (`account_id`);

--
-- Indexes for table `account_settings`
--
ALTER TABLE `account_settings`
  ADD PRIMARY KEY (`id`,`name`),
  ADD KEY `id_idx` (`id`);

--
-- Indexes for table `adminhistory`
--
ALTER TABLE `adminhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminhistory_user_ea155d8a_uniq` (`user`),
  ADD KEY `adminhistory_user_char_c1d4310b_uniq` (`user_char`);

--
-- Indexes for table `admin_teleports`
--
ALTER TABLE `admin_teleports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NAMEUNI` (`location_value`(100));

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apb`
--
ALTER TABLE `apb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications_questions`
--
ALTER TABLE `applications_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atm_cards`
--
ALTER TABLE `atm_cards`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_id_UNIQUE` (`card_id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_faction`
--
ALTER TABLE `characters_faction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `character_settings`
--
ALTER TABLE `character_settings`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `clothing`
--
ALTER TABLE `clothing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dancers`
--
ALTER TABLE `dancers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `dog_users`
--
ALTER TABLE `dog_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donators`
--
ALTER TABLE `donators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_purchases`
--
ALTER TABLE `don_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duty_allowed`
--
ALTER TABLE `duty_allowed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `duty_custom`
--
ALTER TABLE `duty_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `duty_locations`
--
ALTER TABLE `duty_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elections_UNIQUE` (`electionsname`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `elevators`
--
ALTER TABLE `elevators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emailaccounts`
--
ALTER TABLE `emailaccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faa_registry`
--
ALTER TABLE `faa_registry`
  ADD PRIMARY KEY (`codeid`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `faction_ranks`
--
ALTER TABLE `faction_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `connected_interior_UNIQUE` (`connected_interior`),
  ADD UNIQUE KEY `avatar_for_account_UNIQUE` (`avatar_for_account`);

--
-- Indexes for table `force_apps`
--
ALTER TABLE `force_apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`account_id`,`friend_account_id`),
  ADD UNIQUE KEY `friends_account_id_friend_account_id_unique` (`account_id`,`friend_account_id`),
  ADD KEY `friends_friend_account_id_accounts_foreign` (`friend_account_id`);

--
-- Indexes for table `fuelpeds`
--
ALTER TABLE `fuelpeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_authenticator`
--
ALTER TABLE `google_authenticator`
  ADD PRIMARY KEY (`secret`),
  ADD UNIQUE KEY `secret_UNIQUE` (`secret`),
  ADD UNIQUE KEY `userid_UNIQUE` (`userid`);

--
-- Indexes for table `insurance_data`
--
ALTER TABLE `insurance_data`
  ADD PRIMARY KEY (`policyid`);

--
-- Indexes for table `insurance_factions`
--
ALTER TABLE `insurance_factions`
  ADD PRIMARY KEY (`factionID`);

--
-- Indexes for table `interiors`
--
ALTER TABLE `interiors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_business`
--
ALTER TABLE `interior_business`
  ADD PRIMARY KEY (`intID`),
  ADD UNIQUE KEY `intID_UNIQUE` (`intID`);

--
-- Indexes for table `interior_logs`
--
ALTER TABLE `interior_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_interior` (`intID`);

--
-- Indexes for table `interior_notes`
--
ALTER TABLE `interior_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_textures`
--
ALTER TABLE `interior_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ippc_airlines`
--
ALTER TABLE `ippc_airlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ippc_airline_pilots`
--
ALTER TABLE `ippc_airline_pilots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ippc_flights`
--
ALTER TABLE `ippc_flights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`index`);

--
-- Indexes for table `jailed`
--
ALTER TABLE `jailed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_trucker_orders`
--
ALTER TABLE `jobs_trucker_orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `leo_impound_lot`
--
ALTER TABLE `leo_impound_lot`
  ADD PRIMARY KEY (`lane`);

--
-- Indexes for table `lifts`
--
ALTER TABLE `lifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lift_floors`
--
ALTER TABLE `lift_floors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `maps_objects`
--
ALTER TABLE `maps_objects`
  ADD PRIMARY KEY (`index`),
  ADD UNIQUE KEY `index_UNIQUE` (`index`);

--
-- Indexes for table `mdc_apb`
--
ALTER TABLE `mdc_apb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_calls`
--
ALTER TABLE `mdc_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_crimes`
--
ALTER TABLE `mdc_crimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_criminals`
--
ALTER TABLE `mdc_criminals`
  ADD UNIQUE KEY `name` (`character`),
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `mdc_dmv`
--
ALTER TABLE `mdc_dmv`
  ADD UNIQUE KEY `entryid` (`id`);

--
-- Indexes for table `mdc_faa_events`
--
ALTER TABLE `mdc_faa_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_faa_licenses`
--
ALTER TABLE `mdc_faa_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_groups`
--
ALTER TABLE `mdc_groups`
  ADD PRIMARY KEY (`faction_id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `faction_id_UNIQUE` (`faction_id`),
  ADD KEY `idx_idx` (`faction_id`);

--
-- Indexes for table `mdc_impounds`
--
ALTER TABLE `mdc_impounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_users`
--
ALTER TABLE `mdc_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_users_old`
--
ALTER TABLE `mdc_users_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`resource`,`migration`);

--
-- Indexes for table `mobile_payments`
--
ALTER TABLE `mobile_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_id_UNIQUE` (`payment_id`);

--
-- Indexes for table `motds`
--
ALTER TABLE `motds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `motd_read`
--
ALTER TABLE `motd_read`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_user` (`userid`);

--
-- Indexes for table `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_sessions`
--
ALTER TABLE `online_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `paynspray`
--
ALTER TABLE `paynspray`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_8e113603` (`txn_id`);

--
-- Indexes for table `pd_tickets`
--
ALTER TABLE `pd_tickets`
  ADD PRIMARY KEY (`id`,`time`);

--
-- Indexes for table `peds`
--
ALTER TABLE `peds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`phonenumber`),
  ADD UNIQUE KEY `phonenumber_UNIQUE` (`phonenumber`);

--
-- Indexes for table `phone_contacts`
--
ALTER TABLE `phone_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `phone_history`
--
ALTER TABLE `phone_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`);

--
-- Indexes for table `phone_sms`
--
ALTER TABLE `phone_sms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`);

--
-- Indexes for table `pilot_notams`
--
ALTER TABLE `pilot_notams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publicphones`
--
ALTER TABLE `publicphones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `txn_id` (`txn_id`);

--
-- Indexes for table `radio_stations`
--
ALTER TABLE `radio_stations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `ramps`
--
ALTER TABLE `ramps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `restricted_freqs`
--
ALTER TABLE `restricted_freqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sapt_destinations`
--
ALTER TABLE `sapt_destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sapt_locations`
--
ALTER TABLE `sapt_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sapt_routes`
--
ALTER TABLE `sapt_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serial_whitelist`
--
ALTER TABLE `serial_whitelist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `serial_whitelist_userid_4b8e2882_uniq` (`userid`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sfia_pilots`
--
ALTER TABLE `sfia_pilots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_contacts_info`
--
ALTER TABLE `shop_contacts_info`
  ADD PRIMARY KEY (`npcID`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`pID`),
  ADD UNIQUE KEY `pID_UNIQUE` (`pID`);

--
-- Indexes for table `solid_news`
--
ALTER TABLE `solid_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solid_xmas_event`
--
ALTER TABLE `solid_xmas_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speedcams`
--
ALTER TABLE `speedcams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speedingviolations`
--
ALTER TABLE `speedingviolations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_changelogs`
--
ALTER TABLE `staff_changelogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_comments`
--
ALTER TABLE `tc_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tcid_idx` (`tcid`),
  ADD KEY `comment_poster` (`poster`);

--
-- Indexes for table `tc_subscribers`
--
ALTER TABLE `tc_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriber_ticket` (`ticket_id`),
  ADD KEY `subscriber_account` (`user_id`);

--
-- Indexes for table `tc_tickets`
--
ALTER TABLE `tc_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_creator` (`creator`),
  ADD KEY `ticket_assignee` (`assign_to`),
  ADD KEY `ticket_status` (`status`);

--
-- Indexes for table `tempinteriors`
--
ALTER TABLE `tempinteriors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempobjects`
--
ALTER TABLE `tempobjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dimension` (`dimension`);

--
-- Indexes for table `textures_animated`
--
ALTER TABLE `textures_animated`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `towstats`
--
ALTER TABLE `towstats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_idx` (`character`),
  ADD KEY `vehicle_idx` (`vehicle`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles_custom`
--
ALTER TABLE `vehicles_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `vehicles_shop`
--
ALTER TABLE `vehicles_shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `vehicle_auctions`
--
ALTER TABLE `vehicle_auctions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_auctions_advertisement_id_index` (`advertisement_id`),
  ADD KEY `vehicle_auctions_expiry_awaiting_key_pickup_index` (`expiry`,`awaiting_key_pickup`);

--
-- Indexes for table `vehicle_logs`
--
ALTER TABLE `vehicle_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_vehicle` (`vehID`);

--
-- Indexes for table `vehicle_notes`
--
ALTER TABLE `vehicle_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wiretransfers`
--
ALTER TABLE `wiretransfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worlditems`
--
ALTER TABLE `worlditems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worlditems_data`
--
ALTER TABLE `worlditems_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xitem_idx` (`item`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_loa`
--
ALTER TABLE `account_loa`
  MODIFY `loa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminhistory`
--
ALTER TABLE `adminhistory`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_teleports`
--
ALTER TABLE `admin_teleports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apb`
--
ALTER TABLE `apb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications_questions`
--
ALTER TABLE `applications_questions`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atms`
--
ALTER TABLE `atms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `atm_cards`
--
ALTER TABLE `atm_cards`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters_faction`
--
ALTER TABLE `characters_faction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clothing`
--
ALTER TABLE `clothing`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dancers`
--
ALTER TABLE `dancers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dog_users`
--
ALTER TABLE `dog_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donators`
--
ALTER TABLE `donators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `don_purchases`
--
ALTER TABLE `don_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duty_allowed`
--
ALTER TABLE `duty_allowed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duty_custom`
--
ALTER TABLE `duty_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duty_locations`
--
ALTER TABLE `duty_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elections`
--
ALTER TABLE `elections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elevators`
--
ALTER TABLE `elevators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `emailaccounts`
--
ALTER TABLE `emailaccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `faction_ranks`
--
ALTER TABLE `faction_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `force_apps`
--
ALTER TABLE `force_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fuelpeds`
--
ALTER TABLE `fuelpeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_data`
--
ALTER TABLE `insurance_data`
  MODIFY `policyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interiors`
--
ALTER TABLE `interiors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `interior_logs`
--
ALTER TABLE `interior_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interior_notes`
--
ALTER TABLE `interior_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interior_textures`
--
ALTER TABLE `interior_textures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ippc_airlines`
--
ALTER TABLE `ippc_airlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ippc_airline_pilots`
--
ALTER TABLE `ippc_airline_pilots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ippc_flights`
--
ALTER TABLE `ippc_flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jailed`
--
ALTER TABLE `jailed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs_trucker_orders`
--
ALTER TABLE `jobs_trucker_orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `leo_impound_lot`
--
ALTER TABLE `leo_impound_lot`
  MODIFY `lane` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `lifts`
--
ALTER TABLE `lifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lift_floors`
--
ALTER TABLE `lift_floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `maps_objects`
--
ALTER TABLE `maps_objects`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=820;

--
-- AUTO_INCREMENT for table `mdc_apb`
--
ALTER TABLE `mdc_apb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_calls`
--
ALTER TABLE `mdc_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_crimes`
--
ALTER TABLE `mdc_crimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_dmv`
--
ALTER TABLE `mdc_dmv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_faa_events`
--
ALTER TABLE `mdc_faa_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_faa_licenses`
--
ALTER TABLE `mdc_faa_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_groups`
--
ALTER TABLE `mdc_groups`
  MODIFY `faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_impounds`
--
ALTER TABLE `mdc_impounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_users`
--
ALTER TABLE `mdc_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_users_old`
--
ALTER TABLE `mdc_users_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_payments`
--
ALTER TABLE `mobile_payments`
  MODIFY `payment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motds`
--
ALTER TABLE `motds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motd_read`
--
ALTER TABLE `motd_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objects`
--
ALTER TABLE `objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_sessions`
--
ALTER TABLE `online_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paynspray`
--
ALTER TABLE `paynspray`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pd_tickets`
--
ALTER TABLE `pd_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peds`
--
ALTER TABLE `peds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `phone_contacts`
--
ALTER TABLE `phone_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_history`
--
ALTER TABLE `phone_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_sms`
--
ALTER TABLE `phone_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publicphones`
--
ALTER TABLE `publicphones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radio_stations`
--
ALTER TABLE `radio_stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `ramps`
--
ALTER TABLE `ramps`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restricted_freqs`
--
ALTER TABLE `restricted_freqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sapt_destinations`
--
ALTER TABLE `sapt_destinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sapt_locations`
--
ALTER TABLE `sapt_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sapt_routes`
--
ALTER TABLE `sapt_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serial_whitelist`
--
ALTER TABLE `serial_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sfia_pilots`
--
ALTER TABLE `sfia_pilots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `pID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solid_news`
--
ALTER TABLE `solid_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solid_xmas_event`
--
ALTER TABLE `solid_xmas_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speedcams`
--
ALTER TABLE `speedcams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speedingviolations`
--
ALTER TABLE `speedingviolations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_changelogs`
--
ALTER TABLE `staff_changelogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_comments`
--
ALTER TABLE `tc_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_subscribers`
--
ALTER TABLE `tc_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_tickets`
--
ALTER TABLE `tc_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tempobjects`
--
ALTER TABLE `tempobjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `textures_animated`
--
ALTER TABLE `textures_animated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towstats`
--
ALTER TABLE `towstats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles_custom`
--
ALTER TABLE `vehicles_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles_shop`
--
ALTER TABLE `vehicles_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_auctions`
--
ALTER TABLE `vehicle_auctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_logs`
--
ALTER TABLE `vehicle_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_notes`
--
ALTER TABLE `vehicle_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiretransfers`
--
ALTER TABLE `wiretransfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worlditems`
--
ALTER TABLE `worlditems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worlditems_data`
--
ALTER TABLE `worlditems_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
