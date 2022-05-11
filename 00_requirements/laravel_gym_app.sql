-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 09:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_gym_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `bannable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bannable_id` bigint(20) UNSIGNED NOT NULL,
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bans`
--

INSERT INTO `bans` (`id`, `bannable_type`, `bannable_id`, `created_by_type`, `created_by_id`, `comment`, `expired_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'App\\Models\\User', 1, NULL, NULL, '2022-05-06 15:59:41', '2022-05-06 15:57:36', '2022-05-06 15:59:41'),
(2, 'App\\Models\\User', 4, 'App\\Models\\User', 1, NULL, NULL, '2022-05-06 15:59:41', '2022-05-06 15:57:37', '2022-05-06 15:59:41'),
(3, 'App\\Models\\User', 4, 'App\\Models\\User', 1, NULL, NULL, '2022-05-06 15:59:41', '2022-05-06 15:58:16', '2022-05-06 15:59:41'),
(4, 'App\\Models\\User', 4, 'App\\Models\\User', 1, NULL, NULL, '2022-05-06 15:59:41', '2022-05-06 15:59:24', '2022-05-06 15:59:41'),
(5, 'App\\Models\\User', 4, 'App\\Models\\User', 1, NULL, NULL, '2022-05-06 16:01:34', '2022-05-06 16:01:31', '2022-05-06 16:01:34'),
(6, 'App\\Models\\User', 18, 'App\\Models\\User', 1, NULL, NULL, '2022-05-06 16:16:54', '2022-05-06 16:15:43', '2022-05-06 16:16:54'),
(7, 'App\\Models\\User', 4, 'App\\Models\\User', 1, NULL, NULL, '2022-05-07 11:34:50', '2022-05-06 19:37:14', '2022-05-07 11:34:50'),
(8, 'App\\Models\\User', 5, 'App\\Models\\User', 1, NULL, NULL, '2022-05-11 05:11:56', '2022-05-07 11:34:53', '2022-05-11 05:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Alexandria', NULL, NULL),
(2, 'Cairo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `has_gyms_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_gyms_id` bigint(20) UNSIGNED NOT NULL,
  `creatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creatable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`id`, `name`, `cover_url`, `created_at`, `updated_at`, `has_gyms_type`, `has_gyms_id`, `creatable_type`, `creatable_id`) VALUES
(1, 'Miami', 'public/gym_cover1.jpg', '2022-05-17 22:07:45', '2022-05-18 22:07:45', 'App\\Models\\City', 1, 'App\\Models\\User', 1),
(2, 'Smouha', 'public/gym_cover1.jpg', '2022-05-04 06:08:22', '2022-05-07 08:08:36', 'App\\Models\\City', 1, 'App\\Models\\User', 2),
(3, 'Zamalek', 'public/gym_cover2.jpg', '2022-05-04 22:07:59', '2022-05-05 01:07:59', 'App\\Models\\City', 2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_28_163005_create_permission_tables', 2),
(7, '2022_05_02_195056_create_cities_table', 3),
(8, '2014_10_12_000000_create_users_table', 4),
(10, '2022_05_04_034520_create_sessions_table', 6),
(11, '2022_05_04_053259_create_session_user_table', 7),
(14, '2022_05_04_103726_create_attendance_table', 8),
(15, '2022_05_04_111503_create_packages_table', 9),
(17, '2022_05_04_122546_create_purchases_table', 10),
(19, '2022_05_04_025009_create_gyms_table', 11),
(20, '2017_03_04_000000_create_bans_table', 12),
(21, '2022_05_06_174057_add_banned_at_column_to_users_table', 13),
(22, '2022_05_06_131456_update_purchase_table', 14),
(23, '2022_05_06_135700_update_purchase_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(7, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 3),
(8, 'App\\Models\\User', 9),
(8, 'App\\Models\\User', 10),
(8, 'App\\Models\\User', 30),
(9, 'App\\Models\\User', 4),
(9, 'App\\Models\\User', 5),
(9, 'App\\Models\\User', 18),
(10, 'App\\Models\\User', 19),
(10, 'App\\Models\\User', 21),
(10, 'App\\Models\\User', 23),
(11, 'App\\Models\\User', 20),
(11, 'App\\Models\\User', 22),
(11, 'App\\Models\\User', 24);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) UNSIGNED NOT NULL,
  `sessions_amount` int(10) UNSIGNED NOT NULL,
  `has_packages_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_packages_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `sessions_amount`, `has_packages_type`, `has_packages_id`, `created_at`, `updated_at`) VALUES
