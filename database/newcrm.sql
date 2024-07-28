-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2024 at 07:37 PM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'New Lead created.', 'gghb Lead created.', 'App\\Models\\Lead', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 10:01:58', '2024-07-14 10:01:58'),
(2, 'New Article Group created.', 'new group Article Group created.', 'App\\Models\\ArticleGroup', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 10:45:18', '2024-07-14 10:45:18'),
(3, 'New Tag created.', 'Stake Tag created.', 'App\\Models\\Tag', 7, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 10:45:37', '2024-07-14 10:45:37'),
(4, 'New Department created.', 'Software Department created.', 'App\\Models\\Department', 7, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 10:57:29', '2024-07-14 10:57:29'),
(5, 'New Expense created.', 'Welcome drinks Expense created.', 'App\\Models\\Expense', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 10:59:10', '2024-07-14 10:59:10'),
(6, 'New Expense created.', 'Lunch bills Expense created.', 'App\\Models\\Expense', 2, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 10:59:54', '2024-07-14 10:59:54'),
(7, 'New Payment Mode created.', 'Cash Payment Mode created.', 'App\\Models\\PaymentMode', 4, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 11:00:29', '2024-07-14 11:00:29'),
(8, 'New Tax Rate created.', 'Office Tax Rate created.', 'App\\Models\\TaxRate', 7, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 11:00:54', '2024-07-14 11:00:54'),
(9, 'New Announcement created.', 'This is a new subject Announcement created.', 'App\\Models\\Announcement', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 11:01:28', '2024-07-14 11:01:28'),
(10, 'New Product created.', 'New Laptop Product created.', 'App\\Models\\Product', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 11:02:06', '2024-07-14 11:02:06'),
(11, 'New Service created.', 'Computer Repairing Service created.', 'App\\Models\\Service', 14, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 11:03:55', '2024-07-14 11:03:55'),
(12, 'Lead updated.', 'Forlan Lead updated.', 'App\\Models\\Lead', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 11:54:08', '2024-07-14 11:54:08'),
(13, 'New Country created.', 'Bangladesh Country created.', 'App\\Models\\Country', 10, 'App\\Models\\User', 1, '[]', NULL, '2024-07-14 12:02:58', '2024-07-14 12:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `show_to_clients` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `subject`, `date`, `message`, `show_to_clients`, `status`, `created_at`, `updated_at`) VALUES
(1, 'This is a new subject', '2024-07-23 00:00:00', '<p>This is a hello world message</p>', 1, 0, '2024-07-14 11:01:28', '2024-07-14 11:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `internal_article` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_group_id_foreign` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_groups`
--

DROP TABLE IF EXISTS `article_groups`;
CREATE TABLE IF NOT EXISTS `article_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_groups_group_name_unique` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_groups`
--

INSERT INTO `article_groups` (`id`, `group_name`, `color`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 'new group', '#3F51B5', NULL, 1, '2024-07-14 10:45:18', '2024-07-14 10:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `send_welcome_email` tinyint(1) NOT NULL DEFAULT '0',
  `send_password_email` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_customer_id_foreign` (`customer_id`),
  KEY `contacts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_email_notifications`
--

DROP TABLE IF EXISTS `contact_email_notifications`;
CREATE TABLE IF NOT EXISTS `contact_email_notifications` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` int UNSIGNED NOT NULL,
  `email_notification_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_email_notifications_contact_id_foreign` (`contact_id`),
  KEY `contact_email_notifications_email_notification_id_foreign` (`email_notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `contract_value` double DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `contract_type_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contracts_subject_unique` (`subject`),
  KEY `contracts_customer_id_foreign` (`customer_id`),
  KEY `contracts_contract_type_id_foreign` (`contract_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

DROP TABLE IF EXISTS `contract_types`;
CREATE TABLE IF NOT EXISTS `contract_types` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Contract under Seal', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Express Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Implied Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Executed and Executory Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Bilateral and Unilateral Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'Unconscionable Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Adhesion Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'Aleatory Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(9, 'Void and Voidable Contracts', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'India', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(2, 'Canada', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(3, 'USA', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(4, 'Germany', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(5, 'Russia', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(6, 'England', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(7, 'UAE', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(8, 'China', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(9, 'Turkey', '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(10, 'Bangladesh', '2024-07-14 12:02:58', '2024-07-14 12:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

DROP TABLE IF EXISTS `credit_notes`;
CREATE TABLE IF NOT EXISTS `credit_notes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `credit_note_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_note_date` datetime NOT NULL,
  `currency` int NOT NULL,
  `discount_type` int DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `admin_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `unit` int NOT NULL,
  `client_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `term_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sub_total` double DEFAULT NULL,
  `adjustment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_amount` double DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `discount_symbol` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_notes_customer_id_foreign` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_addresses`
--

DROP TABLE IF EXISTS `credit_note_addresses`;
CREATE TABLE IF NOT EXISTS `credit_note_addresses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `credit_note_id` int UNSIGNED NOT NULL,
  `type` int NOT NULL,
  `street` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_note_addresses_credit_note_id_foreign` (`credit_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_code` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_n` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_supplier` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_link` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` int DEFAULT NULL,
  `previous_dues` int DEFAULT NULL,
  `zip` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_code`, `customer_name`, `short_name`, `default_n`, `company_name`, `vat_number`, `street`, `is_supplier`, `phone`, `state`, `location_link`, `city`, `email`, `website`, `credit_limit`, `previous_dues`, `zip`, `mobile`, `currency`, `country`, `default_language`, `created_at`, `updated_at`) VALUES
(1, '233322', 'Zahir', 'Khan', '0', '', '231242424', '', '0', '6757474747', '', '', '', 'zahir@mail.com', 'zahir.com', 0, 0, '', '01717761611', '', '10', 'en', '2024-07-14 13:17:37', '2024-07-14 13:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'High Budget', 'This is High Budget', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Wholesaler', 'This is Wholesaler', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'VIP', 'This is VIP', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Low Budget', 'This is Low Budget', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Wisoky-Robel', 'This is Wisoky-Robel', '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `customer_to_customer_groups`
--

DROP TABLE IF EXISTS `customer_to_customer_groups`;
CREATE TABLE IF NOT EXISTS `customer_to_customer_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_to_customer_groups_customer_id_foreign` (`customer_id`),
  KEY `customer_to_customer_groups_customer_group_id_foreign` (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_to_customer_groups`
--

INSERT INTO `customer_to_customer_groups` (`id`, `customer_id`, `customer_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2024-07-14 13:17:37', '2024-07-14 13:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Marketing Department', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Operations Department', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Finance Department', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Sales Department', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Human Resource Department', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'Purchase Department', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Software', '2024-07-14 10:57:29', '2024-07-14 10:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `email_notifications`
--

DROP TABLE IF EXISTS `email_notifications`;
CREATE TABLE IF NOT EXISTS `email_notifications` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` int NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_plain_text` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `email_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
CREATE TABLE IF NOT EXISTS `estimates` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `currency` int NOT NULL,
  `estimate_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_agent_id` int UNSIGNED DEFAULT NULL,
  `discount_type` int DEFAULT NULL,
  `estimate_date` datetime NOT NULL,
  `estimate_expiry_date` datetime DEFAULT NULL,
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount` double DEFAULT NULL,
  `unit` int NOT NULL,
  `sub_total` double DEFAULT NULL,
  `adjustment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `client_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `term_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_amount` double DEFAULT NULL,
  `discount_symbol` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimates_customer_id_foreign` (`customer_id`),
  KEY `estimates_sales_agent_id_foreign` (`sales_agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_addresses`
--

DROP TABLE IF EXISTS `estimate_addresses`;
CREATE TABLE IF NOT EXISTS `estimate_addresses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `estimate_id` int UNSIGNED NOT NULL,
  `type` int NOT NULL,
  `street` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimate_addresses_estimate_id_foreign` (`estimate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expense_category_id` int UNSIGNED NOT NULL,
  `expense_date` datetime NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `currency` int NOT NULL,
  `tax_applied` tinyint(1) NOT NULL DEFAULT '0',
  `tax_1_id` int UNSIGNED DEFAULT NULL,
  `tax_2_id` int UNSIGNED DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `payment_mode_id` int UNSIGNED DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  KEY `expenses_tax_1_id_foreign` (`tax_1_id`),
  KEY `expenses_tax_2_id_foreign` (`tax_2_id`),
  KEY `expenses_payment_mode_id_foreign` (`payment_mode_id`),
  KEY `expenses_customer_id_foreign` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `name`, `note`, `expense_category_id`, `expense_date`, `amount`, `customer_id`, `currency`, `tax_applied`, `tax_1_id`, `tax_2_id`, `tax_rate`, `payment_mode_id`, `reference`, `billable`, `created_at`, `updated_at`) VALUES
(1, 'Welcome drinks', NULL, 2, '2024-07-08 00:00:00', 300, NULL, 0, 0, NULL, NULL, NULL, 1, NULL, 1, '2024-07-14 10:59:10', '2024-07-14 10:59:10'),
(2, 'Lunch bills', NULL, 3, '2024-07-02 00:00:00', 330, NULL, 2, 0, NULL, NULL, NULL, 1, NULL, 1, '2024-07-14 10:59:54', '2024-07-14 10:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense_categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Advertising', 'Advertising', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Contractors', 'Contractors', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Education and Training', 'Education and Training', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Employee Benefits', 'Employee Benefits', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Office Expenses & Postage', 'Office Expenses & Postage', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'Other Expenses', 'Other Expenses', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Personal', 'Personal', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'Rent or Lease', 'Rent or Lease', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(9, 'Professional Services', 'Professional Services', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(10, 'Supplies', 'Supplies', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(11, 'Travel', 'Travel', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(12, 'Utilities', 'Utilities', '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
CREATE TABLE IF NOT EXISTS `goals` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `goal_type` int NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `achievement` double DEFAULT NULL,
  `is_notify` tinyint(1) DEFAULT NULL,
  `is_not_notify` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goals_subject_unique` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_members`
--

DROP TABLE IF EXISTS `goal_members`;
CREATE TABLE IF NOT EXISTS `goal_members` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `goal_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goal_members_user_id_foreign` (`user_id`),
  KEY `goal_members_goal_id_foreign` (`goal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_types`
--

DROP TABLE IF EXISTS `goal_types`;
CREATE TABLE IF NOT EXISTS `goal_types` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goal_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `sales_agent_id` int UNSIGNED DEFAULT NULL,
  `currency` int NOT NULL,
  `discount_type` int DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `admin_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `unit` int NOT NULL,
  `client_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `term_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sub_total` double DEFAULT NULL,
  `adjustment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_amount` double DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `discount_symbol` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_customer_id_foreign` (`customer_id`),
  KEY `invoices_sales_agent_id_foreign` (`sales_agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_addresses`
--

DROP TABLE IF EXISTS `invoice_addresses`;
CREATE TABLE IF NOT EXISTS `invoice_addresses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int UNSIGNED NOT NULL,
  `type` int NOT NULL,
  `street` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_addresses_invoice_id_foreign` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payment_modes`
--

DROP TABLE IF EXISTS `invoice_payment_modes`;
CREATE TABLE IF NOT EXISTS `invoice_payment_modes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_mode_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_payment_modes_payment_mode_id_foreign` (`payment_mode_id`),
  KEY `invoice_payment_modes_invoice_id_foreign` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rate` double NOT NULL,
  `tax_1_id` int DEFAULT NULL,
  `tax_2_id` int DEFAULT NULL,
  `item_group_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_item_group_id_foreign` (`item_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `rate`, `tax_1_id`, `tax_2_id`, `item_group_id`, `created_at`, `updated_at`) VALUES
(1, 'New Laptop', NULL, 234321, 2, 3, 3, '2024-07-14 11:02:06', '2024-07-14 11:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `item_groups`
--

DROP TABLE IF EXISTS `item_groups`;
CREATE TABLE IF NOT EXISTS `item_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_groups`
--

INSERT INTO `item_groups` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Consultant Services', 'Pain find that follow. I feel more than that, but that\'s dishonor, with a grief and a lot. It is extremely quite right that that.', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'LCD TV', 'Born to those who discovered it. Present suffering is nothing more than that. It is the pleasure of him who is willing, or.', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'MacBook Pro', 'The distinction, however, is easier, to the accepted indeed. Seeks to provide for them.', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Marketing Services', 'Thus was born and will never interfere either. And to explain how he desires.', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'SEO Optimization', 'He who does not, therefore, the body itself in. Or they are rejecting it.', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'USB Stick', 'All but one reason. We regard any who are in a assumenda that he would consent. And it is because of it.', '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `description`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'es', 'Spanish', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'fr', 'French', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'de', 'German', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'ru', 'Russian', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'pt', 'Portuguese', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'ar', 'Arabic', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'zh', 'Chinese', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(9, 'tr', 'Turkish', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(10, 'bn', NULL, 0, '2024-07-14 12:17:46', '2024-07-14 12:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE IF NOT EXISTS `leads` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_id` int UNSIGNED NOT NULL,
  `source_id` int UNSIGNED NOT NULL,
  `assign_to` int UNSIGNED DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `estimate_budget` double DEFAULT NULL,
  `default_language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` int DEFAULT NULL,
  `lead_convert_customer` tinyint(1) NOT NULL DEFAULT '0',
  `lead_convert_date` date DEFAULT NULL,
  `contacted_today` int DEFAULT NULL,
  `date_contacted` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_status_id_foreign` (`status_id`),
  KEY `leads_source_id_foreign` (`source_id`),
  KEY `leads_assign_to_foreign` (`assign_to`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `status_id`, `source_id`, `assign_to`, `company_name`, `name`, `position`, `website`, `phone`, `description`, `estimate_budget`, `default_language`, `public`, `lead_convert_customer`, `lead_convert_date`, `contacted_today`, `date_contacted`, `created_at`, `updated_at`, `country`) VALUES
(1, 3, 5, NULL, 'Atletico', 'Forlan', 'Business', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, '2024-07-14 16:01:57', '2024-07-14 10:01:57', '2024-07-14 11:54:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

DROP TABLE IF EXISTS `lead_sources`;
CREATE TABLE IF NOT EXISTS `lead_sources` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_sources_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Google AdWords', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Other Search Engines', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Google (organic)', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Social Media (Facebook, Twitter etc)', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Cold Calling/Telemarketing', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'Advertising', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Custom Referral', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'Expo/Seminar', '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

DROP TABLE IF EXISTS `lead_statuses`;
CREATE TABLE IF NOT EXISTS `lead_statuses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `name`, `color`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Attempted', '#ff2d42', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Not Attempted', '#84c529', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Contacted', '#0000ff', 3, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'New Opportunity', '#c0c0c0', 4, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Additional Contact', '#03a9f4', 5, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'In Progress', '#9C27B0', 5, '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_conversions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2020_03_30_113645_create_languages_table', 1),
(8, '2020_03_31_072201_create_tags_table', 1),
(9, '2020_03_31_101748_create_customer_groups_table', 1),
(10, '2020_04_02_120049_create_permission_tables', 1),
(11, '2020_04_03_042555_create_article_groups_table', 1),
(12, '2020_04_03_045459_create_predefined_replies_table', 1),
(13, '2020_04_03_063710_create_customers_table', 1),
(14, '2020_04_03_064745_create_address_table', 1),
(15, '2020_04_03_080033_create_ticket_priorities_table', 1),
(16, '2020_04_03_091117_create_expense_categories_table', 1),
(17, '2020_04_03_113351_create_customer_to_customer_groups_table', 1),
(18, '2020_04_03_123515_create_services_table', 1),
(19, '2020_04_04_035019_create_ticket_statuses_table', 1),
(20, '2020_04_06_040305_create_lead_statuses_table', 1),
(21, '2020_04_06_054337_create_lead_sources_table', 1),
(22, '2020_04_06_055647_create_item_groups_table', 1),
(23, '2020_04_06_064803_create_tax_rates_table', 1),
(24, '2020_04_06_065009_create_announcements_table', 1),
(25, '2020_04_06_083033_create_articles_table', 1),
(26, '2020_04_06_095554_create_payment_modes_table', 1),
(27, '2020_04_07_042816_create_items_table', 1),
(28, '2020_04_07_055247_create_contacts_table', 1),
(29, '2020_04_08_042058_create_contract_types_table', 1),
(30, '2020_04_08_060610_create_departments_table', 1),
(31, '2020_04_08_061359_create_tickets_table', 1),
(32, '2020_04_08_094756_add_type_column_into_permissions_table', 1),
(33, '2020_04_08_113224_create_invoices_table', 1),
(34, '2020_04_09_052358_create_invoice_addresses_table', 1),
(35, '2020_04_09_084032_create_taggables_table', 1),
(36, '2020_04_09_095706_create_invoice_payment_modes_table', 1),
(37, '2020_04_09_114622_create_sales_items_table', 1),
(38, '2020_04_10_043112_create_media_table', 1),
(39, '2020_04_10_070725_create_email_notifications_table', 1),
(40, '2020_04_10_103613_create_user_departments_table', 1),
(41, '2020_04_14_063726_create_notes_table', 1),
(42, '2020_04_14_065429_create_contact_email_notifications_table', 1),
(43, '2020_04_15_092420_create_reminders_table', 1),
(44, '2020_04_15_112744_create_sales_items_taxes_table', 1),
(45, '2020_04_16_054536_create_projects_table', 1),
(46, '2020_04_16_075039_create_sales_taxes_table', 1),
(47, '2020_04_17_101231_create_project_members_table', 1),
(48, '2020_04_20_051641_create_expenses_table', 1),
(49, '2020_04_20_082756_create_comments_table', 1),
(50, '2020_04_20_090457_add_goal_types_table', 1),
(51, '2020_04_20_111756_add_goals_table', 1),
(52, '2020_04_20_124358_create_leads_table', 1),
(53, '2020_04_21_114258_add_contracts_table', 1),
(54, '2020_04_22_082049_create_payments_table', 1),
(55, '2020_04_22_085449_add_settings_table', 1),
(56, '2020_04_23_060014_create_credit_notes_table', 1),
(57, '2020_04_23_060243_create_credit_note_addresses_table', 1),
(58, '2020_04_24_054022_create_email_templates_table', 1),
(59, '2020_04_27_045332_create_proposals_table', 1),
(60, '2020_04_27_061619_create_estimates_table', 1),
(61, '2020_04_27_100038_create_estimate_addresses_table', 1),
(62, '2020_04_28_122023_create_proposal_addresses_table', 1),
(63, '2020_07_06_045925_add_new_fields_into_users_table', 1),
(64, '2020_07_14_134831_create_tasks_table', 1),
(65, '2020_07_31_095218_add_image_field_in_articles_table', 1),
(66, '2020_08_24_052215_create_project_contacts_table', 1),
(67, '2020_09_02_130829_create_goal_members_table', 1),
(68, '2020_12_10_062217_add_status_field_to_announcements_table', 1),
(69, '2020_12_10_114422_add_status_filed_to_reminders_table', 1),
(70, '2020_12_19_061159_add_country_to_leads_table', 1),
(71, '2020_12_25_074509_drop_predefine_relation_on_tickets_table', 1),
(72, '2020_12_25_093030_drop_department_relation_on_tickets_table', 1),
(73, '2020_12_25_111608_drop_foreign_key_to_invoices_table', 1),
(74, '2020_12_25_111700_drop_foreign_key_to_estimates_table', 1),
(75, '2020_12_26_045434_drop_member_id_foreign_key_on_tasks_table', 1),
(76, '2021_01_04_090933_add_stripe_id_and_meta_fields_in_payments_table', 1),
(77, '2021_01_19_124232_make_start_date_nullable_in_tasks_table', 1),
(78, '2021_01_20_050318_make_priority_and_service_field_nullable_in_tickets_table', 1),
(79, '2021_03_10_054614_create_activity_log_table', 1),
(80, '2021_05_10_112220_create_notifications_table', 1),
(81, '2021_07_05_121647_change_customer_foreign_key_table_name_in_expenses_table', 1),
(82, '2021_07_22_082312_create_countries_table', 1),
(83, '2021_09_03_000000_add_uuid_to_failed_jobs_table', 1),
(84, '2021_09_11_113710_add_conversions_disk_column_in_media_table', 1),
(85, '2022_04_27_062115_add_is_admin_field_in_users_table', 1),
(86, '2022_05_24_073300_change_properties_field_type_in_activity_log_table', 1),
(87, '2022_07_27_055736_add_hsn_tax_field_in_invoices_and_proposals_and_estimates', 1),
(88, '2022_09_13_045308_run_default_country_code_seeder', 1),
(89, '2022_09_13_124102_add_is_default_field_in_languages_table', 1),
(90, '2022_09_19_055209_run_default_languages_seeder_table', 1),
(91, '2022_10_06_124122_run_set_default_language_seeder', 1),
(92, '2022_11_08_115827_run_ticket_permission_in_seeder', 1),
(93, '2022_11_14_092357_create_ticket_replies_table', 1),
(94, '2022_12_19_120935_add_batch_uuid_column_to_activity_log_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 1),
(12, 'App\\Models\\User', 1),
(13, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 1),
(16, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 1),
(24, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 1),
(29, 'App\\Models\\User', 1),
(30, 'App\\Models\\User', 1),
(31, 'App\\Models\\User', 1),
(32, 'App\\Models\\User', 1),
(33, 'App\\Models\\User', 1),
(34, 'App\\Models\\User', 1),
(35, 'App\\Models\\User', 1),
(36, 'App\\Models\\User', 1),
(37, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 1),
(39, 'App\\Models\\User', 1),
(40, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `added_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_added_by_foreign` (`added_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `type`, `description`, `read_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Removed From Lead', 'App\\Models\\Lead', 'You removed from Forlan', NULL, NULL, '2024-07-14 11:54:08', '2024-07-14 11:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_received` double NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_mode` int UNSIGNED NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `send_mail_to_customer_contacts` tinyint(1) DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_payment_mode_foreign` (`payment_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

DROP TABLE IF EXISTS `payment_modes`;
CREATE TABLE IF NOT EXISTS `payment_modes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_modes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Bank', NULL, 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Gold', NULL, 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Stripe', NULL, 1, '2023-01-11 22:50:14', '2023-01-11 22:50:14'),
(4, 'Cash', NULL, 1, '2024-07-14 11:00:29', '2024-07-14 11:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `type`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'contact_tickets', 'Contact Tickets', NULL, 'Contacts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'manage_customer_groups', 'Manage Customer Groups', NULL, 'Customers', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'manage_customers', 'Manage Customers', NULL, 'Customers', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'manage_staff_member', 'Manage Staff Member', NULL, 'Members', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'manage_article_groups', 'Manage Article Groups', NULL, 'Articles', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'manage_articles', 'Manage Articles', NULL, 'Articles', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'manage_tags', 'Manage Tags', NULL, 'Tags', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'manage_leads', 'Manage Leads', NULL, 'Leads', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(9, 'manage_lead_status', 'Manage Lead Status', NULL, 'Leads', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(10, 'manage_tasks', 'Manage Tasks', NULL, 'Tasks', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(11, 'manage_ticket_priority', 'Manage Ticket Priority', NULL, 'Tickets', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(12, 'manage_ticket_statuses', 'Manage Ticket Statuses', NULL, 'Tickets', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(13, 'manage_tickets', 'Manage Tickets', NULL, 'Tickets', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(14, 'manage_invoices', 'Manage Invoices', NULL, 'Invoices', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(15, 'manage_payments', 'Manage Payments', NULL, 'Payments', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(16, 'manage_payment_mode', 'Manage Payment Mode', NULL, 'Payments', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(17, 'manage_credit_notes', 'Manage Credit Note', NULL, 'Credit Note', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(18, 'manage_proposals', 'Manage Proposals', NULL, 'Proposals', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(19, 'manage_estimates', 'Manage Estimates', NULL, 'Estimates', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(20, 'manage_departments', 'Manage Departments', NULL, 'Departments', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(21, 'manage_predefined_replies', 'Manage Predefined Replies', NULL, 'Predefined Replies', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(22, 'manage_expense_category', 'Manage Expense Category', NULL, 'Expenses', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(23, 'manage_expenses', 'Manage Expenses', NULL, 'Expenses', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(24, 'manage_services', 'Manage Services', NULL, 'Services', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(25, 'manage_items', 'Manage Items', NULL, 'Items', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(26, 'manage_items_groups', 'Manage Items Groups', NULL, 'Items', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(27, 'manage_tax_rates', 'Manage Tax Rates', NULL, 'TaxRate', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(28, 'manage_announcements', 'Manage Announcements', NULL, 'Announcements', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(29, 'manage_calenders', 'Manage Calenders', NULL, 'Calenders', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(30, 'manage_lead_sources', 'Manage Lead Sources', NULL, 'Leads', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(31, 'manage_contracts_types', 'Manage Contract Types', NULL, 'Contracts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(32, 'manage_contracts', 'Manage Contracts', NULL, 'Contracts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(33, 'manage_projects', 'Manage Projects', NULL, 'Projects', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(34, 'manage_goals', 'Manage Goals', NULL, 'Goals', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(35, 'manage_settings', 'Manage Settings', NULL, 'Settings', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(36, 'contact_projects', 'Contact Projects', NULL, 'Contacts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(37, 'contact_invoices', 'Contact Invoices', NULL, 'Contacts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(38, 'contact_proposals', 'Contact Proposals', NULL, 'Contacts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(39, 'contact_contracts', 'Contact Contracts', NULL, 'Contacts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(40, 'contact_estimates', 'Contact Estimates', NULL, 'Contacts', 'web', '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `predefined_replies`
--

DROP TABLE IF EXISTS `predefined_replies`;
CREATE TABLE IF NOT EXISTS `predefined_replies` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `reply_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `calculate_progress_through_tasks` tinyint(1) DEFAULT NULL,
  `progress` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_type` int NOT NULL,
  `status` int NOT NULL,
  `estimated_hours` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `send_email` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_customer_id_foreign` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_contacts`
--

DROP TABLE IF EXISTS `project_contacts`;
CREATE TABLE IF NOT EXISTS `project_contacts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` int UNSIGNED NOT NULL,
  `project_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_contact_id_foreign` (`contact_id`),
  KEY `project_contacts_project_id_foreign` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
CREATE TABLE IF NOT EXISTS `project_members` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_members_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
CREATE TABLE IF NOT EXISTS `proposals` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `proposal_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `open_till` datetime DEFAULT NULL,
  `currency` int NOT NULL,
  `discount_type` int DEFAULT NULL,
  `status` int NOT NULL,
  `assigned_user_id` int DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `unit` int NOT NULL,
  `sub_total` double DEFAULT NULL,
  `adjustment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_amount` double DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_symbol` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proposals_proposal_number_unique` (`proposal_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_addresses`
--

DROP TABLE IF EXISTS `proposal_addresses`;
CREATE TABLE IF NOT EXISTS `proposal_addresses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `proposal_id` int UNSIGNED NOT NULL,
  `type` int NOT NULL,
  `street` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proposal_addresses_proposal_id_foreign` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notified_date` datetime NOT NULL,
  `reminder_to` int UNSIGNED NOT NULL,
  `added_by` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notified` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_reminder_to_foreign` (`reminder_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `guard_name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', NULL, 'web', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'staff_member', 'Staff Member', NULL, 'web', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'client', 'Client', NULL, 'web', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

DROP TABLE IF EXISTS `sales_items`;
CREATE TABLE IF NOT EXISTS `sales_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` int NOT NULL,
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_item_taxes`
--

DROP TABLE IF EXISTS `sales_item_taxes`;
CREATE TABLE IF NOT EXISTS `sales_item_taxes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sales_item_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_item_taxes_tax_id_foreign` (`tax_id`),
  KEY `sales_item_taxes_sales_item_id_foreign` (`sales_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_taxes`
--

DROP TABLE IF EXISTS `sales_taxes`;
CREATE TABLE IF NOT EXISTS `sales_taxes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Empathy', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Communication skills', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Product knowledge', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Patience', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Positive attitude', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'Positive language', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Personal responsibility', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'Confidence', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(9, 'Listening skills', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(10, 'Adaptability', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(11, 'Attentiveness', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(12, 'Professionalism', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(13, 'Acting ability', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(14, 'Computer Repairing', '2024-07-14 11:03:55', '2024-07-14 11:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `group` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `group`, `created_at`, `updated_at`) VALUES
(1, 'default_country_code', 'in', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'logo', 'http://crm.test/img/infyom-logo.png', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'favicon', 'http://crm.test/img/infyom-favicon.png', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'company_name', 'InfyCRM', 1, '2023-01-11 22:50:13', '2024-07-14 12:02:25'),
(5, 'company_domain', '127.0.0.1', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'file_type', '.png,.jpg,.pdf,.doc,.docx,.xls,.xlsx,.zip,.rar,.txt', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'term_and_conditions', 'This Infycrm project is follow all term and conditions and privacy.', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(8, 'company', 'InfyOmLabs', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(9, 'address', '446, Tulsi Arcade, Nr. Sudama Chowk, Mota Varachha, Surat - 394101, Gujarat, India', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(10, 'city', 'Surat', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(11, 'state', 'Gujarat', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(12, 'country_code', 'India [IN]', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(13, 'zip_code', '394101', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(14, 'phone', '+91 70963 36561', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(15, 'vat_number', '1234567890', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(16, 'current_currency', 'inr', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(17, 'website', 'infyom.com', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(18, 'company_information_format', '{company_name}\n                        {address}\n                        {city} {state}\n                        {country_code} {zip_code}\n                        {vat_number_with_label}', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(19, 'admin_note', 'This is the admin note of the InfyCRM project.', 3, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(20, 'client_note', 'This is the client note of the InfyCRM project.', 3, '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE IF NOT EXISTS `subscription_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

DROP TABLE IF EXISTS `taggables`;
CREATE TABLE IF NOT EXISTS `taggables` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `taggable_id` int NOT NULL,
  `taggable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taggables_tag_id_foreign` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Bug', 'Bugs', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Follow Up', 'Follow Up', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Important', 'Important', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Logo', 'Logo', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Todo', 'Todo', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'Tomorrow', 'Tomorrow', '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Stake', NULL, '2024-07-14 10:45:37', '2024-07-14 10:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` int UNSIGNED DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `hourly_rate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `related_to` int DEFAULT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_member_id_foreign` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `name`, `tax_rate`, `created_at`, `updated_at`) VALUES
(1, 'Madera', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Fernado', 2, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Agow', 5, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Moon', 10, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Agxm', 15, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(6, 'County', 20, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(7, 'Office', 9, '2024-07-14 11:00:54', '2024-07-14 11:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int UNSIGNED DEFAULT NULL,
  `cc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assign_to` int UNSIGNED DEFAULT NULL,
  `priority_id` int UNSIGNED DEFAULT NULL,
  `service_id` int UNSIGNED DEFAULT NULL,
  `predefined_reply_id` int UNSIGNED DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ticket_status_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_priority_id_foreign` (`priority_id`),
  KEY `tickets_service_id_foreign` (`service_id`),
  KEY `tickets_ticket_status_id_foreign` (`ticket_status_id`),
  KEY `tickets_predefined_reply_id_foreign` (`predefined_reply_id`),
  KEY `tickets_contact_id_foreign` (`contact_id`),
  KEY `tickets_department_id_foreign` (`department_id`),
  KEY `tickets_assign_to_foreign` (`assign_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priorities`
--

DROP TABLE IF EXISTS `ticket_priorities`;
CREATE TABLE IF NOT EXISTS `ticket_priorities` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_priorities_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_priorities`
--

INSERT INTO `ticket_priorities` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Low', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'Medium', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'High', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'Urgent', 0, '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

DROP TABLE IF EXISTS `ticket_statuses`;
CREATE TABLE IF NOT EXISTS `ticket_statuses` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_statuses`
--

INSERT INTO `ticket_statuses` (`id`, `name`, `pick_color`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Open', '#fc544b', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(2, 'In Progress', '#6777ef', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(3, 'Answered', '#3abaf4', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(4, 'On Hold', '#ffa426', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13'),
(5, 'Closed', '#47c363', 1, '2023-01-11 22:50:13', '2023-01-11 22:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_member` tinyint(1) DEFAULT NULL,
  `send_welcome_email` tinyint(1) DEFAULT NULL,
  `default_language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `owner_id`, `owner_type`, `is_enable`, `is_admin`, `image`, `facebook`, `linkedin`, `skype`, `staff_member`, `send_welcome_email`, `default_language`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Super', 'Admin', 'admin@infycrm.com', '+917878454512', '$2y$10$wxDbHkXgU6M.wT4SUOdfFu70Y8Rb2v9fW6GNzKkwwLFNTOadYwVNy', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-11 22:50:13', NULL, '2023-01-11 22:50:13', '2023-01-11 22:50:14', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

DROP TABLE IF EXISTS `user_departments`;
CREATE TABLE IF NOT EXISTS `user_departments` (
  `user_id` int UNSIGNED NOT NULL,
  `department_id` int UNSIGNED NOT NULL,
  KEY `user_departments_user_id_foreign` (`user_id`),
  KEY `user_departments_department_id_foreign` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `article_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_email_notifications`
--
ALTER TABLE `contact_email_notifications`
  ADD CONSTRAINT `contact_email_notifications_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_email_notifications_email_notification_id_foreign` FOREIGN KEY (`email_notification_id`) REFERENCES `email_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_contract_type_id_foreign` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD CONSTRAINT `credit_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_note_addresses`
--
ALTER TABLE `credit_note_addresses`
  ADD CONSTRAINT `credit_note_addresses_credit_note_id_foreign` FOREIGN KEY (`credit_note_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_to_customer_groups`
--
ALTER TABLE `customer_to_customer_groups`
  ADD CONSTRAINT `customer_to_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_to_customer_groups_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_sales_agent_id_foreign` FOREIGN KEY (`sales_agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `estimate_addresses`
--
ALTER TABLE `estimate_addresses`
  ADD CONSTRAINT `estimate_addresses_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_payment_mode_id_foreign` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_tax_1_id_foreign` FOREIGN KEY (`tax_1_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_tax_2_id_foreign` FOREIGN KEY (`tax_2_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `goal_members`
--
ALTER TABLE `goal_members`
  ADD CONSTRAINT `goal_members_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goal_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_sales_agent_id_foreign` FOREIGN KEY (`sales_agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoice_addresses`
--
ALTER TABLE `invoice_addresses`
  ADD CONSTRAINT `invoice_addresses_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_payment_modes`
--
ALTER TABLE `invoice_payment_modes`
  ADD CONSTRAINT `invoice_payment_modes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_payment_modes_payment_mode_id_foreign` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_item_group_id_foreign` FOREIGN KEY (`item_group_id`) REFERENCES `item_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_assign_to_foreign` FOREIGN KEY (`assign_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `lead_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `lead_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_mode_foreign` FOREIGN KEY (`payment_mode`) REFERENCES `payment_modes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_contacts`
--
ALTER TABLE `project_contacts`
  ADD CONSTRAINT `project_contacts_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_contacts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_addresses`
--
ALTER TABLE `proposal_addresses`
  ADD CONSTRAINT `proposal_addresses_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_reminder_to_foreign` FOREIGN KEY (`reminder_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_item_taxes`
--
ALTER TABLE `sales_item_taxes`
  ADD CONSTRAINT `sales_item_taxes_sales_item_id_foreign` FOREIGN KEY (`sales_item_id`) REFERENCES `sales_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_item_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assign_to_foreign` FOREIGN KEY (`assign_to`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_predefined_reply_id_foreign` FOREIGN KEY (`predefined_reply_id`) REFERENCES `predefined_replies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priorities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ticket_status_id_foreign` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD CONSTRAINT `user_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
