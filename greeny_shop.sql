-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 23, 2024 lúc 04:23 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `greeny_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_image`, `category_name`) VALUES
(4, NULL, 'Rau củ'),
(5, NULL, 'Trái cây'),
(6, NULL, 'Củ quả'),
(11, NULL, 'Hạt dinh dưỡng'),
(12, NULL, 'Đặt sản vùng miền');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `product_id`, `user_id`) VALUES
(99, 72, 10),
(100, 70, 10),
(101, 8, 10),
(102, 9, 10),
(103, 35, 9),
(104, 69, 9),
(105, 19, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `address`, `amount`, `order_date`, `phone`, `status`, `user_id`) VALUES
(76, '1', 10000, '2024-04-28 00:00:00', '1', 2, 9),
(77, '1', 37050, '2024-03-29 00:00:00', '1', 2, 9),
(78, 'Phú Xuyên - Hà Nội', 96000, '2024-04-30 00:00:00', '0354925331', 2, 10),
(79, 'Minh Khai - Bắc Từ Liêm - Hà Nội', 154100, '2024-05-02 00:00:00', '0354925331', 2, 10),
(80, 'Hà Nam', 131150, '2024-05-02 00:00:00', '11111111', 2, 10),
(93, 'Tri Thủy - Phú Xuyên - Hà Nội', 240000, '2024-03-18 00:00:00', '0354925331', 2, 10),
(94, 'test', 240000, '2024-06-18 00:00:00', '1174', 2, 10),
(95, 'Vĩnh Ninh - Phú Xuyên - Hà Nội', 25000, '2024-05-19 00:00:00', '0354925331', 0, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` bigint(20) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `price`, `quantity`, `order_id`, `product_id`) VALUES
(130, 10000, 1, 76, 15),
(131, 39000, 1, 77, 9),
(132, 35000, 1, 78, 18),
(133, 39000, 1, 78, 9),
(134, 25000, 1, 78, 12),
(135, 39000, 2, 79, 9),
(136, 40000, 2, 79, 14),
(137, 39000, 3, 80, 9),
(155, 300000, 1, 93, 70),
(156, 300000, 1, 94, 70),
(157, 25000, 1, 95, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `entered_date` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `favorite` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `description`, `discount`, `entered_date`, `price`, `product_image`, `product_name`, `quantity`, `status`, `category_id`, `favorite`) VALUES
(8, 'Ớt chuông đỏ cung cấp một lượng dinh dưỡng cao, đặc biệt là vitamin C, caroten và lycopene.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 10, '2024-05-08 00:00:00', 16000, '01.jpg', 'Ớt chuông', 0, NULL, 6, b'0'),
(9, 'Cà rốt là một loại củ giàu chất dinh dưỡng và vitamin A, thích hợp cho món ăn dặm của trẻ em và có lợi cho sức khỏe và làn da.', 5, '2024-05-08 00:00:00', 39000, '02.jpg', 'Cà rốt', 47, NULL, 6, b'1'),
(10, 'Dưa leo, còn được gọi là dưa chuột, đa dạng về cách sử dụng nhưng vẫn giữ nguyên giá trị dinh dưỡng. Dưa leo baby có hình dáng giống dưa leo thông thường nhưng nhỏ hơn và có vị ngọt mát hơn.', 2, '2024-05-08 00:00:00', 25000, '03.jpg', 'Dưa leo', 23, NULL, 6, b'0'),
(11, 'Cà tím Nhật, hay còn gọi là cà dái dê, là loại rau củ được sử dụng trong nhiều món ăn ngon và giàu chất xơ và sắt, có lợi cho sức khỏe và giúp giảm nguy cơ mắc các bệnh ung thư và tim mạch.', 0, '2024-05-08 00:00:00', 30000, '04.jpg', 'Cà tím', 39, NULL, 6, b'0'),
(12, 'Đậu bắp là một loại rau quả rất tốt cho sức khỏe đặc biệt cho hệ xương khớp nhưng có giá rất rẻ. Một kg đậu bắp tươi hiện nay có giá chỉ từ 25.000 – 30.000 đồng và đậu bắp sấy khô giá cũng chỉ có 120.000 đồng/1kg mà thôi.', 0, '2024-05-08 00:00:00', 25000, '05.jpg', 'Đậu bắp', 30, NULL, 6, b'0'),
(13, 'Cà chua không chỉ là một loại rau củ bổ dưỡng quen thuộc trong bữa ăn hàng ngày mà còn là \"thần dược\" làm đẹp da cho phụ nữ, nhờ vào hàm lượng vitamin A cao và các tính năng chống oxy hóa.', 3, '2024-05-08 00:00:00', 25000, '06.jpg', 'Cà chua', 58, NULL, 6, b'0'),
(14, 'Cà chua không chỉ là một loại rau củ bổ dưỡng quen thuộc trong bữa ăn hàng ngày mà còn là \"thần dược\" làm đẹp da cho phụ nữ, nhờ vào hàm lượng vitamin A cao và các tính năng chống oxy hóa.', 0, '2024-05-08 00:00:00', 40000, '09.jpg', 'Cải ngọt', 48, NULL, 4, b'0'),
(15, 'Bí đỏ, hay còn gọi là bí đỏ hạt đậu, là một loại bí có ruột đặc, ngọt và ít hạt. Nó giàu chất dinh dưỡng, đặc biệt là beta-caroten và có thể được sử dụng trong nhiều món ăn ngon và bổ dưỡng.', 0, '2024-05-08 00:00:00', 10000, '12.jpg', 'Bí đỏ', 39, NULL, 6, b'0'),
(16, 'Dâu tây, hay còn gọi là dâu đất, là một loại trái cây giàu chất dinh dưỡng, đặc biệt là vitamin, chất khoáng và các chất chống oxy hóa, mang lại nhiều lợi ích cho sức khỏe.', 5, '2024-05-08 00:00:00', 120000, '13.jpg', 'Dâu tây', 90, NULL, 5, b'0'),
(17, 'Xoài keo là loại trái cây giàu chất xơ, vitamin và khoáng chất, mang lại nhiều lợi ích cho sức khỏe và làm đẹp da, hỗ trợ hệ tiêu hóa và tim mạch.', 0, '2024-05-08 00:00:00', 22000, '14.jpg', 'Xoài keo', 48, NULL, 5, b'0'),
(18, 'Cam sành, nguồn gốc từ Việt Nam, có vỏ dày, màu xanh khi chín có sắc cam, rất mọng nước và thường được sử dụng để vắt nước giải khát.', 3, '2024-05-08 00:00:00', 35000, '16.jpg', 'Cam', 86, NULL, 5, b'0'),
(19, 'Nho xanh từ vùng trồng nho nổi tiếng cả nước, có thể ăn trực tiếp hoặc pha chế đồ uống, đảm bảo chất lượng và an toàn, với vị ngọt dịu và nhiều lợi ích cho sức khỏe.', 5, '2024-05-08 00:00:00', 170000, '17.jpg', 'Nho xanh', 60, NULL, 5, b'1'),
(20, 'Chuối chuyển màu từ xanh sang vàng khi chín, có vị ngọt, mềm, giàu chất xơ và các loại vitamin, cũng như có ít chất béo, cholesterol và natri. Vỏ chuối cũng được sử dụng làm đẹp và có nhiều lợi ích khác cho sức khỏe.', 4, '2022-01-31 00:00:00', 25000, '18.jpg', 'Chuối', 79, NULL, 5, b'0'),
(23, 'Xà lách xoắn, hay xà lách lolo xanh, có vị ngọt đắng, tính mát, giàu vitamin và khoáng chất, tốt cho sức khỏe và thường được sử dụng trong các món salad và thực đơn gia đình.', 2, '2024-05-08 00:00:00', 10000, 'rauxalach.jpg', 'Rau xà lách', 100, NULL, 4, b'0'),
(24, 'Hành lá, còn được gọi là hành hoa, hành hương, có mùi thơm đặc trưng và vị ngọt, cay nhẹ khi ăn sống, thường được sử dụng làm gia vị trong các món ăn và có các ứng dụng trong đông y để phòng và chữa một số bệnh như cảm sốt, tiểu đường và tăng cường sức khỏe.', 0, '2024-05-08 00:00:00', 10000, 'hanhla.jpg', 'Hành lá', 500, NULL, 4, b'0'),
(25, 'Rau dền, với hàm lượng vitamin và khoáng chất cao, được sử dụng rộng rãi trong thực đơn hàng ngày và cũng có lợi ích chữa bệnh như chống táo bón, điều trị tăng huyết áp và ngừa ung thư.', 0, '2024-05-08 00:00:00', 15000, 'rauden.jpg', 'Rau dền', 200, NULL, 4, b'0'),
(26, 'Ngò rí không chỉ là một loại rau thêm hương vị cho món ăn mà còn có nhiều lợi ích cho sức khỏe, bao gồm bảo vệ tim mạch, hạ huyết áp, giảm cholesterol, và ngăn ngừa nhiều bệnh như ung thư, thiếu máu, viêm khớp, và nhiều hơn nữa.', 0, '2024-05-08 00:00:00', 3500, 'raungori.jpg', 'Rau ngò rí', 500, NULL, 4, b'0'),
(27, 'Rau má không chỉ là nguyên liệu dinh dưỡng mà còn là \"thần dược\" cho làn da và sức khỏe tổng thể, với nhiều ứng dụng từ chế biến món ăn đến làm mặt nạ và uống sinh tố.', 1, '2024-05-08 00:00:00', 3000, 'rauma.jpg', 'Rau má', 2000, NULL, 4, b'0'),
(28, 'Bông cải xanh không chỉ giàu dưỡng chất và vitamin mà còn có tác dụng giảm nguy cơ ung thư ở một số cơ quan, đồng thời hỗ trợ giảm tổn thương mãn tính của một số mô trong cơ thể.', 2, '2024-05-08 00:00:00', 23000, 'suploxanh.jpg', 'Súp lơ xanh', 500, NULL, 4, b'0'),
(29, 'Khoai tây không chỉ là một loại củ phổ biến mà còn là nguồn dinh dưỡng quan trọng, mang lại nhiều lợi ích sức khỏe và làm đẹp.', 3, '2024-05-08 00:00:00', 10000, 'khoaitay.png', 'Khoai tây', 500, NULL, 6, b'0'),
(30, 'Quả gấc giàu beta-carotene và lycopene, cùng với protein ức chế sự phát triển của khối u, đem lại nhiều lợi ích sức khỏe, bao gồm ngăn ngừa thiếu hụt vitamin A và giảm nguy cơ đột quỵ.', 5, '2024-05-08 00:00:00', 40000, 'quagat.jpg', 'Quả gất', 1000, NULL, 6, b'0'),
(31, 'Chôm chôm là loại trái cây nhiệt đới ngon và giàu dinh dưỡng, phổ biến trong đời sống và được trồng chủ yếu ở vùng đồng bằng sông Cửu Long.', 6, '2024-05-08 00:00:00', 50000, 'quachomchom.jpg', 'Chôm chôm', 1000, NULL, 5, b'0'),
(32, 'Vú sữa bơ hồng là một loại trái cây đặc sản của Việt Nam, có vị ngọt và hương thơm bơ sữa quyến rũ. Nó là nguồn dồi dào của canxi, phốt pho, sắt và magiê, đặc biệt tốt cho phụ nữ mang thai và thai nhi.', 5, '2024-05-08 00:00:00', 70000, 'quavusua.jpg', 'Quả vú sữa', 1000, NULL, 5, b'0'),
(33, 'Vải thiều là loại trái cây phổ biến với hương vị ngọt ngào và mùi thơm đặc trưng. Ngoài việc ăn trực tiếp, nó còn được sử dụng để chế biến thành nhiều món ngon khác. Mùa vải thiều thường bắt đầu vào khoảng tháng 6 đến tháng 7, với sản xuất chủ yếu từ các tỉnh phía Bắc như Thanh Hà và Lục Ngạn.', 10, '2024-05-08 00:00:00', 70000, 'vaithieu.jpg', 'Vải thiều', 1000, NULL, 5, b'0'),
(34, 'Lựu là một trong những loại trái cây nhiệt đới tốt nhất cho sức khỏe, được đánh giá cao với hàm lượng chất dinh dưỡng và các hợp chất từ thực vật có lợi. Các nghiên cứu đã chỉ ra rằng lựu có nhiều lợi ích sức khỏe và có thể giảm nguy cơ mắc nhiều bệnh khác nhau.', 15, '2024-05-08 00:00:00', 130000, 'qualuu.jpg', 'Quả lựu', 1000, NULL, 5, b'0'),
(35, 'Táo nữ hoàng Queen, nhập khẩu từ New Zealand, được đánh giá cao về chất lượng và xuất xứ. Với vỏ mỏng màu đỏ thẫm và thịt vàng, ngọt nhẹ và thơm đặc trưng, loại táo này được lai giữa táo Gala và táo Splendour, mang lại trải nghiệm tuyệt vời cho người tiêu dùng.', 12, '2024-05-08 00:00:00', 200000, 'quatao.jpg', 'Quả táo', 1000, NULL, 5, b'1'),
(36, 'Chanh vàng Mỹ, hay còn gọi là chanh tây, được nhập khẩu từ Mỹ, mang vị chua nhẹ và mùi thơm đặc trưng. Với lượng vitamin C cao và các chất khoáng quan trọng, chanh vàng là lựa chọn tuyệt vời để tăng cường sức khỏe và ngăn ngừa các bệnh nguy hiểm.', 5, '2024-05-08 00:00:00', 20000, 'quachanhvang.jpg', 'Chanh vàng', 1000, NULL, 6, b'0'),
(63, 'Bông cải trắng, với hàm lượng chất xơ cao, chất chống oxy hóa và choline, không chỉ tốt cho tiêu hóa mà còn giúp bảo vệ tế bào và hỗ trợ sức khỏe gan.', 10, '2024-05-03 00:00:00', 10000, 'suplotrang.jpg', 'Súp lơ trắng', 30, NULL, 4, b'0'),
(64, 'Hạt tiêu Xay sẵn dùng làm gia vị cho các loại thức ăn. giúp thức ăn ngon hơn và giúp điều trị một số chứng bệnh. nên cho bột hạt tiêu vào sau khi thức ăn đã gần chín, hoặc ướp trước khi nấu nướng thức ăn. ', 5, NULL, 100000, 'hattieu.jpg', 'Hạt tiêu xay', 10, NULL, 11, b'0'),
(65, 'Quả hạch còn có tên gọi khác là hạt bào ngư, hạt móng ngựa, hình dáng của quả hạch bên ngoài xù xì, có lớp vỏ cứng màu nâu sẫm. Quả hạch có phần nhân bên trong màu trắng, nhận được bao bọc 1 lớp màn mỏng nâu. Phần nhân béo gùi, ăn rất thơm. ', 2, NULL, 200000, 'qua-hach-kho.jpg', 'Quả hạch khô', 100, NULL, 11, b'0'),
(67, 'Tên khoa học của hạt Sachi là Plukenetia Volubilis, hay còn gọi là Inca Nuts hoặc Inca Inchi, hạt sachi bắt nguồn từ Nam Mỹ. Ở nước Sachi là tên gọi tắt của loại hạt này. \r\n\r\nNếu hạt Macca là “nữ hoàng hạt khô” thì hạt Sachi chính là Vua trong các loại hạt. Đó là bởi vì trong hạt Sachi có hàm lượng các chất dinh dưỡng rất cao như Chất béo, Protein, chất xơ, chất Omega 3,6,9. Về khía cạnh hàm lượng chất dinh dưỡng thì không loại hạt nào có thể so sánh được với hạt Sachi, tuy nhiên về mùi vị thì hạt Sachi không ngon lắm và chỉ ở mức độ ăn được, vị ngọt của nó không giống như các loại hạt khác như hạt Macca hay hạt điều.\r\n\r\n', 0, '2024-05-14 00:00:00', 80000, 'sa_chi.jpg', ' Hạt Sachi', 11, NULL, 11, b'0'),
(68, 'Hạt sen sấy là một loại hạt dinh dưỡng, mang lại rất nhiều lợi ích đối với sức khỏe người sử dụng. Từ xưa, cây sen đã là một loài cây trồng quen thuộc và là biểu tượng của người dân Việt Nam. Hạt sen sấy là sản phẩm của hạt sen tươi khi đã chín được người nông dân thu về và chế biến, bảo quản. Hạt sen sấy giòn (hạt sen sấy khô) sẽ bảo quản được thời gian lâu hơn so với hạt sen tươi. \r\n\r\n', 12, '2024-05-14 00:00:00', 80000, 'hatsen.jpg', 'Hạt sen sấy khô giòn', 13, NULL, 11, b'0'),
(69, 'Hạt ươi (Sterculia lychonophora Hnce) còn có tên gọi khác là hạt ươi bay, hạt đười ươi, an nam tứ, đại đồng quả, pang da hai,...Đây là một trong những loại hạt được pha làm nước uống bổ dưỡng vào mùa hè, xua tan đi cái nóng và mệt mỏi. \r\n\r\nVòng tuần hoàn ra quả của cây ươi đó là 4 năm một lần. Cây ươi sinh trường, phát triển ở trong rừng thường có mặt ở các nước thuộc khu vực Đông Nam Á như: Thái Lan, Việt Nam, Lào hay Malaysia. Tại Việt Nam, cây ươi mọc ở Tây Nguyên và vùng Trung Trung Bộ. Hạt ươi rừng sau khi thu hoạch sẽ được sàng lọc thêm một lần nữa để chọn ra những hạt chất lượng nhất. Sau đó sơ chế để bán lẻ và xuất khẩu đi một số nước. \r\n\r\n', 15, '2024-05-14 00:00:00', 95000, 'hat-duoi-uoi.jpg', 'Hạt ươi (Hạt đười ươi)', 0, NULL, 11, b'0'),
(70, 'ản phẩm Thịt trâu gác bếp Sơn La mang thương hiệu Hoa Xuân được sản xuất thủ công từ nguồn nguyên liệu sạch, an toàn, được kiểm định, kiểm soát triệt để chất lượng trước khi đưa sản phẩm đến tay người tiêu dùng; điều chỉnh để đáp ứng các nhu cầu khác nhau của từng khách hàng về sản phẩm như độ khô, độ cay, qui cách đóng gói,...', 20, '2024-05-14 00:00:00', 300000, 'thit-trau-gac-bep.jpg', 'Thịt trâu gác bếp ', 110, NULL, 12, b'0'),
(72, 'Cơm cháy Ninh Bình là món ăn đặc sản được Tổ chức kỷ lục Châu Á công nhận theo bộ tiêu chí \"Giá trị ẩm thực Châu Á\"; Tổ chức kỷ lục Việt Nam công nhận - Top 50 món ăn đặc sản nổi tiếng Việt Nam.', 5, '2024-05-14 00:00:00', 60000, 'comchay.jpg', 'Cơm cháy Ninh Bình', 0, NULL, 12, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(10, 'ROLE_ADMIN'),
(11, 'ROLE_USER'),
(12, 'ROLE_ADMIN'),
(13, 'ROLE_EMPLOYEE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `avatar`, `email`, `name`, `password`, `register_date`, `status`) VALUES
(9, 'user.png', 'vuthanh10235@gmail.com', 'Thanh Vũ', '$2a$10$AsBHm3D/ZFu6hm/lT3oAguP0.X.MrmsLsliYTqaBmRpaOA.vIYam2', '2024-03-17', b'1'),
(10, 'user.png', 'vuthanh102355@gmail.com', 'Kenzzz', '$2a$10$sfQC7shH.sua2.SLI4zGZO6BEHN2H.ytxpA1/btX3i3qcpj1NJig.', '2024-04-17', b'1'),
(11, 'user.png', 'greentyshop123@gmail.com', 'Administrator', '$2a$10$YjP0vJhY4l34HG4arcaDbeaLaGd9xyMecIHlOdRy2ftb6Om6VWFSW', '2024-04-29', b'1'),
(12, 'user.png', 'vuthanh123456666@gmail.com', 'Như Quỳnh', '$2a$10$rE9rILLeEs1TXt.LboHwIOqGy6Czcd3Gby/1AjDTVc0TeQ1wBT7.a', '2024-05-09', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(9, 10),
(10, 11),
(11, 12),
(12, 13);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfwepd0s8syqc9s06xnqa7mdwf` (`order_detail_id`),
  ADD KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  ADD KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  ADD KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Chỉ mục cho bảng `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  ADD KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FKfwepd0s8syqc9s06xnqa7mdwf` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`order_detail_id`),
  ADD CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Các ràng buộc cho bảng `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
