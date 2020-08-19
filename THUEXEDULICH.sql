CREATE DATABASE THUEXEDULICH

USE THUEXEDULICH

CREATE TABLE KHACHHANG
(
	MaKH VARCHAR(20) NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50),
	DiaChi VARCHAR(50),
	SDT VARCHAR(20)
)

CREATE TABLE LOAIXE
(
	MaLoaiXe VARCHAR(20) NOT NULL PRIMARY KEY,
	MoTa VARCHAR(50)
)

CREATE TABLE XECHOTHUE
(
	MaXe VARCHAR(20) NOT NULL PRIMARY KEY,
	BienSoXe VARCHAR(20),
	HangXe VARCHAR(50),
	MaLoaiXe VARCHAR(20),
	DonGiaChoThue INT
	CONSTRAINT FK_XCT_LX
	FOREIGN KEY (MaLoaiXe) REFERENCES LOAIXE(MaLoaiXe)
)

CREATE TABLE LOAIDICHVU
(
	MaLoaiDV VARCHAR(20) NOT NULL PRIMARY KEY,
	MoTaLoaiDV VARCHAR(50)
)

CREATE TABLE HOPDONGTHUEXE
(
	MaHD VARCHAR(20) NOT NULL PRIMARY KEY,
	MaKH VARCHAR(20) NOT NULL,
	SoTienDatCoc INT,
	TrangThaiHD VARCHAR(50)
	CONSTRAINT FK_HDCT_KH
	FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
)


CREATE TABLE CHITIETHOPDONG
(
	MaHD VARCHAR(20) NOT NULL,
	MaXe VARCHAR(20) NOT NULL,
	MaLoaiDV VARCHAR(20),
	NgayNhanXe DATE,
	NgayTraXe DATE
	CONSTRAINT PK_CTHD_HDTX_XCT
	PRIMARY KEY (MaHD, MaXe),
	CONSTRAINT FK_CTHD_HDTX
	FOREIGN KEY (MaHD) REFERENCES HOPDONGTHUEXE(MaHD),
	CONSTRAINT FK_CTHD_XCT
	FOREIGN KEY (MaXe) REFERENCES XECHOTHUE(MaXe)
)

INSERT INTO KHACHHANG VALUES
('KH001', 'Dang Hoai Son', 'Lien Chieu', '0905666666'),
('KH002', 'Dang Ngoc Chi', 'Cam Le', '0905123456'),
('KH003', 'Nguyen Van Tien', 'Hai Chau', '0914987654'),
('KH004', 'Le Anh Huy', 'Hai Chau', '0914987655'),
('KH005', 'Nguyen Nhat Anh', 'Cam Le', '0914987656'),
('KH006', 'Tran Quang Huy', 'Lien Chieu', '0914987657'),
('KH007', 'Le Minh Thu', 'Hoa Vang', '0914987658'),
('KH008', 'Nguyen Hai Son', 'Son Tra', '0914987659')

INSERT INTO LOAIXE VALUES
('LX001', 'Xe 4 cho'),
('LX002', 'Xe 7 cho'),
('LX003', 'Xe 16 cho'),
('LX004', 'Xe 24 cho'),
('LX005', 'Xe 50 cho')

INSERT INTO XECHOTHUE VALUES
('XCT001', '43A-567.28', 'Kia', 'LX001', 100000),
('XCT002', '43D-129.98', 'Honda', 'LX002', 200000),
('XCT003', '43B-567.30', 'Toyota', 'LX003', 300000),
('XCT004', '43C-557.32', 'Toyota', 'LX004', 400000),
('XCT005', '43E-477.37', 'Honda', 'LX005', 500000),
('XCT006', '43F-597.65', 'Toyota', 'LX001', 100000),
('XCT007', '43G-167.76', 'Kia', 'LX004', 400000),
('XCT008', '43H-297.78', 'Honda', 'LX003', 300000)

INSERT INTO LOAIDICHVU VALUES
('LDV001', 'Dam cuoi'),
('LDV002', 'Du lich')

