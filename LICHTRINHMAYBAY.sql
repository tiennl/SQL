﻿CREATE DATABASE MAYBAY

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

/* Câu 1: Thực hiện yêu cầu sau:
a. Tạo khung nhìn có tên là V_MayBay để thấy được thông tin của tất cả máy bay có tốc
độ tối thiểu lớn hơn 1100km/h và được bắt đầu sử dụng từ ngày 01/01/2014. (1 điểm)
b. Thông qua khung nhìn V_MayBay thực hiện việc cập ngày bắt đầu sử dụng thành
01/31/2014 đối với những máy bay có ngày bắt đầu sử dụng là 02/28/2014. (1 điểm)*/


/* Câu 2: Tạo 2 thủ tục (Stored Procedure):
a. Thủ tục Sp_1: Dùng để xóa thông tin của những phi công có mã phi công được truyền
vào như một tham số của thủ tục. (1 điểm)
b. Thủ tục Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng LICHTRINHBAY (Sp_2
phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung là không trùng khóa
chính và đảm bảo toàn vẹn tham chiếu đến các bảng có liên quan). (1 điểm)*/


/* Câu 3: Viết 2 bẫy sự kiện (trigger) cho bảng LICHTRINHBAY theo yêu cầu sau:
a. Trigger_1: Khi thực hiện thêm một lịch trình bay cho một máy bay bất kỳ thì kiểm
tra dữ liệu nơi đi phải khác nơi đến, nếu không hợp lệ thì hiển thị thông báo "Dữ liệu
nơi đi phải khác nơi đến của cùng một chuyến bay" và quay lui (rollback) giao tác.
Bẫy sự kiện chỉ xử lý 1 bản ghi. (1 điểm)
b. Trigger_2: Khi cập nhập lại thời gian đi (tức là thời gian cất cánh), kiểm tra thời gian
cập nhật có phù hợp hay không (thời gian đi phải nhỏ hơn thời gian đến). Nếu dữ liệu
hợp lệ thì cho phép cập nhật, nếu không hiển thị thông báo "thời gian đi phải nhỏ hơn
thời gian đến ít nhất là 30 phút" và thực hiện quay lui giao tác. (1 điểm)*/


/* Câu 4: Tạo hàm do người dùng định nghĩa (user-defined function) để tính chi phí bảo trì
cho cả năm 2015. Mã máy bay sẽ được truyền vào thông qua tham số đầu vào của hàm. Cụ
thể như sau:
- Nếu tổng số lần bay của máy bay dưới 25 lần, thì kết quả là chi phí bảo trì được trả
5.000.000 trên mỗi tháng trong năm. (1 điểm)
- Nếu tổng số lần bay của máy bay từ 25 lần trở lên, thì kết quả là chi phí bảo trì được
trả 10.000.000 trên mỗi tháng trong năm. (1 điểm)*/


/* Câu 5: Tạo thủ tục Sp_PhiCong tìm những phi công đã từng thực hiện lái một chuyến bay
bất kỳ (nghĩa là có lưu trữ thông tin của phi công trong bảng LICHTRINHBAY) để xóa
thông tin về những phi công đó trong bảng PHICONG và xóa thông tin về những
chuyến bay của những phi công đó (tức là phải xóa những bản ghi trong bảng
LICHTRINHBAY có liên quan). (2 điểm)*/