(1, 'Basic - Miami Branch', '8000.00', 800, '\\App\\Models\\Gym', 1, NULL, '2022-05-07 23:49:22'),
(2, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\Gym', 3, NULL, NULL),
(3, 'Eid Package - Smouha Branch', '2000.00', 200, '\\App\\Models\\Gym', 2, '2022-05-07 11:29:21', '2022-05-07 11:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hossamadel23895@gmail.com', '$2y$10$aPFx7soaHHKT1ZFT8OAQHOzdylLu3N.3KNTK3OkW9MBmuvQBjKMh.', '2022-05-05 16:24:11'),
('hossamadel23895@gmail.com', '$2y$10$aPFx7soaHHKT1ZFT8OAQHOzdylLu3N.3KNTK3OkW9MBmuvQBjKMh.', '2022-05-05 16:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(5, 'CRUD_city_managers', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(6, 'CRUD_gym_managers', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(7, 'CRUD_gyms', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(8, 'CRUD_sessions', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(9, 'Read_attendance', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(10, 'CRUD_packages', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(11, 'Read_packages', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(12, 'Read_purchases', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(13, 'CRUD_coaches', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(14, 'CRUD_members', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(15, 'CRUD_cities', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(16, 'Read_revenue', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(17, 'Purchase_package', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 25, 'MyApp', '3db383cacf47c4b8780968aa45c17bbc4be237bc428c19710a1140351820c27f', '[\"*\"]', NULL, '2022-05-05 10:00:29', '2022-05-05 10:00:29'),
(2, 'App\\Models\\User', 26, 'MyApp', '289da32cc94da3ce4197a4ace4e19e38d35d95963ceaa5b70c04ae054971352e', '[\"*\"]', NULL, '2022-05-05 16:12:03', '2022-05-05 16:12:03'),
(3, 'App\\Models\\User', 26, 'MyApp', 'c01fc258a38d74ea2c5b998d476139101d6716a0263beea8080c623f5e24e5b3', '[\"*\"]', NULL, '2022-05-05 16:15:15', '2022-05-05 16:15:15'),
(4, 'App\\Models\\User', 26, 'MyApp', '0222711c23ffc56e83738ae2ce72371807ddd6e535c655dbef9af32f9981884f', '[\"*\"]', NULL, '2022-05-05 16:19:47', '2022-05-05 16:19:47'),
(5, 'App\\Models\\User', 27, 'MyApp', 'd60f5367c2dc9dec7a2c5eff2df3e7fb4320c1e637c407c2d7f89e3aafc66019', '[\"*\"]', NULL, '2022-05-05 16:23:41', '2022-05-05 16:23:41'),
(6, 'App\\Models\\User', 28, 'MyApp', 'eba9fc9b61365708d7c3d2df175a39c1a0d7619c293288b6f6ca78a4e6fd8785', '[\"*\"]', NULL, '2022-05-05 16:25:29', '2022-05-05 16:25:29'),
(7, 'App\\Models\\User', 29, 'MyApp', '6512fec70f58c980eb6ded729278fc90ab7cf17e8b62aed1e3f7c0fbce988533', '[\"*\"]', NULL, '2022-05-05 16:29:30', '2022-05-05 16:29:30'),
(8, 'App\\Models\\User', 28, 'MyApp', '47f3c42e47a00cb12bcc229a60307ddf8d90d9dbe2d38b3a6580f8433a8cccd5', '[\"*\"]', '2022-05-05 16:47:44', '2022-05-05 16:39:53', '2022-05-05 16:47:44'),
(9, 'App\\Models\\User', 28, 'MyApp', '1d9f04d27d3f66cfe583fa7723e540df330ae4e1ae8882807b0dd629de4c7821', '[\"*\"]', NULL, '2022-05-05 16:48:13', '2022-05-05 16:48:13'),
(10, 'App\\Models\\User', 39, 'MyApp', 'eb84a53dad3eb8b0744719ca4985d2182c919db721d68c389fb8ea52a45c46f9', '[\"*\"]', NULL, '2022-05-06 23:28:09', '2022-05-06 23:28:09'),
(11, 'App\\Models\\User', 40, 'MyApp', 'ed59b02db8811a398e77da00894bf8e253ee5878320cc9af9d72f8f6ec464f89', '[\"*\"]', '2022-05-07 02:18:53', '2022-05-06 23:34:08', '2022-05-07 02:18:53'),
(12, 'App\\Models\\User', 40, 'MyApp', '1a113511d2c67364d49686487fa6b88ac8d57c04793c872142460b161abdb2cd', '[\"*\"]', NULL, '2022-05-06 23:38:10', '2022-05-06 23:38:10'),
(13, 'App\\Models\\User', 40, 'MyApp', 'a0e261dc9e209247b0a34330cc2b25c9b6d772212e27671a077fffda8b044af3', '[\"*\"]', NULL, '2022-05-06 23:42:02', '2022-05-06 23:42:02'),
(14, 'App\\Models\\User', 40, 'MyApp', 'c63168e5bbab4df2f2c53879f30d65e80124599b73c9eea60d0e8c60b0ca511f', '[\"*\"]', NULL, '2022-05-06 23:50:06', '2022-05-06 23:50:06'),
(15, 'App\\Models\\User', 40, 'MyApp', '7326b1e30bcbb315b20a44958d4c9fa44ff9b0f6d850cfc66fa440990dacd71c', '[\"*\"]', NULL, '2022-05-06 23:50:54', '2022-05-06 23:50:54'),
(16, 'App\\Models\\User', 40, 'MyApp', 'f2f8c26356604674616b890cf87b57faddd7f8ce1b46e308f4fefe56f5a76408', '[\"*\"]', NULL, '2022-05-06 23:51:54', '2022-05-06 23:51:54'),
(17, 'App\\Models\\User', 20, 'MyApp', '1421cde9e9730698f64e1404f8dd229d5383caa119f665034ffd2cc2dff9ac56', '[\"*\"]', '2022-05-07 02:18:31', '2022-05-06 23:58:19', '2022-05-07 02:18:31'),
(18, 'App\\Models\\User', 41, 'MyApp', '28035c5a4123cd31bf7df3671aaf583df5ddb42ffcd24d52b6ac1571e5c46afe', '[\"*\"]', NULL, '2022-05-07 06:54:39', '2022-05-07 06:54:39'),
(19, 'App\\Models\\User', 42, 'MyApp', '75c326c6cd68cf9ca72c2defa12e59dc3a8dc83ee66caf8afb76cf1eeff1ff55', '[\"*\"]', NULL, '2022-05-07 06:54:51', '2022-05-07 06:54:51'),
(20, 'App\\Models\\User', 43, 'MyApp', '2ba4b619de841f9462c9dee207f7b34d53d18905de1dcbf504d232f009afd277', '[\"*\"]', NULL, '2022-05-07 06:55:10', '2022-05-07 06:55:10'),
(21, 'App\\Models\\User', 46, 'MyApp', '4ba430656bdc3b1b005617fb4de796db095d8750bdf43ff0420e38ba5fcdeac3', '[\"*\"]', NULL, '2022-05-07 13:07:34', '2022-05-07 13:07:34'),
(22, 'App\\Models\\User', 20, 'MyApp', '1ac39fdaf7675eb3c8273467049cd0cccd45a98c6a527cadeab0c4c0fc69e058', '[\"*\"]', '2022-05-07 13:13:04', '2022-05-07 13:09:45', '2022-05-07 13:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) UNSIGNED NOT NULL,
  `sessions_amount` int(10) UNSIGNED NOT NULL,
  `buyable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyable_id` bigint(20) UNSIGNED NOT NULL,
  `sellable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sellable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gym_id` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `name`, `price`, `sessions_amount`, `buyable_type`, `buyable_id`, `sellable_type`, `sellable_id`, `created_at`, `updated_at`, `gym_id`, `is_paid`) VALUES
(1, 'Basic - Miami Branch', '1000.00', 50, '\\App\\Models\\User', 1, 'App\\Models\\User', 20, NULL, NULL, 1, 0),
(2, 'Premium - Zamalek Branch', '5000.00', 500, '\\App\\Models\\User', 2, 'App\\Models\\User', 22, NULL, NULL, 0, 0),
(3, 'Basic - Miami Branch', '1000.00', 50, '\\App\\Models\\User', 1, 'App\\Models\\User', 20, NULL, NULL, 2, 0),
(5, 'Basic - Miami Branch', '1000.00', 50, 'App\\Models\\User', 3, 'App\\Models\\User', 20, '2022-05-05 18:41:36', '2022-05-05 18:41:36', 2, 0),
(6, 'Basic - Miami Branch', '1000.00', 50, 'App\\Models\\User', 2, 'App\\Models\\User', 20, '2022-05-05 18:45:57', '2022-05-05 18:45:57', 1, 0),
(7, 'Basic - Miami Branch', '1000.00', 50, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-05 18:46:39', '2022-05-05 18:46:39', 3, 0),
(8, 'Basic - Miami Branch', '1000.00', 50, 'App\\Models\\User', 4, 'App\\Models\\User', 20, '2022-05-05 18:47:02', '2022-05-05 18:47:02', 1, 0),
(10, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:06:17', '2022-05-07 01:06:17', 3, 0),
(11, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:08:18', '2022-05-07 01:08:18', 3, 0),
(12, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:10:03', '2022-05-07 01:10:03', 3, 0),
(13, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:13:21', '2022-05-07 01:13:21', 3, 0),
(14, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:13:22', '2022-05-07 01:13:22', 3, 0),
(15, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:17:13', '2022-05-07 01:17:13', 3, 0),
(16, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:20:52', '2022-05-07 01:20:52', 3, 0),
(17, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 01:22:45', '2022-05-07 01:22:45', 3, 1),
(20, 'Basic - Miami Branch', '1000.00', 50, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 08:57:59', '2022-05-07 08:57:59', 3, 0),
(21, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 08:59:36', '2022-05-07 08:59:36', 3, 0),
(22, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 22, '2022-05-07 09:00:51', '2022-05-07 09:00:51', 3, 0),
(23, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 22, '2022-05-07 09:02:25', '2022-05-07 09:02:25', 3, 0),
(24, 'Premium - Zamalek Branch', '5000.00', 500, 'App\\Models\\User', 5, 'App\\Models\\User', 20, '2022-05-07 10:52:16', '2022-05-07 10:52:16', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(7, 'admin', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(8, 'city_manager', 'web', '2022-04-28 17:14:03', '2022-04-28 17:14:03'),
(9, 'gym_manager', 'web', '2022-04-28 20:40:38', '2022-04-28 20:40:38'),
(10, 'coach', 'web', '2022-04-28 20:40:38', '2022-04-28 20:40:38'),
(11, 'member', 'web', '2022-04-28 20:40:38', '2022-04-28 20:40:38');

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
(5, 7),
(6, 7),
(6, 8),
(7, 7),
(7, 8),
(8, 7),
(8, 8),
(8, 9),
(9, 7),
(9, 8),
(9, 9),
(10, 7),
(11, 8),
(11, 9),
(12, 7),
(12, 8),
(13, 7),
(13, 8),
(13, 9),
(14, 7),
(14, 8),
(14, 9),
(15, 7),
(15, 8),
(15, 9),
(16, 7),
(16, 8),
(17, 9);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` datetime DEFAULT NULL,
  `finishes_at` datetime DEFAULT NULL,
  `has_sessions_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_sessions_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `starts_at`, `finishes_at`, `has_sessions_type`, `has_sessions_id`, `created_at`, `updated_at`) VALUES
(1, 'Cardio Session', '2022-05-21 02:38:00', '2022-05-21 04:38:00', 'App\\Models\\Gym', 1, NULL, '2022-05-06 22:38:38'),
(2, 'Zumba session', '2022-05-03 15:00:00', '2022-05-03 17:00:00', 'App\\Models\\Gym', 2, '2022-05-04 07:45:05', '2022-05-04 07:45:05'),
(3, 'MMA session', '2022-05-05 10:00:00', '2022-05-05 12:00:00', 'App\\Models\\Gym', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_user`
--

CREATE TABLE `session_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_date` date DEFAULT NULL,
  `attendance_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_user`
--

INSERT INTO `session_user` (`id`, `created_at`, `updated_at`, `session_id`, `user_id`, `attendance_date`, `attendance_time`) VALUES
(8, NULL, NULL, 2, 22, '2022-05-07', '10:07:21'),
(9, NULL, NULL, 3, 23, NULL, NULL),
(47, '2022-05-06 22:34:23', '2022-05-06 22:34:23', 3, 24, '2022-05-07', '12:06:54'),
(48, '2022-05-06 22:38:38', '2022-05-06 22:38:38', 1, 19, NULL, NULL),
(50, '2022-05-06 22:38:38', '2022-05-06 22:38:38', 1, 21, NULL, NULL),
(59, '2022-05-06 22:38:38', '2022-05-06 22:38:38', 1, 20, NULL, NULL),
(60, NULL, NULL, 2, 19, '2022-05-07', '10:07:21'),
(61, '2022-05-06 22:38:38', '2022-05-06 22:38:38', 1, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manageable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manageable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `national_id`, `avatar_url`, `manageable_type`, `manageable_id`, `remember_token`, `created_at`, `updated_at`, `gender`, `date_of_birth`, `last_login`, `banned_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-02', NULL),
(2, 'cityManager1', 'cityManager1@gmail.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar_female.jpg', 'App\\Models\\City', 1, NULL, NULL, '2022-05-04 01:16:57', NULL, NULL, NULL, NULL),
(3, 'cityManager2', 'cityManager2@gmail.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar.png', 'App\\Models\\City', 2, NULL, NULL, '2022-05-03 07:34:39', NULL, NULL, NULL, NULL),
(4, 'gymManager1', 'gymManager1@gmail.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar.png', 'App\\Models\\Gym', 1, NULL, '2022-05-02 21:00:50', '2022-05-07 11:34:50', NULL, NULL, NULL, NULL),
(5, 'gymManager2', 'gymManager2@gmail.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar_female.jpg', 'App\\Models\\Gym', 3, NULL, '2022-05-02 21:29:51', '2022-05-11 05:11:56', NULL, NULL, NULL, NULL),
(18, 'gymManager3', 'gymManager3@gmail.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar.png', 'App\\Models\\Gym', 1, NULL, '2022-05-03 12:00:47', '2022-05-06 16:16:55', NULL, NULL, NULL, NULL),
(19, 'coach1', 'coach1@gmail.com', NULL, NULL, '12345677654321', 'public/default_avatar_female.jpg', NULL, NULL, NULL, '2022-05-03 12:00:47', '2022-05-03 12:00:47', NULL, NULL, NULL, NULL),
(20, 'member1', 'member1@gmail.com', NULL, '$2y$10$bWh5dxhyc4nqlnQERLWzt.k79ybwNKDbTiiwUPnko22IHuOEK6oMq', '12345677654321', 'public/default_avatar.png', NULL, NULL, NULL, '2022-05-03 12:00:47', '2022-05-07 13:09:45', 'male', '1995-08-23', '2022-05-07', NULL),
(21, 'coach2', 'coach2@gmail.com', NULL, NULL, '12345677654321', 'public/default_avatar.png', NULL, NULL, NULL, '2022-05-03 12:00:47', '2022-05-03 12:00:47', NULL, NULL, NULL, NULL),
(22, 'member2', 'member2@gmail.com', NULL, NULL, '12345677654321', 'public/default_avatar.png', NULL, NULL, NULL, '2022-05-03 12:00:47', '2022-05-03 12:00:47', 'female', '1999-09-13', NULL, NULL),
(23, 'coach3', 'coach3@gmail.com', NULL, NULL, '12345677654321', 'public/default_avatar.png', NULL, NULL, NULL, '2022-05-03 12:00:47', '2022-05-03 12:00:47', NULL, NULL, NULL, NULL),
(24, 'member3', 'member3@gmail.com', NULL, NULL, '12345677654321', 'public/default_avatar_female.jpg', NULL, NULL, NULL, '2022-05-03 12:00:47', '2022-05-03 12:00:47', 'male', '1995-08-23', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bans_bannable_type_bannable_id_index` (`bannable_type`,`bannable_id`),
  ADD KEY `bans_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  ADD KEY `bans_expired_at_index` (`expired_at`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gyms_has_gyms_type_has_gyms_id_index` (`has_gyms_type`,`has_gyms_id`),
  ADD KEY `gyms_creatable_type_creatable_id_index` (`creatable_type`,`creatable_id`);

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
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_has_packages_type_has_packages_id_index` (`has_packages_type`,`has_packages_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_buyable_type_buyable_id_index` (`buyable_type`,`buyable_id`),
  ADD KEY `purchases_sellable_type_sellable_id_index` (`sellable_type`,`sellable_id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_has_sessions_type_has_sessions_id_index` (`has_sessions_type`,`has_sessions_id`);

--
-- Indexes for table `session_user`
--
ALTER TABLE `session_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_manageable_type_manageable_id_index` (`manageable_type`,`manageable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gyms`
--
ALTER TABLE `gyms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `session_user`
--
ALTER TABLE `session_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
