CREATE DATABASE PHUONGTIENGIAOTHONG

USE PHUONGTIENGIAOTHONG

CREATE TABLE NHACUNGCAP
(
	MaNhaCC NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenNhaCC NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(50),
	SDT NVARCHAR(50),
	MaSoThue NVARCHAR(50)
)

CREATE TABLE LOAIDICHVU
(
	MaLoaiDV NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenLoaiDV NVARCHAR(50)
)

CREATE TABLE MUCPHI
(
	MaMP NVARCHAR(50) NOT NULL PRIMARY KEY,
	DonGia INT,
	Mota NVARCHAR(50)
)

CREATE TABLE DONGXE
(
	DongXe NVARCHAR(50) NOT NULL PRIMARY KEY,
	HangXe NVARCHAR(50),
	SoChoNgoi INT
)

CREATE TABLE DANGKYCUNGCAP
(
	MaDKCC NVARCHAR(50) NOT NULL PRIMARY KEY,
	MaNhaCC NVARCHAR(50) NOT NULL,
	MaLoaiDV NVARCHAR(50) NOT NULL,
	DongXe NVARCHAR(50) NOT NULL,
	MaMP NVARCHAR(50) NOT NULL,
	NgayBatDauCungCap DATE,
	NgayKetThucCungCap DATE,
	SoLuongXeDangKy INT

	CONSTRAINT FK_DKCC_NCC
	FOREIGN KEY(MaNhaCC) REFERENCES NHACUNGCAP(MaNHaCC),
	CONSTRAINT FK_DKCC_LDV
	FOREIGN KEY(MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV),
	CONSTRAINT FK_DKCC_DX
	FOREIGN KEY(DongXe) REFERENCES DONGXE(DongXe),
	CONSTRAINT FK_DKCC_MP
	FOREIGN KEY(MaMP) REFERENCES MUCPHI(MaMP)
)

INSERT INTO NHACUNGCAP VALUES 
('NCC001', N'Cty TNHH Toàn Pháp', 'Hai Chau', '05113999888','568941'),
('NCC002', N'Cty Cổ phần Đông Du', 'Lien Chieu', '05113999889','456789'),
('NCC003', N'Ông Nguyễn Văn A', 'Hoa Thuan', '05113999890','321456'),
('NCC004', N'Cty Cổ phần Toàn Cầu Xanh', 'Hai Chau', '05113658945','513364'),
('NCC005', N'Cty TNHH AMA', 'Thanh Khe', '05113875466','546546'),
('NCC006', N'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469','524545'),
('NCC007', N'Cty TNHH Phan Thành', 'Thanh Khe', '05113987456','113021'),
('NCC008', N'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456','121230'),
('NCC009', N'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987121','533654'),
('NCC010', N'Cty Cổ phần Rạng đông', 'Lien Chieu', '05113569654','187864')

INSERT INTO LOAIDICHVU VALUES 
('DV01', N'Dịch vụ xe taxi'),
('DV02', N'Dịch vụ xe buýt cộng đồng tuyến cố định'),
('DV03', N'Dịch vụ xe cho thuê theo hợp đồng')

INSERT INTO MUCPHI VALUES 
('MP01', 10000, N'Áp dụng từ 1/2015'),
('MP02', 15000, N'Áp dụng từ 2/2015'),
('MP03', 20000, N'Áp dụng từ 1/2010'),
('MP04', 25000, N'Áp dụng từ 2/2011')

INSERT INTO DONGXE VALUES 
('Hiace', 'Toyota', 16),
('Vios', 'Toyota', 5),
('Escape', 'Ford', 5),
('Cerato', 'KIA', 7),
('Forte', 'KIA', 5),
('Starex', 'Huyndai', 7),
('Grand-i-10', 'Huyndai', 7)

