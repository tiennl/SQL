USE KARAOKE2

CREATE TABLE KHACHHANG
(
	MaKH VARCHAR(10) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(50),
	SoDT VARCHAR(20),
	MaSoThue VARCHAR(10)
)

CREATE TABLE PHONG
(
	MaPhong VARCHAR(10) NOT NULL PRIMARY KEY,
	SoKhachToiDa SMALLINT,
	TrangThai VARCHAR(20),
	MoTa VARCHAR(20)
)

CREATE TABLE DICHVU
(
	MaDV VARCHAR(10) NOT NULL PRIMARY KEY,
	TenDV VARCHAR(20),
	DonViTinh VARCHAR(10),
	DonGia INT
)

CREATE TABLE MUCTIENGIO
(
	MaTienGio VARCHAR(10) NOT NULL PRIMARY KEY,
	DonGia INT,
	Mota VARCHAR(100)
)

CREATE TABLE HOADON
(
	MaHD VARCHAR(10) NOT NULL PRIMARY KEY,
	MaKH VARCHAR(10) NOT NULL,
	MaPhong VARCHAR(10) NOT NULL,
	MaTienGio VARCHAR(10) NOT NULL,
	ThoiGianBatDauSD DATETIME,
	ThoiGianKetThucSD DATETIME,
	TrangThaiHD VARCHAR(50)
	CONSTRAINT FK_HD_KH
	FOREIGN KEY (MaKH) REFERENCES KHACHHANG (MaKH),
	CONSTRAINT FK_HD_P
	FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong),
	CONSTRAINT FK_HD_MTG
	FOREIGN KEY (MaTienGio) REFERENCES MUCTIENGIO (MaTienGio)
)

CREATE TABLE CHITIET_SUDUNGDV
(
	MaHD VARCHAR(10) NOT NULL,
	MaDV VARCHAR(10) NOT NULL,
	SoLuong INT
	CONSTRAINT PK_CT_HD_DV
	PRIMARY KEY (MaHD, MaDV),
	CONSTRAINT FK_CT_HD
	FOREIGN KEY (MaHD) REFERENCES HOADON (MaHD),
	CONSTRAINT FK_CT_DV
	FOREIGN KEY (MaDV) REFERENCES DICHVU (MaDV)
)

INSERT INTO KHACHHANG VALUES 
('KH001', 'Tran Van Nam', 'Hai Chau', '0905123456', '12345678'),
('KH002', 'Nguyen Mai Anh', 'Lien Chieu', '0905123457', '12345679'),
('KH003', 'Phan Hoai Lan Khue', 'Hoa Vang', '0905123458', '12345680'),
('KH004', 'Nguyen Hoai Nguyen', 'Hoa Cam', '0905123459', '12345681'),
('KH005', 'Le Truong Ngoc Anh', 'Hai Chau', '0905123460', '12345682'),
('KH006', 'Ho Hoai Anh', 'Hai Chau', '0905123461', '12345683'),
('KH007', 'Pham Thi Huong', 'Son Tra', '0905123462', '12345684'),
('KH008', 'Chau Tinh Tri', 'Hai Chau', '0905123463', '12345685'),
('KH009', 'Phan Nhu Thao', 'Hoa Khanh', '0905123464', '12345686'),
('KH010', 'Tran Thi To Tam', 'Son Tra', '0905123465', '12345687')

INSERT INTO PHONG VALUES 
('VIP01', 5, 'Duoc su dung', 'phong vip'),
('P02', 10, 'Duoc su dung', 'phong binh thuong'),
('P03', 15, 'Duoc su dung', 'phong binh thuong'),
('VIP04', 20, 'Duoc su dung', 'phong vip'),
('P05', 25, 'Duoc su dung', 'phong binh thuong'),
('P06', 30, 'Duoc su dung', 'phong binh thuong'),
('VIP07', 35, 'Duoc su dung', 'phong vip'),
('P08', 40, 'Duoc su dung', 'phong binh thuong'),
('VIP09', 45, 'Duoc su dung', 'phong vip'),
('P10', 50, 'Duoc su dung', 'phong binh thuong')

