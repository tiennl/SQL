CREATE DATABASE QUANLYCUUTRO

USE QUANLYCUUTRO

CREATE TABLE DON_VI_UNG_HO
(
	MaDVUH VARCHAR(50) NOT NULL PRIMARY KEY,
	HoTenNguoiDaiDien VARCHAR(50),
	DiaChiNguoiDaiDien VARCHAR(50),
	SoDienThoaiLienLac VARCHAR(50),
	SoCMNDNguoiDaiDien VARCHAR(50),
	SoTaiKhoanNganHang VARCHAR(50),
	TenNganHang VARCHAR(50),
	ChiNhanhNganHang VARCHAR(50),
	TenChuTKNganHang VARCHAR(50)
)

CREATE TABLE HO_DAN
(
	MaHoDan VARCHAR(50) NOT NULL PRIMARY KEY,
	HoTenChuHo VARCHAR(50),
	ToDanPho INT,
	KhoiHoacThon INT,
	SoDienThoai VARCHAR(50),
	DiaChiNha VARCHAR(50),
	SoNhanKhau INT,
	DienGiaDinh VARCHAR(50),
	LaHoNgheo VARCHAR(50)
)

CREATE TABLE DOT_UNG_HO
(
	MaDotUngHo VARCHAR(50) NOT NULL PRIMARY KEY,
	MaDVUH VARCHAR(50),
	NgayUngHo DATE
	CONSTRAINT FK_DUH_DVUH
	FOREIGN KEY (MaDVUH) REFERENCES DON_VI_UNG_HO(MaDVUH)
)

CREATE TABLE HINH_THUC_UH
(
	MaHinhThucUH VARCHAR(50) NOT NULL PRIMARY KEY,
	TenHinhThucUngHo VARCHAR(50)
)

CREATE TABLE DOT_NHAN_UNG_HO
(
	MaDotNhanUngHo VARCHAR(50) NOT NULL PRIMARY KEY,
	MaHoDan VARCHAR(50),
	NgayNhanUngHo DATE
	CONSTRAINT FK_DNUH_HD
	FOREIGN KEY (MaHoDan) REFERENCES HO_DAN(MaHoDan)
)

CREATE TABLE CHI_TIET_UNG_HO
(
	MaDotUngHo VARCHAR(50) NOT NULL,
	MaHinhThucUH VARCHAR(50) NOT NULL,
	SoLuongUngHo INT,
	DonViTinh VARCHAR(50)
	CONSTRAINT PK_CTUH_DUH_HTUH
	PRIMARY KEY (MaDotUngHo, MaHinhThucUH),
	CONSTRAINT FK_CTUH_DUH
	FOREIGN KEY (MaDotUngHo) REFERENCES DOT_UNG_HO(MaDotUngHo),
	CONSTRAINT FK_CTUH_HTUH
	FOREIGN KEY (MaHinhThucUH) REFERENCES HINH_THUC_UH(MaHinhThucUH)
)

CREATE TABLE CHI_TIET_NHAN_UNG_HO
(
	MaDotNhanUngHo VARCHAR(50),
	MaHinhThucUH VARCHAR(50),
	SoLuongNhanUngHo INT,
	DonViTinh VARCHAR(50)
	CONSTRAINT PK_CTNUH_DNUH_HTUH
	PRIMARY KEY (MaDotNhanUngHo, MaHinhThucUH),
	CONSTRAINT FK_CTNUH_DNUH
	FOREIGN KEY (MaDotNhanUngHo) REFERENCES DOT_NHAN_UNG_HO(MaDotNhanUngHo),
	CONSTRAINT FK_CTNUH_HTUH
	FOREIGN KEY (MaHinhThucUH) REFERENCES HINH_THUC_UH(MaHinhThucUH)
)
INSERT INTO DON_VI_UNG_HO(MaDVUH, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, SoCMNDNguoiDaiDien, SoTaiKhoanNganHang, TenNganHang, ChiNhanhNganHang) VALUES
('CN001', 'Nguyen Van A1', 'Nui Thanh, Quang Nam', '0905121121', '124898000', '65874000', 'TienPhong Bank', 'Da Nang'),
('CN002', 'Nguyen Van A2', 'Phong Dien, Thua Thien Hue', '0905121122', '124898001', '65874001', 'VietCom Bank', 'Quang Nam'),
('CTY01', 'Nguyen Van A3', 'Tam Dao, Vinh Phuc', '0905121123', '124898002', '65874002', 'DongA Bank', 'Thua Thien Hue'),
('CTY02', 'Nguyen Van A4', 'Ba To, Quang Ngai', '0905121124', '124898003', '65874003', 'Mbank', 'Gia Lai')

INSERT INTO DOT_UNG_HO(MaDotUngHo, MaDVUH, NgayUngHo) VALUES
('UH001', 'CN002', '2016-11-18'),
('UH002', 'CTY01', '2015-11-19'),
('UH003', 'CTY02', '2015-08-10'),
('UH004', 'CTY02', '2015-10-20'),
('UH005', 'CTY02', '2016-11-11')

