drop database if exists places;
create database places;
use places;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `places`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ratings`
--

CREATE TABLE `Ratings` (
  `rating_id` integer NOT NULL AUTO_INCREMENT,
  `store_id` integer NOT NULL,
  `overall_rating` float NOT NULL,
  `ft_dist` float,
  `cart_sanitize` float,
  `gm_precautions` float,
  `ess_avail` float,
  `density_control` varchar(5),
  `transport_mode` float,
  `table_sanitize` float,
  `curbside_pickup` varchar(5),
  `seat_sanitize` float,
  `clean_articles` varchar(5),
  `rating_date` timestamp default current_timestamp,
  `rating_comment` varchar(250),
  `user_id` integer,
  primary key(rating_id)
);

--
-- Dumping data for table `Ratings`
--

INSERT INTO `Ratings` (`rating_id`, `store_id`, `overall_rating`, `rating_date`, `rating_comment`, `user_id`) VALUES
(1, 1, 3.9, current_timestamp(), 'Okay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Stores`
--

CREATE TABLE `Stores` (
  `store_id` integer NOT NULL,
  `store_name` varchar(22) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `address` varchar(38) DEFAULT NULL,
  `county` varchar(11) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `open_hours` varchar(13) DEFAULT NULL,
  `No_of_reviews` integer DEFAULT NULL,
  `star_rating` decimal(2,1) DEFAULT NULL,
  `latitude` text,
  `longitude` text,
  `image_src` varchar(34) DEFAULT NULL
);

--
-- Dumping data for table `Stores`
--

