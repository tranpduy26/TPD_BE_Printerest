/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `binh_luan` (
  `binh_luan_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_binh_luan` date DEFAULT NULL,
  `noi_dung` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`binh_luan_id`),
  KEY `hinh_id` (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `hinh_anh` (
  `hinh_id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duong_dan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mo_ta` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  PRIMARY KEY (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `luu_anh` (
  `luu_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_luu` date DEFAULT NULL,
  PRIMARY KEY (`luu_id`),
  KEY `hinh_id` (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nguoi_dung` (
  `nguoi_dung_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat_khau` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho_ten` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tuoi` int DEFAULT NULL,
  `anh_dai_dien` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(11, 25, 21, '2023-01-01', 'Binh luan 1');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(12, 25, 21, '2023-01-02', 'Binh luan 2');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(13, 26, 22, '2023-01-03', 'Binh luan 3');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(14, 27, 22, '2023-01-04', 'Binh luan 4'),
(15, 28, 23, '2023-01-05', 'Binh luan 5'),
(16, 25, 21, '2023-01-01', 'Binh luan 1'),
(17, 25, 21, '2023-01-02', 'Binh luan 2'),
(18, 26, 22, '2023-01-03', 'Binh luan 3'),
(19, 27, 22, '2023-01-04', 'Binh luan 4'),
(20, 28, 23, '2023-01-05', 'Binh luan 5'),
(29, 28, 21, '2023-12-30', 'bình luận nè');

INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(21, 'Hinh 1', 'duong/dan/hinh1.jpg', 'Mo ta hinh 1', 25);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(22, 'Hinh 2', 'duong/dan/hinh2.jpg', 'Mo ta hinh 2', 26);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(23, 'Hinh 3', 'duong/dan/hinh3.jpg', 'Mo ta hinh 3', 27);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(25, 'Hinh 5', 'duong/dan/hinh5.jpg', 'Mo ta hinh 5', 29),
(26, 'Hinh 1', 'duong/dan/hinh1.jpg', 'Mo ta hinh 1', 1),
(27, 'Hinh 1', 'duong/dan/hinh1.jpg', 'Mo ta hinh 1', 28),
(28, 'tên gì cũng được', '/public/imgs/image.jpg', 'hình mới up', 28),
(29, 'tên gì cũng được', '/public/imgs/image.jpg', 'hình mới up', 28),
(30, 'tên gì cũng được', '/public/imgs/image.jpg', 'hình mới up', 28),
(31, 'tên gì cũng được', '/public/imgs/image.jpg', 'hình mới up', 28);

INSERT INTO `luu_anh` (`luu_id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(6, 25, 21, '2023-01-01');
INSERT INTO `luu_anh` (`luu_id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(7, 26, 22, '2023-01-02');
INSERT INTO `luu_anh` (`luu_id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(8, 27, 23, '2023-01-03');
INSERT INTO `luu_anh` (`luu_id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(10, 30, 25, '2023-01-05'),
(11, 1, 21, '2023-01-01'),
(12, 1, 21, '2023-01-01'),
(13, 1, 26, '2023-01-01'),
(14, 1, 27, '2023-01-01');

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(1, 'nguoidung21aq@gmail.com', 'hih111i', 'hehe', NULL, '');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(25, 'nguoidung1aq@gmail.com', 'hih111i', 'hehe', NULL, '');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(26, 'nguoidung21sssaq@gmail.com', 'hih111i', 'hehe', NULL, NULL);
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(27, 'nguoidung21dsssaq@gmail.com', '$2b$09$5Ixe826jCzipOpfyrlovPuc7b7UM.c.Z14fe/9oZ/MYFyPntcrfbS', 'hehe', NULL, NULL),
(28, 'nguoidung999@gmail.com', '$2b$09$IndHed5FTCLteP4ttVW0lebliOWAw1eAnJJ8/VYaLYNZKj5CUfZkm', 'tên mới nữa ne', 10, NULL),
(29, 'nguoidung1@gmail.com', 'matkhau1', 'Nguoi dung 1', 25, 'avatar1.jpg'),
(30, 'nguoidung2@gmail.com', 'matkhau2', 'Nguoi dung 2', 30, 'avatar2.jpg'),
(31, 'nguoidung3@gmail.com', 'matkhau3', 'Nguoi dung 3', 35, 'avatar3.jpg'),
(32, 'nguoidung4@gmail.com', 'matkhau4', 'Nguoi dung 4', 28, 'avatar4.jpg'),
(33, 'nguoidung5@gmail.com', 'matkhau5', 'Nguoi dung 5', 32, 'avatar5.jpg'),
(34, 'nguoidung1@gmail.com', 'matkhau1', 'Nguoi dung 1', 2, 'avatar1.jpg'),
(35, 'nguoidung2@gmail.com', 'matkhau2', 'Nguoi dung 2', 3, 'avatar2.jpg'),
(36, 'nguoidung3@gmail.com', 'matkhau3', 'Nguoi dung 3', 4, 'avatar3.jpg'),
(37, 'nguoidung4@gmail.com', 'matkhau4', 'Nguoi dung 4', 5, 'avatar4.jpg'),
(38, 'nguoidung5@gmail.com', 'matkhau5', 'Nguoi dung 5', 32, 'avatar5.jpg');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;