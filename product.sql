-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 10, 2023 lúc 08:42 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `product`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `cdesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cid`, `cname`, `cdesc`) VALUES
(1, 'Samsung', 'Hang dien thoai cua Han Quoc'),
(2, 'Apple', 'Hang dien thoai cua My'),
(3, 'Oppo', 'Hang dien thoai cua TQ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `coid` int(11) NOT NULL,
  `coDate` date DEFAULT NULL,
  `coContent` text DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `costatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`coid`, `coDate`, `coContent`, `Name`, `Email`, `costatus`) VALUES
(1, '2023-11-10', 'Đây là bình luận đầu tiên.', 'Người Dùng 1', 'nguoidung1@gmaol.com', 1),
(2, '2023-11-11', 'Đây là bình luận thứ hai.', 'Người Dùng 2', 'nguoidung2@gmail.com', 1),
(3, '2023-11-12', 'Đây là bình luận thứ ba.', 'Người Dùng 3', 'nguoidung3@gmail.com', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `pdesc` text NOT NULL,
  `pimage` varchar(255) NOT NULL,
  `pprice` decimal(10,0) NOT NULL,
  `pquantity` int(11) NOT NULL,
  `porder` int(11) NOT NULL,
  `pinsertdate` date NOT NULL,
  `pupdatedate` date NOT NULL,
  `cid` int(11) NOT NULL,
  `pstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`pid`, `pname`, `pdesc`, `pimage`, `pprice`, `pquantity`, `porder`, `pinsertdate`, `pupdatedate`, `cid`, `pstatus`) VALUES
(1, 'Galaxy Note 10 Plus', 'Dien thoai cua toi', 'galaxy.jpg', 8000000, 10, 1, '2023-10-17', '2023-10-17', 1, 1),
(2, 'Samssung S24', 'Dong cao cap nhat hien nay', 'samsung.jpg', 30000000, 24, 2, '2023-10-16', '2023-10-17', 1, 1),
(3, 'Galaxy Note 11 Plus', '?i?n tho?i c?a tôi', 'galaxy.jpg', 8000000, 10, 1, '2023-10-17', '2023-10-17', 2, 1),
(4, 'Samssung S25', 'Dong cao cap nhat hien nay', 'samsung.jpg', 30000000, 24, 2, '2023-10-16', '2023-10-17', 2, 1),
(5, 'Galaxy Note 12 Plus', '?i?n tho?i c?a tôi', 'galaxy.jpg', 8000000, 10, 1, '2023-10-17', '2023-10-17', 2, 1),
(6, 'Samssung S26', 'Dong cao cap nhat hien nay', 'samsung.jpg', 30000000, 24, 2, '2023-10-16', '2023-10-17', 2, 1),
(7, 'Galaxy Note 14 Plus', '?i?n tho?i c?a tôi', 'galaxy.jpg', 8000000, 10, 1, '2023-10-17', '2023-10-17', 2, 1),
(8, 'Samssung S27', 'Dong cao cap nhat hien nay', 'samsung.jpg', 30000000, 24, 2, '2023-10-16', '2023-10-17', 2, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`coid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
