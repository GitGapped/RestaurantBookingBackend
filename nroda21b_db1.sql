-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 31, 2025 at 12:11 PM
-- Server version: 11.7.2-MariaDB-ubu2404
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nroda21b_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `last_login_at` datetime DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `token_version` int(11) DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `uuid`, `username`, `email`, `password_hash`, `role`, `email_verified`, `last_login_at`, `refresh_token`, `token_version`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'd707d0ea-124b-4a16-9941-86e6e9f46b5f', 'newuser', 'newuser@example.com', '$2b$12$MQLhSehhqgpxBLudRXNFDuzO/rB9WIJnF8NRxoQuP2EuiSIetWomi', 'user', 1, '2025-04-11 18:05:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZDcwN2QwZWEtMTI0Yi00YTE2LTk5NDEtODZlNmU5ZjQ2YjVmIiwidmVyc2lvbiI6MCwiaWF0IjoxNzQ0Mzk0NzUzLCJleHAiOjE3NDQ5OTk1NTN9.5LIi0lNaTbAuPf3miXd98mxZQHiZ_LiNfdLo9fuvQjU', 0, 1, '2025-04-11 18:03:55', '2025-04-11 18:05:53'),
(4, '6c59d421-50a8-447c-94b0-b652083017c7', 'panosru', 'demo@test.com', '$2b$12$N2HySMERJa8Q84gFOIn6kePJLMItgblfFJXQdvZqWXPmmp0CYh9TG', 'user', 1, '2025-05-07 16:24:06', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNmM1OWQ0MjEtNTBhOC00NDdjLTk0YjAtYjY1MjA4MzAxN2M3IiwidmVyc2lvbiI6MCwiaWF0IjoxNzQ2NjM1MDQ2LCJleHAiOjE3NDcyMzk4NDZ9.b0wJKLbz5Z71A6uhdhtd_7qcCDOYzhBVnT-6YFb5ksk', 0, 1, '2025-05-02 13:04:32', '2025-05-07 16:24:06'),
(5, 'da5753d0-e06b-4ffc-ba14-bf52805364f5', 'demo2', 'demo2@test.com', '$2b$12$7aetrGIH.4BebJl8F4MT1.I1xTJJjGCoN134PL/s5zyAjxx88krvy', 'user', 0, NULL, NULL, 0, 1, '2025-05-02 16:32:02', NULL),
(6, '6fa78f5e-ef33-420d-9129-cdd1e5afb8e9', 'dule', 'dule@gmail.com', '$2b$12$V3DlXtjjhBN1c8Vg.vPjHuOwi7DGVV.o1BKEHVYGlxPZt7y6EXfM2', 'user', 1, '2025-05-30 14:00:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiNmZhNzhmNWUtZWYzMy00MjBkLTkxMjktY2RkMWU1YWZiOGU5IiwidmVyc2lvbiI6MCwiaWF0IjoxNzQ4NjEzNjEzLCJleHAiOjE3NDkyMTg0MTN9.LHRBrk4uLhGgLG1EpNzupTKZW2jhXTxLnXioOfpdWGc', 0, 1, '2025-05-09 17:51:50', '2025-05-30 14:00:14'),
(7, 'c08b7e2c-805f-4d8f-8c66-363de23b9dc3', 'aleks', 'aleks@gmail.com', '$2b$12$1ZeGgBArSxRA4IC3XU1BhOAYlKdbl2d0Lxhyj.aa2PjYS5eQ7Lbli', 'user', 0, NULL, NULL, 0, 1, '2025-05-14 21:39:04', NULL),
(8, '06218ede-ad41-4f64-a04a-7bf9568d1ddf', 'gm', 'gm\"gm.com', '$2b$12$vt4t16Fydd2AsVTNyLKYH.kQWMOpfCpbGU3w5XHbmGrmfexc0Jnu6', 'user', 0, NULL, NULL, 0, 1, '2025-05-27 19:29:27', NULL),
(9, 'cccd9236-1446-458f-b568-74317a63357b', 'alekssssss', 'aleks123@gmail.com', '$2b$12$QgxlSyASMDPy6mAmAF5nI.r1PfUS6M5ER0BM/A8MbMu2k/CObEK3.', 'user', 1, '2025-05-27 21:12:56', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiY2NjZDkyMzYtMTQ0Ni00NThmLWI1NjgtNzQzMTdhNjMzNTdiIiwidmVyc2lvbiI6MCwiaWF0IjoxNzQ4MzgwMzc2LCJleHAiOjE3NDg5ODUxNzZ9.yi4KhlwTo_m_k8WWlKEbUO-woOFvzxUq8q2bD7MoCH8', 0, 1, '2025-05-27 19:39:49', '2025-05-27 21:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `published_year` int(11) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `uuid`, `title`, `author`, `published_year`, `genre`, `created_at`) VALUES
(2, '1782eda3-16f5-11f0-978b-76eaf385044d', 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', '2025-04-11 16:50:36'),
(4, '1782f099-16f5-11f0-978b-76eaf385044d', 'Pride and Prejudice', 'Jane Austen', 1813, 'Romance', '2025-04-11 16:50:36'),
(5, '1782f13a-16f5-11f0-978b-76eaf385044d', 'Moby-Dick', 'Herman Melville', 1851, 'Adventure', '2025-04-11 16:50:36'),
(6, '1782f1d0-16f5-11f0-978b-76eaf385044d', 'War and Peace', 'Leo Tolstoy', 1869, 'Historical', '2025-04-11 16:50:36'),
(7, '1782f25e-16f5-11f0-978b-76eaf385044d', 'Ulysses', 'James Joyce', 1922, 'Modernist', '2025-04-11 16:50:36'),
(8, '1782f366-16f5-11f0-978b-76eaf385044d', 'The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction', '2025-04-11 16:50:36'),
(9, '1782f431-16f5-11f0-978b-76eaf385044d', 'The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', '2025-04-11 16:50:36'),
(10, '1782f52a-16f5-11f0-978b-76eaf385044d', 'Fahrenheit 451', 'Ray Bradbury', 1953, 'Dystopian', '2025-04-11 16:50:36'),
(11, '1782f5b9-16f5-11f0-978b-76eaf385044d', 'Brave New World', 'Aldous Huxley', 1932, 'Dystopian', '2025-04-11 16:50:36'),
(12, '1782f64d-16f5-11f0-978b-76eaf385044d', 'Crime and Punishment', 'Fyodor Dostoevsky', 1866, 'Psychological', '2025-04-11 16:50:36'),
(13, '1782f6e2-16f5-11f0-978b-76eaf385044d', 'Jane Eyre', 'Charlotte Brontë', 1847, 'Gothic', '2025-04-11 16:50:36'),
(14, '1782f773-16f5-11f0-978b-76eaf385044d', 'The Odyssey', 'Homer', -700, 'Epic', '2025-04-11 16:50:36'),
(15, '1782f801-16f5-11f0-978b-76eaf385044d', 'Les Misérables', 'Victor Hugo', 1862, 'Historical', '2025-04-11 16:50:36'),
(16, '1782f88f-16f5-11f0-978b-76eaf385044d', 'The Divine Comedy', 'Dante Alighieri', 1320, 'Epic', '2025-04-11 16:50:36'),
(17, '1782f91f-16f5-11f0-978b-76eaf385044d', 'Hamlet', 'William Shakespeare', 1603, 'Tragedy', '2025-04-11 16:50:36'),
(18, '1782f9ac-16f5-11f0-978b-76eaf385044d', 'The Brothers Karamazov', 'Fyodor Dostoevsky', 1880, 'Philosophical', '2025-04-11 16:50:36'),
(19, '1782fa3a-16f5-11f0-978b-76eaf385044d', 'Anna Karenina', 'Leo Tolstoy', 1878, 'Drama', '2025-04-11 16:50:36'),
(20, '1782facd-16f5-11f0-978b-76eaf385044d', 'The Grapes of Wrath', 'John Steinbeck', 1939, 'Historical', '2025-04-11 16:50:36'),
(21, '1782fb5e-16f5-11f0-978b-76eaf385044d', 'Dracula', 'Bram Stoker', 1897, 'Gothic Horror', '2025-04-11 16:50:36'),
(22, '1782fbee-16f5-11f0-978b-76eaf385044d', 'Wuthering Heights', 'Emily Brontë', 1847, 'Gothic', '2025-04-11 16:50:36'),
(23, '1782fc79-16f5-11f0-978b-76eaf385044d', 'A Tale of Two Cities', 'Charles Dickens', 1859, 'Historical', '2025-04-11 16:50:36'),
(24, '1782fd06-16f5-11f0-978b-76eaf385044d', 'Don Quixote', 'Miguel de Cervantes', 1605, 'Satire', '2025-04-11 16:50:36'),
(25, '1782fd96-16f5-11f0-978b-76eaf385044d', 'The Count of Monte Cristo', 'Alexandre Dumas', 1844, 'Adventure', '2025-04-11 16:50:36'),
(26, '1782fe27-16f5-11f0-978b-76eaf385044d', 'Frankenstein', 'Mary Shelley', 1818, 'Horror', '2025-04-11 16:50:36'),
(27, '1782feb4-16f5-11f0-978b-76eaf385044d', 'The Iliad', 'Homer', -750, 'Epic', '2025-04-11 16:50:36'),
(28, '1782ff3f-16f5-11f0-978b-76eaf385044d', 'Madame Bovary', 'Gustave Flaubert', 1856, 'Realism', '2025-04-11 16:50:36'),
(29, '1782ffd0-16f5-11f0-978b-76eaf385044d', 'The Sun Also Rises', 'Ernest Hemingway', 1926, 'Modernist', '2025-04-11 16:50:36'),
(30, '1783005d-16f5-11f0-978b-76eaf385044d', 'Slaughterhouse-Five', 'Kurt Vonnegut', 1969, 'Sci-Fi', '2025-04-11 16:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `reservations2`
--

CREATE TABLE `reservations2` (
  `reservation_id` int(11) NOT NULL,
  `reservation_uuid` char(36) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `reservation_datetime` datetime NOT NULL,
  `guests` int(11) NOT NULL DEFAULT 1,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations2`
--

INSERT INTO `reservations2` (`reservation_id`, `reservation_uuid`, `user_id`, `restaurant_id`, `reservation_datetime`, `guests`, `status`, `created_at`) VALUES
(13, 'd161749d-16f4-11f0-978b-76eaf385044d', 6, 3, '2025-06-02 18:30:00', 5, 'confirmed', '2025-05-15 22:28:17'),
(14, 'd1609ef8-16f4-11f0-978b-76eaf385044d', 6, 3, '2025-06-01 20:00:00', 3, 'pending', '2025-05-15 22:28:17'),
(18, '897cccb1-6951-4bc5-92a6-b68f1de6f61f', 6, 3, '2025-08-07 01:20:00', 4, 'pending', '2025-05-16 17:24:30'),
(19, 'f75583a4-8ccd-4a65-aedb-b50d131f891a', 6, 10, '2020-05-05 09:00:00', 3, 'pending', '2025-05-27 19:34:48'),
(20, '7db9fcbf-9e67-46f8-8f53-9eef8ed545bc', 6, 3, '2029-05-05 15:00:00', 2, 'pending', '2025-05-27 20:00:30'),
(21, 'f76794f2-86cd-41d7-a4c4-23aa75755384', 6, 8, '2020-03-03 20:00:00', 5, 'pending', '2025-05-27 20:01:53'),
(22, 'b68d5b2a-33d2-4786-8bc7-ca7ee270cfe4', 6, 6, '2020-08-08 19:00:00', 5, 'pending', '2025-05-27 20:04:00'),
(23, '0972a640-6e22-4933-b7d7-486d54aa48c7', 6, 3, '2020-08-03 08:00:00', 9, 'pending', '2025-05-27 20:34:20'),
(24, '444e743d-446c-4e39-aef0-863f78828d55', 6, 4, '2026-06-06 15:00:00', 2, 'pending', '2025-05-27 20:56:43'),
(25, '070567d0-ebe3-4543-b292-5f2eece0cc40', 6, 3, '2025-05-29 12:30:39', 5, 'pending', '2025-05-27 21:25:16'),
(26, '05a11f13-1172-4254-a923-8827143a0d4d', 6, 3, '2025-05-29 14:30:03', 2, 'pending', '2025-05-27 21:28:16'),
(27, '942761e0-6766-455e-8728-e8627370d15b', 6, 3, '2025-05-28 21:44:23', 4, 'pending', '2025-05-28 21:44:45'),
(28, '8ec2011f-ce2f-4ddc-895e-0eed3ec857ce', 6, 3, '2025-05-30 01:20:35', 3, 'pending', '2025-05-29 20:50:52'),
(29, '0bad34e4-b064-4eff-8ea6-50a79839c797', 6, 3, '2025-05-30 20:30:21', 3, 'pending', '2025-05-29 20:54:38'),
(30, '06aa5fb3-795f-4720-b384-3aa087e39dc8', 6, 3, '2025-05-31 01:21:46', 3, 'pending', '2025-05-29 21:08:02'),
(31, 'c6884a63-8530-4b44-8e0b-733b78374f2c', 6, 3, '2025-05-31 15:30:59', 8, 'pending', '2025-05-29 21:23:10'),
(32, '8a7f0271-7929-4a31-a662-69311057e797', 6, 3, '2025-05-31 14:30:25', 3, 'pending', '2025-05-29 21:24:46'),
(33, '4432bbf1-295e-49fb-8b9f-fe60fbedf5c1', 6, 3, '2025-05-31 15:30:03', 5, 'pending', '2025-05-29 21:27:18'),
(34, '6759293d-aa2c-4e9d-a7c2-763c9d1ed774', 6, 3, '2025-06-01 17:30:22', 10, 'pending', '2025-05-29 21:31:42'),
(35, 'd77a21c5-a217-4e3f-b2a0-e3c14efaa089', 6, 4, '2025-05-31 15:30:59', 33, 'pending', '2025-05-30 14:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_uuid` char(36) NOT NULL DEFAULT uuid(),
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurant_id`, `restaurant_uuid`, `name`, `address`, `phone`, `created_at`) VALUES
(3, 'd1609ef8-16f4-11f0-978b-76eaf385044d', 'Sushi World', '99 Ocean Ave', '555-3030', '2025-05-27 20:59:05'),
(4, 'd1609fd1-16f4-11f0-978b-76eaf385044d', 'Burger Barn', '77 Sunset Blvd', '555-4040', '2025-04-11 16:48:38'),
(5, 'd160a11b-16f4-11f0-978b-76eaf385044d', 'El Taco Town', '210 Fiesta Ln', '555-5050', '2025-04-11 16:48:38'),
(6, 'd160a28e-16f4-11f0-978b-76eaf385044d', 'Pasta Paradise', '12 Noodle St', '555-6060', '2025-04-11 16:48:38'),
(8, 'd160a4e8-16f4-11f0-978b-76eaf385044d', 'BBQ Haven', '88 Smoky Way', '555-8080', '2025-04-11 16:48:38'),
(9, 'd160a612-16f4-11f0-978b-76eaf385044d', 'Garden Greens', '102 Healthy Ave', '555-9090', '2025-04-11 16:48:38'),
(10, 'd160a736-16f4-11f0-978b-76eaf385044d', 'Steak & Co.', '350 Rare Dr', '555-1111', '2025-04-11 16:48:38'),
(11, 'd160a86a-16f4-11f0-978b-76eaf385044d', 'Seafood Central', '171 Coastline Pl', '555-2222', '2025-04-11 16:48:38'),
(12, 'd160a98d-16f4-11f0-978b-76eaf385044d', 'Dimsum Delight', '66 Dragon St', '555-3333', '2025-04-11 16:48:38'),
(13, 'd160aab6-16f4-11f0-978b-76eaf385044d', 'Vegan Vibes', '500 Leaf Ln', '555-4444', '2025-04-11 16:48:38'),
(16, 'a094480d-d42d-4783-b489-7a9e279aa89c', 'dulerestaurant', 'address 20-25', '6999999998', '2025-05-25 17:25:19'),
(18, 'c260f1dc-ca08-4a1e-8df0-ce8f4792f96c', 'dule', 'dule street', '44444444444', '2025-05-23 16:49:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `reservations2`
--
ALTER TABLE `reservations2`
  ADD PRIMARY KEY (`reservation_id`),
  ADD UNIQUE KEY `reservation_uuid` (`reservation_uuid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD UNIQUE KEY `restaurant_uuid` (`restaurant_uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `reservations2`
--
ALTER TABLE `reservations2`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations2`
--
ALTER TABLE `reservations2`
  ADD CONSTRAINT `reservations2_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `reservations2_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
