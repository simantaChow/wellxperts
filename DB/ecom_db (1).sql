-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 10:10 AM
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
-- Database: `ecom_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_img` int(11) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Active=1, Inactive=2',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_translations`
--

CREATE TABLE `blog_category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_translations`
--

CREATE TABLE `blog_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'Active=1, Inactive=0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `cost`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Barguna', 1, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(2, 'Barishal', 1, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(3, 'Bhola', 1, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(4, 'Jhalokati', 1, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(5, 'Patuakhali', 1, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(6, 'Pirojpur', 1, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(7, 'Bandarban', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(8, 'Brahmanbaria', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(9, 'Chandpur', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(10, 'Chittagong', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(11, 'Comilla', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(12, 'Cox\'s Bazar', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(13, 'Feni', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(14, 'Khagrachhari', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(15, 'Lakshmipur', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(16, 'Noakhali', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(17, 'Rangamati', 2, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(18, 'Dhaka', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 14:53:23', NULL),
(19, 'Faridpur', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(20, 'Gazipur', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(21, 'Gopalganj', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(22, 'Kishoreganj', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(23, 'Madaripur', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(24, 'Manikganj', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(25, 'Munshiganj', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(26, 'Narayanganj', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(27, 'Narsingdi', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(28, 'Rajbari', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(29, 'Shariatpur', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(30, 'Tangail', 3, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(31, 'Bagerhat', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(32, 'Chuadanga', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(33, 'Jashore', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(34, 'Jhenaidah', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(35, 'Kushtia', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(36, 'Magura', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(37, 'Meherpur', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(38, 'Narail', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(39, 'Satkhira', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(40, 'Jamalpur', 5, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(41, 'Mymensingh', 5, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(42, 'Netrokona', 5, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(43, 'Sherpur', 5, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(44, 'Bogura', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(45, 'Joypurhat', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(46, 'Naogaon', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(47, 'Natore', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(48, 'Chapai Nawabganj', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(49, 'Pabna', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(50, 'Rajshahi', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(51, 'Sirajganj', 6, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(52, 'Dinajpur', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(53, 'Gaibandha', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(54, 'Kurigram', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(55, 'Lalmonirhat', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(56, 'Nilphamari', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(57, 'Panchagarh', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(58, 'Rangpur', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(59, 'Thakurgaon', 7, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(60, 'Habiganj', 8, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(61, 'Moulvibazar', 8, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(62, 'Sunamganj', 8, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(63, 'Sylhet', 8, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL),
(64, 'Khulna', 4, 100.00, 1, '2024-02-17 03:12:06', '2024-02-17 03:12:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'Active=1, Inactive=0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BD', 'Bangladesh', 1, '2024-02-27 06:41:56', '2024-02-27 06:41:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `external_link` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_uploads`
--

