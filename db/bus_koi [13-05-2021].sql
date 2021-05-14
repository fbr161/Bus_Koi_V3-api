-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 02:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_koi`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_record`
--

CREATE TABLE `accident_record` (
  `schedule_record_id` varchar(100) NOT NULL,
  `bus_no` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL,
  `alert_hospital_lat` double DEFAULT NULL,
  `alert_hospital_lon` double DEFAULT NULL,
  `alert_police_lat` double DEFAULT NULL,
  `alert_police_lon` double DEFAULT NULL,
  `counter_id` varchar(50) DEFAULT NULL,
  `users_emergency_nmbrs` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `phn_no` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `counter_id` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `Bus_No` varchar(50) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `Total_capacity` int(2) NOT NULL,
  `Last_lat` double DEFAULT NULL,
  `Last_lon` double DEFAULT NULL,
  `seat_plan` varchar(50) NOT NULL,
  `ac_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`Bus_No`, `company_name`, `Total_capacity`, `Last_lat`, `Last_lon`, `seat_plan`, `ac_status`) VALUES
('ena_1', 'ENA', 40, 0, 0, '10x4', 0),
('ena_2', 'ENA', 40, 0, 0, '10x4', 0),
('hanif_1', 'Hanif', 40, 4, 4, '10x4', 0),
('hanif_2', 'Hanif', 40, 25.120886, 88.580642, '10x4', 0),
('National_Travels_1', 'National Travels', 40, 0, 0, '10x4', 1),
('National_Travels_2', 'National Travels', 40, 0, 0, '10x4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bus_driver_user`
--

CREATE TABLE `bus_driver_user` (
  `name` varchar(50) NOT NULL,
  `phn_no` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `company_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus_driver_user`
--

INSERT INTO `bus_driver_user` (`name`, `phn_no`, `password`, `company_name`) VALUES
('Mr. XYZ', '01712XXX', 'XYZ', 'Hanif'),
('Mr. ABC', '01724XXX', 'ABC', 'ENA');

-- --------------------------------------------------------

--
-- Table structure for table `bus_location_record`
--

CREATE TABLE `bus_location_record` (
  `schedule_id` varchar(100) NOT NULL,
  `date_time` datetime NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bus_ticket`
--

CREATE TABLE `bus_ticket` (
  `schedule_id` int(11) DEFAULT NULL,
  `Column` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `companyname_to_code`
--

CREATE TABLE `companyname_to_code` (
  `company_name` varchar(50) NOT NULL,
  `company_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `ID` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Contact_number` varchar(15) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Lat` double NOT NULL,
  `Lon` double NOT NULL,
  `company_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily_schedule`
--

CREATE TABLE `daily_schedule` (
  `ID` varchar(50) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `from_loc` varchar(100) NOT NULL,
  `to_loc` varchar(50) NOT NULL,
  `ac_status` tinyint(1) NOT NULL,
  `Total_capacity` int(2) NOT NULL,
  `Fare` double DEFAULT NULL,
  `bus_no` varchar(50) DEFAULT NULL,
  `dep_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_schedule`
--

INSERT INTO `daily_schedule` (`ID`, `company_name`, `from_loc`, `to_loc`, `ac_status`, `Total_capacity`, `Fare`, `bus_no`, `dep_time`) VALUES
('000100022200ha01010', 'Hanif', 'Dhaka', 'Rajshahi', 0, 40, 500, '0', '22:00:00'),
('000100022230ha01010', 'Hanif', 'Dhaka', 'Rajshahi', 0, 40, 500, '0', '22:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(2) NOT NULL,
  `division_id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bn_name` varchar(25) NOT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lon` varchar(15) DEFAULT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `bn_name`, `lat`, `lon`, `url`) VALUES
(1, 1, 'Comilla', 'কুমিল্লা', '23.4682747', '91.1788135', 'www.comilla.gov.bd'),
(2, 1, 'Feni', 'ফেনী', '23.023231', '91.3840844', 'www.feni.gov.bd'),
(3, 1, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', '23.9570904', '91.1119286', 'www.brahmanbaria.gov.bd'),
(4, 1, 'Rangamati', 'রাঙ্গামাটি', NULL, NULL, 'www.rangamati.gov.bd'),
(5, 1, 'Noakhali', 'নোয়াখালী', '22.869563', '91.099398', 'www.noakhali.gov.bd'),
(6, 1, 'Chandpur', 'চাঁদপুর', '23.2332585', '90.6712912', 'www.chandpur.gov.bd'),
(7, 1, 'Lakshmipur', 'লক্ষ্মীপুর', '22.942477', '90.841184', 'www.lakshmipur.gov.bd'),
(8, 1, 'Chattogram', 'চট্টগ্রাম', '22.335109', '91.834073', 'www.chittagong.gov.bd'),
(9, 1, 'Coxsbazar', 'কক্সবাজার', NULL, NULL, 'www.coxsbazar.gov.bd'),
(10, 1, 'Khagrachhari', 'খাগড়াছড়ি', '23.119285', '91.984663', 'www.khagrachhari.gov.bd'),
(11, 1, 'Bandarban', 'বান্দরবান', '22.1953275', '92.2183773', 'www.bandarban.gov.bd'),
(12, 2, 'Sirajganj', 'সিরাজগঞ্জ', '24.4533978', '89.7006815', 'www.sirajganj.gov.bd'),
(13, 2, 'Pabna', 'পাবনা', '23.998524', '89.233645', 'www.pabna.gov.bd'),
(14, 2, 'Bogura', 'বগুড়া', '24.8465228', '89.377755', 'www.bogra.gov.bd'),
(15, 2, 'Rajshahi', 'রাজশাহী', NULL, NULL, 'www.rajshahi.gov.bd'),
(16, 2, 'Natore', 'নাটোর', '24.420556', '89.000282', 'www.natore.gov.bd'),
(17, 2, 'Joypurhat', 'জয়পুরহাট', NULL, NULL, 'www.joypurhat.gov.bd'),
(18, 2, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', '24.5965034', '88.2775122', 'www.chapainawabganj.gov.bd'),
(19, 2, 'Naogaon', 'নওগাঁ', NULL, NULL, 'www.naogaon.gov.bd'),
(20, 3, 'Jashore', 'যশোর', '23.16643', '89.2081126', 'www.jessore.gov.bd'),
(21, 3, 'Satkhira', 'সাতক্ষীরা', NULL, NULL, 'www.satkhira.gov.bd'),
(22, 3, 'Meherpur', 'মেহেরপুর', '23.762213', '88.631821', 'www.meherpur.gov.bd'),
(23, 3, 'Narail', 'নড়াইল', '23.172534', '89.512672', 'www.narail.gov.bd'),
(24, 3, 'Chuadanga', 'চুয়াডাঙ্গা', '23.6401961', '88.841841', 'www.chuadanga.gov.bd'),
(25, 3, 'Kushtia', 'কুষ্টিয়া', '23.901258', '89.120482', 'www.kushtia.gov.bd'),
(26, 3, 'Magura', 'মাগুরা', '23.487337', '89.419956', 'www.magura.gov.bd'),
(27, 3, 'Khulna', 'খুলনা', '22.815774', '89.568679', 'www.khulna.gov.bd'),
(28, 3, 'Bagerhat', 'বাগেরহাট', '22.651568', '89.785938', 'www.bagerhat.gov.bd'),
(29, 3, 'Jhenaidah', 'ঝিনাইদহ', '23.5448176', '89.1539213', 'www.jhenaidah.gov.bd'),
(30, 4, 'Jhalakathi', 'ঝালকাঠি', NULL, NULL, 'www.jhalakathi.gov.bd'),
(31, 4, 'Patuakhali', 'পটুয়াখালী', '22.3596316', '90.3298712', 'www.patuakhali.gov.bd'),
(32, 4, 'Pirojpur', 'পিরোজপুর', NULL, NULL, 'www.pirojpur.gov.bd'),
(33, 4, 'Barisal', 'বরিশাল', NULL, NULL, 'www.barisal.gov.bd'),
(34, 4, 'Bhola', 'ভোলা', '22.685923', '90.648179', 'www.bhola.gov.bd'),
(35, 4, 'Barguna', 'বরগুনা', NULL, NULL, 'www.barguna.gov.bd'),
(36, 5, 'Sylhet', 'সিলেট', '24.8897956', '91.8697894', 'www.sylhet.gov.bd'),
(37, 5, 'Moulvibazar', 'মৌলভীবাজার', '24.482934', '91.777417', 'www.moulvibazar.gov.bd'),
(38, 5, 'Habiganj', 'হবিগঞ্জ', '24.374945', '91.41553', 'www.habiganj.gov.bd'),
(39, 5, 'Sunamganj', 'সুনামগঞ্জ', '25.0658042', '91.3950115', 'www.sunamganj.gov.bd'),
(40, 6, 'Narsingdi', 'নরসিংদী', '23.932233', '90.71541', 'www.narsingdi.gov.bd'),
(41, 6, 'Gazipur', 'গাজীপুর', '24.0022858', '90.4264283', 'www.gazipur.gov.bd'),
(42, 6, 'Shariatpur', 'শরীয়তপুর', NULL, NULL, 'www.shariatpur.gov.bd'),
(43, 6, 'Narayanganj', 'নারায়ণগঞ্জ', '23.63366', '90.496482', 'www.narayanganj.gov.bd'),
(44, 6, 'Tangail', 'টাঙ্গাইল', NULL, NULL, 'www.tangail.gov.bd'),
(45, 6, 'Kishoreganj', 'কিশোরগঞ্জ', '24.444937', '90.776575', 'www.kishoreganj.gov.bd'),
(46, 6, 'Manikganj', 'মানিকগঞ্জ', NULL, NULL, 'www.manikganj.gov.bd'),
(47, 6, 'Dhaka', 'ঢাকা', '23.7115253', '90.4111451', 'www.dhaka.gov.bd'),
(48, 6, 'Munshiganj', 'মুন্সিগঞ্জ', NULL, NULL, 'www.munshiganj.gov.bd'),
(49, 6, 'Rajbari', 'রাজবাড়ী', '23.7574305', '89.6444665', 'www.rajbari.gov.bd'),
(50, 6, 'Madaripur', 'মাদারীপুর', '23.164102', '90.1896805', 'www.madaripur.gov.bd'),
(51, 6, 'Gopalganj', 'গোপালগঞ্জ', '23.0050857', '89.8266059', 'www.gopalganj.gov.bd'),
(52, 6, 'Faridpur', 'ফরিদপুর', '23.6070822', '89.8429406', 'www.faridpur.gov.bd'),
(53, 7, 'Panchagarh', 'পঞ্চগড়', '26.3411', '88.5541606', 'www.panchagarh.gov.bd'),
(54, 7, 'Dinajpur', 'দিনাজপুর', '25.6217061', '88.6354504', 'www.dinajpur.gov.bd'),
(55, 7, 'Lalmonirhat', 'লালমনিরহাট', NULL, NULL, 'www.lalmonirhat.gov.bd'),
(56, 7, 'Nilphamari', 'নীলফামারী', '25.931794', '88.856006', 'www.nilphamari.gov.bd'),
(57, 7, 'Gaibandha', 'গাইবান্ধা', '25.328751', '89.528088', 'www.gaibandha.gov.bd'),
(58, 7, 'Thakurgaon', 'ঠাকুরগাঁও', '26.0336945', '88.4616834', 'www.thakurgaon.gov.bd'),
(59, 7, 'Rangpur', 'রংপুর', '25.7558096', '89.244462', 'www.rangpur.gov.bd'),
(60, 7, 'Kurigram', 'কুড়িগ্রাম', '25.805445', '89.636174', 'www.kurigram.gov.bd'),
(61, 8, 'Sherpur', 'শেরপুর', '25.0204933', '90.0152966', 'www.sherpur.gov.bd'),
(62, 8, 'Mymensingh', 'ময়মনসিংহ', '24.7465670', '90.4072093', 'www.mymensingh.gov.bd'),
(63, 8, 'Jamalpur', 'জামালপুর', '24.937533', '89.937775', 'www.jamalpur.gov.bd'),
(64, 8, 'Netrokona', 'নেত্রকোণা', '24.870955', '90.727887', 'www.netrokona.gov.bd');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bn_name` varchar(25) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `bn_name`, `url`) VALUES
(1, 'Chattagram', 'চট্টগ্রাম', 'www.chittagongdiv.gov.bd'),
(2, 'Rajshahi', 'রাজশাহী', 'www.rajshahidiv.gov.bd'),
(3, 'Khulna', 'খুলনা', 'www.khulnadiv.gov.bd'),
(4, 'Barisal', 'বরিশাল', 'www.barisaldiv.gov.bd'),
(5, 'Sylhet', 'সিলেট', 'www.sylhetdiv.gov.bd'),
(6, 'Dhaka', 'ঢাকা', 'www.dhakadiv.gov.bd'),
(7, 'Rangpur', 'রংপুর', 'www.rangpurdiv.gov.bd'),
(8, 'Mymensingh', 'ময়মনসিংহ', 'www.mymensinghdiv.gov.bd');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact_numbers`
--

CREATE TABLE `emergency_contact_numbers` (
  `user_phone_no` varchar(15) NOT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_phn_no` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `Hospital_name` varchar(50) NOT NULL,
  `Contact_no` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location_mapping`
--

CREATE TABLE `location_mapping` (
  `id` int(4) NOT NULL,
  `div` varchar(20) NOT NULL,
  `zilla` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `sub_city` varchar(20) DEFAULT NULL,
  `code` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location_mapping`
--

INSERT INTO `location_mapping` (`id`, `div`, `zilla`, `city`, `sub_city`, `code`) VALUES
(1, 'Dhaka', 'Dhaka', 'Dhaka', 'Kallyanpur', '0001'),
(2, 'Rajshahi', 'Rajshahi', 'Rajshahi', 'Dhaka station', '0002'),
(3, 'Naogaon', 'Naogaon', 'Naogaon', 'Dhaka station', '0003');

-- --------------------------------------------------------

--
-- Table structure for table `police`
--

CREATE TABLE `police` (
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` varchar(100) NOT NULL,
  `date_time` datetime NOT NULL,
  `daily_schedule_id` varchar(50) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `from_loc` varchar(30) NOT NULL,
  `to_loc` varchar(30) NOT NULL,
  `bus_no` varchar(50) DEFAULT NULL,
  `ac_status` tinyint(1) NOT NULL,
  `available_seats` int(2) NOT NULL,
  `total_capacity` int(2) NOT NULL,
  `fare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `date_time`, `daily_schedule_id`, `company_name`, `from_loc`, `to_loc`, `bus_no`, `ac_status`, `available_seats`, `total_capacity`, `fare`) VALUES
('20210520000100022200ha01010', '2021-05-20 22:00:00', '000100022200ha01010', 'Hanif', 'Dhaka', 'Rajshahi', 'hanif_1', 0, 40, 40, 500),
('20210520000100022230ha01010', '2021-05-05 22:30:00', '000100022230ha01010', 'Hanif', 'Dhaka', 'Rajshahi', 'hanif_2', 0, 40, 40, 500);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_record`
--

CREATE TABLE `schedule_record` (
  `schedule_id` varchar(100) NOT NULL,
  `date_time` datetime NOT NULL,
  `bus_no` varchar(50) NOT NULL,
  `free_seat_nmbr_int` int(2) NOT NULL,
  `free_seat_no_details_str` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seat_condition`
--

CREATE TABLE `seat_condition` (
  `schedule_id` varchar(100) NOT NULL,
  `1A` tinyint(1) NOT NULL,
  `1B` tinyint(1) NOT NULL,
  `1C` tinyint(1) NOT NULL,
  `1D` tinyint(1) NOT NULL,
  `2A` tinyint(1) NOT NULL,
  `2B` tinyint(1) NOT NULL,
  `2C` tinyint(1) NOT NULL,
  `2D` tinyint(1) NOT NULL,
  `3A` tinyint(1) NOT NULL,
  `3B` tinyint(1) NOT NULL,
  `3C` tinyint(1) NOT NULL,
  `3D` tinyint(1) NOT NULL,
  `4A` tinyint(1) NOT NULL,
  `4B` tinyint(1) NOT NULL,
  `4C` tinyint(1) NOT NULL,
  `4D` tinyint(1) NOT NULL,
  `5A` tinyint(1) NOT NULL,
  `5B` tinyint(1) NOT NULL,
  `5C` tinyint(1) NOT NULL,
  `5D` tinyint(1) NOT NULL,
  `6A` tinyint(1) NOT NULL,
  `6B` tinyint(1) NOT NULL,
  `6C` tinyint(1) NOT NULL,
  `6D` tinyint(1) NOT NULL,
  `7A` tinyint(1) NOT NULL,
  `7B` tinyint(1) NOT NULL,
  `7C` tinyint(1) NOT NULL,
  `7D` tinyint(1) NOT NULL,
  `8A` tinyint(1) NOT NULL,
  `8B` tinyint(1) NOT NULL,
  `8C` tinyint(1) NOT NULL,
  `8D` tinyint(1) NOT NULL,
  `9A` tinyint(1) NOT NULL,
  `9B` tinyint(1) NOT NULL,
  `9C` tinyint(1) NOT NULL,
  `9D` tinyint(1) NOT NULL,
  `10A` tinyint(1) NOT NULL,
  `10B` tinyint(1) NOT NULL,
  `10C` tinyint(1) NOT NULL,
  `10D` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat_condition`
--

INSERT INTO `seat_condition` (`schedule_id`, `1A`, `1B`, `1C`, `1D`, `2A`, `2B`, `2C`, `2D`, `3A`, `3B`, `3C`, `3D`, `4A`, `4B`, `4C`, `4D`, `5A`, `5B`, `5C`, `5D`, `6A`, `6B`, `6C`, `6D`, `7A`, `7B`, `7C`, `7D`, `8A`, `8B`, `8C`, `8D`, `9A`, `9B`, `9C`, `9D`, `10A`, `10B`, `10C`, `10D`) VALUES
('20210520000100022200ha01010', 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1),
('20210520000100022230ha01010', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0),
('h1', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0),
('h2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1),
('n1', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1),
('n2', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(20) NOT NULL,
  `schedule_id` varchar(100) NOT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `passenger_phn` varchar(15) DEFAULT NULL,
  `passenger_name` varchar(30) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `seat_no` varchar(10) NOT NULL,
  `issed_date_time` datetime NOT NULL,
  `fare` double NOT NULL,
  `issued_by` varchar(30) NOT NULL,
  `bus_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `schedule_id`, `user_id`, `passenger_phn`, `passenger_name`, `gender`, `seat_no`, `issed_date_time`, `fare`, `issued_by`, `bus_no`) VALUES
(5, '20210520000100022200ha01010', '01739703058', '01739703058', 'Md. Fuad Bin Rahman', 1, '8D,9C', '2021-05-13 12:50:38', 1000, '01739703058', ''),
(6, '20210520000100022200ha01010', '01739703058', '01739703058', 'Md. Fuad Bin Rahman', 1, '7D', '2021-05-13 13:35:58', 500, '01739703058', ''),
(7, '20210520000100022230ha01010', '01739703058', '01739703058', 'Md. Fuad Bin Rahman', 1, '6C,6D', '2021-05-13 18:45:18', 1000, '01739703058', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Phone_no` varchar(15) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Phone_no`, `Name`, `password`) VALUES
('0171234', 'xyz', '1234'),
('01739703058', 'Md. Fuad Bin Rahman', '0000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_record`
--
ALTER TABLE `accident_record`
  ADD PRIMARY KEY (`schedule_record_id`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`phn_no`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`Bus_No`);

--
-- Indexes for table `bus_driver_user`
--
ALTER TABLE `bus_driver_user`
  ADD PRIMARY KEY (`phn_no`);

--
-- Indexes for table `bus_location_record`
--
ALTER TABLE `bus_location_record`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `daily_schedule`
--
ALTER TABLE `daily_schedule`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contact_numbers`
--
ALTER TABLE `emergency_contact_numbers`
  ADD PRIMARY KEY (`user_phone_no`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`lat`,`lon`);

--
-- Indexes for table `location_mapping`
--
ALTER TABLE `location_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`lat`,`lon`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_record`
--
ALTER TABLE `schedule_record`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `seat_condition`
--
ALTER TABLE `seat_condition`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Phone_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `location_mapping`
--
ALTER TABLE `location_mapping`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
