-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2025 at 03:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tailor_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `delivery_date` date NOT NULL,
  `receive_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_code`, `name`, `phone`, `delivery_date`, `receive_date`, `created_at`, `updated_at`) VALUES
(1, 'CUST001', 'أحمد محمد', '0501234567', '2024-02-15', '2024-01-10', '2025-11-12 12:09:21', '2025-11-12 12:09:21'),
(2, 'CUST002', 'abdo', '011111', '0018-05-18', '0018-05-18', '2025-11-12 13:04:56', '2025-11-12 13:04:56');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_summary`
-- (See below for the actual view)
--
CREATE TABLE `customer_summary` (
`customer_id` int(11)
,`customer_code` varchar(50)
,`name` varchar(100)
,`phone` varchar(20)
,`total_invoices` bigint(21)
,`total_amount` decimal(32,2)
,`total_paid` decimal(32,2)
,`total_remaining` decimal(32,2)
,`incomplete_invoices` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remaining_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL DEFAULT 'غير مكتمل',
  `delivery_status` varchar(50) NOT NULL DEFAULT 'لم يتم التسليم',
  `delivery_payment_status` varchar(50) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `receive_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `invoice_number`, `customer_id`, `total_amount`, `paid_amount`, `remaining_amount`, `status`, `delivery_status`, `delivery_payment_status`, `delivery_date`, `receive_date`, `created_at`, `updated_at`) VALUES
(1, 'INV-001', 1, 500.00, 200.00, 300.00, 'غير مكتمل', 'لم يتم التسليم', NULL, '2024-02-15', '2024-01-10', '2025-11-12 12:09:21', '2025-11-13 07:38:24'),
(2, 'INV-002', 1, 200.00, 0.00, 200.00, 'غير مكتمل', 'لم يتم التسليم', NULL, '0018-04-17', '0018-05-18', '2025-11-12 13:06:52', '2025-11-13 07:38:24'),
(3, 'INV-003', 2, 220.00, 10.00, 210.00, 'غير مكتمل', 'لم يتم التسليم', NULL, '0018-05-18', '0018-05-18', '2025-11-12 13:07:37', '2025-11-13 07:38:24'),
(4, 'INV-004', 1, 200.00, 170.00, 30.00, 'غير مكتمل', 'لم يتم التسليم', NULL, '2025-11-12', '2025-11-12', '2025-11-12 13:46:29', '2025-11-13 07:38:24'),
(5, 'INV-005', 2, 200.00, 150.00, 50.00, 'مكتمل', 'لم يتم التسليم', NULL, '2025-11-13', '2025-11-13', '2025-11-13 07:26:30', '2025-11-13 07:42:58'),
(6, 'INV-006', 2, 130.00, 130.00, 0.00, 'مكتمل', 'لم يتم التسليم', NULL, '2025-11-13', '2025-11-13', '2025-11-13 07:35:14', '2025-11-13 07:42:40'),
(7, 'INV-007', 1, 200.00, 0.00, 200.00, 'غير مكتمل', 'لم يتم التسليم', NULL, '2025-11-13', '2025-11-13', '2025-11-13 07:35:41', '2025-11-13 07:38:24');

-- --------------------------------------------------------

