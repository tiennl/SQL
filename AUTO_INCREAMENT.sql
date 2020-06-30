USE DAOTAO

CREATE TABLE TestAuto
(
	ID INT PRIMARY KEY IDENTITY, -- tự tăng trường này, phải là số, mặc định bắt đầu từ 1
	Name NVARCHAR(100)
)

INSERT TestAuto(Name) VALUES (N'0')
INSERT TestAuto(Name) VALUES (N'0')
INSERT TestAuto(Name) VALUES (N'0')
INSERT TestAuto(Name) VALUES (N'0')
INSERT TestAuto(Name) VALUES (N'0')

SELECT * FROM TestAuto

DROP TABLE TestAuto



CREATE TABLE TestAuto2
(
	ID INT PRIMARY KEY IDENTITY(5,10), --tự tăng bắt đầu từ 5, mỗi lần tăng 10 đvị
	Name NVARCHAR(100)
)


INSERT TestAuto2(Name) VALUES (N'0')
INSERT TestAuto2(Name) VALUES (N'0')
INSERT TestAuto2(Name) VALUES (N'0')
INSERT TestAuto2(Name) VALUES (N'0')
INSERT TestAuto2(Name) VALUES (N'0')

SELECT * FROM TestAuto2


