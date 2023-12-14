-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 14, 2023 at 10:02 AM
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
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อแผนก',
  `detail` text COMMENT 'รายละเอียด',
  `department_head` int(11) DEFAULT NULL COMMENT 'หัวหน้าแผนก',
  `warehouse_id` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `code`, `name`, `detail`, `department_head`, `warehouse_id`, `color`, `active`) VALUES
(1, 'GR', 'ทั่วไป', NULL, 11, 1, '#379237', 1),
(2, 'WH', 'แผนกคลังสินค้า (Ware House)', NULL, 22, 9, '#425F57', 1),
(3, 'QC\n', 'แผนกควบคุมคุณภาพ (Quality Control)', NULL, 20, 10, '#379237', 1),
(4, 'PC\n', 'แผนกจัดซื้อ (Purchasing)', NULL, 29, 13, '#C21010', 1),
(5, 'HR\n', 'แผนกบุคคล (Human Resources)', NULL, 27, 4, '#FF8787', 1),
(6, 'AC', 'แผนกบัญชี (Account)', NULL, 24, 1, '#872341', 1),
(7, 'QA', 'แผนกประกันคุณภาพ (Quality Assurance)', NULL, 15, 13, '#ED5AB3', 1),
(8, 'PD', 'ฝ่ายผลิต (Production)', NULL, 4, 9, '#EC8F5E', 1),
(9, 'RD', 'แผนกวิจัยและพัฒนาผลิตภัณฑ์ (R&D)', NULL, 4, 14, '#F3B664', 1),
(10, 'EN', 'แผนกวิศวกรรม (Engineer)', NULL, 26, 7, '#2E97A7', 1),
(11, 'IT', 'แผนกเทคโนโลยีสารสนเทศ (IT)', NULL, 15, 15, '#B0578D', 1),
(12, 'SL', 'ฝ่ายขาย (Sale)', NULL, 12, 9, '#186F65', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_actor`
--

CREATE TABLE `en_actor` (
  `id` int(11) NOT NULL,
  `en_wo_list_id` int(11) DEFAULT NULL COMMENT 'รายการซ่อม',
  `technician_id` int(11) DEFAULT NULL COMMENT 'ผู้ปฎิบัติงาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ผู้ปฎิบัติงาน';

-- --------------------------------------------------------

--
-- Table structure for table `en_category`
--

CREATE TABLE `en_category` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='หมวดหมู่';

--
-- Dumping data for table `en_category`
--

INSERT INTO `en_category` (`id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, 'internal', 'ซ่อมภายใน', 'ช่างจากแผนกวิศวกรรม', '#33BBC5', 1),
(2, 'external', 'ซ่อมภายนอก', 'ช่างจากบริษัทรับเหมาภายนอก', '#ED7D31', 1),
(3, 'it', 'ไอที', 'ช่างจากแผนกไอที', '#362FD9', 0);

-- --------------------------------------------------------

--
-- Table structure for table `en_machine`
--

