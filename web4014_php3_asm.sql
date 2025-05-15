-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 15, 2025 lúc 06:32 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web4014_php3_asm`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bánh Ngọt', NULL, NULL, NULL),
(2, 'Cookie', NULL, NULL, NULL),
(3, 'Bánh Mì Ngọt', NULL, NULL, NULL),
(4, 'Quag Tặng', NULL, NULL, NULL),
(5, 'Đồ Uống', NULL, NULL, NULL),
(6, 'Bánh Quy', NULL, NULL, NULL),
(11, 'Tổng hợp', NULL, '2025-04-17 09:59:15', '2025-04-17 09:59:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_code` bigint(20) UNSIGNED NOT NULL,
  `user_code` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `updated_at`, `product_code`, `user_code`) VALUES
(1, 'Hay quá anh chị ơi', '2025-04-17 03:00:05', '2025-04-17 03:00:05', 1, 2),
(2, 'Bánh ngon lắm', '2025-04-17 03:02:00', '2025-04-17 03:02:00', 1, 1),
(3, 'Mua thêm cái nữa nè', '2025-04-17 03:03:36', '2025-04-17 03:03:36', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `code` varchar(50) NOT NULL,
  `price_reduction` decimal(10,0) DEFAULT NULL,
  `percentage_discount` int(11) DEFAULT NULL,
  `minimum_order_amount` decimal(10,0) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(161, '0001_01_01_000000_create_users_table', 1),
(162, '0001_01_01_000001_create_cache_table', 1),
(163, '0001_01_01_000002_create_jobs_table', 1),
(164, '2025_04_13_174938_create_categories_table', 1),
(165, '2025_04_13_174939_create_discounts_table', 1),
(166, '2025_04_13_174951_create_products_table', 1),
(167, '2025_04_13_175026_create_orders_table', 1),
(168, '2025_04_13_175210_create_order_details_table', 1),
(169, '2025_04_13_175238_create_comments_table', 1),
(170, '2025_04_13_202406_create_personal_access_tokens_table', 1),
(171, '2025_04_17_073843_create_pays_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `total` decimal(10,0) NOT NULL DEFAULT 0,
  `status` enum('Giỏ hàng','Chờ xác nhận','Đang giao','Giao hàng thành công','Hủy đơn hàng') NOT NULL DEFAULT 'Giỏ hàng',
  `discount_code` varchar(50) DEFAULT NULL,
  `user_code` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `quantity`, `total`, `status`, `discount_code`, `user_code`) VALUES
(1, '2025-04-17 01:13:04', '2025-04-18 05:18:23', 15, 3935000, 'Đang giao', NULL, 1),
(2, '2025-04-17 02:55:35', '2025-04-17 02:56:12', 1014, 334026000, 'Chờ xác nhận', NULL, 1),
(3, '2025-04-17 02:58:52', '2025-04-17 04:33:59', 10100, 2322900000, 'Giao hàng thành công', NULL, 2),
(4, '2025-04-17 03:04:31', '2025-04-18 05:17:52', 22, 6638000, 'Chờ xác nhận', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_code` bigint(20) UNSIGNED NOT NULL,
  `product_code` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_code`, `product_code`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 4, 10, 229000, '2025-04-17 01:13:16', '2025-04-17 01:13:16'),
(1, 5, 5, 329000, '2025-04-17 01:13:05', '2025-04-17 01:13:05'),
(2, 6, 1000, 329000, '2025-04-17 02:55:48', '2025-04-17 02:55:48'),
(2, 11, 14, 359000, '2025-04-17 02:55:36', '2025-04-17 02:55:36'),
(3, 4, 10000, 229000, '2025-04-17 02:58:52', '2025-04-17 02:58:52'),
(3, 7, 100, 329000, '2025-04-17 02:59:03', '2025-04-17 02:59:03'),
(4, 1, 8, 229000, '2025-04-18 05:17:26', '2025-04-18 05:17:35'),
(4, 5, 16, 329000, '2025-04-18 04:59:17', '2025-04-18 05:02:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pays`
--

CREATE TABLE `pays` (
  `order_code` bigint(20) UNSIGNED NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `payment_method` enum('Thẻ Tín Dụng','Paypal','Thanh Toán Khi Nhận Hàng') NOT NULL,
  `total_amount` decimal(10,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pays`
--

INSERT INTO `pays` (`order_code`, `name_user`, `address`, `phone`, `payment_method`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 'fsaf', '2423', '24234', 'Thanh Toán Khi Nhận Hàng', 3965000, '2025-04-17 02:47:40', '2025-04-17 02:47:40'),
(2, 'fawfw', 'dầ', '242423', 'Thanh Toán Khi Nhận Hàng', 334056000, '2025-04-17 02:56:12', '2025-04-17 02:56:12'),
(3, 'fasfs', '2423', '0342277300', 'Thanh Toán Khi Nhận Hàng', 2322930000, '2025-04-17 02:59:15', '2025-04-17 02:59:15'),
(4, 'fawfw', '2423', '0342277300', 'Thanh Toán Khi Nhận Hàng', 7126000, '2025-04-18 05:17:52', '2025-04-18 05:17:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_code` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `quantity`, `description`, `created_at`, `updated_at`, `category_code`) VALUES
(1, 'Bánh Kem Nhân Bắp', 229000, 'Banh-Kem-Bap-Kieu-5.jpg', 3, 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(2, 'Bánh Kem Bắp Kiểu 4', 229000, 'Banh-Kem-Bap-Kieu-4.jpg', 3, 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(3, 'Bánh Kem Bắp Kiểu 3', 229000, 'Banh-Kem-Bap-Kieu-3.jpg', 3, 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(4, 'Bánh Kem Bắp kiểu 2', 229000, 'Banh-Kem-Bap-Kieu-2.jpg', 3, 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(5, 'Bánh Kem Nhân Thơm ', 329000, 'Bk-Thom.jpg', 3, 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(6, 'Bánh Kem Nhân Cam', 329000, 'Banh-Kem-Cam-20-1.jpg', 3, 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(7, 'Bánh Kem Nhân Thơm', 329000, 'Banh-Kem-Thom-10-1.jpg', 3, 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(8, 'Bánh Kem Nhân Thơm', 229000, 'Banh-Kem-Thom-1.jpg', 3, 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(9, 'Bánh Kem Nhân Dâu', 229000, 'Bk-Dau.jpg', 3, 'Bánh kem dâu mang hương vị ngọt ngào, tươi mát từ những quả dâu chín mọng. Lớp kem mịn hoà quyện cùng cốt bánh mềm xốp, điểm xuyết với những lát dâu tươi mọng nước, mang đến cảm giác nhẹ nhàng và đầy hấp dẫn.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(10, 'Bánh Kem Tiramisu', 359000, 'Banh-Kem-Tira-2.jpg', 3, 'Bánh Tiramisu là sự kết hợp tinh tế giữa lớp bánh mềm thấm cà phê đậm đà và kem mascarpone béo mịn, phủ trên cùng là lớp bột cacao thơm lừng. Vị ngọt nhẹ hòa quyện cùng chút đắng nhẹ tạo nên trải nghiệm tuyệt vời cho vị giác.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(11, 'Bánh Kem Tiramisu', 359000, 'Banh-Kem-Tira-Kieu-2.jpg', 3, 'Bánh Tiramisu là sự kết hợp tinh tế giữa lớp bánh mềm thấm cà phê đậm đà và kem mascarpone béo mịn, phủ trên cùng là lớp bột cacao thơm lừng. Vị ngọt nhẹ hòa quyện cùng chút đắng nhẹ tạo nên trải nghiệm tuyệt vời cho vị giác.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(12, 'Bánh Kem Tiramisu', 229000, 'Banh-Kem-Tira-Kieu-3.jpg', 3, 'Bánh Tiramisu là sự kết hợp tinh tế giữa lớp bánh mềm thấm cà phê đậm đà và kem mascarpone béo mịn, phủ trên cùng là lớp bột cacao thơm lừng. Vị ngọt nhẹ hòa quyện cùng chút đắng nhẹ tạo nên trải nghiệm tuyệt vời cho vị giác.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 1),
(13, 'Bánh Quy Hạnh Nhân Savoure', 49000, '4-Version1.jpg', 50, 'Bánh quy hạnh nhân Savouse giòn tan, thơm lừng với hạnh nhân rang bùi béo, ngọt nhẹ. Mỗi chiếc bánh mang đến hương vị tinh tế, dễ chịu, là sự kết hợp hoàn hảo giữa vị ngọt và độ giòn, thích hợp cho những buổi trà chiều thư giãn.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 6),
(14, 'Bánh Macaron Mini', 59000, '3-Version1.jpg', 50, 'Bánh quy Macaron mềm mịn, xốp nhẹ với lớp vỏ giòn tan, bên trong là lớp nhân kem bơ ngọt ngào. Sự kết hợp hoàn hảo giữa các hương vị trái cây, socola hoặc vani mang đến trải nghiệm tuyệt vời cho mọi tín đồ yêu thích sự thanh nhẹ và tinh tế.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 6),
(15, 'Bánh Quy Trái Cây', 69000, '5.jpg', 50, 'Bánh quy trái cây có hương vị ngọt ngào, tươi mát từ các loại trái cây như dâu, cam, chanh, hay nho khô, kết hợp với lớp vỏ giòn tan. Sự kết hợp giữa trái cây tự nhiên và vị ngọt nhẹ tạo nên một món ăn thú vị, thơm ngon', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 6),
(16, 'Bánh Quy Cà Phê', 49000, '1.jpg', 50, 'Bánh quy cà phê là sự kết hợp hoàn hảo giữa hương vị cà phê đậm đà và lớp bánh quy giòn tan. Vị cà phê thơm lừng hòa quyện với độ ngọt nhẹ, tạo nên một món ăn vặt lý tưởng cho những ai yêu thích hương vị đặc trưng của cà phê.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 6),
(17, 'Bánh Quy Socola Hạnh Nhân', 79000, '6-Version1.jpg', 50, 'Bánh quy socola hạnh nhân là sự kết hợp hoàn hảo giữa vị ngọt dịu của socola và hương thơm đặc trưng của hạnh nhân. Lớp vỏ giòn tan, bên trong mềm mịn, khiến mỗi miếng bánh đều đậm đà và hấp dẫn. Đây là món ăn lý tưởng cho những ai yêu thích sự hòa quyện giữa socola và hạnh nhân trong từng hương vị.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 6),
(18, 'Bánh Quy Dừa', 49000, '2-Version2.jpg', 50, 'Bánh quy dừa mang đến hương vị ngọt ngào và thơm mát từ dừa tươi, với lớp vỏ giòn rụm và mùi thơm đặc trưng. Mỗi miếng bánh là sự kết hợp hoàn hảo giữa độ giòn của bánh và vị béo ngậy của dừa, làm hài lòng những tín đồ yêu thích hương vị tự nhiên và thanh nhẹ.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 6),
(19, 'Kem Vani', 19000, 'Kem-Vani.jpg', 50, 'Kem vani mềm mịn, ngọt ngào với hương vị tự nhiên từ vani. Mỗi muỗng kem mang lại cảm giác mát lạnh, thơm ngon và dễ chịu, hòa quyện hoàn hảo giữa sự béo ngậy và vị ngọt dịu dàng. Đây là món tráng miệng lý tưởng cho mọi lứa tuổi, mang đến sự thư giãn và hài lòng cho những tín đồ yêu thích sự đơn giản nhưng tinh tế.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 5),
(20, 'Kem Dâu', 19000, 'Kem-Dau.jpg', 50, 'Kem dâu ngọt ngào và tươi mát, với hương vị thơm lừng của dâu tươi. Mỗi muỗng kem là sự kết hợp hoàn hảo giữa vị ngọt nhẹ và chua thanh, mang đến cảm giác sảng khoái, dễ chịu. Kem dâu mềm mịn, phù hợp với mọi dịp, là sự lựa chọn tuyệt vời cho những ai yêu thích sự tươi mới và ngọt ngào từ trái dâu tự nhiên.', '2025-04-17 01:11:04', '2025-04-17 01:11:04', 5),
(21, 'Bánh Kem', 25000, 'fafa', 1, 'àdas', NULL, '2025-04-17 11:15:24', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('active','block') NOT NULL DEFAULT 'active',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `address`, `role`, `email`, `password`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'chanh', NULL, NULL, 'active', 'chanh@gmail.com', '$2y$12$Zw3RKd66NOMGP612/39bqOOB7Rhlmy0ZiYdjr71W24TgckSWJvpze', NULL, NULL, '2025-04-17 01:12:44', '2025-04-17 01:12:44'),
(2, 'Linh Trần', NULL, NULL, 'active', 'linhtran@gmail.com', '$2y$12$4GOWynaucFNLMfvlsckGGOpxvVFW.rsL6qXM0EKlLbVuSYMYFp3Ea', NULL, NULL, '2025-04-17 02:58:32', '2025-04-17 02:58:32');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_code_foreign` (`product_code`),
  ADD KEY `comments_user_code_foreign` (`user_code`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_discount_code_foreign` (`discount_code`),
  ADD KEY `orders_user_code_foreign` (`user_code`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_code`,`product_code`),
  ADD KEY `order_details_product_code_foreign` (`product_code`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`order_code`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_code_foreign` (`category_code`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_code_foreign` FOREIGN KEY (`product_code`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_user_code_foreign` FOREIGN KEY (`user_code`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_discount_code_foreign` FOREIGN KEY (`discount_code`) REFERENCES `discounts` (`code`),
  ADD CONSTRAINT `orders_user_code_foreign` FOREIGN KEY (`user_code`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_code_foreign` FOREIGN KEY (`order_code`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_code_foreign` FOREIGN KEY (`product_code`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `pays_order_code_foreign` FOREIGN KEY (`order_code`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_code_foreign` FOREIGN KEY (`category_code`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
