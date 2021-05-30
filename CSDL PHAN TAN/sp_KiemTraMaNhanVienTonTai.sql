CREATE PROC sp_KiemTraMaNhanVienTonTai
@MANV VARCHAR(50)
AS
BEGIN
	--kiem tra trong table nhanvien cua server hien tai 

	IF EXISTS (SELECT 1 FROM DBO.NhanVien WHERE DBO.NhanVien.MaNV = @MANV)
	BEGIN
		RETURN 1; --MA NHAN VIEN TON TAI O SERVER HIEN TAI
	END

	--kiem tra trong table nhanvien cua CUA PHAN MANH CON LAI

	IF EXISTS (SELECT 1 FROM LINK.QuanLyCuaHangSach.DBO.NhanVien NV WHERE NV.MaNV = @MANV)
	BEGIN
		RETURN 1; --MA NHAN VIEN TON TAI O sever con lai
	END

	RETURN 0; --ma nhan vien chua ton tai
END