--
-- Stand-in structure for view `invoice_details`
-- (See below for the actual view)
--
CREATE TABLE `invoice_details` (
`invoice_id` int(11)
,`invoice_number` varchar(50)
,`customer_id` int(11)
,`customer_name` varchar(100)
,`customer_phone` varchar(20)
,`total_amount` decimal(10,2)
,`paid_amount` decimal(10,2)
,`remaining_amount` decimal(10,2)
,`status` varchar(50)
,`delivery_status` varchar(50)
,`delivery_payment_status` varchar(50)
,`delivery_date` date
,`receive_date` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_measurements`
--

CREATE TABLE `invoice_measurements` (
  `invoice_measurement_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `pants_type` varchar(50) DEFAULT NULL,
  `pants_length` varchar(50) DEFAULT NULL,
  `leg` varchar(50) DEFAULT NULL,
  `leg_type` varchar(50) DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `sleeve` varchar(50) DEFAULT NULL,
  `safra` varchar(50) DEFAULT NULL,
  `pocket` varchar(50) DEFAULT NULL,
  `bshleik` varchar(50) DEFAULT NULL,
  `fit` varchar(100) DEFAULT NULL,
  `atk` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_measurements`
--

INSERT INTO `invoice_measurements` (`invoice_measurement_id`, `invoice_id`, `pants_type`, `pants_length`, `leg`, `leg_type`, `detail`, `length`, `sleeve`, `safra`, `pocket`, `bshleik`, `fit`, `atk`, `location`, `created_at`) VALUES
(1, 2, 'أستك+دكة', '23', '23', 'خليجي', 'بنطلون', '23', 'أساور', '43', 'أصيل', 'مكشوف', 'نص', 'كاملة بوز', 'ورشة', '2025-11-12 13:06:52'),
(2, 3, 'أستك+دكة', '', '', 'خليجي', 'بنطلون', '', 'أساور', '', 'أصيل', 'مكشوف', 'نص', 'كاملة بوز', 'ورشة', '2025-11-12 13:07:37'),
(3, 4, 'أستك+دكة', '34', '34', 'خليجي', 'بنطلون', '345', 'أساور', '345', 'أصيل', 'مكشوف', 'نص', 'كاملة بوز', 'ورشة', '2025-11-12 13:46:29'),
(4, 5, 'أستك+دكة', '', '', 'خليجي', 'بنطلون', '', 'أساور', '', 'أصيل', 'مكشوف', 'نص', 'كاملة بوز', 'ورشة', '2025-11-13 07:26:30'),
(5, 6, 'أستك+دكة', '', '', 'خليجي', 'بنطلون', '', 'أساور', '', 'أصيل', 'مكشوف', 'نص', 'كاملة بوز', 'ورشة', '2025-11-13 07:35:14'),
(6, 7, 'أستك+دكة', '', '', 'خليجي', 'بنطلون', '', 'أساور', '', 'أصيل', 'مكشوف', 'نص', 'كاملة بوز', 'ورشة', '2025-11-13 07:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `measurement_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `pants_type` varchar(50) DEFAULT NULL,
  `pants_length` varchar(50) DEFAULT NULL,
  `leg` varchar(50) DEFAULT NULL,
  `leg_type` varchar(50) DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `sleeve` varchar(50) DEFAULT NULL,
  `safra` varchar(50) DEFAULT NULL,
  `pocket` varchar(50) DEFAULT NULL,
  `bshleik` varchar(50) DEFAULT NULL,
  `fit` varchar(100) DEFAULT NULL,
  `atk` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_id`, `amount`, `payment_date`, `notes`, `created_at`) VALUES
(1, 1, 200.00, '2025-11-12 12:55:14', '', '2025-11-12 12:55:14'),
(5, 4, 170.00, '2025-11-12 13:49:53', '', '2025-11-12 13:49:53'),
(6, 3, 10.00, '2025-11-12 13:59:35', '', '2025-11-12 13:59:35'),
(10, 6, 130.00, '2025-11-13 07:42:40', '', '2025-11-13 07:42:40'),
(11, 5, 150.00, '2025-11-13 07:42:58', '', '2025-11-13 07:42:58');

-- --------------------------------------------------------

--
-- Stand-in structure for view `upcoming_invoices`
-- (See below for the actual view)
--
CREATE TABLE `upcoming_invoices` (
`invoice_id` int(11)
,`invoice_number` varchar(50)
,`receive_date` date
,`customer_name` varchar(100)
,`customer_phone` varchar(20)
,`total_amount` decimal(10,2)
,`remaining_amount` decimal(10,2)
,`status` varchar(50)
,`days_until_receive` int(7)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin123', 'مدير النظام', '01114493323', '2025-11-12 12:09:20', '2025-11-12 12:32:03');

-- --------------------------------------------------------

--
-- Structure for view `customer_summary`
--
DROP TABLE IF EXISTS `customer_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_summary`  AS SELECT `c`.`customer_id` AS `customer_id`, `c`.`customer_code` AS `customer_code`, `c`.`name` AS `name`, `c`.`phone` AS `phone`, count(`i`.`invoice_id`) AS `total_invoices`, coalesce(sum(`i`.`total_amount`),0) AS `total_amount`, coalesce(sum(`i`.`paid_amount`),0) AS `total_paid`, coalesce(sum(`i`.`remaining_amount`),0) AS `total_remaining`, count(case when `i`.`status` = 'غير مكتمل' then 1 end) AS `incomplete_invoices` FROM (`customers` `c` left join `invoices` `i` on(`c`.`customer_id` = `i`.`customer_id`)) GROUP BY `c`.`customer_id`, `c`.`customer_code`, `c`.`name`, `c`.`phone` ORDER BY coalesce(sum(`i`.`remaining_amount`),0) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `invoice_details`
--
DROP TABLE IF EXISTS `invoice_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `invoice_details`  AS SELECT `i`.`invoice_id` AS `invoice_id`, `i`.`invoice_number` AS `invoice_number`, `c`.`customer_id` AS `customer_id`, `c`.`name` AS `customer_name`, `c`.`phone` AS `customer_phone`, `i`.`total_amount` AS `total_amount`, `i`.`paid_amount` AS `paid_amount`, `i`.`remaining_amount` AS `remaining_amount`, `i`.`status` AS `status`, `i`.`delivery_status` AS `delivery_status`, `i`.`delivery_payment_status` AS `delivery_payment_status`, `i`.`delivery_date` AS `delivery_date`, `i`.`receive_date` AS `receive_date`, `i`.`created_at` AS `created_at` FROM (`invoices` `i` join `customers` `c` on(`i`.`customer_id` = `c`.`customer_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `upcoming_invoices`
--
DROP TABLE IF EXISTS `upcoming_invoices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `upcoming_invoices`  AS SELECT `i`.`invoice_id` AS `invoice_id`, `i`.`invoice_number` AS `invoice_number`, `i`.`receive_date` AS `receive_date`, `c`.`name` AS `customer_name`, `c`.`phone` AS `customer_phone`, `i`.`total_amount` AS `total_amount`, `i`.`remaining_amount` AS `remaining_amount`, `i`.`status` AS `status`, to_days(`i`.`receive_date`) - to_days(curdate()) AS `days_until_receive` FROM (`invoices` `i` join `customers` `c` on(`i`.`customer_id` = `c`.`customer_id`)) WHERE `i`.`status` = 'غير مكتمل' AND `i`.`receive_date` >= curdate() ORDER BY `i`.`receive_date` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_code` (`customer_code`),
  ADD KEY `idx_customer_code` (`customer_code`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `idx_delivery_date` (`delivery_date`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `idx_invoice_number` (`invoice_number`),
  ADD KEY `idx_customer_id` (`customer_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_delivery_date` (`delivery_date`),
  ADD KEY `idx_receive_date` (`receive_date`);

--
-- Indexes for table `invoice_measurements`
--
ALTER TABLE `invoice_measurements`
  ADD PRIMARY KEY (`invoice_measurement_id`),
  ADD KEY `idx_invoice_id` (`invoice_id`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`measurement_id`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `idx_invoice_id` (`invoice_id`),
  ADD KEY `idx_payment_date` (`payment_date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_measurements`
--
ALTER TABLE `invoice_measurements`
  MODIFY `invoice_measurement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `measurement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `invoice_measurements`
--
ALTER TABLE `invoice_measurements`
  ADD CONSTRAINT `invoice_measurements_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE;

--
-- Constraints for table `measurements`
--
ALTER TABLE `measurements`
  ADD CONSTRAINT `measurements_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