INSERT INTO HINH_THUC_UH(MaHinhThucUH, TenHinhThucUngHo) VALUES
('HT01', 'Tien mat'),
('HT02', 'Mi tom'),
('HT03', 'Quan ao')

INSERT INTO CHI_TIET_UNG_HO(MaDotUngHo, MaHinhThucUH, SoLuongUngHo, DonViTinh) VALUES
('UH001', 'HT01', 6000, 'USD'),
('UH002', 'HT02', 50, 'Thung'),
('UH003', 'HT03', 200, 'Bo'),
('UH003', 'HT01', 100000, 'JPY'),
('UH004', 'HT01', 100000, 'USD'),
('UH005', 'HT03', 100, 'BO')

INSERT INTO HO_DAN(MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, SoDienThoai, DiaChiNha, SoNhanKhau, DienGiaDinh) VALUES
('HD001', 'Tran Van B1', 10, 5, '0915222000', '12 Tran Van On', 5, 'Cong nhan vien chuc'),
('HD002', 'Tran Van B2', 11, 6, '0915222001', '13 Nguyen Huu Tho', 2, 'Cong nhan vien chuc'),
('HD003', 'Tran Van B3', 12, 7, '0915222002', '14 Phan Chu Trinh', 6, 'Thuong Binh'),
('HD004', 'Tran Van B4', 13, 7, '0915222003', '15 Phan Chu Trinh', 1, 'Me VNAH')

INSERT INTO DOT_NHAN_UNG_HO(MaDotNhanUngHo, MaHoDan, NgayNhanUngHo) VALUES
('NhanUH001', 'HD003', '2016-11-11'),
('NhanUH002', 'HD001', '2016-11-18'),
('NhanUH003', 'HD003', '2016-11-20')

INSERT INTO CHI_TIET_NHAN_UNG_HO(MaDotNhanUngHo, MaHinhThucUH, SoLuongNhanUngHo, DonViTinh) VALUES
('NhanUH001', 'HT01', 5000, 'USD'),
('NhanUH001', 'HT02', 50, 'Thung'),
('NhanUH002', 'HT03', 100, 'Bo'),
('NhanUH003', 'HT01', 10000000, 'VND'),
('NhanUH003', 'HT02', 25, 'Thung'),
('NhanUH003', 'HT03', 70, 'Bo')

-- 3. Liệt kê những hộ dân có từ 5 nhân khẩu trở lên
SELECT * 
FROM HO_DAN
WHERE SoNhanKhau >= 5

-- 4. Liệt kê các hộ dân là hộ nghèo và thuộc diện gia đình 'Thuong binh' 
-- và các hộ dân ko là hộ nghèo và thuộc diện gđ 'Cong nhan vien chuc'
SELECT *
FROM HO_DAN
WHERE (LaHoNgheo = '1' AND DienGiaDinh = 'Thuong Binh')
OR (LaHoNgheo = '0' AND DienGiaDinh = 'Cong nhan vien chuc')

-- 5. Liệt kê các đơn vị ủng hộ có MaDVUH bắt đầu bằng 'CTY'
SELECT *
FROM DON_VI_UNG_HO
WHERE MaDVUH LIKE 'CTY%'

-- 6. Liệt kê thông tin toàn bộ các hộ dân, sắp xếp giảm dần theo số nhân khẩu
SELECT * 
FROM HO_DAN
ORDER BY SoNhanKhau DESC

-- 7. Đếm số lượt ủng hộ diễn ra trong ngày hiện tại (của hệ thống)
SELECT COUNT(*) AS SoLuotUngHo
FROM DOT_UNG_HO
WHERE NgayUngHo = GETDATE()

-- 8. Liệt kê toàn bộ các loại diện gia đình trong bảng HO_DAN với yêu cầu mỗi loại diện gia đình
-- được liệt kê 1 lần duy nhất
SELECT DISTINCT DienGiaDinh
FROM HO_DAN

-- 9. Liệt kê MaDotUngHo, NgayUngHo, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, 
-- SoCMNDNguoiDaiDien của tất cả các đợt ủng hộ có trong hệ thống
SELECT MaDotUngHo, NgayUngHo, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, SoCMNDNguoiDaiDien
FROM DOT_UNG_HO DUH JOIN DON_VI_UNG_HO DVUH ON DUH.MaDVUH = DVUH.MaDVUH

-- 10. Liệt kê MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, DienGiaDinh, MaDotNhanUngHo, NgayNhanUngHo
-- của tất cả các hộ dân với yêu cầu những hộ dân nào chưa từng được nhận ủng hộ lần nào thì cũng liệt kê
-- thông tin những hộ dân đó ra
SELECT HD.MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, DienGiaDinh, MaDotNhanUngHo, NgayNhanUngHo
FROM HO_DAN HD LEFT JOIN DOT_NHAN_UNG_HO DNUH ON HD.MaHoDan = DNUH.MaHoDan