INSERT INTO DICHVU VALUES 
('DV01', 'Hat Dua', 'Bao', 5000),
('DV02', 'Trai Cay', 'Dia', 30000),
('DV03', 'Bia', 'Lon', 35000),
('DV04', 'Nuoc Ngot', 'Chai', 10000),
('DV05', 'Ruou', 'Chai', 200000)

INSERT INTO MUCTIENGIO VALUES 
('MT01', 60000, 'Ap dung tu 6 gio den 17 gio'),
('MT02', 80000, 'Ap dung sau 17 gio den 22 gio'),
('MT03', 100000, 'Ap dung tu sau 22 gio den 6 gio sang')

INSERT INTO HOADON VALUES 
('HD001', 'KH001', 'VIP01', 'MT01', '2015-11-20 08:15', '2015-11-20 12:30', 'Da thanh toan'),
('HD002', 'KH002', 'P02', 'MT01', '2015-12-12 13:10', '2015-12-12 17:20', 'Chua thanh toan'),
('HD003', 'KH001', 'P02', 'MT01', '2014-10-15 12:12', '2014-10-15 16:30', 'Da thanh toan'),
('HD004', 'KH003', 'VIP01', 'MT02', '2015-09-20 18:30', '2015-09-20 21:00', 'Chua thanh toan'),
('HD005', 'KH001', 'P03', 'MT02', '2014-11-25 20:00', '2014-11-20 21:45', 'Thanh toan mot phan'),
('HD006', 'KH002', 'VIP01', 'MT01', '2014-09-12 09:20', '2014-09-12 10:45', 'Da thanh toan'),
('HD007', 'KH006', 'VIP04', 'MT01', '2014-12-22 11:00', '2014-12-22 14:20', 'Da thanh toan'),
('HD008', 'KH007', 'VIP04', 'MT02', '2014-08-23 20:10', '2014-08-23 22:00', 'Chua thanh toan'),
('HD009', 'KH006', 'P05', 'MT03', '2015-12-20 22:30', '2015-12-21 01:15', 'Chua thanh toan'),
('HD010', 'KH005', 'VIP01', 'MT03', '2015-10-10 01:30', '2015-10-10 03:15', 'Da thanh toan'),
('HD011', 'KH004', 'VIP07', 'MT03', '2015-12-25 22:15', '2015-12-26 02:00', 'Da thanh toan'),
('HD012', 'KH008', 'P06', 'MT03', '2014-07-25 23:45', '2015-07-26 02:15', 'Da thanh toan'),
('HD013', 'KH007', 'VIP07', 'MT02', '2015-08-21 18:15', '2015-08-21 20:45', 'Da thanh toan'),
('HD014', 'KH004', 'P06', 'MT02', '2015-12-31 19:12', '2015-12-31 21:15', 'Thanh toan mot phan'),
('HD015', 'KH001', 'P06', 'MT01', '2014-06-24 13:00', '2014-06-24 13:15', 'Thanh toan mot phan'),
('HD016', 'KH003', 'P08', 'MT01', '2014-05-12 08:00', '2014-05-12 10:45', 'Thanh toan mot phan'),
('HD017', 'KH003', 'VIP09', 'MT01', '2015-11-20 12:15', '2015-11-20 14:20', 'Da thanh toan'),
('HD018', 'KH001', 'P10', 'MT01', '2015-04-12 14:45', '2015-04-12 16:45', 'Da thanh toan'),
('HD019', 'KH002', 'VIP09', 'MT03', '2015-11-12 22:12', '2015-11-13 02:00', 'Da thanh toan'),
('HD020', 'KH004', 'VIP09', 'MT03', '2014-02-25 01:15', '2014-02-25 04:15', 'Chua thanh toan')

