-- Database Schema for Used Car Marketplace
-- Improved and Normalized Version
-- Last Updated: 2026-01-22 by Aditya More

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- Table structure for table `cities`
-- --------------------------------------------------------

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Kenya',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uk_city_name` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `brands`
-- --------------------------------------------------------

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `uk_brand_name` (`brand_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `models`
-- --------------------------------------------------------

CREATE TABLE `models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(50) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`model_id`),
  KEY `idx_brand_id` (`brand_id`),
  CONSTRAINT `fk_models_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `fuel_types`
-- --------------------------------------------------------

CREATE TABLE `fuel_types` (
  `fuel_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `fuel_name` varchar(30) NOT NULL,
  PRIMARY KEY (`fuel_type_id`),
  UNIQUE KEY `uk_fuel_name` (`fuel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `transmission_types`
-- --------------------------------------------------------

CREATE TABLE `transmission_types` (
  `transmission_id` int(11) NOT NULL AUTO_INCREMENT,
  `transmission_name` varchar(30) NOT NULL,
  PRIMARY KEY (`transmission_id`),
  UNIQUE KEY `uk_transmission_name` (`transmission_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `users`
-- --------------------------------------------------------

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `role` enum('buyer','seller','admin') NOT NULL DEFAULT 'buyer',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_city_id` (`city_id`),
  CONSTRAINT `fk_users_cities` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `cars`
-- --------------------------------------------------------

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `vin` varchar(17) NOT NULL,
  `model_id` int(11) NOT NULL,
  `year_manufacture` year(4) NOT NULL,
  `mileage` int(11) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `transmission_id` int(11) NOT NULL,
  `fuel_type_id` int(11) NOT NULL,
  `engine_capacity` varchar(20) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `uk_vin` (`vin`),
  KEY `idx_model_id` (`model_id`),
  KEY `idx_seller_id` (`seller_id`),
  KEY `idx_mileage` (`mileage`),
  CONSTRAINT `fk_cars_models` FOREIGN KEY (`model_id`) REFERENCES `models` (`model_id`),
  CONSTRAINT `fk_cars_users` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_cars_transmission` FOREIGN KEY (`transmission_id`) REFERENCES `transmission_types` (`transmission_id`),
  CONSTRAINT `fk_cars_fuel` FOREIGN KEY (`fuel_type_id`) REFERENCES `fuel_types` (`fuel_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `features`
-- --------------------------------------------------------

CREATE TABLE `features` (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(50) NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uk_feature_name` (`feature_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `car_features`
-- --------------------------------------------------------

CREATE TABLE `car_features` (
  `car_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`,`feature_id`),
  CONSTRAINT `fk_cf_cars` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cf_features` FOREIGN KEY (`feature_id`) REFERENCES `features` (`feature_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `advertisements`
-- --------------------------------------------------------

CREATE TABLE `advertisements` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Active','Sold','Expired','Withdrawn') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`ad_id`),
  UNIQUE KEY `uk_car_id` (`car_id`),
  KEY `idx_price` (`price`),
  KEY `idx_status` (`status`),
  CONSTRAINT `fk_ads_cars` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `car_images`
-- --------------------------------------------------------

CREATE TABLE `car_images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`image_id`),
  KEY `idx_ad_id` (`ad_id`),
  CONSTRAINT `fk_images_ads` FOREIGN KEY (`ad_id`) REFERENCES `advertisements` (`ad_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `bids`
-- --------------------------------------------------------

CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `bid_amount` decimal(15,2) NOT NULL,
  `bid_status` enum('Pending','Accepted','Rejected','Outbid') NOT NULL DEFAULT 'Pending',
  `bid_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`bid_id`),
  KEY `idx_ad_id` (`ad_id`),
  KEY `idx_buyer_id` (`buyer_id`),
  CONSTRAINT `fk_bids_ads` FOREIGN KEY (`ad_id`) REFERENCES `advertisements` (`ad_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bids_users` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `transactions`
-- --------------------------------------------------------

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `final_price` decimal(15,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('Pending','Completed','Failed') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`transaction_id`),
  KEY `idx_ad_id` (`ad_id`),
  KEY `idx_buyer_id` (`buyer_id`),
  KEY `idx_seller_id` (`seller_id`),
  CONSTRAINT `fk_trans_ads` FOREIGN KEY (`ad_id`) REFERENCES `advertisements` (`ad_id`),
  CONSTRAINT `fk_trans_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_trans_seller` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Trigger: Auto-delete advertisement when transaction is completed
-- Purpose: Query optimization by removing sold car listings
-- --------------------------------------------------------

DELIMITER $$

CREATE TRIGGER `trg_delete_ad_on_completed_sale`
AFTER INSERT ON `transactions`
FOR EACH ROW
BEGIN
    -- When a transaction with 'Completed' status is inserted
    -- Delete the corresponding advertisement to optimize queries
    IF NEW.payment_status = 'Completed' THEN
        DELETE FROM `advertisements` WHERE `ad_id` = NEW.ad_id;
    END IF;
END$$

DELIMITER ;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

