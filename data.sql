-- Database Data for Used Car Marketplace
-- Updated for Normalized Schema

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- Dumping data for table `cities`
-- --------------------------------------------------------

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
-- Dumping data for table `brands`
-- --------------------------------------------------------

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Subaru');

-- --------------------------------------------------------
-- Dumping data for table `models`
-- --------------------------------------------------------

INSERT INTO `models` (`model_id`, `model_name`, `brand_id`) VALUES
(1, 'Hilux', 1),
(2, 'Explorer', 2),
(3, 'Forester', 3),
(4, 'Corolla', 1);

-- --------------------------------------------------------
-- Dumping data for table `fuel_types`
-- --------------------------------------------------------

INSERT INTO `fuel_types` (`fuel_type_id`, `fuel_name`) VALUES
(1, 'Petrol'),
(2, 'Diesel'),
(3, 'Electric'),
(4, 'Hybrid');

-- --------------------------------------------------------
-- Dumping data for table `transmission_types`
-- --------------------------------------------------------

INSERT INTO `transmission_types` (`transmission_id`, `transmission_name`) VALUES
(1, 'Manual'),
(2, 'Automatic'),
(3, 'CVT'),
(4, 'Semi-Automatic');

-- --------------------------------------------------------
-- Dumping data for table `features`
-- --------------------------------------------------------

INSERT INTO `features` (`feature_id`, `feature_name`) VALUES
(1, 'Leather Seats'),
(2, 'Sunroof'),
(3, 'Navigation System'),
(4, 'Turbo Charged'),
(5, '4WD/AWD');

-- --------------------------------------------------------
-- Dumping data for table `users`
-- --------------------------------------------------------

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `phone_number`, `city_id`, `role`) VALUES
(1, 'Kimani Roy', 'macharia.kimani@strathmore.edu', 'hashedpassword123', '+254798052554', 1, 'seller'),
(2, 'Daudi Makumbi', 'daudimakumbik@gmail.com', 'hashedpassword123', '+254712345678', 1, 'buyer'),
(3, 'Hussein Ahmed', 'husseinahmed@gmail.com', 'hashedpassword123', '+254722334455', 2, 'buyer');

-- --------------------------------------------------------
-- Dumping data for table `cars`
-- --------------------------------------------------------

INSERT INTO `cars` (`car_id`, `vin`, `model_id`, `year_manufacture`, `mileage`, `color`, `transmission_id`, `fuel_type_id`, `engine_capacity`, `seller_id`) VALUES
(1, 'JUMA123VIN9876543', 1, '2020', 45000, 'White', 2, 2, '2.8L', 1),
(2, 'JUMA456VIN1234567', 3, '2019', 70000, 'Blue', 1, 1, '2.0L', 1);

-- --------------------------------------------------------
-- Dumping data for table `car_features`
-- --------------------------------------------------------

INSERT INTO `car_features` (`car_id`, `feature_id`) VALUES
(1, 1),
(1, 5),
(2, 4),
(2, 5);

-- --------------------------------------------------------
-- Dumping data for table `advertisements`
-- --------------------------------------------------------

INSERT INTO `advertisements` (`ad_id`, `car_id`, `title`, `description`, `price`, `status`) VALUES
(1, 1, 'Toyota Hilux 2020 Model (Nairobi)', 'Excellent condition, used for off road ready.', 3500000.00, 'Active'),
(2, 2, 'Subaru Forester 2019 (Nairobi)', 'Well maintained, turbo spec.', 2800000.00, 'Active');

-- --------------------------------------------------------
-- Dumping data for table `car_images`
-- --------------------------------------------------------

INSERT INTO `car_images` (`ad_id`, `image_url`, `is_primary`) VALUES
(1, 'https://images.example.com/hilux_front.jpg', 1),
(1, 'https://images.example.com/hilux_interior.jpg', 0),
(2, 'https://images.example.com/forester_main.jpg', 1);

-- --------------------------------------------------------
-- Dumping data for table `bids`
-- --------------------------------------------------------

INSERT INTO `bids` (`ad_id`, `buyer_id`, `bid_amount`, `bid_status`) VALUES
(1, 2, 3600000.00, 'Accepted'),
(1, 3, 3700000.00, 'Outbid'),
(2, 2, 2800000.00, 'Pending'),
(2, 3, 2900000.00, 'Pending');

-- --------------------------------------------------------
-- Dumping data for table `transactions`
-- --------------------------------------------------------

INSERT INTO `transactions` (`ad_id`, `buyer_id`, `seller_id`, `final_price`, `payment_status`) VALUES
(1, 2, 1, 3600000.00, 'Completed');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