INSERT INTO `file_uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `external_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IMG_4143', 'uploads/files/cxTyOgns0R4oFI9cJKGPQhSboz3Wc7BwL4DGcnFG.jpg', 1, 232261, 'jpg', 'image', NULL, '2024-02-20 04:48:38', '2024-02-20 04:48:38', NULL),
(2, '', 'uploads/files/ZNTPNLQZ0qu6VfQm2ZooeaDETtkUd4y565ZJZf0h.jpg', 1, 49019, 'jpg', 'image', NULL, '2024-02-20 06:00:30', '2024-02-20 06:00:30', NULL),
(3, 'IMG_4176', 'uploads/files/VZSganbYgS0Qu2Gf6l3JzbytZnojoXIia3KaTohB.jpg', 1, 59166, 'jpg', 'image', NULL, '2024-02-20 06:00:31', '2024-02-20 06:00:31', NULL),
(4, 'IMG_4184', 'uploads/files/r0cGWpNsuWL0twY6LCZ73UTwQbvY6IbY4Ok5gtnN.jpg', 1, 93033, 'jpg', 'image', NULL, '2024-02-20 06:00:31', '2024-02-20 06:00:31', NULL),
(5, 'IMG_4185', 'uploads/files/gpc1WTcEl1HDIRl0XxHUMIOukiRA9Oxb4jwad66J.jpg', 1, 87802, 'jpg', 'image', NULL, '2024-02-20 06:00:32', '2024-02-20 06:00:32', NULL),
(6, 'IMG_4171', 'uploads/files/FEHquW9kVqVNSvPEjwypXzOCTcvJrfeK9l735Fys.jpg', 1, 167557, 'jpg', 'image', NULL, '2024-02-20 06:00:33', '2024-02-20 06:00:33', NULL),
(7, 'IMG_4187', 'uploads/files/7uVE0rUyCw2OlMV8hHnW3ul9hd6t2mEmjkFocTLV.jpg', 1, 75390, 'jpg', 'image', NULL, '2024-02-20 06:00:33', '2024-02-20 06:00:33', NULL),
(8, 'IMG_4175', 'uploads/files/4edVKS969GYNEuw5j4n208ZgC5kk7PDsCA99igYh.jpg', 1, 207295, 'jpg', 'image', NULL, '2024-02-20 06:00:34', '2024-02-20 06:00:34', NULL),
(9, 'IMG_4193', 'uploads/files/6ZpeYzzm2LIFuPyOm6zwQ4Htbv5bmUa6SjInAIBa.jpg', 1, 73924, 'jpg', 'image', NULL, '2024-02-20 06:00:34', '2024-02-20 06:00:34', NULL),
(10, 'IMG_4191', 'uploads/files/COeyUoDnB29MukFSLmnIF2gtfVSFTXCaCDLGzlQG.jpg', 1, 102138, 'jpg', 'image', NULL, '2024-02-20 06:00:34', '2024-02-20 06:00:34', NULL),
(11, 'IMG_4189', 'uploads/files/APhvc8gZxHyedbRkRkcFhj0WcrBreVD8aPtRHngE.jpg', 1, 108331, 'jpg', 'image', NULL, '2024-02-20 06:00:35', '2024-02-20 06:00:35', NULL),
(12, 'IMG_4198', 'uploads/files/BSVcrijSAqksx3QGQLNinImhx7TzTFtWdp6mHaoS.jpg', 1, 62900, 'jpg', 'image', NULL, '2024-02-20 06:00:35', '2024-02-20 06:00:35', NULL),
(13, 'IMG_4195', 'uploads/files/GmMDmiA2vbrDABvm3NeQCOVJdglRu6f3cVm8eg49.jpg', 1, 108186, 'jpg', 'image', NULL, '2024-02-20 06:00:36', '2024-02-20 06:00:36', NULL),
(14, 'IMG_4204', 'uploads/files/Fm9PsEirYvuYnf39WdNtCtTwjzRVPbZ1KCyKCPwM.jpg', 1, 80117, 'jpg', 'image', NULL, '2024-02-20 06:00:36', '2024-02-20 06:00:36', NULL),
(15, 'IMG_4208', 'uploads/files/7k0XxA0R06SW9V1F5b7nzC2Red0ZXRemTKVup84L.jpg', 1, 120840, 'jpg', 'image', NULL, '2024-02-20 06:00:36', '2024-02-20 06:00:36', NULL),
(16, 'IMG_4206', 'uploads/files/ZYj7AIizORPBZpQzpYVZaM34aXJdjYd6hnK1TAPA.jpg', 1, 145676, 'jpg', 'image', NULL, '2024-02-20 06:00:37', '2024-02-20 06:00:37', NULL),
(17, 'IMG_4211', 'uploads/files/KSovS0cVxari0Bq27dKkIy8UcVaFYCpsQ3Mcirg7.jpg', 1, 131519, 'jpg', 'image', NULL, '2024-02-20 06:00:37', '2024-02-20 06:00:37', NULL),
(18, 'IMG_4215', 'uploads/files/pkTKycQCj4UU5DMgW9cATqiwMHEVwtDKqwfWw5PO.jpg', 1, 107380, 'jpg', 'image', NULL, '2024-02-20 06:00:38', '2024-02-20 06:00:38', NULL),
(19, 'IMG_4212', 'uploads/files/lsDx5HLdH6GsRIAd3IL4QQaz3T22ipMsJLvtqmuq.jpg', 1, 202935, 'jpg', 'image', NULL, '2024-02-20 06:00:38', '2024-02-20 06:00:38', NULL),
(20, 'IMG_4213', 'uploads/files/v8AWONF8n8JXdORpxlA5dBPMse17j4JTvCge15xK.jpg', 1, 194937, 'jpg', 'image', NULL, '2024-02-20 06:00:39', '2024-02-20 06:00:39', NULL),
(21, 'IMG_4216', 'uploads/files/HXr78lgHHkGhJ63y8wkJDlkup7h1u8eGVkosm6KW.jpg', 1, 110587, 'jpg', 'image', NULL, '2024-02-20 06:00:39', '2024-02-20 06:00:39', NULL),
(22, 'IMG_4217', 'uploads/files/XtaTCUXHE86NkhH12lkm3zhUP2Nw7hkTxikvH0Mv.jpg', 1, 178293, 'jpg', 'image', NULL, '2024-02-20 06:00:39', '2024-02-20 06:00:39', NULL),
(23, 'IMG_4219', 'uploads/files/ozXXRfEBpthNnAqRvOBwEsHzaH1iEGkAJuTYTdf6.jpg', 1, 155323, 'jpg', 'image', NULL, '2024-02-20 06:00:40', '2024-02-20 06:00:40', NULL),
(24, 'KP101', 'uploads/files/HOhulIYUPTOe6k5GZJZCsirsKKfaSPRlUocbE3ey.jpg', 1, 196644, 'jpg', 'image', NULL, '2024-02-20 06:00:40', '2024-02-20 06:00:40', NULL),
(25, 'KP101-1', 'uploads/files/dUWegE37dFapZhH92v49ivdjMAhqm47NjgTNZqh8.jpg', 1, 165606, 'jpg', 'image', NULL, '2024-02-20 06:00:40', '2024-02-20 06:00:40', NULL),
(26, 'KP102', 'uploads/files/tEMypStzHaVPCaXzClgABbonBqjM0PKQw1EAUQBZ.jpg', 1, 157498, 'jpg', 'image', NULL, '2024-02-20 06:00:41', '2024-02-20 06:00:41', NULL),
(27, 'KP102-2', 'uploads/files/gOr34WOiJlMQlM6O6UIIW9ROFdXqERfGcBpbyJgq.jpg', 1, 95397, 'jpg', 'image', NULL, '2024-02-20 06:00:41', '2024-02-20 06:00:41', NULL),
(28, 'KP102-1', 'uploads/files/sQn1s8UOUkwYpJt7YL7rBctlMlrVltk3cvl7Gwsf.jpg', 1, 187435, 'jpg', 'image', NULL, '2024-02-20 06:00:42', '2024-02-20 06:00:42', NULL),
(29, 'KP103', 'uploads/files/bPxPI2xpDjs9dv5Curro0TLA68SLSBzmAz79R5p2.jpg', 1, 142612, 'jpg', 'image', NULL, '2024-02-20 06:00:42', '2024-02-20 06:00:42', NULL),
(30, 'KP104-1', 'uploads/files/xtA4qYKHTjyrjlymbwkmN5OqSDbwlTGWCb1Q4BGh.jpg', 1, 134500, 'jpg', 'image', NULL, '2024-02-20 06:00:42', '2024-02-20 06:00:42', NULL),
(32, 'KP105', 'uploads/files/6n0zYTONyHDbvwbfukYGnkLeXvcDfsuNDQX3178C.jpg', 1, 140963, 'jpg', 'image', NULL, '2024-02-20 06:00:43', '2024-02-20 06:00:43', NULL),
(33, 'Untitled-2', 'uploads/files/Pr6QiWOgA4wfS3Zpv1aS04Ij4x9FVNZcSbF7u9BV.jpg', 1, 47799, 'jpg', 'image', NULL, '2024-02-20 06:00:43', '2024-02-20 06:00:43', NULL),
(40, '5', 'uploads/files/ik0LEBhemj3BcA2Fh24A1XaNOZHB0HuAgqsLUePX.jpg', 1, 164148, 'jpeg', 'image', NULL, '2024-02-26 00:56:27', '2024-02-26 00:56:27', NULL),
(41, '6', 'uploads/files/sSEutmrRziTJFt1dLv1oUwZRMvyujrXh06HQNESR.jpg', 1, 56311, 'jpeg', 'image', NULL, '2024-02-26 00:56:27', '2024-02-26 00:56:27', NULL),
(49, 'BRAC Orientation pic', 'uploads/files/H3gU4IfWYGScc5U3Cyk3wYY2lLRnXKbsh48UmXwz.jpg', 1, 320025, 'jpg', 'image', NULL, '2024-02-27 00:15:26', '2024-02-27 00:15:26', NULL),
(50, '1705393911400', 'uploads/files/tAzJcNi4gaf3CN7T8aBnArxVZ8gvB8SzBD7h3h7m.jpg', 1, 59033, 'jpg', 'image', NULL, '2024-02-27 00:28:00', '2024-02-27 00:28:00', NULL),
(51, 'Anis Gulshan', 'uploads/files/psni6zWe5LeJLYKb37imnW7nLkuVkx4wMhDByj4g.jpg', 1, 91382, 'jpg', 'image', NULL, '2024-02-27 00:28:36', '2024-02-27 00:28:36', NULL),
(52, 'Official', 'uploads/files/aHyXVBcCTx4Hjr7awVPark3Y5QRg3jF9324V2msd.jpg', 1, 67742, 'jpg', 'image', NULL, '2024-02-27 00:29:14', '2024-02-27 00:29:14', NULL),
(53, 'payoneer', 'uploads/files/fpMrR1X66yrHlfEdxGpALbZtV4921pGt2O429MuX.png', 1, 27279, 'png', 'image', NULL, '2024-02-27 00:29:23', '2024-02-27 00:29:23', NULL),
(54, 'onlineshop', 'uploads/files/CKc94Dz0Xt4LqwjREnBuMbTMVJdbnSLZWYq3nqUN.jpg', 1, 20828, 'jpg', 'image', NULL, '2024-02-27 00:32:33', '2024-02-27 00:32:33', NULL),
(55, 'ecomm', 'uploads/files/bx90Mtbe8uq6xRNniaOsQWEmHeF0HL9lP9D0LLxW.png', 1, 128825, 'png', 'image', NULL, '2024-02-27 00:32:41', '2024-02-27 00:32:41', NULL),
(56, 'WhatsApp Image 2024-02-20 at 10.16.10 PM', 'uploads/files/7JHVkGZ3u8PTTovNjODfdSPYLMHnILJgyKQI9fD6.jpg', 1, 96157, 'jpg', 'image', NULL, '2024-02-27 00:53:25', '2024-02-27 00:53:25', NULL),
(57, 'download (4)', 'uploads/files/wY9dZERxmNIpIunWQBEp32Ug0fmueV95iHMBwxZM.png', 1, 9245, 'png', 'image', NULL, '2024-02-27 02:00:37', '2024-02-27 02:00:37', NULL),
(58, 'online-1617947180', 'uploads/files/dWgYYV6BJniIbEi3QAOm0BOaDpZ8mU33aeJUu7Vz.jpg', 1, 44372, 'jpg', 'image', NULL, '2024-02-27 06:38:10', '2024-02-27 06:38:10', NULL),
(59, '9899c798-3cf6-4443-964e-9b5d68214f9a', 'uploads/files/GRLjpSe6VZU2iQKBwZilotXiyafS32DknrmSZlwR.jpg', 1, 71307, 'jpg', 'image', NULL, '2024-03-02 03:25:55', '2024-03-02 03:25:55', NULL),
(60, 'online-shopping', 'uploads/files/oIdsPcjfm1ZWMAWkCbRN3JxOGeql6nu8pT6sRxY6.jpg', 1, 132848, 'jpg', 'image', NULL, '2024-03-02 03:28:18', '2024-03-02 03:28:18', NULL),
(62, 'Untitled-231', 'uploads/files/sXSmkGq7dlfJIJt2fRBvYi4bbGnn5sU3vHaAjFyf.jpg', 1, 52039, 'jpg', 'image', NULL, '2024-03-03 23:07:44', '2024-03-03 23:07:44', NULL),
(63, '250', 'uploads/files/Fsh2KjsCY5DQy4OAEfLJhVYbjWHQrUqktG7wmPDx.jpg', 1, 146759, 'jpg', 'image', NULL, '2024-03-14 02:34:10', '2024-03-14 02:34:10', NULL),
(64, '180', 'uploads/files/lNQfkopLdZFalZGxXAnTI0geGFBJDWy3fJCfBmGJ.jpg', 1, 181789, 'jpg', 'image', NULL, '2024-03-14 02:35:27', '2024-03-14 02:35:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rtl` int(11) NOT NULL DEFAULT 0 COMMENT 'Yes=1, No=0',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Active=1, Inactive=0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', 0, 1, '2024-03-04 02:49:22', '2024-03-05 22:29:42', NULL),
(5, 'Bangla', 'bd', 0, 1, '2024-03-04 21:37:36', '2024-03-05 22:31:08', NULL),
(6, 'Arabic', 'sa', 1, 1, '2024-03-04 21:37:50', '2024-03-05 22:31:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_01_12_095316_create_countries_table', 1),
(2, '2014_01_12_101700_create_states_table', 1),
(3, '2014_01_12_101712_create_cities_table', 1),
(4, '2014_01_12_102129_create_country_translations_table', 1),
(5, '2014_01_12_102140_create_state_translations_table', 1),
(6, '2014_01_12_102151_create_city_translations_table', 1),
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2024_01_23_070530_create_permission_tables', 1),
(13, '2024_01_23_070922_create_blog_categories_table', 1),
(14, '2024_01_23_070923_create_blog_category_translations_table', 1),
(15, '2024_01_23_070925_create_blogs_table', 1),
(16, '2024_01_24_104642_create_blog_translations_table', 1),
(17, '2024_02_07_121204_create_file_uploads_table', 2),
(18, '2024_02_09_124952_create_translations_table', 3),
(19, '2024_03_02_102439_create_languages_table', 4),
(20, '2024_03_04_112108_create_settings_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `type`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'staff_list', 'staffs', 'web', '2024-01-31 06:36:09', '2024-01-31 06:36:09'),
(2, 'staff_create', 'staffs', 'web', '2024-01-31 06:36:09', '2024-01-31 06:36:09'),
(3, 'staff_edit', 'staffs', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(4, 'staff_delete', 'staffs', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(5, 'role_list', 'role_permissions', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(6, 'role_create', 'role_permissions', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(7, 'role_edit', 'role_permissions', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(8, 'role_delete', 'role_permissions', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(9, 'blog_category_list', 'blog_category', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(10, 'blog_category_create', 'blog_category', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(11, 'blog_category_edit', 'blog_category', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(12, 'blog_category_delete', 'blog_category', 'web', '2024-01-31 06:36:10', '2024-01-31 06:36:10'),
(13, 'blog_list', 'blog', 'web', '2024-01-31 06:36:11', '2024-01-31 06:36:11'),
(14, 'blog_create', 'blog', 'web', '2024-01-31 06:36:11', '2024-01-31 06:36:11'),
(15, 'blog_edit', 'blog', 'web', '2024-01-31 06:36:11', '2024-01-31 06:36:11'),
(16, 'blog_delete', 'blog', 'web', '2024-01-31 06:36:11', '2024-01-31 06:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Manager', 'web', '2024-02-07 05:26:17', '2024-02-07 05:26:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(9, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'default_language', 'en', '2024-03-04 11:24:27', '2024-03-05 05:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'Active=1, Inactive=0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Barisal Division', 1, 1, NULL, NULL, NULL),
(2, 'Chittagong Division', 1, 1, NULL, NULL, NULL),
(3, 'Dhaka Division', 1, 1, NULL, NULL, NULL),
(4, 'Khulna Division', 1, 1, NULL, NULL, NULL),
(5, 'Mymensingh Division', 1, 1, NULL, NULL, NULL),
(6, 'Rajshahi Division', 1, 1, NULL, NULL, NULL),
(7, 'Rangpur Division', 1, 1, NULL, NULL, NULL),
(8, 'Sylhet Division', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `state_translations`
--

CREATE TABLE `state_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `lang_key` text DEFAULT NULL,
  `lang_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1, 'en', 'file_name', 'File Name', '2024-02-09 06:57:14', '2024-02-09 06:57:14'),
(2, 'en', 'file_type', 'File Type', '2024-02-09 06:57:14', '2024-02-09 06:57:14'),
(3, 'en', 'file_size', 'File Size', '2024-02-09 06:57:14', '2024-02-09 06:57:14'),
(4, 'en', 'uploaded_by', 'Uploaded By', '2024-02-09 06:57:14', '2024-02-09 06:57:14'),
(5, 'en', 'uploaded_at', 'Uploaded At', '2024-02-09 06:57:14', '2024-02-09 06:57:14'),
(6, 'en', 'download', 'Download', '2024-02-09 06:57:14', '2024-02-09 06:57:14'),
(7, 'en', 'file_info', 'File Info', '2024-02-09 07:14:26', '2024-02-09 07:14:26'),
(8, 'en', 'close', 'Close', '2024-02-09 07:14:26', '2024-02-09 07:14:26'),
(9, 'en', 'file_original_name', 'File Original Name', '2024-02-09 07:19:24', '2024-02-09 07:19:24'),
(10, 'en', 'delete_confirmation', 'Delete Confirmation', '2024-02-09 07:51:28', '2024-02-09 07:51:28'),
(11, 'en', 'are_you_sure_to_delete_those_files', 'Are you sure to delete those files?', '2024-02-09 07:51:28', '2024-02-09 07:51:28'),
(12, 'en', 'cancel', 'Cancel', '2024-02-09 07:51:28', '2024-02-09 07:51:28'),
(13, 'en', 'delete', 'Delete', '2024-02-09 07:51:28', '2024-02-09 07:51:28'),
(14, 'en', 'success', 'Success', '2024-02-10 21:54:50', '2024-02-10 21:54:50'),
(15, 'en', 'link_copied_to_clipboard', 'Link copied to clipboard', '2024-02-10 21:54:50', '2024-02-10 21:54:50'),
(16, 'en', 'error', 'Error', '2024-02-10 21:54:51', '2024-02-10 21:54:51'),
(17, 'en', 'oops_unable_to_copy', 'Oops, unable to copy', '2024-02-10 21:54:51', '2024-02-10 21:54:51'),
(18, 'en', 'are_you_sure_to_delete_this_file', 'Are you sure to delete this file?', '2024-02-11 01:38:45', '2024-02-11 01:38:45'),
(19, 'en', 'are_you_sure_to_delete_this', 'Are you sure to delete this?', '2024-02-11 01:45:47', '2024-02-11 01:45:47'),
(20, 'en', 'files_deleted_successfully', 'Files deleted successfully', '2024-02-12 01:55:31', '2024-02-12 01:55:31'),
(21, 'en', 'oops_unable_to_delete', 'Oops, unable to delete', '2024-02-12 01:55:32', '2024-02-12 01:55:32'),
(22, 'en', 'showing', 'Showing', '2024-02-12 04:13:40', '2024-02-12 04:13:40'),
(23, 'en', 'to', 'to', '2024-02-12 04:13:40', '2024-02-12 04:13:40'),
(24, 'en', 'of', 'of', '2024-02-12 04:13:40', '2024-02-12 04:13:40'),
(25, 'en', 'entries', 'entries', '2024-02-12 04:13:40', '2024-02-12 04:13:40'),
(26, 'en', 'upload_new_file', 'Upload New File', '2024-02-12 04:20:20', '2024-02-12 04:20:20'),
(27, 'en', 'uploaded_files', 'Uploaded Files', '2024-02-12 04:56:34', '2024-02-12 04:56:34'),
(28, 'en', 'all_files', 'All files', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(29, 'en', 'delete_selected', 'Delete Selected', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(30, 'en', 'sort_by_newest', 'Sort by newest', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(31, 'en', 'sort_by_oldest', 'Sort by oldest', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(32, 'en', 'sort_by_smallest', 'Sort by smallest', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(33, 'en', 'sort_by_largest', 'Sort by largest', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(34, 'en', 'search_your_file', 'Search Your File', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(35, 'en', 'search', 'Search', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(36, 'en', 'select_all', 'Select All', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(37, 'en', 'copy_link', 'Copy Link', '2024-02-12 04:56:35', '2024-02-12 04:56:35'),
(38, 'en', 'thumbnail_image', 'Thumbnail Image', '2024-02-12 06:54:03', '2024-02-12 06:54:03'),
(39, 'en', 'browse', 'Browse', '2024-02-12 06:54:04', '2024-02-12 06:54:04'),
(40, 'en', 'choose_file', 'Choose File', '2024-02-12 06:54:04', '2024-02-12 06:54:04'),
(41, 'en', 'this_image_is_visible_in_all_product_box_use_300x300_sizes_image_keep_some_blank_space_around_main_object_of_your_image_as_we_had_to_crop_some_edge_in_different_devices_to_make_it_responsive', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', '2024-02-12 06:54:04', '2024-02-12 06:54:04'),
(42, 'en', 'nothing_selected', 'Nothing selected', '2024-02-13 01:26:01', '2024-02-13 01:26:01'),
(43, 'en', 'nothing_found', 'Nothing found', '2024-02-13 01:26:01', '2024-02-13 01:26:01'),
(44, 'en', 'file_selected', 'File selected', '2024-02-13 01:26:01', '2024-02-13 01:26:01'),
(45, 'en', 'files_selected', 'Files selected', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(46, 'en', 'add_more_files', 'Add more files', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(47, 'en', 'adding_more_files', 'Adding more files', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(48, 'en', 'drop_files_here_paste_or', 'Drop files here, paste or', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(49, 'en', 'upload_complete', 'Upload complete', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(50, 'en', 'upload_paused', 'Upload paused', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(51, 'en', 'resume_upload', 'Resume upload', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(52, 'en', 'pause_upload', 'Pause upload', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(53, 'en', 'retry_upload', 'Retry upload', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(54, 'en', 'cancel_upload', 'Cancel upload', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(55, 'en', 'uploading', 'Uploading', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(56, 'en', 'processing', 'Processing', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(57, 'en', 'complete', 'Complete', '2024-02-13 01:26:02', '2024-02-13 01:26:02'),
(58, 'en', 'file', 'File', '2024-02-13 01:26:03', '2024-02-13 01:26:03'),
(59, 'en', 'files', 'Files', '2024-02-13 01:26:03', '2024-02-13 01:26:03'),
(60, 'en', 'select_file', 'Select File', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(61, 'en', 'upload_new', 'Upload New', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(62, 'en', 'selected_only', 'Selected Only', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(63, 'en', 'search_your_files', 'Search your files', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(64, 'en', 'no_files_found', 'No files found', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(65, 'en', '0_file_selected', '0 File selected', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(66, 'en', 'clear', 'Clear', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(67, 'en', 'prev', 'Prev', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(68, 'en', 'next', 'Next', '2024-02-13 01:27:26', '2024-02-13 01:27:26'),
(69, 'en', 'add_files', 'Add Files', '2024-02-13 01:27:27', '2024-02-13 01:27:27'),
(70, 'en', 'photo', 'Photo', '2024-02-26 01:26:01', '2024-02-26 01:26:01'),
(71, 'en', 'add_new', 'Add New', '2024-02-26 02:26:08', '2024-02-26 02:26:08'),
(72, 'en', 'back', 'Back', '2024-02-27 01:12:24', '2024-02-27 01:12:24'),
(73, 'en', 'dashboard', 'Dashboard', '2024-02-27 02:04:19', '2024-02-27 02:04:19'),
(74, 'en', 'blogs', 'Blogs', '2024-02-27 02:04:19', '2024-02-27 02:04:19'),
(75, 'en', 'blog_list', 'Blog List', '2024-02-27 02:04:19', '2024-02-27 02:04:19'),
(76, 'en', 'category', 'Category', '2024-02-27 02:04:19', '2024-02-27 02:04:19'),
(77, 'en', 'staffs', 'Staffs', '2024-02-27 02:04:19', '2024-02-27 02:04:19'),
(78, 'en', 'staff_list', 'Staff List', '2024-02-27 02:04:20', '2024-02-27 02:04:20'),
(79, 'en', 'role_permission', 'Role Permission', '2024-02-27 02:04:20', '2024-02-27 02:04:20'),
(80, 'en', 'name', 'Name', '2024-02-27 03:12:11', '2024-02-27 03:12:11'),
(81, 'en', 'enter_your_name', 'Enter Your Name', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(82, 'en', 'phone', 'Phone', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(83, 'en', 'enter_your_phone', 'Enter Your Phone', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(84, 'en', 'country', 'Country', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(85, 'en', 'select_country', 'Select Country', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(86, 'en', 'city', 'City', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(87, 'en', 'choose', 'Choose', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(88, 'en', 'password', 'Password', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(89, 'en', 'enter_your_password', 'Enter Your Password', '2024-02-27 03:12:12', '2024-02-27 03:12:12'),
(90, 'en', 'email', 'Email', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(91, 'en', 'enter_your_email', 'Enter Your Email', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(92, 'en', 'address', 'Address', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(93, 'en', 'enter_your_address', 'Enter Your Address', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(94, 'en', 'state', 'State', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(95, 'en', 'postal_code', 'Postal Code', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(96, 'en', 'enter_your_postal_code', 'Enter Your Postal Code', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(97, 'en', 'confirm_password', 'Confirm Password', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(98, 'en', 'enter_confirm_password', 'Enter confirm password', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(99, 'en', 'roles', 'Roles', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(100, 'en', 'submit', 'Submit', '2024-02-27 03:12:13', '2024-02-27 03:12:13'),
(101, 'en', 'full_name', 'Full Name', '2024-02-27 03:17:20', '2024-02-27 03:17:20'),
(102, 'en', 'enter_full_name', 'Enter Full Name', '2024-02-27 03:17:20', '2024-02-27 03:17:20'),
(103, 'en', '1_file_selected', '1 File selected', '2024-02-27 05:57:59', '2024-02-27 05:57:59'),
(104, 'en', 'home', 'Home', '2024-02-27 06:21:34', '2024-02-27 06:21:34'),
(105, 'en', 'trash', 'Trash', '2024-02-28 00:26:44', '2024-02-28 00:26:44'),
(106, 'en', 'all_staffs', 'All Staffs', '2024-02-28 00:42:50', '2024-02-28 00:42:50'),
(107, 'en', 'trash_all_staffs', 'Trash All Staffs', '2024-02-28 00:45:41', '2024-02-28 00:45:41'),
(108, 'en', 'trash_confirmation', 'Trash Confirmation', '2024-02-28 01:04:19', '2024-02-28 01:04:19'),
(109, 'en', 'are_you_sure_to_trash_this', 'Are you sure to trash this?', '2024-02-28 01:04:19', '2024-02-28 01:04:19'),
(110, 'en', 'restore_confirmation', 'Restore Confirmation', '2024-02-28 01:04:19', '2024-02-28 01:04:19'),
(111, 'en', 'are_you_sure_to_restore_this', 'Are you sure to restore this?', '2024-02-28 01:04:20', '2024-02-28 01:04:20'),
(113, 'en', 'edit_staff', 'Edit Staff', '2024-02-28 03:44:34', '2024-02-28 03:44:34'),
(114, 'en', 'restore', 'Restore', '2024-02-28 03:44:34', '2024-02-28 03:44:34'),
(115, 'en', 'staff_status_changed_successfully', 'Staff status changed successfully', '2024-02-28 07:42:34', '2024-02-28 07:42:34'),
(116, 'en', 'staff_move_to_trash_successfully', 'Staff move to trash successfully', '2024-02-28 07:59:49', '2024-02-28 07:59:49'),
(117, 'en', 'staff_restored_successfully', 'Staff restored successfully', '2024-02-28 08:00:33', '2024-02-28 08:00:33'),
(118, 'en', 'create_staff', 'Create Staff', '2024-03-02 03:23:46', '2024-03-02 03:23:46'),
(119, 'en', 'settings', 'Settings', '2024-03-02 04:39:16', '2024-03-02 04:39:16'),
(120, 'en', 'frontend_settings', 'Frontend Settings', '2024-03-02 04:39:16', '2024-03-02 04:39:16'),
(121, 'en', 'backend_settings', 'Backend Settings', '2024-03-02 04:39:16', '2024-03-02 04:39:16'),
(122, 'en', 'languages', 'Languages', '2024-03-02 04:41:00', '2024-03-02 04:41:00'),
(123, 'en', 'all_languages', 'All Languages', '2024-03-02 04:41:46', '2024-03-02 04:41:46'),
(124, 'en', 'add_language', 'Add Language', '2024-03-02 05:14:49', '2024-03-02 05:14:49'),
(125, 'en', 'staff_created_successfully', 'Staff created successfully', '2024-03-03 23:09:05', '2024-03-03 23:09:05'),
(126, 'en', 'staff_updated_successfully', 'Staff updated successfully', '2024-03-03 23:09:29', '2024-03-03 23:09:29'),
(127, 'en', 'enter_name', 'Enter Name', '2024-03-04 02:41:00', '2024-03-04 02:41:00'),
(128, 'en', 'code', 'Code', '2024-03-04 02:41:00', '2024-03-04 02:41:00'),
(129, 'en', 'select_code', 'Select Code', '2024-03-04 02:45:51', '2024-03-04 02:45:51'),
(130, 'en', 'language_created_successfully', 'Language created successfully', '2024-03-04 02:49:22', '2024-03-04 02:49:22'),
(131, 'en', 'language_rtl_changed_successfully', 'Language RTL changed successfully', '2024-03-04 05:17:22', '2024-03-04 05:17:22'),
(132, 'en', 'language_default_changed_successfully', 'Language default changed successfully', '2024-03-04 05:38:54', '2024-03-04 05:38:54'),
(133, 'en', 'language_move_to_trash_successfully', 'Language move to trash successfully', '2024-03-04 05:51:53', '2024-03-04 05:51:53'),
(134, 'en', 'trash_all_languages', 'Trash All Languages', '2024-03-04 05:54:52', '2024-03-04 05:54:52'),
(135, 'en', 'language_restored_successfully', 'Language restored successfully', '2024-03-04 05:59:05', '2024-03-04 05:59:05'),
(136, 'en', 'language_deleted_successfully', 'Language deleted successfully', '2024-03-04 06:19:51', '2024-03-04 06:19:51'),
(137, 'en', 'edit_language', 'Edit Language', '2024-03-04 06:24:02', '2024-03-04 06:24:02'),
(138, 'en', 'language_updated_successfully', 'Language updated successfully', '2024-03-04 21:36:23', '2024-03-04 21:36:23'),
(139, 'en', 'translation', 'Translation', '2024-03-04 21:58:31', '2024-03-04 21:58:31'),
(140, 'en', 'key', 'Key', '2024-03-04 22:04:23', '2024-03-04 22:04:23'),
(141, 'en', 'value', 'Value', '2024-03-04 22:04:23', '2024-03-04 22:04:23'),
(142, 'sa', '0_file_selected', '0 الملف المحدد', '2024-03-04 22:49:51', '2024-03-04 22:49:51'),
(143, 'sa', '1_file_selected', 'تم تحديد ملف واحد', '2024-03-04 22:49:51', '2024-03-04 22:49:51'),
(144, 'sa', 'add_files', 'إضافة ملفات', '2024-03-04 22:49:51', '2024-03-04 22:49:51'),
(145, 'sa', 'add_language', 'إضافة لغة', '2024-03-04 22:49:51', '2024-03-04 22:49:51'),
(146, 'sa', 'add_more_files', 'إضافة المزيد من الملفات', '2024-03-04 22:49:51', '2024-03-04 22:49:51'),
(147, 'sa', 'add_new', 'اضف جديد', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(148, 'sa', 'adding_more_files', 'إضافة المزيد من الملفات', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(149, 'sa', 'address', 'عنوان', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(150, 'sa', 'all_files', 'كل الملفات', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(151, 'sa', 'all_languages', 'كل اللغات', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(152, 'sa', 'all_staffs', 'جميع الموظفين', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(153, 'sa', 'are_you_sure_to_delete_this', 'هل أنت متأكد من حذف هذا؟', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(154, 'sa', 'are_you_sure_to_delete_this_file', 'هل أنت متأكد من حذف هذا الملف؟', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(155, 'sa', 'are_you_sure_to_delete_those_files', 'هل أنت متأكد من حذف تلك الملفات؟', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(156, 'sa', 'are_you_sure_to_restore_this', 'هل أنت متأكد من استعادة هذا؟', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(157, 'sa', 'are_you_sure_to_trash_this', 'هل أنت متأكد من سلة المهملات هذا؟', '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(158, 'sa', 'back', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(159, 'sa', 'backend_settings', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(160, 'sa', 'blog_list', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(161, 'sa', 'blogs', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(162, 'sa', 'browse', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(163, 'sa', 'cancel', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(164, 'sa', 'cancel_upload', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(165, 'sa', 'category', NULL, '2024-03-04 22:49:52', '2024-03-04 22:49:52'),
(166, 'sa', 'choose', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(167, 'sa', 'choose_file', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(168, 'sa', 'city', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(169, 'sa', 'clear', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(170, 'sa', 'close', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(171, 'sa', 'code', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(172, 'sa', 'complete', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(173, 'sa', 'confirm_password', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(174, 'sa', 'copy_link', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(175, 'sa', 'country', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(176, 'sa', 'create_staff', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(177, 'sa', 'dashboard', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(178, 'sa', 'delete', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(179, 'sa', 'delete_confirmation', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(180, 'sa', 'delete_selected', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(181, 'sa', 'download', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(182, 'sa', 'drop_files_here_paste_or', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(183, 'sa', 'edit_language', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(184, 'sa', 'edit_staff', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(185, 'sa', 'email', NULL, '2024-03-04 22:49:53', '2024-03-04 22:49:53'),
(186, 'sa', 'enter_confirm_password', NULL, '2024-03-04 22:49:54', '2024-03-04 22:49:54'),
(187, 'sa', 'enter_full_name', NULL, '2024-03-04 22:49:54', '2024-03-04 22:49:54'),
(188, 'sa', 'enter_name', NULL, '2024-03-04 22:49:54', '2024-03-04 22:49:54'),
(189, 'sa', 'enter_your_address', NULL, '2024-03-04 22:49:54', '2024-03-04 22:49:54'),
(190, 'sa', 'enter_your_email', NULL, '2024-03-04 22:49:54', '2024-03-04 22:49:54'),
(191, 'sa', 'enter_your_name', NULL, '2024-03-04 22:49:54', '2024-03-04 22:49:54'),
(192, 'en', 'translations_updated_for_', 'Translations updated for ', '2024-03-04 22:50:28', '2024-03-04 22:50:28'),
(193, 'sa', 'select_all', 'اختر الكل', '2024-03-04 22:53:21', '2024-03-04 22:53:21'),
(194, 'bd', '0_file_selected', NULL, '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(195, 'bd', '1_file_selected', NULL, '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(196, 'bd', 'add_files', NULL, '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(197, 'bd', 'add_language', 'ভাষা যোগ করুন', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(198, 'bd', 'add_more_files', 'আরো ফাইল যোগ করুন', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(199, 'bd', 'add_new', 'নতুন যোগ করুন', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(200, 'bd', 'adding_more_files', 'আরো ফাইল যোগ করা হচ্ছে', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(201, 'bd', 'address', 'ঠিকানা', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(202, 'bd', 'all_files', 'সকল ফাইল', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(203, 'bd', 'all_languages', 'সকল ভাষা', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(204, 'bd', 'all_staffs', 'সকল স্টাফ', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(205, 'bd', 'are_you_sure_to_delete_this', 'আপনি কি এটি মুছে ফেলার ব্যাপারে নিশ্চিত?', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(206, 'bd', 'are_you_sure_to_delete_this_file', 'আপনি কি এই ফাইলটি মুছে ফেলার ব্যাপারে নিশ্চিত?', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(207, 'bd', 'are_you_sure_to_delete_those_files', 'আপনি কি সেই ফাইলগুলি মুছে ফেলার বিষয়ে নিশ্চিত?', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(208, 'bd', 'are_you_sure_to_restore_this', 'আপনি কি এটি পুনরুদ্ধার করতে নিশ্চিত?', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(209, 'bd', 'are_you_sure_to_trash_this', 'আপনি এই ট্র্যাশ নিশ্চিত?', '2024-03-04 22:57:05', '2024-03-04 22:57:05'),
(210, 'bd', 'back', 'পেছনে', '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(211, 'bd', 'backend_settings', 'ব্যাকএন্ড সেটিংস', '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(212, 'bd', 'blog_list', 'ব্লগ তালিকা', '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(213, 'bd', 'blogs', 'ব্লগ', '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(214, 'bd', 'browse', 'ব্রাউজ করুন', '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(215, 'bd', 'cancel', 'বাতিল করুন', '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(216, 'bd', 'cancel_upload', NULL, '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(217, 'bd', 'category', NULL, '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(218, 'bd', 'choose', NULL, '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(219, 'bd', 'choose_file', NULL, '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(220, 'bd', 'city', NULL, '2024-03-04 22:57:06', '2024-03-04 22:57:06'),
(221, 'bd', 'clear', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(222, 'bd', 'close', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(223, 'bd', 'code', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(224, 'bd', 'complete', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(225, 'bd', 'confirm_password', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(226, 'bd', 'copy_link', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(227, 'bd', 'country', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(228, 'bd', 'create_staff', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(229, 'bd', 'dashboard', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(230, 'bd', 'delete', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(231, 'bd', 'delete_confirmation', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(232, 'bd', 'delete_selected', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(233, 'bd', 'download', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(234, 'bd', 'drop_files_here_paste_or', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(235, 'bd', 'edit_language', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(236, 'bd', 'edit_staff', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(237, 'bd', 'email', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(238, 'bd', 'enter_confirm_password', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(239, 'bd', 'enter_full_name', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(240, 'bd', 'enter_name', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(241, 'bd', 'enter_your_address', NULL, '2024-03-04 22:57:07', '2024-03-04 22:57:07'),
(242, 'bd', 'enter_your_email', NULL, '2024-03-04 22:57:08', '2024-03-04 22:57:08'),
(243, 'bd', 'enter_your_name', NULL, '2024-03-04 22:57:08', '2024-03-04 22:57:08'),
(244, 'en', 'language_changed_to_', 'Language changed to ', '2024-03-05 00:23:56', '2024-03-05 00:23:56'),
(245, 'en', 'language_not_change_please_try_again', 'Language Not change. please try again', '2024-03-05 00:24:51', '2024-03-05 00:24:51'),
(246, 'en', 'select_option', 'Select Option', '2024-03-05 22:12:50', '2024-03-05 22:12:50'),
(247, 'en', 'language_changed_to', 'Language changed to', '2024-03-05 22:25:10', '2024-03-05 22:25:10'),
(248, 'en', 'image', 'Image', '2024-03-05 22:29:08', '2024-03-05 22:29:08'),
(249, 'en', 'role', 'Role', '2024-03-05 22:29:08', '2024-03-05 22:29:08'),
(250, 'en', 'status', 'Status', '2024-03-05 22:29:08', '2024-03-05 22:29:08'),
(251, 'en', 'action', 'Action', '2024-03-05 22:29:08', '2024-03-05 22:29:08'),
(252, 'en', 'default', 'Default', '2024-03-05 22:29:17', '2024-03-05 22:29:17'),
(253, 'en', 'rtl', 'RTL', '2024-03-05 22:29:17', '2024-03-05 22:29:17'),
(254, 'en', 'data_not_found', 'Data Not Found', '2024-03-05 22:31:09', '2024-03-05 22:31:09'),
(255, 'en', 'title', 'Title', '2024-03-14 02:34:38', '2024-03-14 02:34:38'),
(256, 'en', 'date', 'Date', '2024-03-14 02:34:38', '2024-03-14 02:34:38'),
(257, 'en', 'enter_title', 'Enter Title', '2024-03-14 02:34:41', '2024-03-14 02:34:41'),
(258, 'en', 'save', 'Save', '2024-03-14 02:36:45', '2024-03-14 02:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `access_token` longtext DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'customer' COMMENT 'customer, seller, admin, staff',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_code` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_original` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Active=1, Inactive=0',
  `referral_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider`, `provider_id`, `refresh_token`, `access_token`, `user_type`, `name`, `email`, `verification_code`, `email_verified_at`, `password`, `remember_token`, `device_token`, `avatar`, `avatar_original`, `address`, `country_id`, `state_id`, `city_id`, `postal_code`, `phone`, `balance`, `status`, `referral_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'admin', 'Admin', 'admin@admin.com', NULL, NULL, '$2y$12$iEGo7yqPfx5I3KMN2X2Dgezkn/6zUKs7GpmDZLmGjUHbcADwNo0tu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, '2024-01-31 06:36:09', '2024-01-31 06:36:09', NULL),
(4, NULL, NULL, NULL, NULL, NULL, 'staff', 'Ahan', 'ahan@gmail.com', NULL, NULL, '$2y$12$q5pgmY4ISn4XcriKTOQboukq5DvazkzewS0XP5JctVRdhB0J/sJKe', NULL, NULL, NULL, '56', 'Block A, House 82 Rd No 2,', 1, 3, 18, '1216', '01711454988', 0.00, 1, NULL, '2024-02-27 23:15:48', '2024-03-02 03:37:22', NULL),
(5, NULL, NULL, NULL, NULL, NULL, 'staff', 'Tamin', 'tamim@gmail.com', NULL, NULL, '$2y$12$v65HAdShDwRz3Z9HO1.OruGd6Giw50MuGJLQxJ9OnhpYAJxBwpjFK', NULL, NULL, NULL, '60', '436/a (1st Floor) North Kazipara', 1, 3, 19, '1216', '01744898444', 0.00, 1, NULL, '2024-03-03 23:09:05', '2024-03-03 23:19:05', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`),
  ADD KEY `blogs_created_by_foreign` (`created_by`),
  ADD KEY `blogs_updated_by_foreign` (`updated_by`),
  ADD KEY `blogs_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_category_translations_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_translations_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_translations_city_id_foreign` (`city_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_uploads_user_id_foreign` (`user_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `state_translations`
--
ALTER TABLE `state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_translations_state_id_foreign` (`state_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_state_id_foreign` (`state_id`),
  ADD KEY `users_city_id_foreign` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_translations`
--
ALTER TABLE `blog_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `state_translations`
--
ALTER TABLE `state_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD CONSTRAINT `blog_category_translations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD CONSTRAINT `blog_translations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD CONSTRAINT `city_translations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD CONSTRAINT `file_uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `state_translations`
--
ALTER TABLE `state_translations`
  ADD CONSTRAINT `state_translations_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