INSERT INTO `Stores` (`store_id`, `store_name`, `category`, `address`, `county`, `state`, `open_hours`, `No_of_reviews`, `star_rating`, `latitude`, `longitude`, `image_src`) VALUES
(1, 'Pizza California', 'Restaurants', '1095 E Brokaw Rd, Str 70, North Valley', 'Santa Clara', 'California', '11 AM - 7 PM', 541, '4.0', '', '', '/static/Pizza California.jpg'),
(2, 'Habit Burger', 'Restaurants', '2000, El Camino Real, Suite 19', 'Santa Clara', 'California', '10 AM - 8 PM', 204, '3.5', '37.352129', '-121.95977', '/static/Habit Burger.jpg'),
(3, 'Olive Garden', 'Restaurants', '1350 Greal Mall Dr, Milpitas', 'Santa Clara', 'California', '10 AM - 8 PM', 808, '3.0', '37.412829', '-121.895848', '/static/Olive Garden.jpg'),
(4, 'Venus Cafe', 'Restaurants', '1698 Hostetter Ste K, Bldg A', 'Santa Clara', 'California', '7AM - 4 PM', 411, '3.5', '37.387145', '-121.883553', '/static/Venus Cafe.jpg'),
(5, 'Panera Bread', 'Restaurants', '503, Coleman Avenue, Downtown', 'Santa Clara', 'California', '11 AM - 7 PM', 297, '3.3', '', '', '/static/Panera Bread.jpg'),
(6, 'VN Grill', 'Restaurants', '1085 E BR, Ste 20', 'Santa Clara', 'California', '7AM - 4 PM', 870, '4.7', '', '', '/static/VN Grill.jpg'),
(7, 'Psycho Donuts', 'Restaurants', '2000, El Camino Real, Ste 11', 'Santa Clara', 'California', '7AM - 4 PM', 146, '3.0', '', '', '/static/Psycho Donuts.jpg'),
(8, 'Chipotle Mexican Grill', 'Restaurants', '1751 N 1st, Ste 40,', 'Santa Clara', 'California', '11 AM - 7 PM', 193, '2.4', '', '', '/static/Chipotle Mexican Grill.jpg'),
(9, 'Imagine Beauty Center', 'Hair Salons', '1701 Lundy Avenue, North Valley', 'Santa Clara', 'California', '11 AM - 7 PM', 95, '4.0', '37.387116', '-121.887412', '/static/Imagine Beauty Center.jpg'),
(10, 'Great Clips', 'Hair Salons', '1085 E Brokaw rd, North Valley', 'Santa Clara', 'California', '10 AM - 8 PM', 149, '3.4', '37.383569', '-121.896846', '/static/Great Clips.jpg'),
(11, 'My Stylist Salon', 'Hair Salons', '840 Willow st, Ste a200, Willow Glen', 'Santa Clara', 'California', '10 AM - 8 PM', 887, '5.0', '37.310167', '-121.895624', '/static/My Stylist Salon.jpg'),
(12, 'Ulta Beauty', 'Hair Salons', '1038 E Brokaw rd, Ste 10, North Valley', 'Santa Clara', 'California', '10 AM - 8 PM', 443, '3.0', '', '', '/static/Ulta Beauty.jpg'),
(13, 'New Hair City', 'Hair Salons', '2050 Concourse Dr, North Valley', 'Santa Clara', 'California', '11 AM - 6 PM', 28, '4.5', '', '', '/static/New Hair City.jpg'),
(14, 'Costco Gasoline', 'Gas Stations', '1709 Automation Parkway, NV', 'Santa Clara', 'California', '11 AM - 7 PM', 125, '4.0', '', '', '/static/Costco Gasoline.jpg'),
(15, 'Shell', 'Gas Stations', '1601 N Capitol Avenue', 'Santa Clara', 'California', '11 AM - 7 PM', 71, '3.0', '', '', '/static/Shell.jpg'),
(16, 'Chevron Station', 'Gas Stations', '790 Montague Expressway', 'Santa Clara', 'California', '11 AM - 7 PM', 37, '2.0', '', '', '/static/Chevron Station.jpg'),
(17, '76', 'Gas Stations', '1705 Berryessa Rd', 'Santa Clara', 'California', '11 AM - 7 PM', 21, '2.0', '', '', '/static/76.jpg'),
(18, 'Propel Fuels', 'Gas Stations', '1590 McKee Rd27', 'Santa Clara', 'California', '10 AM - 8 PM', 2, '3.0', '', '', '/static/Propel Fuels.jpg'),
(19, 'Walmart Supercenter', 'Department Stores_Grocery', '301 Ranch drive', 'Santa Clara', 'California', '10 AM - 8 PM', 725, '2.0', '37.431528', '-121.921189', '/static/Walmart Supercenter.jpg'),
(20, 'Target', 'Department Stores_Grocery', '2155 Morrill avenue', 'Santa Clara', 'California', '10 AM - 8 PM', 509, '3.5', '37.41374', '-121.876654', '/static/Target.jpg'),
(21, 'Sprouts Farmers Market', 'Department Stores_Grocery', '1028 E Brokaw Rd', 'Santa Clara', 'California', '10 AM - 8 PM', 182, '3.8', '37.381291', '-121.898162', '/static/Sprouts Farmers Market.jpg'),
(22, 'Safeway', 'Department Stores_Grocery', '555 E Calaveras Blvd', 'Santa Clara', 'California', '11 AM - 7 PM', 298, '2.3', '', '', '/static/Safeway.jpg'),
(23, 'Whole Foods Market', 'Department Stores_Grocery', '777 The Alameda, Downtown', 'Santa Clara', 'California', '11 AM - 7 PM', 444, '4.0', '', '', '/static/Whole Foods Market.jpg'),
(24, 'CVS Pharmacy', 'Pharmacy', '2514 Berryessa Rd, Berryessa', 'Santa Clara', 'California', '9 AM - 9 PM', 3, '2.5', '', '', '/static/CVS Pharmacy.jpg'),
(25, 'Costco Pharmacy', 'Pharmacy', '1709 Automation Parkway', 'Santa Clara', 'California', '9 AM - 9 PM', 5, '3.0', '', '', '/static/Costco Pharmacy.jpg'),
(26, 'CVS Pharmacy', 'Pharmacy', '3081 Stevens Creek Boulevard', 'Santa Clara', 'California', '9 AM - 9 PM', 57, '2.8', '', '', '/static/CVS Pharmacy.jpg'),
(27, 'McKee Medical Pharmacy', 'Pharmacy', '2350 McKee Rd, Ste  A3, North Valley', 'Santa Clara', 'California', '9 AM - 9 PM', 15, '4.0', '', '', '/static/McKee Medical Pharmacy.jpg'),
(28, 'Better Health Pharmacy', 'Pharmacy', '725 E SC street, Ste 202, Downtown', 'Santa Clara', 'California', '9 AM - 9 PM', 11, '5.0', '', '', '/static/Better Health Pharmacy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` integer NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_password` varchar(250) NOT NULL
);

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_email`, `user_password`) VALUES
(1, 'abc@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `store_id_2` (`store_id`);

--
-- Indexes for table `Stores`
--
ALTER TABLE `Stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ratings`
--
ALTER TABLE `Ratings`
  MODIFY `rating_id` integer NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` integer NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Ratings`
--
ALTER TABLE `Ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `Stores` (`store_id`);
COMMIT;

alter table stores
 add `sd_rating` decimal(2,1) DEFAULT NULL;
 
 alter table stores
 add `precaution_rating` decimal(2,1) DEFAULT NULL;
 
 alter table stores
 add `dc_rating` decimal(2,1) DEFAULT NULL;
 
update Stores    set sd_rating = 3.5, precaution_rating = 3.5 where store_id = 20;
update Stores    set sd_rating = 3.5, precaution_rating = 3.5 where store_id = 21;
update Stores     set sd_rating = 2.5, precaution_rating = 2.5 where store_id = 22; 
update Stores     set sd_rating = 3, precaution_rating = 3 where store_id = 24;
update Stores   set sd_rating = 3, precaution_rating = 3 where store_id = 25;
update Stores   set sd_rating = 2.8, precaution_rating = 2.8 where store_id = 26;
update Stores   set sd_rating = 4, precaution_rating = 4 where store_id = 27;
update Stores set sd_rating = 5, precaution_rating = 5 where store_id = 28;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
