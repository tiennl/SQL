CREATE DATABASE THUCTAP

USE THUCTAP

CREATE TABLE SV
(
	MSV VARCHAR(20) NOT NULL PRIMARY KEY,
	HT VARCHAR(50),
	NS INT,
	QUE VARCHAR(20),
	HL VARCHAR(20)
)

CREATE TABLE DT
(
	MDT VARCHAR(20) NOT NULL PRIMARY KEY,
	TDT VARCHAR(50),
	CN VARCHAR(50),
	KP FLOAT
)

CREATE TABLE SD
(
	MSV VARCHAR(20) NOT NULL,
	MDT VARCHAR(20) NOT NULL,
	NTT VARCHAR(20),
	KM FLOAT,
	KQ FLOAT
	CONSTRAINT PK_SV_DT
	PRIMARY KEY (MSV, MDT),
	CONSTRAINT FK_SV
	FOREIGN KEY (MSV) REFERENCES SV(MSV),
	CONSTRAINT FK_DT
	FOREIGN KEY (MDT) REFERENCES DT(MDT)
)

INSERT INTO SV VALUES
('SV001', 'Nguyen Van Hung', 2000, 'Quang Nam', 'Gioi'),
('SV002', 'Nguyen Van Chien', 1999, 'Quang Ngai', 'Kha'),
('SV003', 'Nguyen Thi Trang', 2000, 'Hue', 'Gioi'),
('SV004', 'Nguyen Van A', 2000, 'Quang Nam', 'Gioi'),
('SV005', 'Nguyen Van B', 2000, 'Da Nang', 'Kha'),
('SV006', 'Nguyen Van C', 2000, 'Quang Nam', 'Gioi'),
('SV007', 'Nguyen Van D', 1998, 'Hue', 'Trung Binh'),
('SV008', 'Nguyen Van E', 2000, 'Quang Tri', 'Gioi'),
('SV009', 'Nguyen Van F', 1999, 'Hue', 'Trung Binh'),
('SV010', 'Nguyen Van G', 2000, 'Quang Nam', 'Gioi'),
('SV011', 'Nguyen Van HH', 2000, 'Quang Nam', 'Gioi'),
('SV012', 'Nguyen Van TT', 2000, 'Quang Nam', 'Kha')

INSERT INTO DT VALUES
('DT001', 'HTTT quan ly trong cac truong Dai hoc', 'Le Thanh Cong', 2000000),
('DT002', 'Thuat toan tim duong di ngan nhat', 'Pham Anh Phuong', 4000000),
('DT003', 'Thu vien JSTL trong java', 'Nguyen Van Tuan', 6000000),
('DT004', 'Quan li Khach san', 'Nguyen Dinh Lau', 1000000),
('DT005', 'Xay dung web ban hang online', 'Doan Duy Binh', 1000000),
('DT006', 'Bitset trong C++', 'Pham Anh Phuong', 7000000),
('DT007', 'Thuat toan tim kiem nhi phan', 'Pham Anh Phuong', 500000),
('DT008', 'Servlet trong java', 'Le Thanh Cong', 8000000),
('DT009', 'Phan mem chuyen giong noi thanh van ban', 'Doan Duy Binh', 2000000),
('DT010', 'Thuat toan quy hoach dong', 'Pham Anh Phuong', 6000000),
('DT011', 'Tim hieu ve BigData', 'Le Thanh Cong', 5000000),
('DT012', 'Thuat toan sap xep', 'Pham Anh Phuong', 2000000)

INSERT INTO SD VALUES
('SV001', 'DT001', 'Da Nang', 10, 8),
('SV002', 'DT003', 'Quang Nam', 50, 7),
('SV003', 'DT005', 'Da Nang', 15, 9),
('SV004', 'DT007', 'Quang Ngai', 100, 4),
('SV005', 'DT009', 'Hue', 80, 8.5),
('SV006', 'DT002', 'Hue', 80, 7.5),
('SV007', 'DT004', 'Quang Nam', 10, 8),
('SV008', 'DT006', 'Quang Tri', 120, 9),
('SV009', 'DT008', 'Quang Ngai', 85, 4),
('SV010', 'DT010', 'Da Nang', 5, 7),
('SV003', 'DT004', 'Quang Nam', 10, 8),
('SV005', 'DT006', 'Quang Tri', 120, 9),
('SV002', 'DT008', 'Quang Ngai', 85, 4),
('SV005', 'DT010', 'Da Nang', 5, 7)

-- 3.1. In danh sách gồm Mã SV, Tên SV, Mã ĐT, Tên ĐT . Những SV không thực hiện đề tài cũng hiển thị ra
SELECT SV.MSV, SV.HT, DT.MDT, DT.TDT
FROM SV LEFT JOIN SD ON SV.MSV = SD.MSV LEFT JOIN DT ON SD.MDT = DT.MDT

-- 3.2. Thống kê số đề tài của mỗi sinh viên
SELECT SV.MSV, SV.HT, COUNT(SD.MDT) AS SoDT
FROM SV LEFT JOIN SD ON SV.MSV = SD.MSV 
GROUP BY SV.MSV, SV.HT

-- 3.3. Cho biết những đề tài mà không có sinh viên nào tham gia
SELECT * FROM DT WHERE MDT NOT IN (SELECT MDT FROM SD)