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

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(2, 'Ford'),
(3, 'Subaru'),
(1, 'Toyota');

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

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`model_id`, `model_name`, `brand_id`) VALUES
(1, 'Hilux', 1),
(2, 'Explorer', 2),
(3, 'Forester', 3),
(4, 'Corolla', 1);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `phone_number`, `registration_date`, `city_id`, `role`) VALUES
(1, 'Kimani Roy', 'macharia.kimani@strathmore.edu', 'hashedpassword123', '+254798052554', '2026-01-08 10:37:43', 1, 'buyer'),
(2, 'Daudi Makumbi', 'daudimakumbik@gmail.com', 'hashedpassword123', NULL, '2026-01-08 10:47:38', 1, 'buyer'),
(3, 'Hussein Ahmed', 'husseinahmed@gmail.com', 'hashedpassword123', NULL, '2026-01-08 10:47:38', 2, 'seller');

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `vin`, `model_id`, `year_manufacture`, `mileage`, `color`, `transmission_type`, `seller_id`) VALUES
(1, 'JUMA123VIN9876543', 1, '2020', 45000, NULL, 'Automatic', 1),
(2, 'JUMA456VIN1234567', 3, '2019', 70000, NULL, 'Manual', 1);

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`ad_id`, `car_id`, `title`, `description`, `price`, `date_posted`, `status`) VALUES
(1, 1, 'Toyota Hilux 2020 Model (Nairobi)', 'Excellent condition, used for off road ready.', 3500000.00, '2026-01-08 10:37:43', 'Active'),
(2, 2, 'Subaru Forester 2019 (Nairobi)', 'Well maintained, turbo spec.', 2800000.00, '2026-01-08 10:37:43', 'Active');

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `ad_id`, `buyer_id`, `bid_amount`, `bid_date`) VALUES
(1, 1, 1, 3600000.00, '2026-01-08 10:58:32'),
(2, 1, 2, 3700000.00, '2026-01-08 10:58:32'),
(3, 2, 1, 2800000.00, '2026-01-08 10:58:32'),
(4, 2, 2, 2900000.00, '2026-01-08 10:58:32');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
