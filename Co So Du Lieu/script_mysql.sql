-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th3 14, 2020 lúc 05:28 AM
-- Phiên bản máy phục vụ: 10.3.16-MariaDB
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `id11743401_learning`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `idMember` int(11) NOT NULL,
  `idCreator` int(11) DEFAULT NULL,
  `DateSet` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`idMember`, `idCreator`, `DateSet`) VALUES
(5, NULL, '2018-08-12 14:40:54'),
(14, 5, '2018-08-17 21:04:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `idClass` int(11) NOT NULL,
  `idCreator` int(11) DEFAULT NULL,
  `linkClass` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Detail` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`idClass`, `idCreator`, `linkClass`, `Title`, `Detail`, `Password`, `DateCreated`, `Status`) VALUES
(14, 5, 'CSD001', 'Cơ sở dữ liệu', '', NULL, '2018-08-17 19:29:58', 2),
(15, 5, 'NML001', 'Nhập môn lập trình', '<h2>Giới thiệu về kh&oacute;a học</h2>\n\n<p>Bạn l&agrave; người mới v&agrave; bạn kh&ocirc;ng biết bắt đầu từ đ&acirc;u? Hay bạn đang tiếp cận ng&ocirc;n ngữ lập tr&igrave;nh v&agrave; thấy n&oacute; qu&aacute; kh&ocirc; khan v&agrave; nh&agrave;m ch&aacute;n?</p>\n\n<p>Đ&oacute; l&agrave; do bạn chưa hiểu hết về lập tr&igrave;nh, v&agrave; hỏng kiến thức sơ khởi, điều đ&oacute; tạo n&ecirc;n những d&ograve;ng code kh&ocirc; khan của bạn v&agrave; thậm ch&iacute; đ&ocirc;i khi bạn kh&ocirc;ng hiểu những d&ograve;ng code đ&oacute; tại sao c&oacute;, n&oacute; để l&agrave;m g&igrave;.</p>\n\n<p>Kh&oacute;a học n&agrave;y l&agrave; d&agrave;nh để cho c&aacute;c bạn, kh&oacute;a học kh&ocirc;ng đ&egrave; nặng t&iacute;nh kỹ thuật, m&agrave; thay v&agrave;o đ&oacute; l&agrave; việc giới thiệu cho bạn c&aacute;c kiến thức về biến, tại sao c&oacute; biến, về một số cấu tr&uacute;c v&agrave; lập tr&igrave;nh bằng ng&ocirc;n ngữ đời sống th&ocirc;ng qua sơ đồ thuật to&aacute;n.</p>\n\n<p>Kh&oacute;a học bao gồm:</p>\n\n<ul>\n	<li>C&aacute;c kiến thức cơ bản về biến</li>\n	<li>C&aacute;c kiến thức về cấu tr&uacute;c lặp, cấu tr&uacute;c điều kiện v&agrave; chức năng</li>\n	<li>Kiến thức về lập tr&igrave;nh th&ocirc;ng qua ng&ocirc; ngữ đời sống</li>\n	<li>Định hướng học lập tr&igrave;nh</li>\n</ul>\n\n<h2>Kết quả nhận được từ kh&oacute;a học</h2>\n\n<p>Kết th&uacute;c kh&oacute;a học n&agrave;y, bạn sẽ:</p>\n\n<ul>\n	<li>C&oacute; một c&aacute;i nh&igrave;n kh&aacute;i qu&aacute;t về lập tr&igrave;nh</li>\n	<li>Hiểu biết về c&aacute;c cấu tr&uacute;c c&oacute; trong lập tr&igrave;nh</li>\n	<li>Hiểu c&aacute;ch giải quyết một b&agrave;i to&aacute;n trong lập tr&igrave;nh</li>\n	<li>Hiểu c&aacute;ch sử dụng sơ đồ khối để lập tr&igrave;nh</li>\n</ul>\n\n<h2>Đối tượng th&iacute;ch hợp</h2>\n\n<p>Kh&oacute;a học n&agrave;y kh&ocirc;ng y&ecirc;u cầu c&aacute;c bạn phải biết trước g&igrave; cả, nhưng khuyến kh&iacute;ch c&aacute;c bạn:</p>\n\n<ul>\n	<li>C&oacute; tinh thần tự học, d&aacute;m đương đầu với kh&oacute; khăn v&agrave; d&aacute;m giải quyết kh&oacute; khăn</li>\n	<li>C&oacute; tinh thần tr&aacute;ch nhiệm</li>\n</ul>\n\n<h2>Điều kiện để học</h2>\n\n<p>Kh&ocirc;ng c&oacute; điều kiện y&ecirc;u cầu học.</p>\n', NULL, '2018-08-17 19:31:43', 1),
(16, 5, 'KNA001', 'Khởi nghiệp', '<blockquote>\n<p><strong>Mật khẩu đăng nhập kh&oacute;a học l&agrave;:</strong> BietChetLien</p>\n</blockquote>\n\n<p>M&ocirc;n học Khởi nghiệp gi&uacute;p cho những người c&oacute; kh&aacute;t khao v&agrave; ước mơ ho&agrave;n thiện bản th&acirc;n để vươn đến th&agrave;nh c&ocirc;ng v&agrave; hạnh ph&uacute;c, tạo ra thật nhiều gi&aacute; trị vật chất, r&egrave;n luyện tinh thần th&eacute;p, x&acirc;y dựng đạo đức kinh doanh v&agrave; được cộng đồng thừa nhận. M&ocirc;n học cung cấp cho sinh vi&ecirc;n những kiến thức khởi sự gi&aacute; trị v&agrave; gi&uacute;p người học nhận ra ho&agrave;i b&atilde;o khởi nghiệp, ph&aacute;t hiện t&agrave;i nguy&ecirc;n v&ocirc; tận tr&ecirc;n con đường khởi nghiệp, nhận ra sứ mệnh to lớn của việc l&agrave;m gi&agrave;u từ con đường khởi nghiệp đồng thời thấy được bước Khởi nghiệp n&ecirc;n bắt nguồn từ đ&acirc;u? Khởi nghiệp khuyến kh&iacute;ch mọi người &aacute;p dụng những kiến thức v&agrave; kỹ năng đ&atilde; học v&agrave;o ngay việc ph&aacute;t triển doanh nghiệp hoặc sự nghiệp c&aacute; nh&acirc;n của m&igrave;nh. L&agrave; m&ocirc;n học thuộc chuy&ecirc;n ng&agrave;nh Quản trị doanh nghiệp n&ecirc;n m&ocirc;n học cũng gi&uacute;p người học c&oacute; c&aacute;i nh&igrave;n tổng quan về doanh nghiệp v&agrave; hoạt động kinh doanh của doanh nghiệp. Ho&agrave;n thiện kỹ năng x&acirc;y dựng kế hoạch kinh doanh...</p>\n\n<p>&nbsp;</p>\n', 'BietChetLien', '2018-08-17 19:40:46', 1),
(17, 5, 'HTT001', 'Hệ thống thông tin', '<p><em><img alt=\"\" src=\"https://www.hutech.edu.vn/imgnews/tuyensinh/banner-HTTTQL-hutech(1).jpg\" style=\"height:0px; width:620px\" /><br />\n<br />\nTrong bối cảnh C&ocirc;ng nghệ th&ocirc;ng tin ph&aacute;t triển mạnh mẽ như hiện tại,&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\"><u>ng&agrave;nh Hệ thống th&ocirc;ng tin quản l&yacute;&nbsp;</u></a>(MIS- Management Information Systems) l&agrave; ng&agrave;nh học thu h&uacute;t sự quan t&acirc;m của giới trẻ trong những năm gần đ&acirc;y. Vậy ng&agrave;nh&nbsp;<strong>Hệ thống th&ocirc;ng tin quản l&yacute; l&agrave; g&igrave;? Ra trường l&agrave;m g&igrave;?</strong>&nbsp;Ch&uacute;ng ta hay cũng nhau trả lời trong b&agrave;i viết sau c&aacute;c bạn nh&eacute;.</em><br />\n&nbsp;</p>\n\n<h2><strong>Hệ thống th&ocirc;ng tin quản l&yacute; l&agrave; g&igrave;?</strong></h2>\n\n<p><br />\nHiểu một c&aacute;c đơn giản,&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\"><strong>Hệ thống th&ocirc;ng tin quản l&yacute;</strong></a>&nbsp;l&agrave; ng&agrave;nh học về con người, thiết bị v&agrave; quy tr&igrave;nh thu thập, ph&acirc;n t&iacute;ch, đ&aacute;nh gi&aacute; v&agrave; ph&acirc;n phối những th&ocirc;ng tin ch&iacute;nh x&aacute;c cho những người soạn thảo c&aacute;c quyết định trong tổ chức - doanh nghiệp.<br />\n<br />\nNhiều người cho rằng MIS giống với ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin hay khoa học m&aacute;y t&iacute;nh, nhưng thực tế kh&ocirc;ng hẳn vậy. MIS tập trung v&agrave;o thiết kế, quản trị v&agrave; vận h&agrave;nh c&aacute;c hệ thống th&ocirc;ng tin, ph&acirc;n t&iacute;ch dữ liệu, kết nối giữa c&aacute;c b&ecirc;n li&ecirc;n quan trong tổ chức, doanh nghiệp với c&aacute;c chuy&ecirc;n gia c&ocirc;ng nghệ th&ocirc;ng tin, cũng như biết c&aacute;c l&agrave;m thế n&agrave;o để doanh nghiệp hoạt động hiệu quả v&agrave; c&oacute; lợi thế cạnh tranh hơn.<br />\n&nbsp;</p>\n\n<p>&nbsp;<img alt=\"\" src=\"https://www.hutech.edu.vn/imgnews/tuyensinh/Co_nen_hoc_nganh_cong_nghe_thong_tin_2.jpg\" style=\"height:0px\" /><br />\n<em>T&iacute;nh cẩn trọng l&agrave; điều kh&ocirc;ng thể thiếu khi sinh vi&ecirc;n muốn theo học ng&agrave;nh n&agrave;y</em></p>\n\n<p><br />\nSinh vi&ecirc;n khi theo học&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\"><strong>ng&agrave;nh Hệ thống th&ocirc;ng tin quản l&yacute;</strong></a>&nbsp;sẽ được trang bị kiến thức chuy&ecirc;n m&ocirc;n vững chắc v&agrave; kỹ năng mềm cần thiết. C&aacute;c bạn sẽ được tiếp cận c&aacute;ch quản l&yacute; dự &aacute;n c&ocirc;ng nghệ th&ocirc;ng tin, lập tr&igrave;nh web, mạng v&agrave; truyền th&ocirc;ng,.. Ngo&agrave;i ra, sinh vi&ecirc;n c&ograve;n được ch&uacute; trọng ph&aacute;t triển c&aacute;c kỹ năng: tư duy logic, kỹ năng l&agrave;m việc nh&oacute;m, kỹ năng quản l&yacute; thời gian,&hellip;.<br />\n<br />\nMột số trường đại học đ&agrave;o tạo ng&agrave;nh Hệ thống th&ocirc;ng tin quản l&yacute; uy t&iacute;n hiện nay cần phải nhắc đến l&agrave;: Đại học Khoa học Tự nhi&ecirc;n, Đại học Kinh tế TP HCM, Đại học Ng&acirc;n h&agrave;ng TP HCM. Được biết từ năm 2017, trường Đại học C&ocirc;ng nghệ TP.HCM (HUTECH) sẽ tuyển sinh&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\"><strong>ng&agrave;nh Hệ thống th&ocirc;ng tin quản l&yacute;</strong></a>&nbsp;với c&aacute;c tổ hợp m&ocirc;n A00 (To&aacute;n, L&yacute;, H&oacute;a); A01 (To&aacute;n, L&yacute;, Anh); D01 (To&aacute;n, Văn, Anh) v&agrave; A02 (To&aacute;n, Văn, L&yacute;). Như vậy, th&iacute; sinh c&oacute; th&ecirc;m một địa chỉ tin cậy nữa để thực hiện giấc mơ đại học với ng&agrave;nh học Hệ thống th&ocirc;ng tin quản l&yacute; gi&agrave;u tiềm năng n&agrave;y.<br />\n&nbsp;</p>\n\n<h3><strong>Học Hệ thống th&ocirc;ng tin quản l&yacute; ra trường l&agrave;m g&igrave;?</strong></h3>\n\n<p><br />\nĐến thời điểm hiện tại, nhiều tổ chức, doanh nghiệp tại Việt Nam đang c&oacute; nhu cầu cao về nh&acirc;n lực nắm vững kiến tức cơ bản về quản l&yacute; v&agrave; kinh doanh để trợ gi&uacute;p hoạch định v&agrave; tổ chức thực thi c&aacute;c ch&iacute;nh s&aacute;ch, dự &aacute;n về ph&aacute;t triển v&agrave; triển khai ứng dụng c&ocirc;ng nghệ th&ocirc;ng tin trong c&aacute;c tổ chức, doanh nghiệp. Đ&acirc;y ch&iacute;nh l&agrave; cơ hội của c&aacute;c bạn đang theo học trong lĩnh vực&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\">Hệ thống th&ocirc;ng tin quản l&yacute;</a>.<br />\n&nbsp;</p>\n\n<p>&nbsp;<em><img alt=\"\" src=\"https://www.hutech.edu.vn/imgnews/tuyensinh/Hutech%20-%20nganh%20-%20DPH%20(4).JPG\" style=\"height:0px\" /><br />\nThư viện l&agrave; nơi được nhiều bạn sinh vi&ecirc;n đến để kh&aacute;m ph&aacute; kho t&agrave;ng tri thức rộng lớn</em></p>\n\n<p><br />\nSau khi tốt nghiệp&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\"><strong>ng&agrave;nh Hệ thống th&ocirc;ng tin quản l&yacute;</strong></a>, c&aacute;c kỹ sư cử nh&acirc;n c&oacute; thể đảm nhận nhiều vị tr&iacute; c&ocirc;ng việc trong c&aacute;c cơ quan, x&iacute; nghiệp như: thiết kế v&agrave; quản l&yacute; một hệ thống th&ocirc;ng tin kinh tế phục vụ cho c&aacute;c hoạt động quản l&yacute; kinh tế, quản trị kinh doanh; c&aacute;c bạn cũng c&oacute; thể tự tin đứng v&agrave;o vị tr&iacute; chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch hệ thống, t&iacute;ch hợp hệ thống; Quản trị vi&ecirc;n hệ thống th&ocirc;ng tin; Nh&acirc;n vi&ecirc;n đ&agrave;o tạo v&agrave; hướng dẫn nh&acirc;n vi&ecirc;n ở c&aacute;c bộ phận quản l&yacute; dự &aacute;n; Nếu đam m&ecirc; lĩnh vực nghi&ecirc;n cứu giảng dạy bạn c&oacute; thể học l&ecirc;n cao để tham gia v&agrave;o c&aacute;c trường đại học cao đẳng c&oacute; đ&agrave;o tạo chuy&ecirc;n ng&agrave;nh n&agrave;y.<br />\n&nbsp;<br />\nB&agrave;i viết tr&ecirc;n phần n&agrave;o đ&atilde; cung cấp những th&ocirc;ng tin to&agrave;n cảnh về&nbsp;<a href=\"https://www.hutech.edu.vn/tuyensinh/nganh-dao-tao/nganh-he-thong-thong-tin-quan-ly\"><strong>ng&agrave;nh Hệ thống th&ocirc;ng tin quản l&yacute;</strong></a>. Ngo&agrave;i những th&ocirc;ng tin &ldquo;Hệ thống th&ocirc;ng tin quản l&yacute; l&agrave; g&igrave;? Ra trường l&agrave;m g&igrave;?&rdquo; đ&atilde; nhận được từ b&agrave;i viết tr&ecirc;n, c&aacute;c bạn c&oacute; thể t&igrave;m hiểu th&ecirc;m c&aacute;c vấn đề li&ecirc;n quan kh&aacute;c như: ng&agrave;nh Hệ thống th&ocirc;ng tin x&eacute;t tuyển những tổ hợp m&ocirc;n n&agrave;o học những g&igrave;, học ở đ&acirc;u...? để chuẩn bị tốt nhất cho tương lai của m&igrave;nh.<br />\n&nbsp;</p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n	<tbody>\n		<tr>\n			<td>\n			<h3><strong>Ng&agrave;nh Hệ thống th&ocirc;ng tin v&agrave; quản l&yacute; l&agrave; g&igrave;?</strong></h3>\n			Ng&agrave;nh Hệ thống th&ocirc;ng tin v&agrave; quản l&yacute; l&agrave; ng&agrave;nh học kết hợp giữa phần cứng, phần mềm v&agrave; mạng truyền th&ocirc;ng, nhằm thu thập, tạo v&agrave; ph&acirc;n phối c&aacute;c dữ liệu th&ocirc;ng tin trong tổ chức, doanh nghiệp. Ng&agrave;nh học n&agrave;y c&oacute; ứng dụng mạnh mẽ trong quản l&yacute; database&nbsp; l&agrave;m cơ sở đ&aacute;nh gi&aacute; v&agrave; ph&acirc;n t&iacute;ch hiệu quả hoạt động của c&aacute;c tổ chức, doanh nghiệp</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, '2018-08-17 19:43:09', 1),
(18, 5, 'NNC001', 'Nhanh như chớp', '<h2><strong>THỂ LỆ TR&Ograve; CHƠI</strong></h2>\n\n<ul>\n	<li>Mỗi người tham gia bằng một t&agrave;i khoản x&aacute;c định, giải thưởng sẽ trao đ&uacute;ng chủ sỡ hữu t&agrave;i khoản đ&oacute; dựa v&agrave;o m&atilde; số sinh vi&ecirc;n.</li>\n	<li>Hạn ch&oacute;t tham gia đến đ&uacute;ng 14h ng&agrave;y 22/08/2018. Kết quả giải thưởng được c&ocirc;ng bố v&agrave;o 18h ng&agrave;y 22/08/2018.</li>\n	<li>Mỗi người chơi sẽ phải l&agrave;m hết b&agrave;i kiểm tra trắc nghiệm để được c&ocirc;ng nhận l&agrave; đủ điều kiện x&eacute;t nhận giải thưởng.</li>\n	<li>Điểm trung b&igrave;nh l&agrave; trung b&igrave;nh cộng điểm của 2 b&agrave;i kiểm tra trắc nghiệm, l&agrave;m tr&ograve;n đến chữ số thập ph&acirc;n thứ nhất.</li>\n	<li>Xếp hạng dựa v&agrave;o điểm trung b&igrave;nh từ cao đến thấp, nếu bằng điểm nhau sẽ x&eacute;t th&ecirc;m ti&ecirc;u ch&iacute; ng&agrave;y nộp để xếp hạng, người nộp b&agrave;i sớm hơn l&agrave; người c&oacute; thứ hạng cao hơn khi bằng điểm trung b&igrave;nh.</li>\n	<li>Ban tổ chức c&oacute; quyền hủy kết quả nếu nghi ngờ người tham gia cố t&igrave;nh ph&aacute; hoại hệ thống hay tấn c&ocirc;ng hệ thống.</li>\n	<li>Ban tổ chức l&agrave; người quyết định cuối c&ugrave;ng trong c&aacute;c trường hợp xảy ra m&acirc;u thuẫn.</li>\n</ul>\n\n<h2><strong>CƠ CẤU GIẢI THƯỞNG</strong></h2>\n\n<p><strong>&lt;Đ&atilde; hết thời gian tham gia&gt;</strong></p>\n', NULL, '2018-08-17 20:10:03', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_require`
--

CREATE TABLE `class_require` (
  `idClass` int(11) NOT NULL,
  `idClass_Require` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `class_require`
--

INSERT INTO `class_require` (`idClass`, `idClass_Require`) VALUES
(14, 15),
(14, 17),
(17, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_staff`
--

CREATE TABLE `class_staff` (
  `idClass` int(11) NOT NULL,
  `idStaff` int(11) NOT NULL,
  `DateSet` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lesson`
--

CREATE TABLE `lesson` (
  `idLesson` int(11) NOT NULL,
  `idClass` int(11) NOT NULL,
  `idCreator` int(11) DEFAULT NULL,
  `idLesson_Require` int(11) DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lesson`
--

INSERT INTO `lesson` (`idLesson`, `idClass`, `idCreator`, `idLesson_Require`, `Title`, `Content`, `DateCreated`) VALUES
(10, 15, 5, NULL, 'Bài 01: Giới thiệu về lập trình và môi trường lập trình', '<h2>Lập tr&igrave;nh l&agrave; g&igrave;?</h2>\n\n<p><img alt=\"Lập trình là gì\" src=\"https://opdo.vn/file/img/courses/coder1.jpg\" /></p>\n\n<p>M&igrave;nh sẽ kh&ocirc;ng giải th&iacute;ch theo lối khoa học bởi v&igrave; n&oacute; sẽ dễ g&acirc;y nh&agrave;m cho bạn, v&agrave; những định nghĩa đ&oacute; chỉ cần google l&agrave; ra cũng chẳng cần m&igrave;nh phải up l&ecirc;n đ&acirc;y. Vả lại&nbsp;<strong>kh&oacute;a học n&agrave;y kh&ocirc;ng đ&egrave; nặng t&iacute;nh kỹ thuật</strong>&nbsp;nữa.</p>\n\n<p>Lập tr&igrave;nh n&oacute; cũng giống như việc của thợ hồ vậy.</p>\n\n<p>Thợ hồ sử dụng&nbsp;<strong>c&aacute;t, xi măng,&hellip; v&agrave; c&aacute;c dụng cụ l&agrave;m hồ</strong>&nbsp;để&nbsp;<strong>x&acirc;y được một ng&ocirc;i nh&agrave;</strong>, th&igrave; lập tr&igrave;nh ch&iacute;nh l&agrave; việc sử dụng&nbsp;<strong>&ldquo;c&ocirc;ng cụ lập tr&igrave;nh&rdquo;</strong>&nbsp;để x&acirc;y dựng l&ecirc;n&nbsp;<strong>một chương tr&igrave;nh</strong>&nbsp;n&agrave;o đ&oacute;.</p>\n\n<hr />\n<h2>&ldquo;C&ocirc;ng cụ lập tr&igrave;nh&rdquo; l&agrave; g&igrave;?</h2>\n\n<p><img alt=\"Công cụ lập trình\" src=\"https://raw.github.com/bueltge/Aptana-Solarized/master/screenshots/Aptana-Solarized-Dark_001.png\" /></p>\n\n<p>M&igrave;nh n&oacute;i chung chung th&ocirc;i n&ecirc;n m&igrave;nh mới để trong ngoặc k&eacute;p, c&ocirc;ng cụ lập tr&igrave;nh bao gồm: ng&ocirc;n ngữ lập tr&igrave;nh v&agrave; một c&ocirc;ng cụ gi&uacute;p c&aacute;c bạn viết v&agrave; bi&ecirc;n dịch chương tr&igrave;nh</p>\n\n<p>N&oacute; c&oacute; thể l&agrave;<em>&nbsp;notepad, notepad</em>++<em>, sublime text</em>&nbsp;được gọi l&agrave; c&aacute;c&nbsp;<strong>editor&nbsp;</strong>v&igrave; hỗ trợ c&aacute;c bạn viết chứ kh&ocirc;ng hỗ trợ bi&ecirc;n dịch (thực ra sublime text c&oacute; nhưng phải tự tải về, setting chứ kh&ocirc;ng được t&iacute;ch hợp sẵn).</p>\n\n<p>N&oacute; c&oacute; thể l&agrave; c&aacute;c m&ocirc;i trường ph&aacute;t triển t&iacute;ch hợp như&nbsp;<em>Visual Studio, Android Studio, AutoIT ISN Studio</em>,&hellip;</p>\n\n<hr />\n<h2>Vậy bi&ecirc;n dịch l&agrave; g&igrave; nữa?</h2>\n\n<p>N&ocirc;m na thế n&agrave;y nh&eacute;, bạn ra nước ngo&agrave;i đi du lịch, giả sử đi L&agrave;o nhưng bạn lại kh&ocirc;ng biết n&oacute;i tiếng L&agrave;o, chắc chắn bạn cần phải c&oacute; một th&ocirc;ng dịch vi&ecirc;n để hỗ trợ m&igrave;nh đ&uacute;ng kh&ocirc;ng? Nhiệm vụ của người th&ocirc;ng dịch vi&ecirc;n n&agrave;y l&agrave; dịch tiếng Việt bạn n&oacute;i ra tiếng L&agrave;o cho họ hiểu.</p>\n\n<p><img alt=\"trình biên dịch\" src=\"http://www.desktopclass.com/wp-content/uploads/2012/01/Complier.jpg\" /></p>\n\n<p>Bạn với m&aacute;y cũng y chang vậy, bạn d&ugrave;ng ng&ocirc;n ngữ lập tr&igrave;nh (n&oacute; c&oacute; thể l&agrave; C, C++, Java, C#,&hellip;) nhưng đ&aacute;ng buồn l&agrave; m&aacute;y sử dụng ng&ocirc;n ngữ m&aacute;y (machine language). Điều n&agrave;y c&oacute; nghĩa l&agrave; khi bạn g&otilde;<strong>&nbsp;5+5=10</strong>&nbsp;th&igrave; m&aacute;y kh&ocirc;ng hiểu đ&acirc;u, n&oacute; chỉ hiểu dưới dạng nhị ph&acirc;n (binary) kiểu như thế n&agrave;y n&agrave;y:</p>\n\n<blockquote>\n<p>010101010101101 0010101001 010101010 010101010<br />\n<small>(m&igrave;nh chế đấy, chứ lười dịch ra lắm)</small></p>\n</blockquote>\n\n<p>V&agrave; v&igrave; vậy, xuất hiện một người được gọi l&agrave; th&ocirc;ng dịch vi&ecirc;n c&oacute; nhiệm vụ dịch từ ng&ocirc;n ngữ lập tr&igrave;nh ra ng&ocirc;n ngữ m&aacute;y, đ&oacute; ch&iacute;nh l&agrave; nhiệm vụ của tr&igrave;nh bi&ecirc;n dịch (complier)</p>\n\n<hr />\n<h2>Thế c&ograve;n c&aacute;i m&ocirc;i trường ph&aacute;t triển t&iacute;ch hợp?</h2>\n\n<p>Cũng dễ hiểu th&ocirc;i, một editor như<em>&nbsp;notepad, notepad++</em>&nbsp;hỗ trợ bạn<strong>&nbsp;chỉnh sửa m&atilde; nguồn</strong>&nbsp;của bạn đ&uacute;ng kh&ocirc;ng n&agrave;o? Nếu bạn định hỏi m&atilde; nguồn l&agrave; g&igrave; th&igrave; n&oacute; ch&iacute;nh l&agrave; c&aacute;i file chứa những thứ m&agrave; bạn sẽ phải ngồi g&otilde; g&otilde; khi lập tr&igrave;nh đ&oacute;.</p>\n\n<p>Th&igrave; m&ocirc;i trường ph&aacute;t triển t&iacute;ch hợp n&oacute; đỉnh hơn nhiều, ở chỗ n&oacute; t&iacute;ch hợp cho bạn mọi thứ: bạn sẽ c&oacute; editor, c&oacute; complier, c&oacute; những t&iacute;nh năng quản l&yacute; project của bạn, c&oacute; c&aacute;c tr&igrave;nh mỗ trợ tạo GUI (giao diện người d&ugrave;ng),&hellip; t&uacute;m lại n&oacute; l&agrave; một m&ocirc;i trường gi&uacute;p cho bạn ph&aacute;t triển c&aacute;c dự &aacute;n tầm trung v&agrave; lớn, quản l&yacute; dự &aacute;n một c&aacute;ch dễ d&agrave;ng hơn, n&oacute; gọi l&agrave; IDE.</p>\n\n<hr />\n<h2>Học lập tr&igrave;nh l&agrave; học những g&igrave;?</h2>\n\n<p><img alt=\"học lập trình\" src=\"http://s3.amazonaws.com/digitaltrends-uploads-prod/2015/10/school-coding.jpg\" /></p>\n\n<p>Học lập tr&igrave;nh nếu n&oacute;i một c&aacute;ch đầy đủ hết &yacute; nghĩa của n&oacute; th&igrave; d&agrave;i d&ograve;ng lắm, bạn sẽ phải học c&aacute;ch sử dụng c&aacute;c c&ocirc;ng cụ gi&uacute;p bạn lập tr&igrave;nh, học c&aacute;ch sử dụng ng&ocirc;n ngữ lập tr&igrave;nh, học c&aacute;c kỹ thuật lập tr&igrave;nh, học c&aacute;ch tư duy giải thuật để giải quyết c&aacute;c b&agrave;i to&aacute;n trong lập tr&igrave;nh,&hellip;</p>\n\n<p>Chung quy lại, bạn sẽ cần học 2 thứ:&nbsp;<strong>học c&aacute;ch code&nbsp;</strong>v&agrave; học c&aacute;ch<strong>&nbsp;suy nghĩ tư duy để code</strong>. Học c&aacute;ch code th&igrave; dễ, bởi v&igrave; ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;o cũng c&oacute; nhi&ecirc;u đ&oacute; cấu tr&uacute;c, nhi&ecirc;u đ&oacute; lệnh,&hellip; chứ c&ograve;n tư duy để code th&igrave; học cả đời v&agrave; kh&ocirc;ng ai c&oacute; thể dạy cho bạn to&agrave;n bộ được, n&oacute; l&agrave; một qu&aacute; tr&igrave;nh r&egrave;n luyện của bạn, m&igrave;nh chỉ ở đ&acirc;y hỗ trợ cho bạn m&agrave; th&ocirc;i.</p>\n\n<p><img alt=\"tư duy lập trình\" src=\"http://www.cncaptech.edu.vn/upload/news/images/tu-duy-lap-trinh.jpg\" /></p>\n\n<p>V&iacute; dụ cho dễ hiểu nh&eacute;, một người thợ hồ, khi họ x&acirc;y nh&agrave; th&igrave; họ sẽ sử dụng c&ocirc;ng cụ l&agrave;m hồ đ&uacute;ng kh&ocirc;ng, th&igrave; x&acirc;y ng&ocirc;i nh&agrave; n&agrave;o, họ cũng d&ugrave;ng đ&uacute;ng nhi&ecirc;u đ&oacute; c&ocirc;ng cụ, họa may l&agrave; th&ecirc;m d&agrave;n gi&aacute;o hay g&igrave; đ&oacute; th&ocirc;i. Nhưng, mỗi ng&ocirc;i nh&agrave; ở mỗi nơi, họ sẽ c&oacute; c&aacute;ch x&acirc;y kh&aacute;c nhau t&ugrave;y v&agrave;o bản vẽ v&agrave; t&ugrave;y v&agrave;o kinh nghiệm của họ, họ sẽ biết l&agrave;m như thế n&agrave;o l&agrave; đ&uacute;ng.</p>\n\n<p>Hay giống như việc bạn r&aacute;p lego vậy, th&igrave; hướng dẫn chỉ l&agrave; ở mức gi&uacute;p bạn c&oacute; những mảnh lego, c&ograve;n r&aacute;p như thế n&agrave;o, ra sao l&agrave; do nỗ lực của bạn.</p>\n\n<hr />\n<h2>Vậy n&oacute; c&oacute; kh&oacute; kh&ocirc;ng?</h2>\n\n<p>N&oacute; sẽ kh&oacute; n&ecirc;n như bạn &iacute;t c&oacute; đam m&ecirc; v&agrave; chỉ mong muốn học v&igrave;&nbsp;<em>&ldquo;thấy h&agrave;ng x&oacute;m ăn khoai liền v&aacute;c mai đi đ&agrave;o&rdquo;</em>.</p>\n\n<p>Học lập tr&igrave;nh&nbsp;<strong>kh&ocirc;ng phải l&agrave; chuyện một sớm, một chiều&nbsp;</strong>hay một hai tuần, m&agrave; n&oacute; l&agrave; chuyện của cả một qu&aacute; tr&igrave;nh d&agrave;i r&egrave;n luyện. N&oacute; y&ecirc;u cầu bạn c&oacute;&nbsp;<strong>đam m&ecirc;&nbsp;</strong>trước ti&ecirc;n, v&igrave; nếu kh&ocirc;ng, bạn sẽ ng&atilde; ngựa trước kh&oacute; khăn.</p>\n\n<p><img alt=\"how to study programming\" src=\"https://4.bp.blogspot.com/-qhlFyESVKyU/WHmjCQM6I4I/AAAAAAAABLU/ixYtofRQht8IikG4b4sCm6lFyOOGMG_LgCLcB/s1600/top-programming-languages-to-learn-in-2017_mini-700x350.jpg\" /></p>\n\n<p>Học lập tr&igrave;nh&nbsp;<strong>lu&ocirc;n vướng những kh&oacute; khăn nhất định đối với người mới bắt đầu</strong>, bạn kh&ocirc;ng đủ &yacute; ch&iacute; v&agrave; ki&ecirc;n tr&igrave;, bạn ng&atilde; ngữa.</p>\n\n<p>Chung quy lại, học lập tr&igrave;nh chỉ kh&oacute; nếu bạn kh&ocirc;ng c&oacute; tinh thần tự học, khi bạn kh&ocirc;ng c&oacute; &yacute; ch&iacute; kiến tr&igrave;. Ngo&agrave;i ra c&ograve;n lại, c&aacute;i kh&oacute; của lập tr&igrave;nh n&oacute; chỉ l&agrave; c&aacute;i thử th&aacute;ch v&agrave; loại trừ bạn hay kh&ocirc;ng th&ocirc;i, nếu vượt qua, bạn đ&atilde; được chọn!</p>\n', '2018-08-17 19:33:19'),
(11, 15, 5, 10, 'Bài 02: Bài toán trong lập trình', '<p>Chắc hẳn bạn biết đến Facebook nhỉ? Chắc chắn rồi v&igrave; kh&oacute;a học n&agrave;y y&ecirc;u cầu đăng nhập bằng facebook m&agrave;. Nếu như xem<strong>Facebook l&agrave; một b&agrave;i to&aacute;n lớn</strong>, th&igrave; để giải được b&agrave;i to&aacute;n đ&oacute; bạn&nbsp;<strong>phải giải được c&aacute;c b&agrave;i to&aacute;n nhỏ</strong>, để giải được c&aacute;c b&agrave;i to&aacute;n nhỏ bạn&nbsp;<strong>phải giải được c&aacute;c b&agrave;i to&aacute;n nhỏ hơn</strong>, cứ tiếp diễn như thế cho đến việc bạn&nbsp;<strong>phải giải được những b&agrave;i to&aacute;n ban đầu như 1+1=2, 2+2=4,...</strong>.</p>\n\n<p>&Yacute; m&igrave;nh l&agrave; g&igrave;? C&oacute; nghĩa l&agrave; những thứ m&igrave;nh hướng dẫn c&aacute;c bạn dưới n&agrave;y, đọc xong c&oacute; thể c&aacute;c bạn sẽ kh&ocirc;ng thấy hứng th&uacute; do &iacute;t li&ecirc;n quan đến mục đ&iacute;ch c&aacute;c bạn học l&agrave; l&agrave;m một ứng dụng thực tế chẳng hạn, nhưng bạn sẽ kh&ocirc;ng l&agrave;m được ứng dụng thực tế một c&aacute;ch ra hồn nếu bạn kh&ocirc;ng l&agrave;m được những điều b&ecirc;n dưới.</p>\n\n<p><img alt=\"\" src=\"http://media02.hongkiat.com/programming-myth/math-doom.jpg\" /></p>\n\n<p>Đ&ocirc;i l&uacute;c những c&aacute;i m&agrave; bạn học, do bạn kh&ocirc;ng hiểu được &yacute; nghĩa thực sự của n&oacute; n&ecirc;n bạn thường lơ l&agrave; v&agrave; kh&ocirc;ng ch&uacute; trọng đến n&oacute;, đến khi cần đến n&oacute; rồi th&igrave; đ&atilde; qu&aacute; muộn, đ&acirc;y ch&iacute;nh l&agrave; t&igrave;nh cảnh của nhiều bạn sinh vi&ecirc;n đại học khi học những m&ocirc;n m&agrave; họ kh&ocirc;ng hiểu d&ugrave;ng để l&agrave;m g&igrave; như<em>&nbsp;To&aacute;n rời rạc, Kỹ thuật lập tr&igrave;nh,&hellip;</em></p>\n\n<hr />\n<h2>B&agrave;i to&aacute;n trong lập tr&igrave;nh</h2>\n\n<p>Đ&acirc;y chỉ l&agrave; một c&aacute;ch gọi của m&igrave;nh, đ&oacute; c&oacute; thể l&agrave;&nbsp;<strong>một b&agrave;i to&aacute;n, một vấn đề</strong>&nbsp;nhưng chung quy<strong>&nbsp;n&oacute; cần được giải quyết trong lập tr&igrave;nh</strong>.</p>\n\n<p>Việc bạn suy nghĩ c&aacute;ch giải n&oacute; v&agrave; được ra phương &aacute;n giải quyết, được gọi l&agrave;<strong>&nbsp;thuật giải</strong>.</p>\n\n<p><img alt=\"lập trình một bài toán\" src=\"https://opdo.vn/file/img/courses/669e6746.png\" /></p>\n\n<p>V&iacute; dụ nh&eacute;, khi bạn A n&oacute;i với bạn B rằng: &quot;<em>h&ocirc;m nay bố tớ cho tớ 5.000 đồng, mẹ tớ cho tớ 7.000 đồng cậu t&iacute;nh hộ tớ xem tớ c&oacute; bao nhiều tiền rồi?</em>&quot;</p>\n\n<p>Đ&oacute; l&agrave; một b&agrave;i to&aacute;n, một vấn đề cần giải quyết trong thực tế, v&agrave; đương nhi&ecirc;n bạn sẽ giải quyết bằng c&aacute;ch, cộng hai số tiền lại rồi n&oacute;i kết quả cộng đ&oacute; cho bạn B. Th&igrave; việc bạn suy nghĩ v&agrave; giải quyết như thế được gọi l&agrave; Thuật giải.</p>\n\n<p>Một b&agrave;i to&aacute;n c&oacute; nhiều thuật to&aacute;n, giả sử ở tr&ecirc;n bạn giải bằng c&aacute;ch t&iacute;nh tổng 5.000+7.000=12.000</p>\n\n<p>Nhưng c&oacute; bạn kh&ocirc;ng th&iacute;ch, bạn ấy t&aacute;ch ra 5.000+5.000+2.000=10.000+2.000&nbsp;12.000</p>\n\n<p>Hơi r&atilde;nh rang khi l&agrave;m như thế v&igrave; n&oacute; chỉ l&agrave; v&iacute; dụ th&ocirc;i, điều đ&oacute; cho bạn thấy, hai người kh&aacute;c nhau, c&oacute; thể giải quyết một vấn đề bằng thuật giải kh&aacute;c nhau.</p>\n\n<hr />\n<h2>Ph&acirc;n t&iacute;ch dữ kiện b&agrave;i to&aacute;n</h2>\n\n<p>Một b&agrave;i to&aacute;n, vấn đề đưa ra, lu&ocirc;n c&oacute; 2 thứ:&nbsp;<strong>đầu v&agrave;o v&agrave; đầu ra (input v&agrave; output)</strong></p>\n\n<p>Khi bạn B đưa ra c&acirc;u hỏi như vậy, bạn B đ&atilde; cung cấp cho n&atilde;o bộ của bạn A rằng:&nbsp;<strong>bố cho 5.000 đồng, mẹ cho 7.000 đồng</strong>. Đồng thời cung cấp cho bạn A&nbsp;<strong>y&ecirc;u cầu l&agrave; t&iacute;nh tổng</strong>.</p>\n\n<p><img alt=\"\" src=\"https://opdo.vn/file/img/courses/fbb92657.png\" /></p>\n\n<p>Điều đ&oacute; n&oacute;i rằng, n&atilde;o bạn A l&uacute;c n&agrave;y xem 2 th&ocirc;ng tin:&nbsp;<strong>tiền bố cho, tiền mẹ cho l&agrave; 2 th&ocirc;ng tin đầu v&agrave;o</strong>, c&ograve;n&nbsp;<strong>th&ocirc;ng tin đầu ra phải trả về ch&iacute;nh l&agrave; tổng tiền</strong>&nbsp;(chứ kh&ocirc;ng phải hiệu, t&iacute;ch, thương g&igrave; cả).</p>\n\n<p>Khi đ&atilde; x&aacute;c định được đủ dữ liệu cũng như y&ecirc;u cầu, n&atilde;o bạn A sẽ xử l&yacute; c&aacute;c số liệu dựa v&agrave;o tư duy, kinh nghiệm bản th&acirc;n, v&agrave; cuối c&ugrave;ng kết quả đầu ra bạn A sẽ n&oacute;i cho bạn B biết số tiền m&agrave; bạn B đang c&oacute;.</p>\n\n<p>Lập tr&igrave;nh y chang vậy, khi một b&agrave;i to&aacute;n đưa ra, bạn phải tư duy cho được&nbsp;<strong>đầu v&agrave;o (input) v&agrave; đầu ra (output)&nbsp;</strong>dựa v&agrave;o y&ecirc;u cầu thực tế b&agrave;i to&aacute;n để&nbsp;<strong>giải quyết cho ph&ugrave; hợp</strong>.</p>\n\n<p>Đầu v&agrave;o c&oacute; thể được người d&ugrave;ng nhập v&agrave;o b&agrave;n ph&iacute;m theo y&ecirc;u cầu của chương tr&igrave;nh, đầu ra c&oacute; thể l&agrave; xuất ra m&agrave;n h&igrave;nh một đoạn th&ocirc;ng b&aacute;o chẳng hạn.</p>\n', '2018-08-17 19:34:19'),
(12, 15, 5, 11, 'Bài 03: Thứ quen thuộc trong lập trình: Biến', '<h2>Biến l&agrave; g&igrave;?</h2>\n\n<p><img alt=\"biến là gì?\" src=\"https://opdo.vn/file/img/courses/9cffd73e.png\" /></p>\n\n<p>Đ&acirc;y l&agrave; một định nghĩa trong lập tr&igrave;nh,&nbsp;<strong>biến&nbsp;</strong>hay&nbsp;<strong>variable&nbsp;</strong>hay gọi tắt hơn l&agrave; var. Th&igrave; biến sinh ra khi lập tr&igrave;nh y&ecirc;u cầu lưu trữ một gi&aacute; trị n&agrave;o đ&oacute; để phục vụ cho b&agrave;i to&aacute;n của họ.</p>\n\n<p>M&igrave;nh giả sử bạn A v&agrave; bạn B ở b&agrave;i trước. Khi B n&oacute;i rằng,&nbsp;<em>bố cho 5.000 đồng c&ograve;n mẹ cho 7.000 đồng</em>&nbsp;th&igrave; lập tức ở đ&acirc;u đ&oacute; v&ograve;ng v&ograve;ng trong n&atilde;o bạn A sẽ&nbsp;<strong>ghi nhớ</strong>&nbsp;rằng:&nbsp;<strong>bố 5.000 đồng, mẹ 7.000 đồng</strong>. Th&igrave; 5.000 v&agrave; 7.000 ch&iacute;nh l&agrave;&nbsp;<strong>gi&aacute; trị</strong>, c&ograve;n bố v&agrave; mẹ ch&iacute;nh l&agrave;&nbsp;<strong>t&ecirc;n biến</strong>.</p>\n\n<p><img alt=\"Biến trong lập trình\" src=\"https://opdo.vn/file/img/courses/423cf743.png\" /></p>\n\n<p>Vậy, khi một chương tr&igrave;nh y&ecirc;u cầu người d&ugrave;ng nhập v&agrave;o tiền bố cho, tiền mẹ cho, th&igrave;&nbsp;<strong>ch&uacute;ng ta cũng phải lưu lại gi&aacute; trị đ&oacute; để t&iacute;nh to&aacute;n</strong>. Lưu ở đ&acirc;u? Bộ nhớ. Lưu như thế n&agrave;o? Ch&uacute;ng ta đều th&ocirc;ng qua biến l&agrave; chủ yếu.</p>\n\n<p><strong>Biến c&oacute; t&ecirc;n</strong>, t&ecirc;n n&oacute; c&oacute; thể l&agrave;<em>&nbsp;a, b, c, d, tien_bo_cho, tien_me_cho,&hellip;&nbsp;</em>mỗi ng&ocirc;n ngữ lập tr&igrave;nh quy định một c&aacute;ch kh&aacute;c nhau về c&aacute;ch đặt t&ecirc;n biến, nhưng đa số đều c&oacute; điểm chung l&agrave; t&ecirc;n biến chỉ chứa c&aacute;c k&yacute; tự từ a-Z, số 0-9, dấu gạch ch&acirc;n (_).</p>\n\n<p>V&agrave; mỗi c&aacute;i t&ecirc;n như thế n&oacute; đại diện cho một &ocirc; nhớ trong bộ nhớ. Biến lưu được gi&aacute; trị như n&atilde;o bộ của m&igrave;nh, gi&aacute; trị đ&oacute; nằm ở &ocirc; nhớ m&agrave; biến đ&oacute; đại diện.</p>\n\n<p><img alt=\"\" src=\"https://opdo.vn/file/img/courses/cprogrammingscanf004.png\" /></p>\n\n<p>Giả sử khi viết một&nbsp;<strong>chương tr&igrave;nh t&iacute;nh tổng biến bố v&agrave; mẹ cho</strong>, ta sẽ tạo 2 biến&nbsp;<strong>tien_bo&nbsp;</strong>(tiền bố) v&agrave;&nbsp;<strong>tien_me&nbsp;</strong>(tiền mẹ), v&agrave; gi&aacute; trị của&nbsp;<strong>2 biến n&agrave;y l&agrave; do người d&ugrave;ng nhập v&agrave;o</strong>, th&igrave; khi xuất ra m&agrave;n h&igrave;nh, ta chỉ cần xuất ra tổng tiền bạn B c&oacute; l&agrave;&nbsp;<strong>tien_bo + tien_me</strong>.</p>\n\n<hr />\n<h2>Khi n&agrave;o d&ugrave;ng biến?</h2>\n\n<p>Biến d&ugrave;ng với mục đ&iacute;ch lưu trữ một gi&aacute; trị để ta gọi v&agrave; xử l&yacute; th&ocirc;ng tin trong đ&oacute;, giả sử b&agrave;i to&aacute;n tổng tiền bạn B, nếu kh&ocirc;ng c&oacute; biến th&igrave; ta cộng kiểu g&igrave;? Kh&ocirc;ng c&oacute; biến th&igrave; cũng giống như n&atilde;o bạn A kh&ocirc;ng lưu th&ocirc;ng tin m&agrave; bạn B cung cấp vậy.</p>\n\n<p>Biến cũng&nbsp;<strong>c&oacute; thể thay đổi gi&aacute; trị</strong>. Giả sử bạn B n&oacute;i l&agrave;: &ldquo;&Agrave; nhầm, mẹ tớ chỉ cho tớ c&oacute; 2.000 đồng th&ocirc;i&rdquo; th&igrave; lập tức n&atilde;o bạn A sẽ đổi gi&aacute; trị tiền mẹ cho từ 7.000 đồng th&agrave;nh 2.000 đồng (chứ kh&ocirc;ng x&oacute;a rồi nhớ lại, chỉ ghi đ&egrave; l&ecirc;n th&ocirc;i)</p>\n\n<p>Trong lập tr&igrave;nh cũng y chang, tien_me l&agrave; 7.000 đồng khi người d&ugrave;ng nhập v&agrave;o, ta vẫn c&oacute; quyền thay đổi gi&aacute; trị của n&oacute;, v&iacute; dụ:</p>\n\n<pre>\n<code>// L&uacute;c đầu bạn tiền mẹ cho l&agrave; 7.000 đồng được lưu trong biến tien_me\ntien_me = 7000;\n// L&uacute;c sau, bạn B nhớ lại mẹ chỉ cho 2.000 đồng n&ecirc;n biến tien_me thay đổi gi&aacute; trị từ 7000 th&agrave;nh 2000\ntien_me = 2000;\n</code></pre>\n\n<p>Select Code</p>\n\n<hr />\n<h2>T&iacute;nh to&aacute;n tr&ecirc;n biến</h2>\n\n<p>Giả sử rằng bạn B&nbsp;<strong>kh&ocirc;ng n&oacute;i rằng</strong>&nbsp;mẹ bạn ấy cho bạn ấy 7.000 đồng m&agrave; bạn ấy n&oacute;i rằng : &ldquo;Số tiền mẹ tớ cho nhiều hơn 2.000 đồng so với tiền bố tớ cho&rdquo; . Th&igrave; n&atilde;o bạn A sẽ lấy th&ocirc;ng tin cũ l&uacute;c n&atilde;y ra t&iacute;nh to&aacute;n :&nbsp;<strong>tiền mẹ = tiền bố cho + 2000 = 7000</strong></p>\n\n<p>Lập tr&igrave;nh y chang, bạn c&oacute; thể t&iacute;nh to&aacute;n cộng, trừ, nh&acirc;n, chia tr&ecirc;n biến tự do:</p>\n\n<pre>\n<code>tien_bo = 5000;\ntien_me = tien_bo + 2000;\n// Vậy l&uacute;c n&agrave;y tien_me sẽ l&agrave; 7000</code>\n</pre>\n\n<p>Select Code</p>\n\n<p>Vậy nếu như l&aacute;t nữa bạn B n&oacute;i rằng : Mẹ tớ cho tớ th&ecirc;m 2000 đồng nữa th&igrave; sao nhỉ? Th&igrave; cũng t&iacute;nh to&aacute;n như b&igrave;nh thường th&ocirc;i :</p>\n\n<pre>\n<code>tien_me = tien_me + 2000;\n</code>// L&uacute;c n&agrave;y tien_me sẽ l&agrave; 9000</pre>\n\n<p>Select Code</p>\n', '2018-08-17 19:39:17'),
(13, 15, 5, 12, 'Bài 04: Tiếp tục khóa học lập trình', '<p>V&agrave;o đ&acirc;y nha&nbsp;https://opdo.vn/course/lap-trinh-la-lap-trinh</p>\n\n<p>=))</p>\n', '2018-08-17 19:39:48'),
(14, 16, 5, NULL, 'Bài 01: Khởi nghiệp là gì?', NULL, '2018-08-17 19:41:47'),
(15, 16, 5, NULL, 'Bài 02: Chuẩn bị hồ sơ khởi nghiệp', NULL, '2018-08-17 19:42:08'),
(16, 16, 5, NULL, 'Bài 03: Đánh bóng ý tưởng', NULL, '2018-08-17 19:42:19'),
(17, 16, 5, NULL, 'Bài 04: Tài chính và nhân sự', NULL, '2018-08-17 19:42:30'),
(23, 18, 5, NULL, 'Minigame 01: Chủ đề về HUTECH', '<p><strong>Chơi vui th&ocirc;i, đừng &aacute;p lực qu&aacute; ^^</strong></p>\n\n<p><strong>C&aacute;m ơn bạn đ&atilde; ủng hộ sản phẩm nh&eacute;, ch&uacute;c bạn may mắn &lt;3</strong></p>\n', '2018-08-18 18:08:29'),
(25, 15, 5, NULL, 'Bài 05: Kiểm tra tự luận', '', '2018-08-19 22:39:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member`
--

CREATE TABLE `member` (
  `idMember` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idStudent` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idClass` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `Password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member`
--

INSERT INTO `member` (`idMember`, `Name`, `idStudent`, `idClass`, `Email`, `Phone`, `DateCreated`, `Password`, `Status`) VALUES
(5, 'Phạm Ngọc Vinh', '1611060042', '16DTHA2', 'vinhphamdhsp@live.com', '01207743502', '2018-08-11 23:12:41', 'b5973363feecc2ffe1c865b257567fe0', b'0'),
(11, 'Nguyễn Tuệ', '1611060040', '16DTHA2', 'tuenguyen@gmail.com', '0903188445', '2018-08-17 19:46:13', '202cb962ac59075b964b07152d234b70', b'1'),
(13, 'Hồ Tsống Dỉn ', '1611061949', '16DTHC6', 'aimabiet@gmail.com', '080823508', '2018-08-17 20:02:35', 'dcddb75469b4b4875094e14561e573d8', b'0'),
(14, 'Nguyễn Th&agrave;nh Khang', '1611061330', '16DTHC2', 'thanhkhangkarate1@gmail.com', '01262904753', '2018-08-17 21:03:27', 'b607148f7a90a019f177aed30507f624', b'0'),
(15, 'Ngô Thanh Hoàng ', '1611060120', '16DTHA2', 'hoang.soul@yahoo.com.vn', '01655531595', '2018-08-17 21:13:17', '2645d25d27fd4833935f05f2e60c4511', b'0'),
(16, 'Nghiêm Quốc Anh Minh ', '1611060973', '16DTHA1', 'nghiemminh1904@gmail.com', '01639895154', '2018-08-17 21:27:46', '827ccb0eea8a706c4c34a16891f84e7b', b'0'),
(17, 'Đào Kim Sơn ', '1612360031', '16CTHA1', 'son10031989@gmail.com', '0908358689', '2018-08-17 22:05:55', '3d97377f73c2449c8fa0b9fd0840e605', b'0'),
(18, 'Kiều Nhất Thống ', '1611060387', '16DTHA2', 'kieuthong16dth@gmail.com', '0947613923', '2018-08-17 22:06:01', 'c8c605999f3d8352d7bb792cf3fdb25b', b'0'),
(19, 'Phạm Thanh Thiên ', '1611060268', '16DTHA2', 'phamthanhthien1910@gmail.com', '0888734797', '2018-08-17 22:10:03', 'c4ca4238a0b923820dcc509a6f75849b', b'0'),
(20, 'Trần Tuấn Nghĩa ', '1611060366', '16DTHA2', 't.tuan.nghia98@gmail.com', '01693576089', '2018-08-17 22:17:20', 'cfd010011c85cc2a579cd647e57a3098', b'0'),
(21, 'Nguyễn Mạnh Cường ', '1611060344', '16DTHA2', 'cuog1598@gmail.con', '1127377373', '2018-08-17 22:23:02', '270ec3c932703968cf6e1c6427e0d2bf', b'0'),
(22, 'Bạch Công Hiếu ', '1611060452', '16DTHA2', 'bachchieu1998@gmail.com', '01667738908', '2018-08-17 22:28:36', '25b145d4667983d84431f65a5d33ed1e', b'0'),
(23, 'Nguyễn Quốc Bảo ', '1611060055', '16DTHA2', 'baonguyenquoc14@gmail.com', '01692544271', '2018-08-17 22:32:58', '8d0a5774cc9eb99d9ee8051cc500e160', b'0'),
(24, 'Nguyễn Trung Phụng ', '1611060219', '16DTHA2', 'phung@gmail.com', '01207743501', '2018-08-17 23:05:41', 'c4ca4238a0b923820dcc509a6f75849b', b'0'),
(25, 'Nguyễn Hữu Chính ', '1611060066', '16DTHA2', 'niine0902@gmail.com', '01679105833', '2018-08-17 23:09:14', '67879666bad1d87475e509f428be3dd5', b'0'),
(26, 'Nguyễn Lê Hoàng Huy ', '1611060459', '16DTHA2', 'hoanghuy481@gmail.com', '0986829429', '2018-08-17 23:14:33', '22701411f785be8c7102445ecb469f65', b'0'),
(27, 'Văn Khánh Vương ', '1611060546', '16DTHA2', 'tranhoangtien123456@gmail.com', '01206230389', '2018-08-18 19:09:30', 'b7415e00450b917ca0548dbce43f9d09', b'0'),
(28, 'Vũ Quốc Huy ', '1711060142', '17DTHB3', 'vuquochuyz99@gmail.com', '111111111', '2018-08-18 23:49:58', '179e6c0f6ef4ce0ed1e191d52d76de6a', b'0'),
(29, 'Nguyễn Hữu Thiên ', '1711060858', '17DTHA3', 'huuthien198zz@gmail.com', '0972863589', '2018-08-18 23:51:12', 'b1a332477be257962a0d48019c2d4baf', b'0'),
(30, 'Trần Võ Tố Quyên ', '1611060229', '16DTHA1', 'tranvotoquyen@gmai.com', '0973619963', '2018-08-18 23:51:44', 'e66f3231362d0d9a51bb0bedf78d8990', b'0'),
(31, 'Trần Anh Hào ', '1611060924', '16DTHB6', 'haojame138998@gmail.com', '01884473197', '2018-08-18 23:54:32', '83422503bcfc01d303030e8a7cc80efc', b'0'),
(32, 'Châu Văn Hưng ', '1711062195', '17DTHC6', 'chauvanhung1999@gmail.com', '01683271967', '2018-08-18 23:56:01', 'bb94c15477ad3c6cce1838e7da7e3af0', b'0'),
(33, 'Huỳnh Thái Bảo Trân ', '1611060291', '16DTHA2', 'duhuynhhutech@gmail.com', '0869177504', '2018-08-18 23:57:08', 'c232f477970a866329a3b439cf3f0d74', b'0'),
(34, 'Đỗ Xuân Phúc ', '1711060255', '17DTHA3', 'nhoklovemy1207@gmail.com', '01665866608', '2018-08-18 23:57:50', 'e10adc3949ba59abbe56e057f20f883e', b'0'),
(35, 'Hà Minh Anh ', '1611060549', '16DTHA2', 'haminhanh52@gmail.com', '0898024990', '2018-08-18 23:58:40', 'e10adc3949ba59abbe56e057f20f883e', b'0'),
(36, 'Hoàng Bảo Trung ', '1711061856', '17DTHC5', 'hoangtrung3113@gmail.com', '6546456789', '2018-08-19 00:00:44', 'c48768c39be9439677e11758bf41dc0e', b'0'),
(37, 'Phạm Văn Trọng ', '1612360022', '16CTHA1', 'zzzvantrong@gmail.com', '01659000244', '2018-08-19 00:04:02', 'c9d8b3d32c6e1732671ec282f0ab3182', b'0'),
(38, 'Nguyễn Thành Chung ', '1711230383', '17DMAA2', 'chungnottrug@gmail.com', '01204611620', '2018-08-19 00:04:45', '1fb098e1d15d90e33672a8f285280502', b'0'),
(39, 'Hoàng Bá Minh Ngọc ', '1611061853', '16DTHC6', 'hoangngoc@gmail.com', '01234567891', '2018-08-19 00:05:23', '202cb962ac59075b964b07152d234b70', b'0'),
(40, 'Mai Hồng Quyền ', '1611060642', '16DTHA2', 'maihquyen98@gmail.com', '01698944445', '2018-08-19 00:08:31', '65cf207856ce50cf96d8f9d0d39aadd7', b'0'),
(41, 'Đoàn Ngọc Thiện ', '1611061718', '16DTHB5', 'doanngocthien98@gmail.com', '0868040598', '2018-08-19 00:10:58', '5341ddc614694db0585d6e544bf13f47', b'0'),
(42, 'Trần Xuân Trường ', '1711061367', '17DTHB2', 'dmmlmm456@gmail.com', '01882054546', '2018-08-19 00:13:22', '4b3a7dcc5a3220f3dedf6e04e6133890', b'0'),
(43, 'Nguyễn Phương Khải ', '1711061824', '17DTHC1', 'bet365yasuo@gmail.com', '01689266624', '2018-08-19 00:15:08', 'f5e455bb31486e9fa904e8b783d94569', b'0'),
(44, 'Nguyễn Ngọc Thúy Quỳnh ', '1611060230', '16DTCA3', 'quynh061298@gmail.com', '0929845504', '2018-08-19 00:17:48', '7337e2f117b38edd90ef8ddd50c31406', b'0'),
(45, 'Nguyễn Phước Thảo ', '1611060647', '16DTHA2', 'fatrabbit1203@gmail.com', '0937230411', '2018-08-19 00:23:29', '0eba360086471330a220339e2eeb8475', b'0'),
(46, 'Nguyễn Minh Duy ', '1711060071', '17DTHB3', 'accbest33@gmail.com', '0937563000', '2018-08-19 00:28:02', '90b969de6f1ee21601ea44cd554f1bc4', b'0'),
(47, 'Hoàng Đình Huy ', '1611230460', '16DMAB1', 'hoanghuy1kt@gmail.com', '0949969088', '2018-08-19 00:40:09', 'cfff1b03cb5c7eed7bc2c38a9999cca6', b'0'),
(48, 'Trần Hoài Thương', '1611060000', '16DTHA2', 'thuong@gmail.com', '0922033605', '2018-08-19 00:43:33', 'c4ca4238a0b923820dcc509a6f75849b', b'0'),
(49, 'Nguyễn Hiếu Nghĩa ', '1611060774', '16DTHA1', 'hieunghia151998@gmail.com', '01666065309', '2018-08-19 00:58:55', '333e6ae68dc877dc47772f7b8bb7bd7e', b'0'),
(50, 'Chu Cẩm Phong ', '1711060495', '17DTHJA1', 'zhujinfeng1999@gmail.com', '0938997287', '2018-08-19 01:00:39', 'c20eca94b9b7f8fd6598c200e2bb47bd', b'0'),
(51, 'Đỗ Đức Lợi ', '1611060620', '17DATA1', 'loikgkg1@gmail.com', '01232747747', '2018-08-19 01:01:55', '65118a4a7d3c792dda15adfb214aee22', b'0'),
(52, 'Trương Minh Nghĩa ', '1611060983', '16DTHB3', 'nghiamaster16091998@gmail.com', '01698301372', '2018-08-19 01:05:04', '14d5caeecb3a20d4da70d28a0eda5bed', b'0'),
(53, 'Nguyễn Thị Phương Tiền ', '1711060332', '17DTHA2', '1711060331@gmail.com', '0919406334', '2018-08-19 01:07:19', 'd3a7542d15d8f4061de0893e63ec9550', b'0'),
(54, 'Đỗ Lê Nhật Lâm ', '1611150754', '16DLHA2', 'lam.dolenhat@gmail.com', '0914424082', '2018-08-19 01:07:42', '452575ba0ffa9f34636240d828122469', b'0'),
(55, 'Trần Minh Chiến ', '1411060028', '14DTHC01', 'anhdsi@google.com', '0976458375', '2018-08-19 01:11:03', '92c909f621c95d8c2c8be3a31f377854', b'0'),
(56, 'Hồ Mậu Tài ', '1411060263', '14DTHC01', 'homautai@gmail.com', '0965125441', '2018-08-19 01:26:26', '25f9e794323b453885f5181f1b624d0b', b'0'),
(57, 'Nguyễn Tiến Anh ', '1711061009', '17DTHA4', 't2fcnumber2@gmail.com', '01696810692', '2018-08-19 01:43:30', 'd599556566899a79dc274443f7cc5818', b'0'),
(58, 'Vũ Văn Nguyên ', '1611060199', '16DTHB4', 'hoangnguyenvuive210698@gmail.com', '01654306290', '2018-08-19 06:50:53', 'bce3d7f8d712a8a8bab5c31cfe291c8f', b'0'),
(59, 'Lâm Thanh Toàn ', '1611060852', '16DTHC2', 'lamthanhtoan1851998@yahoo.com', '0919906364', '2018-08-19 06:59:34', 'cb550f9c5a7694976f086f1fc0c7d490', b'0'),
(60, 'Hồng Nghi Phụng ', '1611060796', '16DTHC1', 'hongnghiphung@gmail.com', '0935869010', '2018-08-19 07:04:45', '25f9e794323b453885f5181f1b624d0b', b'0'),
(61, 'Nguyễn Đình Trọng ', '1711060984', '17DTHB1', 'nguyendinhtrong081299@gmail.com', '01642065153', '2018-08-19 07:14:49', '7a9f8059c8e64d8454fd336211196950', b'0'),
(62, 'Nguyễn Ngọc Như Quỳnh ', '1611701246', '16DDUD5', 'nhuquynh21061987@gmail.com', '0947841718', '2018-08-19 07:19:25', '96026c23c3440a25661be13c82cbb6fc', b'0'),
(63, 'Nguyễn Công Hoàng Vũ ', '1611061077', '16DTHB6', 'nguyenconghoangvu1@gmail.com', '01666938218', '2018-08-19 07:22:20', '20917c851c4a54f2a054390dac9085b7', b'0'),
(64, 'Bùi Ngọc Khang ', '1611060513', '16DTHA2', 'ngockhang034@gmail.com', '01644439648', '2018-08-19 07:27:36', '9a055ad8e1007bdfa4aaf2cd431a4090', b'0'),
(65, 'Lê Trí Nam ', '1611061969', '16DTHC6', 'namlt@gmail.com', '0935942829', '2018-08-19 07:52:06', '202cb962ac59075b964b07152d234b70', b'0'),
(66, 'Võ Thị Hồng Vân ', '1611230412', '16DMAB1', 'vothihongvan09121998@gmail.com', '01637561160', '2018-08-19 08:59:21', '6cc1baf3bc9404a15195d25236df8265', b'0'),
(67, 'Phạm Thị Hoa ', '1611061509', '16DTHB1', 'phamhoaqqb98@gmail.com', '01644580633', '2018-08-19 09:05:40', '9810784ce10b72a1ef2f50bc5fec59ba', b'0'),
(68, 'Nguyễn Quý Nhật Tú ', '1611061939', '16DTHB6', 'nhattu199892@gmail.com', '0962808276', '2018-08-19 09:22:45', '1d04f2eed72f306e6049ef348111db3b', b'0'),
(69, 'Nguyễn Quang Trường ', '1611060404', '16DTHA2', 'nqtruong060998@gmail.com', '01628972255', '2018-08-19 09:32:10', 'df96220fa161767c5cbb95567855c86b', b'0'),
(70, 'Trần Thị Ngọc Trâm ', '1611061162', '16DTHB6', 'ngoctram4798@gmail.com', '01279555611', '2018-08-19 10:01:41', 'ae4e22bfdc65c8ef5064e784b605f9f5', b'0'),
(71, 'Phạm Đình Phùng ', '1611062053', '16DTHB6', 'nhalakhu5pk@gmail.com', '01649965903', '2018-08-19 10:58:42', '4cc90c2aa2ad17821cc90f9486a47051', b'0'),
(72, 'Võ Thanh Duy ', '1612360114', '16CTHA1', 'duyinsec@gmail.com', '0902438373', '2018-08-19 11:41:34', '915ed017d047fb2e7edc59c69b053a17', b'0'),
(73, 'Hồ Thanh Sang ', '1711060848', '17DTHA4', 'hothanhsang868@gmail.com', '0976312167', '2018-08-19 11:56:02', '996f669ee1402adf5bf1982f9ab13b74', b'0'),
(74, 'Nguyễn Thị Lan ', '1611230771', '16DMAB1', 'moclan1998@gmail.com', '01634860145', '2018-08-19 20:56:00', '44e4eb41d3ce8f5c371b5cee22a93206', b'0'),
(75, 'Hồ Duy Thuần ', '1711061344', '17DTHC5', '123thuanho@gmail.com', '0869944102', '2018-08-20 00:51:15', '1de624b6c77a6bcc5b3620e2d55cb5b2', b'0'),
(76, 'Nguyễn Thái Huy ', '1611060742', '16DTHB3', 'nguyenthaihuy12a3@gmail.com', '01222221622', '2018-08-20 11:39:48', '11e77eb2334cc57338d42a9160c95b50', b'0'),
(77, 'Trương Minh Huy ', '1611060133', '16DTHA2', 'minhuy2302@gmail.com', '0889656744', '2018-08-21 12:30:54', 'b8a4aeb107d92361aa57bcec0c08f1e8', b'0'),
(78, 'Lâm Thành Long ', '1511060539', '15DTH03', 'lamthanhlong70@gmail.com', '0966987120', '2018-08-21 12:41:15', 'd20c1fc60348f7eb1c57020b41a1b340', b'0'),
(79, 'Nguyễn Văn Mạnh ', '1611060469', '16DTHA2', 'nvmah050@gmail.com', '0934980748', '2018-08-21 13:00:48', '28b887afcadd3dca1872383543c46146', b'0'),
(80, 'Nguyễn Quang Huy ', '1611060130', '16DTHA1', 'ngquanghuy595@live.com', '0908342105', '2018-08-21 13:02:25', '9995082c9c6131999229a98221947253', b'0'),
(81, 'Thái Lý Việt ', '1611062185', '16DTHC7', 'lyviet192@gmail.com', '01212452056', '2018-08-21 13:14:29', '0816f474ec0a167a21b2e466236d8f1e', b'0'),
(82, 'Mê Quang Nhật ', '1611061926', '16DTHB6', 'quangnhat7298@mail.com', '01637287878', '2018-08-21 13:15:22', 'a8a77e8220b18e219245e4d8d6d10acb', b'0'),
(83, 'Trần Văn Quang ', '1611061863', '16DTHA1', 'quangnguyenvanquang8698@gmail.com', '01633847733', '2018-08-21 13:26:45', '7ebdfcde03734ae7637be116ea937301', b'0'),
(84, 'Phan Trung Huy ', '1711060138', '17DTHA5', 'hoanghac1999@gmail.com', '01666440472', '2018-08-21 13:27:37', 'a9e613cb8ecebd0517fbe86c75e5720c', b'0'),
(85, 'Tô Thanh Giang ', '1611060505', '16DTHQA2', 'thanhgiang753@gmail.com', '0974807828', '2018-08-21 13:32:21', 'bd2aa84d5e7db2539985cdf05cda6425', b'0'),
(86, 'Nguyễn Huy Chương ', '1611060067', '16DTHA2', 'chuong4101998@gmail.com', '0938428534', '2018-08-21 13:41:49', '50a003a24226f99d5686adafba760aeb', b'0'),
(87, 'Lương Công Hiếu ', '1611060453', '16DTHA1', 'luonghieu184@gmail.com', '01669173043', '2018-08-21 14:00:39', '21216d4c3896df785faca99361bf441e', b'0'),
(88, 'Vương Gia Bảo', '1811062582', '18DTHC1', '', '', '2018-08-21 14:18:25', 'c8837b23ff8aaa8a2dde915473ce0991', b'0'),
(89, 'Võ Bá Long ', '1611060162', '16DTHA1', 'hutvobalong@gmail.com', '0926252667', '2018-08-21 14:19:38', 'f3b9cc57d0bd62c5dcc67c1aec92cca0', b'0'),
(90, 'Hoàng Thành Hiếu ', '1611180356', '16DTHA1', 'thanhhieudl98@gmail.com', '0938842638', '2018-08-21 15:17:51', '93adf311acf0ded31a90f4fbe7259ded', b'0'),
(91, 'Trần Đăng Doanh ', '1611061896', '16DTHC6', 'dangdoanh98@gmail.com', '0909900009', '2018-08-21 16:31:41', '8a3e411ece5829ca0e35ee3cb5fc4661', b'0'),
(92, 'Nguyễn Bích Trâm ', '1611060855', '16DTHB6', 'bichtram2352@gmail.com', '01657155645', '2018-08-21 16:55:45', '234be7e8993577db6b0da3735eaa7f6c', b'0'),
(93, 'Đỗ Thị Mỹ Hạnh ', '1711061551', '17DTHB5', 'mocmien140699@gmail.com', '0935942829', '2018-08-21 21:03:40', '4297f44b13955235245b2497399d7a93', b'0'),
(94, 'Trương Phước Nghĩa ', '1611060367', '16DTHB4', 'pnghiaacoustic@gmail.com', '0924241775', '2018-08-21 21:40:22', '2a411d70be2397e39dcaf6f2ffd7bd67', b'0'),
(95, 'Nguyễn Bảo Bảo ', '1511060429', '15DTH06', 'baobaoht1997@gmail.com', '0964114705', '2018-08-21 23:38:26', 'c729a32b6fad989f9dfc9e0a5e320cec', b'0'),
(96, 'Huỳnh Trần Công Danh ', '1511060442', '15DTH06', 'trandanh364@gmail.com', '0961050993', '2018-08-21 23:49:51', '433d9ed940a359e0d5e368a5f3469295', b'0'),
(97, 'Huỳnh Khải Nguyên ', '1411060555', '14DTHH02', 'huynhkhainguyen1995@gmail.com', '0909829109', '2018-08-22 20:04:23', 'e99a18c428cb38d5f260853678922e03', b'0'),
(98, 'Trần Minh Tuấn ', '1611060318', '16DTHA1', 'tuan1491998@gmail.com', '0123456789', '2019-11-27 07:22:07', '85b6f5bdd48578f83c77928f695f4b60', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `idNews` int(11) NOT NULL,
  `idClass` int(11) NOT NULL,
  `idCreator` int(11) DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `Status` tinyint(4) DEFAULT 1,
  `Pintop` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `parameter`
--

CREATE TABLE `parameter` (
  `idPARAMETER` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `parameter`
--

INSERT INTO `parameter` (`idPARAMETER`, `Content`) VALUES
('LOG_SYS_EDIT_ID', '5'),
('LOG_SYS_EDIT_TIME', '2018/08/15 21:40'),
('WEB_DETAIL', 'E-learning là phương thức học tập thông qua một thiết bị có kế nối mạng với một máy chủ ở nơi khác có lưu trữ sẵn các nội dung học tập dạng số và phần mềm'),
('WEB_KEYWORD', 'elearning'),
('WEB_TITLE', 'E-learning');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_choose`
--

CREATE TABLE `question_choose` (
  `idQuestion` int(11) NOT NULL,
  `ChooseA` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChooseB` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChooseC` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChooseD` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Answer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `question_choose`
--

INSERT INTO `question_choose` (`idQuestion`, `ChooseA`, `ChooseB`, `ChooseC`, `ChooseD`, `Answer`) VALUES
(6, '2', '3', '4', '5', '2'),
(7, '8', '10', '12', '14', '2'),
(8, '30% quá trình và 70% kết thúc môn', '20% quá trình và 80% kết thúc môn', '50% quá trình và 50% kết thúc môn', '', '3'),
(9, '1', '2', '3', '4', '3'),
(10, 'F', 'F+', 'D', 'D+', '2'),
(11, 'Phòng Công Tác Sinh Viên', 'Phòng Đoàn Hội', 'Phòng Đào Tạo ', 'Văn phòng Khoa / Viện', '1'),
(12, '10 tiết lý thuyết', '30 tiết lý thuyết', '15 - 30 tiết thực hành', '30 - 45 tiết thực hành', '4'),
(13, '2 điểm', '2.5 điểm', '3 điểm', '3.5 điểm', '3'),
(14, '2 điểm', '2.5 điểm', '3 điểm', '3.5 điểm', '1'),
(15, 'An toàn thông tin', 'Hệ thống thông tin', 'Bảo mật thông tin', 'Công nghệ thông tin', '4'),
(16, 'An toàn thông tin', 'Hệ thống thông tin', 'Bảo mật thông tin', 'Công nghệ thông tin', '2'),
(17, 'Chứng chỉ Anh Văn B', 'Điểm rèn luyện toàn khòa > 80', 'Điểm tích lũy toàn khóa > 2.0', 'Chứng chỉ tin học', '4'),
(18, 'Sinh viên đại học chính quy khóa 16 ngành Công nghệ thông tin', 'Sinh viên cao đẳng chính quy khóa 16 ngành Công nghệ thông tin', 'Sinh viên đại học liên thông khóa 16 ngành Công nghệ thông tin', 'Sinh viên đại học văn bằng 2 khóa 16 ngành Công nghệ thông tin', '2'),
(19, 'Văn phòng Khoa / Viện', 'Phòng Đào Tạo', 'Phòng Tài Chính', 'Phòng Công Tác Sinh Viên', '2'),
(20, 'Sinh viên thiếu học phí 50.000 đồng', 'Sinh viên dư học phí 50.000 đồng', '', '', '2'),
(21, '6', '8', '10', '12', '3'),
(22, 'Lớp Việt Nhật khóa 18', 'Lớp chính quy khóa 18', 'Lớp Quốc tế khóa 18', 'Lớp cao đẳng khóa 18', '1'),
(23, 'Nam', 'Nữ', 'Cả nam và nữ', '', '2'),
(24, '3.000.000 đồng', '3.100.000 đồng', '3.300.000 đồng', '4.100.000 đồng', '3'),
(25, 'Năm 1980', 'Năm 1985', 'Năm 1990', 'Năm 1995', '4'),
(26, 'Thầy Hồ Đắc Lộc', 'Thầy Võ Đình Bảy', 'Thầy Kiều Tuân', 'Thầy Ngô Quốc Việt', '3'),
(27, 'Thầy Hồ Đắc Lộc', 'Thầy Ngô Quốc Việt', 'Thầy Kiều Tuân', 'Thầy Kiều Xuân Hùng', '1'),
(28, '2 màu', '3 màu', '4 màu', '5 màu', '3'),
(29, 'Trường Đại Học Công Nghệ mến yêu', 'Trường Đại Học Kỹ Thuật Công Nghệ mến yêu', 'Trường tôi Đại Học Công Nghệ', 'Trường tôi Đại Học Công Nghệ mến yêu', '3'),
(30, 'Công Nghệ Thông Tin', 'Kỹ Thuật Điện', 'Quản Trị Kinh Doanh', '', '1'),
(31, 'Đúng', 'Sai', '', '', '2'),
(32, 'Có', 'Không', '', '', '2'),
(33, 'Yếu', 'Trung bình', 'Khá', 'Giỏi', '3'),
(34, 'Trung bình', 'Khá', 'Giỏi', 'Xuất sắc', '2'),
(35, 'Có', 'Không', '', '', '1'),
(36, 'Jobfair', 'IT Openday', 'Ngày hội việc làm khối ngành Kinh Tế', 'Tất cả các đáp án trên', '4'),
(37, 'e-Hutech', 'Hutech', 'app-Hutech', 'student-Hutech', '1'),
(38, 'Cảnh báo học vụ', 'Tạm đình chỉ học tập', 'Đình chỉ học tập vĩnh viễn', 'Hạ bậc học lực', '1'),
(39, 'Sinh viên năm thứ nhất', 'Sinh viên năm thứ hai', 'Sinh viên năm thứ ba', 'Sinh viên năm thứ tư', '2'),
(40, 'Bị cảnh cáo học vụ hai lần', 'Bị kỷ luật do nhờ người thi hộ', 'Điểm trung bình ở học kỳ chính là 0', 'Vượt quá thời gian đào tạo 4 năm', '3'),
(41, 'Có', 'Không', '', '', '2'),
(42, 'Như nhau', 'Thấp hơn hệ số K', 'Thấp hơn số tín chỉ', 'Tính bằng học phí tín chỉ năm rớt môn đó', '1'),
(43, '6.0 điểm', '6.5 điểm', '6.7 điểm', '7.0 điểm', '2'),
(44, 'Miễn thi', 'Vắng thi', 'Rớt môn', 'Vắng có phép', '4'),
(45, 'Được học môn B', 'Không được học môn B', '', '', '1'),
(46, '9001:1995', '9001:2005', '9001:2015', '9001:2018', '3'),
(47, '6h20', '6h30', '7h20', '7h30', '4'),
(48, '14h55', '15h00', '15h05', '15h10', '3'),
(49, '100 tín chỉ', '110 tín chỉ', '120 tín chỉ', '130 tín chỉ', '4'),
(50, '100', '110', '120', '130', '1'),
(51, 'Hủy học phần', 'Xóa học phần', 'Rút học phần', 'Đổi học phần', '3'),
(52, 'Hủy học phần', 'Rút học phần', '', '', '1'),
(53, '25% hoặc 50%', '25% hoặc 75%', '50% hoặc 75%', '50% hoặc 100%', '3'),
(54, '2.500.000 đồng', '7.500.000 đồng', '5.000.000 đồng', '10.000.000 đồng', '2'),
(55, '1', '2', '3', '4', '2'),
(67, '18DATA1', '18DHTA1', '18DTHJA1', '18DMAA1', '1'),
(68, 'Năm 1995', 'Năm 1996', 'Năm 1997', 'Năm 1998', '1'),
(69, 'Đúng', 'Sai', '', '', '2'),
(70, 'Đạo đức - Tri thức - Sáng tạo', 'Sáng tạo - Tri thức - Đạo đức', 'Sáng tạo - Đạo đức - Tri thức', 'Tri thức - Đạo đức - Sáng tạo', '4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_class`
--

CREATE TABLE `student_class` (
  `idMember` int(11) NOT NULL,
  `idClass` int(11) NOT NULL,
  `DateJoin` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_class`
--

INSERT INTO `student_class` (`idMember`, `idClass`, `DateJoin`) VALUES
(5, 15, '2018-08-17 19:36:42'),
(5, 18, '2019-11-27 10:25:20'),
(11, 15, '2018-08-17 19:47:35'),
(11, 16, '2018-08-17 19:47:25'),
(13, 18, '2018-08-21 12:46:24'),
(14, 18, '2018-08-21 13:16:17'),
(15, 15, '2018-08-19 00:03:08'),
(16, 15, '2018-08-19 00:39:00'),
(16, 18, '2018-08-21 13:21:15'),
(17, 18, '2018-08-21 13:27:16'),
(18, 15, '2018-08-18 12:06:24'),
(18, 18, '2018-08-21 14:04:41'),
(19, 18, '2018-08-21 14:01:17'),
(20, 18, '2018-08-21 12:57:07'),
(22, 18, '2018-08-21 13:52:39'),
(24, 18, '2018-08-21 14:58:09'),
(25, 18, '2018-08-21 14:11:03'),
(28, 18, '2018-08-21 12:42:14'),
(29, 18, '2018-08-21 12:27:04'),
(30, 18, '2018-08-21 14:00:24'),
(33, 15, '2018-08-21 19:03:34'),
(33, 16, '2018-08-21 19:06:18'),
(33, 18, '2018-08-21 19:06:52'),
(34, 15, '2018-08-19 00:01:25'),
(34, 18, '2018-08-21 12:44:19'),
(35, 18, '2018-08-21 13:37:01'),
(36, 18, '2018-08-21 12:51:01'),
(37, 18, '2018-08-21 22:34:00'),
(39, 18, '2018-08-21 12:59:48'),
(40, 15, '2018-08-19 00:09:05'),
(40, 16, '2018-08-19 00:14:12'),
(40, 18, '2018-08-21 13:33:57'),
(42, 15, '2018-08-19 00:21:20'),
(43, 15, '2018-08-19 00:19:12'),
(46, 18, '2018-08-22 11:46:02'),
(47, 15, '2018-08-19 00:41:12'),
(47, 18, '2018-08-21 12:45:57'),
(52, 18, '2018-08-21 12:41:08'),
(53, 15, '2018-08-19 01:08:41'),
(54, 18, '2018-08-21 12:48:11'),
(56, 18, '2018-08-21 13:00:34'),
(58, 18, '2018-08-21 13:21:25'),
(59, 18, '2018-08-21 14:20:39'),
(63, 18, '2018-08-21 12:55:17'),
(64, 18, '2018-08-21 13:08:58'),
(65, 18, '2018-08-21 20:10:20'),
(67, 15, '2018-08-19 09:10:51'),
(69, 18, '2018-08-21 15:20:09'),
(71, 18, '2018-08-21 13:16:07'),
(72, 18, '2018-08-21 15:18:27'),
(76, 18, '2018-08-21 13:08:18'),
(77, 18, '2018-08-21 13:23:19'),
(78, 15, '2018-08-21 12:51:47'),
(78, 18, '2018-08-21 12:41:51'),
(79, 18, '2018-08-21 13:01:23'),
(80, 18, '2018-08-21 13:03:02'),
(81, 18, '2018-08-21 13:15:54'),
(82, 18, '2018-08-21 13:16:34'),
(83, 18, '2018-08-21 13:27:07'),
(84, 18, '2018-08-21 13:28:35'),
(85, 18, '2018-08-21 13:32:52'),
(86, 18, '2018-08-21 13:42:06'),
(87, 18, '2018-08-21 14:01:29'),
(88, 18, '2018-08-21 14:20:40'),
(89, 18, '2018-08-21 14:20:35'),
(90, 18, '2018-08-21 15:18:41'),
(91, 18, '2018-08-21 16:32:41'),
(92, 18, '2018-08-21 16:57:05'),
(93, 18, '2018-08-21 21:04:36'),
(95, 18, '2018-08-21 23:39:22'),
(96, 18, '2018-08-21 23:51:08'),
(97, 18, '2018-08-22 20:05:50'),
(98, 15, '2019-11-27 09:07:51'),
(98, 16, '2019-11-27 09:11:34'),
(98, 18, '2019-11-27 07:22:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_lesson`
--

CREATE TABLE `student_lesson` (
  `idMember` int(11) NOT NULL,
  `idLesson` int(11) NOT NULL,
  `DateFinished` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_lesson`
--

INSERT INTO `student_lesson` (`idMember`, `idLesson`, `DateFinished`) VALUES
(5, 10, '2018-08-17 19:36:49'),
(5, 11, '2018-08-17 19:37:02'),
(5, 12, '2018-08-17 21:10:06'),
(5, 13, '2018-08-17 21:17:41'),
(5, 23, '2019-11-27 10:25:29'),
(5, 25, '2018-08-19 22:40:47'),
(11, 10, '2018-08-17 19:47:38'),
(11, 11, '2018-08-17 19:47:43'),
(11, 12, '2018-08-17 19:47:48'),
(11, 13, '2018-08-17 19:47:51'),
(13, 23, '2018-08-21 12:46:35'),
(14, 23, '2018-08-21 13:16:30'),
(15, 10, '2018-08-19 00:03:15'),
(15, 11, '2018-08-19 00:03:27'),
(16, 10, '2018-08-19 00:39:09'),
(16, 11, '2018-08-19 00:39:43'),
(16, 12, '2018-08-19 00:40:31'),
(16, 13, '2018-08-19 00:40:56'),
(16, 23, '2018-08-21 13:21:39'),
(17, 23, '2018-08-21 13:27:27'),
(18, 10, '2018-08-18 12:06:35'),
(18, 11, '2018-08-18 12:06:57'),
(18, 23, '2018-08-21 14:04:51'),
(19, 23, '2018-08-21 14:01:25'),
(20, 23, '2018-08-21 12:57:16'),
(22, 23, '2018-08-21 13:52:56'),
(24, 23, '2018-08-21 14:58:24'),
(25, 23, '2018-08-21 14:11:15'),
(28, 23, '2018-08-21 12:42:20'),
(29, 23, '2018-08-21 12:27:37'),
(30, 23, '2018-08-21 14:00:36'),
(33, 10, '2018-08-21 19:03:40'),
(33, 11, '2018-08-21 19:04:15'),
(33, 12, '2018-08-21 19:05:14'),
(33, 13, '2018-08-21 19:05:21'),
(33, 14, '2018-08-21 19:06:24'),
(33, 15, '2018-08-21 19:06:27'),
(33, 16, '2018-08-21 19:06:30'),
(33, 17, '2018-08-21 19:06:31'),
(33, 23, '2018-08-21 19:07:04'),
(34, 10, '2018-08-19 00:01:35'),
(34, 23, '2018-08-21 12:44:28'),
(35, 23, '2018-08-21 13:37:08'),
(36, 23, '2018-08-21 12:51:10'),
(37, 23, '2018-08-21 22:34:18'),
(39, 23, '2018-08-21 13:00:18'),
(40, 10, '2018-08-19 00:09:16'),
(40, 11, '2018-08-19 00:10:53'),
(40, 12, '2018-08-19 00:11:54'),
(40, 13, '2018-08-19 00:12:03'),
(40, 14, '2018-08-19 00:14:59'),
(40, 15, '2018-08-19 00:15:01'),
(40, 16, '2018-08-19 00:15:02'),
(40, 17, '2018-08-19 00:15:03'),
(40, 23, '2018-08-21 13:34:05'),
(43, 10, '2018-08-19 00:19:34'),
(43, 11, '2018-08-19 00:32:32'),
(43, 12, '2018-08-19 00:33:56'),
(43, 13, '2018-08-19 00:34:33'),
(46, 23, '2018-08-22 11:46:08'),
(47, 10, '2018-08-19 00:41:19'),
(47, 23, '2018-08-21 12:46:14'),
(52, 23, '2018-08-21 12:41:41'),
(53, 10, '2018-08-19 01:08:47'),
(54, 23, '2018-08-21 12:58:44'),
(56, 23, '2018-08-21 13:00:43'),
(58, 23, '2018-08-21 13:21:38'),
(59, 23, '2018-08-21 14:20:46'),
(63, 23, '2018-08-21 12:55:22'),
(64, 23, '2018-08-21 13:09:05'),
(65, 23, '2018-08-21 20:12:01'),
(69, 23, '2018-08-21 15:20:18'),
(71, 23, '2018-08-21 13:16:32'),
(72, 23, '2018-08-21 15:18:35'),
(76, 23, '2018-08-21 13:08:29'),
(77, 23, '2018-08-21 13:23:32'),
(78, 10, '2018-08-21 12:51:52'),
(78, 11, '2018-08-21 12:51:57'),
(78, 12, '2018-08-21 12:53:33'),
(78, 23, '2018-08-21 12:42:09'),
(79, 23, '2018-08-21 13:01:31'),
(80, 23, '2018-08-21 13:03:12'),
(81, 23, '2018-08-21 13:16:22'),
(82, 23, '2018-08-21 13:16:46'),
(83, 23, '2018-08-21 13:27:18'),
(84, 23, '2018-08-21 13:29:16'),
(85, 23, '2018-08-21 13:33:02'),
(86, 23, '2018-08-21 13:42:17'),
(87, 23, '2018-08-21 17:56:37'),
(88, 23, '2018-08-21 14:20:58'),
(89, 23, '2018-08-21 14:21:16'),
(90, 23, '2018-08-21 15:18:55'),
(91, 23, '2018-08-21 16:33:05'),
(92, 23, '2018-08-21 16:57:45'),
(93, 23, '2018-08-21 21:04:48'),
(95, 23, '2018-08-21 23:39:55'),
(96, 23, '2018-08-21 23:51:19'),
(97, 23, '2018-08-22 20:07:35'),
(98, 10, '2019-11-27 09:07:57'),
(98, 11, '2019-11-27 09:08:19'),
(98, 12, '2019-11-27 09:08:22'),
(98, 13, '2019-11-27 09:08:25'),
(98, 23, '2019-11-27 07:27:12'),
(98, 25, '2019-11-27 09:08:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_test_result`
--

CREATE TABLE `student_test_result` (
  `idMember` int(11) NOT NULL,
  `idTest` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `idMark` int(11) DEFAULT NULL,
  `Answer` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Point` float DEFAULT NULL,
  `Comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateMark` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_test_result`
--

INSERT INTO `student_test_result` (`idMember`, `idTest`, `idQuestion`, `idMark`, `Answer`, `Point`, `Comment`, `DateMark`) VALUES
(5, 23, 11, NULL, '1', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 14, NULL, '3', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 18, NULL, '3', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 19, NULL, '3', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 21, NULL, '3', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 29, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 30, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 34, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 35, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 38, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 40, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 43, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 55, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 68, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 23, 70, NULL, '', NULL, NULL, '2019-11-27 10:25:45'),
(5, 25, 56, 5, 'Câu trả lời 1', 2, 'Chưa đầy đủ rõ ý', '2018-08-19 22:41:55'),
(5, 25, 57, 5, 'Câu trả lời 2', 0, '', '2018-08-19 22:41:55'),
(5, 25, 58, 5, 'Câu trả lời 3', 0, '', '2018-08-19 22:41:55'),
(13, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 21, NULL, '3', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 26, NULL, '1', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 36, NULL, '2', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 49, NULL, '4', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 51, NULL, '4', NULL, NULL, '2018-08-21 12:49:22'),
(13, 23, 68, NULL, '4', NULL, NULL, '2018-08-21 12:49:22'),
(14, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 18, NULL, '4', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 30, NULL, '1', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 34, NULL, '4', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 43, NULL, '2', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 46, NULL, '2', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 48, NULL, '3', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 53, NULL, '4', NULL, NULL, '2018-08-21 13:19:15'),
(14, 23, 54, NULL, '3', NULL, NULL, '2018-08-21 13:19:15'),
(16, 23, 10, NULL, '2', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 50, NULL, '3', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 51, NULL, '2', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 67, NULL, '2', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 68, NULL, '2', NULL, NULL, '2018-08-21 13:23:50'),
(16, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 13:23:50'),
(17, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 18, NULL, '2', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 28, NULL, '2', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 51, NULL, '1', NULL, NULL, '2018-08-21 13:31:02'),
(17, 23, 67, NULL, '3', NULL, NULL, '2018-08-21 13:31:02'),
(18, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 21, NULL, '2', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 30, NULL, '1', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 34, NULL, '2', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 49, NULL, '1', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 55, NULL, '1', NULL, NULL, '2018-08-21 14:08:49'),
(18, 23, 67, NULL, '', NULL, NULL, '2018-08-21 14:08:49'),
(19, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 10, NULL, '1', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 48, NULL, '1', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 50, NULL, '3', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 53, NULL, '1', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 55, NULL, '2', NULL, NULL, '2018-08-21 14:03:55'),
(19, 23, 70, NULL, '4', NULL, NULL, '2018-08-21 14:03:55'),
(20, 23, 10, NULL, '2', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 12, NULL, '3', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 15, NULL, '2', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 18, NULL, '4', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 48, NULL, '2', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 54, NULL, '', NULL, NULL, '2018-08-21 13:01:16'),
(20, 23, 70, NULL, '', NULL, NULL, '2018-08-21 13:01:16'),
(22, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 14, NULL, '3', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 43, NULL, '2', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 50, NULL, '3', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 54, NULL, '4', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 55, NULL, '2', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 67, NULL, '3', NULL, NULL, '2018-08-21 13:56:50'),
(22, 23, 70, NULL, '2', NULL, NULL, '2018-08-21 13:56:50'),
(24, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 10, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 28, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 29, NULL, '4', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 30, NULL, '3', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 40, NULL, '3', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 46, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 15:01:51'),
(24, 23, 55, NULL, '2', NULL, NULL, '2018-08-21 15:01:51'),
(25, 23, 10, NULL, '2', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 29, NULL, '2', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 30, NULL, '2', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 46, NULL, '3', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 50, NULL, '4', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 51, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(25, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 14:15:05'),
(28, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 12, NULL, '4', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 13, NULL, '3', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 14, NULL, '3', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 28, NULL, '3', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 50, NULL, '1', NULL, NULL, '2018-08-21 12:45:27'),
(28, 23, 54, NULL, '2', NULL, NULL, '2018-08-21 12:45:27'),
(29, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 16, NULL, '2', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 20, NULL, '1', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 46, NULL, '1', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 12:31:36'),
(29, 23, 69, NULL, '', NULL, NULL, '2018-08-21 12:31:36'),
(30, 23, 6, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 17, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 20, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 14:04:12'),
(30, 23, 54, NULL, '2', NULL, NULL, '2018-08-21 14:04:12'),
(33, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 22, NULL, '2', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 28, NULL, '3', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 43, NULL, '2', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 51, NULL, '3', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 54, NULL, '4', NULL, NULL, '2018-08-21 19:11:03'),
(33, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 19:11:03'),
(34, 23, 13, NULL, '2', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 18, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 24, NULL, '2', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 55, NULL, '4', NULL, NULL, '2018-08-21 12:46:42'),
(34, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 12:46:42'),
(35, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 19, NULL, '1', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 21, NULL, '3', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 29, NULL, '4', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 43, NULL, '2', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 50, NULL, '2', NULL, NULL, '2018-08-21 13:40:21'),
(35, 23, 68, NULL, '2', NULL, NULL, '2018-08-21 13:40:21'),
(36, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 13, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 14, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 16, NULL, '2', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 30, NULL, '1', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 34, NULL, '4', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 39, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 41, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 43, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 49, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 50, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(36, 23, 51, NULL, '', NULL, NULL, '2018-08-21 12:55:07'),
(37, 23, 6, NULL, '3', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 10, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 12, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 15, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 18, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 19, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 20, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 32, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 38, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 44, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 45, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 47, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 49, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 51, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(37, 23, 67, NULL, '', NULL, NULL, '2018-08-21 23:40:21'),
(39, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 24, NULL, '2', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 30, NULL, '1', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 48, NULL, '3', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 51, NULL, '2', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 13:03:31'),
(39, 23, 54, NULL, '2', NULL, NULL, '2018-08-21 13:03:31'),
(40, 23, 10, NULL, '4', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 21, NULL, '3', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 33, NULL, '2', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 46, NULL, '3', NULL, NULL, '2018-08-21 13:38:02'),
(40, 23, 51, NULL, '3', NULL, NULL, '2018-08-21 13:38:02'),
(46, 23, 9, NULL, '3', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 12, NULL, '4', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 14, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 15, NULL, '4', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 18, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 25, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 30, NULL, '1', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 32, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 36, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 37, NULL, '1', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 41, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 42, NULL, '1', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 46, NULL, '1', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 55, NULL, '2', NULL, NULL, '2018-08-22 11:47:18'),
(46, 23, 69, NULL, '1', NULL, NULL, '2018-08-22 11:47:18'),
(47, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 23, NULL, '1', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 31, NULL, '2', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 34, NULL, '4', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 43, NULL, '2', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 45, NULL, '2', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 47, NULL, '1', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 48, NULL, '3', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 67, NULL, '2', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 68, NULL, '4', NULL, NULL, '2018-08-21 12:49:55'),
(47, 23, 70, NULL, '3', NULL, NULL, '2018-08-21 12:49:55'),
(52, 23, 13, NULL, '2', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 22, NULL, '2', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 27, NULL, '3', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 44, NULL, '2', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 46, NULL, '1', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 48, NULL, '2', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 49, NULL, '2', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 55, NULL, '1', NULL, NULL, '2018-08-21 12:45:37'),
(52, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 12:45:37'),
(54, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 17, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 28, NULL, '3', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 34, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 43, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 54, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(54, 23, 55, NULL, '2', NULL, NULL, '2018-08-21 13:01:45'),
(56, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 20, NULL, '1', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 28, NULL, '1', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 42, NULL, '4', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 48, NULL, '4', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 13:03:38'),
(56, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 13:03:38'),
(58, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 10, NULL, '2', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 12, NULL, '1', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 16, NULL, '1', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 18, NULL, '3', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 45, NULL, '2', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 54, NULL, '3', NULL, NULL, '2018-08-21 13:25:17'),
(58, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 13:25:17'),
(59, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 11, NULL, '3', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 13, NULL, '2', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 18, NULL, '4', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 21, NULL, '2', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 24, NULL, '2', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 26, NULL, '1', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 27, NULL, '2', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 42, NULL, '4', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 46, NULL, '2', NULL, NULL, '2018-08-21 14:24:44'),
(59, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 14:24:44'),
(63, 23, 11, NULL, '3', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 13, NULL, '3', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 16, NULL, '1', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 17, NULL, '1', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 28, NULL, '2', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 46, NULL, '', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 48, NULL, '2', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 49, NULL, '', NULL, NULL, '2018-08-21 12:59:19'),
(63, 23, 68, NULL, '', NULL, NULL, '2018-08-21 12:59:19'),
(64, 23, 6, NULL, '1', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 17, NULL, '2', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 29, NULL, '1', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 42, NULL, '4', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 44, NULL, '1', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 48, NULL, '2', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 49, NULL, '4', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 50, NULL, '2', NULL, NULL, '2018-08-21 13:11:51'),
(64, 23, 55, NULL, '3', NULL, NULL, '2018-08-21 13:11:51'),
(65, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 18, NULL, '4', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 30, NULL, '2', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 40, NULL, '2', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 48, NULL, '3', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 50, NULL, '3', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 67, NULL, '2', NULL, NULL, '2018-08-21 20:14:29'),
(65, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 20:14:29'),
(69, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 13, NULL, '3', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 14, NULL, '3', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 26, NULL, '1', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 31, NULL, '2', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 40, NULL, '3', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 43, NULL, '4', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 46, NULL, '1', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 51, NULL, '3', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 53, NULL, '1', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 69, NULL, '2', NULL, NULL, '2018-08-21 15:23:39'),
(69, 23, 70, NULL, '4', NULL, NULL, '2018-08-21 15:23:39'),
(71, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 12, NULL, '1', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 26, NULL, '3', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 29, NULL, '4', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 50, NULL, '2', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 51, NULL, '3', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 52, NULL, '1', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 55, NULL, '2', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 13:20:28'),
(71, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 13:20:28'),
(72, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 10, NULL, '3', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 12, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 21, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 53, NULL, '1', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 67, NULL, '2', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 15:21:45'),
(72, 23, 70, NULL, '4', NULL, NULL, '2018-08-21 15:21:45'),
(76, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 13, NULL, '3', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 18, NULL, '2', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 27, NULL, '4', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 40, NULL, '3', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 42, NULL, '2', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 50, NULL, '2', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 53, NULL, '1', NULL, NULL, '2018-08-21 13:11:12'),
(76, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 13:11:12'),
(77, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 18, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 20, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 37, NULL, '4', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 46, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 51, NULL, '3', NULL, NULL, '2018-08-21 13:27:19'),
(77, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 13:27:19'),
(78, 23, 10, NULL, '3', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 25, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 30, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 34, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 46, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 50, NULL, '2', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 53, NULL, '4', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 55, NULL, '1', NULL, NULL, '2018-08-21 12:46:02'),
(78, 23, 67, NULL, '3', NULL, NULL, '2018-08-21 12:46:02'),
(79, 23, 6, NULL, '3', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 10, NULL, '3', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 13, NULL, '2', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 18, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 26, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 50, NULL, '1', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 51, NULL, '3', NULL, NULL, '2018-08-21 13:05:11'),
(79, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 13:05:11'),
(80, 23, 12, NULL, '2', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 14, NULL, '2', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 37, NULL, '1', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 51, NULL, '4', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 53, NULL, '2', NULL, NULL, '2018-08-21 13:05:46'),
(80, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 13:05:46'),
(81, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 16, NULL, '2', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 26, NULL, '4', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 44, NULL, '1', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 54, NULL, '1', NULL, NULL, '2018-08-21 13:20:04'),
(81, 23, 68, NULL, '4', NULL, NULL, '2018-08-21 13:20:04'),
(82, 23, 7, NULL, '', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 10, NULL, '1', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 25, NULL, '4', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 29, NULL, '4', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 35, NULL, '2', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 50, NULL, '4', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 53, NULL, '1', NULL, NULL, '2018-08-21 13:19:53'),
(82, 23, 70, NULL, '4', NULL, NULL, '2018-08-21 13:19:53'),
(83, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 18, NULL, '4', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 21, NULL, '2', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 35, NULL, '2', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 44, NULL, '3', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 48, NULL, '1', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 68, NULL, '3', NULL, NULL, '2018-08-21 13:29:39'),
(83, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 13:29:39'),
(84, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 7, NULL, '2', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 9, NULL, '3', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 18, NULL, '1', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 28, NULL, '3', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 30, NULL, '2', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 44, NULL, '2', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 47, NULL, '3', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 54, NULL, '', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 67, NULL, '', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 68, NULL, '', NULL, NULL, '2018-08-21 13:33:13'),
(84, 23, 69, NULL, '', NULL, NULL, '2018-08-21 13:33:13'),
(85, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 12, NULL, '4', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 28, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 55, NULL, '2', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 67, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 68, NULL, '4', NULL, NULL, '2018-08-21 13:35:32'),
(85, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 13:35:32'),
(86, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 14, NULL, '2', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 35, NULL, '1', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 40, NULL, '4', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 13:46:15'),
(86, 23, 48, NULL, '', NULL, NULL, '2018-08-21 13:46:15'),
(87, 23, 6, NULL, '4', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 12, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 18, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 27, NULL, '1', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 28, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 44, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 49, NULL, '4', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 68, NULL, '1', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 18:00:02'),
(87, 23, 70, NULL, '1', NULL, NULL, '2018-08-21 18:00:02'),
(88, 23, 8, NULL, '1', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 12, NULL, '3', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 29, NULL, '4', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 34, NULL, '2', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 35, NULL, '2', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 37, NULL, '4', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 38, NULL, '4', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 40, NULL, '2', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 45, NULL, '1', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 14:23:46'),
(88, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 14:23:46'),
(89, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 17, NULL, '4', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 19, NULL, '4', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 26, NULL, '4', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 28, NULL, '3', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 29, NULL, '1', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 39, NULL, '1', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 42, NULL, '1', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 48, NULL, '4', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 67, NULL, '3', NULL, NULL, '2018-08-21 14:24:45'),
(89, 23, 69, NULL, '2', NULL, NULL, '2018-08-21 14:24:45'),
(90, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 9, NULL, '4', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 12, NULL, '1', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 14, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 21, NULL, '3', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 22, NULL, '1', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 32, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 35, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 39, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 41, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 42, NULL, '4', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 53, NULL, '1', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 55, NULL, '3', NULL, NULL, '2018-08-21 15:21:53'),
(90, 23, 67, NULL, '2', NULL, NULL, '2018-08-21 15:21:53'),
(91, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 10, NULL, '1', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 14, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 15, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 17, NULL, '3', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 20, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 21, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 24, NULL, '4', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 49, NULL, '3', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 16:37:05'),
(91, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 16:37:05'),
(92, 23, 6, NULL, '4', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 18, NULL, '4', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 19, NULL, '2', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 25, NULL, '3', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 38, NULL, '2', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 44, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 46, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 50, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 52, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 53, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 54, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(92, 23, 70, NULL, '', NULL, NULL, '2018-08-21 17:01:47'),
(93, 23, 13, NULL, '1', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 15, NULL, '4', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 20, NULL, '1', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 24, NULL, '2', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 31, NULL, '1', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 40, NULL, '1', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 44, NULL, '4', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 46, NULL, '4', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 47, NULL, '4', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 48, NULL, '3', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 52, NULL, '2', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 53, NULL, '3', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 55, NULL, '3', NULL, NULL, '2018-08-21 21:08:08'),
(93, 23, 67, NULL, '3', NULL, NULL, '2018-08-21 21:08:08'),
(95, 23, 6, NULL, '2', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 9, NULL, '4', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 11, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 14, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 21, NULL, '4', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 24, NULL, '3', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 26, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 32, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 36, NULL, '4', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 41, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 46, NULL, '4', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 67, NULL, '2', NULL, NULL, '2018-08-21 23:43:51'),
(95, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 23:43:51'),
(96, 23, 8, NULL, '3', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 16, NULL, '4', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 17, NULL, '1', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 18, NULL, '1', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 20, NULL, '1', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 23, NULL, '2', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 26, NULL, '4', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 29, NULL, '3', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 33, NULL, '3', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 34, NULL, '3', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 38, NULL, '1', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 43, NULL, '3', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 68, NULL, '3', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 69, NULL, '1', NULL, NULL, '2018-08-21 23:53:52'),
(96, 23, 70, NULL, '2', NULL, NULL, '2018-08-21 23:53:52'),
(97, 23, 11, NULL, '1', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 13, NULL, '1', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 17, NULL, '1', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 19, NULL, '2', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 20, NULL, '2', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 28, NULL, '4', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 30, NULL, '3', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 31, NULL, '1', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 33, NULL, '3', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 36, NULL, '4', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 41, NULL, '2', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 44, NULL, '4', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 48, NULL, '3', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 54, NULL, '4', NULL, NULL, '2018-08-22 20:11:29'),
(97, 23, 70, NULL, '1', NULL, NULL, '2018-08-22 20:11:29'),
(98, 23, 8, NULL, '3', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 11, NULL, '1', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 21, NULL, '3', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 23, NULL, '2', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 30, NULL, '1', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 32, NULL, '1', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 34, NULL, '3', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 37, NULL, '1', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 40, NULL, '1', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 44, NULL, '2', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 45, NULL, '2', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 51, NULL, '4', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 53, NULL, '3', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 67, NULL, '2', NULL, NULL, '2019-11-27 09:07:33'),
(98, 23, 70, NULL, '1', NULL, NULL, '2019-11-27 09:07:33'),
(98, 25, 56, 5, NULL, 5, 'đâsd', '2019-11-27 09:10:29'),
(98, 25, 57, 5, NULL, 5, 'ádas', '2019-11-27 09:10:29'),
(98, 25, 58, 5, NULL, 0, 'ádas', '2019-11-27 09:10:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test`
--

CREATE TABLE `test` (
  `idLesson` int(11) NOT NULL,
  `Type` bit(1) NOT NULL,
  `TimeLimit` int(11) DEFAULT 0,
  `NumberLimit` int(11) NOT NULL DEFAULT 0,
  `Dateline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `test`
--

INSERT INTO `test` (`idLesson`, `Type`, `TimeLimit`, `NumberLimit`, `Dateline`) VALUES
(23, b'1', NULL, 15, '2021-08-24 14:00:00'),
(25, b'0', 15, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test_question`
--

CREATE TABLE `test_question` (
  `idQuestion` int(11) NOT NULL,
  `idTest` int(11) NOT NULL,
  `Content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Limit` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `test_question`
--

INSERT INTO `test_question` (`idQuestion`, `idTest`, `Content`, `Limit`) VALUES
(6, 23, '<p>Một năm học tại HUTECH c&oacute; tất cả bao nhi&ecirc;u học kỳ được tổ chức?</p>\n', 0),
(7, 23, '<p>M&atilde; số sinh vi&ecirc;n của c&aacute;c sinh vi&ecirc;n đại học, cao đẳng hệ ch&iacute;nh quy&nbsp;trường HUTECH c&oacute; bao nhi&ecirc;u chữ số?</p>\n', 0),
(8, 23, '<p>H&igrave;nh thức t&iacute;nh điểm tổng kết m&ocirc;n hiện nay tại HUTECH chủ yếu được chia theo tỉ lệ n&agrave;o?</p>\n', 0),
(9, 23, '<p>HUTECH hiện tại c&oacute; tổng cộng bao nhi&ecirc;u cơ sở học tập d&agrave;nh cho sinh vi&ecirc;n?</p>\n', 0),
(10, 23, '<p>Một sinh vi&ecirc;n được 9 điểm qu&aacute; tr&igrave;nh v&agrave; thi kết th&uacute;c m&ocirc;n được 0.5 điểm, vậy điểm chữ m&ocirc;n đ&oacute; của sinh vi&ecirc;n l&agrave;:</p>\n', 0),
(11, 23, '<p>Để xin giấy x&aacute;c nhận ho&atilde;n nghĩa vụ qu&acirc;n sự, sinh vi&ecirc;n cần li&ecirc;n hệ văn ph&ograve;ng n&agrave;o?</p>\n', 0),
(12, 23, '<p>Một t&iacute;n chỉ tương đương với</p>\n', 0),
(13, 23, '<p>Một sinh vi&ecirc;n học 3 m&ocirc;n học A, B, C trong một học kỳ, sinh vi&ecirc;n đ&oacute; đạt được <strong>điểm số hệ 4</strong> như sau:</p>\n\n<ul>\n	<li>M&ocirc;n A: 3 điểm</li>\n	<li>M&ocirc;n B: 3 điểm</li>\n	<li>M&ocirc;n C: 0 điểm</li>\n</ul>\n\n<p>Cả 3 m&ocirc;n n&agrave;y đều <strong>c&oacute; số lượng t&iacute;n chỉ bằng nhau</strong>.</p>\n\n<p>Hỏi điểm<strong> t&iacute;ch lũy to&agrave;n kh&oacute;a</strong> của sinh vi&ecirc;n n&agrave;y l&agrave; bao nhi&ecirc;u?</p>\n', 0),
(14, 23, '<p>Một sinh vi&ecirc;n học 3 m&ocirc;n học A, B, C trong một học kỳ, sinh vi&ecirc;n đ&oacute; đạt được <strong>điểm số hệ 4</strong> như sau:</p>\n\n<ul>\n	<li>M&ocirc;n A: 3 điểm</li>\n	<li>M&ocirc;n B: 3 điểm</li>\n	<li>M&ocirc;n C: 0 điểm</li>\n</ul>\n\n<p>Cả 3 m&ocirc;n n&agrave;y đều <strong>c&oacute; số lượng t&iacute;n chỉ bằng nhau</strong>.</p>\n\n<p>Hỏi điểm<strong> t&iacute;ch lũy học kỳ</strong>&nbsp;của sinh vi&ecirc;n n&agrave;y l&agrave; bao nhi&ecirc;u?</p>\n', 0),
(15, 23, '<p>Sinh vi&ecirc;n đại học ch&iacute;nh quy <strong>ng&agrave;nh An to&agrave;n th&ocirc;ng tin </strong>thuộc khoa n&agrave;o quản l&yacute;?</p>\n', 0),
(16, 23, '<p>Sinh vi&ecirc;n đại học ch&iacute;nh quy <strong>ng&agrave;nh Hệ thống th&ocirc;ng tin&nbsp;</strong>thuộc khoa n&agrave;o quản l&yacute;?</p>\n', 0),
(17, 23, '<p>Đ&acirc;u l&agrave; một trong những&nbsp;ti&ecirc;u ch&iacute; để&nbsp;x&eacute;t tốt nghiệp đại học tại HUTECH hiện tại?</p>\n', 0),
(18, 23, '<p>Một sinh vi&ecirc;n mang m&atilde; số sinh vi&ecirc;n l&agrave; <span style=\"font-size:16px\"><strong>1612360001</strong></span>, sinh vi&ecirc;n n&agrave;y c&oacute; th&ocirc;ng tin cơ bản l&agrave;</p>\n', 0),
(19, 23, '<p>Để in bảng điểm học tập, sinh vi&ecirc;n cần li&ecirc;n hệ ph&ograve;ng ban n&agrave;o?</p>\n', 0),
(20, 23, '<p>Tồn nợ trong bảng học ph&iacute; hiển thị l&agrave; <strong>-50.000đ</strong>, điều n&agrave;y c&oacute; nghĩa l&agrave;</p>\n', 0),
(21, 23, '<p>Sinh vi&ecirc;n c&oacute; điểm<strong> trung b&igrave;nh học kỳ hệ 4 l&agrave; 3.8</strong>, vậy sinh vi&ecirc;n đ&oacute; sẽ được cộng bao nhi&ecirc;u điểm r&egrave;n luyện trong học kỳ đ&oacute;?</p>\n', 0),
(22, 23, '<p>M&atilde; lớp 18DTHJA1 tại HUTECH thể hiện được những g&igrave;?</p>\n', 0),
(23, 23, '<p>Nh&agrave; vệ sinh (WC) ở khu B, tầng 7 l&agrave; d&agrave;nh cho nam hay nữ?</p>\n', 0),
(24, 23, '<p>Một m&ocirc;n học <strong>3 t&iacute;n chỉ, hệ số K l&agrave; 1.1</strong>, giả sử <strong>mỗi t&iacute;n chỉ học ph&iacute; l&agrave; 100.000 đồng</strong>, vậy học ph&iacute; m&ocirc;n n&agrave;y (kh&ocirc;ng t&iacute;nh ph&iacute; t&agrave;i liệu) l&agrave; bao nhi&ecirc;u?</p>\n', 0),
(25, 23, '<p>HUTECH được th&agrave;nh lập v&agrave;o năm:</p>\n', 0),
(26, 23, '<p>Chủ tịch hội đồng quản trị của HUTECH l&agrave; thầy</p>\n', 0),
(27, 23, '<p>Hiệu trưởng của trường HUTECH hiện tại l&agrave; thầy</p>\n', 0),
(28, 23, '<p>Logo của HUTECH bao gồm bao nhi&ecirc;u m&agrave;u sắc tất cả?</p>\n', 0),
(29, 23, '<p>Ca kh&uacute;c (b&agrave;i h&aacute;t) truyền thống của HUTECH mang t&ecirc;n n&agrave;o?</p>\n', 0),
(30, 23, '<p>Hiện tại HUTECH <strong>CHƯA&nbsp;</strong>đ&agrave;o tạo tr&igrave;nh độ <strong>tiến sỹ </strong>của ng&agrave;nh n&agrave;o dưới đ&acirc;y?</p>\n', 0),
(31, 23, '<p>Nh&agrave; trường cam kết học ph&iacute; t&iacute;n chỉ <strong>mỗi năm kh&ocirc;ng tăng qu&aacute; <span style=\"font-size:16px\">7%</span></strong>, vậy giả sử rằng học ph&iacute; năm nay của bạn l&agrave; <span style=\"font-size:16px\"><strong>10.000.000 đồng</strong></span> th&igrave; học ph&iacute; năm sau của bạn&nbsp;phải đ&oacute;ng sẽ<strong> chắc chắn</strong> kh&ocirc;ng qu&aacute; <span style=\"font-size:16px\"><strong>10.700.000 đồng</strong></span>. Đ&uacute;ng hay sai?</p>\n', 0),
(32, 23, '<p>Một sinh vi&ecirc;n tốt nghiệp với điểm trung b&igrave;nh t&iacute;ch lũy to&agrave;n kh&oacute;a l&agrave; <span style=\"font-size:16px\"><strong>3.9</strong></span></p>\n\n<p>Vậy sinh vi&ecirc;n n&agrave;y c&oacute; <strong>chắc chắn</strong> đạt loại <span style=\"font-size:16px\"><strong>xuất sắc </strong></span>hay kh&ocirc;ng?</p>\n', 0),
(33, 23, '<p>Một sinh vi&ecirc;n tốt nghiệp với điểm trung b&igrave;nh t&iacute;ch lũy to&agrave;n kh&oacute;a l&agrave; <span style=\"font-size:16px\"><strong>2.59</strong></span></p>\n\n<p>Vậy sinh vi&ecirc;n n&agrave;y c&oacute; đạt loại tốt nghiệp<span style=\"font-size:16px\"><strong>&nbsp;</strong></span>g&igrave;?</p>\n', 0),
(34, 23, '<p>Một sinh vi&ecirc;n tốt nghiệp với điểm trung b&igrave;nh t&iacute;ch lũy hệ 4&nbsp;l&agrave; <strong><span style=\"font-size:16px\">3.59</span>&nbsp;</strong>với <strong>100 t&iacute;n chỉ t&iacute;ch lũy</strong></p>\n\n<p>Nhưng trong qu&aacute; tr&igrave;nh học, sinh vi&ecirc;n c&oacute; trả nợ <strong>1 m&ocirc;n 3 chỉ</strong> v&agrave; cải thiện <strong>1 m&ocirc;n 3 chỉ </strong>kh&aacute;c.</p>\n\n<p>Vậy giả sử c&aacute;c điều kiện kh&aacute;c sinh vi&ecirc;n đều thỏa, sinh vi&ecirc;n n&agrave;y sẽ được xếp loại tốt nghiệp l&agrave;</p>\n', 0),
(35, 23, '<p>Giả sử một sinh vi&ecirc;n <strong>đại học ch&iacute;nh quy&nbsp;</strong>học một m&ocirc;n c&oacute; m&atilde; l&agrave; <strong>ABC</strong>, nhưng m&ocirc;n c&oacute; m&atilde; <strong>ABC </strong>n&agrave;y sinh vi&ecirc;n lại đăng k&yacute;<strong> học với lớp cao đẳng ch&iacute;nh quy</strong>. Vậy việc sinh vi&ecirc;n n&agrave;y học m&ocirc;n c&oacute; m&atilde; <strong>ABC </strong>đ&oacute; được c&ocirc;ng nhận hay kh&ocirc;ng?</p>\n', 0),
(36, 23, '<p>HUTECH hằng năm thường tổ chức c&aacute;c ng&agrave;y hội việc l&agrave;m n&agrave;o để tạo điều kiện cho sinh vi&ecirc;n thực tập?</p>\n', 0),
(37, 23, '<p>Ứng dụng mobile đầu ti&ecirc;n của HUTECH gi&uacute;p sinh vi&ecirc;n tra cứu lịch học t&ecirc;n đầy đủ l&agrave; g&igrave;?</p>\n', 0),
(38, 23, '<p>Một sinh vi&ecirc;n chỉ t&iacute;ch lũy học kỳ hệ 4 được <span style=\"font-size:16px\"><strong>0.5 điểm</strong></span>. Giả sử sinh vi&ecirc;n n&agrave;y l&agrave; sinh vi&ecirc;n năm 2, vậy h&igrave;nh thức xử l&yacute; học vụ n&agrave;o sẽ được &aacute;p dụng với sinh vi&ecirc;n n&agrave;y?</p>\n', 0),
(39, 23, '<p>Theo quy chế học vụ hiện h&agrave;nh, tại HUTECH, một sinh vi&ecirc;n t&iacute;ch lũy được <span style=\"font-size:16px\"><strong>40 t&iacute;n chỉ </strong></span>th&igrave; được xếp hạng năm đ&agrave;o tạo l&agrave;:</p>\n', 0),
(40, 23, '<p>Một sinh vi&ecirc;n đại học ch&iacute;nh quy c&oacute; chương tr&igrave;nh đ&agrave;o tạo trong 4 năm sẽ&nbsp;bị buộc th&ocirc;i học nếu như:</p>\n', 0),
(41, 23, '<p>Nếu điểm m&ocirc;n học của sinh vi&ecirc;n l&agrave; điểm D hoặc D+ th&igrave; c&oacute; bị bắt buộc đi học cải thiện hay kh&ocirc;ng?</p>\n', 0),
(42, 23, '<p>Học ph&iacute; khi học cải thiện được t&iacute;nh như thế n&agrave;o so với học ph&iacute; học lại?</p>\n', 0),
(43, 23, '<p>Trong một kỳ thi kết th&uacute;c m&ocirc;n, sinh vi&ecirc;n phải l&agrave;m <span style=\"font-size:18px\"><strong>100 c&acirc;u </strong></span>hỏi trắc nghiệm nhưng sinh vi&ecirc;n chỉ l&agrave;m <strong>Đ&Uacute;NG </strong>được <span style=\"font-size:18px\"><strong>67 c&acirc;u</strong></span>.</p>\n\n<p>Vậy điểm thi kết th&uacute;c m&ocirc;n đ&oacute; của sinh vi&ecirc;n n&agrave;y l&agrave; bao nhi&ecirc;u?</p>\n', 0),
(44, 23, '<p>Điểm I l&agrave; điểm g&igrave;?</p>\n', 0),
(45, 23, '<p>C&oacute; hai m&ocirc;n học A, B. M&ocirc;n A được quy chế học vụ quy định<strong> l&agrave; học phần học trước của m&ocirc;n B.</strong></p>\n\n<p>Vậy nếu như sinh vi&ecirc;n đạt được <strong>F+ m&ocirc;n A</strong> th&igrave;:</p>\n', 0),
(46, 23, '<p>Hệ thống chuẩn ISO của HUTECH hiện tại l&agrave; phi&ecirc;n bản n&agrave;o dưới đ&acirc;y?</p>\n', 0),
(47, 23, '<p>Tại HUTECH, tiết 2 bắt đầu từ mấy giờ?</p>\n', 0),
(48, 23, '<p>Tại HUTECH, <strong>ca 4</strong>&nbsp;bắt đầu từ mấy giờ?</p>\n', 0),
(49, 23, '<p>Tr&igrave;nh độ <strong>đại học</strong> được quy định phải học &iacute;t nhất bao nhi&ecirc;u t&iacute;n chỉ?</p>\n', 0),
(50, 23, '<p>Tr&igrave;nh độ <strong>cao đẳng</strong>&nbsp;được quy định phải học &iacute;t nhất bao nhi&ecirc;u t&iacute;n chỉ?</p>\n', 0),
(51, 23, '<p>H&igrave;nh thức&nbsp;học vụ n&agrave;o cho ph&eacute;p sinh vi&ecirc;n hủy m&ocirc;n học nhưng <strong>kh&ocirc;ng </strong>ho&agrave;n lại học ph&iacute;?</p>\n', 0),
(52, 23, '<p>H&igrave;nh thức học vụ n&agrave;o cho ph&eacute;p sinh vi&ecirc;n hủy m&ocirc;n học nhưng <strong>kh&ocirc;ng </strong>cho ph&eacute;p &aacute;p dụng khi m&ocirc;n học đ&atilde; bắt đầu học?</p>\n', 0),
(53, 23, '<p>Sinh vi&ecirc;n được r&uacute;t bao nhi&ecirc;u phần trăm học ph&iacute; nếu như lớp học chưa bắt đầu?</p>\n', 0),
(54, 23, '<p>Nếu như mới đ&oacute;ng học ph&iacute; 10.000.000 đồng&nbsp;h&ocirc;m qua, th&igrave; h&ocirc;m nay, theo quy chế học vụ ban h&agrave;nh&nbsp;sinh vi&ecirc;n được r&uacute;t lại bao nhi&ecirc;u?</p>\n', 0),
(55, 23, '<p>Xếp hạng sinh vi&ecirc;n trong 1 khoa như sau:</p>\n\n<ul>\n	<li>Sinh vi&ecirc;n A: 3.5/4.0</li>\n	<li>Sinh vi&ecirc;n B: 3.2/4.0</li>\n	<li>Sinh vi&ecirc;n C: 3.0/4.0</li>\n	<li>Sinh vi&ecirc;n D: 2.8/4.0</li>\n</ul>\n\n<p>Giả sử rằng cả 4 sinh vi&ecirc;n n&agrave;y đều c&oacute; điểm r&egrave;n luyện &gt;= 80 điểm.</p>\n\n<p>Vậy hỏi c&oacute; bao nhi&ecirc;u sinh vi&ecirc;n trong số đ&oacute; nhận được<strong> học bổng HUTECH t&agrave;i năng</strong>?</p>\n', 0),
(56, 25, '<p>H&atilde;y cho biết IDE l&agrave; g&igrave;? Kể t&ecirc;n một số IDE m&agrave; bạn biết.</p>\n', 0),
(57, 25, '<p>H&atilde;y kể t&ecirc;n một v&agrave;i ng&ocirc;n ngữ lập tr&igrave;nh m&agrave; bạn biết</p>\n', 0),
(58, 25, '<p>Cơ sở dữ liệu l&agrave; g&igrave;?</p>\n', 0),
(67, 23, '<p>Đ&acirc;u l&agrave; m&atilde; lớp thuộc sự quản l&yacute; của khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin?</p>\n', 0),
(68, 23, '<p>Khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin được th&agrave;nh lập v&agrave;o năm n&agrave;o?</p>\n', 0),
(69, 23, '<p>Một sinh vi&ecirc;n c&oacute; m&atilde; số sinh vi&ecirc;n l&agrave; <span style=\"font-size:16px\"><strong>1611060001 </strong></span>th&igrave; chắc chắn sinh vi&ecirc;n đ&oacute; đang học ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin. Đ&uacute;ng hay sai?</p>\n', 0),
(70, 23, '<p>Đ&acirc;u l&agrave; slogan đ&uacute;ng&nbsp;của HUTECH?</p>\n', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idMember`),
  ADD KEY `fk_ADMIN_MEMBER_idx` (`idMember`),
  ADD KEY `fk_ADMIN_TEST_QUESTION1_idx` (`idCreator`);

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`idClass`),
  ADD UNIQUE KEY `linkClass_UNIQUE` (`linkClass`),
  ADD KEY `fk_CLASS_MEMBER1_idx` (`idCreator`);

--
-- Chỉ mục cho bảng `class_require`
--
ALTER TABLE `class_require`
  ADD PRIMARY KEY (`idClass`,`idClass_Require`),
  ADD KEY `fk_CLASS_REQUIRE_CLASS2_idx` (`idClass_Require`);

--
-- Chỉ mục cho bảng `class_staff`
--
ALTER TABLE `class_staff`
  ADD PRIMARY KEY (`idClass`,`idStaff`),
  ADD KEY `fk_CLASS_STAFF_MEMBER1_idx` (`idStaff`);

--
-- Chỉ mục cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`idLesson`),
  ADD KEY `fk_LESSON_CLASS1_idx` (`idClass`),
  ADD KEY `fk_LESSON_MEMBER1_idx` (`idCreator`),
  ADD KEY `fk_LESSON_LESSON1_idx` (`idLesson_Require`);

--
-- Chỉ mục cho bảng `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`idMember`),
  ADD UNIQUE KEY `idStudent_UNIQUE` (`idStudent`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`idNews`),
  ADD KEY `fk_NEWS_CLASS1` (`idClass`),
  ADD KEY `fk_NEWS_MEMBER1_idx` (`idCreator`);

--
-- Chỉ mục cho bảng `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`idPARAMETER`);

--
-- Chỉ mục cho bảng `question_choose`
--
ALTER TABLE `question_choose`
  ADD PRIMARY KEY (`idQuestion`);

--
-- Chỉ mục cho bảng `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`idMember`,`idClass`),
  ADD KEY `fk_STUDENT_CLASS_CLASS1_idx` (`idClass`);

--
-- Chỉ mục cho bảng `student_lesson`
--
ALTER TABLE `student_lesson`
  ADD PRIMARY KEY (`idMember`,`idLesson`),
  ADD KEY `fk_STUDENT_LESSON_LESSON1` (`idLesson`),
  ADD KEY `fk_STUDENT_LESSON_MEMBER1_idx` (`idMember`);

--
-- Chỉ mục cho bảng `student_test_result`
--
ALTER TABLE `student_test_result`
  ADD PRIMARY KEY (`idMember`,`idTest`,`idQuestion`),
  ADD KEY `fk_STUDENT_TEST_RESULT_TEST_QUESTION1_idx` (`idQuestion`),
  ADD KEY `fk_STUDENT_TEST_RESULT_MEMBER1_idx` (`idMember`),
  ADD KEY `fk_STUDENT_TEST_RESULT_MEMBER2_idx` (`idMark`),
  ADD KEY `fk_STUDENT_TEST_RESULT_TEST_QUESTION3` (`idTest`);

--
-- Chỉ mục cho bảng `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`idLesson`);

--
-- Chỉ mục cho bảng `test_question`
--
ALTER TABLE `test_question`
  ADD PRIMARY KEY (`idQuestion`),
  ADD KEY `fk_TEST_QUESTION_TEST1_idx` (`idTest`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `class`
--
ALTER TABLE `class`
  MODIFY `idClass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `lesson`
--
ALTER TABLE `lesson`
  MODIFY `idLesson` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `member`
--
ALTER TABLE `member`
  MODIFY `idMember` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `idNews` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `test_question`
--
ALTER TABLE `test_question`
  MODIFY `idQuestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_ADMIN_MEMBER` FOREIGN KEY (`idMember`) REFERENCES `member` (`idMember`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ADMIN_TEST_QUESTION1` FOREIGN KEY (`idCreator`) REFERENCES `member` (`idMember`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fk_CLASS_MEMBER1` FOREIGN KEY (`idCreator`) REFERENCES `member` (`idMember`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `class_require`
--
ALTER TABLE `class_require`
  ADD CONSTRAINT `fk_CLASS_REQUIRE_CLASS1` FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CLASS_REQUIRE_CLASS2` FOREIGN KEY (`idClass_Require`) REFERENCES `class` (`idClass`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `class_staff`
--
ALTER TABLE `class_staff`
  ADD CONSTRAINT `fk_CLASS_STAFF_CLASS1` FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CLASS_STAFF_MEMBER1` FOREIGN KEY (`idStaff`) REFERENCES `member` (`idMember`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `fk_LESSON_CLASS1` FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_LESSON_LESSON1` FOREIGN KEY (`idLesson_Require`) REFERENCES `lesson` (`idLesson`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_LESSON_MEMBER1` FOREIGN KEY (`idCreator`) REFERENCES `member` (`idMember`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_NEWS_CLASS1` FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_NEWS_MEMBER1` FOREIGN KEY (`idCreator`) REFERENCES `member` (`idMember`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `question_choose`
--
ALTER TABLE `question_choose`
  ADD CONSTRAINT `fk_QUESTION_CHOOSE_TEST_QUESTION1` FOREIGN KEY (`idQuestion`) REFERENCES `test_question` (`idQuestion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `student_class`
--
ALTER TABLE `student_class`
  ADD CONSTRAINT `fk_STUDENT_CLASS_CLASS1` FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_STUDENT_CLASS_MEMBER1` FOREIGN KEY (`idMember`) REFERENCES `member` (`idMember`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `student_lesson`
--
ALTER TABLE `student_lesson`
  ADD CONSTRAINT `fk_STUDENT_LESSON_LESSON1` FOREIGN KEY (`idLesson`) REFERENCES `lesson` (`idLesson`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_STUDENT_LESSON_MEMBER1` FOREIGN KEY (`idMember`) REFERENCES `member` (`idMember`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `student_test_result`
--
ALTER TABLE `student_test_result`
  ADD CONSTRAINT `fk_STUDENT_TEST_RESULT_MEMBER1` FOREIGN KEY (`idMember`) REFERENCES `member` (`idMember`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_STUDENT_TEST_RESULT_MEMBER2` FOREIGN KEY (`idMark`) REFERENCES `member` (`idMember`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_STUDENT_TEST_RESULT_TEST_QUESTION1` FOREIGN KEY (`idQuestion`) REFERENCES `test_question` (`idQuestion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_STUDENT_TEST_RESULT_TEST_QUESTION3` FOREIGN KEY (`idTest`) REFERENCES `lesson` (`idLesson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk_TEST_LESSON1` FOREIGN KEY (`idLesson`) REFERENCES `lesson` (`idLesson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `test_question`
--
ALTER TABLE `test_question`
  ADD CONSTRAINT `fk_TEST_QUESTION_TEST1` FOREIGN KEY (`idTest`) REFERENCES `test` (`idLesson`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
