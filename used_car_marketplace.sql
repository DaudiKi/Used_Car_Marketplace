-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2026 at 12:03 PM
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
-- Database: `used_car_marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `ad_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Active','Sold','Expired') NOT NULL DEFAULT 'Active'
) ;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`ad_id`, `car_id`, `title`, `description`, `price`, `date_posted`, `status`) VALUES
(1, 1, 'Toyota Hilux 2020 Model (Nairobi)', 'Excellent condition, used for off road ready.', 3500000.00, '2026-01-08 10:37:43', 'Active'),
(2, 2, 'Subaru Forester 2019 (Nairobi)', 'Well maintained, turbo spec.', 2800000.00, '2026-01-08 10:37:43', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `bid_amount` decimal(10,2) NOT NULL,
  `bid_date` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `ad_id`, `buyer_id`, `bid_amount`, `bid_date`) VALUES
(1, 1, 1, 3600000.00, '2026-01-08 10:58:32'),
(2, 1, 2, 3700000.00, '2026-01-08 10:58:32'),
(3, 2, 1, 2800000.00, '2026-01-08 10:58:32'),
(4, 2, 2, 2900000.00, '2026-01-08 10:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(2, 'Ford'),
(3, 'Subaru'),
(1, 'Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `vin` varchar(17) NOT NULL,
  `model_id` int(11) NOT NULL,
  `year_manufacture` year(4) NOT NULL,
  `mileage` int(11) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `transmission_type` enum('Manual','Automatic','CVT') NOT NULL,
  `seller_id` int(11) NOT NULL
) ;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `vin`, `model_id`, `year_manufacture`, `mileage`, `color`, `transmission_type`, `seller_id`) VALUES
(1, 'JUMA123VIN9876543', 1, '2020', 45000, NULL, 'Automatic', 1),
(2, 'JUMA456VIN1234567', 3, '2019', 70000, NULL, 'Manual', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Kenya'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`, `country`) VALUES
(1, 'Nairobi', 'Kenya'),
(2, 'Mombasa', 'Kenya'),
(3, 'Kisumu', 'Kenya'),
(4, 'Kampala', 'Uganda'),
(5, 'Entebbe', 'Uganda'),
(6, 'Jinja', 'Uganda'),
(7, 'Dar es Salaam', 'Tanzania'),
(8, 'Zanzibar City', 'Tanzania'),
(9, 'Arusha', 'Tanzania'),
(10, 'Kigali', 'Rwanda'),
(11, 'Bujumbura', 'Burundi'),
(12, 'Addis Ababa', 'Ethiopia'),
(13, 'Juba', 'South Sudan');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`model_id`, `model_name`, `brand_id`) VALUES
(1, 'Hilux', 1),
(2, 'Explorer', 2),
(3, 'Forester', 3),
(4, 'Corolla', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `city_id` int(11) NOT NULL,
  `role` enum('buyer','seller') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `phone_number`, `registration_date`, `city_id`, `role`) VALUES
(1, 'Kimani Roy', 'macharia.kimani@strathmore.edu', 'hashedpassword123', '+254798052554', '2026-01-08 10:37:43', 1, 'buyer'),
(2, 'Daudi Makumbi', 'daudimakumbik@gmail.com', 'hashedpassword123', NULL, '2026-01-08 10:47:38', 1, 'buyer'),
(3, 'Hussein Ahmed', 'husseinahmed@gmail.com', 'hashedpassword123', NULL, '2026-01-08 10:47:38', 2, 'seller');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`ad_id`),
  ADD UNIQUE KEY `car_id` (`car_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `vin` (`vin`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`),
  ADD UNIQUE KEY `city_name` (`city_name`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `advertisements` (`ad_id`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `models` (`model_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
