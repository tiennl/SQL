CREATE DATABASE TRIGGER_EXAMPLE

USE TRIGGER_EXAMPLE

CREATE TABLE mathang
(
	mahang NVARCHAR(5) PRIMARY KEY,
	tenhang NVARCHAR(50) NOT NULL, 
	soluong INT
)

CREATE TABLE nhatkybanhang
(
	stt INT IDENTITY PRIMARY KEY,
	ngay DATETIME,
	nguoimua NVARCHAR(30),
	mahang NVARCHAR(5) 
	FOREIGN KEY REFERENCES mathang(mahang),
	soluong INT, 
	giaban MONEY 
)

INSERT INTO mathang (mahang, tenhang, soluong) VALUES
('H1', N'Xà phòng', 30),
('H2', N'Kem đánh răng', 45)

INSERT INTO nhatkybanhang (ngay, nguoimua, mahang, soluong, giaban) VALUES
('2004-01-01', 'Ha', 'H1', 10, 10000.0000),
('2004-02-02', 'Phong', 'H2', 20, 5000.0000),
('2004-03-03', 'Thuy', 'H2', 30, 6000.0000)

-- VD 5.12
CREATE TRIGGER trg_nhatkybanhang_insert
ON nhatkybanhang
FOR INSERT
AS
UPDATE mathang
	SET mathang.soluong = mathang.soluong - inserted.soluong
	FROM mathang INNER JOIN inserted ON mathang.mahang = inserted.mahang


INSERT INTO nhatkybanhang (ngay, nguoimua, mahang, soluong, giaban) VALUES
('2004-05-05', 'Tran Ngoc Thanh', 'H1', 10, 5200)

-- VD 5.13
CREATE TRIGGER trg_nhatkybanhang_update_soluong
ON nhatkybanhang
FOR UPDATE
AS
IF UPDATE(soluong)
	UPDATE mathang
	SET mathang.soluong = mathang.soluong - (inserted.soluong - deleted.soluong)
	FROM (deleted INNER JOIN inserted ON deleted.stt = inserted.stt) 
	INNER JOIN mathang ON mathang.mahang = deleted.mahang


UPDATE nhatkybanhang SET soluong = soluong + 20 WHERE stt = 1

UPDATE nhatkybanhang SET nguoimua = N'Mai Hữu Toàn' WHERE stt = 3

-- VD 5.14
CREATE TABLE R
(
	A INT,
	B INT,
	C INT
)

CREATE TRIGGER trg_R_test
ON R
FOR UPDATE
AS
	IF UPDATE(A)
	Print 'A updated'
	IF UPDATE(C)
	Print 'C updated'

INSERT INTO R VALUES 
(1, 2, 3),
(5, 9, 2),
(5, 3, 2)

UPDATE R SET A = 100 WHERE A = 1

UPDATE R SET C = 100 WHERE C = 2

UPDATE R SET B = 100 WHERE B = 3

-- VD 5.15
CREATE TRIGGER trg_mathang_delete
ON mathang
FOR DELETE
AS
	ROLLBACK TRANSACTION

DELETE FROM mathang WHERE mahang = 'H1'

-- VD 5.16
CREATE TRIGGER trg_nhatkybanhang_insert_if_update
ON NHATKYBANHANG
FOR INSERT
AS
	DECLARE @sl_co int 
	DECLARE @sl_ban int
	DECLARE @mahang nvarchar(5)
	SELECT @mahang = mahang, @sl_ban = soluong
	FROM inserted
	SELECT @sl_co = soluong
	FROM mathang where mahang = @mahang
	IF @sl_co < @sl_ban
		ROLLBACK TRANSACTION
	ELSE
		UPDATE mathang
		SET soluong = soluong - @sl_ban
		WHERE mahang = @mahang

UPDATE nhatkybanhang SET soluong = soluong + 20 WHERE stt = 1

-- VD 5.17
CREATE TRIGGER trg_nhatkybanhang_update_soluong_if_update
ON nhatkybanhang
FOR UPDATE
AS
IF UPDATE(soluong)
	UPDATE mathang
	SET mathang.soluong = mathang.soluong - (inserted.soluong - deleted.soluong)
	FROM (deleted INNER JOIN inserted ON deleted.stt = inserted.stt) 
	INNER JOIN mathang ON mathang.mahang = deleted.mahang

UPDATE nhatkybanhang SET soluong = soluong + 10 WHERE stt = 1

UPDATE nhatkybanhang SET soluong = soluong + 5 WHERE mahang = 'H2'

