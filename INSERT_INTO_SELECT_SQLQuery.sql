USE DAOTAO

-- insert into select -> cop dữ liệu vào bảng đã tồn tại

SELECT * INTO CLoneGV
FROM GIAOVIEN
WHERE 1=0

INSERT INTO CLoneGV
SELECT * FROM GIAOVIEN

SELECT * FROM CLoneGV