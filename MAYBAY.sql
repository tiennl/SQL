CREATE DATABASE MAYBAY

USE MAYBAY

CREATE TABLE LOAIMAYBAY
(
	MaLoai VARCHAR(10) NOT NULL PRIMARY KEY,
	LoaiMB VARCHAR(50),
	DongCo VARCHAR(50),
	TocDoToiThieu VARCHAR(20),
	TocDoToiDa VARCHAR(20)
)

CREATE TABLE MAYBAY
(
	SoHieuMB VARCHAR(10) NOT NULL PRIMARY KEY,
	MaLoai VARCHAR(10) NOT NULL,
	NgayBatDauSD DATE

	CONSTRAINT FK_MB_LMB
	FOREIGN KEY (MaLoai) REFERENCES LOAIMAYBAY(MaLoai)
)

CREATE TABLE PHICONG
(
	MaPC VARCHAR(10) NOT NULL PRIMARY KEY,
	TenPC VARCHAR(50),
	TrinhDo VARCHAR(50),
	NamKN INT
)

CREATE TABLE LICHTRINHMAYBAY
(
	MaLT VARCHAR(10) NOT NULL,
	SoHieuMB VARCHAR(10) NOT NULL,
	MaPC VARCHAR(10) NOT NULL,
	NoiDi VARCHAR(50),
	NoiDen VARCHAR(50),
	ThoiGianDi DATETIME,
	ThoiGianDen DATETIME

	CONSTRAINT PK_LTB
	PRIMARY KEY (MaLT, SoHieuMB, MaPC),
	CONSTRAINT FK_LT_MB
	FOREIGN KEY (SoHieuMB) REFERENCES MAYBAY(SoHieuMB),
	CONSTRAINT FK_LT_PC
	FOREIGN KEY (MaPC) REFERENCES PHICONG(MaPC)
)

INSERT INTO LOAIMAYBAY VALUES
('L01', 'Boeing 747', 'tuoc bin canh quat', '1000km/h', '3000km/h'),
('L02', 'A321', 'tuoc bin phan luc', '1500km/h', '3200km/h'),
('L03', 'Boeing 737', 'tuoc bin roc ket', '1100km/h', '2500km/h')

INSERT INTO MAYBAY VALUES
('VN01', 'L01', '2015-05-29'),
('JS02', 'L01', '2015-05-21'),
('AS01', 'L02', '2015-05-22')

INSERT INTO PHICONG VALUES
('PC01', 'Tran Dinh Nam', 'Co Pho', 3),
('PC02', 'jonh henry', 'Co Truong', 8)

INSERT INTO LICHTRINHMAYBAY VALUES 
('LT001', 'VN01', 'PC02', 'Ha Noi', 'Da Nang', '2015-05-20 14:00', '2015-05-20 16:00'),
('LT002', 'AS01', 'PC01', 'Da Nang', 'Thai Lan', '2015-04-13 08:00', '2015-04-13 13:00')

--Câu 1: Liệt kê thông tin toàn bộ máy bay.
SELECT * FROM MAYBAY

--Câu 2: Xoá toàn bộ máy bay sử dụng động cơ là 'tuoc bin rocket'.
DELETE FROM MAYBAY WHERE MaLoai IN
(SELECT MaLoai FROM LOAIMAYBAY WHERE DongCo = 'tuoc bin roc ket')

--Câu 3: Cập nhật giá trị của trường NamKN trong bảng PHICONG thành 5 nếu trường NamKN đang có giá trị là 3.
UPDATE PHICONG SET NamKN = 5 WHERE NamKN = 3 

--Câu 4: Liệt kê thông tin của những máy bay thuộc loại 'Boeing 747' được bắt đầu sử dụng từ
--ngày 01/01/2014 và những máy bay thuộc loại 'A321' được bắt đầu sử dụng trước ngày 12/31/2014.


--Câu 5: Liệt kê những phi công có tên bắt đầu là ký tự 'N' và có độ dài là 7 ký tự.


--Câu 6: Liệt kê toàn bộ máy bay, sắp xếp giảm dần theo MaLoai và tăng dần theo NgayBatDauSD.


--Câu 7: Đếm số lần bay tương ứng theo từng phi công, chỉ đếm các lần bay được thực hiện bay trong năm 2014.


--Câu 8: Liệt kê tên của toàn bộ phi công (tên nào giống nhau thì chỉ liệt kê một lần).


--Câu 9: Liệt kê SoHieu, MaLoai, TenPC, NoiDi, NoiDen, ThoiGianDi, ThoiGianDen (của tất cả các lần bay của các máy bay).


--Câu 10: Liệt kê SoHieu, MaLoai, TenPC, NoiDi, NoiDen, ThoiGianDi, ThoiGianDen của tất
--cả các lần bay của máy bay (Liệt kê cả những máy bay chưa được bay lần nào).


--Câu 11: Liệt kê SoHieu, MaLoai của những máy bay đã thực hiện bay với điểm xuất phát từ sân bay 'Ha noi' hoặc thuộc loại máy bay là 'Boeing 747'.


--Câu 12: Liệt kê SoHieu, MaLoai của những máy bay chưa từng thực hiện bay lần nào.


--Câu 13: Liệt kê SoHieu, MaLoai của những máy bay đã từng thực hiện bay với điểm xuất
--phát từ sân bay 'Ha noi' và chưa từng thực hiện bay lần nào với điểm xuất phát là sân bay 'Thanh pho Ho Chi Minh'.


--Câu 14: Liệt kê SoHieu, MaLoai, TenPC, NoiDi, NoiDen, ThoiGianDi, ThoiGianDen,
--TenPC của những máy bay thuộc loại 'A321' và chỉ mới thực hiện bay một lần duy nhất. Kết quả liệt kê sắp xếp tăng dần theo ThoiGianDi.