INSERT INTO CHITIET_SUDUNGDV VALUES 
('HD001', 'DV01', 5),
('HD002', 'DV01', 8),
('HD002', 'DV02', 5),
('HD002', 'DV03', 2),
('HD003', 'DV04', 1),
('HD003', 'DV05', 6),
('HD004', 'DV01', 5),
('HD005', 'DV02', 3),
('HD005', 'DV03', 10),
('HD005', 'DV04', 2),
('HD006', 'DV01', 5),
('HD007', 'DV03', 8),
('HD007', 'DV04', 10),
('HD007', 'DV05', 4),
('HD013', 'DV02', 9),
('HD011', 'DV02', 8)


-- Câu 3 Liệt kê những phòng karaoke chứa được số lượng tối đa dưới 20 khách
SELECT * FROM PHONG WHERE SoKhachToiDa < 20

-- Câu 4 Liệt kê thông tin của các dịch vụ có đơn vị tính là "Chai" với đơn giá nhỏ hơn 20.000 VNĐ 
-- và các dịch vụ có đơn vị tính là "Lon" với đơn giá lớn hơn 30.000 VNĐ
SELECT * FROM DICHVU WHERE (DonViTinh = 'Chai' AND DonGia < 20000) OR (DonViTinh = 'Lon' AND DonGia > 30000)

-- Câu 5 Liệt kê thông tin của các phòng karaoke có mã phòng bắt đầu bằng cụm từ "VIP"
SELECT * FROM PHONG WHERE MaPhong LIKE 'VIP%'

-- Câu 6 Liệt kê thông tin của toàn bộ các dịch vụ, yêu cầu sắp xếp giảm dần theo đơn giá
SELECT * FROM DICHVU ORDER BY DonGia DESC

-- Câu 7 Đếm số hóa đơn có trạng thái là "Chưa thanh toán" và có thời gian bắt đầu sử dụng nằm trong ngày hiện tại 
SELECT COUNT(*) AS SoHoaDon FROM HOADON
WHERE TrangThaiHD = 'Chua thanh toan' AND DAY(ThoiGianBatDauSD) = DAY(GETDATE())

-- Câu 8 Liệt kê địa chỉ của toàn bộ các khách hàng với yêu cầu mỗi địa chỉ được liệt kê một lần duy nhất
SELECT DiaChi FROM KHACHHANG GROUP BY DiaChi

-- Câu 9 Liệt kê MaHD, MaKH, TenKH, DiaChi, MaPhong, DonGia (Tiền giờ), ThoiGianBatDauSD, ThoiGianKetThucSD 
-- của tất cả các hóa đơn có trạng thái là "Đã thanh toán"
SELECT HD.MaHD, HD.MaKH, KH.TenKH, KH.DiaChi, HD.MaPhong, MTG.DonGia, HD.ThoiGianBatDauSD, HD.ThoiGianKetThucSD 
FROM HOADON HD JOIN KHACHHANG KH ON HD.MaKH = KH.MAKH JOIN MUCTIENGIO MTG ON HD.MaTienGio = MTG.MaTienGio
WHERE HD.TrangThaiHD = 'Da thanh toan'

-- Câu 10 Liệt kê MaKH, TenKH, DiaChi, MaHD, TrangThaiHD của tất cả các hóa đơn với yêu cầu những khách hàng 
-- chưa từng có một hóa đơn nào thì cũng liệt kê thông tin những khách hàng đó ra
SELECT KH.MaKH, KH.TenKH, KH.DiaChi, HD.MaHD, HD.TrangThaiHD 
FROM KHACHHANG KH FULL OUTER JOIN HOADON HD ON KH.MaKH = HD.MaKH

-- Câu 11 Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ "Trái cây" 
-- hoặc từng sử dụng phòng karaoke có mã phòng là "VIP07"
SELECT KH.*
FROM KHACHHANG KH JOIN HOADON HD ON KH.MaKH = HD.MaKH JOIN CHITIET_SUDUNGDV CT ON HD.MaHD = CT.MaHD JOIN DICHVU DV ON DV.MaDV = CT.MaDV
WHERE DV.TenDV = 'Trai Cay' OR HD.MaPhong = 'VIP07' 

-- Câu 12 Liệt kê thông tin của các khách hàng chưa từng sử dụng dịch vụ hát karaoke lần nào cả 
SELECT * FROM KHACHHANG WHERE MaKH NOT IN (SELECT MaKH FROM HOADON)