CREATE TABLE `en_machine` (
  `id` int(11) NOT NULL,
  `machine_code` varchar(45) DEFAULT NULL COMMENT 'รหัสเครื่องจักร',
  `machine_name` varchar(45) DEFAULT NULL COMMENT 'ชื่อเครื่องจักร',
  `last_repair` date DEFAULT NULL COMMENT 'วันที่ซ่อมล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_machine`
--

INSERT INTO `en_machine` (`id`, `machine_code`, `machine_name`, `last_repair`) VALUES
(1, 'ENMC-PD-001', 'ชุดใบกวน Mixing Tank ขนาดถัง 20,000 ลิตร พร้อ', '2023-12-14'),
(2, 'ENMC-PD-002', 'FRP Storage Tank 8 m.^3 (ถัง Cooling B4)', '2023-12-13'),
(3, 'ENMC-PD-003', 'เครื่องสับผสมยีสต์กับถัวหลัง Cooling', '2023-12-12'),
(4, 'ENMC-PD-004', 'ถังกรองน้ำ ขนาด 100  x 150 cm. ', '2023-12-08'),
(5, 'ENMC-PD-005', 'กล่องเสริมสแตนเลส ขนาด 1190 x 1110 x 990 mm.', '2023-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `en_part`
--

CREATE TABLE `en_part` (
  `id` int(11) NOT NULL,
  `photo` text COMMENT 'รูปภาพ',
  `code` varchar(45) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อ',
  `name_en` varchar(255) DEFAULT NULL COMMENT 'ชื่อภาษาอังกฤษ',
  `old_code` varchar(45) DEFAULT NULL COMMENT 'รหัสเก่า',
  `description` text,
  `en_part_doc_id` int(11) NOT NULL COMMENT 'รหัสเอกสาร',
  `en_part_group_id` int(11) DEFAULT NULL COMMENT 'รหัสกลุ่ม',
  `en_part_type_id` int(11) DEFAULT NULL COMMENT 'รหัสประเภท',
  `unit_lg` int(11) DEFAULT NULL COMMENT 'หน่วยนับใหญ่',
  `unit_sm` int(11) DEFAULT NULL COMMENT 'หน่วยนับเล็ก',
  `serial_no` varchar(45) DEFAULT NULL COMMENT 'ซีเรียวนัมเบอร์',
  `price` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT '0' COMMENT 'ราคา',
  `last_date` date DEFAULT NULL COMMENT 'วันที่ล่าสุด',
  `remask` text,
  `imported` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1' COMMENT 'สถานะ',
  `active` int(11) DEFAULT '1' COMMENT 'เปิดใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_part`
--

INSERT INTO `en_part` (`id`, `photo`, `code`, `name`, `name_en`, `old_code`, `description`, `en_part_doc_id`, `en_part_group_id`, `en_part_type_id`, `unit_lg`, `unit_sm`, `serial_no`, `price`, `cost`, `last_date`, `remask`, `imported`, `status`, `active`) VALUES
(1, '', 'IT-P-001', 'asda', 'asdas', 'asdasd', 'asd', 1, 1, 1, 1, 1, 'sss', '999', 999, NULL, '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_part_doc`
--

CREATE TABLE `en_part_doc` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL COMMENT 'รหัส',
  `name` text COMMENT 'ชื่อ',
  `active` int(11) DEFAULT NULL COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_part_doc`
--

INSERT INTO `en_part_doc` (`id`, `code`, `name`, `active`) VALUES
(1, 'SC', 'ค่าบริการ (Service)', 1),
(2, 'O', 'อื่นๆ (Other)', 1),
(3, 'R', 'วัตถุดิบ (Raw Material)', 1),
(4, 'L', 'วัสดุสิ้นเปลืองการผลิต (LPD)', 1),
(5, 'S', 'Supply', 1),
(6, 'P', 'Packing', 1),
(7, 'F', 'Finish Good', 1),
(8, 'W', 'งานระหว่างทำ (WIP)', 1),
(9, 'E', 'วัสดุทางด้านวิศวกรรม (ENGINEER)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_part_group`
--

CREATE TABLE `en_part_group` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(45) DEFAULT NULL COMMENT 'ชื่อ',
  `department_id` int(11) DEFAULT NULL COMMENT 'แผนก',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_part_group`
--

INSERT INTO `en_part_group` (`id`, `code`, `name`, `department_id`, `active`) VALUES
(1, 'WIP', 'Work in process', 8, 1),
(2, 'PA', 'PACKKING', 8, 1),
(3, 'SU', 'SUPPLY', 8, 1),
(4, 'SOYSAUCE', 'SOY SAUCE', 8, 1),
(5, 'SEASONING', 'SEASONING', 8, 1),
(6, 'MISO', 'MISO', 8, 1),
(7, 'VINEGAR', 'ORANGANIC VINEGAR', 8, 1),
(8, 'BARLEY', 'BARLEY PRODUCT', 8, 1),
(9, 'EN', 'อุปกรณ์ทางด้านวิศวกรรม', 10, 1),
(10, 'OE', 'เครื่องใช้สำนักงาน', 5, 1),
(11, 'RM', 'RAW MATERIAL', 8, 1),
(12, 'FG', 'Finish goods', 8, 1),
(13, 'R', 'วัตถุดิบ (Raw Material)', 9, 1),
(14, 'SP', 'ของใช้สิ้นเปลือง', 5, 1),
(15, 'C', 'Chemical', 3, 1),
(16, 'EX', 'ส่งออก (EXPORT)', 2, 1),
(17, 'PPE', 'อุปกรณ์คุ้มครองอันตรายส่วนบุคคล', 5, 1),
(18, 'SC', 'ค่าบริการ (Service Chage)', 8, 1),
(19, 'LPD', 'วัสดุสิ้นเปลืองการผลิต', 8, 1),
(20, 'IT-COMPUTER', 'คอมพิวเตอร์', 11, 1),
(21, 'IT-NETWORK', 'เน็ทเวิร์ค', 11, 1),
(22, 'IT-PRINTER', 'เครื่องพิมพ์', 11, 1),
(23, 'IT-SOFTWARE', 'โปรแกรม', 11, 1),
(24, 'IT-NOTEBOOK', 'โน้ตบุ๊ค', 11, 1),
(25, 'O', 'อื่นๆ  (Other)', 3, 1),
(26, 'S', 'ค่าบริการ (Service Chage)', 3, 1),
(27, 'E', 'อุปกรณ์ (Equipment)', 9, 1),
(28, 'SE', 'อุปกรณ์วิทยาศาสตร์ (Science equipment)', 9, 1),
(29, 'SC', 'ค่าบริการ (Service Chage)', 10, 1),
(30, 'OT', 'อื่นๆ', 10, 1),
(31, 'OTHER', 'อื่นๆ', 8, 1),
(32, 'MC', 'เครื่องจักร', 10, 1),
(33, 'PI', 'อุปกรณ์ท่อ', 10, 1),
(34, 'ST', 'เหล็กรูปพรรณ', 10, 1),
(35, 'ET', 'อุปกรณ์ไฟฟ้า', 10, 1),
(36, 'CA', 'อุปกรณ์สอบเทียบ', 10, 1),
(37, 'SP', 'อุปกรณ์อะไหล่เครื่องจักร', 10, 1),
(38, 'TO', 'อุปกรณ์เครื่องมือ', 10, 1),
(39, 'PJ', 'งานโครงการ', 10, 1),
(40, 'JO', 'ข้อต่อ', 10, 1),
(41, 'VA', 'วาล์ว', 10, 1),
(42, 'CT', 'ก่อสร้าง', 10, 1),
(43, 'MS', 'อุปกรณ์วัด', 10, 1),
(44, 'MCPD', 'เครื่องจักรเกี่ยวกับการผลิต', 10, 1),
(45, 'MCUT', 'เครื่องจักร Utility', 10, 1),
(46, 'SC', 'ค่าบริการ (Service Chage)', 9, 1),
(47, 'EQ', 'อุปกรณ์เครื่องใช้', 10, 1),
(48, 'E', 'Equipment ', 3, 1),
(49, '.', '.', 3, 0),
(50, 'UN', 'เครื่องแต่งกาย', 5, 1),
(51, 'SV', 'ค่าบริการต่างๆ', 5, 1),
(52, 'OT', 'อื่นๆ', 5, 1),
(53, 'SU', 'วัสดุสิ้นเปลืองใช้ไป (Supplies Used)', 2, 1),
(54, 'OTHER', 'อื่นๆ', 2, 1),
(55, 'OT', 'อื่นๆ (Other)', 9, 1),
(56, 'RECYCLE', 'ขยะรีไซเคิล', 8, 1),
(57, 'PC', 'งาน Pest Control', 5, 1),
(58, 'N-MC', 'เครื่องจักร(ซื้อใหม่)', 10, 1),
(59, 'PA-OT', 'ทั่วไป', 1, 1),
(60, 'PA-CE', 'อุปกรณ์ทำความสะอาด', 1, 1),
(61, 'PA-SV', 'ค่าบริการต่างๆ', 1, 1),
(62, 'PA-SP', 'ของใช้สิ้นเปลือง', 1, 1),
(63, 'PA-IT', 'อุปกรณ์ไอที', 1, 1),
(64, 'PA-CM', 'สารเคมี', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_part_type`
--

CREATE TABLE `en_part_type` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(45) DEFAULT NULL COMMENT 'ชื่อ',
  `department_id` int(11) DEFAULT NULL COMMENT 'แผนก',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_part_type`
--

INSERT INTO `en_part_type` (`id`, `code`, `name`, `department_id`, `active`) VALUES
(1, 'MO', 'มอเตอร์', 10, 1),
(3, 'PT', 'อะไหล่เครื่องจักร', 10, 1),
(4, 'TL', 'เครื่องมือ', 10, 1),
(5, 'WG', 'ค่าแรง', 10, 1),
(6, 'SA', 'อุปกรณ์สุขภัณฑ์', 10, 1),
(7, 'PI', 'อุปกรณ์ประปา', 10, 1),
(8, 'ET', 'อุปกรณ์ไฟฟ้า', 10, 1),
(10, 'BD', 'อุปกรณ์ก่อสร้าง', 10, 1),
(11, 'B', 'SCREW  OIL  PRESS  MACHINE', 10, 1),
(22, 'SN', 'หมวดอุปกรณ์เครื่องเขียน', 5, 1),
(23, 'RL', 'Raw Material Liquid', 8, 1),
(24, 'RS', 'Raw Material Solid', 8, 1),
(25, 'PBC', 'Packaging Box Craft Paper', 8, 1),
(26, 'PBO', 'Packaging Box Other', 8, 1),
(27, 'PCC', 'Pakaging Container Can', 8, 1),
(28, 'PCG', 'Pakaging Container Glass', 8, 1),
(29, 'PCP', 'Pakaging Container Plastic or PET', 8, 1),
(30, 'PCS', 'Pakaging Container Sachet', 8, 1),
(31, 'PLP', 'Pakaging Label Paper', 8, 1),
(32, 'PLS', 'Pakaging Label Sticker', 8, 1),
(33, 'PSF', 'Pakaging Seal Foil', 8, 1),
(34, 'PSM', 'Pakaging Seal Metal Cap', 8, 1),
(35, 'PSO', 'Pakaging Seal Other', 8, 1),
(36, 'PSP', 'Pakaging Seal Plastic Cap', 8, 1),
(37, 'PSS', 'Pakaging Seal Shrink Film', 8, 1),
(38, 'QC-01', 'สารเคมีlab', 3, 1),
(39, 'FJ', 'Japanese Soy Sauce', 8, 1),
(40, 'FB', 'Barley Coffee ot Tea', 8, 1),
(41, 'FC', 'Chinese Soy Sauce', 8, 1),
(42, 'FS', 'Seasoning Sauce', 8, 1),
(43, 'FF', 'Fairtrade Product', 8, 1),
(44, 'FM', 'Miso', 8, 1),
(45, 'FV', 'Vinegar', 8, 1),
(46, 'SFO', 'Supply', 8, 1),
(47, 'QC-02', 'อุปกรณ์lab', 3, 1),
(48, 'QC-03', 'วิเคราะห์คุณภาพ  External  Lab', 3, 1),
(49, 'WIP', 'Work In Process', 8, 1),
(50, 'RE', 'อุปกรณ์ซ่อมแซม (Repair eguipment)', 2, 1),
(51, 'RD-01', 'งานทดลอง', 9, 1),
(52, 'RD-02', 'ค่าส่งตัวอย่าง', 9, 1),
(53, 'QR-04', 'เชื้อจุลินทรีย์', 3, 1),
(54, 'RD-03', 'อุปกรณ์ บรรจุภัณฑ์', 9, 1),
(55, 'CE', 'หมวดอุปกรณ์ทำความสะอาด', 5, 1),
(56, 'NOTEBOOK', 'โน้ตบุ๊ค', 11, 1),
(57, 'DESKTOP PC', 'คอมพิวเตอร์', 11, 1),
(58, 'HARDWARE', 'อุปกรณ์คอมพิวเตอร์', 11, 1),
(59, 'STORAGE', 'อุปกรณ์จัดเก็บข้อมูล', 11, 1),
(60, 'ACCESSORIES', 'อุปกรณ์เสริมคอมพิวเตอร์', 11, 1),
(61, 'PERIPHERALS', 'อุปกรณ์ต่อพ่วง', 11, 1),
(62, 'PRINTER', 'อุปกรณ์การพิมพ์', 11, 1),
(63, 'SOFTWARE', 'โปรแกรม', 11, 1),
(64, 'NETWORK', 'อุปกรณ์เน็ตเวิร์ค', 11, 1),
(65, 'CCTV', 'กล้องวงจรปิด', 11, 1),
(66, 'FT', 'ฟิตติ้ง', 10, 1),
(67, 'PS', 'แรงดัน', 10, 1),
(68, 'FO', 'Oill', 8, 1),
(69, 'OT', 'Others', 8, 1),
(70, 'UP', 'UPVC', 10, 1),
(71, 'PV', 'PVC', 10, 1),
(72, 'KA', 'กาวาไนท์', 10, 1),
(73, 'ST', 'สตรีม', 10, 1),
(74, 'RB', 'สายยาง', 10, 1),
(75, 'OT', 'อื่นๆ', 10, 1),
(76, 'SL', 'สแตนเลส', 10, 1),
(77, 'IR', 'เหล็ก', 10, 1),
(78, 'WI', 'สายไฟ', 10, 1),
(79, 'PD', 'เครื่องจักรผลิต', 10, 1),
(80, 'FL', 'กรอง Filter', 10, 1),
(81, 'EQ', 'อุปกรณ์,ท่อร้อยสาย', 10, 1),
(82, 'BR', 'ทองเหลือง', 10, 1),
(83, 'CA', 'สอบเทียบ , ใบรับรอง', 10, 1),
(84, 'TM', 'Transmission (ระบบส่งกำลัง)', 10, 1),
(85, 'PM', 'งานซ่อมบำรุง', 10, 1),
(86, 'CT', 'อุปกรณ์ควบคุม', 10, 1),
(87, 'UT', 'utility', 10, 1),
(88, 'OL', 'น้ำมัน,สารหล่อลื่น,น้ำยา', 10, 1),
(89, 'NS', 'น๊อต,สกรู', 10, 1),
(90, 'BE', 'ลูกปืน,แบริ่ง', 10, 1),
(91, 'CS', 'ของใช้สิ้นเปลือง (ใบตัด แก็ส)', 10, 1),
(92, 'SO', 'ซีล โอริง ปะเก็น', 10, 1),
(93, 'TE', 'อุณหภูมิ', 10, 1),
(94, 'C', 'RAW  MATERIAL TREATMENT EQUIPMENT', 10, 1),
(95, 'D', 'HEAPING EQUIPMENT', 10, 1),
(96, 'E', 'KOJI MAKING EQUIPMENT AND DE-KOJI', 10, 1),
(97, 'PJ', 'งานโครงการ', 10, 1),
(98, 'LI', 'หลอดไฟ', 10, 1),
(99, 'SV', 'วาล์วสตีม', 10, 1),
(100, 'PA', 'สี', 10, 1),
(101, 'EL', 'เครื่องใช้ไฟฟ้า', 10, 1),
(102, 'PU', 'ปั๊ม', 10, 1),
(103, 'KO', 'Koicuchi', 8, 1),
(104, 'TA', 'Tamari', 8, 1),
(105, 'KOR', 'Koikuchi - Rice', 8, 1),
(106, 'OR', 'FT or Organic', 8, 1),
(107, 'PN', 'Pneumatic', 10, 1),
(108, 'F', 'FERMENTATION TANK', 10, 1),
(109, 'G', 'SALT DISSOLVING EQUIPMENT', 10, 1),
(110, 'WR', 'WRENCH (ประแจ)', 10, 1),
(111, 'WE', 'Weight น้ำหนัก', 10, 1),
(112, 'H', 'MOROMI PREESS EQUIPMENT', 10, 1),
(113, 'I', 'CAKE TREATMENT EQUIPMENT', 10, 1),
(114, 'J', 'RAW SOY SAUCE STORAGE EQUIPMENT', 10, 1),
(115, 'K', 'CLARIFYING EQUIPMENT', 10, 1),
(116, 'L', 'ELCETROMAGNETIC FLOW METER', 10, 1),
(117, 'M', 'MAINTENANCE', 10, 1),
(118, 'N', 'STEAM   SYSTEM', 10, 1),
(119, 'O', 'WATER  TOWER', 10, 1),
(120, 'P', 'WASTE WATER SYSTEM', 10, 1),
(121, 'Q', 'CCTV SYSTEM', 10, 1),
(122, 'R', ' VINEGAR EQUIPMENT', 10, 1),
(123, 'S', 'WARE HOUSE EQUIPMENT', 10, 1),
(124, 'T', 'FORKLIFT  TRUCK , X-LIFT', 10, 1),
(125, 'U', 'PACKING  MACHINE', 10, 1),
(126, 'V', 'AIR  CONDITIONER (SPLIT TYPE)', 10, 1),
(127, 'W', 'WEIGHT', 10, 1),
(129, 'B', 'SCREW  OIL  PRESS  MACHINE', 10, 1),
(130, ' EQ', 'อุปกรณ์เครื่องใช้', 10, 1),
(131, 'PPE', 'หมวดอุปกรณ์ความปลอดภัย', 5, 1),
(132, 'FC', 'หมวดสิ่งอำนวยความสะดวก', 5, 1),
(133, 'SV', 'หมวดค่าบริการต่างๆ', 5, 1),
(134, 'UN', 'หมวดเครื่องแต่งกาย', 5, 1),
(135, 'OT', 'อื่นๆ', 2, 1),
(136, 'Delivery Cost', 'ค่าขนส่ง', 2, 1),
(137, 'OT', 'หมวดอื่นๆ', 5, 1),
(138, 'RD-04', 'อุปกรณ์ทั่วไป', 9, 1),
(139, 'PE', 'HDPE', 10, 1),
(140, 'HY', 'Hydraulics', 10, 1),
(141, 'X', 'MAGNETIC', 10, 1),
(142, 'Y', 'THERMOMETER', 10, 1),
(143, 'Z', 'PRESSURE GUAGE', 10, 1),
(144, 'FR', 'Rice Sauce', 8, 1),
(145, 'FD', 'Dipping Sauce', 8, 1),
(146, 'PPR', 'PPR', 10, 1),
(147, 'FN', 'Coconut amino', 8, 1),
(148, 'PC', 'หมวดแมลงและสัตว์พาหะ (Pest Control)', 5, 1),
(149, 'OT', 'ทั่วไป', 1, 1),
(150, 'CE', 'อุปกรณ์ทำความสะอาด', 1, 1),
(151, 'SV', 'ค่าบริการ', 1, 1),
(152, 'CM', 'สารเคมี', 1, 1),
(153, 'SP', 'ของใช้สิ้นเปลือง', 1, 1),
(154, 'IT', 'อุปกรณ์ไอที', 1, 1),
(155, 'TOOLS', 'เครื่องมือ', 11, 1),
(156, 'BL', 'บอลวาว์ล', 10, 1),
(157, 'BU', 'บัตเตอร์ฟลาย', 10, 1),
(158, 'GB', 'โกล์บวาว์ล', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_priority`
--

CREATE TABLE `en_priority` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_priority`
--

INSERT INTO `en_priority` (`id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, 'low', 'ต่ำ', 'ไม่มีผลกระทบต่อการผลิต', '#274e13', 1),
(2, 'nomal', 'กลาง', 'กระทบต่อการผลิตเฉพาะจุดที่ทำ', '#fd9500', 1),
(3, 'Hight', 'สูง', 'กระทบต่อการหยุดผลิตทั้งหมด', '#ff0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_rp`
--

CREATE TABLE `en_rp` (
  `id` int(11) NOT NULL,
  `repair_code` varchar(45) DEFAULT NULL COMMENT 'เลขที่เอกสาร',
  `priority` int(11) DEFAULT NULL COMMENT 'ความสำคัญ',
  `urgency` int(11) DEFAULT NULL COMMENT 'ความเร่งด่วน',
  `created_date` date DEFAULT NULL COMMENT 'วันที่แจ้ง',
  `request_by` int(11) DEFAULT NULL COMMENT 'ผู้ร้องขอ',
  `department` int(11) DEFAULT NULL COMMENT 'แผนก',
  `request_title` varchar(255) DEFAULT NULL COMMENT 'หัวเรื่อง',
  `remask` text COMMENT 'หมายเหตุ',
  `created_at` date DEFAULT NULL COMMENT 'จัดทำเมื่อ',
  `updated_at` date DEFAULT NULL COMMENT 'ปรับปรุงเมื่อ',
  `created_by` int(11) DEFAULT NULL COMMENT 'ผู้จัดทำ',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ปรับปรุงโดย',
  `en_status_id` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ใบแจ้งซ่อม';

--
-- Dumping data for table `en_rp`
--

INSERT INTO `en_rp` (`id`, `repair_code`, `priority`, `urgency`, `created_date`, `request_by`, `department`, `request_title`, `remask`, `created_at`, `updated_at`, `created_by`, `updated_by`, `en_status_id`) VALUES
(1, 'RP-6611-0001', 2, 1, '2023-12-14', 12, 11, 'ทดสอบ', 'ไม่มี', '2023-12-14', '2023-12-14', 11, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_rp_approve`
--

CREATE TABLE `en_rp_approve` (
  `id` int(11) NOT NULL,
  `wo_id` int(11) DEFAULT NULL,
  `approver` varchar(255) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ผู้จัดการแผนก';

-- --------------------------------------------------------

--
-- Table structure for table `en_rp_list`
--

CREATE TABLE `en_rp_list` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL COMMENT 'ใบแจ้งซ่อม',
  `detail_list` varchar(255) DEFAULT NULL COMMENT 'รายการ',
  `request_date` date DEFAULT NULL COMMENT 'วันที่ต้องการ',
  `broken_date` date DEFAULT NULL COMMENT 'วันที่เสีย',
  `amount` int(11) DEFAULT '1' COMMENT 'จำนวน',
  `location` int(11) DEFAULT NULL COMMENT 'สถานที่',
  `image` text COMMENT 'รูปภาพ',
  `remask` text COMMENT 'หมายเหตุ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `en_status`
--

CREATE TABLE `en_status` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'สถานะ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_status`
--

INSERT INTO `en_status` (`id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, 'R', 'Request Repair', 'แจ้งงานโดยผู้ใช้งาน', '#ff0000', 1),
(2, 'H', 'Head Approved', 'หัวหน้างานอนุมัติ', '#9900ff', 1),
(3, 'W', 'Work Order', 'อยู่ในขั้นตอนขออนุมัติซ่อมของแผนกวิศวกรรม', '#0000ff', 1),
(4, 'E', 'Engineer Approved', 'ผู้จัดการแผนกวิศวกรรมอนุมัติดำเนินการซ่อม', '#ff9900', 1),
(5, 'S', 'Success', 'งานซ่อมสำเร็จ ปิดงาน', '#1A5D1A', 1),
(6, 'P', 'Postponed', 'เลื่อนการซ่อมออกไป', '#ff00ff', 1),
(7, 'C', 'Canceled', 'ยกเลิกโดยผู้ใช้งาน', '#000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_team`
--

CREATE TABLE `en_team` (
  `id` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อทีม',
  `logo_team` varchar(255) DEFAULT NULL COMMENT 'โลโก้ทีม',
  `head_team` int(11) DEFAULT NULL COMMENT 'หัวหน้าทีม',
  `technician1` int(11) DEFAULT NULL COMMENT 'สมาชิก1',
  `technician2` int(11) DEFAULT NULL COMMENT 'สมาชิก2',
  `technician3` int(11) DEFAULT NULL COMMENT 'สมาชิก3',
  `technician4` int(11) DEFAULT NULL COMMENT 'สมาชิก4',
  `technician5` int(11) DEFAULT NULL COMMENT 'สมาชิก5',
  `technician6` int(11) DEFAULT NULL COMMENT 'สมาชิก6',
  `technician7` int(11) DEFAULT NULL COMMENT 'สมาชิก7',
  `technician8` int(11) DEFAULT NULL COMMENT 'สมาชิก8',
  `technician9` int(11) DEFAULT NULL COMMENT 'สมาชิก9',
  `technician10` int(11) DEFAULT NULL COMMENT 'สมาชิก10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `en_technician`
--

CREATE TABLE `en_technician` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL COMMENT 'รูปภาพ',
  `tel` varchar(45) DEFAULT NULL COMMENT 'เบอร์ติดต่อ',
  `active` int(11) DEFAULT NULL COMMENT 'สถานะ',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `head` int(11) DEFAULT NULL COMMENT 'หัวหน้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลช่าง';

--
-- Dumping data for table `en_technician`
--

INSERT INTO `en_technician` (`id`, `photo`, `tel`, `active`, `name`, `head`) VALUES
(1, 'sam.png', '0870873830 (31)', 0, 'ธีรพงศ์ ขันตา', 11),
(2, '', '053673985 (26)', 1, 'ทดสอบ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `en_unit`
--

CREATE TABLE `en_unit` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อ',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_unit`
--

INSERT INTO `en_unit` (`id`, `code`, `name`, `active`) VALUES
(1, 'กก.\n', 'กิโลกรัม\n', 1),
(2, 'ก.', 'กรัม\r\n', 1),
(3, 'ล.', 'ลิตร\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_upload`
--

CREATE TABLE `en_upload` (
  `id` int(11) NOT NULL,
  `ref` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `real_filename` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `en_urgency`
--

CREATE TABLE `en_urgency` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_urgency`
--

INSERT INTO `en_urgency` (`id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, 'Normal', 'ปกติ', 'ฉุกเฉินไม่เร่งด่วน', '#025464', 1),
(2, 'Urgent', 'ด่วน', 'ฉุกเฉินเร่งด่วน', '#F86F03', 1),
(3, 'Most urgent', 'ด่วนที่สุด', 'ฉุกเฉินวิกฤติ', '#FE0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_warehouse`
--

CREATE TABLE `en_warehouse` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อ',
  `lot` int(11) DEFAULT '1' COMMENT 'ล็อต',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_warehouse`
--

INSERT INTO `en_warehouse` (`id`, `code`, `name`, `lot`, `color`, `active`) VALUES
(1, '1', 'คลังหลักโรงงาน\r\n', 1, '#711DB0', 1),
(2, '2', 'คลังชำรุด1\r\n', 1, '#B31312', 1),
(3, '3', 'คลังส่งเสริมการเกษตร\r\n', 1, '#A6CF98', 1),
(4, '4', 'คลังธุรการ\r\n', 1, '#ED5AB3', 1),
(5, '5', 'คลังนวนคร\r\n', 1, '#22092C', 1),
(6, '6', 'คลังรังสิต\r\n', 1, '#872341', 1),
(7, '7', 'คลังวิศวกรรม\r\n', 1, '#0766AD', 1),
(8, '8', 'คลังงานระหว่างทำ\r\n', 1, '#FFC5C5', 1),
(9, '9', 'คลังสินค้า\r\n', 1, '#711DB0', 1),
(10, '10', 'คลังควบคุมคุณภาพ\r\n', 1, '#E36414', 1),
(11, '11', 'คลังวิจัยและพัฒนาผลิตภัณฑ์\r\n', 1, '#C21292', 1),
(12, '12', 'คลังผลิต\r\n', 1, '#3559E0', 1),
(13, '13', 'คลังฝ่ายจัดซื้อ\r\n', 1, '#0F2167', 1),
(14, '14', 'ลูกค้า\r\n', 1, '#E26EE5', 1),
(15, '15', 'บุคคล\r\n', 1, '#607274', 1),
(16, '16', 'คลังฝ่ายเทคโนโลยีสารสนเทศ', 1, '#304D30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_wo`
--

CREATE TABLE `en_wo` (
  `id` int(11) NOT NULL,
  `rp_id` int(11) DEFAULT NULL COMMENT 'รายการซ่อม',
  `title` varchar(255) DEFAULT NULL COMMENT 'เรื่อง',
  `description` text COMMENT 'รายละเอียด',
  `work_code` varchar(45) DEFAULT NULL COMMENT 'เลขที่ใบสั่งซ่อม',
  `work_date` date DEFAULT NULL COMMENT 'วันที่',
  `machine_id` int(11) DEFAULT NULL COMMENT 'เครื่องจักร',
  `location` varchar(255) DEFAULT NULL COMMENT 'สถานที่',
  `work_type_id` int(11) DEFAULT NULL COMMENT 'ประเภทงาน',
  `work_start` date DEFAULT NULL COMMENT 'วันที่เริ่มต้นซ่อม',
  `work_end` date DEFAULT NULL COMMENT 'วันที่กำหนดเสร็จ',
  `ref` text COMMENT 'อ้างอิง',
  `category_id` int(11) DEFAULT NULL COMMENT 'ประเภทการส่งซ่อม',
  `workclass_id` int(11) DEFAULT NULL,
  `work_method` text COMMENT 'วิธีการ',
  `service_date` date DEFAULT NULL COMMENT 'วันที่บริการ',
  `frequency` int(11) DEFAULT NULL COMMENT 'ความถี่',
  `remask` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_wo`
--

INSERT INTO `en_wo` (`id`, `rp_id`, `title`, `description`, `work_code`, `work_date`, `machine_id`, `location`, `work_type_id`, `work_start`, `work_end`, `ref`, `category_id`, `workclass_id`, `work_method`, `service_date`, `frequency`, `remask`) VALUES
(1, 1, 'ทดสอบ ใบสั่งซ่อม', 'ไม่มี', 'WO-6612-0001', '2023-12-15', 1, '1', 3, '2023-12-15', '2023-12-18', NULL, 1, 2, 'ซ่อมทั่วๆไป', '2023-12-18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `en_workclass`
--

CREATE TABLE `en_workclass` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `en_workclass`
--

INSERT INTO `en_workclass` (`id`, `code`, `name`, `active`) VALUES
(1, 'C-001', 'ทำความสะอาดทั่วไป', 1),
(2, 'I-001', 'ตรวจเช็คระบบไฟฟ้า', 1),
(3, 'I-002', 'ตรวจเช็คระบบกลไก', 1),
(4, 'I-003', 'ตรวจเช็คตลับลูกปืน', 1),
(5, 'I-004', 'ตรวจเช็คการรั่วของลม', 1),
(6, 'I-005', 'ตรวจเช็คระบบส่งถ่าย', 1),
(7, 'I-006', 'ตรวจเช็คสภาพภายนอก', 1),
(8, 'C-002', 'ทำความสะอาดชิ้นส่วนเครื่องจักร', 1),
(9, 'L-001', 'เติม/เปลี่ยน-น้ำมันหล่อลื่นชุดเฟืองตัวหนอน', 1),
(10, 'L-002', 'เติม/เปลี่ยน-จารบีหล่อลื่นชุดเฟืองตัวหนอน', 1),
(11, 'L-003', 'เติม/เปลี่ยน-น้ำมันหล่อลื่นชุดเฟืองทด', 1),
(12, 'L-004', 'เติม/เปลี่ยน-จารบีหล่อลื่นชุดเฟืองทด', 1),
(13, 'L-005', 'อัดจารบีธรรมดา', 1),
(14, 'L-006', 'อัดจารบีฟู้ดเกรด', 1),
(15, 'L-007', 'อัดจารบีทนความร้อน', 1),
(16, 'A-075', 'ปรับตั้งความตึงสายพานกระพ้อ', 1),
(17, 'A-002', 'ปรับตั้งโซ่ขับ', 1),
(18, 'A-003', 'ปรับตั้งสายพานลำเลียง', 1),
(19, 'A-004', 'ปรับตั้งตัวรับสัญญาณต่างๆ', 1),
(20, 'T-001', 'ขันแน่นน๊อตฐานมอเตอร์และชุดเกียร์', 1),
(21, 'T-002', 'ขันแน่นน๊อตยึดชุดตลับลูกปืน', 1),
(22, 'C-003', 'ทำความสะอาดชุดกรองอากาศ', 1),
(23, 'T-003', 'ขันแน่นจุดต่อไฟฟ้า', 1),
(24, 'C-004', 'ทำความสะอาดพัดลมหัว-ท้าย', 1),
(25, 'A-005', 'ตรวจสัมผัสความร้อน,เสียง,สั่น,กลิ่น,ผิดปกติ', 1),
(26, 'L-008', 'อัดจารบีแบริ่งหัว-ท้ายมอเตอร์', 1),
(27, 'A-007', 'วัดค่าความร้อน,วัดค่าความสั่น,วัดแบริ่ง', 1),
(28, 'A-008', 'การรั่วซึ่มของน้ำมัน ', 1),
(29, 'I-007', 'ตรวจเช็คการทำงานของคาปาซิเตอร์', 1),
(30, 'I-009', 'บันทึกค่าแรงเคลื่อนไฟฟ้า กระแสไฟฟ้า', 1),
(32, 'I-010', 'บันทึกค่าเพาเวอร์เฟคเตอร์ (P.F.)', 1),
(33, 'I-011', 'บันทึกปริมาณการใช้ไฟฟ้า(Kw/hr)', 1),
(34, 'A-009', 'ปรับ ตั้ง เปลี่ยน', 1),
(35, 'L-015', 'หยดน้ำมันเครื่อง', 1),
(36, 'A-006', 'ความผิดปกติของเสียง ', 1),
(37, 'C-005', 'ทำความสะอาดถุงผ้าดักฝุ่น', 1),
(38, 'I-179', 'ปริมาณน้ำมัน', 1),
(39, 'I-180', 'อัตราการปั๊ม', 1),
(40, 'C-006', 'ล้างทำความสะอาด', 1),
(41, 'I-182', 'การสึกกร่อน', 1),
(42, 'I-183', 'การหย่อน', 1),
(43, 'I-181', 'ไม่ผุกร่อน', 1),
(44, 'I-184', 'การรั่วของคอปั๊ม  ', 1),
(45, 'L-009', 'อัดจารบี ฟู้ดเกรดลูกปืนแกน', 1),
(46, 'I-185', 'เป็นสนิม', 1),
(47, 'C-007', 'แปรงขัด', 1),
(48, 'I-186', 'ความผิดปกติหัวฉีดน้ำมันเกียร์', 1),
(49, 'C-008', 'ล้างกรอง Y-Stainer', 1),
(50, 'C-009', 'ทำความสะอาดภายในถัง ', 1),
(51, 'A-010', 'ปรับ ตั้ง', 1),
(52, 'L-010', 'ใช้แปรงปัดอัดจารบีฟู้ดเกรด', 1),
(53, 'L-011', 'อัดจารบี ฟู้ดเกรดตลับลูกปืน', 1),
(54, 'A-011', 'ติดตั้ง', 1),
(55, 'C-010', 'การอุดตัน และการทำความสะอาด กรองอากาศ', 1),
(56, 'C-011', 'ทำความสะอาดเครื่องจักร ', 1),
(57, 'I-187', 'ความผิดปกติของสปริง,งอ,แตกร้าว', 1),
(58, 'I-188', 'สนิมที่ใบมีด', 1),
(59, 'I-189', 'การสึกกร่อนของโซ่', 1),
(60, 'I-190', 'รัวและหมดสภาพ', 1),
(61, 'I-191', 'การรัว และการแตกร้าวชุดเกียร์ ', 1),
(62, 'L-014', 'การหยอดน้ำมันลูกรอก', 1),
(63, 'I-192', 'การสั่นสะเทือน', 1),
(64, 'I-193', 'การรั่วของข้อต่อ', 1),
(65, 'I-194', 'ความผิดปกติของระยะเวลาการWorm-Up', 1),
(66, 'I-200', 'การมีเสียงเตือน', 1),
(68, 'I-203', 'ไม่ดังผิดปกติ/กระแสไม่สูงเกิน', 1),
(69, 'I-201', 'การไหม้และการเกิดควัน', 1),
(70, 'I-204', 'ไม่แตกหัก/ตัวยึดครบ', 1),
(71, 'I-219', 'ตรวจเช็คความผิดปกติของสกรู', 1),
(72, 'I-205', 'ไม่ชำรุด/บิดงอ/หลวมคลอน', 1),
(73, 'I-198', 'การติดของระบบไฟ', 1),
(74, 'L-012', 'แปรงขัดและทาจารบี ฟู้ดเกรด', 1),
(75, 'I-199', 'มีเสียงเตือน', 1),
(76, 'I-197', 'ตรวจเช็คความผุกร่อนการเสื่อมสภาพ', 1),
(77, 'I-178', 'ตรวจเช็คการฝืด', 1),
(78, 'I-195', 'การสึกหรอและประสิทธภาพ', 1),
(79, 'I-206', 'ไม่ผุพัง/ไม่เสียรูป', 1),
(80, 'I-012', 'ตรวจเช็คน้ำ Softener ก่อนเข้า Boiler', 1),
(81, 'I-013', 'ตรวจเช็คน้ำ Softener ก่อนเข้า Line ผลิต', 1),
(82, 'I-014', 'ตรวจเช็คการทำงานของเครื่องเติมอากาศ', 1),
(83, 'I-015', 'ตรวจเช็คปั๊มบ่อSum', 1),
(84, 'I-016', 'ตรวจเช็คปั๊มบ่อน้ำเสีย', 1),
(85, 'I-017', 'ตรวจเช็คค่าแรงดันและกระแสที่ตู้เมน', 1),
(87, 'I-019', 'ตรวจเช็คปริมาณน้ำเสียเข้าระบบต่อวัน', 1),
(88, 'I-020', 'ตรวจเช็คปริมาณน้ำเสียปล่อยออกต่อวัน', 1),
(89, 'I-021', 'ตรวจเช็คคุณภาพน้ำออก', 1),
(90, 'I-022', 'ตรวจเช็คการใช้น้ำบาดาลจากบ่อบาดาล', 1),
(91, 'I-023', 'การตรวจเช็คการผสมน้ำคลอรีน', 1),
(92, 'I-024', 'ตรวจเช็คระดับน้ำคลอรีนในถัง', 1),
(93, 'I-025', 'ตรวจเช้คระบบFeedคลอรีน', 1),
(94, 'I-026', 'ตรวจเช็คปริมาณการใช้น้ำ', 1),
(95, 'I-027', 'ตรวจเช็คการอุดตันของเครื่องกรองน้ำ(ไม่เกิน3%)', 1),
(96, 'I-028', 'ตรวจเช็คและล้างกรอง', 1),
(97, 'I-029', 'ตรวจเช็คทำความสะอาดภายนอกถัง', 1),
(98, 'I-030', 'ตรวจเช็คสิ่งเจื่อปนในน้ำ', 1),
(99, 'I-031', 'ตรวจเช็คระบบสูบน้ำอัตโนมัติ', 1),
(100, 'I-032', 'ตรวจเช็คระดับน้ำมันเชื้อเพลิง', 1),
(101, 'I-033', 'ตรวจเช็ครอยรั่วของถังน้ำมันเชื้อเพลิง', 1),
(102, 'I-034', 'ตรวจเช็คการรั่วซึมของถังน้ำมันเครื่อง', 1),
(103, 'I-035', 'ตรวจเช็คระดับน้ำมันเครื่อง', 1),
(104, 'I-036', 'ตรวจเช็คการรั่วซึมของท่อน้ำดับเพลิง', 1),
(106, 'I-038', 'ตรวจเช็คสายพานหน้าเครื่อง', 1),
(107, 'I-039', 'ตรวจเช็คกรองอากาศ', 1),
(108, 'I-040', 'ตรวจเช็คระดับบน้ำกลั่นในแบตเตอรี่', 1),
(109, 'I-041', 'ตรวจเช็คความสะอาดพื้นที่โดยรวม', 1),
(110, 'I-042', 'ตรวจเช็คตู้ควบคุม', 1),
(111, 'I-043', 'ตรวจเช็คการ Test run เครื่อง', 1),
(112, 'I-044', 'ตรวจเช็คทำความสะอาดฟิลเตอร์', 1),
(113, 'I-045', 'ตรวจเช็คทำความสะอาดคอนเดนเซอร์', 1),
(114, 'I-046', 'ตรวจเช็คท่อน้ำทิ้ง', 1),
(115, 'I-047', 'ตรวจเช็คพัดลม Fancoil', 1),
(116, 'I-048', 'ตรวจเช็คพัดลมคอนเดนเซอร์', 1),
(117, 'I-049', 'ตรวจเช็คทำความสะอาดภายนอกเครื่อง', 1),
(118, 'I-050', 'ตรวจเช็คค่ากระแสไฟฟ้า และแรงดัน', 1),
(119, 'I-051', 'ตรวจเช็ครอยรั่วของน้ำยา', 1),
(120, 'I-052', 'ตรวจเช็ครอยรั่วของน้ำมันหม้อแปลง', 1),
(121, 'I-053', 'ตรวจเช็คสารกรองความชื้น', 1),
(122, 'I-054', 'ตรวจเช็คการอาร์คของพุชชิ่ง', 1),
(123, 'I-055', 'ตรวจเช็คบริเวณที่มีสภาพแวดล้อม', 1),
(124, 'I-056', 'ตรวจเช็คบริเวณที่ถูกน้ำถ่วนขัง', 1),
(125, 'I-057', 'ตรวจเช็คบริเวณที่มีฝุ่นและควัน', 1),
(126, 'I-058', 'ตรวจเช็คพื้นผิวทางเดินและถนน', 1),
(127, 'I-059', 'ตรวจเช็คการอุดตันของท่อระบายน้ำ', 1),
(128, 'I-060', 'ตรวจเช็คพื้นที่บริเวณส่วนปฏิบัติงาน', 1),
(129, 'I-061', 'ตรวจเช็คสีและรอยแตกร้าวของผนัง', 1),
(130, 'I-062', 'ตรวจเช็คข้อต่อสายแรงสูง แรงต่ำเช่น การอาร์ค', 1),
(131, 'I-063', 'ตรวจเช็คลูกถ้วยดูการแตกร้าว', 1),
(133, 'I-065', 'ตรวจเช็ครอยซึมของวาวล์ถ่ายน้ำมัน', 1),
(134, 'I-066', 'ตรวจเช็คสภาพทั่วไปของแผงจ่ายไฟ', 1),
(135, 'I-067', 'ตรวจเช็ความสะอาดภายนอกตู้', 1),
(136, 'I-068', 'ตรวจเช็คทำความสะอาดบริเวณห้องเครื่องไฟฟ้า', 1),
(137, 'I-069', 'ตรวจเช็คขัว และขาหลอด (ไฟสว่าง)', 1),
(138, 'I-221', 'ตรวจเช็ค Circuit Breaker', 1),
(139, 'I-071', 'ตรวจเช็คความเสื่อมสภาพของสตาร์ทเตอร์', 1),
(140, 'I-072', 'ตรวจเช็คการอาร์ค และการเสื่อมสภาพ (เต้ารับ)', 1),
(141, 'I-073', 'ตรวจเช็คการอาร์ค และการเสื่อมสภาพ (สวิทซ์)', 1),
(142, 'I-074', 'ตรวจเช็คจุดต่อของสายตัวนำ(สายตัวนำ)', 1),
(143, 'I-075', 'ตรวจเช็คการทำความสะอาด (หลอดไฟ&ดวงโคม)', 1),
(144, 'I-076', 'ตรวจเช็คทำความสะอาดภายในแผงจ่ายไฟ', 1),
(145, 'I-077', 'ตรวจเช็คค่ากระแสของแต่ละเซอร์กิต (Amp)', 1),
(146, 'I-078', 'ตรวจเช็คทำความสะอาด BUS DUCT และท่อเมนไฟฟ้า', 1),
(147, 'I-079', 'ตรวจเช็คปริมาณน้ำมันหม้อแปลง', 1),
(148, 'I-080', 'ตรวจเช็คพืช และวัชพืชรอบๆ หม้อแปลง', 1),
(149, 'I-081', 'ตรวจเช็คระบบไอดีสภาพกรองอากาศ', 1),
(150, 'I-082', 'ตรวจเช็คระบบไอดีอากาศรั่วที่ข้อต่อ', 1),
(151, 'I-083', 'ตรวจเช็คระบบไอเสียหม้อพักท่อไอเสีย', 1),
(152, 'I-084', 'ตรวจเช็คระบบไอเสียน้ำมันรั่วที่เทอโบ', 1),
(153, 'I-085', 'ตรวจเช็คระบบไอดีโครงยึดรับท่อไอเสีย', 1),
(155, 'I-087', 'ตรวจเช็คระดับน้ำมันเชื้อเพลิงในถังกักเก็บ', 1),
(156, 'I-088', 'ตรวจเช็ครอยรั่วของน้ำมัน', 1),
(157, 'I-089', 'ตรวจเช็คเเรงดันน้ำมันเครื่อง', 1),
(158, 'I-090', 'ตรวจเช็ควัดรอบเครื่องยนต์', 1),
(159, 'I-091', 'ตรวจเช็คแผงควบคุม', 1),
(160, 'I-092', 'ตรวจเช็คอุณหภูมิน้ำหล่อเย็น', 1),
(161, 'I-093', 'ตรวจเช็คน้ำกลั่นแบตเตอรรี่', 1),
(162, 'I-094', 'ตรวจเช็คแรงดัน ดี.ซี.แบตเตอรรี่', 1),
(163, 'I-095', 'ตรวจเช็คการ test tung เครื่อง', 1),
(164, 'I-096', 'ตรวจเช็คกรองน้ำมันเชื้อเพลิง', 1),
(165, 'I-097', 'ตรวจเช็คการรั่วของถัง,ท่อสายน้ำมันเชื้อเพลิง ', 1),
(166, 'I-098', 'ตรวจเช็คน้ำมันเครื่องบายพาส', 1),
(167, 'I-099', 'ตรวจเช็คการรั่วซึมของน้ำมันเครื่อง', 1),
(168, 'I-100', 'ตรวจเช็คระดับน้ำในหม้อน้ำ', 1),
(169, 'I-101', 'ตรวจเช็คสภาพหม้อน้ำ,ฝาใบพัดลม', 1),
(170, 'I-102', 'ตรวจเช็คการรั่วซึมของหม้อน้ำ', 1),
(171, 'I-103', 'ตรวจเช็คสิ่งสกปรกของรังผึ้ง', 1),
(172, 'I-104', 'ตรวจเช็คสวิทซ์ และสัญญาณไฟแผงควบคุม', 1),
(173, 'I-105', 'ตรวจเช็คระดับน้ำมันเครื่อง', 1),
(175, 'I-107', 'ตรวจเช็คความตึงของระดับสายพาน', 1),
(176, 'I-108', 'ตรวจเช็ควาวล์นิรภัย', 1),
(177, 'I-109', 'ตรวจเช็คสวิตช์ และสัญญาณไฟแผงควบคุม', 1),
(178, 'I-110', 'ระดับน้ำมันในถัง (ไม่ต่ำกว่า600 L)', 1),
(179, 'C-013', 'ทำความสะอาดไส้กรองแยกน้ำมัน', 1),
(180, 'L-013', 'อัดจารบีมอเตอร์', 1),
(181, 'C-014', 'ทำความสะอาด Ari Cooler', 1),
(182, 'I-207', 'ความผิดปกติของแหวนล็อค', 1),
(183, 'C-016', 'ทำความสะอาดกรองอากาศ', 1),
(184, 'C-012', 'ทำความสะอาดภายในและภายนอกตู้คอนโทรล', 1),
(189, 'I-115', 'ตรวจเช็คความกระด้างของน้ำที่ไหลผ่าน Softener', 1),
(190, 'I-116', 'ตรวจเช็คการรั่ว และการสั่นของปั๊มน้ำ', 1),
(191, 'I-117', 'ตรวจเช็คการทำงานของเกจการอุดตันของท่อ', 1),
(195, 'I-121', 'ตรวจเช็คการทำงานและการรั่วของฝานิรภัย', 1),
(196, 'I-122', 'ตรวจเช็คบันทึกการเปลี่ยนทรายดูดวับน้ำมัน', 1),
(197, 'I-123', 'ตรวจเช็คการรั่วของไอ Steam', 1),
(198, 'I-124', 'ตรวจเช็คอุปกรณ์ดักไอ', 1),
(199, 'I-125', 'ตรวจเช็คเกจวัดความดัน', 1),
(200, 'I-126', 'ตรวจเช็คการทำงาน และการรั่วซึมของลิ้นนิรภัย', 1),
(201, 'I-127', 'ตรวจเช็คการรั่วซึมของแกนวาล์วจ่ายไอ', 1),
(202, 'I-128', 'ตรวจเช็คการรั่วซึมลักษณะเปลวไฟของหัวฉีด', 1),
(203, 'I-129', 'ตรวจเช็ค และทำความสะอาดหัวพ่นไฟ AWO', 1),
(204, 'I-130', 'ตรวจเช็คการทำงาน และสิ่งสกปรกของตาไฟ', 1),
(205, 'I-131', 'ตรวจเช็คดูการแตกร้าวของกระจกดูการเผาไหม้', 1),
(207, 'I-133', 'ตรวจเช็คการหมุน และเสียงดังของพัดลม', 1),
(208, 'I-134', 'ตรวจเช็คการอุดตันการล้างกรองของไส้กรองน้ำมัน', 1),
(210, 'I-136', 'ตรวจเช็คอุณหภูมิน้ำมัน 40-100 ํC', 1),
(211, 'I-137', 'ตรวจเช็คความดันน้ำมัน 0-2.7 Kg/Cm2', 1),
(212, 'I-138', 'ตรวจเช็คมาตรน้ำมัน IN/L', 1),
(213, 'I-139', 'ตรวจเช็คความไอ 0-7 Kg/Cm2', 1),
(214, 'I-140', 'ตรวจเช็คอุณหภูมิปล่องควัน 150-250 C', 1),
(215, 'I-141', 'ตรวจเช็คมาตรน้ำ m3', 1),
(216, 'I-142', 'ตรวจเช็คมาตรชั่วโมง (H)', 1),
(217, 'I-143', 'ตรวจเช็คค่าTDS/PPM ของน้ำBoiler', 1),
(218, 'I-144', 'ตรวจเช็คอุณหภูมิน้ำ ของน้ำใน Boiler', 1),
(219, 'I-145', 'ตรวจเช็คปริมาณน้ำมันเชื้อเพลิง/ลิตร', 1),
(220, 'I-146', 'ตรวจเช็คค่า PH', 1),
(221, 'I-147', 'ตรวจเช็คระดับน้ำมันในถัง (Separator)', 1),
(222, 'I-148', 'ตรวจเช็คระดับแรงดันที่เกจวัด', 1),
(223, 'I-149', 'ตรวจเช็คอุณหภูมิAir Cooler', 1),
(224, 'I-150', 'ตรวจเช็คระดับแรงดันในถังพัก 5-7.5 Bar', 1),
(225, 'I-151', 'ตรวจเช็คมาตร ชั่วโมง', 1),
(226, 'I-152', 'ตรวจเช็ครอยรั่วซึมของน้ำมัน', 1),
(227, 'I-153', 'ตรวจเช็คระดับแรงดันที่เกจวัด(140 PSI)', 1),
(228, 'I-154', 'ตรวจเช็คการอุดตันกรองน้ำมัน', 1),
(229, 'I-155', 'ตรวจเช็คความปกติของปั๊มน้ำมัน', 1),
(230, 'I-156', 'ตรวจเช็คลวดความร้อน', 1),
(231, 'I-157', 'ตรวจเช็คน้ำระบายความร้อน', 1),
(232, 'I-158', 'ตรวจเช็คอุณหภูมิ', 1),
(233, 'I-159', 'ตรวจเคเช็คแรงดันของน้ำ', 1),
(234, 'I-160', 'ตรวจเช็ควาวล์', 1),
(235, 'I-161', 'ตรวจเช็คกรองวายสแตนเนอร์', 1),
(236, 'I-162', 'ตรวจเช็คความถวงจำเพาะของน้ำยา', 1),
(237, 'I-163', 'ตรวจเช็คการทำงานของคอมเพรสเซอร์', 1),
(238, 'I-164', 'ตรวจเช็คการทำงานของมอเตอร์', 1),
(239, 'I-165', 'ตรวจเช็คแรงดันของน้ำยา ด้านHi', 1),
(240, 'I-166', 'ตรวจเช็คแรงดันของน้ำยา ด้านLow', 1),
(241, 'I-167', 'ตรวจเช็คแผงระบายความร้อน (คอยส์ร้อน) ', 1),
(242, 'I-168', 'ตรวจเช็คสภาพน้ำ', 1),
(243, 'I-169', 'ตรวจเช็คแรงดันน้ำภายในท่อที่เกจวัด 12-50 PSI', 1),
(244, 'I-170', 'ตรวจเช็ควาวล์ควบคุมการเปิดปิด', 1),
(245, 'I-171', 'การตรวจเช็คการรั่วซึมของท่อน้ำ', 1),
(246, 'I-172', 'ตรวจเช็คแผงระบายความร้อนของน้ำ (PVC Filling)', 1),
(247, 'I-173', 'ตรวจเช็คแผงทางลม (Air Intel)', 1),
(248, 'I-174', 'ตรวจเคสายไฟพร้อมขันน๊อตจุดต่อต่างๆ', 1),
(249, 'I-196', 'การสึกกร่อนของลูกโม่บด', 1),
(250, 'T-004', 'การขันน๊อตการรั่ว', 1),
(251, 'C-018', 'ทำความสะอาดสิ่งสกปรกข้างในกระเปาะ', 1),
(252, 'I-175', 'เช็คความเสียหาย', 1),
(254, 'I-177', 'ตรวจสอบโครงสร้าง', 1),
(255, 'A-012', 'ติดตั้งเพิ่ม', 1),
(256, 'I-208', 'ตรวจสอบระบบการไหลของน้ำ', 1),
(257, 'A-013', 'ย้าย', 1),
(258, 'A-014', 'ซ่อมแซม', 1),
(259, 'A-015', 'ทำสี', 1),
(260, 'A-016', 'สร้าง', 1),
(261, 'T-005', 'ขันข้อต่อ', 1),
(262, 'A-017', 'เปลี่ยน', 1),
(263, 'A-018', 'เปลี่ยนสายสริงแอร์เรเตอร์', 1),
(264, 'A-019', 'เปลี่ยนสายลม', 1),
(265, 'L-016', 'อัดล็อคริกเพลา', 1),
(266, 'I-209', 'เช็คระบบตู้Control', 1),
(267, 'A-020', 'เปลี่ยนข้องอลม 90 องศา', 1),
(268, 'A-021', 'อัดเกลียวใหม่', 1),
(269, 'A-022', 'การตัดของใบมีด', 1),
(270, 'A-023', 'เชื่อม', 1),
(271, 'A-024', 'ตรวจเช็คการรั่ว', 1),
(272, 'A-025', 'เชื่อม', 1),
(273, 'T-006', 'อัดข้อต่อ', 1),
(274, 'A-026', 'พ่นสี', 1),
(275, 'A-027', 'รื้อถอน', 1),
(276, 'A-028', 'เจาะ', 1),
(277, 'A-029', 'แยงเขม่า', 1),
(278, 'A-030', 'ทำฝาบ่อพัก', 1),
(279, 'A-031', 'เปลี่ยนซีลวาล์ว', 1),
(280, 'A-032', 'เจาะรูระบายน้ำทิ้ง', 1),
(281, 'A-033', 'ดูดท่อน้ำทิ้งเครื่องปรับอากาศ', 1),
(282, 'A-034', 'เปลี่ยนคาปาซิเตอร์ ', 1),
(283, 'A-035', 'เปลี่ยนไส้กรอง RO', 1),
(284, 'A-036', 'ปรับระดับการไหลของน้ำ', 1),
(285, 'A-037', 'สร้างรถเข็น ', 1),
(286, 'A-038', 'สร้างโต๊ะ', 1),
(287, 'A-039', 'เปลี่ยนไฟสัญญาณเตือน', 1),
(288, 'A-040', 'เปลี่ยนขดลวด', 1),
(289, 'A-041', 'ทำตะแกรง', 1),
(290, 'I-210', 'ตรวจเช็คลูกลอย', 1),
(291, 'A-042', 'ยกเลิกใบแจ้งซ่อม', 1),
(292, 'A-043', 'เปลี่ยนสะดือ', 1),
(293, 'A-044', 'ซ่อมไม่ได้', 1),
(294, 'A-045', 'เปลี่ยนตลับหมึก', 1),
(295, 'A-046', 'ขัดสี', 1),
(296, 'A-047', 'เปลี่ยนหลอดไฟ', 1),
(297, 'A-048', 'เปลี่ยนสปริง', 1),
(298, 'A-049', 'เปลี่ยนสายพาน', 1),
(299, 'A-050', 'เปลี่ยนเทอร์โมฟิวส์ ', 1),
(300, 'A-051', 'เปลี่ยนถุงลม', 1),
(301, 'A-052', 'เปลี่ยนเกจวัดแรงดัน', 1),
(302, 'A-053', 'ทำฝาปิด', 1),
(303, 'A-054', 'เปลี่ยนโคมไฟ', 1),
(304, 'A-055', 'เปลี่ยนวาล์ว', 1),
(305, 'A-056', 'ติดตั้งม่านเหลือง', 1),
(306, 'A-057', 'ติดตั้งโทรศัพท์', 1),
(307, 'A-058', 'เปลี่ยนฝาแบตเตอรี่', 1),
(308, 'T-007', 'ขันแน่นลูกบิด', 1),
(309, 'T-008', 'ขันแน่นสายชำระ', 1),
(310, 'I-211', 'ตรวจเช็คสัญญาณโทรศัพท์', 1),
(311, 'A-059', 'เปลี่ยนแหวนล็อค', 1),
(312, 'A-060', 'เปลี่ยนซีลกันน้ำชักโครก', 1),
(313, 'A-061', 'เปลี่ยนลูกบิด', 1),
(314, 'A-062', 'ทำที่เก็บเอกสาร', 1),
(315, 'A-063', 'เปลี่ยนเกลียวยึดลูกลอย', 1),
(316, 'A-064', 'เปลี่ยนเซนเซอร์', 1),
(317, 'A-065', 'ติดป้าย', 1),
(318, 'I-212', 'ตรวจเช็คเครื่องปรับอากาศ', 1),
(319, 'A-066', 'ต่อสายไฟ', 1),
(320, 'T-009', 'ขันแน่น', 1),
(321, 'A-067', 'สั่งซื้อ', 1),
(322, 'A-068', 'ต่อท่อ', 1),
(323, 'T-010', 'ขันแน่นประเก็ณฑ์', 1),
(324, 'A-069', 'เปลี่ยนสลิง', 1),
(325, 'A-070', 'เปลี่ยนน๊อต', 1),
(326, 'A-071', 'เปลี่ยนตลับลูกปืน', 1),
(327, 'A-072', 'เดินระบบน้ำ', 1),
(328, 'A-073', 'สร้างอุปกรณ์', 1),
(329, 'L-017', 'อัดประเก็น', 1),
(330, 'A-074', 'เจียร์', 1),
(332, 'I-214', 'เช็คความผิดปกติของเสียง', 1),
(333, 'A-001', 'ปรับตั้งความตึงของสายพาน', 1),
(334, 'I-215', 'ตรวจเช็คการรั่วซึมของน้ำมัน Gear motor', 1),
(335, 'I-216', 'ตรวจเช็คการสึกหรอของบูททองเหลือง', 1),
(336, 'I-217', 'ตรวจเช็คการอุดตันของตระแกรงสแตนเลส', 1),
(337, 'I-217', 'ตรวจเช็คการสึกหรอของใบมีด', 1),
(338, 'I-220', 'ตรวจเช็ค Pilot Lamp', 1),
(340, 'I-223', 'ตรวจเช็คระบบลม', 1),
(341, 'I-224', 'ตรวจเช็คสภาพ เฟืองทดและฟันเฟืองต่าง ๆ', 1),
(342, 'I-225', 'ตรวจเช็ค Chain Coupling', 1),
(343, 'I-226', 'ตรวจเช็คปั้มน้ำ', 1),
(344, 'I-227', 'ตรวจเช็คการทำงานของระบบ Emergency', 1),
(345, 'I-228', 'ตรวจเช็คการทำงานลิมิตสวิตช์', 1),
(346, 'I-229', 'ตรวจเช็คยอย Coupling', 1),
(347, 'I-300', 'ตรวจเช็คระบบน้ำ Cooling', 1),
(348, 'I-301', 'ตรวจเช็คสวิทช์ควบคุมรอกไฟฟ้า', 1),
(349, 'I-302', 'ตรวจเช็คสภาพลูกกลิ้ง', 1),
(350, 'I-303', 'ตรวจเช็คสภาพสปริง', 1),
(351, 'I-304', 'ตรวจเช็ครอยรั่ว ต่าง ๆ', 1),
(352, 'I-305', 'ตรวจเช็คสภาพของชุดใบกวน', 1),
(353, 'I-306', 'ตรวจเช็คการหมุนของใบกวน', 1),
(354, 'I-307', 'ตรวจเช็คการดูดของ VACCUM', 1),
(355, 'I-308', 'ตรวจเช็คกระบอกลม', 1),
(356, 'I-309', 'ตรวจเช็คระบบหัวฉีดน้ำ', 1),
(357, 'I-310', 'ตรวจเช็คระบบระบบหัวจ่ายน้ำซีอิ้ว', 1),
(358, 'C-019', 'ทำความสะอาดหัวพ่นตัวอักษร', 1),
(359, 'I-311', 'ตรวจเช็คตลับหมึก', 1),
(360, 'A-076', 'ปรับตั้งความตึงสายสริง', 1),
(361, 'C-020', 'ทำความสะอาดชุด Blower', 1),
(362, 'I-312', 'ตรวจเช็คข้อต่อ Fitting และข้อต่อทางส่งลมอัด', 1),
(364, 'L-018', 'หล่อลื่นเฟื่อง ล้อ และจุดหมุนต่าง', 1),
(368, 'I-315', 'ตรวจเช็คเฟืองเกียร์ สำหรับขับและ/หรือส่งกำลัง', 1),
(369, 'I-316', 'ตรวจเช็คชุด Vacuum pump', 1),
(370, 'I-317', 'ตรวจเช็คระบบเซนเซอร์', 1),
(371, 'I-318', 'ตรวจเช็คสภาพท่อน้ำใช้งาน', 1),
(372, 'I-319', 'ตรวจเช็คสภาพท่อสตรีม', 1),
(373, 'I-320', 'ตรวจเช็คการทำงานของถุงลม', 1),
(374, 'A-079', 'เช็คจำนวนน๊อตยึดและขันแน่น', 1);

-- --------------------------------------------------------

--
-- Table structure for table `en_work_type`
--

CREATE TABLE `en_work_type` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='หมวดหมู่';

--
-- Dumping data for table `en_work_type`
--

INSERT INTO `en_work_type` (`id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, 'PM', 'Preventive', 'งานบำรุงรักษาเชิงป้องกัน', '#E36414', 1),
(2, 'CM', 'Corrective', 'งานบำรุงรักษาเชิงแก้ไข', '#B31312', 1),
(3, 'BD', 'Restore ', 'งานซ่อมขึ้นสภาพหลังเครื่องจักรเสีย', '#994D1C', 1),
(4, 'NM', 'Fabrication', 'งานสร้างเครื่องจักร อุปกรณ์', '#0766AD', 1),
(5, 'PJ', 'Project', 'งานโครงการ', '#2B3499', 1),
(6, 'S', 'Warehouse', 'Warehouse', '#7752FE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `en_wo_approve`
--

CREATE TABLE `en_wo_approve` (
  `id` int(11) NOT NULL,
  `wo_id` int(11) DEFAULT NULL,
  `approver` varchar(255) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ผู้จัดการช่าง';

-- --------------------------------------------------------

--
-- Table structure for table `en_wo_list`
--

CREATE TABLE `en_wo_list` (
  `id` int(11) NOT NULL,
  `workorder_id` int(11) DEFAULT NULL COMMENT 'ใบสั่งซ่อม',
  `working_date` datetime DEFAULT NULL COMMENT 'วันที่ปฎิบัติงาน',
  `description` text COMMENT 'รายละเอียดการปฎิบัติงาน',
  `problem` text COMMENT 'ปัญหาที่พบ',
  `images` text COMMENT 'รูปภาพ',
  `lock_out` int(11) DEFAULT NULL COMMENT 'ระบบล็อค',
  `tag_out` int(11) DEFAULT NULL COMMENT 'ป้ายทะเบียน',
  `checker` int(11) DEFAULT NULL COMMENT 'ผู้ตรวจสอบก่อนซ่อม',
  `recheck_electric` int(11) DEFAULT NULL COMMENT 'ตรวจไฟฟ้าหลังซ่อม',
  `recheck_mechanics` int(11) DEFAULT NULL COMMENT 'ตรวจเครื่องจักรหลังซ่อม',
  `rechecker` int(11) DEFAULT NULL COMMENT 'ผู้ตรวจสอบหลังซ่อม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ส่วนผู้ปฎิบัติงานกรอก';

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL COMMENT 'รหัส',
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `detail` text COMMENT 'รายละเอียด',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `code`, `name`, `detail`, `color`, `active`) VALUES
(1, '1', 'ห้องแผนกบุคคล', NULL, '#176B87', 1),
(2, '2', 'ห้องแผนกผลิต', NULL, '#176B87', 1),
(3, '3', 'ห้องควบคุมคุณภาพและจัดซื้อ', NULL, '#176B87', 1),
(4, '4', 'ห้องควบคุมคุณภาพ', NULL, '#176B87', 1),
(5, '5', 'ห้องบัญชี', NULL, '#176B87', 1),
(6, '6', 'ห้องประชุม', NULL, '#176B87', 1),
(7, '7', 'ห้องน้ำสำนักงาน ชั้น 1', NULL, '#176B87', 1),
(8, '8', 'ห้องน้ำสำนักงาน ชั้น 2', NULL, '#176B87', 1),
(9, '9', 'ห้องเตรียมอาหารและเครื่องดื่ม', NULL, '#176B87', 1),
(10, '10', 'ห้องผู้จัดการ', NULL, '#176B87', 1),
(11, '11', 'ห้องประชุมใหญ่ (ห้องรับประทานอาหาร)', NULL, '#176B87', 1),
(12, '12', 'บริเวณตู้ยาม', NULL, '#0802A3', 1),
(13, '13', 'ห้องปฏิบัติการคอมพิวเตอร์', NULL, '#176B87', 1),
(14, '14', 'ห้องเซิร์ฟเวอร์', NULL, '#176B87', 1),
(15, '15', 'พื้นที่คลังสินค้า', NULL, '#6499E9', 1),
(16, 'B2-1', 'อาคาร B2', NULL, '#713ABE', 1),
(17, 'B3-1', 'อาคาร B3', NULL, '#26577C', 1),
(18, 'B4-1', 'อาคาร B4 ส่วนคั้น', NULL, '#9A3B3B', 1),
(19, 'B4-2', 'อาคาร B4 ส่วนกรอง', NULL, '#9A3B3B', 1),
(20, '20', 'อาคาร B4 ส่วนคลังสินค้า', NULL, '#9A3B3B', 1),
(21, 'B4-3', 'อาคาร B4 ส่วนบรรจุ', NULL, '#9A3B3B', 1),
(22, 'B5-1', 'อาคาร B5 ส่วนผลิต', NULL, '#183D3D', 1),
(23, '23', 'อาคาร B5 ส่วนวิจัยและพัฒนา', NULL, '#183D3D', 1),
(24, '24', 'อาคารหม้อไอน้ำ (Boiler)', NULL, '#C70039', 1),
(25, '25', 'อาคารน้ำดิบและน้ำซอฟท์', NULL, '#C70039', 1),
(26, '26', 'ระบบบ่อบำบัดน้ำเสีย', NULL, NULL, 1),
(27, '27', 'อาคารวิศวกรรม', NULL, NULL, 1),
(28, '28', 'ห้องแต่งตัวหญิง', NULL, NULL, 1),
(29, '29', 'ห้องแต่งตัวชาย', NULL, NULL, 1),
(30, '30', 'โรงเก็บขยะ', NULL, NULL, 1),
(31, '31', 'โรงรถ', NULL, NULL, 1),
(32, '32', 'อาคารสำนักงาน', NULL, NULL, 1),
(33, '33', 'บริเวณอาคาร', NULL, NULL, 1),
(34, '34', 'โรงผลิตน้ำใช้', NULL, NULL, 1),
(35, '35', 'โรงจอดรถจักรยานยนต์', NULL, NULL, 1),
(36, '36', 'พื้นที่แปลงผัก', NULL, NULL, 1),
(37, '37', 'ห้องซักผ้าและห้องเย็บผ้า', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thai_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1',
  `rule_id` int(11) DEFAULT '1',
  `department_id` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `thai_name`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `role_id`, `rule_id`, `department_id`) VALUES
(1, 'admin', 'ผู้ดูแลระบบ', '2tzscTHLNpS0rJlIJx_Uz1qZnvi6yS_q', '$2y$13$YjwG6MXUIcpOyoMmzX9fDuXo854gmWBxG8SuzInWi4MSr9jZ.91Di', NULL, 'admin@admin.com', 10, 1689666356, 1699670204, 'SA3gozOob2BBbQR0Ue5t4mJQpoyb0gcp_1689666356', 2, 8, 1),
(2, 'demo', 'ทดสอบระบบ', 'lJsMEFiO-XjqJrVhH2aDcjXyrP0oC0vy', '$2y$13$bbMdrjq8fjTTMuEs43DPIuOVIhx1.AzYZQ6WUnJFLqggjRrqxaCme', NULL, 'demo1@demo.com', 10, 1689756005, 1699692001, 'sfLH5psKTa0wMf7dH-kiSrkNcSPqn9OD_1689756005', 1, 2, 1),
(3, 'onanong', 'อรอนงค์ ชมภู', '2bj5VmZ1PEwJDerqRsj3fhE8i2zvsVZq', '$2y$13$08zXpjOdJu83tT84JNqebe3SMFVctXSfynLDfss3sFMiveC7tPEUS', NULL, 'chumphu2538@gmail.com', 10, 1689759317, 1699671283, '9NqfkSJcx8KkIodMLNCeH9HLqhOUmcxw_1689759317', 6, 8, 9),
(4, 'phitchai', 'พิชญ์ชัย พิชญ์ชานุวัฒน์', 'yJwBMulOJv3IDmDkCXrdYZ-VMEw_zwLZ', '$2y$13$wGZx2YliuaqG5mjrTzY4AupjPJBT15DBgnkqqj8MiCcwCT6z1PJl.', NULL, 'qc.northernfoodcomplex@gmail.com', 10, 1689759339, 1699671304, '4Zgy1uVGJvXg2nZOAHcFCSj0NK0Ll3Ze_1689759339', 5, 8, 8),
(5, 'prakaiwan', 'ประกายวรรณ เทพมณี', 'y2RYhV3E1NG68CUaa8svzBknRdbCTO79', '$2y$13$Skm6AuVq/Qi/E2r6BouzBOn.3GR8aJT5.iaHIpr2KCDsJLUPKU8B2', NULL, 'prakaiwan4213@gmail.com', 10, 1689759362, 1699671330, '2qNZk71gb01_K-bdCiscD38z36G9exZH_1689759362', 3, 7, 8),
(6, 'sale', 'ฝ่ายขาย', 'EHSvx6uElywR8fG2XRQ_xKE4sups-8cO', '$2y$13$0UZFJxx7tUAPdy972cvXEejPhldI17L0Ld7C3KnSKUk7KTLYVUP0y', NULL, 'sale@nfc.com', 10, 1689759388, 1699671371, '9ZnxmSRzPpvLgxD0MPSamdokpcp_eMul_1689759388', 10, 5, 13),
(7, 'planning', 'ฝ่ายวางแผน', 'JWT4BgIkYF4TIN62mLaKv5iL0uLMn7C9', '$2y$13$g08zQ7xjXISzs99kS2yApuOCRcV6QpMOfdzNAwYY8fP9N96pEuAye', NULL, 'planning@localhost.com', 9, 1689759413, 1698802241, '7xCjBXE9xNLx1gWqKX2LaVex2ah0IWt4_1689759413', 1, 1, 1),
(8, 'production', 'ฝ่ายผลิต', 'FjE8vrSWJ1uVTanpvQJDnpq_OiUySrzg', '$2y$13$Oa3U4rEqDwN8W0ytkDHCjuPw8CW4d44l9tEWbi3N3myBogr4mmzBy', NULL, 'production@localhost.com', 9, 1689759430, 1698802250, 'qNJ-e9RkWlfqvHqmvmSsItU1rlpb_D3j_1689759430', 1, 1, 1),
(9, 'watsara', 'วรรษรา หลวงเป็ง', 'XEPSPmb7Bt0oI_tklPUc5Uh4Jq4HM4Ig', '$2y$13$5iA/KWda5k7mbunRRwdNUOXn62jWJ/Ipoc.CzW3XYr69iVHThV1yC', NULL, 'watsara.nfc@gmail.com', 10, 1690430330, 1699671531, 't1iesBNA9TNHWotQHvGzbLCVhrK6LF9O_1690430330', 4, 7, 14),
(10, 'somsak', 'สมศักดิ์ ชาญเกียรติก้อง', '3tiUcswenYgRTZTfuvfv_Tv4V7BXwAcn', '$2y$13$RaVMZpvieW5IfdwpInG4JejNTn8rb7rTCluwPUDO6R8kAJBj1l7D.', NULL, 'somsak@northernfoodcomplex.com', 10, 1691631165, 1699671579, 'Pj5G3y6R8VeykAb0cyXVIHChtnlpquo9_1691631165', 3, 8, 1),
(11, 'peeranai', 'พีรนัย โสทรทวีพงศ์', 'G3b3XCgv3uFzzly7jDX0cJXzNm45qoUV', '$2y$13$5gM/232mFQdlLwbqiQOdE.n2zbN3cLuDGdhIsTK0USk.ASVILRPZy', NULL, 'peeranai@northernfoodcomplex.com', 10, 1691631423, 1699671596, 'HmjAFfcWByo3VbwpZDD9qeBA-shqds8q_1691631423', 3, 8, 1),
(12, 'theerapong', 'ธีรพงศ์ ขันตา', 'tWXwJZ5JEXbWCN0M-0zpCouAUJcL5BwZ', '$2y$13$WG5mTZIZ4ZcL3BoA/vA/7urFzlU2xQ2g4NU29gJegyCCcIte0TCP.', NULL, 'theerapong.khan@gmail.com', 10, 1691639318, 1699684736, NULL, 2, 8, 12),
(13, 'chonlatee', 'ชลธี ลือเลิศ', 'EOXd5DKbM2Jcs6aK9sD62YxeP7VboVhg', '$2y$13$DuO5fXzy/9xaD9VOoJXU2OcqxdQngl30FQjoqrcN6mLNGY/XjzXGO', NULL, 'chonlatee.l@local.com', 10, 1699687514, 1699687514, NULL, 1, 1, 11),
(14, 'yosaporn', 'ยศพร พยัคฆญาติ', 'GOI-0AQj0nAYGBIpppuSe-O3IK4OSs2h', '$2y$13$gnj.Vuf7hYLvMcPCesdU4eXqC4GAZR0iwhYbvBcVxlPNnTvB9mmji', NULL, 'ypayakayat@yahoo.com', 10, 1692180393, 1699671626, NULL, 3, 8, 4),
(15, 'sawika', 'สาวิกา พินิจ', 'GOI-0AQj0nAYGBIpppuSe-O3IK4OSs2h', '$2y$13$ggQkc27TiQ2iQSAW6jcr3OpNGzVRjsE5/etsA7BeM5MubC/RwnhP.', NULL, 'sawika_pinit@yahoo.co.th', 10, 1692180393, 1699671650, NULL, 3, 8, 7),
(16, 'premmika', 'เปรมมิกา พินิจ', 'GOI-0AQj0nAYGBIpppuSe-O3IK4OSs2h', '$2y$13$JNF9k6WursfrumEFcQkYCO1aM6Ikced40Zwsa0wIaOtrGDTBM/Y0y', NULL, 'pinit@yahoo.co.th', 10, 1692180393, 1699671711, NULL, 4, 7, 5),
(17, 'charinee', 'ชาริณี จันต๊ะนาเขต', 'wLQMbhfIHnG07ZHdPZA2IGb5JfIWjm37', '$2y$13$jbb8tfUMLQNpU40y65.1yei8N.iKlbQ5JZg7HA6fFABmc7wvDqyjy', NULL, 'charinee@localhost.com', 10, 1698800364, 1699671733, NULL, 1, 1, 9),
(18, 'benjarat', 'เบญจรัตน์ คงชำนาญ', '-WVnwHhiOWQdUJ3KYypIVVJ1WgFO_NUv', '$2y$13$q4n53.fViyRFwgVoxnWiw.PwWLsY4uuWLRetp8iTIypiYFqcXCJ/W', NULL, 'khongchanan1996@gmail.com', 10, 1698800565, 1699671747, NULL, 1, 1, 9),
(19, 'natthawat', 'ณัฐวัฒน์ วรรณราช', 'Kb6gw6VW_6c9O_CAnGJPnhsX85rF9zyx', '$2y$13$El.F4z5hUULPGAorAABTSObuecQ88VldJxIPZkIT8pRY79tZHuRG2', NULL, 'coi.northernfoodcomplex@gmail.com', 10, 1698800639, 1699671767, NULL, 1, 1, 8),
(20, 'thaksin', 'ทักษิณ อินทรศิลา', 'TZGAEflaZm143CsHlFjJZMMYZdKQeMVE', '$2y$13$BwKpULbKpy7h4gpHinfdJelEu3LEtHGC.mEKhvZWmD1HJlThpFuuq', NULL, 'notethaksin@hotmail.com', 10, 1698800733, 1699671798, NULL, 7, 8, 3),
(21, 'chadaporn', 'ชฎาภรณ์ แก้วคำ', '7HasNWHP_M5-W_fBPDKb1M_0sXyd2Dsc', '$2y$13$O66yoesXcMWn1fNB3AUmiubpNRcH9q/VDv5ARGQT3aMjLU8fIr.7a', NULL, 'kaewkhamchadaporn@gmail.com', 10, 1698801098, 1699671819, NULL, 4, 7, 3),
(22, 'araya', 'อารยา เทพโพธา', 'iOtjB0XK4SiRHsuOwg_vudd0epMz0wHW', '$2y$13$FwNHx5QgPEdvr3fO9TksmOQXoc/YN/fKpbMXvy5ehf/8WBdiMGVnS', NULL, 'araya.thep@gmail.com', 10, 1698801169, 1699671866, NULL, 3, 8, 2),
(23, 'suphot', 'สุพจน์ ช่างฆ้อง', 'vGAi-pbCSZLcDRzbxOZ5w9sPllCdSFQq', '$2y$13$dvgxE11A.6VlEWx2ZF6ODeijXkZI01I2cTcsF30DFG0n5MYoPKioa', NULL, 'changkhong.8777@gmail.com', 10, 1698801231, 1699671892, NULL, 4, 7, 6),
(24, 'suriya', 'สุริยา สมเพชร', 'BACKO9VW3y79pLaoZvOiQtX3OWZzuDQI', '$2y$13$BtJJseMYMycRgZMLsg1Rd.h7cJzilYsTpnyiUdlgxWDK8SwPfXt8S', NULL, 'suriyasompatch@gmail.com', 10, 1698801309, 1699671908, NULL, 3, 8, 6),
(25, 'yotsapon', 'ยศพนธ์ โพธิ', 'wmyXWYgzYvewSqTMmgf9CFDD_ryIM5nl', '$2y$13$SbsFYkqKBTQ3990SGOBnsOOl4Ad7LmnnIZMvz7Now6e/onXWuY70K', NULL, 'yotsapon@localhost.com', 10, 1698801387, 1699673576, NULL, 12, 1, 6),
(26, 'sutahatai', 'ศุทธหทัย ชุูกำลัง', 'LFeQidH3yohyJ3Qc1MOKuZJm27IAZFH0', '$2y$13$kNAosJDYUybr2UHmB02W.edEc8AoY8XJqWs7/FcpbF./0wtnPwZVO', NULL, 'rd.northernfoodcomplex@gmail.com', 10, 1698801460, 1699671954, NULL, 4, 7, 10),
(27, 'phannipha', 'พรรณ์นิภา พิพัฒน์ธัชพร', 'I4QgffOFLAp2wWgH0d5rBIWF-CCeG_4k', '$2y$13$1WGGnfxnKfgORW2jhudi4e9Nbh0ZhZOgrpXjaWnjba82XZQFwHyhK', NULL, 'pipat.pannipa@gmail.com', 10, 1698801550, 1699671992, NULL, 3, 8, 5),
(28, 'jiraporn', 'จิราภรณ์ กาบแก้ว', 'w0GFJQICSa2Ad9453hYPNUMf6Svm1WdX', '$2y$13$hiVIDOSOelsK3/XPYDH0KOFvgUFHLK9uDkZ814owQSIRvnBw.idFi', NULL, 'planning@northernfoodcomplex.com', 10, 1698801621, 1699672249, NULL, 4, 7, 7),
(29, 'taweekiat', 'ทวีเกียรติ คำเทพ', 'tjJu-rUAKYmyXN6v5wZxaESahe2EYKwx', '$2y$13$829fqk8R5kYhEHoVcozHP.RXSixc9NkkSWQU5X.Vo12E.AUstI9S2', NULL, 'd.taweekiat@gmail.com', 10, 1698801681, 1699672095, NULL, 3, 8, 4),
(30, 'kunrathon', 'กุลธร ดอนมูล', 'qD0mmuOHZ6ZNXs81dppLg3VBB1fQTrcn', '$2y$13$ox0loKGJwrz6bVgn8/MHne1/E8G5AMoTkiqSaVoNpyxGA5cUitIbG', NULL, 'pd03.nfc@gmail.com', 10, 1698801766, 1699684673, NULL, 12, 1, 4),
(31, 'manop', 'มานพ ศรีจุมปา', 'skTB0VTY-7RcVfokMQRjtZjsic0xFo5e', '$2y$13$vCwFZ69vuJKmxzb0wLq73eJjuHFCMJwpOPBUBqf6ERVJqYlIsJTKW', NULL, 'manop.s@local.com', 10, 1699672763, 1699673252, NULL, 11, 1, 6),
(32, 'natthaphon', 'ณัฐพล ขันเขียว', 'agve9wCBQNQsnst59xpLAFBW6Cq7IRLd', '$2y$13$PpNjwUwiwA5ir249i7QGEe6u6BL9TviklOe7LO8e/66M5Km.w0EAO', NULL, 'natthaphon.k@local.com', 10, 1699672822, 1699672822, NULL, 4, 7, 6),
(33, 'komsan', 'คมสันต์ สมบูณ์ชัย', 'qm1hqRc6dLA5L6_UtbmUl1TLAd_D7x9S', '$2y$13$1H7H7WlSc6pm.GV90f9gWuyOf.jZGYpQvTwNQCyAcTkKje71VKrfS', NULL, 'komsan.s@local.com', 10, 1699672864, 1699673236, NULL, 11, 2, 6),
(34, 'sarawut', 'สราวุฒิ โฆษิตเกียรติคุณ', '5_HL5jD2jOAGgRMlzrCGje_mnMVAwrM2', '$2y$13$G3VfQ0sSZItb7c7D0wp9Qu7/C8up3ac.M/QAvQwL7D8G0l90aY0PK', NULL, 'sarawut.k@local.com', 10, 1699673427, 1699673427, NULL, 11, 2, 6),
(35, 'sutap', 'สุเทพ ปวงรังษี', '4ZC6I_pSHZUeKxy0bTWJVJ5OoBU3tyaG', '$2y$13$Qg.BsbzBO79f4LAgQA2q5.Lq2PCB3BXoG2Omy9HRIkGGWczrTqtN2', NULL, 'sutap.p@local.com', 10, 1699673470, 1699673470, NULL, 11, 1, 6),
(36, 'jadsakorn', 'เจษกร คำวรรณ์', 'UpcQnJlQ5ym-tl4ln6RR9lncaVqNEDeE', '$2y$13$elUuASkqoaFpcj4XH8OCE.evOp0652TKPRpayG5e2V2ObS0Wh38eq', NULL, 'jadsakorn.k@local.com', 10, 1699673508, 1699673508, NULL, 11, 1, 6),
(37, 'narongsak', 'ณรงค์ศักดิ์ แซ่จ๋าว', 'KEFY3yiKK0Vu6cL8ZbBVnhvA_e-GmDOH', '$2y$13$2qsIhzxqZNVwdzllVCDeaefAQNRseU3hsproLCerh0WpogDJ0zD2a', NULL, 'narongsak.s@local.com', 10, 1699673668, 1699673668, NULL, 11, 1, 6),
(38, 'panuwat', 'ภานุวัฒน์ ยางรัมย์', 'KlXe_M-3gpwuMycTgSa3b2cHG4sszYbu', '$2y$13$jJOfZ6JxXLACSauDohJCWOaMMbeqT0vcx.P9u2OyViCMkNCAd6MVm', NULL, 'panuwat.y@local.com', 10, 1699673713, 1699673713, NULL, 11, 1, 6),
(39, 'ratsamee', 'รัศมี ศศิยศพงศ์', 'ZwwiwqfFPKF3Qyw0RCufsRwieogeqkKA', '$2y$13$yL81Y4Cw45VCKTU5EZqZr.jWIoZGT2RrCOxshvfPljAvK9Jk6mDvO', NULL, 'ratsamee.s@local.com', 10, 1699684280, 1699684280, NULL, 1, 1, 11),
(40, 'kanprapha', 'กาญจน์ประภา ไพยราช', 'WDv33rQp0vRaL5mKrkznfJ268027UF5a', '$2y$13$/OeA8PeP.Vj6U3oZ5PKxpOk5fbtGD0xu.U4tioVEVnMPUovRK4Z0e', NULL, 'kanprapha.p@local.com', 10, 1699684322, 1699684322, NULL, 1, 1, 11),
(41, 'chanika', 'ชนิกา เรือนมูล', 'sA-NLySBUOSDB8XSWsh1AqoCQrKjroAX', '$2y$13$mWHXF4/l1LV3Ion3DIe2MuZy9OVQf4.x09BOqCRCrDr9oN.IZ5EDK', NULL, 'chanika.r@local.com', 10, 1699684367, 1699684367, NULL, 1, 1, 9),
(42, 'tanyarat', 'ธัญญารัตน์ นิ่มวงษ์', 'BAPZkF-0tqu3qK6uVtDff5FZwWHby_lY', '$2y$13$sdHoyCV5cbYP3XU4ZXaX2u0Cvq7spJmxMG35PQCMcoltC0fYJji5y', NULL, 'tanyarat.n@local.com', 10, 1699684417, 1699684417, NULL, 1, 1, 5),
(43, 'kannika', 'กรรณิกา คำภีระ', 'ggE1RcJqk0OyaVS9mj-zB8J37fqtvbq7', '$2y$13$f0HOv./6JmeM.J7dKEWfuOSzqrqk7DlURbJM.MFxoMwvDarAFfKe6', NULL, 'kannika.k@local.com', 10, 1699684493, 1699684493, NULL, 1, 1, 2),
(44, 'sasicha', 'ศศิชา นัตสิทธิ์', 'haaNM8Y3gwJCsL2RvvpP7RioUNVkLCoy', '$2y$13$hAzgJSVrKlqP.TRpOn8q2OuSjkJoz/uSjGqDBPqceY62vOmfOIi..', NULL, 'sasicha.n@local.com', 10, 1699684519, 1699684519, NULL, 1, 1, 2),
(45, 'pranee', 'ปราณี แดงโคตร', 'fxatETyZYQcw4G9WLuk2DeD6tigRLSpx', '$2y$13$FO383fbroT26IGpfszXMeOHS34ynJIZCCBRmMbq8snhFHVwzgyii2', NULL, 'pranee.d@local.com', 10, 1699684567, 1699687879, NULL, 12, 1, 3),
(46, 'kullanisnaree', 'กุลนิษฐ์นรี เจริญจิตรวี', 'xbVfqgX0yJppq1rvKaczeuystm7HWTRr', '$2y$13$QttBiyiA3CPqVPqThJSWgOQU9GFrCAULddMh6hiRtWTNzcUdChlZS', NULL, 'kullanisnaree.c@local.com', 10, 1699684607, 1699684607, NULL, 1, 1, 4),
(47, 'nisarat', 'นิศารัตน์ คำขัด', '6qWMOvel4G-Fd9yAcmJFuP60dIxGDvYo', '$2y$13$bfM4SCN1ldNnHouY9WtR2eRQz4cnX1vX3P0VXrYcezwOx6fPFogsi', NULL, 'nisarat.k@localhost.com', 10, 1699684659, 1699684659, NULL, 4, 1, 4),
(48, 'boonsong', 'บุญส่ง เสียงใหญ่', 'wOK4AATzCwJIwVr0fAC3KpJwsvS6Xjno', '$2y$13$L76aWdu8ddo4x7xXmmmEQOay743a2qNZfqmOe4eml.3TspUNKEEwS', NULL, 'boonsong.s@local.com', 10, 1699684807, 1699684807, NULL, 1, 1, 3),
(49, 'somchat', 'สมชาติ พิจุมปู', 'uPey51SyvEKmcVMhoGVpYk7u4jkOL3dt', '$2y$13$O2o89NXut12mRzgQVbPYnOmttqxE78L6eP4ci422BscHgtXocSUYa', NULL, 'somchat.p@local.com', 10, 1699684842, 1699684842, NULL, 1, 1, 3),
(50, 'mana', 'มานะ คำเป็ง', 'QUNckltEY9HOcWtsAjD-FV5SIS1F9EQP', '$2y$13$3VSDYcZCsnRrzoPEJuTtXuRFOSfNdJLLebESf2/JejBMKy5Q5MD/y', NULL, 'mana.l@local.com', 10, 1699684865, 1699684865, NULL, 1, 1, 3),
(51, 'songkarn', 'สงกรานต์ พรมจักร์', 'nVXtegNye3Vc7vG4fs9plrF2C4Me6cMe', '$2y$13$l2QiQ70Ibkm6865I/pn2f.vtT8fQcT9zuUv.6H.Pk.INLFa0ayB0q', NULL, 'songkarn.p@local.com', 10, 1699684934, 1699684934, NULL, 1, 1, 4),
(52, 'sanong', 'สนอง เสียงใหญ่', 'dibJ2WhwtBhspSNDG8YrdNlq2PV0gn14', '$2y$13$fPhHkslEMoi9RvuvOQUk7OTWOUoqQJxi2CkLpsql0eZfZKxm1ucVq', NULL, 'sanong.s@local,com', 10, 1699684958, 1699684958, NULL, 1, 1, 4),
(53, 'kampon', 'กัมพล สิงห์แก้ว', '8AQqEtzYHPxTol0oCpW3cs2aM80rWTZa', '$2y$13$vq4PPEUZovhoFoKhxYSCWuIGTSlDvHNFBvN4AQ7xUWuwqKr00eUoC', NULL, 'kampon.s@local.com', 10, 1699684984, 1699684984, NULL, 1, 1, 4),
(54, 'boonyung', 'บุญยัง ม้าแก้ว', 'OdkiGuMQ2nulHBhvROue3jLuXSH7SpU6', '$2y$13$cNvIo43kIRYlwWkvJmhgUexDtkwgxTYYMPgNtPrF5R6Ne68YBdMLq', NULL, 'boonyung.m@local.com', 10, 1699685010, 1699685010, NULL, 1, 1, 4),
(55, 'natthapon', 'ณัฐพล ศิริชุมภู', 'vhwHqw2oDqrjq856haquL9Y-skl8AIOx', '$2y$13$YNqhMpa0Zz3VqzN9pt7UYOVCAXa.jW74YrEMOJwIjbNjK6uiaXQdW', NULL, 'natthapon.s@gmail.com', 10, 1699685055, 1699685055, NULL, 1, 1, 4),
(56, 'yuthapichai', 'ยุทธพิชัย ศิริจักร', 'J0BsQX2qs7dH40tEJZeFO22Hads2k6Xi', '$2y$13$YI3aV3k0ZN6dSbCtauyB/unpxn7dIbQMbMIpQLOY5o2S1UxIK6B5m', NULL, 'yuthapichai.s@local.com', 10, 1699685104, 1699685104, NULL, 1, 1, 4),
(57, 'praphawith', 'ประภวิษณุ์ ต๊ะตา', 'EfqNnCEzWwGBPxvlt-zzUoaD1NR4LOSV', '$2y$13$un.za5avahG7uaJAhsHykentDrEVt.D9b4lL.NTcuR619gWDF/t2W', NULL, 'praphawith.t@local.com', 10, 1699685148, 1699685148, NULL, 1, 1, 4),
(58, 'yotsakorn', 'ยศกร ศิริชุมภู', 'y90we65IJjIjTVLSVGC8tJqLwiINpwz4', '$2y$13$wSt1TWJoRVJMSANte94wfe1ChnFV7XHcUv.JJYwJ1gl9YVc2yhwdW', NULL, 'yotsakorn.s@local.com', 10, 1699685190, 1699685190, NULL, 1, 1, 4),
(59, 'jarun', 'จรัญ ดอนเลย', 'kjq19KvF5ziBaRz5qrqjx5dugcZFM50s', '$2y$13$N.0IagO8xjKThH2pN5UWPOB/kZvMMjis2zrBIeNGS7yrcw.egvZV.', NULL, 'jarun.d@local.com', 10, 1699685220, 1699685220, NULL, 1, 1, 4),
(60, 'ongart', 'องอาจ ชุมภูโร', 's9emD5sGgatRTvmjx2lAIesnIoaP9Tly', '$2y$13$xZ.4uRfIA4g10TR8Iuf9H.P3WrvGZAteswlhRh31LSLXI/Kpy8yIe', NULL, 'ongart.c@local.com', 10, 1699685260, 1699685260, NULL, 1, 1, 4),
(61, 'jiraroch', 'จิรโรจน์ ทองเทพ', '0ZOIowngY_I8QO_bvI_A0EoCFdVbUFdN', '$2y$13$brw.ksMKMEnHwWNZh/sna./76FHO8svzLYMlqhQDhEba.1l63FGbW', NULL, 'jiraroch.t@local.com', 10, 1699685289, 1699685289, NULL, 1, 1, 4),
(62, 'sawitee', 'สาวิตรี วันโน', 'KS3_21E3ptIJdbtxolF-XEre2bwgtHKN', '$2y$13$SFKRwJybq12JFjEkt1BqBOWnMZJ3KqV6v8i7lNQq/zbnx.OC2tGhe', NULL, 'sawitee.w@local.com', 10, 1699685316, 1699685316, NULL, 1, 1, 4),
(63, 'kittipong', 'กิตติพงษ์ วงค์ไชยา', 'CDVMYioQrVVFqCragdOVk5wOaW87_zpp', '$2y$13$oS6rOFLq1bUqOAx8c5xWT.ndtPNoFfSddTzhPP646.ONoPE9EcvyG', NULL, 'kittipong.w@local.com', 10, 1699685357, 1699685357, NULL, 1, 1, 4),
(64, 'sirichai', 'ศิริชัย จันทร์ถา', 'yTzdJjTHHRVsSCCLcENHXYg10H2A9xwG', '$2y$13$cjjMyGOCm1kMnZu1EitByegatBv5GtL7uHRTiPi88451RPcVGoG7K', NULL, 'sirichai.j@local.com', 10, 1699685389, 1699685389, NULL, 1, 1, 4),
(65, 'kamon', 'กมล ไชยชมภู', 'JHUCq2z9HhVADGLuA_i7dAiJDhsa1wR2', '$2y$13$SKOaeWe9fPaQCM1Tjgr9HOKfDwptVlIGJKVKk3Q8cq4ioOy9tryKe', NULL, 'kamon.c@local.com', 10, 1699685412, 1699685412, NULL, 1, 1, 4),
(66, 'donlawan', 'ดลวรรษ อัมพวานนท์', 'zHSjvSE6aExt-MrCVYpYk5jyxjNjayYc', '$2y$13$EUpf8KVLaRCPUveXN19ns.nvfiyJHuGjnFpJvAhHdBUgT3q4iyVxa', NULL, 'donlawan.u@local.com', 10, 1699685446, 1699685446, NULL, 1, 1, 4),
(67, 'phadungkiat', 'ผดุงเกียรติ์ คำนึงเชิดชูชัย', 'toj21i1GkAPuGCM5nuyq_mTXEdfrBqV7', '$2y$13$PW6RkVM1Zki0KMLw/9HP/O1OPwBhrbOvLGwUqkp7EDV2lGgBbjmtC', NULL, 'phadungkiat.k@local.com', 10, 1699685477, 1699685477, NULL, 1, 1, 4),
(68, 'poramak', 'ปรเมฆ แซ่พากู่', '93zBcw6pjBHq22BwYc8dIIp8XSUebKq8', '$2y$13$cJAPYebK/8wqZub5qlb41e7llO5jgPdz.AkkBKm67z1qulq3Ik4X.', NULL, 'poramak.s@local.com', 10, 1699685522, 1699685522, NULL, 1, 1, 4),
(69, 'wuthipong', 'วุฒิพงศ์ เผือกขวัญนาค', 'HOwpkCP0spLPMQMprCXC4jKP6y_l4iaf', '$2y$13$dYG9Lc8QjAdVltJ2oJZQ3u5i307Dkc4HwtS8fJCl5tENblg7Xu.Mm', NULL, 'wuthipong.p@local.com', 10, 1699685559, 1699685559, NULL, 1, 1, 4),
(70, 'wasana', 'วาสนา วรรณโล', 'RXZ1AQ7Ap15oCBjGUDocd0qebNA-8vHP', '$2y$13$zP0EZbQQgNqbQ/yUkJ.z9et6ZXdaG/vvwj.yo3Qv63kAYQGXgxJYa', NULL, 'wasana.w@local.com', 10, 1699685583, 1699685583, NULL, 1, 1, 4),
(71, 'theera', 'ธีระ รชตะภัทรพงศา', 'RHJJhDLtiGJvTEfzrfL9ysApUOBAiWzG', '$2y$13$Zun/MKceA2I79/Os8jAt1urJ8Xq.mMEVf8EWq7QMUbxUi1keyD.ca', NULL, 'theera.r@local.com', 10, 1699685621, 1699685621, NULL, 1, 1, 4),
(72, 'santi', 'สันติ วงค์แสง', 'TRyJy7AqIjL5mXMAw-x2smyyqDp7GoJ-', '$2y$13$BWOQByqWgczjf8nIjGy2I.lCPAOPK/.FTRwgj7nS0KRiV3m0LknKq', NULL, 'santi.w@local.com', 10, 1699685644, 1699685644, NULL, 1, 1, 1),
(73, 'jadsadakorn', 'เจษฎากรณ์ วรรณโล', 'uoDFZV_MMJmjdz8eRv8R7TVMuNfkHtnt', '$2y$13$9/lMYQpYeP1c7GajJNNJMuyTRIhtut7sc3th1oTvI8W7vQ9ZF6YoS', NULL, 'jadsadakorn.w@local.com', 10, 1699685685, 1699685685, NULL, 1, 1, 4),
(74, 'bordin', 'บดินทร์ เชมือ', 'qP3gksAxn_bPXbBpyjUuka4WD_fa5YNi', '$2y$13$pKHCCeY./ENt/IDzGMaBhO.p764xSG2q/vwyOXAWH3NSQAQr07QV2', NULL, 'bordin.s@local.com', 10, 1699685711, 1699685711, NULL, 1, 1, 4),
(75, 'noppakun', 'นพคุณ กาบแก้ว', 'qcdUNFTxqGp0AG67Zdg7lIg_jDS5Teqq', '$2y$13$sACEjv94sx9FHZScmm5Yr.iYRzhpyKUVOzPnfZ.vdnyUw16igqseu', NULL, 'noppakun.k@local.com', 10, 1699685754, 1699685754, NULL, 1, 1, 4),
(76, 'nakarin', 'นครินท์ กึกกอง', 'DElk_jB4tJaW0_HkCY0HvobhDL-12O9_', '$2y$13$z7FSHlygIhjwRdIXseZ1H.uEyozXHEn1LpsLgt0v2jLsCfLPnjGsK', NULL, 'nakarin.k@local.com', 10, 1699685786, 1699685786, NULL, 1, 1, 4),
(77, 'kittisak', 'กิตติศักดิ์ จักใจ', 'lWRQ3vlEwLUrDaI65ycC0zL7P4Au455Z', '$2y$13$dkdsYMnEaAH719nyPRhSnu2s7PLfPLSXaQkJQN52cAULrx3G9/G1i', NULL, 'kittisak.j@local.com', 10, 1699685825, 1699685825, NULL, 1, 1, 4),
(78, 'veerayuth', 'วีรยุทธ จุมปูโล', 'A9vrsSIADPEAysCtiS9w_c9kYcOLvcSh', '$2y$13$l5xusTRhTthuK5dJD9t4V.jHxUXCOLWz6rXjXLZJYhHusPxukS0h.', NULL, 'veerayuth.j@local.com', 10, 1699685858, 1699685858, NULL, 1, 1, 4),
(79, 'somkid', 'สมคิด คำยานะ', '1kM4Ch6D5qrI1XbvSY0Y4GQqT8YLG07N', '$2y$13$gfBtlapjTHkVMdwgOwI7LOlStgaYc75sr0DvHvneD.l9xRCeCRMH.', NULL, 'somkid.k@local.com', 10, 1699686011, 1699686011, NULL, 1, 1, 4),
(80, 'pensri', 'เพ็ญศรี ช่างฆ้อง', 'ptkx46QYcn2bwwfen63qGKPGQAKcxYyl', '$2y$13$WTdA7QWaNWextKEdS6TvHOzlhqcOgIuHDN7PCsTz4AMdDMvJhfEA2', NULL, 'pensri.c@local.com', 10, 1699686063, 1699686063, NULL, 1, 1, 4),
(81, 'wanpen', 'วันเพ็ญ บรรดิ', 'nkgFRZiOfCcB3jyqyDFbsCk1YSvC3xs6', '$2y$13$7KLRrgkEGCKMHCSLYe2vK.tFWhcGonLSvN2P/dZKSB59KTTOrnbfK', NULL, 'wanpen.b@local.com', 10, 1699686102, 1699686102, NULL, 1, 1, 4),
(82, 'wipada', 'วิภาดา ไชยชมภู', 'jFF_jEUzhVDt6FALP3vYcbkXKW3hOana', '$2y$13$T/BXTqVf1rPQaS960SVW2.HRj5CFo1w3XAn9hA1YHavMrC8Wk.olS', NULL, 'wipada.c@local.com', 10, 1699686130, 1699686130, NULL, 1, 1, 4),
(83, 'kanya', 'กัญญา เลิศชมภู', '_wJa7uhYYv5HUhjmF093L8QWTjk4J6WW', '$2y$13$oVkpuXWP/S5AK4Kb6GeFDOU6LQDeHYdIPzmaNr/OWlDM4jWbiAgE2', NULL, 'kanya.l@local.com', 10, 1699686155, 1699686155, NULL, 1, 1, 4),
(84, 'wimwipa', 'วิมพ์วิภา รักรุ่ง', 'A9oVWCPsXV2k_I2Teax3vJwJukNrhWhn', '$2y$13$..DFYKujzWCKUwhPGdf3w.iQ0adj/o3c4Wj3OIJpKEqXRrycPsYxW', NULL, 'wimwipa.r@local.com', 10, 1699686260, 1699686260, NULL, 1, 1, 4),
(85, 'jeerapong', 'จีระพงศ์ สุเดชมารค', 'CpQnZXgr14sFpReg0h1WFzxn_iR160-G', '$2y$13$5eFDM.iq4oHSVUkraF7uXuorFb9HBVic3J9CMSLTMd9aj9hnvCGOu', NULL, 'jeerapong.s@local.com', 10, 1699686292, 1699686292, NULL, 1, 1, 4),
(86, 'chalurmchai', 'เฉลิมชัย สีเขียว', 'Z5xBDmTuAQ6NSNR5Rc90Mr2JEBfNLIB8', '$2y$13$/V/6tlptlPBx5yqQpyIOw.DqiINnWx.v0Xkj4AzTO0aJCMaZpefj.', NULL, 'chalurmchai.s@local.com', 10, 1699686323, 1699686323, NULL, 1, 1, 4),
(87, 'atthapon', 'อรรถพล เครือวงค์', '5a6cwqT361_OtnjtaXCA926gY6S3PnT-', '$2y$13$JkGjtU1Z0jiwrKbLLCIqAuoug1fzWyUpq7Rs5PL5iJc63Dee.Sinq', NULL, 'atthapon.k@local.com', 10, 1699686352, 1699686352, NULL, 1, 1, 4),
(88, 'wannapa', 'วรรณภา เหมืองหม้อ', 'wSZTo5ls2FGCH65lbBTfs_SMBo0sUxtz', '$2y$13$B0TE7FrSIbsIbDW/3kXh0.p3Aov713CwHXNp9dg33fdlk3xBnpqX6', NULL, 'wannapa.m@local.com', 10, 1699686377, 1699686377, NULL, 1, 1, 4),
(89, 'jiranan', 'จีระนันท์ จรรยา', 'HZEEzX3LYWtH8HCWTvJeHOdDMo5aPb7B', '$2y$13$G1IgvDM7BRiPLu7p.Xd0ku4T9aa/TimQuCYAPb0exygjTo/XjLstK', NULL, 'jiranan.j@local.com', 10, 1699686398, 1699686398, NULL, 1, 1, 4),
(90, 'penpayom', 'เพ็ญพยอม เครือวงศ์', '3uzpB3yEv8rKMi7ecIS5t1UBWF4F0soW', '$2y$13$zt.1Ofkjq6Qw.uTsaoMcge2RPUjRAzZvS.7mZHsmqc0Q04OjQB9RC', NULL, 'penpayom.k@local.com', 10, 1699686425, 1699686425, NULL, 1, 1, 4),
(91, 'narongsakpd', 'ณรงค์ศักดิ์ แซ่วื้อ', 'yC5anyf5l7nwHsY4lxnIeaPnN_Bvvd4d', '$2y$13$LPNkgA.HTshd/aTe8lS2guF7HA2vJh1G9NZr3zRZvENYlBxJWKcJO', NULL, 'narongsakpd.s@local.com', 10, 1699686470, 1699686470, NULL, 1, 1, 4),
(92, 'sumalee', 'สุมาลี วิจิตรพวงชมพู', 'j1_KpWX9gqdB3ldEgtVIIkQkjIznMC8V', '$2y$13$840bif1HLJKKch1IC..mbuH50r6DHiJGydX.wEukVJJ/SIRMe4T3u', NULL, 'sumalee.w@local.com', 10, 1699686524, 1699686524, NULL, 1, 1, 4),
(93, 'suwimol', 'สุวิมล ยาวิละ', '2LyaKKzkX4xaUm1xZ0rqmuibyWZlRnHn', '$2y$13$eKu1nqzO1nkL8cIF/AtPYeMe9rq/aNXgt7rHzBieQ5ZuLO7V.TAHq', NULL, 'suwimol.y@local.com', 10, 1699686562, 1699686562, NULL, 1, 1, 4),
(94, 'nongkarn', 'นงคราญ ไชยแก้ว', 'KhOevm-RxzkkGPAocZyRVuJdbY-70MKT', '$2y$13$PxWoDDOMM9P5/ucztStVeOS3cowmFtDSxuK.wbcIyDE22dfQvCNyu', NULL, 'nongkarn.c@local.com', 10, 1699686641, 1699686641, NULL, 1, 1, 4),
(95, 'kannikar', 'กรรณิการ์ เตชะเนตร', 'bqw8B9ndHTZxr1MAsLD5wdGI-0yhJErv', '$2y$13$Zkdw2L.Y/lvebyP673Sg1uwPrtltSRdpE63quJ6o13GwP3bBXBsfa', NULL, 'kannikar.t@local.com', 10, 1699686677, 1699686677, NULL, 1, 1, 4),
(96, 'natee', 'นที เตปินตา', 'dcymGMXXb80Tc03ceEdmt_ZGNJWlfnXS', '$2y$13$YHA.tuBV/YPgCk5oBLswE.UVbnQn33coR.CHVJtCSmECRmdVVtWza', NULL, 'natee.t@local.com', 10, 1699686696, 1699686696, NULL, 1, 1, 4),
(97, 'suwanan', 'สุวนันท์ จันทสิงห์', 'XPBYDyy02GTlB4m0k8LDNMfBTGPIFv-i', '$2y$13$E53XnYVTF8Cobpmn0qKUfOKeJoqDFBTSqLODsQwa176v1kLqJRWdS', NULL, 'suwanan.j@local.com', 10, 1699686726, 1699686726, NULL, 1, 1, 4),
(98, 'chokchai', 'โชคชัย จันทวงษ์', 'DlZeOkai8z130tasyHrC3Bs-5a1_nGmd', '$2y$13$Sszde9rGeOZtD5gCWPVnXe3ZIZNVeXMrpP3aoeR7OLww/EALPm4y2', NULL, 'chokchai.j@local.com', 10, 1699686752, 1699686752, NULL, 1, 1, 4),
(99, 'kunpan', 'ขุนแผน เสียงใหญ่', 'jJGHCmgOHR95eAwawoMWlQJOz4bO3KLE', '$2y$13$pLS2tzIiEE4rglEwiIn5WePN3C5aq5h2VeZit9TW0kyH7GjwggsXi', NULL, 'kunpan.s@local.com', 10, 1699686776, 1699686776, NULL, 1, 1, 4),
(100, 'napatporn', 'นภัสภรณ์ เลิศชมภู', 'deO2wA63dHuD6scgZmzr7msR8WDYZUxP', '$2y$13$UqHp.mN9XTMdzV5cx.rZN.o43egD/Bt7ff9IueEKjrCQB6dkV2iEy', NULL, 'napatporn.l@local.com', 10, 1699686803, 1699686803, NULL, 1, 1, 4),
(101, 'siwalee', 'สิวลี สุขบำรุง', 'R8hcVq2taOXl7OSL-B9iTaeChP5LTY0a', '$2y$13$vduvjvfX0Q5Q2Sppidux0.8H9EFdoKKeabD0k5zFfvqH4tk0CxRzu', NULL, 'siwalee.s@local.com', 10, 1699686823, 1699686823, NULL, 1, 1, 4),
(102, 'siripatsorn', 'ศิริภัสสร ขัติยะ', 'JyUw3KmvzoBPdgMMLFw1V69HDgPQTheA', '$2y$13$gpuZ562aKqGM.tyNs98FnOQv6pwQY2JP8Po8rocdyUq6yJIEmkMB.', NULL, 'siripatsorn.k@local.com', 10, 1699686849, 1699686849, NULL, 1, 1, 4),
(103, 'nampech', 'น้ำเพชร ลำใยผล', 'xsiB1HBq8bgGcykGL5DRm9MDf5udiNcv', '$2y$13$KiceLJ/TiCPz7thu3mZrBeHjblBX1oVlQpf/GOZeWKHNmhDxpGbkK', NULL, 'nampech.l@local.com', 10, 1699686879, 1699686879, NULL, 1, 1, 4),
(104, 'pasan', 'ประสาน ชัยตาล', 'ks3oAEZ61yBd9ofdreMLsgm7H3s-Ue5S', '$2y$13$cjppQMdrbloKy9I2QcQACOkcE34KA5.xNH5k8NV4XTbNi36jvpSL6', NULL, 'pasan.c@local.com', 10, 1699686903, 1699686903, NULL, 1, 1, 4),
(105, 'buaban', 'บัวบาน มณีจิต', 'iLoGKGtyGwhjflUNxu5Yzn9bQzAtxM2r', '$2y$13$NqFH0q9LmQrlVEwmoA4xB.Dxvudt1IITNb/jUQNNg.beuGR6ZXNYK', NULL, 'buaban.m@local.com', 10, 1699686933, 1699686933, NULL, 1, 1, 4),
(106, 'kitkajon', 'กิจขจร โค้งคูณหาร', 'T2KkDB5BYNsqMlf16Fs5VSP1S6oZVaVJ', '$2y$13$Mtw9M917a6Bcbj8AjumNxe6MsFoQAvdUstMNNrCeKyYEcNM79DDdC', NULL, 'kitkajon.k@local.com', 10, 1699686968, 1699686968, NULL, 1, 1, 4),
(109, 'penpayome', 'เพ็ญโพยม พรมเสพสัก', 'TxcFyFdiCoRMY21t76RvO_kowDefONvi', '$2y$13$W0GFY5I/JSuD8oOoFFWzIOJpmhvKaHAYoCWYRaRYuWzuJr24ay1um', NULL, 'penpayome.p@local.com', 10, 1699687069, 1699687069, NULL, 1, 1, 4),
(110, 'sukniran', 'สุขนิรันดร์ ผันผ่อน', 'Qg2SLiqjv5RazhRo1_CcI8WDdRpQ40Km', '$2y$13$xnbU1dKHpLMt4FzZxBsFGua2A.H0PU5WpbFl42rIDvAm3Du0l2sau', NULL, 'sukniran.p@local.com', 10, 1699687151, 1699687151, NULL, 1, 1, 4),
(111, 'pun', 'พัน ไชยวงค์', 'ZfaslU-Ma3eEKWS_Q5gQLX6CAAHORaM8', '$2y$13$1VtBMEIT.5txNULGzZkIve/MfRXGku0l6G6wV5g69GK9j/CLmQtsi', NULL, 'pun.c@local.com', 10, 1699687183, 1699687183, NULL, 1, 1, 10),
(112, 'patcharin', 'พัชรืน บรรดิ', 'nl69zW3du9EER0QEKdMd74UctPGKEgR8', '$2y$13$A7kASztfhEhC.yCWqTgmQeyr7tTnSVO901B1DBqyVzqYB8D1TO6Nm', NULL, 'patcharin.b@local.com', 10, 1699687237, 1699687237, NULL, 1, 1, 9),
(113, 'ratchanee', 'รัชณี ชุมภูโร', 'sKSXmQlcO8ChY1z2TytbmzFXDCrOXB_Q', '$2y$13$eoiMmfqe3MI.82NgjiBn1uzZ8F1wChHtSNuHnEGv6dnclSU.Zomhq', NULL, 'ratchanee.c@local.com', 10, 1699687263, 1699687263, NULL, 1, 1, 9),
(114, 'benjawan', 'เบญจวรรณ สุขใส', 'gmYRQ6MLSFVv46y2S9XxzrrxZ7AflF47', '$2y$13$3Voa06gcsfHLqRVE/oh/RuFzYffMeQ2u3fA/.csdOBzD1IUyPm6ZS', NULL, 'benjawan.s@local.com', 10, 1699687298, 1699687298, NULL, 1, 1, 9),
(115, 'sakda', 'ศักดา วงศ์สุข', 'wc83Q1oGp86pCnKZMuPbEpEJRMqAxWpZ', '$2y$13$OoyaY7BOWbkAwEIazB1V6O1QzgYOZt5rsfNWIwjcHeixiYYJOWQKi', NULL, 'sakda.w@local.com', 10, 1699687321, 1699687321, NULL, 1, 1, 9),
(116, 'mathurot', 'มธุรส อินเทพ', 'CdTvIVdx8PT-VRxGmLo98k5GMx1kNVGp', '$2y$13$cc/Fm/T3UBHBV9x/8LnyjOM6pkJIpoix2C.ie9teSb902PDB0QeMe', NULL, 'mathurot.i@local.com', 10, 1699687354, 1699687354, NULL, 1, 1, 9),
(117, 'soythip', 'สร้อยทิพย์ กาลศรี', 'ZM-XCtMM0GvQn_Aesgn9LLy26XNv3R5z', '$2y$13$TBBNc0ekmdn/D.Me1oYjh.OnrW35Wfojc7Ljmy8aY98z2kKmUQM16', NULL, 'soythip.k@local.com', 10, 1699687381, 1699687381, NULL, 1, 1, 9),
(118, 'namfon', 'น้ำฝน วงค์เทพ', 't7wIRKM1mmFxEKvohFc9YvKuA5wFi_Xp', '$2y$13$Kwiuhk6.8AmcRNITe9cM7uxVjC/QiO1p70I1RxhTWz4wcHTc1RRvS', NULL, 'namfon.w@local.com', 10, 1699687401, 1699687401, NULL, 1, 1, 9),
(119, 'samrouy', 'สำรวย กันธิยะ', 'BDZdfPbOI2klNUy7vbk14UOKuzY8_eeX', '$2y$13$X241C.OGHEftZWSX0blsdOTqktm4WreTlLaQFOKVwRaJjdu.2UNou', NULL, 'samrouy.k@local.com', 10, 1699687457, 1699687457, NULL, 1, 1, 11),
(120, 'natthapan', 'ณัฐพันธ์ ขุมนาค', 'nHfZMx0P8UNY0KK2SauLlUsqNpz4wkPq', '$2y$13$w/CridVo2BD4MU4weplCe.L52h5d7VboM61XXqXGNNeOISK/cJk4.', NULL, 'natthapan.k@local.com', 10, 1699687482, 1699687482, NULL, 1, 1, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_department_en_warehouse1_idx` (`warehouse_id`);

--
-- Indexes for table `en_actor`
--
ALTER TABLE `en_actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_actor_en_technician1_idx` (`technician_id`),
  ADD KEY `fk_en_actor_en_wo_list1_idx` (`en_wo_list_id`);

--
-- Indexes for table `en_category`
--
ALTER TABLE `en_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `en_machine`
--
ALTER TABLE `en_machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_part`
--
ALTER TABLE `en_part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_part_en_part_doc1_idx` (`en_part_doc_id`),
  ADD KEY `fk_en_part_en_part_group1_idx` (`en_part_group_id`),
  ADD KEY `fk_en_part_en_part_type1_idx` (`en_part_type_id`),
  ADD KEY `fk_en_part_en_unit1_idx` (`unit_lg`),
  ADD KEY `fk_en_part_en_unit2_idx` (`unit_sm`);

--
-- Indexes for table `en_part_doc`
--
ALTER TABLE `en_part_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_part_group`
--
ALTER TABLE `en_part_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_part_group_department1_idx` (`department_id`);

--
-- Indexes for table `en_part_type`
--
ALTER TABLE `en_part_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_part_group_department1_idx` (`department_id`);

--
-- Indexes for table `en_priority`
--
ALTER TABLE `en_priority`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `en_rp`
--
ALTER TABLE `en_rp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_request_en_priority_idx` (`priority`),
  ADD KEY `fk_en_request_en_urgency1_idx` (`urgency`),
  ADD KEY `fk_en_request_en_department1_idx` (`department`),
  ADD KEY `fk_en_rp_en_status1_idx` (`en_status_id`);

--
-- Indexes for table `en_rp_approve`
--
ALTER TABLE `en_rp_approve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_rp_approve_en_rp1_idx` (`wo_id`);

--
-- Indexes for table `en_rp_list`
--
ALTER TABLE `en_rp_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_request_list_en_location1_idx` (`location`),
  ADD KEY `fk_en_rp_list_en_rp1_idx` (`request_id`);

--
-- Indexes for table `en_status`
--
ALTER TABLE `en_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `en_team`
--
ALTER TABLE `en_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_technician`
--
ALTER TABLE `en_technician`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_unit`
--
ALTER TABLE `en_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_upload`
--
ALTER TABLE `en_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_urgency`
--
ALTER TABLE `en_urgency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `en_warehouse`
--
ALTER TABLE `en_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_wo`
--
ALTER TABLE `en_wo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_work_order_en_category1_idx` (`category_id`),
  ADD KEY `fk_en_work_order_en_type1_idx` (`work_type_id`),
  ADD KEY `fk_en_wo_en_machine1_idx` (`machine_id`),
  ADD KEY `fk_en_wo_en_rp1_idx` (`rp_id`);

--
-- Indexes for table `en_workclass`
--
ALTER TABLE `en_workclass`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `en_work_type`
--
ALTER TABLE `en_work_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `en_wo_approve`
--
ALTER TABLE `en_wo_approve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_wo_approve_en_wo1_idx` (`wo_id`);

--
-- Indexes for table `en_wo_list`
--
ALTER TABLE `en_wo_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_en_wo_list_en_wo1_idx` (`workorder_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `en_actor`
--
ALTER TABLE `en_actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `en_category`
--
ALTER TABLE `en_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `en_machine`
--
ALTER TABLE `en_machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `en_part`
--
ALTER TABLE `en_part`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `en_part_doc`
--
ALTER TABLE `en_part_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `en_part_group`
--
ALTER TABLE `en_part_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `en_part_type`
--
ALTER TABLE `en_part_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `en_priority`
--
ALTER TABLE `en_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `en_rp`
--
ALTER TABLE `en_rp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `en_rp_approve`
--
ALTER TABLE `en_rp_approve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `en_rp_list`
--
ALTER TABLE `en_rp_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `en_status`
--
ALTER TABLE `en_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `en_team`
--
ALTER TABLE `en_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `en_technician`
--
ALTER TABLE `en_technician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `en_unit`
--
ALTER TABLE `en_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `en_upload`
--
ALTER TABLE `en_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `en_urgency`
--
ALTER TABLE `en_urgency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `en_warehouse`
--
ALTER TABLE `en_warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `en_wo`
--
ALTER TABLE `en_wo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `en_workclass`
--
ALTER TABLE `en_workclass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT for table `en_work_type`
--
ALTER TABLE `en_work_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `en_wo_approve`
--
ALTER TABLE `en_wo_approve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `en_wo_list`
--
ALTER TABLE `en_wo_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_department_en_warehouse1` FOREIGN KEY (`warehouse_id`) REFERENCES `en_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `en_actor`
--
ALTER TABLE `en_actor`
  ADD CONSTRAINT `fk_en_actor_en_technician1` FOREIGN KEY (`technician_id`) REFERENCES `en_technician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_en_actor_en_wo_list1` FOREIGN KEY (`en_wo_list_id`) REFERENCES `en_wo_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `en_part`
--
ALTER TABLE `en_part`
  ADD CONSTRAINT `fk_en_part_en_part_doc1` FOREIGN KEY (`en_part_doc_id`) REFERENCES `en_part_doc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_part_en_part_group1` FOREIGN KEY (`en_part_group_id`) REFERENCES `en_part_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_part_en_part_type1` FOREIGN KEY (`en_part_type_id`) REFERENCES `en_part_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_part_en_unit1` FOREIGN KEY (`unit_lg`) REFERENCES `en_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_part_en_unit2` FOREIGN KEY (`unit_sm`) REFERENCES `en_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `en_part_group`
--
ALTER TABLE `en_part_group`
  ADD CONSTRAINT `fk_en_part_group_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `en_part_type`
--
ALTER TABLE `en_part_type`
  ADD CONSTRAINT `fk_en_part_group_department10` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `en_rp`
--
ALTER TABLE `en_rp`
  ADD CONSTRAINT `fk_en_request_en_department10` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_request_en_priority0` FOREIGN KEY (`priority`) REFERENCES `en_priority` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_request_en_urgency10` FOREIGN KEY (`urgency`) REFERENCES `en_urgency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_rp_en_status1` FOREIGN KEY (`en_status_id`) REFERENCES `en_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `en_rp_approve`
--
ALTER TABLE `en_rp_approve`
  ADD CONSTRAINT `fk_en_rp_approve_en_rp1` FOREIGN KEY (`wo_id`) REFERENCES `en_rp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `en_rp_list`
--
ALTER TABLE `en_rp_list`
  ADD CONSTRAINT `fk_en_request_list_en_location1` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_rp_list_en_rp1` FOREIGN KEY (`request_id`) REFERENCES `en_rp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `en_wo`
--
ALTER TABLE `en_wo`
  ADD CONSTRAINT `fk_en_wo_en_machine1` FOREIGN KEY (`machine_id`) REFERENCES `en_machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_en_wo_en_rp1` FOREIGN KEY (`rp_id`) REFERENCES `en_rp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_work_order_en_category1` FOREIGN KEY (`category_id`) REFERENCES `en_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_en_work_order_en_type1` FOREIGN KEY (`work_type_id`) REFERENCES `en_work_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `en_wo_approve`
--
ALTER TABLE `en_wo_approve`
  ADD CONSTRAINT `fk_en_wo_approve_en_wo1` FOREIGN KEY (`wo_id`) REFERENCES `en_wo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `en_wo_list`
--
ALTER TABLE `en_wo_list`
  ADD CONSTRAINT `fk_en_wo_list_en_wo1` FOREIGN KEY (`workorder_id`) REFERENCES `en_wo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