-- 11. Liệt kê thông tin các hộ dân đã từng được nhận ủng hộ dưới hình thức là 'Tien mat' 
-- hoặc hộ dân thuộc diện hộ nghèo mà có số nhân khẩu dưới 3 người 
SELECT * FROM HO_DAN
WHERE MaHoDan IN
(SELECT HD.MaHoDan
FROM HINH_THUC_UH HTUH JOIN CHI_TIET_NHAN_UNG_HO CTNUH ON HTUH.MaHinhThucUH = CTNUH.MaHinhThucUH
JOIN DOT_NHAN_UNG_HO DNUH ON CTNUH.MaDotNhanUngHo = DNUH.MaDotNhanUngHo
JOIN HO_DAN HD ON DNUH.MaHoDan = HD.MaHoDan
WHERE HTUH.TenHinhThucUngHo = 'Tien mat')
OR MaHoDan IN
(SELECT MaHoDan FROM HO_DAN 
WHERE LaHoNgheo = '1' AND SoNhanKhau < 3)

--12 Liệt kê thông tin của các hộ dân chưa từng được nhận ủng hộ nào
SELECT *
FROM HO_DAN
WHERE MaHoDan NOT IN
(SELECT MaHoDan FROM DOT_NHAN_UNG_HO)

--13 Liệt kê thông tin của các đơn vị ủng hộ đã từng ủng hộ dưới hình thức 'Tien mat' và chưa từng  
-- ủng hộ dưới hình thức 'Quan ao'
SELECT * FROM DON_VI_UNG_HO
WHERE MaDVUH IN
(SELECT DVUH.MaDVUH
FROM HINH_THUC_UH HTUH JOIN CHI_TIET_UNG_HO CTUH ON HTUH.MaHinhThucUH = CTUH.MaHinhThucUH
JOIN DOT_UNG_HO DUH ON CTUH.MaDotUngHo = DUH.MaDotUngHo
JOIN DON_VI_UNG_HO DVUH ON DUH.MaDVUH = DVUH.MaDVUH
WHERE HTUH.TenHinhThucUngHo = 'Tien mat')
AND MaDVUH NOT IN
(SELECT DVUH.MaDVUH
FROM HINH_THUC_UH HTUH JOIN CHI_TIET_UNG_HO CTUH ON HTUH.MaHinhThucUH = CTUH.MaHinhThucUH
JOIN DOT_UNG_HO DUH ON CTUH.MaDotUngHo = DUH.MaDotUngHo
JOIN DON_VI_UNG_HO DVUH ON DUH.MaDVUH = DVUH.MaDVUH
WHERE HTUH.TenHinhThucUngHo = 'Quan ao')

--14 Liệt kê thông tin của những đơn vị ủng hộ đã từng ủng hộ vào năm '2015' nhưng chưa từng ủng hộ vào năm '2016'
SELECT * FROM DON_VI_UNG_HO
WHERE MaDVUH IN
(SELECT MaDVUH FROM DOT_UNG_HO WHERE YEAR(NgayUngHo) = 2015)
AND MaDVUH NOT IN
(SELECT MaDVUH FROM DOT_UNG_HO WHERE YEAR(NgayUngHo) = 2016)

--15 Hiển thị thông tin của những đơn vị ủng hộ đã thực hiện ít nhất 2 đợt ủng hộ tính từ 30/07/2015 đến hết năm 2015
SELECT * FROM DON_VI_UNG_HO
WHERE MaDVUH IN
(SELECT MaDVUH
FROM DOT_UNG_HO
WHERE NgayUngHo >= '2015-07-30' AND NgayUngHo <='2015-12-31'
GROUP BY MaDVUH
HAVING COUNT(MaDotUngHo) >= 2)

--16 Đếm tổng số đợt được nhận ủng hộ của từng hộ dân trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những đợt
--được nhận ủng hộ có hình thức nhận ủng hộ là 'Tien mat'
SELECT 
FROM HINH_THUC_UH HTUH JOIN CHI_TIET_NHAN_UNG_HO CTNUH ON HTUH.MaHinhThucUH = CTNUH.MaHinhThucUH
JOIN 

--17 Liệt kê những ngày vừa diễn ra sự kiện có đơn vị ủng hộ đến trao hàng cứu trợ cho chính quyền,
--vừa diễn ra sự kiện có hộ dân được chính quyền phân phối hàng cứu trợ, kết quả được sắp xếp tăng dần theo ngày tìm được


--18 Cập nhật cột DonViTinh trong bảng CHI_TIET_UNG_HO thanh NULL đối với record có hình thức ủng hộ với TenHinhThucUngHo
--là 'Quan ao' và có giấy ủng hộ (NgayUngHo) trước ngày 30/12/2015


--19 Xóa những hộ dân chưa từng được nhận một lần ủng hộ nào từ chính quyền


--20 Xóa những record trong bảng CHI_TIET_UNG_HO của những đợt ủng hộ diễn ra trước năm 2015
