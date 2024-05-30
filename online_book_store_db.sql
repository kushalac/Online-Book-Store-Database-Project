-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 11:21 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_book_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'kushal', 'kushalshetty2002@gmail.com', '$2y$10$FGlFvsaKs57kmTrdFHnpfe4XsrsMRZga9f1KF8iDcly1Lr0NskY/m'),
(2, 'Hitesh N', 'hiteshnovember@gmail.com', '$2y$10$rcqZFAI2X0F1SB4dFT.hG.0LnMsYEP92wHP1diTIiWtT6qcVh9eZy');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `added_admin` AFTER INSERT ON `admin` FOR EACH ROW BEGIN
INSERT INTO admin_backup VALUES(null,NEW.full_name,NEW.email,NEW.password);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_backup`
--

CREATE TABLE `admin_backup` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_backup`
--

INSERT INTO `admin_backup` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'kushal', 'kushalshetty2002@gmail.com', '$2y$10$FGlFvsaKs57kmTrdFHnpfe4XsrsMRZga9f1KF8iDcly1Lr0NskY/m'),
(2, 'Hitesh N', 'hiteshnovember@gmail.com', '$2y$10$rcqZFAI2X0F1SB4dFT.hG.0LnMsYEP92wHP1diTIiWtT6qcVh9eZy');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(3, 'Navathe'),
(4, 'Ramakrishnan'),
(5, 'Sadhguru'),
(6, 'Carl Sagan'),
(7, 'AL Sweigrat'),
(8, 'Randal K Michael'),
(10, '5th sem');

--
-- Triggers `authors`
--
DELIMITER $$
CREATE TRIGGER `added_author` AFTER INSERT ON `authors` FOR EACH ROW BEGIN
INSERT INTO authors_backup values(null,NEW.name);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `authors_backup`
--

CREATE TABLE `authors_backup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors_backup`
--

INSERT INTO `authors_backup` (`id`, `name`) VALUES
(3, 'Navathe'),
(4, 'Ramakrishnan'),
(5, 'Sadhguru'),
(6, 'Carl Sagan'),
(7, 'AL Sweigrat'),
(8, 'Randal K Michael'),
(10, '5th sem'),
(12, 'Robert');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author_id`, `description`, `category_id`, `cover`, `file`) VALUES
(3, 'Fundamentals of DataBase', 3, 'This book introduces the fundamental concepts  necessary for designing, using, and implementing  database systems and database applications.', 3, '61cd6223e59099.75326708.jpeg', '61cd6223e5b380.97936895.pdf'),
(4, 'Fundamentals of DataBase', 4, 'principles of database systems and emphasizes how they are used in developing data intensive applications', 3, '61cd63262be128.55348934.jpeg', '61cd63262bfee9.37753100.pdf'),
(5, 'SHIVA', 5, 'ultimate outlaw', 4, '61cd63f9625281.09281952.jpeg', '61cd63f962c360.17568486.pdf'),
(6, 'Kozmos', 6, 'Astronomy and Astrophysics', 5, '61cd68b1a1f9f6.25828165.jpeg', '61cd68b1a21889.66774974.pdf'),
(7, 'Automate the boring stuff with python', 7, 'Practical programming for total beginners in python', 6, '61cd66688bbd88.91013643.jpeg', '61cd66688bd871.27484858.pdf'),
(8, 'New Millennium', 10, 'Astronomy and Astrophysics', 9, '61cd68e11a6964.65708461.jpeg', '61cd68e11a8673.53081321.pdf'),
(9, 'Unix Shell Scripting', 8, 'Unix programming basics', 8, '61cd69937e9fb2.55013660.jpeg', '61cd69937ebe70.98979426.pdf'),
(10, 'BookDrive', 10, 'Bookdrive is an online bookstore which allows users to access a lot of books at ease', 9, '61cd6cc7ca1097.10965019.jpeg', '61cd6cc7ca3279.75726780.pdf');

--
-- Triggers `books`
--
DELIMITER $$
CREATE TRIGGER `added_book` AFTER INSERT ON `books` FOR EACH ROW BEGIN 
INSERT into books_backup Values(null,NEW.title,NEW.author_id,NEW.description,NEW.category_id,NEW.cover,NEW.file); end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `books_backup`
--

CREATE TABLE `books_backup` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books_backup`
--

INSERT INTO `books_backup` (`id`, `title`, `author_id`, `description`, `category_id`, `cover`, `file`) VALUES
(3, 'Fundamentals of DataBase', 3, 'This book introduces the fundamental concepts  necessary for designing, using, and implementing  database systems and database applications.', 3, '61cd6223e59099.75326708.jpeg', '61cd6223e5b380.97936895.pdf'),
(4, 'Fundamentals of DataBase', 4, 'principles of database systems and emphasizes how they are used in developing data intensive applications', 3, '61cd63262be128.55348934.jpeg', '61cd63262bfee9.37753100.pdf'),
(5, 'SHIVA', 5, 'ultimate outlaw', 4, '61cd63f9625281.09281952.jpeg', '61cd63f962c360.17568486.pdf'),
(6, 'Kozmos', 6, 'Astronomy and Astrophysics', 5, '61cd68b1a1f9f6.25828165.jpeg', '61cd68b1a21889.66774974.pdf'),
(7, 'Automate the boring stuff with python', 7, 'Practical programming for total beginners in python', 6, '61cd66688bbd88.91013643.jpeg', '61cd66688bd871.27484858.pdf'),
(8, 'New Millennium', 6, 'Astronomy and Astrophysics', 5, '61cd68e11a6964.65708461.jpeg', '61cd68e11a8673.53081321.pdf'),
(9, 'Unix Shell Scripting', 8, 'Unix programming basics', 8, '61cd69937e9fb2.55013660.jpeg', '61cd69937ebe70.98979426.pdf'),
(10, 'BookDrive', 10, 'Bookdrive is an online bookstore which allows users to access a lot of books at ease', 9, '61cd6cc7ca1097.10965019.jpeg', '61cd6cc7ca3279.75726780.pdf'),
(12, 'E-Commerce', 10, 'Furniture Store', 9, '61cd930022c167.79640583.jpeg', '61cd9300234902.56970183.pdf'),
(14, 'Book Drive Report', 10, 'This gives the idea on the project Book Drive', 9, '6241e9208d1793.39791745.jpeg', '6241e9208da5a6.73929834.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(3, 'DBMS'),
(4, 'Motivation'),
(5, 'Astronomy'),
(6, 'Python'),
(8, 'Unix Programming'),
(9, 'Research'),
(10, 'stories');

--
-- Triggers `categories`
--
DELIMITER $$
CREATE TRIGGER `added_category` AFTER INSERT ON `categories` FOR EACH ROW BEGIN
INSERT INTO categories_backup VALUES(null,NEW.name);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories_backup`
--

CREATE TABLE `categories_backup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories_backup`
--

INSERT INTO `categories_backup` (`id`, `name`) VALUES
(3, 'DBMS'),
(4, 'Motivation'),
(5, 'Astronomy'),
(6, 'Python'),
(8, 'Unix Programming'),
(9, 'Research'),
(10, 'stories'),
(14, 'Commerce');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_backup`
--
ALTER TABLE `admin_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors_backup`
--
ALTER TABLE `authors_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books_backup`
--
ALTER TABLE `books_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_backup`
--
ALTER TABLE `categories_backup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_backup`
--
ALTER TABLE `admin_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `authors_backup`
--
ALTER TABLE `authors_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `books_backup`
--
ALTER TABLE `books_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories_backup`
--
ALTER TABLE `categories_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
