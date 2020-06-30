CREATE DATABASE Primary_Foreign
GO

USE Primary_Foreign
GO

CREATE TABLE BoMon
(
	MaBM CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100) DEFAULT N'Ten Bo Mon'
)
GO

CREATE TABLE Lop 
(
	MaLop CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Ten Lop'

	PRIMARY KEY (MaLop)
)
GO

-- Điều kiện để tạo khóa ngoại
-- Tham chiếu tới khóa chính,
-- unique, not null,
-- cùng kiểu dữ liệu,
-- cùng số lượng trường có sắp xếp

CREATE TABLE GiaoVien
(
		MaGV CHAR(10) NOT NULL,
		Name NVARCHAR(100) DEFAULT N'Ten GV',
		DiaChi NVARCHAR(100) DEFAULT N'Dia Chi GV',
		NgaySinh DATE,
		Sex BIT,
		MABM CHAR(10),

		-- Tạo khóa ngoại ngay khi tạo bảng
		FOREIGN KEY(MaBM) REFERENCES dbo.BOMON(MaBM) 
)
GO

ALTER TABLE dbo.GIAOVIEN ADD PRIMARY KEY (MaGV)

CREATE TABLE HocSinh
(
	MaHS CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100),
	MaLop CHAR(10)
)
GO

-- Tạo khóa ngoại sau khi tạo bảng
ALTER TABLE dbo.HocSinh 
ADD CONSTRAINT FK_HS FOREIGN KEY (MaLop) 
REFERENCES dbo.Lop(MaLop)

-- hủy khóa
-- ALTER TABLE dbo.HocSinh DROP CONSTRAINT FK_HS

INSERT INTO dbo.BoMon (MaBM, Name)
VALUES ('BM01', N'Bo Mon 1')
INSERT INTO dbo.BoMon (MaBM, Name)
VALUES ('BM02', N'Bo Mon 2')
INSERT INTO dbo.BoMon (MaBM, Name)
VALUES ('BM03', N'Bo Mon 3')

INSERT dbo.GiaoVien (MaGV, Name, DiaChi, NgaySinh, Sex, MABM)
VALUES ('GV01', N'GV 1', N'DC 1', GETDATE(), 1, 'BM03')
INSERT dbo.GiaoVien (MaGV, Name, DiaChi, NgaySinh, Sex, MABM)
VALUES ('GV02', N'GV 1', N'DC 1', GETDATE(), 1, 'BM01')