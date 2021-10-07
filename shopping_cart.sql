-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2020 at 11:02 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_cart`
--
CREATE DATABASE IF NOT EXISTS `shopping_cart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shopping_cart`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `fk_user_order` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total`, `order_date`, `status`) VALUES
(1, 1, '600.00', '2020-12-05 20:51:35', 0),
(2, 1, '2.00', '2020-12-05 21:40:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_order` (`order_id`),
  KEY `fk_product_order` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`, `sub_total`) VALUES
(1, 1, 1, 1, '100.00', '100.00'),
(2, 1, 2, 1, '500.00', '500.00'),
(3, 2, 1, 12, '100.00', '1200.00'),
(4, 2, 2, 2, '500.00', '1000.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `product_name` varchar(512) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category`, `product_name`, `description`, `price`, `image`, `created_date`, `is_deleted`) VALUES
(1, 3, 'Plain Chair', 'A simple, yet elegant chair', '50.00', 'product_1.png', '2020-11-29 23:00:00', 0),
(2, 3, 'Fancy Chair', 'A well crafted chair', '100.00', 'product_3.png', '2020-11-29 23:00:00', 0),
(3, 1, 'Single Sofa', 'A sofa meant for a single person', '150.00', '1_seat_sofa.jpg', '2020-12-05 22:04:00', 0),
(4, 1, 'Double Sofa', 'A double sofa', '200.00', '2_seat_sofa.jpg', '2020-12-05 22:06:00', 0),
(5, 1, 'Large Sofa', 'A sofa with 3 seats', '250.00', '3_seat_sofa.jpg', '2020-12-05 22:08:00', 0),
(6, 2, 'King Size Bed', 'A large bed', '400.00', 'king_size.png', '2020-12-05 23:00:00', 0),
(7, 2, 'Queen Size Bed', 'Large bed, slightly smaller than king size', '300.00', 'queen_size.png', '2020-12-05 23:02:00', 0),
(8, 4, 'Dining Table', 'A dining table for 6', '250.00', 'dining.jpg', '2020-12-05 23:06:00', 0),
(9, 4, 'Coffee Table', 'A beautiful coffee table', '150.00', 'coffee.jpg', '2020-12-05 23:10:00', 0);


-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(512) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`) VALUES
(1, 'Sofa'),
(2, 'Bed'),
(3, 'Chair'),
(4, 'Table');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `is_admin` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `email`, `password`, `is_admin`, `is_deleted`, `created_date`) VALUES
(1, 'AbdulMateen Adebiyi', 'adebiyitm@gmail.com', '$2y$10$LPVI1bss0tXB9C9FGng0ROJWWJQmfmZ5ytQozKyHZQAto5mOU9SAa', 0, 0, '2020-12-04 21:06:02'),
(2, 'Admin Admin', 'admin@email.com', '$2y$10$DOCaNqaPG7xExImb0d13ue7U8Z3o7iVGE7VYscs12Ovwf/f84he4.', 1, 0, '2020-12-05 20:57:54');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
