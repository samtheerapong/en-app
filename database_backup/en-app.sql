-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2023 at 09:58 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `en-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `en_status`
--

CREATE TABLE `en_status` (
  `status_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'สถานะ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_status`
--

INSERT INTO `en_status` (`status_id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, 'Request', 'แจ้งงาน', 'แจ้งงานโดยผู้ใช้งาน', '#952323', 1),
(2, 'Approved-D', 'หัวหน้างานอนุมัติ', 'หัวหน้างานอนุมัติ', '#0000ff', 1),
(3, 'Engineering', 'รออนุมัติเข้าซ่อม', 'อยู่ในขั้นตอนขออนุมัติซ่อมของแผนกวิศวกรรม', '#9900ff', 1),
(4, 'Approved-E', 'ดำเนินการซ่อม', 'ผู้จัดการแผนกวิศวกรรมอนุมัติ', '#ff9900', 1),
(5, 'Success', 'ปิดงาน', 'งานซ่อมสำเร็จ ปิดงาน', '#274e13', 1),
(6, 'Postponed', 'เลื่อน', 'เลื่อนการซ่อมออกไป', '#ff00ff', 1),
(7, 'Canceled', 'ยกเลิก', 'ยกเลิกโดยผู้ใช้งาน', '#434343', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `en_status`
--
ALTER TABLE `en_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `en_status`
--
ALTER TABLE `en_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
