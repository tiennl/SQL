USE DAOTAO

SELECT * FROM GIAOVIEN

-- Tạo ra 1 bảng lưu thông tin GV, Tên BM, Lương

SELECT HOTEN, TENBM, LUONG INTO LuongGiaoVien FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

SELECT * FROM LuongGiaoVien

UPDATE GIAOVIEN SET LUONG = 90000
WHERE MAGV = '006'

SELECT * FROM GIAOVIEN

-- View là bảng ảo
-- Cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra sử dụng

-- Tạo ra view TestView từ câu truy vấn
CREATE VIEW TestView AS 
SELECT * FROM GIAOVIEN

SELECT * FROM TestView

UPDATE GIAOVIEN SET LUONG = 90000
WHERE MAGV = '006'

SELECT * FROM TestView

-- Xóa view
DROP VIEW TestView

ALTER VIEW TestView AS 
SELECT HOTEN FROM GIAOVIEN

-- Tạo view có dấu
CREATE VIEW [Giáo dục miễn phí] AS
SELECT * FROM KHOA

SELECT * FROM [Giáo dục miễn phí]











