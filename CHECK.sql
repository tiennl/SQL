USE DAOTAO

-- Có thể tạo check y như tạo khá chính
CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT CHECK(Luong > 3000 AND Luong < 9000)
)

INSERT TestCheck (Luong) VALUES (3001)

-- cách 2
CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT,
	CHECK(Luong > 3000 AND Luong < 9000)
)


-- cách 3
CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT,
	CONSTRAINT CK_Luong CHECK(Luong > 3000 AND Luong < 9000)
)


-- cách 4
CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT
)

ALTER TABLE TestCheck ADD CONSTRAINT CK_Luong
CHECK(Luong > 3000 AND Luong < 9000)