INSERT INTO DANGKYCUNGCAP VALUES
('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015-11-20','2016-11-20',4),
('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015-11-20','2017-11-20',3),
('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017-11-20','2018-11-20',5),
('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015-11-20','2019-11-20',7),
('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019-11-20','2020-11-20',1),
('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016-11-10','2021-11-20',2),
('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015-11-30','2016-01-25',8),
('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016-02-28','2016-08-15',9),
('DK009', 'NCC005', 'DV03', 'Grand-i-10', 'MP02', '2016-04-27','2017-04-30',10),
('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2015-11-21','2016-02-22',4),
('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016-12-25','2016-02-20',5),
('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016-04-14','2017-12-20',6),
('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015-12-21','2016-12-21',8),
('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016-05-20','2016-12-30',1),
('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018-04-24','2019-11-20',6),
('DK016', 'NCC001', 'DV03', 'Grand-i-10', 'MP02', '2016-06-22','2016-12-21',8),
('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016-09-30','2019-09-30',4),
('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '2017-12-13','2018-09-30',2),
('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '2016-01-21','2016-12-30',8),
('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016-05-03','2017-10-21',7),
('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015-01-30','2016-12-30',9),
('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016-07-25','2017-12-30',6),
('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017-11-30','2018-05-20',5),
('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017-12-23','2019-11-30',8),
('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016-08-24','2017-10-25',1)

--Câu 3: Liệt kê những dòng xe có chỗ ngồi trên 5 chỗ
SELECT * 
FROM DONGXE 
WHERE SoChoNgoi > 5

--Câu 4 Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe thuộc hãng xe "Toyota" 
-- với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe thuộc hãng xe "KIA" với mức phí có đơn giá là 20.000 VNĐ/km (0.5 điểm)	
SELECT DISTINCT NCC.*
FROM NHACUNGCAP NCC JOIN DANGKYCUNGCAP DKCC ON NCC.MaNhaCC = DKCC.MaNhaCC
JOIN DONGXE DX ON DKCC.DongXe = DX.DongXe 
JOIN MUCPHI MP ON DKCC.MaMP = MP.MaMP
WHERE (DX.HangXe = 'Toyota' AND MP.DonGia = 15000)
OR (DX.HangXe = 'KIA' AND MP.DonGia = 20000)

--Câu 5: Liệt kê thông tin của các dòng xe có hãng xe bắt đầu là "T" và có độ dài là 5 ký tự (0.5 điểm)		
SELECT *
FROM DONGXE
WHERE HangXe LIKE 'T%' AND LEN(HangXe) = 5

--Câu 6: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế (0.5 điểm)						
SELECT *
FROM NHACUNGCAP
ORDER BY TenNhaCC ASC, MaSoThue DESC

--Câu 7: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với yêu cầu chỉ đếm cho những nhà cung cấp						
--thực hiện đăng ký cung cấp có ngày bắt đầu cung cấp là "20/11/2015" (0.5 điểm)	
SELECT MaNhaCC, COUNT(MaDKCC)
FROM DANGKYCUNGCAP 
WHERE NgayBatDauCungCap = '2015-11-20'
GROUP BY MaNhaCC

--Câu 8: Liệt kê tên của toàn bộ các hãng xe với yêu cầu mỗi hãng xe chỉ được liệt kê một lần (0.5 điểm)		


--Câu 9: Liệt kê MaDKCC, TenLoaiDV, TenNhaCC, DonGia, DongXe, HangXe, NgayBatDauCC, NgayKetThucCC, SoLuongXeDangKy của tất cả							
--các lần đăng ký cung cấp phương tiện (0.5 điểm)	


--Câu 10: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia, HangXe, NgayBatDauCC, NgayKetThucCC của tất cả							
--các lần đăng ký cung cấp phương tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện 							
--thì cũng liệt kê thông tin những nhà cung cấp đó ra (0.5 điểm)		


--Câu 11: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe "Hiace" 
--hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe "Cerato" (0.5 điểm)				


--Câu 12:Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả (0.5 điểm)	


--Câu 13: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe "Hiace" 						
--và chưa từng đăng ký cung  cấp phương tiện thuộc dòng xe "Cerato" (0.5 điểm)			


--Câu 14: Liệt kê thông tin của những dòng xe chưa được nhà cung cấp nào đăng ký cho thuê vào năm "2015"					
--nhưng đã từng được đăng ký cho thuê vào năm "2016" (0.5 điểm)					


--Câu 15: Hiển thị thông tin của những dòng xe có số lần được đăng ký cho thuê nhiều nhất tính từ đầu năm 2016 đến hết năm 2019 (0.5 điểm)							


--Câu 16: Tính tổng số lượng xe đã được đăng ký cho thuê tương ứng với từng dòng xe với yêu cầu chỉ thực hiện tính đối với những						
--lần đăng ký cho thuê có mức phí với đơn giá là 20.000 VNĐ trên 1 km (0.5 điểm)						


--Câu 17: Liệt kê MaNCC, SoLuongXeDangKy với yêu cầu chỉ liệt kê những nhà cung cấp có địa chỉ là "Hai Chau" và 						
--chỉ mới thực hiện đăng ký cho thuê một lần duy nhất, kết quả được sắp xếp tăng dần theo số lượng xe đăng ký (0.5 điểm)


--Câu 18: Cập nhật cột SoLuongXeDangKy trong bảng DANGKYCUNGCAP thành giá trị 20 đối với những dòng xe thuộc hãng "Toyota"						
--và có NgayKetThucCungCap trước ngày 30/12/2016 (0.5 điểm)		


--Câu 19: Cập nhật cột MoTa trong bảng MUCPHI thành giá trị "Được sử dụng nhiều" cho những mức phí được sử dụng để đăng ký cung cấp cho thuê							
--phương tiện từ 5 lần trở lên trong năm 2016 (0.5 điểm)		


--Câu 20: Xóa những lần đăng ký cung cấp cho thuê phương tiện có ngày bắt đầu cung cấp sau ngày 10/11/2015 và đăng ký cho thuê dòng xe "Vios" (0.5 điểm)