-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2021 at 07:55 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `AdminId` varchar(100) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `AdminId`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'AID001', 'deek', 'deek@gmail.com', 'deek', 'a0a52429adfb2350fe493bee4d5a3e10', '2021-06-20 10:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'NEWA', '2021-06-20 10:33:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `BookCopies` varchar(10) NOT NULL,
  `PublisherName` varchar(60) NOT NULL,
  `Available` varchar(10) NOT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `BookCopies`, `PublisherName`, `Available`, `RegDate`, `UpdationDate`) VALUES
(1, 'C', 1, 1, 1111, 100, '8', 'Publ', 'SELECT', '2021-06-20 10:33:58', '2021-06-23 06:01:34'),
(2, 'C++', 1, 1, 2222, 150, '7', 'NewPublisher', 'YES', '2021-06-23 15:14:10', '2021-06-23 15:55:27'),
(3, 'JS', 1, 1, 3333, 200, '7', 'PublisherNew', 'YES', '2021-06-23 16:54:40', '2021-06-24 06:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Tech', 1, '2021-06-20 10:33:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NOT NULL DEFAULT (current_timestamp() + interval '15' day) ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `EstimatedFine` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`, `EstimatedFine`) VALUES
(1, NULL, 'SID001', '2021-06-20 10:51:24', '2021-07-05 10:51:24', NULL, NULL, 0),
(2, 1, 'SID001', '2021-06-20 10:51:54', '2021-06-20 11:52:03', 1, 0, 0),
(3, 1, 'SID001', '2021-06-20 12:09:29', '2021-06-20 12:10:11', 1, 1, 0),
(4, 1, 'SID001', '2021-06-20 12:14:56', '2021-07-05 12:14:56', NULL, NULL, 0),
(5, 1, 'SID001', '2021-06-20 13:01:02', '2021-07-05 13:01:02', NULL, NULL, 0),
(6, 1, 'SID001', '2021-06-20 13:06:36', '2021-07-05 13:06:36', NULL, NULL, 0),
(7, NULL, 'SID002', '2021-06-23 04:32:04', '2021-07-08 04:32:04', NULL, NULL, 0),
(8, 1, 'SID003', '2021-06-23 04:33:55', '2021-07-08 04:33:55', NULL, NULL, 0),
(9, 1, 'SID002', '2021-06-23 04:36:56', '2021-06-23 04:37:26', 1, 0, 0),
(10, 1, 'SID002', '2021-06-23 04:41:18', '2021-06-23 04:42:12', 1, 0, 0),
(11, 1, 'SID002', '2021-06-23 04:43:42', '2021-06-23 04:44:16', 1, 0, 0),
(12, NULL, 'SID002', '2021-06-23 04:44:27', '2021-07-08 04:44:27', NULL, NULL, 0),
(13, 1, 'SID002', '2021-06-23 04:45:01', '2021-06-23 04:46:02', 1, 0, 0),
(14, 1, 'SID002', '2021-06-23 04:46:14', '2021-06-23 04:46:25', 1, 0, 0),
(15, 1, 'SID003', '2021-06-23 04:53:40', '2021-06-23 05:01:36', 1, 0, 0),
(16, 1, 'SID002', '2021-06-23 04:56:48', '2021-06-23 05:01:30', 1, 0, 0),
(17, 1, 'SID002', '2021-06-23 04:58:01', '2021-06-23 05:01:26', 1, 0, 0),
(18, 1, 'SID002', '2021-06-23 05:01:49', '2021-06-23 05:56:52', 1, 0, 0),
(19, 1, 'SID003', '2021-06-23 05:59:26', '2021-06-23 05:59:35', 1, 0, 0),
(20, 1, 'SID002', '2021-06-23 06:00:35', '2021-06-23 06:00:44', 1, 0, 0),
(21, 1, 'SID002', '2021-06-23 06:01:34', '2021-06-23 06:01:39', 1, 0, 0),
(22, 2, 'SID002', '2021-06-23 15:14:27', '2021-07-08 15:14:27', NULL, NULL, 0),
(23, 2, 'SID003', '2021-06-23 15:54:30', '2021-07-08 15:54:30', NULL, NULL, 0),
(24, 2, 'SID003', '2021-06-23 15:55:27', '2021-07-08 15:55:27', NULL, NULL, 0),
(25, 3, 'SID003', '2021-06-23 15:56:14', '2021-06-23 16:57:13', NULL, NULL, 0),
(26, 3, 'SID003', '2021-06-23 16:54:59', '2021-06-23 18:30:11', 1, 0, 0),
(27, 3, 'SID003', '2021-06-23 18:30:24', '2021-06-24 06:35:22', 1, 0, 0),
(28, 3, 'SID003', '2021-06-24 06:36:07', '2021-06-24 06:37:51', 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID001', 'subhash', 'subhash@gmail.com', '1236547995', '0fd6ca6dd27d00b7bed0cf3e6cba6ce2', 0, '2021-06-20 10:50:58', '2021-06-21 17:50:23'),
(2, 'SID002', 'ashutosh', 'ashutosh@gmail.com', '9874563215', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-06-21 17:48:25', NULL),
(3, 'SID003', 'Ashwin', 'ashwin@gmail.com', '0123644788', '7cb6fa91c124913f7a75e3153339234f', 1, '2021-06-21 17:49:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AdminId` (`AdminId`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
