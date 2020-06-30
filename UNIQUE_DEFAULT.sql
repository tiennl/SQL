-- Unique: duy nhất trong toàn bộ bảng, trường nào có unique thì ko thể có 2 gtri trùng nhau
-- Default: gtri mặc định nếu ko có gtri

CREATE TABLE TestPrimaryKey1
(
	ID INT UNIQUE NOT NULL,
	Name NVARCHAR(100) DEFAULT N'ABC'
)
GO

DELETE dbo.TestPrimaryKey1

INSERT dbo.TestPrimaryKey1(ID)
VALUES (0)
INSERT dbo.TestPrimaryKey1(ID)
VALUES (1)
INSERT dbo.TestPrimaryKey1(ID)
VALUES (2)
-- Khi đã tạo bảng. Muốn sửa cột thành primary key
ALTER TABLE dbo.TestPrimaryKey1 ADD PRIMARY KEY (ID)

-- Tạo PK trong bảng ko phải ngay khi khai báo
CREATE TABLE TestPrimaryKey2
(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'ABC'
	PRIMARY KEY (ID)
)
GO

-- Tạo PK ngay trong bảng mà đặt tên cho key đó
CREATE TABLE TestPrimaryKey3
(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'ABC'

	CONSTRAINT PK_Test3 -- sau này xóa key cho dễ
	PRIMARY KEY (ID)
)
GO

--Tạo PK sau khi tạo bảng và đặt tên cho key đó
CREATE TABLE TestPrimaryKey4
(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'ABC'
)
GO

ALTER TABLE dbo.TestPrimaryKey4 
ADD CONSTRAINT PK_Test4
PRIMARY KEY (ID)

-- Khóa chính có 2 trường
CREATE TABLE TestPrimaryKey5
(
	ID1 INT NOT NULL,
	ID2 INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'ABC'

	PRIMARY KEY (ID1, ID2)
)
GO



