-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Oct 03, 2024 at 12:12 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myusers`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `quantity1` int(11) NOT NULL,
  `quantity2` int(11) NOT NULL,
  `quantity3` int(11) NOT NULL,
  `quantity4` int(11) NOT NULL,
  `quantity5` int(11) NOT NULL,
  `quantity6` int(11) NOT NULL,
  PRIMARY KEY (`quantity1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`quantity1`, `quantity2`, `quantity3`, `quantity4`, `quantity5`, `quantity6`) VALUES
(0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart0_`
--

DROP TABLE IF EXISTS `cart0_`;
CREATE TABLE IF NOT EXISTS `cart0_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity4` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `id` varchar(45) NOT NULL,
  `item` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `formID` varchar(50) NOT NULL,
  `cartID` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `item`, `price`, `quantity`, `url`, `formID`, `cartID`) VALUES
('abc', 'CARROTS', 50, 15, 'https://img.freepik.com/free-photo/top-view-carrots_23-2148622433.jpg?t=st=1727520484~exp=1727524084~hmac=99d3cdd7998619', 'modalCart.quantity1', 'quantity1'),
('bcd', 'FRESH BEANS', 20, 14, 'https://img.freepik.com/premium-photo/closeup-fresh-green-vegetable-pea-pods-beans_1139461-5451.jpg?w=740', 'modalCart.quantity2', 'quantity2'),
('def', 'TOMATOES', 500, 19, 'https://img.freepik.com/free-photo/top-view-ripe-fresh-tomatoes-with-water-drops-black-background_141793-3432.jpg?t=st=1', 'modalCart.quantity3', 'quantity3'),
('dos', 'CABBAGES', 1000, 15, 'https://img.freepik.com/premium-photo/cabbage-high-resolution-photography-full-hd-natu_1114068-68502.jpg?w=740', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `phone` int(11) NOT NULL,
  `merchant` tinyint(4) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `firstname`, `lastname`, `email`, `address`, `phone`, `merchant`) VALUES
('merchant', 'merchant', 'Merchant', 'Merchant', 'merchant@merchant.com', 'Merchant LTD', 1234567890, 1),
('user', 'user', 'simon', 'B', 'simonb@gmail.com', 'kampala', 79585418, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