INSERT INTO HOPDONGTHUEXE VALUES
('HD001', 'KH001', 0, 'Chua bat dau'),
('HD002', 'KH002', 200000, 'Da ket thuc'),
('HD003', 'KH003', 500000, 'Dang cho thue'),
('HD004', 'KH004', 700000, 'Da ket thuc'),
('HD005', 'KH005', 0, 'Dang cho thue'),
('HD006', 'KH006', 300000, 'Dang cho thue'),
('HD007', 'KH007', 300000, 'Da ket thuc'),
('HD008', 'KH007', 100000, 'Chua bat dau')

INSERT INTO CHITIETHOPDONG VALUES
('HD001', 'XCT001', 'LDV001', '2018-06-13', '2018-06-15'),
('HD002', 'XCT002', 'LDV002', '2019-09-23', '2019-09-25'),
('HD003', 'XCT003', 'LDV002', '2020-07-07', '2020-07-09'),
('HD004', 'XCT004', 'LDV001', '2018-05-13', '2018-05-15'),
('HD005', 'XCT005', 'LDV002', '2020-06-19', '2020-06-21'),
('HD006', 'XCT006', 'LDV002', '2016-06-13', '2016-06-15'),
('HD007', 'XCT007', 'LDV002', '2019-08-13', '2019-08-15'),
('HD008', 'XCT005', 'LDV001', '2020-06-13', '2020-06-15'),
('HD001', 'XCT003', 'LDV002', '2015-07-13', '2015-07-15'),
('HD007', 'XCT002', 'LDV001', '2019-09-13', '2019-09-15')

-- 3.Câu 1.3. Liệt kê những xe cho thuê gồm các thông tin về mã xe, 
-- biển số xe, hãng xe có đơn giá cho thuê nhỏ hơn 500.000 VND
SELECT MaXe, BienSoXe, HangXe FROM XECHOTHUE 
WHERE DonGiaChoThue < 500000

--Câu 1.4. Liệt kê những khách hàng gồm thông tin mã khách hàng, 
--họ và tên khách hàng có địa chỉ ở ‘Liên Chiểu’ mà có 
-- số điện thoại bắt đầu bằng ‘090’ và những khách hàng
--có địa chỉ ở ‘Hải Châu’ mà có số điện thoại bắt đầu bằng ‘091’
SELECT MaKH, HoTen FROM KHACHHANG
WHERE (DiaChi = 'Lien Chieu' AND SDT LIKE '090%') 
OR (DiaChi = 'Hai Chau' AND SDT LIKE '091%')

-- 5. Liệt kê thông tin của các khách hàng có họ (trong họ tên) 
--là ‘Đặng’.
SELECT * FROM KHACHHANG WHERE HoTen LIKE 'Dang%'

--6.Câu 1.6. Liệt kê thông tin mã xe, hãng xe của toàn bộ các xe
--được thuê một lần duy nhất
SELECT MaXe, HangXe FROM XECHOTHUE WHERE MaXe IN
(SELECT MaXe FROM CHITIETHOPDONG GROUP BY MaXe HAVING COUNT(MaHD) = 1)

--7.Câu 1.7. Liệt kê các hợp đồng cho thuê gồm mã hợp đồng, 
--số tiền đặt cọc có trạng thái hợp đồng là ‘Đã kết thúc’ 
--của khách hàng có tên là ‘Chi’
SELECT HD.MaHD, HD.SoTienDatCoc
FROM HOPDONGTHUEXE HD JOIN KHACHHANG KH ON HD.MaKH = KH.MaKH
WHERE HD.TrangThaiHD = 'Da ket thuc' AND KH.HoTen LIKE '%Chi'

--8. Liệt kê thông tin của các khách hàng mà chưa có hợp đồng thuê xe nào
SELECT * FROM KHACHHANG WHERE MaKH NOT IN
(SELECT MaKH FROM HOPDONGTHUEXE)

-- 9. Cho biết những mã hợp đồng mà vừa sử dụng loại
-- dịch vụ 'Đám cưới' vừa sử dụng loại dịch vụ 'Du lịch'.
SELECT MaHD FROM HOPDONGTHUEXE 
WHERE MaHD IN 
(SELECT MaHD 
FROM CHITIETHOPDONG CT JOIN LOAIDICHVU LDV ON CT.MaLoaiDV = LDV.MaLoaiDV
WHERE LDV.MoTaLoaiDV = 'Dam cuoi')
AND MaHD IN 
(SELECT MAHD 
FROM CHITIETHOPDONG CT JOIN LOAIDICHVU LDV ON CT.MaLoaiDV = LDV.MaLoaiDV 
WHERE LDV.MoTaLoaiDV = 'Du lich')

