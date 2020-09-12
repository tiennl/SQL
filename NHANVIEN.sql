CREATE DATABASE NHANVIEN

USE NHANVIEN

CREATE TABLE NHANVIEN
(
	MaNV VARCHAR(20) NOT NULL PRIMARY KEY,
	TenNV VARCHAR(50),
	HoNV VARCHAR(50),
	NgaySinh DATE,
	DiaChi VARCHAR(100),
	Phai VARCHAR(20),
	Luong BIGINT,
	MaNQL VARCHAR(20),
	MaPHG VARCHAR(20)
	CONSTRAINT FK_NV_NV
	FOREIGN KEY (MaNQL) REFERENCES NHANVIEN(MaNV)
)

CREATE TABLE PHONGBAN
(
	MaPHG VARCHAR(20) NOT NULL PRIMARY KEY,
	TenPHG VARCHAR(50),
	NgNhanChuc DATE,
	TruongPHG VARCHAR(20) NOT NULL
	CONSTRAINT FK_PB_NV
	FOREIGN KEY (TruongPHG) REFERENCES NHANVIEN(MaNV)
)

ALTER TABLE NHANVIEN 
ADD CONSTRAINT FK_NV_PB FOREIGN KEY (MaPHG) REFERENCES PHONGBAN(MaPHG)

CREATE TABLE DIADIEMPHG
(
	MaPHG VARCHAR(20) NOT NULL,
	DiaDiem VARCHAR(50) NOT NULL
	CONSTRAINT PK_DDP_PB
	PRIMARY KEY (MaPHG, DiaDiem),
	CONSTRAINT FK_DDP_PB
	FOREIGN KEY (MaPHG) REFERENCES PHONGBAN(MaPHG)
)

CREATE TABLE THANNHAN
(
	TenTN VARCHAR(50) NOT NULL,
	MaNV VARCHAR(20) NOT NULL,
	Phai VARCHAR(20),
	NgaySinh DATE,
	QuanHe VARCHAR(50)
	CONSTRAINT PK_TN_NV
	PRIMARY KEY (TenTN, MaNV),
	CONSTRAINT FK_TN_NV
	FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
)

CREATE TABLE DEAN
(
	MaDA VARCHAR(20) NOT NULL PRIMARY KEY,
	TenDA VARCHAR(50),
	DiaDiemDA VARCHAR(50),
	MaPHG VARCHAR(20) NOT NULL
	CONSTRAINT FK_DA_PB
	FOREIGN KEY (MaPHG) REFERENCES PHONGBAN(MaPHG)
)

CREATE TABLE PHANCONG
(
	MaNV VARCHAR(20) NOT NULL,
	MaDA VARCHAR(20),
	ThoiGian FLOAT
	CONSTRAINT PK_PC_NV_DA
	PRIMARY KEY (MaNV, MaDA),
	CONSTRAINT FK_PC_NV
	FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
	CONSTRAINT FK_PC_DA
	FOREIGN KEY (MaDA) REFERENCES DEAN(MaDA)
)

INSERT INTO NHANVIEN(MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong) VALUES
('NV001', 'A', 'Nguyen', '1970-01-01', 'Hai Chau', 'Nam', 9000000),
('NV002', 'Tung', 'Nguyen', '1975-05-10', 'Lien Chieu', 'Nam', 8000000),
('NV003', 'Nhu', 'Le', '1980-07-20', 'Son Tra', 'Nu', 7000000)

INSERT INTO PHONGBAN(MaPHG, TenPHG, NgNhanChuc, TruongPHG) VALUES 
('P005', 'Dau tu', '2007-12-01', 'NV009'),
('P004', 'Ke hoach', '2005-12-01', 'NV007'),
('P001', 'Nghien cuu', '2000-12-01', 'NV001'),
('P002', 'Dieu hanh', '2005-09-15', 'NV002'),
('P003', 'Quan ly', '2010-10-20', 'NV003')

UPDATE NHANVIEN SET MaPHG = 'P001' WHERE MaNV = 'NV001'
UPDATE NHANVIEN SET MaPHG = 'P002' WHERE MaNV = 'NV002'
UPDATE NHANVIEN SET MaPHG = 'P003' WHERE MaNV = 'NV003'