-- Câu 13 Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ hát karaoke và chưa từng sử dụng dịch vụ nào khác kèm theo
SELECT * FROM KHACHHANG 
WHERE MaKH IN (SELECT MaKH FROM HOADON)
AND MaKH NOT IN (SELECT KH.MaKH FROM KHACHHANG KH JOIN HOADON HD ON KH.MaKH = HD.MaKH JOIN CHITIET_SUDUNGDV CT ON HD.MaHD = CT.MaHD)

-- Câu 14 Liệt kê thông tin của những khách hàng đã từng hát karaoke vào năm "2014" nhưng chưa từng hát karaoke vào năm "2015"
SELECT * FROM KHACHHANG 
WHERE MaKH IN (SELECT MaKH FROM HOADON WHERE YEAR(ThoiGianBatDauSD)=2014 AND YEAR(ThoiGianKetThucSD)=2014) 
AND MaKH NOT IN (SELECT MaKH FROM HOADON WHERE YEAR(ThoiGianBatDauSD)=2015 OR YEAR(ThoiGianKetThucSD)=2015)

-- Câu 15 Hiển thị thông tin của những khách hàng có số lần hát karaoke nhiều nhất tính từ đầu năm 2014 đến hết năm 2014 
SELECT * FROM KHACHHANG 
WHERE MaKH IN (SELECT TOP 1 MaKH FROM HOADON WHERE YEAR(ThoiGianBatDauSD)=2014 AND YEAR(ThoiGianKetThucSD)=2014 GROUP BY MaKH ORDER BY COUNT(MaKH) DESC)

-- Câu 16 Đếm tổng số lượng loại dịch vụ đã được sử dụng trong năm 2014 với yêu cầu chỉ thực hiện tính 
-- đối với những loại dịch vụ có đơn giá từ 50.000 VNĐ trở lên
SELECT SUM(SoLuong) AS TongDV
FROM HOADON HD JOIN CHITIET_SUDUNGDV CT ON HD.MaHD = CT.MaHD JOIN DICHVU DV ON CT.MaDV = DV.MaDV
WHERE YEAR(HD.ThoiGianBatDauSD) = 2014 AND DV.DonGia >= 50000

-- Câu 17  Liệt kê MaKH, TenKH, MaSoThue của khách hàng có địa chỉ là "Hải Châu" và chỉ mới hát karaoke một lần duy nhất, 
-- kết quả được sắp xếp giảm dần theo TenKH 
SELECT MaKH, TenKH, MaSoThue FROM KHACHHANG
WHERE DiaChi = 'Hai Chau' AND MaKH IN (SELECT MaKH FROM HOADON GROUP BY MaKH HAVING COUNT(MaHD) = 1)
ORDER BY TenKH DESC

-- Câu 18 Cập nhật cột TrangThaiHD trong bảng HOADON thành giá trị "Đã hết hạn" đối với những khách hàng 
-- có địa chỉ là "Hải Châu" và có ThoiGianKetThucSD trước ngày 31/12/2015 
UPDATE HOADON SET TrangThaiHD = N'Da het han'
WHERE MaKH IN (SELECT MaKH FROM KHACHHANG WHERE DiaChi = 'Hai Chau')
AND ThoiGianKetThucSD < '2015-12-31 00:00'

-- Câu 19 Cập nhật cột MoTa trong bảng PHONG thành giá trị "Được sử dụng nhiều" cho những phòng 
-- được sử dụng từ 5 lần trở lên trong tháng 5 năm 2015 
UPDATE PHONG SET MoTa = 'Duoc su dung nhieu'
WHERE MaPhong IN 
(SELECT MaPhong FROM HOADON WHERE YEAR(ThoiGianBatDauSD) = 2015 AND MONTH(ThoiGianBatDauSD) = 5 GROUP BY MaPhong HAVING COUNT(MaPhong) = 5)

-- Câu 20 Xóa những hóa đơn có ThoiGianBatDauSD trước ngày 20/11/2015




