CREATE DATABASE QUANLYDIEM

USE QUANLYDIEM

CREATE TABLE khoa
(
	makhoa NVARCHAR(5) NOT NULL
	CONSTRAINT pk_khoa PRIMARY KEY,
	tenkhoa NVARCHAR(50) NOT NULL ,
	dienthoai NVARCHAR(15) NULL
)

CREATE TABLE lop
(
	malop NVARCHAR(10) NOT NULL
	CONSTRAINT pk_lop PRIMARY KEY,
	tenlop NVARCHAR(30) NULL ,
	khoa SMALLINT NULL ,
	hedaotao NVARCHAR(25) NULL ,
	namnhaphoc INT NULL ,
	siso INT NULL ,
	makhoa NVARCHAR(5) NULL
)

CREATE TABLE sinhvien
(
	masv NVARCHAR(10) NOT NULL
	CONSTRAINT pk_sinhvien PRIMARY KEY,
	hodem NVARCHAR(25) NOT NULL ,
	ten NVARCHAR(10) NOT NULL ,
	ngaysinh SMALLDATETIME NULL ,
	gioitinh BIT NULL ,
	noisinh NVARCHAR(100) NULL ,
	malop NVARCHAR(10) NULL
)

CREATE TABLE monhoc
(
	mamonhoc NVARCHAR(10) NOT NULL
	CONSTRAINT pk_monhoc PRIMARY KEY,
	tenmonhoc NVARCHAR(50) NOT NULL ,
	sodvht SMALLINT NOT NULL
)

CREATE TABLE diemthi
(
	mamonhoc NVARCHAR(10) NOT NULL ,
	masv NVARCHAR(10) NOT NULL ,
	diemlan1 NUMERIC(5, 2) NULL ,
	diemlan2 NUMERIC(5, 2) NULL,
	CONSTRAINT pk_diemthi PRIMARY KEY(mamonhoc,masv)
)

ALTER TABLE lop
ADD
CONSTRAINT fk_lop_khoa
FOREIGN KEY(makhoa)
REFERENCES khoa(makhoa)
ON DELETE CASCADE
ON UPDATE CASCADE

ALTER TABLE sinhvien
ADD
CONSTRAINT fk_sinhvien_lop
FOREIGN KEY (malop)
REFERENCES lop(malop)
ON DELETE CASCADE
ON UPDATE CASCADE

ALTER TABLE diemthi
ADD
CONSTRAINT fk_diemthi_monhoc
FOREIGN KEY (mamonhoc)
REFERENCES monhoc(mamonhoc)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_diemthi_sinhvien
FOREIGN KEY (masv)
REFERENCES sinhvien(masv)
ON DELETE CASCADE
ON UPDATE CASCADE

ALTER TABLE monhoc
ADD
CONSTRAINT chk_monhoc_sodht
CHECK(sodvht>0 and sodvht<=5)
ALTER TABLE diemthi
ADD
CONSTRAINT chk_diemthi_diemlan1
CHECK (diemlan1>=0 and diemlan1<=10),
CONSTRAINT chk_diemthi_diemlan2
CHECK (diemlan2>=0 and diemlan2<=10)

INSERT INTO khoa VALUES ('K001', 'Tin hoc', 0123456789)

INSERT INTO lop VALUES ('C24102', '18CNTT', 18, 'Dai hoc chinh quy', 2018, 60, 'K001')

INSERT INTO sinhvien VALUES ('SV01', 'Minh', 'Thu', '2000-01-01', 1, 'Da Nang', 'C24102')

SELECT * FROM monhoc

SELECT * FROM diemthi

SELECT * FROM lop

SELECT * FROM sinhvien

SELECT * FROM khoa

-- 5.1
CREATE PROC sp_LenDanhSachDiem(
		@mamonhoc NVARCHAR(10),
		@tenmonhoc NVARCHAR(50),
		@sodvht SMALLINT,
		@malop NVARCHAR(10))
AS
	BEGIN
		INSERT INTO monhoc
		VALUES(@mamonhoc,@tenmonhoc,@sodvht)

		INSERT INTO diemthi(mamonhoc,masv)
		SELECT @mamonhoc,masv
		FROM sinhvien
		WHERE malop=@malop
	END

						-----
sp_LenDanhSachDiem 'TI-005','Cơ sở dữ liệu',5,'C24102'

-- 5.2
sp_LenDanhSachDiem	@malop='C24102',
					@tenmonhoc='Cơ sở dữ liệu',
					@mamonhoc='TI-005',
					@sodvht=5

-- 5.3
CREATE PROCEDURE sp_Vidu(
		@malop1 NVARCHAR(10),
		@malop2 NVARCHAR(10))
AS
	DECLARE @tenlop1 NVARCHAR(30)
	DECLARE @namnhaphoc1 INT
	DECLARE @tenlop2 NVARCHAR(30)
	DECLARE @namnhaphoc2 INT

	SELECT	@tenlop1=tenlop,
			@namnhaphoc1=namnhaphoc
	FROM lop WHERE malop=@malop1

	SELECT	@tenlop2=tenlop,
			@namnhaphoc2=namnhaphoc
	FROM lop WHERE malop=@malop2

	PRINT @tenlop1+' nhap hoc nam '+str(@namnhaphoc1)
	print @tenlop2+' nhap hoc nam '+str(@namnhaphoc2)

	IF @namnhaphoc1=@namnhaphoc2
		PRINT 'Hai lớp nhập học cùng năm'
	ELSE
		PRINT 'Hai lớp nhập học khác năm'

-- 5.4
CREATE PROCEDURE sp_Conghaiso(@a INT,@b INT, @c INT)
AS
	SELECT @c=@a+@b

	------
DECLARE @tong INT
SELECT @tong=0
EXECUTE sp_Conghaiso 100,200,@tong
SELECT @tong

-- 5.5
CREATE PROCEDURE sp_ConghaisoVd55(
		@a INT,
		@b INT,
		@c INT OUTPUT)
AS
	SELECT @c=@a+@b

-----
DECLARE @tong INT
SELECT @tong=0
EXECUTE sp_ConghaisoVd55 100,200,@tong OUTPUT
SELECT @tong