--10. Liệt kê họ và tên khách hàng, mã hợp đồng, trạng thái hợp đồng của 
--tất cả các hợp đồng với yêu cầu những khách hàng chưa có một hợp đồng nào
--thì cũng phải liệt kê thông tin những họ và tên khách hàng đó ra
SELECT KH.HoTen, HD.MaHD, HD.TrangThaiHD
FROM KHACHHANG KH FULL OUTER JOIN HOPDONGTHUEXE HD ON KH.MaKH = HD.MaKH

--11.Liệt kê không trùng lặp thông tin mã khách hàng, họ và tên khách hàng
--của các khách hàng có địa chỉ là ‘Hải Châu’ đã từng thuê xê thuộc
--loại xe có mô tả là ‘Xe 24 chỗ’ hoặc các khách hàng từng thuê xe
--có thời gian nhận xe là 07/07/2020. Sắp xếp tăng dần theo mã khách
--hàng và giảm dần theo họ và tên khách hàng.
SELECT DISTINCT KH.MaKH, KH.HoTen
FROM KHACHHANG KH JOIN HOPDONGTHUEXE HD ON KH.MaKH = HD.MaKH
JOIN CHITIETHOPDONG CT ON HD.MaHD = CT.MaHD
JOIN XECHOTHUE XCT ON CT.MaXe = XCT.MaXe
JOIN LOAIXE LX ON XCT.MaLoaiXe = LX.MaLoaiXe
WHERE (KH.DiaChi = 'Hai Chau' AND LX.MoTa = 'Xe 24 cho') OR CT.NgayNhanXe = '2020-07-07' 
ORDER BY KH.MaKH ASC, KH.HoTen DESC

--12. Thống kê số lần được thuê của các xe mà xe đó có số ngày mượn 
--lớn hơn 10 ngày gồm các thông tin mã xe, số lần thuê


--.13. Cho biết có bao nhiêu xe đã được đùng để cho thuê trong tổng số xe
SELECT COUNT(DISTINCT MaXe) AS SoXeChoThue
FROM CHITIETHOPDONG 

--14. Liệt kê thông tin của những khách hàng đã từng thuê xe vào năm 2018 
--nhưng chưa từng thuê vào năm 2019
SELECT * FROM KHACHHANG 
WHERE MaKH IN
(SELECT KH.MaKH FROM KHACHHANG KH JOIN HOPDONGTHUEXE HD ON KH.MaKH = HD.MaKH 
JOIN CHITIETHOPDONG CT ON HD.MaHD = CT.MaHD WHERE YEAR(CT.NgayNhanXe) = 2018 
OR YEAR(CT.NgayTraXe) = 2018)
AND MaKH NOT IN
(SELECT KH.MaKH FROM KHACHHANG KH JOIN HOPDONGTHUEXE HD ON KH.MaKH = HD.MaKH 
JOIN CHITIETHOPDONG CT ON HD.MaHD = CT.MaHD WHERE YEAR(CT.NgayNhanXe) = 2019 
OR YEAR(CT.NgayTraXe) = 2019)

--15. Liệt kê họ và tên của khách hàng mà có từ hai hợp đồng thuê xe trở lên.
SELECT HoTen FROM KHACHHANG WHERE MaKH IN
(SELECT HD.MaKH FROM HOPDONGTHUEXE HD JOIN KHACHHANG KH ON HD.MaKH = KH.MaKH
GROUP BY HD.MaKH
HAVING COUNT(HD.MaKH) >=2)

--16. Cập nhật cột trạng thái hợp đồng thành ‘Bị hủy’ đối với những hợp đồng 
--có trạng thái là ‘Chưa bắt đầu’ và có số tiền đặt cọc là 0
UPDATE HOPDONGTHUEXE SET TrangThaiHD = 'Bi huy'
WHERE TrangThaiHD = 'Chua bat dau' AND SoTienDatCoc = 0

--17.Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào
DELETE FROM LOAIDICHVU WHERE MaLoaiDV NOT IN
(SELECT DISTINCT MaLoaiDV FROM CHITIETHOPDONG)