INSERT INTO NHANVIEN(MaNV, TenNV, HoNV, NgaySinh, DiaChi, Phai, Luong, MaNQL, MaPHG) VALUES
('NV013', 'Thanh', 'Le', '1899-07-25', 'Son Tra', 'Nam', 4500000, 'NV003', 'P004'),
('NV011', 'An', 'Tran', '1896-07-25', 'Son Tra', 'Nam', 5500000, 'NV001', 'P005'),
('NV012', 'Hanh', 'Vo', '1890-07-25', 'Lien Chieu', 'Nu', 5800000, 'NV002', 'P004'),
('NV004', 'Khanh', 'Le', '1880-07-25', 'Lien Chieu', 'Nam', 5000000, 'NV001', 'P001'),
('NV005', 'Anh', 'Nguyen', '1990-10-10', 'Cam Le', 'Nu', 4500000, 'NV001', 'P001'),
('NV006', 'Uyen', 'Pham', '1991-09-20', 'Lien Chieu', 'Nu', 700000, 'NV002', 'P002'),
('NV007', 'Ha', 'Le', '1996-12-20', 'Hai Chau', 'Nam', 6500000, 'NV002', 'P002'),
('NV008', 'My', 'Tran', '1995-07-22', 'Hoa Vang', 'Nu', 7500000, 'NV003', 'P003'),
('NV009', 'Son', 'Nguyen', '1992-08-20', 'Lien Chieu', 'Nam', 6000000, 'NV003', 'P003'),
('NV010', 'Thu', 'Le', '1996-02-27', 'Hai Chau', 'Nu', 6500000, 'NV003', 'P003')

INSERT INTO DIADIEMPHG VALUES
('P004', 'Lien Chieu'),
('P005', 'Lien Chieu'),
('P001', 'Lien Chieu'),
('P002', 'Hai Chau'),
('P003', 'Son Tra')

INSERT INTO THANNHAN(MaNV, TenTN, Phai, NgaySinh, QuanHe) VALUES
('NV001', 'Son', 'Nam', '2000-10-21', 'Con'),
('NV001', 'Anh', 'Nu', '2002-09-04', 'Con'),
('NV003', 'Minh', 'Nam', '1973-10-21', 'Chong'),
('NV004', 'Thanh', 'Nam', '2010-04-21', 'Con'),
('NV005', 'Chi', 'Nu', '1960-10-25', 'Me'),
('NV007', 'Ha', 'Nam', '1996-12-20', 'Anh')

INSERT INTO DEAN(MaDA, TenDA, DiaDiemDA, MaPHG) VALUES 
('DA007', 'San pham YY', 'Ha Noi', 'P002'),
('DA008', 'San pham X', 'Ha Noi', 'P004'),
('DA001', 'He thong quan ly khach san', 'Son Tra', 'P001'),
('DA002', 'He thong quan ly sinh vien', 'Hai Chau', 'P002'),
('DA003', 'He thong quan ly nha hang', 'Lien Chieu', 'P003'),
('DA004', 'Phan mem chuyen van ban thanh giong noi', 'Hoa Vang','P001'),
('DA005', 'Phan mem tu dien Anh Viet', 'Thanh Khe','P002'),
('DA006', 'Phan mem trac nghiem Tieng Anh', 'Cam Le','P002')

INSERT INTO PHANCONG(MaNV, MaDA, ThoiGian) VALUES
('NV001','DA007', 180),
('NV001','DA008', 200),
('NV011','DA008', 180),
('NV012','DA008', 200),
('NV001','DA003', 150),
('NV001','DA004', 150),
('NV004','DA004', 100),
('NV001','DA005', 150),
('NV001','DA006', 150),
('NV001','DA002', 150),
('NV001','DA001', 100),
('NV002','DA002', 150),
('NV003','DA003', 200),
('NV004','DA001', 100),
('NV007','DA005', 50),
('NV008','DA005', 10),
('NV010','DA006', 30)

-- 4. Cho biết mã nhân viên có tham gia đề án hoặc có thân nhân
(SELECT MaNV FROM PHANCONG)
UNION
(SELECT MaNV FROM THANNHAN)

-- 5. Cho biết mã nhân viên có người thân và có tham gia đề án
(SELECT MaNV FROM THANNHAN)
INTERSECT 
(SELECT MaNV FROM PHANCONG)

-- 6. Cho biết mã nhân viên không có thân nhân nào
(SELECT MaNV FROM NHANVIEN)
EXCEPT 
(SELECT MaNV FROM THANNHAN)

-- Cho biết họ tên của các nhân viên và lương của họ sau khi tăng 10%
SELECT HoNV, TenNV, (Luong + Luong*10/100) AS LuongSauKhiTang
FROM NHANVIEN

-- 7. Cho biết họ và tên nhân viên làm việc ở phòng số 4
SELECT HoNV, TenNV
FROM NHANVIEN
WHERE MaPHG = 'P004'

-- 8. Với mỗi phòng ban, cho biết thông tin của người trưởng phòng
SELECT PB.MaPHG, PB.TenPHG, PB.TruongPHG, NV.TenNV, NV.HoNV, NV.NgaySinh, NV.DiaChi, NV.Phai, NV.Luong
FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TruongPHG = NV.MaNV

-- 9. Cho biết lương cao nhất trong công ty
SELECT TOP 1 Luong
FROM NHANVIEN

