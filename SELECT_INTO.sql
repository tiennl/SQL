USE DAOTAO

-- lấy hết dữ liệu của bảng GV vào bảng mới TableA
-- bảng này có các record tương ứng của bảng GV
SELECT * INTO TableA
FROM GIAOVIEN

-- tạo ra 1 bảng tableB mới có 1 cột dữ liệu là họ tên tương ứng bảng GV
-- dữ liệu của bảng tableB lấy dữ liệu từ bảng GV
SELECT HoTen INTO TableB
FROM GIAOVIEN

-- tạo ra 1 bảng tableC mới có 1 cột dữ liệu là họ tên tương ứng bảng GV
-- với điều kiện lương > 2000
-- dữ liệu của bảng tableC lấy dữ liệu từ bảng GV
SELECT HoTen INTO TableC
FROM GIAOVIEN
WHERE LUONG > 2000

-- tạo ra 1 bảng mới từ nhiều bảng
SELECT MAGV, HOTEN, TENBM INTO GVBackup 
FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

-- tạo ra 1 bảng GVBK y chang nhưng ko có dữ liệu
SELECT * INTO GVBK
FROM GIAOVIEN
WHERE 6>9