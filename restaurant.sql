-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 01:09 AM
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
-- Database: `restaurant`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_order_item` (IN `p_food_name` VARCHAR(255), IN `p_quantity` INT, IN `p_order_id` INT)   BEGIN
    DECLARE v_item_id INT;
    DECLARE v_price DECIMAL(10, 2);
    DECLARE v_total_price DECIMAL(10, 2);

    -- Get the item ID and price from food_items table
    SELECT item_id, price INTO v_item_id, v_price
    FROM food_items
    WHERE name = p_food_name
    LIMIT 1;

    -- Calculate total price
    SET v_total_price = v_price * p_quantity;

    -- Insert into orders table
    INSERT INTO orders (order_id, item_id, quantity, total_price)
    VALUES (p_order_id, v_item_id, p_quantity, v_total_price);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_order_price` (`input_order_id` INT) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(total_price)
    INTO total
    FROM orders
    WHERE order_id = input_order_id;

    RETURN IFNULL(total, 0.00);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`item_id`, `name`, `price`) VALUES
(1, 'Burger', 8.00),
(2, 'Fries', 3.00),
(3, 'Pizza', 10.00),
(4, 'Sandwich', 6.50),
(5, 'Donut', 2.00),
(6, 'Coke', 1.50),
(7, 'Sprite', 1.50);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_id`, `quantity`, `total_price`) VALUES
(55, 1, 2, 20.00),
(55, 3, 1, 4.00),
(56, 2, 1, 8.00),
(56, 5, 2, 5.00),
(57, 4, 1, 6.00),
(57, 6, 1, 1.50),
(58, 7, 3, 4.50),
(59, 3, 1, 10.00),
(59, 6, 2, 3.00),
(60, 6, 2, 3.00),
(61, 6, 2, 3.00),
(62, 3, 1, 10.00),
(63, 3, 2, 20.00),
(63, 6, 1, 1.50),
(64, 5, 2, 4.00),
(65, 3, 1, 10.00),
(65, 7, 1, 1.50),
(66, 5, 1, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `order_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`order_id`, `status`) VALUES
(55, 'delivered'),
(56, 'in transit'),
(57, 'in progress'),
(58, 'pending'),
(59, 'in progress'),
(60, 'in progress'),
(61, 'in progress'),
(62, 'in progress'),
(63, 'in progress'),
(64, 'in progress'),
(65, 'in progress'),
(66, 'in progress');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`order_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `food_items` (`item_id`);

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