-- 10. Cho biết các phòng ban có cùng địa điểm với phòng số 5
SELECT MaPHG
FROM DIADIEMPHG
WHERE (DiaDiem = (SELECT DiaDiem FROM DIADIEMPHG WHERE MaPHG = 'P005')) AND (MaPHG <> 'P005')

-- 11. Cho biết nhân viên có lương hơn lương của nhân viên 'Tung'
SELECT MaNV, Luong
FROM NHANVIEN
WHERE Luong > (SELECT Luong FROM NHANVIEN WHERE TenNV = 'Tung')

-- 12. Với mỗi nhân viên, hãy cho biết thông tin của phòng ban mà họ đang làm việc
SELECT NV.MaNV, NV.TenNV, NV.HoNV, PB.* 
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MaPHG = PB.MaPHG

-- 13. Với mỗi phòng ban hãy cho biết các địa điểm của phòng ban đó
SELECT PB.MaPHG, PB.TenPHG, DDP.DiaDiem
FROM PHONGBAN PB JOIN DIADIEMPHG DDP ON PB.MaPHG = DDP.MaPHG

-- 14. Cho biết mã nhân viên tham gia tất cả các đề án
SELECT MaNV
FROM PHANCONG
GROUP BY MaNV
HAVING COUNT(MaDA) = (SELECT COUNT(MaDA) FROM DEAN)

-- 15. Cho biết mã nhân viên tham gia tất cả các đề án do phòng số 4 phụ trách
SELECT PC.MaNV
FROM PHANCONG PC JOIN DEAN DA ON PC.MaDA = DA.MaDA
WHERE DA.MaPHG = 'P004'
GROUP BY PC.MaNV
HAVING COUNT(PC.MaNV) = (SELECT COUNT(MaDA) FROM DEAN GROUP BY MaPHG HAVING MaPHG = 'P004')

------------------------------------------------------------------------------------------------------
-------------------------------------------- CHUONG 5 SQL --------------------------------------------
------------------------------------------------------------------------------------------------------

-- 1. Với những đề án ở ‘Ha Noi’, cho biết mã đề án, mã phòng ban chủ trì đề án, họ tên trưởng phòng 
-- cùng với ngày sinh và địa chỉ của người ấy
SELECT DA.MaDA, DA.MaPHG,  (NV.HoNV + ' ' + NV.TenNV) AS HoTenTrPHG, NV.NgaySinh, NV.DiaChi 
FROM DEAN DA JOIN PHONGBAN PB ON DA.MaPHG = PB.MaPHG 
JOIN NHANVIEN NV ON PB.TruongPHG = NV.MaNV 
WHERE DA.DiaDiemDA = 'Ha Noi'

-- 2. Tìm họ tên của nhân viên phòng số 5 có tham gia vào đề án “Sản phẩm X” với số giờ làm việc trên 10 giờ
SELECT (NV.HoNV + ' ' + NV.TenNV) AS HoTenNV
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MaNV = PC.MaNV
JOIN DEAN DA ON PC.MaDA = DA.MaDA
WHERE NV.MaPHG = 'P005' AND DA.TenDA = 'San pham X' AND PC.ThoiGian > 10 

-- 3. Tìm họ tên của từng nhân viên và người phụ trách trực tiếp nhân viên đó
SELECT (NV.HoNV + ' ' + NV.TenNV) AS HoTenNV, (NQL.HoNV + ' ' + NQL.TenNV) AS HoTenNQL
FROM NHANVIEN NV LEFT JOIN NHANVIEN NQL ON NV.MaNQL = NQL.MaNV 

-- 4. Tìm họ tên của những nhân viên được “Tung” phụ trách trực tiếp
SELECT (NV.HoNV + ' ' + NV.TenNV) AS HoTenNV
FROM NHANVIEN NV JOIN NHANVIEN NQL ON NV.MaNQL = NQL.MaNV 
WHERE NQL.TenNV = 'Tung'

-- 5. Cho biết các mã đề án có:
-- Nhân viên với họ là ‘Nguyen’ tham gia hoặc,
-- Trưởng phòng chủ trì đề án đó với họ là ‘Nguyen’
(SELECT DA.MaDA 
FROM DEAN DA JOIN PHONGBAN PB ON DA.MaPHG = PB.MaPHG 
JOIN NHANVIEN NV ON PB.TruongPHG = NV.MaNV
WHERE NV.HoNV = 'Nguyen')
UNION
(SELECT DA.MaDA
FROM DEAN DA JOIN PHANCONG PC ON DA.MaDA = PC.MaDA 
JOIN NHANVIEN NV ON PC.MaNV = NV.MaNV
WHERE NV.HoNV = 'Nguyen')

-- 6. Tìm nhân viên có người thân cùng tên và cùng giới tính
SELECT NV.MaNV
FROM NHANVIEN NV JOIN THANNHAN TN ON NV.MaNV = TN.MaNV
WHERE NV.TenNV = TN.TenTN AND NV.Phai = TN.Phai

