CREATE DATABASE QUANLYGAOHANG

USE QUANLYGAOHANG

CREATE TABLE nhacungcap
(
	macongty NVARCHAR(10) NOT NULL
	CONSTRAINT pk_nhacungcap
	PRIMARY KEY(macongty),
	tencongty NVARCHAR(40) NOT NULL,
	tengiaodich NVARCHAR(30) NULL,
	diachi NVARCHAR(60) NULL,
	dienthoai NVARCHAR(20) NULL,
	fax NVARCHAR(20) NULL,
	email NVARCHAR(50) NULL
)

CREATE TABLE loaihang
(
	maloaihang INT NOT NULL
	CONSTRAINT pk_loaihang
	PRIMARY KEY(maloaihang),
	tenloaihang NVARCHAR(15) NOT NULL
)

CREATE TABLE mathang
(
	mahang NVARCHAR(10) NOT NULL
	CONSTRAINT pk_mathang
	PRIMARY KEY(mahang),
	tenhang NVARCHAR(50) NOT NULL,
	macongty NVARCHAR(10) NULL ,
	maloaihang INT NULL ,
	soluong INT NULL,
	donvitinh NVARCHAR(20) NULL ,
	giahang MONEY NULL
)

CREATE TABLE nhanvien
(
	manhanvien NVARCHAR(10) NOT NULL
	CONSTRAINT pk_nhanvien
	PRIMARY KEY(manhanvien),
	ho NVARCHAR(20) NOT NULL ,
	ten NVARCHAR(10) NOT NULL ,
	ngaysinh DATETIME NULL ,
	ngaylamviec DATETIME NULL ,
	diachi NVARCHAR(50) NULL ,
	dienthoai NVARCHAR(15) NULL ,
	luongcoban MONEY NULL ,
	phucap MONEY NULL
)

CREATE TABLE khachhang
(
	makhachhang NVARCHAR(10) NOT NULL
	CONSTRAINT pk_khachhang
	PRIMARY KEY(makhachhang),
	tencongty NVARCHAR(50) NOT NULL ,
	tengiaodich NVARCHAR(30) NOT NULL ,
	diachi NVARCHAR(50) NULL ,
	email NVARCHAR(30) NULL ,
	dienthoai NVARCHAR(15) NULL ,
	fax NVARCHAR(15) NULL
)

CREATE TABLE dondathang
(
	sohoadon INT NOT NULL
	CONSTRAINT pk_dondathang
	PRIMARY KEY(sohoadon),
	makhachhang NVARCHAR(10) NULL ,
	manhanvien NVARCHAR(10) NULL ,
	ngaydathang SMALLDATETIME NULL ,
	ngaygiaohang SMALLDATETIME NULL ,
	ngaychuyenhang SMALLDATETIME NULL ,
	noigiaohang NVARCHAR(50) NULL
)

CREATE TABLE chitietdathang
(
	sohoadon INT NOT NULL ,
	mahang NVARCHAR(10) NOT NULL ,
	giaban MONEY NOT NULL ,
	soluong SMALLINT NOT NULL ,
	mucgiamgia REAL NOT NULL,
	CONSTRAINT pk_chitietdathang
	PRIMARY KEY(sohoadon,mahang)
)

ALTER TABLE mathang
ADD
CONSTRAINT fk_mathang_loaihang
FOREIGN KEY (maloaihang)
REFERENCES loaihang(maloaihang)
ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT fk_mathang_nhacungcap
FOREIGN KEY (macongty)
REFERENCES nhacungcap(macongty)
ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE dondathang
ADD
CONSTRAINT fk_dondathang_khachhang
FOREIGN KEY (makhachhang)
REFERENCES khachhang(makhachhang)
ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT fk_dondathang_nhanvien
FOREIGN KEY (manhanvien)
REFERENCES nhanvien(manhanvien)
ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE chitietdathang
ADD
CONSTRAINT fk_chitiet_dondathang
FOREIGN KEY (sohoadon)
REFERENCES dondathang(sohoadon)
ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT fk_chitiet_mathang
FOREIGN KEY (mahang)
REFERENCES mathang(mahang)
ON DELETE CASCADE ON UPDATE CASCADE

-- 5.1 Tạo thủ tục lưu trữ để thông qua thủ tục này có thể bổ sung thêm một bản ghi mới
-- cho bảng MATHANG (thủ tục phải thực hiện kiểm tra tính hợp lệ của dữ liệu cần
-- bổ sung: không trùng khoá chính và đảm bảo toàn vẹn tham chiếu)
CREATE PROCEDURE sp_insert_mathang(
		@mahang NVARCHAR(10),
		@tenhang NVARCHAR(50),
		@macongty NVARCHAR(10) = NULL,
		@maloaihang INT = NULL,
		@soluong INT = 0,
		@donvitinh NVARCHAR(20) = NULL,
		@giahang money = 0)
AS
	IF NOT EXISTS(SELECT mahang FROM mathang WHERE mahang=@mahang)
		IF (@macongty IS NULL OR EXISTS(
			SELECT macongty
			FROM nhacungcap
			WHERE macongty=@macongty))
		AND
			(@maloaihang IS NULL OR EXISTS(
			SELECT maloaihang 
			FROM loaihang
			WHERE maloaihang=@maloaihang))
	INSERT INTO mathang
	VALUES (@mahang,@tenhang,
			@macongty,@maloaihang,
			@soluong,@donvitinh,@giahang)

-- 5.2 Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một
-- mặt hàng có mã bất kỳ (mã mặt hàng cần thống kê là tham số của thủ tục)
CREATE PROCEDURE sp_thongkebanhang(@mahang NVARCHAR(10))
AS
	SELECT mathang.mahang, tenhang, SUM(chitietdathang.soluong) AS tongsoluong
	FROM mathang LEFT OUTER JOIN chitietdathang ON mathang.mahang = chitietdathang.mahang
	WHERE mathang.mahang = @mahang
	GROUP BY mathang.mahang, tenhang

