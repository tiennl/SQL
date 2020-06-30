USE DAOTAO

-- xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 1
-- having -> như where của select nhưng dành cho group by
-- having là where của group by
SELECT BOMON.MABM, COUNT(*) FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM 
GROUP BY BOMON.MABM
HAVING COUNT(*) > 1


-- Xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó
SELECT LUONG, SUM(YEAR(GETDATE()) - YEAR(NGSINH)) FROM GIAOVIEN
GROUP BY LUONG


-- Xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó
-- và có người thân
SELECT LUONG, SUM(YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH)) FROM GIAOVIEN, NGUOITHAN
WHERE GIAOVIEN.MAGV = NGUOITHAN.MAGV
AND GIAOVIEN.MAGV IN (SELECT MaGV FROM NGUOITHAN)
GROUP BY LUONG

-- Xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó
-- và có người thân
-- và tuổi phải lớn hơn tuổi trung bình
SELECT LUONG, SUM(YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH)) FROM GIAOVIEN, NGUOITHAN
WHERE GIAOVIEN.MAGV = NGUOITHAN.MAGV
AND GIAOVIEN.MAGV IN (SELECT MaGV FROM NGUOITHAN)
GROUP BY LUONG, GIAOVIEN.NGSINH  -- having có gì thì group by có cái đó
HAVING YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH) > 
(
	(SELECT SUM(YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH)) FROM GIAOVIEN)
	/ (SELECT COUNT(*) FROM GIAOVIEN)
)