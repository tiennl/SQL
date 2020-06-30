USE CAYCANH

CREATE TABLE KHACHHANG
(
	MaKH VARCHAR(10) NOT NULL PRIMARY KEY,
	HoTenKH VARCHAR(50),
	DiaChiKH VARCHAR(50),
	SoDienThoaiKH VARCHAR(20)
)

CREATE TABLE LOAICAYCANH
(
	MaLoaiCC VARCHAR(10) NOT NULL PRIMARY KEY,
	MoTaLoaiCC VARCHAR(50)
)

CREATE TABLE CAYCANH
(
	MaCayCanh VARCHAR(10) NOT NULL PRIMARY KEY,
	MoTa VARCHAR(50),
	MaLoaiCC VARCHAR(10),
	DonGiaChoThue INT
	CONSTRAINT FK_CC_LCC
	FOREIGN KEY (MaLoaiCC) REFERENCES LOAICAYCANH(MaLoaiCC)
)

CREATE TABLE HOPDONGCHOTHUE
(
	MaHopDong VARCHAR(10) NOT NULL PRIMARY KEY,
	MaKH VARCHAR(10) NOT NULL,
	SoTienDuocGiamGia INT,
	SoTienDatCoc INT,
	TrangThaiHopDong VARCHAR(50)
	CONSTRAINT FK_HDCT_KH
	FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
)

CREATE TABLE LOAIDICHVU
(
	MaLoaiDV VARCHAR(10) NOT NULL PRIMARY KEY,
	MoTaLoaiDV VARCHAR(50)
)

CREATE TABLE CHITIETHOPDONG
(
	MaHopDong VARCHAR(10) NOT NULL,
	MaCayCanh VARCHAR(10) NOT NULL,
	SoLuong INT,
	MaLoaiDV VARCHAR(10),
	NgayBatDauChoThue DATE,
	NgayKetThucChoThue DATE
	CONSTRAINT PK_CTHD_HD_CC
	PRIMARY KEY (MAHopDong, MaCayCanh),
	CONSTRAINT FK_CTHD_HD
	FOREIGN KEY (MaHopDong) REFERENCES HOPDONGCHOTHUE(MaHopDong),
	CONSTRAINT FK_CTHD_CC
	FOREIGN KEY (MaCayCanh) REFERENCES CAYCANH(MaCayCanh),
	CONSTRAINT FK_CTHD_LDV
	FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU (MaLoaiDV)
)

INSERT INTO KHACHHANG VALUES
('KH0001', 'Bui A', 'Lien Chieu', '09012345'),
('KH0002', 'Bui B', 'Thanh Khe', '09112345'),
('KH0003', 'Nguyen A', 'Lien Chieu', '09112346'),
('KH0004', 'Nguyen B', 'Thanh Khe', '09012346'),
('KH0005', 'Bui A', 'Hai Chau', '09012347'),
('KH0006', 'Nguyen B', 'Hai Chau', '09112347')

INSERT INTO LOAICAYCANH VALUES
('LCC01', 'Chung o phong khach'),
('LCC02', 'Chung o cau thang'),
('LCC03', 'Chung o ngoai san')

INSERT INTO CAYCANH VALUES
('CC001', 'Hoa hong', 'LCC01', 10000),
('CC002', 'Mai tu quy', 'LCC01', 20000),
('CC003', 'Hoa anh dao', 'LCC01', 60000),
('CC004', 'Bonsai', 'LCC03', 100000),
('CC005', 'Hong tieu muoi', 'LCC02', 70000)

INSERT INTO HOPDONGCHOTHUE VALUES
('HD0001', 'KH0002', 0, 1000000, 'Da ket thuc'),
('HD0002', 'KH0002', 0, 0, 'NULL'),
('HD0003', 'KH0001', 0, 0, 'Da ket thuc'),
('HD0004', 'KH0005', 0, 0, 'Dang cho thue'),
('HD0005', 'KH0004', 0, 0, 'Dang cho thue'),
('HD0006', 'KH0004', 0, 0, 'Chua bat dau'),
('HD0007', 'KH0002', 0, 0, 'Da ket thuc'),
('HD0008', 'KH0004', 0, 0, 'NULL')

INSERT INTO LOAIDICHVU VALUES
('L01', 'Chung Tet'),
('L02', 'Chung nha moi')

