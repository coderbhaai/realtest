-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 20, 2021 at 03:08 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reales`
--

-- --------------------------------------------------------

--
-- Table structure for table `basics`
--

CREATE TABLE `basics` (
  `id` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tab1` varchar(255) DEFAULT NULL,
  `tab2` varchar(255) DEFAULT NULL,
  `tab3` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basics`
--

INSERT INTO `basics` (`id`, `type`, `name`, `tab1`, `tab2`, `tab3`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 'Basic', NULL, NULL, NULL, '2021-06-03 12:07:38', '2021-06-03 12:07:38'),
(2, 'Basic', 'Category', NULL, NULL, NULL, '2021-06-03 12:07:38', '2021-06-03 12:30:28'),
(3, 'Basic', 'Tag', NULL, NULL, NULL, '2021-06-03 12:07:38', '2021-06-03 12:07:38'),
(4, 'Category', 'Cat Name A', 'cat-name-a', NULL, NULL, '2021-06-03 12:07:38', '2021-06-03 12:17:12'),
(5, 'Category', 'Cat Name B', 'cat-name-b', NULL, NULL, '2021-06-03 12:17:12', '2021-06-03 12:17:12'),
(6, 'Tag', 'Tag Name A', 'tag-name-a', NULL, NULL, '2021-06-03 12:17:12', '2021-06-03 12:17:12'),
(7, 'Tag', 'Tag Name B', 'tag-name-b1', NULL, NULL, '2021-06-03 12:17:12', '2021-06-03 12:17:12'),
(8, 'Category', 'Cat Name C', 'cat-name-c', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(9, 'Category', 'Cat Name D', 'cat-name-d', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(10, 'Category', 'Cat Name E', 'cat-name-e', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(11, 'Category', 'Cat Name F', 'cat-name-f', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(12, 'Tag', 'Tag Name C', 'tag-name-c', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(13, 'Tag', 'Tag Name D', 'tag-name-d', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(14, 'Tag', 'Tag Name E', 'tag-name-e', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(15, 'Tag', 'Tag Name F', 'tag-name-f', NULL, NULL, '2021-06-03 13:39:49', '2021-06-03 13:39:49'),
(16, 'Basic', 'Property Type', NULL, NULL, NULL, '2021-06-04 03:15:38', '2021-06-04 03:15:38'),
(17, 'Property Type', 'Apartment', NULL, NULL, NULL, '2021-06-04 03:15:38', '2021-06-04 03:15:38'),
(18, 'Property Type', 'Plot', NULL, NULL, NULL, '2021-06-04 03:15:38', '2021-06-04 03:15:38'),
(19, 'Property Type', 'Villa', NULL, NULL, NULL, '2021-06-04 03:15:38', '2021-06-04 03:15:38'),
(20, 'Property Type', 'Flat', NULL, NULL, NULL, '2021-06-04 03:15:38', '2021-06-04 03:15:38'),
(21, 'Property Type', 'Bungalow', NULL, NULL, NULL, '2021-06-04 03:15:38', '2021-06-04 03:15:38'),
(22, 'Basic', 'Amenities', NULL, NULL, NULL, '2021-06-04 03:38:58', '2021-06-04 03:38:58'),
(23, 'Amenities', 'Swimming Pool', '3', NULL, NULL, '2021-06-04 04:24:41', '2021-06-24 02:13:26'),
(24, 'Amenities', 'Golf Course', '4', NULL, NULL, '2021-06-04 04:33:05', '2021-06-24 02:13:26'),
(25, 'Amenities', 'Parking', '5', NULL, NULL, '2021-06-04 04:34:49', '2021-06-24 02:13:26'),
(26, 'Amenities', 'Golf Course', '6', NULL, NULL, '2021-06-04 04:35:31', '2021-06-24 02:13:26'),
(27, 'Amenities', 'Garden', '7', NULL, NULL, '2021-06-04 04:40:50', '2021-06-24 02:13:26'),
(28, 'Amenities', 'Security', '8', NULL, NULL, '2021-06-04 04:40:50', '2021-06-24 02:13:26'),
(29, 'Basic', 'Property Tags', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(30, 'Property Tags', 'High Rise', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(31, 'Property Tags', 'Posh Location', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(32, 'Property Tags', 'Party Area', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(33, 'Property Tags', 'Silence Zone', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(34, 'Property Tags', 'Greenery', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(35, 'Property Tags', 'High Security', '', '', '', '2021-06-04 06:03:46', '2021-06-04 06:03:46'),
(36, 'Basic', 'Why', '', '', '', '2021-06-05 02:13:30', '2021-06-05 02:13:30'),
(37, 'Why', 'Cost Effective', 'This is very very cost effective', '', '', '2021-06-05 02:13:30', '2021-06-05 02:13:30'),
(38, 'Why', 'Free Parking', 'This is very very Free Parking', '', '', '2021-06-05 02:13:30', '2021-06-05 02:13:30'),
(39, 'Why', 'Security', 'This is very very Security', '', '', '2021-06-05 02:13:30', '2021-06-05 02:13:30'),
(40, 'Why', 'healthy enevironemnt', 'This is very very healthy enevironemnt', '', '', '2021-06-05 02:13:30', '2021-06-05 02:13:30'),
(41, 'Why', 'Good crowd', 'This is very very Good crowd', '', '', '2021-06-05 02:13:30', '2021-06-05 02:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `coverImg` varchar(255) NOT NULL,
  `tag` mediumtext NOT NULL,
  `category` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `url`, `content`, `coverImg`, `tag`, `category`, `created_at`, `updated_at`) VALUES
(1, 'qqqqqqq', 'wwwwwwww', 'aaaaaaaaaaaaaaaaa', '1', '[6,7]', '[4,5]', '2021-06-03 13:26:17', '2021-06-23 09:46:42'),
(2, 'wwwwww', 'eeee', 'rrrrrrrrrrrrrrr', '2', '[7,13,15,12,6,14]', '[4,8,10,5,9,11]', '2021-06-03 13:27:35', '2021-06-23 09:46:42'),
(3, 'Blog Title 3', 'blog-title-3', 'Blog Title 3', '355', '[12,14,7]', '[4,5,8,11]', '2021-06-13 05:00:33', '2021-06-23 09:46:42'),
(4, 'Blog Title 4', 'blog-title-4', 'Blog Title 4', '356', '[12,14,7]', '[4,5,8,11]', '2021-06-13 05:00:33', '2021-06-23 09:46:42'),
(5, 'Blog Title 5', 'blog-title-5', 'Blog Title 5', '357', '[12,14,7]', '[4,5,8,11]', '2021-06-13 05:03:28', '2021-06-23 09:46:42'),
(6, 'Blog Title 6', 'blog-title-6', 'Blog Title 6', '358', '[12,14,7]', '[4,5,8,11]', '2021-06-13 05:04:53', '2021-06-23 09:46:42'),
(7, 'Blog Title 7', 'blog-title-7', 'Blog Title 7', '359', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(8, 'Blog Title 8', 'blog-title-8', 'Blog Title 8', '360', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(9, 'Blog Title 9', 'blog-title-9', 'Blog Title 9', '361', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(10, 'Blog Title 10', 'blog-title-10', 'Blog Title 10', '362', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(11, 'Blog Title 11', 'blog-title-11', 'Blog Title 11', '363', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(12, 'Blog Title 12', 'blog-title-12', 'Blog Title 12', '364', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(13, 'Blog Title 13', 'blog-title-13', 'Blog Title 13', '365', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(14, 'Blog Title 14', 'blog-title-14', 'Blog Title 14', '366', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(15, 'Blog Title 15', 'blog-title-15', 'Blog Title 15', '367', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(16, 'Blog Title 16', 'blog-title-16', 'Blog Title 16', '368', '[6,7,14,15,13,12]', '[4,10,11,5,9]', '2021-06-13 05:05:32', '2021-06-23 11:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `builders`
--

CREATE TABLE `builders` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `brochure` varchar(255) DEFAULT NULL,
  `shortdesc` mediumtext NOT NULL,
  `longdesc` mediumtext,
  `address` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `builders`
--

INSERT INTO `builders` (`id`, `name`, `url`, `email`, `phone`, `logo`, `brochure`, `shortdesc`, `longdesc`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'aaaaaaa', 'bbbb', 'test@test.com', '123456798', '351', '352', '1111111111111', '2222222222222222222', '[\"India\",\"Haryana\",\"Gurgaon\",\"1172\"]', 1, '2021-06-10 04:52:17', '2021-06-10 05:34:14'),
(2, 'bbbbbbbbb', 'bb-bb-bb', 'test@test.com2', '1234567890', '353', '354', 'qqqqqqqqqqqqqqqq', 'wwwwwwwwwwwwwwwwwwww', '[\"India\",\"Haryana\",\"GGN\",\"1172\"]', 1, '2021-06-10 05:34:14', '2021-06-10 05:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `blogId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_order` int(11) NOT NULL,
  `commentId` int(11) NOT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `blogId`, `c_order`, `commentId`, `user`, `email`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, '16', 0, 0, 'Amber Ball', 'amber.ball777@gmail.com', '<p>SEO is not the same as it was ten years ago. Today Google focuses more on the user experience. And announces it as an important factor for the SEO 2021 ranking. Now, webmasters are very curious about the value they can offer to the user. The points you highlighted are really important, as it increases the page speed. This has a direct impact on user experience. For the optimization of your page, you can also refer to the following link https://url-decode.com/cat/ where you will find tools related to minification, image optimization, and many others.</p>\n', '1', '2020-08-04 03:48:44', '2021-06-28 01:07:31'),
(2, '16', 1, 1, 'AmitKK', 'amit@amitkk.com', '<p>Nice website Amber. A lot of work must have gone in it.</p>\n\n<p>Handy website for users.</p>\n', '1', '2020-08-30 08:33:38', '2021-06-28 01:07:31'),
(3, '16', 0, 0, 'asdas', 'admin@example.com', '<p>sadas</p>\n', '1', '2021-04-05 13:29:22', '2021-06-28 01:07:31'),
(4, '16', 0, 0, 'chandan Singh', 'teamchandansingh@gmail.com', '<p>we are very grateful to you for this information and we hope that will continue to give us similar information. tsm13.com</p>\n', '1', '2021-05-06 02:57:41', '2021-06-28 01:07:31'),
(5, '16', 0, 0, 'Amit', 'amit.khare588@gmail.com', 'eeeeeeeeeeeeeeeeeeeeee', '1', '2021-06-27 09:27:32', '2021-06-28 01:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `message` mediumtext,
  `remarks` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `email`, `phone`, `url`, `status`, `message`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'Amit', 'amit.khare588@gmail.com', '123456789', '/property/2222222222222', 0, 'test', '2222222222222222', '2021-06-24 03:49:36', '2021-06-27 09:01:45'),
(2, 'Amit', 'amit@amikk.com', '1245689', '/property/2222222222222', 1, 'test2', '11111111111', '2021-06-24 03:49:36', '2021-06-27 09:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `caption` varchar(255) DEFAULT NULL,
  `fileURL` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `image`, `alt`, `description`, `caption`, `fileURL`, `title`, `created_at`, `updated_at`) VALUES
(1, '1624461537808-seo-trends.jpg', NULL, NULL, NULL, '/blog/1624461537808-seo-trends.jpg', NULL, '2021-06-03 13:26:17', '2021-06-23 09:46:42'),
(2, '1624461532278-ppc-services-company.jpg', NULL, NULL, NULL, '/blog/1624461532278-ppc-services-company.jpg', NULL, '2021-06-03 13:27:35', '2021-06-27 08:56:09'),
(3, '1624520981407-brand-strategy-tips-for-new-businesses.jpg', 'Swimming pool alt', 'Swimming pool description', 'Swimming pool caption', '/amenities/1624520981407-brand-strategy-tips-for-new-businesses.jpg', 'Swimming pool title', '2021-06-04 04:40:50', '2021-06-27 07:12:31'),
(4, '1624520986877-creating-a-website-for-your-business.jpg', 'alt2222222', 'description 2222222', 'caption222222222', '/amenities/1624520986877-creating-a-website-for-your-business.jpg', 'title222222', '2021-06-04 04:40:50', '2021-06-27 07:12:31'),
(5, '1624521004942-different-types-of-digital-marketing.jpg', NULL, NULL, NULL, '/amenities/1624521004942-different-types-of-digital-marketing.jpg', NULL, '2021-06-04 11:19:20', '2021-06-24 02:13:26'),
(6, '1624521011266-graphic-designing-company-in-delhi.jpg', NULL, NULL, NULL, '/amenities/1624521011266-graphic-designing-company-in-delhi.jpg', NULL, '2021-06-04 11:19:20', '2021-06-24 02:13:26'),
(7, '1624521017650-how-do-I-promote-my-blog-on-social-media.jpg', NULL, NULL, NULL, '/amenities/1624521017650-how-do-I-promote-my-blog-on-social-media.jpg', NULL, '2021-06-04 11:19:57', '2021-06-24 02:13:26'),
(8, '1624521023368-how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/amenities/1624521023368-how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-04 11:19:57', '2021-06-24 02:13:26'),
(9, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(10, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(11, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(12, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(13, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(14, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(15, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(16, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(17, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(18, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(19, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(20, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(21, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(22, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(23, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(24, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(25, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(26, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(27, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(28, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(29, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(30, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(31, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(32, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:12:59', '2021-06-05 11:12:59'),
(33, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(34, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(35, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(36, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(37, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(38, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(39, '1623259476414-online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/blocks/1623259476414-online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-09 11:54:17'),
(40, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(41, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(42, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(43, '1623259321504-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/brochure/1623259321504-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-09 11:51:40'),
(44, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(45, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(46, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(47, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(48, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(49, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(50, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(51, '1623262398767-online-digital-marketing.jpg', NULL, NULL, NULL, '/property/blocks/1623262398767-online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-09 12:03:00'),
(52, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(53, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(54, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(55, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(56, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(57, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(58, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(59, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(60, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(61, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(62, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(63, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(64, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(65, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(66, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(67, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(68, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(69, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(70, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(71, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(72, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(73, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(74, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(75, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(76, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(77, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(78, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(79, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(80, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(81, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(82, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(83, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(84, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(85, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(86, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(87, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(88, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(89, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(90, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(91, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(92, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(93, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(94, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(95, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(96, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(97, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(98, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(99, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(100, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(101, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(102, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(103, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(104, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(105, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(106, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(107, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(108, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(109, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(110, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(111, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(112, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(113, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(114, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(115, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(116, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(117, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(118, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(119, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(120, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(121, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(122, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(123, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(124, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(125, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(126, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(127, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(128, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(129, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(130, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(131, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(132, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(133, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(134, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(135, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(136, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(137, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(138, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(139, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(140, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(141, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(142, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(143, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(144, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(145, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(146, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(147, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(148, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(149, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(150, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(151, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(152, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(153, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(154, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(155, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(156, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(157, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(158, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(159, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(160, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(161, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(162, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(163, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(164, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(165, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(166, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(167, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(168, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(169, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(170, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(171, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(172, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(173, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(174, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(175, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(176, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(177, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(178, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(179, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(180, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(181, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(182, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(183, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(184, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(185, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(186, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(187, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(188, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(189, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(190, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(191, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(192, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(193, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(194, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(195, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(196, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(197, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(198, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(199, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(200, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(201, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(202, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(203, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(204, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(205, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(206, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(207, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(208, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(209, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(210, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(211, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(212, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(213, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(214, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(215, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(216, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(217, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(218, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(219, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(220, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(221, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(222, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(223, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(224, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(225, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(226, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(227, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(228, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(229, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(230, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(231, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(232, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(233, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(234, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(235, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(236, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(237, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(238, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(239, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(240, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(241, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(242, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(243, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(244, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(245, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(246, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(247, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(248, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(249, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(250, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(251, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(252, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(253, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(254, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(255, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(256, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(257, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(258, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(259, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(260, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(261, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(262, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(263, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(264, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(265, 'hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/banner/hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(266, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(267, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(268, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(269, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(270, 'how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/property/pics/how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(271, 'how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(272, 'how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/pics/how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37');
INSERT INTO `media` (`id`, `image`, `alt`, `description`, `caption`, `fileURL`, `title`, `created_at`, `updated_at`) VALUES
(273, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(274, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(275, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(276, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(277, '1624468011203-online-benefits-of-ppc-advertising.jpg', NULL, NULL, NULL, '/property/banner/1624468011203-online-benefits-of-ppc-advertising.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(278, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(279, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(280, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(281, 'online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/blocks/online-image-optimisation-in-website.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(282, '1624468047539-Optimise-your-google-my-business-listing.jpg', NULL, NULL, NULL, '/property/pics/1624468047539-Optimise-your-google-my-business-listing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(283, '1624468053490-increase-your-businees-after-lockdown.jpg', NULL, NULL, NULL, '/property/pics/1624468053490-increase-your-businees-after-lockdown.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(284, '1624468058913-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/1624468058913-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(285, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(286, 'online-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/online-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(287, 'online-digital-marketing.jpg', NULL, NULL, NULL, '/property/brochure/online-digital-marketing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(288, 'online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/property/brochure/online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(289, '1624514773925-importance-and-benefits-of-graphic-design-for-your-business.jpg', 'aaaaaaaaaaaaaaaa', 'bbbbbbbbb', 'cccccccccccc', '/property/banner/1624514773925-importance-and-benefits-of-graphic-design-for-your-business.jpg', 'dddddddddddd', '2021-06-06 03:27:18', '2021-06-24 00:35:46'),
(290, 'online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(291, 'online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(292, 'online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(293, '1624468144657-importance-and-benefits-of-graphic-design-for-your-business.jpg', NULL, NULL, NULL, '/property/blocks/1624468144657-importance-and-benefits-of-graphic-design-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(294, '1624468149600-instagram-verification-badge.jpg', NULL, NULL, NULL, '/property/blocks/1624468149600-instagram-verification-badge.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(295, '1624468156379-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/blocks/1624468156379-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(296, '1624468162744-seo-trends.jpg', NULL, NULL, NULL, '/property/blocks/1624468162744-seo-trends.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(297, 'online-colors.jpg', NULL, NULL, NULL, '/property/brochure/online-colors.jpg', NULL, '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(298, '1624514785184-brand-strategy-tips-for-new-businesses.jpg', NULL, NULL, NULL, '/property/pics/1624514785184-brand-strategy-tips-for-new-businesses.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(299, '1624514790995-instagram-verification-badge.jpg', NULL, NULL, NULL, '/property/pics/1624514790995-instagram-verification-badge.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(300, '1624514796359-Optimise-your-google-my-business-listing.jpg', NULL, NULL, NULL, '/property/pics/1624514796359-Optimise-your-google-my-business-listing.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(301, '1624468116762-brand-strategy-tips-for-new-businesses.jpg', NULL, NULL, NULL, '/property/brochure/1624468116762-brand-strategy-tips-for-new-businesses.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(302, '1624468122288-creating-a-website-for-your-business.jpg', NULL, NULL, NULL, '/property/brochure/1624468122288-creating-a-website-for-your-business.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(303, '1624468128856-graphic-designing-company-in-delhi.jpg', NULL, NULL, NULL, '/property/brochure/1624468128856-graphic-designing-company-in-delhi.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(304, '1624468135696-instagram-verification-badge.jpg', NULL, NULL, NULL, '/property/brochure/1624468135696-instagram-verification-badge.jpg', NULL, '2021-06-05 11:39:37', '2021-06-23 11:36:16'),
(305, '1624514802496-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/brochure/1624514802496-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(306, '1624514807662-instagram-verification-badge.jpg', NULL, NULL, NULL, '/property/brochure/1624514807662-instagram-verification-badge.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(307, '1624514813753-seo-trends.jpg', NULL, NULL, NULL, '/property/brochure/1624514813753-seo-trends.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(308, '1624514819022-what-is-a-domain-name-and-why-do-i-need--It.jpg', NULL, NULL, NULL, '/property/brochure/1624514819022-what-is-a-domain-name-and-why-do-i-need--It.jpg', NULL, '2021-06-05 11:39:37', '2021-06-24 00:35:46'),
(309, '1623256607365-wordpress-theme-developer-in-delhi.jpg', NULL, NULL, NULL, '/property/pics/1623256607365-wordpress-theme-developer-in-delhi.jpg', NULL, '2021-06-09 11:03:14', '2021-06-09 11:03:14'),
(310, '1623256672710-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623256672710-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:03:14', '2021-06-09 11:03:14'),
(311, '1623256704751-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623256704751-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:08:20', '2021-06-09 11:08:20'),
(312, '1623257308855-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623257308855-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:18:26', '2021-06-09 11:18:26'),
(313, '1623257445484-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623257445484-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:20:34', '2021-06-09 11:20:34'),
(314, '1623257495705-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623257495705-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:21:33', '2021-06-09 11:21:33'),
(315, '1623257552379-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623257552379-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:22:26', '2021-06-09 11:22:26'),
(316, '1623257624766-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623257624766-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:23:41', '2021-06-09 11:23:41'),
(317, '1623259031067-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623259031067-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:47:07', '2021-06-09 11:47:07'),
(318, '1623259050506-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623259050506-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 11:47:28', '2021-06-09 11:47:28'),
(319, '1623259105656-online-increase-your-business-after-lockdown.jpg', NULL, NULL, NULL, '/property/pics/1623259105656-online-increase-your-business-after-lockdown.jpg', NULL, '2021-06-09 11:48:14', '2021-06-09 11:48:14'),
(320, '1623259138594-online-increase-your-business-after-lockdown.jpg', NULL, NULL, NULL, '/property/pics/1623259138594-online-increase-your-business-after-lockdown.jpg', NULL, '2021-06-09 11:48:55', '2021-06-09 11:48:55'),
(321, '1623259217842-online-off-page-seo-techniques.jpg', NULL, NULL, NULL, '/property/pics/1623259217842-online-off-page-seo-techniques.jpg', NULL, '2021-06-09 11:48:55', '2021-06-09 11:48:55'),
(322, '1623259494182-online-website-speed-optimization.jpg', NULL, NULL, NULL, '/property/brochure/1623259494182-online-website-speed-optimization.jpg', NULL, '2021-06-09 11:54:17', '2021-06-09 11:54:17'),
(323, '1623259581538-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/brochure/1623259581538-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-09 11:56:07', '2021-06-09 11:56:07'),
(324, '1623259998309-online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/brochure/1623259998309-online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(325, '1623261405226-what-makes-a-good-website.jpg', NULL, NULL, NULL, '/property/brochure/1623261405226-what-makes-a-good-website.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(326, '1623262106694-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623262106694-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(327, '1623262416492-off-page-seo-techniques.jpg', NULL, NULL, NULL, '/property/pics/1623262416492-off-page-seo-techniques.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(328, '1623262506418-online-seo-optimized-content.jpg', NULL, NULL, NULL, '/property/pics/1623262506418-online-seo-optimized-content.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(329, '1623262569500-online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/pics/1623262569500-online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(330, '1623262806237-online-digital-marketing.jpg', NULL, NULL, NULL, '/property/pics/1623262806237-online-digital-marketing.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(331, '1623262904755-online-website-requirement.jpg', NULL, NULL, NULL, '/property/pics/1623262904755-online-website-requirement.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(332, '1623262984114-online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/property/brochure/1623262984114-online-image-optimisation-in-website.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(333, '1623263105526-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/brochure/1623263105526-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 12:03:00', '2021-06-09 12:03:00'),
(334, '1623263175713-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/property/pics/1623263175713-online-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-09 12:56:04', '2021-06-09 12:56:04'),
(335, '1623263214542-online-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/property/brochure/1623263214542-online-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-09 12:56:04', '2021-06-09 12:56:04'),
(336, '1623313534764-off-page-seo-techniques.jpg', NULL, NULL, NULL, '/property/blocks/1623313534764-off-page-seo-techniques.jpg', NULL, '2021-06-10 02:54:30', '2021-06-10 02:54:30'),
(337, '1623313534771-online-seo-strategy.jpg', NULL, NULL, NULL, '/property/blocks/1623313534771-online-seo-strategy.jpg', NULL, '2021-06-10 02:54:30', '2021-06-10 02:54:30'),
(338, '1623313859389-off-page-seo-techniques.jpg', NULL, NULL, NULL, '/property/blocks/1623313859389-off-page-seo-techniques.jpg', NULL, '2021-06-10 03:00:40', '2021-06-10 03:00:40'),
(339, '1623313859396-online-seo-strategy.jpg', NULL, NULL, NULL, '/property/blocks/1623313859396-online-seo-strategy.jpg', NULL, '2021-06-10 03:00:40', '2021-06-10 03:00:40'),
(340, '1623314142194-off-page-seo-techniques.jpg', NULL, NULL, NULL, '/property/blocks/1623314142194-off-page-seo-techniques.jpg', NULL, '2021-06-10 03:05:39', '2021-06-10 03:05:39'),
(341, '1623314429485-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314429485-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:10:01', '2021-06-10 03:10:01'),
(342, '1623314462281-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314462281-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:10:54', '2021-06-10 03:10:54'),
(343, '1623314571080-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314571080-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:12:49', '2021-06-10 03:12:49'),
(344, '1623314653111-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314653111-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:14:10', '2021-06-10 03:14:10'),
(345, '1623314679903-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314679903-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:14:38', '2021-06-10 03:14:38'),
(346, '1623314702688-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314702688-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:15:01', '2021-06-10 03:15:01'),
(347, '1623314792840-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314792840-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:16:27', '2021-06-10 03:16:27'),
(348, '1623314868681-online-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/property/blocks/1623314868681-online-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-10 03:17:45', '2021-06-10 03:17:45'),
(349, '1623320540289-increase-your-presence-on-search-engine.jpg', NULL, NULL, NULL, '/builder/logo/1623320540289-increase-your-presence-on-search-engine.jpg', NULL, '2021-06-10 04:52:17', '2021-06-10 04:52:17'),
(350, '1623320540346-online-image-optimisation-in-website.jpg', NULL, NULL, NULL, '/builder/brochure/1623320540346-online-image-optimisation-in-website.jpg', NULL, '2021-06-10 04:52:17', '2021-06-10 04:52:17'),
(351, '1623323079996-online-website-builders.jpg', NULL, NULL, NULL, '/builder/logo/1623323079996-online-website-builders.jpg', NULL, '2021-06-10 04:52:17', '2021-06-10 05:34:14'),
(352, '1623323068767-online-seo-optimized-content.jpg', NULL, NULL, NULL, '/builder/brochure/1623323068767-online-seo-optimized-content.jpg', NULL, '2021-06-10 04:52:17', '2021-06-10 05:34:14'),
(353, '1623323287298-online-hiring-a-digital-marketing-agency.jpg', NULL, NULL, NULL, '/builder/logo/1623323287298-online-hiring-a-digital-marketing-agency.jpg', NULL, '2021-06-10 05:34:14', '2021-06-10 05:34:14'),
(354, '1623323240436-what-makes-a-good-website.jpg', NULL, NULL, NULL, '/builder/brochure/1623323240436-what-makes-a-good-website.jpg', NULL, '2021-06-10 05:34:14', '2021-06-10 05:34:14'),
(355, '1624461526744-Optimise-your-google-my-business-listing.jpg', NULL, NULL, NULL, '/blog/1624461526744-Optimise-your-google-my-business-listing.jpg', NULL, '2021-06-13 05:00:33', '2021-06-23 09:46:42'),
(356, '1624461519959-online-benefits-of-ppc-advertising.jpg', NULL, NULL, NULL, '/blog/1624461519959-online-benefits-of-ppc-advertising.jpg', NULL, '2021-06-13 05:00:33', '2021-06-23 09:46:42'),
(357, '1624461513864-instagram-verification-badge.jpg', NULL, NULL, NULL, '/blog/1624461513864-instagram-verification-badge.jpg', NULL, '2021-06-13 05:03:28', '2021-06-23 09:46:42'),
(358, '1624461489967-increase-your-presence-on-search-engine.jpg', NULL, NULL, NULL, '/blog/1624461489967-increase-your-presence-on-search-engine.jpg', NULL, '2021-06-13 05:04:53', '2021-06-23 09:46:42'),
(359, '1624461479208-increase-your-businees-after-lockdown.jpg', NULL, NULL, NULL, '/blog/1624461479208-increase-your-businees-after-lockdown.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(360, '1624461472856-importance-and-benefits-of-graphic-design-for-your-business.jpg', 'this is alt', 'description of the image', 'caption of the image', '/blog/1624461472856-importance-and-benefits-of-graphic-design-for-your-business.jpg', 'title of the image', '2021-06-13 05:05:32', '2021-06-27 07:12:31'),
(361, '1624461468063-how-to-make-existing-website-mobile-friendly.jpg', NULL, NULL, NULL, '/blog/1624461468063-how-to-make-existing-website-mobile-friendly.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(362, '1624461463096-how-to-improve-website-conversion-rates.jpg', NULL, NULL, NULL, '/blog/1624461463096-how-to-improve-website-conversion-rates.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(363, '1624461436312-how-to-improve-google-search-ranking.jpg', NULL, NULL, NULL, '/blog/1624461436312-how-to-improve-google-search-ranking.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(364, '1624461431801-how-much-a-website-building-cost-should-be.jpg', NULL, NULL, NULL, '/blog/1624461431801-how-much-a-website-building-cost-should-be.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(365, '1624461425823-how-do-I-promote-my-blog-on-social-media.jpg', NULL, NULL, NULL, '/blog/1624461425823-how-do-I-promote-my-blog-on-social-media.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(366, '1624461419946-graphic-designing-company-in-delhi.jpg', NULL, NULL, NULL, '/blog/1624461419946-graphic-designing-company-in-delhi.jpg', NULL, '2021-06-13 05:05:32', '2021-06-23 09:46:42'),
(367, '1624461414648-different-types-of-digital-marketing.jpg', '111111111', '444444444', '3333333333', '/blog/1624461414648-different-types-of-digital-marketing.jpg', '22222222', '2021-06-13 05:05:32', '2021-06-27 07:12:31'),
(368, '1624467985871-how-to-improve-website-conversion-rates.jpg', 'qqqqqq', 'rrrrrrrr', 'eeeeeeee', '/blog/1624467985871-how-to-improve-website-conversion-rates.jpg', 'wwwww', '2021-06-13 05:05:32', '2021-06-27 07:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `url`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, '/home', 'qqqqqqqqq', 'eeeeeeeeeeee', '2021-01-29 10:39:44', '2021-01-29 10:39:44'),
(2, 'zzzzzzzzzz', 'xxxxxxxxxxx', 'vvvvvvvvvvvvv', '2021-01-29 10:42:39', '2021-01-29 10:42:39'),
(3, '/qq', '111111111', '333333333', '2021-02-04 07:23:46', '2021-02-04 07:23:46'),
(4, '/rrrrrrrrr', '33333333333', '444444444444', '2021-06-03 11:24:33', '2021-06-03 11:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `propdetails`
--

CREATE TABLE `propdetails` (
  `id` int(255) NOT NULL,
  `propertyId` int(255) NOT NULL,
  `faq` mediumtext,
  `brochure` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `finance` int(11) DEFAULT NULL,
  `possession` varchar(255) DEFAULT NULL,
  `why` mediumtext,
  `blocks` mediumtext,
  `landmark` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `propdetails`
--

INSERT INTO `propdetails` (`id`, `propertyId`, `faq`, `brochure`, `video`, `finance`, `possession`, `why`, `blocks`, `landmark`, `created_at`, `updated_at`) VALUES
(1, 1, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[44,43,42,41,324,325,332,333,335]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":52},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":51},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":50},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":49}]', 'yyyyyyyyyy', '2021-06-09 12:56:04', '2021-06-09 12:56:04'),
(2, 2, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[56,55,54,53]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":52},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":51},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":50},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":49},{\"head\":\"11111111111111111\",\"text\":\"22222222222222222222222222222222222\",\"pic\":348}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-10 03:17:45'),
(3, 3, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[68,67,66,65]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":64},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":63},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":62},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":61}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(4, 4, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[80,79,78,77]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":76},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":75},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":74},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":73}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(5, 5, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[92,91,90,89]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":88},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":87},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":86},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":85}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(6, 6, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[104,103,102,101]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":100},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":99},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":98},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":97}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(7, 7, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[116,115,114,113]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":112},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":111},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":110},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":109}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(8, 8, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[128,127,126,125]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":124},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":123},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":122},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":121}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(9, 9, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[140,139,138,137]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":136},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":135},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":134},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":133}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(10, 10, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[152,151,150,149]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":148},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":147},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":146},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":145}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(11, 11, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[164,163,162,161]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":160},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":159},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":158},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":157}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(12, 12, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[177,176,175,174]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":172},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":171},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":170},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":169}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(13, 13, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[189,188,187,186]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":184},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":183},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":182},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":181}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(14, 14, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[200,199,198,197]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":196},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":195},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":194},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":193}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(15, 15, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[213,212,211,210]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":208},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":207},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":206},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":205}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(16, 16, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[225,224,223,222]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":220},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":219},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":218},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":217}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(17, 17, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[240,239,238,237]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":233},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":232},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":231},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":230}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(18, 18, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[249,248,247,246]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":244},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":243},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":242},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":241}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(19, 19, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[261,260,259,258]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":256},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":255},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":254},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":253}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(20, 20, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[284,283,282,281]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":272},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":271},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":270},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":269}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(21, 21, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[296,295,294,293]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":284},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":283},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":282},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":281}]', 'yyyyyyyyyy', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(22, 22, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[304,303,302,301]', 'uuuuuuuuuuu', 1, '2021/06/23', '[37,38,39,40]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":296},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":295},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":294},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":293}]', 'yyyyyyyyyy', '2021-06-09 06:23:00', '2021-06-09 06:23:00'),
(23, 23, '[{\"quest\":\"aaaaaaa\",\"ans\":\"fffffffffffff\"},{\"quest\":\"ssssss\",\"ans\":\"ggggggggggggg\"},{\"quest\":\"ddddddddddd\",\"ans\":\"hhhhhhhhhhh\"}]', '[308,307,306,305]', '7777777777', 1, '2021/06/30', '[37]', '[{\"head\":\"zzzzzzzzzzz\",\"text\":\"ccccccccccccc\",\"pic\":304},{\"head\":\"xxxxxxxxxxxxxx\",\"text\":\"bbbbbbbbbbbbbb\",\"pic\":303},{\"head\":\"aaaaaaaaa\",\"text\":\"vvvvvvvvvvvvvv\",\"pic\":302},{\"head\":\"sssssssssssssss\",\"text\":\"nnnnnnnnnnnnnnnnn\",\"pic\":301}]', '66666666666', '2021-06-09 05:26:44', '2021-06-09 05:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `pics` mediumtext NOT NULL,
  `shortdesc` mediumtext NOT NULL,
  `longdesc` mediumtext NOT NULL,
  `amenities` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `builder` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `bedroom` int(11) NOT NULL,
  `bathroom` int(11) NOT NULL,
  `units` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `name`, `url`, `type`, `status`, `banner`, `pics`, `shortdesc`, `longdesc`, `amenities`, `tags`, `builder`, `price`, `discount`, `bedroom`, `bathroom`, `units`, `address`, `area`, `created_at`, `updated_at`) VALUES
(1, 'qqqqqqqqq', 'qq', 17, 1, '33', '[36,35,34,320,321,326,327,328,329,330,331,334]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,35]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-09 12:56:04', '2021-06-09 12:56:04'),
(2, 'qqqqqqqqq', 'ww', 17, 1, '45', '[48,47,46]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,35]', 1, '150', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-10 03:17:45'),
(3, 'qqqqqqqqq', 'ee', 17, 1, '57', '[60,59,58]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32]', 1, '180', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(4, 'qqqqqqqqq', 'rr', 17, 1, '69', '[72,71,70]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(5, 'qqqqqqqqq', 'tt', 17, 1, '81', '[84,83,82]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(6, 'qqqqqqqqq', 'yy', 17, 1, '93', '[96,95,94]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(7, 'qqqqqqqqq', 'uu', 17, 1, '105', '[108,107,106]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(8, 'qqqqqqqqq', 'ii', 17, 1, '117', '[120,119,118]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(9, 'qqqqqqqqq', 'oo', 17, 1, '129', '[132,131,130]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(10, 'qqqqqqqqq', 'pp', 17, 1, '141', '[144,143,142]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(11, 'qqqqqqqqq', 'aa', 17, 1, '153', '[156,155,154]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(12, 'qqqqqqqqq', 'ss', 17, 1, '165', '[168,167,166]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(13, 'qqqqqqqqq', 'dd', 17, 1, '177', '[180,179,178]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(14, 'qqqqqqqqq', 'ff', 17, 1, '189', '[192,191,190]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(15, 'qqqqqqqqq', 'gg', 17, 1, '201', '[204,203,202]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(16, 'qqqqqqqqq', 'hh', 17, 1, '213', '[216,215,214]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(17, 'qqqqqqqqq', 'jj', 17, 1, '225', '[228,227,226]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(18, 'qqqqqqqqq', 'kk', 17, 1, '233', '[240,239,238]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(19, 'qqqqqqqqq', 'll', 17, 1, '245', '[252,251,250]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(20, 'qqqqqqqqq', 'zz', 17, 1, '261', '[265,264,263]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 11:39:37'),
(21, 'qqqqqqqqq', 'xx', 17, 1, '265', '[277,276,275]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-05 11:39:37', '2021-06-05 12:23:18'),
(22, 'qqqqqqqqq', 'cc', 17, 1, '277', '[284,283,282]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[27]', '[30,31,32,33]', 1, '100', '200', 3, 4, 500, '[\"India\",\"eeeeeeeeeee\",\"rrrrrrr\",\"ttttttttt\",\"yyyyyyyyyy\"]', '600', '2021-06-09 06:23:00', '2021-06-09 06:23:00'),
(23, '111111111111', 'vv', 18, 1, '289', '[300,299,298]', 'mmmmmmmmmmmmmmmm', 'aaaaaaaaaaaaaaaaa', '[23,25,24,26,27]', '[30]', 2, '500', '999', 4, 999, 9999, '[\"India\",\"33333333\",\"444444\",\"55555555555\",\"66666666666\"]', '999', '2021-06-09 05:26:44', '2021-06-09 05:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Amit', 'amit.khare588@gmail.com', '2021-06-13 11:28:38', '2021-06-13 11:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `status`, `password`, `token`, `created_at`, `updated_at`) VALUES
(3, 'Amit', 'amit.khare588@gmail.com', 'Admin', 1, '$2a$10$ApLpi2p5SgQfcpvzRwL10uoJ0ouq8IR.inw4BquUAn2K3Vp0aGAe2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJuYW1lIjoiQW1pdCIsImVtYWlsIjoiYW1pdC5raGFyZTU4OEBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4ifSwiaWF0IjoxNjI2Nzg3NzE5fQ.VdnBjK1X5avaFGH9fK6-HaF2QsPxbCqkWTvi_t1hjn8', '2021-06-03 06:09:43', '2021-07-20 07:58:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basics`
--
ALTER TABLE `basics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `builders`
--
ALTER TABLE `builders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `metas_url_unique` (`url`);

--
-- Indexes for table `propdetails`
--
ALTER TABLE `propdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `propertyId` (`propertyId`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basics`
--
ALTER TABLE `basics`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `builders`
--
ALTER TABLE `builders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `propdetails`
--
ALTER TABLE `propdetails`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
