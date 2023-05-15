-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 10:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paystar`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ابعاد', '2023-05-13 08:27:26', '2023-05-13 08:27:26'),
(2, 'وزن', '2023-05-13 08:28:48', '2023-05-13 08:28:48'),
(3, 'ظرفیت حافظه', '2023-05-13 08:29:01', '2023-05-13 08:29:01'),
(4, 'تعداد سیم کارت', '2023-05-13 08:29:13', '2023-05-13 08:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_category`
--

CREATE TABLE `attribute_category` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `is_filter` tinyint(1) NOT NULL DEFAULT 0,
  `is_variation` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_category`
--

INSERT INTO `attribute_category` (`attribute_id`, `category_id`, `is_filter`, `is_variation`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, NULL, NULL),
(1, 3, 0, 0, NULL, NULL),
(2, 3, 0, 0, NULL, NULL),
(3, 3, 1, 1, NULL, NULL),
(4, 3, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `button_icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `title`, `text`, `priority`, `is_active`, `type`, `button_text`, `button_link`, `button_icon`, `created_at`, `updated_at`) VALUES
(1, '2023_2_24_2_6_6_819162.jpg', 'اسلایدر1', 'متن اسلایدر 1', 1, 1, 'slider', 'دکمه', '#', NULL, '2023-02-23 22:36:07', '2023-02-23 22:36:07'),
(2, '2023_2_24_2_6_46_260206.jpg', 'اسلایدر 2', 'متن اسلایدر 2', 2, 1, 'slider', 'دکمه', '#', NULL, '2023-02-23 22:36:46', '2023-02-23 22:36:46'),
(3, '2023_2_24_2_7_38_307627.png', 'تاپ1', 'متن تاپ 1', 1, 1, 'index-top', 'دکمه', '#', NULL, '2023-02-23 22:37:38', '2023-02-23 22:37:38'),
(4, '2023_2_24_2_9_56_631146.png', 'بنر بالایی 1', 'متن تاپ 2', 2, 1, 'index-top', 'دکمه', '#', NULL, '2023-02-23 22:39:56', '2023-02-23 22:39:56'),
(5, '2023_2_24_3_29_59_11554.png', 'تاپ3', 'تاپ3', 3, 1, 'index-top', 'دکمه', '#', NULL, '2023-02-23 23:59:59', '2023-02-23 23:59:59'),
(6, '2023_2_24_3_30_26_878461.png', 'تاپ4', '444444444', 4, 1, 'index-top', NULL, '#', NULL, '2023-02-24 00:00:26', '2023-02-24 00:00:26'),
(7, '2023_2_24_3_31_6_251502.png', 'تاپ5', '55555555', 5, 1, 'index-top', 'دکمه', '#', NULL, '2023-02-24 00:01:06', '2023-02-24 00:01:06'),
(8, '2023_2_24_3_32_28_330190.png', 'پایین1', '111111111', 1, 1, 'index-bottom', 'دکمه', '#', NULL, '2023-02-24 00:02:28', '2023-02-24 00:02:28'),
(9, '2023_2_24_3_53_43_132794.png', 'پایین222', '222222222', 2, 1, 'index-bottom', 'دکمه', '#', NULL, '2023-02-24 00:02:56', '2023-02-24 00:23:43'),
(10, '2023_2_24_3_31_6_251502.png', 'تاپ5', '55555555', 5, 1, 'index-top', 'دکمه', '#', NULL, '2023-02-24 00:01:06', '2023-02-24 00:01:06'),
(11, '2023_2_24_3_32_28_330190.png', 'پایین1', '111111111', 1, 1, 'index-bottom', 'دکمه', '#', NULL, '2023-02-24 00:02:28', '2023-02-24 00:02:28'),
(12, '2023_2_24_3_53_43_132794.png', 'پایین222', '222222222', 2, 1, 'index-bottom', 'دکمه', '#', NULL, '2023-02-24 00:02:56', '2023-02-24 00:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'سامسونگ', 'سامسونگ', 1, '2023-05-13 08:26:52', '2023-05-13 08:26:52'),
(2, 'اپل', 'اپل', 1, '2023-05-13 08:27:05', '2023-05-13 08:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `is_active`, `icon`, `created_at`, `updated_at`) VALUES
(2, 0, 'کالای دیجیتال', 'digitals', NULL, 1, NULL, '2023-05-13 08:28:23', '2023-05-13 08:28:23'),
(3, 2, 'موبایل', 'mobile', NULL, 1, NULL, '2023-05-13 08:30:10', '2023-05-13 08:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `province_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `province_id`, `created_at`, `updated_at`) VALUES
(1, 'اسکو', 'اسکو', 1, NULL, NULL),
(2, 'اهر', 'اهر', 1, NULL, NULL),
(3, 'ایلخچی', 'ایلخچی', 1, NULL, NULL),
(4, 'آبش احمد', 'آبش-احمد', 1, NULL, NULL),
(5, 'آذرشهر', 'آذرشهر', 1, NULL, NULL),
(6, 'آقکند', 'آقکند', 1, NULL, NULL),
(7, 'باسمنج', 'باسمنج', 1, NULL, NULL),
(8, 'بخشایش', 'بخشایش', 1, NULL, NULL),
(9, 'بستان آباد', 'بستان-آباد', 1, NULL, NULL),
(10, 'بناب', 'بناب', 1, NULL, NULL),
(11, 'بناب جدید', 'بناب-جدید', 1, NULL, NULL),
(12, 'تبریز', 'تبریز', 1, NULL, NULL),
(13, 'ترک', 'ترک', 1, NULL, NULL),
(14, 'ترکمانچای', 'ترکمانچای', 1, NULL, NULL),
(15, 'تسوج', 'تسوج', 1, NULL, NULL),
(16, 'تیکمه داش', 'تیکمه-داش', 1, NULL, NULL),
(17, 'جلفا', 'جلفا', 1, NULL, NULL),
(18, 'خاروانا', 'خاروانا', 1, NULL, NULL),
(19, 'خامنه', 'خامنه', 1, NULL, NULL),
(20, 'خراجو', 'خراجو', 1, NULL, NULL),
(21, 'خسروشهر', 'خسروشهر', 1, NULL, NULL),
(22, 'خضرلو', 'خضرلو', 1, NULL, NULL),
(23, 'خمارلو', 'خمارلو', 1, NULL, NULL),
(24, 'خواجه', 'خواجه', 1, NULL, NULL),
(25, 'دوزدوزان', 'دوزدوزان', 1, NULL, NULL),
(26, 'ارجمند', 'ارجمند', 8, NULL, NULL),
(27, 'اسلامشهر', 'اسلامشهر', 8, NULL, NULL),
(28, 'اندیشه', 'اندیشه', 8, NULL, NULL),
(29, 'آبسرد', 'آبسرد', 8, NULL, NULL),
(30, 'آبعلی', 'آبعلی', 8, NULL, NULL),
(31, 'باغستان', 'باغستان', 8, NULL, NULL),
(32, 'باقرشهر', 'باقرشهر', 8, NULL, NULL),
(33, 'بومهن', 'بومهن', 8, NULL, NULL),
(34, 'پاکدشت', 'پاکدشت', 8, NULL, NULL),
(35, 'پردیس', 'پردیس', 8, NULL, NULL),
(36, 'پیشوا', 'پیشوا', 8, NULL, NULL),
(37, 'تهران', 'تهران', 8, NULL, NULL),
(38, 'جوادآباد', 'جوادآباد', 8, NULL, NULL),
(39, 'چهاردانگه', 'چهاردانگه', 8, NULL, NULL),
(40, 'حسن آباد', 'تهران-حسن-آباد', 8, NULL, NULL),
(41, 'دماوند', 'دماوند', 8, NULL, NULL),
(42, 'دیزین', 'دیزین', 8, NULL, NULL),
(43, 'شهر ری', 'شهر-ری', 8, NULL, NULL),
(44, 'رباط کریم', 'رباط-کریم', 8, NULL, NULL),
(45, 'رودهن', 'رودهن', 8, NULL, NULL),
(46, 'شاهدشهر', 'شاهدشهر', 8, NULL, NULL),
(47, 'شریف آباد', 'شریف-آباد', 8, NULL, NULL),
(48, 'شمشک', 'شمشک', 8, NULL, NULL),
(49, 'شهریار', 'شهریار', 8, NULL, NULL),
(50, 'صالح آباد', 'تهران-صالح-آباد', 8, NULL, NULL),
(51, 'صباشهر', 'صباشهر', 8, NULL, NULL),
(52, 'صفادشت', 'صفادشت', 8, NULL, NULL),
(53, 'فردوسیه', 'فردوسیه', 8, NULL, NULL),
(54, 'فشم', 'فشم', 8, NULL, NULL),
(55, 'فیروزکوه', 'فیروزکوه', 8, NULL, NULL),
(56, 'قدس', 'قدس', 8, NULL, NULL),
(57, 'قرچک', 'قرچک', 8, NULL, NULL),
(58, 'کهریزک', 'کهریزک', 8, NULL, NULL),
(59, 'کیلان', 'کیلان', 8, NULL, NULL),
(60, 'گلستان', 'شهر-گلستان', 8, NULL, NULL),
(61, 'لواسان', 'لواسان', 8, NULL, NULL),
(62, 'ملارد', 'ملارد', 8, NULL, NULL),
(63, 'میگون', 'میگون', 8, NULL, NULL),
(64, 'نسیم شهر', 'نسیم-شهر', 8, NULL, NULL),
(65, 'نصیرآباد', 'نصیرآباد', 8, NULL, NULL),
(66, 'وحیدیه', 'وحیدیه', 8, NULL, NULL),
(67, 'ورامین', 'ورامین', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('amount','percentage') NOT NULL,
  `amount` int(10) UNSIGNED DEFAULT NULL,
  `percentage` int(10) UNSIGNED DEFAULT NULL,
  `max_percentage_amount` int(10) UNSIGNED DEFAULT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_11_09_220548_create_categories_table', 1),
(6, '2020_11_09_220804_create_brands_table', 1),
(7, '2020_11_09_221214_create_products_table', 1),
(8, '2020_11_09_222039_create_product_images_table', 1),
(9, '2020_11_09_222339_create_tags_table', 1),
(10, '2020_11_09_222445_create_product_tag_table', 1),
(11, '2020_11_09_222702_create_comments_table', 1),
(12, '2020_11_09_222936_create_product_rates_table', 1),
(13, '2020_11_09_223804_create_attributes_table', 1),
(14, '2020_11_09_223859_create_attribute_category_table', 1),
(15, '2020_11_09_224450_create_product_attributes_table', 1),
(16, '2020_11_09_224628_create_product_variations_table', 1),
(17, '2020_11_09_225344_create_provinces_table', 1),
(18, '2020_11_09_225443_create_cities_table', 1),
(19, '2020_11_09_225601_create_user_addresses_table', 1),
(20, '2020_11_09_230209_create_coupons_table', 1),
(21, '2020_11_09_230759_create_orders_table', 1),
(22, '2020_11_09_231450_create_order_items_table', 1),
(23, '2020_11_09_231708_create_transactions_table', 1),
(24, '2020_11_09_232304_create_wishlist_table', 1),
(25, '2020_11_09_232426_create_banners_table', 1),
(26, '2020_11_09_232647_create_contact_us_table', 1),
(27, '2020_11_09_232749_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `total_amount` int(10) UNSIGNED NOT NULL,
  `delivery_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `coupon_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paying_amount` int(10) UNSIGNED NOT NULL,
  `payment_type` enum('pos','cash','shabaNumber','cardToCard','online') NOT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `subtotal` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `primary_image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `delivery_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delivery_amount_per_product` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand_id`, `category_id`, `slug`, `primary_image`, `description`, `status`, `is_active`, `delivery_amount`, `delivery_amount_per_product`, `created_at`, `updated_at`) VALUES
(1, 'سامسونگ a51', 1, 3, 'سامسونگ-a51', 'primary.jpg', 'توضیحات سامسونگ a51 در این قسمت \r\nتوضیحات سامسونگ a51 در این قسمت \r\nتوضیحات سامسونگ a51 در این قسمت \r\nتوضیحات سامسونگ a51 در این قسمت', 1, 1, 0, 50, '2023-05-13 08:40:32', '2023-05-13 08:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `attribute_id`, `product_id`, `value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1*5', 1, '2023-05-13 08:40:32', '2023-05-13 08:40:32'),
(2, 2, 1, '250g', 1, '2023-05-13 08:40:32', '2023-05-13 08:40:32'),
(3, 4, 1, '2', 1, '2023-05-13 08:40:32', '2023-05-13 08:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '2023_5_13_13_10_32_124530.jpg', '2023-05-13 08:40:32', '2023-05-13 08:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_rates`
--

CREATE TABLE `product_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`tag_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sku` varchar(255) DEFAULT NULL,
  `sale_price` int(10) UNSIGNED DEFAULT NULL,
  `date_on_sale_from` timestamp NULL DEFAULT NULL,
  `date_on_sale_to` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `attribute_id`, `product_id`, `value`, `price`, `quantity`, `sku`, `sale_price`, `date_on_sale_from`, `date_on_sale_to`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '128 GB', 5000, 10, '111', NULL, NULL, NULL, '2023-05-13 08:40:32', '2023-05-13 08:40:32'),
(2, 3, 1, '256 GB', 5500, 8, '112', NULL, NULL, NULL, '2023-05-13 08:40:32', '2023-05-13 08:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'آذربایجان شرقی', 'آذربایجان-شرقی', NULL, NULL),
(2, 'آذربایجان غربی', 'آذربایجان-غربی', NULL, NULL),
(3, 'اردبیل', 'اردبیل', NULL, NULL),
(4, 'اصفهان', 'اصفهان', NULL, NULL),
(5, 'البرز', 'البرز', NULL, NULL),
(6, 'ایلام', 'ایلام', NULL, NULL),
(7, 'بوشهر', 'بوشهر', NULL, NULL),
(8, 'تهران', 'تهران', NULL, NULL),
(9, 'چهارمحال و بختیاری', 'چهارمحال-بختیاری', NULL, NULL),
(10, 'خراسان جنوبی', 'خراسان-جنوبی', NULL, NULL),
(11, 'خراسان رضوی', 'خراسان-رضوی', NULL, NULL),
(12, 'خراسان شمالی', 'خراسان-شمالی', NULL, NULL),
(13, 'خوزستان', 'خوزستان', NULL, NULL),
(14, 'زنجان', 'زنجان', NULL, NULL),
(15, 'سمنان', 'سمنان', NULL, NULL),
(16, 'سیستان و بلوچستان', 'سیستان-بلوچستان', NULL, NULL),
(17, 'فارس', 'فارس', NULL, NULL),
(18, 'قزوین', 'قزوین', NULL, NULL),
(19, 'قم', 'قم', NULL, NULL),
(20, 'کردستان', 'کردستان', NULL, NULL),
(21, 'کرمان', 'کرمان', NULL, NULL),
(22, 'کرمانشاه', 'کرمانشاه', NULL, NULL),
(23, 'کهگیلویه و بویراحمد', 'کهگیلویه-بویراحمد', NULL, NULL),
(24, 'گلستان', 'گلستان', NULL, NULL),
(25, 'لرستان', 'لرستان', NULL, NULL),
(26, 'گیلان', 'گیلان', NULL, NULL),
(27, 'مازندران', 'مازندران', NULL, NULL),
(28, 'مرکزی', 'مرکزی', NULL, NULL),
(29, 'هرمزگان', 'هرمزگان', NULL, NULL),
(30, 'همدان', 'همدان', NULL, NULL),
(31, 'یزد', 'یزد', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `telephone2` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'samsung', '2023-05-13 08:36:22', '2023-05-13 08:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `gateway_name` enum('zarinpal','pay','paystar') NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cellphone` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `card_number` bigint(16) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `login_token` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `cellphone`, `otp`, `card_number`, `avatar`, `status`, `email`, `email_verified_at`, `login_token`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `provider_name`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, '09386366843', '497838', 5022291084033164, NULL, 1, NULL, NULL, '$2y$10$OAp2WNWgF9W/g3rblnSThecIzZJPMWfq92WLh1QZSg2kWXFWR4FRy', NULL, NULL, NULL, NULL, NULL, 'GeuZWIp8JjBc3C5svKOQOxPMJK8KNmLqp7Wdht4RqKNDlHikKnxmHRaMnrb2', '2023-05-13 13:59:02', '2023-05-15 18:54:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `title`, `address`, `postal_code`, `user_id`, `province_id`, `city_id`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(1, 'الماس', 'تهران، بلوار آیت الله کاشانی، خیابان بهنام، نبش وحدت، پلاک 1، طبقه دوم، واحد12', '1471885177', 1, 8, 37, NULL, NULL, '2023-05-13 14:18:31', '2023-05-13 14:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-05-15 19:52:18', '2023-05-15 19:52:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_category`
--
ALTER TABLE `attribute_category`
  ADD PRIMARY KEY (`attribute_id`,`category_id`),
  ADD KEY `attribute_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_province_id_foreign` (`province_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_variation_id_foreign` (`product_variation_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_rates`
--
ALTER TABLE `product_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_rates_user_id_foreign` (`user_id`),
  ADD KEY `product_rates_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`tag_id`,`product_id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_attribute_id_foreign` (`attribute_id`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_cart_unique` (`card_number`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_rates`
--
ALTER TABLE `product_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_category`
--
ALTER TABLE `attribute_category`
  ADD CONSTRAINT `attribute_category_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_rates`
--
ALTER TABLE `product_rates`
  ADD CONSTRAINT `product_rates_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_rates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