INSERT INTO CHITIETHOPDONG VALUES
('HD0001', 'CC003', 100, 'L01', '2016-07-03', '2016-07-05'),
('HD0002', 'CC001', 150, 'L01', '2015-10-11', '2015-10-22'),
('HD0003', 'CC004', 20, 'L01', '2017-12-23', '2017-12-30'),
('HD0004', 'CC002', 5, 'L01', '2014-01-01', '2014-01-10'),
('HD0005', 'CC005', 10, 'L01', '2016-10-16', '2016-10-18'),
('HD0006', 'CC001', 300, 'L01', '2017-12-11', '2017-12-22'),
('HD0007', 'CC004', 5, 'L01', '2016-02-01', '2016-02-10'),
('HD0007', 'CC001', 15, 'L01', '2016-02-10', '2016-02-12')

-- Câu 3: Liệt kê những cây cảnh có DonGiaChoThue nhỏ hơn 50000 VND
SELECT * FROM CAYCANH WHERE DonGiaChoThue < 50000

-- Câu 4: Liệt kê những khách hàng có địa chỉ ở 'Lien Chieu' mà có số điện thoại bắt đầu bằng '090' 
-- và những khách hàng có địa chỉ ở 'Thanh Khe' mà có số điện thoại bắt đầu bằng '091'
SELECT * FROM KHACHHANG WHERE (DiaChiKH = 'Lien Chieu' AND SoDienThoaiKH LIKE '090%') 
OR (DiaChiKH = 'Thanh Khe' AND SoDienThoaiKH LIKE '091%')

-- Câu 5: Liệt kê thông tin của các khách hàng có họ (trong họ tên) là 'Bui'
SELECT * FROM KHACHHANG WHERE HoTenKH LIKE 'Bui%'

-- Câu 6: Liệt kê thông tin của toàn bộ các cây cảnh, yêu cầu sắp xếp giảm dần theo MoTa và giảm dần theo DonGiaChoThue
SELECT * FROM CAYCANH ORDER BY MoTa DESC, DonGiaChoThue DESC

-- Câu 7: Liệt kê các hợp đồng cho thuê có trạng thái là 'Da ket thuc' hoặc chưa xác định (có giá trị là NULL)
SELECT * FROM HOPDONGCHOTHUE WHERE TrangThaiHopDong IN ('Da ket thuc', 'NULL')

-- Câu 8: Liệt kê họ tên của toàn bộ khách hàng với yêu cầu mỗi họ tên chỉ được liệt kê một lần duy nhất
SELECT DISTINCT HoTenKH FROM KHACHHANG

-- Câu 9: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong của tất cả các hợp đồng có trạng thái là 'Dang cho thue'
SELECT HD.MaHopDong, HD.MaKH, HD.TrangThaiHopDong, CT.MaCayCanh, CT.SoLuong
FROM HOPDONGCHOTHUE HD JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
WHERE HD.TrangThaiHopDong = 'Dang cho thue'

-- Câu 10: Liệt kê MaHopDong, MaKH, TrangThaiHopDong, MaCayCanh, SoLuong của tất cả các hợp đồng với yêu cầu những hợp đồng nào 
-- chưa có một chi tiết hợp đồng nào thì cũng phải liệt kê thông tin những hợp đồng đó ra
SELECT HD.MaHopDong, HD.MaKH, HD.TrangThaiHopDong, CT.MaCayCanh, CT.SoLuong
FROM HOPDONGCHOTHUE HD LEFT JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong

-- Câu 11: Liệt kê thông tin của các khách hàng ở địa chỉ là 'Hai Chau' đã từng thuê cây cảnh thuộc loại cây cảnh có mô tả là 
-- 'Chung o phong khach' hoặc các khách hàng từng thuê cây cảnh với thời gian bắt đầu thuê là '11/12/2017'
SELECT * FROM KHACHHANG
WHERE MaKH IN 
	(SELECT KH.MaKH FROM KHACHHANG KH JOIN HOPDONGCHOTHUE HD ON KH.MaKH = HD.MaKH JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
	JOIN CAYCANH CC ON CT.MaCayCanh = CC.MaCayCanh JOIN LOAICAYCANH LCC ON CC.MaLoaiCC = LCC.MaLoaiCC
	WHERE KH.DiaChiKH = 'Hai Chau' AND LCC.MoTaLoaiCC = 'Chung o phong khach')
OR MAKH IN 
	(SELECT KH.MAKH FROM KHACHHANG KH JOIN HOPDONGCHOTHUE HD ON KH.MaKH = HD.MaKH JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
	WHERE CT.NgayBatDauChoThue = '2017-12-11')

-- Câu 12: Liệt kê thông tin của các khách hàng chưa từng thuê cây cảnh một lần nào cả
SELECT * FROM KHACHHANG WHERE MaKH NOT IN (SELECT MaKH FROM HOPDONGCHOTHUE)