-- 7. Tìm những nhân viên không có thân nhân nào
SELECT MaNV 
FROM NHANVIEN 
WHERE MaNV NOT IN 
(SELECT NV.MaNV FROM NHANVIEN NV JOIN THANNHAN TN ON NV.MaNV = TN.MaNV)

-- 8. Tìm những nhân viên có lương lớn hơn lương của ít nhất một nhân viên phòng 4
SELECT MaNV 
FROM NHANVIEN WHERE Luong > (SELECT MIN(Luong) FROM NHANVIEN WHERE MaPHG = 'P004')

-- 9. Tìm những nhân viên có lương lớn hơn lương của tất cả nhân viên phòng 4
SELECT MaNV
FROM NHANVIEN WHERE Luong > (SELECT MAX(Luong) FROM NHANVIEN WHERE MaPHG = 'P004')

-- 10. Tìm những trưởng phòng có tối thiểu một thân nhân
SELECT DISTINCT PB.TruongPHG
FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TruongPHG = NV.MaNV
JOIN THANNHAN TN ON NV.MaNV = TN.MaNV

-- 11. Tìm tên các nhân viên được phân công làm tất cả các đồ án
SELECT MaNV
FROM PHANCONG
GROUP BY MaNV
HAVING COUNT(MaDA) = (SELECT COUNT(MaDA) FROM DEAN)

-- 12. Tìm tổng lương, lương cao nhất, lương thấp nhất và lương trung bình của các nhân viên
SELECT SUM(Luong) AS TongLuong, MAX(Luong) AS LuongCaoNhat, MIN(Luong) AS LuongThapNhat, AVG(Luong) AS LuongTB
FROM NHANVIEN

-- 13. Cho biết số lượng nhân viên và lương trung bình của phòng ‘Nghien cuu’
SELECT COUNT(MaNV) AS SoLuongNV, AVG(Luong) AS LuongTB
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MaPHG = PB.MaPHG
WHERE PB.TenPHG = 'Nghien cuu'

-- 14. Cho biết số lượng nhân viên của từng phòng ban. Xuất ra tên phòng và số lượng.
SELECT PB.MaPHG, COUNT(NV.MaNV) AS SoLuongNV
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MaPHG = PB.MaPHG
GROUP BY PB.MaPHG
ORDER BY PB.MaPHG

-- 15. Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng thời gian mà họ tham gia
SELECT NV.MaNV, COUNT(PC.MaDA) AS SoDA, SUM(PC.ThoiGian) AS TongTG
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MaNV = PC.MaNV
JOIN DEAN DA ON PC.MaDA = DA.MaDA
GROUP BY NV.MaNV

-- 16. Cho biết những nhân viên tham gia từ 2 đề án trở lên 
SELECT MaNV
FROM PHANCONG 
GROUP BY MaNV
HAVING COUNT(MaDA) >= 2

-- 17. Cho biết những phòng ban (TENPHG) có lương trung bình của các nhân viên lớn lơn 20000
SELECT PB.TenPHG, AVG(NV.Luong) AS LuongTB
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MaPHG = PB.MaPHG
GROUP BY PB.TenPHG
HAVING AVG(NV.Luong) > 20000

-- 18. Tìm những phòng ban có lương trung bình cao nhất
SELECT TOP 1 PB.TenPHG, AVG(NV.Luong) AS LuongTB
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MaPHG = PB.MaPHG
GROUP BY PB.TenPHG
ORDER BY LuongTB DESC

-- 19. Tìm 3 nhân viên có lương cao nhất
SELECT TOP 3 MaNV, Luong
FROM NHANVIEN
ORDER BY Luong DESC

-- 20. Tìm mã và tên các nhân viên làm việc tại phòng ‘Nghien cuu’
SELECT NV.MaNV, NV.TenNV
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MaPHG = PB.MaPHG
WHERE PB.TenPHG = 'Nghien cuu'

-- 21. Tìm họ tên các nhân viên và tên các đề án nhân viên tham gia nếu có
SELECT (NV.HoNV + ' ' + NV.TenNV) AS HoTenNV, DA.TenDA
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MaNV = PC.MaNV
JOIN DEAN DA ON PC.MaDA = DA.MaDA

-- 22. Cho biết họ tên các nhân viên và tuổi về hưu của họ (nam 60 tuổi, nữ 55 tuổi)


-- 23. Cho biết họ tên các nhân viên và năm về hưu


-- 24. Xóa đi những nhân viên ở phòng ‘Nghien cuu’


-- 25. Với đề án có mã số 10, hãy thay đổi nơi thực hiện đề án thành ‘Vung Tau’ và phòng ban phụ trách là phòng 5
















