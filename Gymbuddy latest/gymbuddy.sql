-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2025 at 05:32 PM
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
-- Database: `gymbuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `bmi_tracker`
--

CREATE TABLE `bmi_tracker` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `bmi` decimal(4,2) NOT NULL,
  `date_recorded` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bmi_tracker`
--

INSERT INTO `bmi_tracker` (`id`, `user_id`, `weight`, `height`, `bmi`, `date_recorded`) VALUES
(1, 11, 71.00, 175.00, 23.18, '2025-04-05 17:28:15'),
(2, 11, 89.00, 175.00, 29.06, '2025-04-05 17:28:25'),
(3, 14, 89.00, 172.00, 30.08, '2025-04-07 12:37:30'),
(4, 14, 79.00, 172.00, 26.70, '2025-04-07 13:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `payment_status` varchar(20) DEFAULT 'unpaid',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `trainer_id`, `date`, `time`, `status`, `payment_status`, `created_at`) VALUES
(67, 32, 22, '2025-04-28', '09:00:00', 'pending', 'unpaid', '2025-04-07 14:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`, `created_at`, `updated_at`) VALUES
(1, 'cancellation_time', '600', '2025-04-07 03:47:22', '2025-04-07 04:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `name`, `description`, `contact`, `image_url`, `specialization`, `status`) VALUES
(14, 'Paulo Lustestica', NULL, '09785563421', '67cb1820933cc.jpg', 'Lifting', 'approved'),
(22, 'Kenett Villalon', NULL, '09067894531', '67f28c701b0dd.jpg', 'Cardio', 'approved'),
(29, 'Exequiel Dela Cruz', NULL, '09785534212', '67f3e6703a228.jpg', 'Body Building', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_availability`
--

CREATE TABLE `trainer_availability` (
  `id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `day_of_week` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer_availability`
--

INSERT INTO `trainer_availability` (`id`, `trainer_id`, `day_of_week`, `start_time`, `end_time`, `is_available`) VALUES
(65, 14, 0, '09:00:00', '17:00:00', 1),
(66, 14, 1, '09:00:00', '23:00:00', 1),
(67, 14, 2, '09:00:00', '17:00:00', 1),
(68, 14, 3, '11:00:00', '19:00:00', 1),
(69, 14, 4, '09:00:00', '17:00:00', 1),
(70, 22, 0, '09:00:00', '17:00:00', 1),
(71, 22, 1, '09:00:00', '17:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','trainer') DEFAULT 'user',
  `trainer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `trainer_id`) VALUES
(9, 'admin', 'admin@gmail.com', '$2y$10$aDsqCq2FiMCZHq8HSOmkiOaTysAVkL8.PVOYNARd.a47S9c3gS3hu', 'admin', NULL),
(10, 'Paulo Lustestica', 'PauloLustestica@gmail.com', '$2y$10$BJSkWu10tC71IcgwuR5TF.fQO8xdHygqotKAZxommgXaKvm9wSrFW', 'trainer', 14),
(11, 'user', 'user@gmail.com', '$2y$10$pH.PmvaF2mZ6I89hVtJE8.227pV.3/1W.gd5BWpZ8uCSvoQXAVOK6', 'user', NULL),
(14, 'lance', 'lance@gmail.com', '$2y$10$TQ60H7aoP5Zeq7mQp9cP6.VN3TwfcNdY52Fv60b16rpttmfK1fFvG', 'user', NULL),
(23, 'Kenett Villalon', 'kenet@gmail.com', '$2y$10$93WdPd8VNf/yg2uqHV5RmONuwZyBOt328C3HZTKpZ5rN3Im17pgXO', 'trainer', 22),
(31, 'Exequiel Dela Cruz', 'Exequiel@gmail.com', '$2y$10$RxcMXEzHiyFBzrwJCU/0K.mASTVGNXsg6qkcvI2cwg/5q7BUd3C9O', 'trainer', 29),
(32, 'Keithz', 'keithz@gmail.com', '$2y$10$X6p5.UD7NTwxUyTkBW.3jul4juWUMzzR54FuteAqAODcDMrVrxN/m', 'user', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bmi_tracker`
--
ALTER TABLE `bmi_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainer_availability`
--
ALTER TABLE `trainer_availability`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_availability` (`trainer_id`,`day_of_week`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_user_trainer` (`trainer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bmi_tracker`
--
ALTER TABLE `bmi_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `trainer_availability`
--
ALTER TABLE `trainer_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bmi_tracker`
--
ALTER TABLE `bmi_tracker`
  ADD CONSTRAINT `bmi_tracker_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`);

--
-- Constraints for table `trainer_availability`
--
ALTER TABLE `trainer_availability`
  ADD CONSTRAINT `trainer_availability_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