-- Câu 13: Liệt kê thông tin của các khách hàng đã từng thuê loại cây cảnh được mô tả là 'Chung o phong khach' 
-- và đã từng thuê cây cảnh vào tháng 12 năm 2017
SELECT KH.* FROM KHACHHANG KH JOIN HOPDONGCHOTHUE HD ON KH.MaKH = HD.MaKH JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
JOIN CAYCANH CC ON CT.MaCayCanh = CC.MaCayCanh JOIN LOAICAYCANH LCC ON CC.MaLoaiCC = LCC.MaLoaiCC
WHERE LCC.MoTaLoaiCC = 'Chung o phong khach' AND YEAR(CT.NgayBatDauChoThue) = 2017 AND MONTH(CT.NgayBatDauChoThue) = 12

-- Câu 14: Liệt kê thông tin của những khách hàng đã từng thuê cây cảnh vào năm 2016 nhưng chưa từng thuê vào năm 2017 
SELECT * FROM KHACHHANG
WHERE MaKH IN
(SELECT KH.MaKH FROM KHACHHANG KH JOIN HOPDONGCHOTHUE HD ON KH.MaKH = HD.MaKH JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
WHERE YEAR(CT.NgayBatDauChoThue) = 2016)
AND MAKH NOT IN
(SELECT KH.MaKH FROM KHACHHANG KH JOIN HOPDONGCHOTHUE HD ON KH.MaKH = HD.MaKH JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
WHERE YEAR(CT.NgayBatDauChoThue) = 2017)

-- Câu 15: Hiển thị MaCayCanh, MaLoaiCC của những cây cảnh từng được thuê với số lượng lớn hơn 10 trong một hợp đồng bất kỳ nào đó. 
-- Kết quả hiển thị cần được xóa bớt dữ liệu bị trùng lặp
SELECT DISTINCT CC.MaCayCanh, CC.MaLoaiCC 
FROM CAYCANH CC JOIN CHITIETHOPDONG CT ON CC.MaCayCanh = CT.MaCayCanh
WHERE CT.SoLuong > 10

-- Câu 16: Đếm tổng số khách hàng đã thuê cây cảnh trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những khách hàng 
-- đã từng thuê ít nhất 2 lần (có từ 2 hợp đồng khác nhau với công ty trở lên) vào năm 2016
SELECT COUNT(DISTINCT MaKH) AS TongSoKH FROM HOPDONGCHOTHUE HD JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
WHERE YEAR(CT.NgayBatDauChoThue) = 2016
GROUP BY MaKH
HAVING COUNT(MaKH) >= 2

-- Câu 17: Liệt kê những khách hàng chỉ mới thuê 1 lần duy nhất (chỉ có 1 hợp đồng duy nhất với công ty) 
-- và chỉ thuê 1 nhóm cây cảnh duy nhất trong năm 2017, kết quả được sắp xếp giảm dần theo MaKhachHang
SELECT * FROM KHACHHANG 
WHERE MaKH IN 
(SELECT MaKH FROM HOPDONGCHOTHUE HD JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
GROUP BY MaKH HAVING COUNT(MaKH) = 1)
AND MaKH IN
(SELECT MaKH FROM HOPDONGCHOTHUE HD JOIN CHITIETHOPDONG CT ON HD.MaHopDong = CT.MaHopDong
WHERE YEAR(CT.NgayBatDauChoThue) = 2017)
ORDER BY MaKH DESC

-- Câu 18: Cập nhật cột TrangThaiHopDong trong bảng HOPDONGCHOTHUE thành giá trị 'Bi huy' đối với những hợp đồng 
-- có TrangThaiHopDong là 'Chua bat dau' và có SoTienDatCoc là 0 VND
UPDATE HOPDONGCHOTHUE SET TrangThaiHopDong = 'Bi huy'
WHERE TrangThaiHopDong = 'Chua bat dau' AND SoTienDatCoc = 0

-- Câu 19: Cập nhật cột NgayKetThucChoThue trong bảng CHITIETHOPDONG thành NULL cho những cây cảnh đã từng được cho thuê từ 2 lần trở lên
UPDATE CHITIETHOPDONG SET NgayKetThucChoThue = NULL
WHERE MaCayCanh IN
(SELECT MaCayCanh FROM CHITIETHOPDONG GROUP BY MaCayCanh HAVING COUNT(MaHopDong) >= 2)

-- Câu 20: Xóa những loại dịch vụ chưa từng được sử dụng trong bất kỳ một hợp đồng nào
DELETE FROM LOAIDICHVU WHERE MaLoaiDV NOT IN
(SELECT DISTINCT MaLoaiDV FROM CHITIETHOPDONG)

