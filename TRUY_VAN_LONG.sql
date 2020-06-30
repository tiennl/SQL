USE DAOTAO

-- Kiểm tra xem GV001 có phải là GV quản lí chuyên môn hay ko
-- Lấy ra dsach các mã gv quản lí chuyên môn, ktra mã gv tồn tại trong ds đó
SELECT * FROM GIAOVIEN
WHERE MAGV = '001'
/* 001 tồn tại trong ds */ 
AND MAGV IN
(
SELECT GVQLCM FROM GIAOVIEN
)

-- truy vấn lồng trong from
SELECT * FROM GIAOVIEN, (SELECT * FROM DETAI) AS DT

-- 1. Xuất ra dsach GV tgia nhiều hơn 1 đề tài
-- Lấy ra all thông tin của GV khi mà sluong đề tài GV đó tgia > 1
SELECT * FROM GIAOVIEN AS GV
WHERE 1 < 
(
	SELECT COUNT(*) FROM THAMGIADT
	WHERE MAGV = GV.MAGV
)
 
-- 2. Xuất ra thông tin của khoa mà có nhiều hơn 2 GV
-- Lấy được ds bộ môn nằm trong khoa hiện tại

SELECT * FROM KHOA AS K
WHERE 2 < 
(
	SELECT COUNT(*) FROM BOMON AS BM, GIAOVIEN AS GV
	WHERE BM.MAKHOA = K.MAKHOA
	AND BM.MABM = GV.MABM
)

SELECT * FROM KHOA AS K, BOMON AS BM, GIAOVIEN AS GV
WHERE BM.MAKHOA = K.MAKHOA
AND BM.MABM = GV.MABM


-- sx giảm dần
SELECT MAGV FROM GIAOVIEN
ORDER BY MAGV DESC

-- sx tăng dần
SELECT MAGV FROM GIAOVIEN
ORDER BY MAGV ASC

SELECT TOP(5) * FROM GIAOVIEN

/*
Bài tập
1. Xuất ra thông tin GV có hơn 2 người thân
2. Xuất ra ds các GV lớn tuổi hơn ít nhất 5 GV trong trường
-- Lấy ra ds (MaGV, Tuoi) AS GVT
-- sắp xếp giảm dần -> order by desc
-- lấy ra ds GVT2 với sl phần tử = COUNT(*)/2
-- ktra mã gv tồn tại trong GVT2 là dúng
*/







