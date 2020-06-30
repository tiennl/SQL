-- Lưu ý. Chạy script Query trước khi chạy thử script này
USE DAOTAO 
GO

-- Cấu trúc truy vấn
SELECT * FROM BOMON -- lấy hết dữ liệu trong bảng BOMON

-- Lấy mã đề tài + tên đề tài trong bảng bộ môn
SELECT MABM, TENBM FROM BOMON

-- Đổi tên cột hiển thị
SELECT MABM AS '1', TENBM AS '2' FROM BOMON

-- Xuất ra mã gvien + tên bộ môn gv đó dạy
SELECT MAGV, HOTEN, TENBM FROM GIAOVIEN, BOMON 
-- hoặc
SELECT GV.MAGV, GV.HOTEN, BM.TENBM FROM GIAOVIEN AS GV, BOMON AS BM 

-- BÀI TẬP:
-- 1. Truy xuất thông tin của bảng Tham gia đề tài
SELECT * FROM THAMGIADT

-- 2. Lấy ra Mã khoa và tên khoa tương ứng
SELECT MAKHOA, TENKHOA FROM KHOA

-- 3. Lấy ra Mã GV, tên GV, họ tên người thân tương ứng
SELECT GV.MAGV, GV.HOTEN, NT.TEN FROM GIAOVIEN AS GV, NGUOITHAN AS NT

-- 4. Lấy ra Mã GV, tên GV, Tên khoa của gv đó làm việc. gy: Bộ môn nằm trong khoa
SELECT GV.MAGV, GV.HOTEN, K.TENKHOA FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K

-- Câu 3 lọc dữ liệu ko cho trùng
SELECT GV.MAGV, HOTEN, NT.TEN FROM GIAOVIEN AS GV, NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV

-- Lấy ra gv lương > 2000
SELECT * FROM GIAOVIEN 
WHERE LUONG > 2000

-- Lấy ra gv là nữ và lương > 2000
SELECT * FROM GIAOVIEN 
WHERE PHAI = N'Nữ' AND LUONG > 2000  

-- Lấy ra gv > 40 tuổi
-- YEAR -> lấy ra năm của ngày
-- GETDATE -> ngày hiện tại

SELECT * FROM GIAOVIEN 
WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 40

-- Lấy ra họ tên gv, năm sinh, tuổi gv < 40
SELECT HOTEN, NGSINH, YEAR(GETDATE()) - YEAR(NGSINH) FROM GIAOVIEN 
WHERE YEAR(GETDATE()) - YEAR(NGSINH) < 40

-- Lấy ra Mã GV, tên GV, Tên khoa của gv đó làm việc. 
-- gy: Bộ môn nằm trong khoa
SELECT GV.MAGV, GV.HOTEN, K.TENKHOA 
FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA

SELECT  * FROM BOMON

-- Lấy ra gv là trưởng bộ môn
SELECT GV.* FROM GIAOVIEN AS GV, BOMON AS BM
WHERE GV.MAGV = BM.TRUONGBM

-- Đếm số lượng gv
-- COUNT(*) -> đếm số lượng của tất cả record
-- COUNT(tên trường) -> đếm số lượng của tên trường
SELECT COUNT(*) AS N'Số lượng giáo viên' FROM GIAOVIEN

-- Đếm sl người thân của gv có mã 007
SELECT COUNT(*) AS N'Số lượng nguời thân' FROM GIAOVIEN, NGUOITHAN
WHERE GIAOVIEN.MAGV = '007' AND GIAOVIEN.MAGV = NGUOITHAN.MAGV

-- Lấy ra tên gv và tên đề tài người đó tham gia
SELECT * 
FROM GIAOVIEN, THAMGIADT, DETAI
WHERE GIAOVIEN.MAGV = THAMGIADT.MAGV
AND DETAI.MADT = THAMGIADT.MADT

-- Lấy ra tên gv và tên đề tài người đó tham gia khi tgia > 1 lần
-- Truy vấn lồng 



-- BÀI TẬP:
-- 1. Xuất ra info gv và gv quản lí chủ nhiệm của người đó
SELECT GV1.HOTEN, GV2.HOTEN FROM GIAOVIEN AS GV1, GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV

-- 2. Xuất ra sl gv của khoa cntt
SELECT COUNT(*) FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
WHERE GV.MABM = BM.MABM
AND BM.MAKHOA = K.MAKHOA
AND K.MAKHOA = 'CNTT'

-- 3. Xuất ra info gv và đề tài người đó tgia khi mà k.quả là đạt
SELECT GV.* FROM GIAOVIEN AS GV, THAMGIADT AS TG
WHERE GV.MAGV = TG.MAGV
AND TG.KETQUA =N'Đạt'


-- TÌM KIẾM GẦN ĐÚNG

-- Xuất ra info gv mà tên bắt đầu = chữ l
SELECT * FROM GIAOVIEN
WHERE HOTEN like 'l%'

-- Xuất ra ttin gv end = n
SELECT * FROM GIAOVIEN
WHERE HOTEN like '%n'

-- Xuất ra ttin gv tồn tại chữ n
SELECT * FROM GIAOVIEN
WHERE HOTEN like '%n%'

-- Xuất ra ttin gv tồn tại chữ ế
SELECT * FROM GIAOVIEN
WHERE HOTEN like N'%ế%'


-- INNER JOIN

-- inner join -> kiểu cũ
-- mọi join đều cần điều kiện
SELECT * FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

-- inner join kiểu mới, đúng chuẩn
SELECT * FROM GIAOVIEN INNER JOIN BOMON
ON BOMON.MABM = GIAOVIEN.MABM
AND BOMON.TRUONGBM = ''

-- có thể viết tắt inner join thành join
SELECT * FROM KHOA JOIN BOMON 
ON BOMON.MAKHOA = KHOA.MAKHOA


-- OUTER JOIN
-- gom 2 bảng lại theo điều kiện, ko có dữ liệu thì để null
SELECT * FROM BOMON FULL OUTER JOIN GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM

-- CROSS JOIN là tổ hợp mỗi record của bảng A với all record của bảng B
SELECT * FROM GIAOVIEN CROSS JOIN BOMON

-- LEFT JOIN
SELECT * FROM BOMON JOIN GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM

-- bảng bên phải nhập vào bảng bên trái
-- record nào bảng phải ko có thì để null
-- record nào bên trái ko có thì ko điền vào
SELECT * FROM BOMON LEFT JOIN GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM

-- RIGHT JOIN
SELECT * FROM BOMON JOIN GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM

SELECT * FROM BOMON RIGHT JOIN GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM


-- UNION
SELECT MAGV FROM GIAOVIEN

SELECT * FROM NGUOITHAN

SELECT MAGV FROM GIAOVIEN
WHERE LUONG < 2000
UNION 
SELECT MAGV FROM NGUOITHAN
WHERE PHAI = N'Nữ'

