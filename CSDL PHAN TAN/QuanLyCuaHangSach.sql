CREATE DATABASE QuanLyCuaHangSach
GO

USE QuanLyCuaHangSach
GO

CREATE TABLE ChiNhanh(
	MaCN VARCHAR(50) PRIMARY KEY,
	TenCN NVARCHAR(50),
	DiaChi NVARCHAR(50),
	SoDT INT
)

CREATE TABLE NhanVien(
	MaNV VARCHAR(50) PRIMARY KEY,
	TenNV NVARCHAR(50),
	DiaChi NVARCHAR(100),
	TenChiNhanh NVARCHAR(50),
	MaCN VARCHAR(50)
)

CREATE TABLE Sach(
	MaSach VARCHAR(50) PRIMARY KEY,
	TenSach NVARCHAR(50),
	MaTheLoai VARCHAR(50),
	MaTacGia VARCHAR(50),
	MaNXB VARCHAR(50),
	NamXuatBan DATE
)

CREATE TABLE TacGia(
	MaTG VARCHAR(50) PRIMARY KEY,
	TenTG NVARCHAR(100),
	GhiChu NVARCHAR(100)
)

CREATE TABLE TheLoai(
	MaTheLoai VARCHAR(50) PRIMARY KEY,
	TenTheLoai NVARCHAR(100)
)

CREATE TABLE NhaXuatBan(
	MaNXB VARCHAR(50) PRIMARY KEY,
	TenNXB NVARCHAR(100),
	DiaChi NVARCHAR(100)
)

CREATE TABLE KhachHang(
	MaKH VARCHAR(50) PRIMARY KEY,
	TenKH NVARCHAR(100),
	DiaChi NVARCHAR(100),
	MaCN VARCHAR(50)
)

CREATE TABLE HoaDon(
	MaHD VARCHAR(50) PRIMARY KEY,
	MaKH VARCHAR(50),
	MaNV VARCHAR(50),
	NgayLapHoaDon DATE
)

CREATE TABLE CT_HoaDon(
	MaHD VARCHAR(50),
	MaSach VARCHAR(50)
	PRIMARY KEY(MaHD,MaSach)
)


ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sach FOREIGN KEY (MaTacGia) REFERENCES dbo.TacGia (MaTG) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sack2 FOREIGN KEY (MaTheLoai) REFERENCES dbo.TheLoai(MaTheLoai) ON DELETE CASCADE ON UPDATE CASCADE 
ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sach3 FOREIGN KEY (MaNXB) REFERENCES dbo.NhaXuatBan (MaNXB) ON DELETE CASCADE ON UPDATE CASCADE 
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_HD1 FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_HD2 FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.CT_HoaDon ADD CONSTRAINT fk_CTHD1 FOREIGN KEY (MaHD) REFERENCES dbo.HoaDon(MaHD) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.CT_HoaDon ADD CONSTRAINT fk_CTHD2 FOREIGN KEY (MaSach) REFERENCES dbo.Sach(MaSach) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.KhachHang ADD CONSTRAINT fk_KH FOREIGN KEY (MaCN) REFERENCES dbo.ChiNhanh(MaCN)
ALTER TABLE dbo.NhanVien ADD CONSTRAINT fk_nv FOREIGN KEY (MaCN) REFERENCES dbo.ChiNhanh(MaCN) 


INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [SoDT]) VALUES (N'CN1', N'Chi Nhánh 1', N'Đà Nẵng', 545644)
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [SoDT]) VALUES (N'CN2', N'Chi Nhánh 2 ', N'Hồ Chí Minh', 321231)

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH1', N'Nguyễn Văn A', N'Hà Nội', N'CN1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH2', N'Nguyễn Văn B', N'Đà Nẵng', N'CN2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH3', N'Nguyễn Văn C', N'Sài Gòn', N'CN2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH4', N'Nguyễn Văn D', N'Hà Nội', N'CN1')

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV1', N'Hà Thị Nga', N'Huế', N'Đà Nẵng', N'CN1')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV2', N'Huỳnh Văn Phú', N'Đà Nẵng', N'Hồ Chí Minh', N'CN2')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV3', N'Ngô Lê Thủy Tiên', N'Đà Nẵng', N'Đà Nẵng', N'CN1')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV4', N'Nguyễn Thị Tường Lê', N'Sài Gòn', N'Hồ Chí Minh', N'CN2')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV5 ', N'Phạm Thị Uyên', N'Huế', N'Đà Nẵng', N'CN1')

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi]) VALUES (N'NXB1', N'Kim Đồng', N'Hà Nội')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi]) VALUES (N'NXB2', N'Thanh Niên', N'Đà Nẵng')

INSERT [dbo].[TacGia] ([MaTG], [TenTG], [GhiChu]) VALUES (N'TG1', N'GoSho Aoyama', N'Trinh Thám')
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [GhiChu]) VALUES (N'TG2', N'Nguyễn Linh', N'Thần Đồng VN')
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [GhiChu]) VALUES (N'TG3', N'Fumiko', N'Doremon')

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL1', N'Trinh Thám')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL2', N'Thiếu Nhi')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL3', N'Truyện Dân Gian')

INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXuatBan]) VALUES (N'MS1', N'Thám Tử Conan', N'TL1', N'TG1', N'NXB1', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXuatBan]) VALUES (N'MS2', N'Doremon', N'TL2', N'TG2', N'NXB2', CAST(N'2021-12-20' AS Date))
INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXuatBan]) VALUES (N'MS3', N'Thần Đồng Đất Việt', N'TL3', N'TG3', N'NXB2', CAST(N'2021-12-21' AS Date))

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD1', N'KH1', N'NV1', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD2', N'KH2', N'NV2', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD3', N'KH1', N'NV3', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD4', N'KH3', N'NV4', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD5', N'KH4', N'NV5', CAST(N'2021-12-31' AS Date))

INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD1', N'MS1')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD1', N'MS3')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD2', N'MS2')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD3', N'MS3')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD4', N'MS1')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD4', N'MS3')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD5', N'MS2')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD5', N'MS3')



------------------------------------------------------------------------
-- them vo lam dong bo

ALTER TABLE dbo.NhanVien DROP CONSTRAINT fk_nv
ALTER TABLE dbo.HoaDon DROP CONSTRAINT fk_HD1
ALTER TABLE dbo.HoaDon DROP CONSTRAINT fk_HD2
ALTER TABLE dbo.CT_HoaDon DROP CONSTRAINT fk_CTHD1
ALTER TABLE dbo.CT_HoaDon DROP CONSTRAINT fk_CTHD2

ALTER TABLE dbo.Sach DROP CONSTRAINT fk_sach
ALTER TABLE dbo.Sach DROP CONSTRAINT fk_sack2
ALTER TABLE dbo.Sach DROP CONSTRAINT fk_sach3

ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sach FOREIGN KEY (MaTacGia) REFERENCES dbo.TacGia (MaTG) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sack2 FOREIGN KEY (MaTheLoai) REFERENCES dbo.TheLoai(MaTheLoai) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sach3 FOREIGN KEY (MaNXB) REFERENCES dbo.NhaXuatBan (MaNXB) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_HD1 FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_HD2 FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.CT_HoaDon ADD CONSTRAINT fk_CTHD1 FOREIGN KEY (MaHD) REFERENCES dbo.HoaDon(MaHD) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.CT_HoaDon ADD CONSTRAINT fk_CTHD2 FOREIGN KEY (MaSach) REFERENCES dbo.Sach(MaSach) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.NhanVien ADD CONSTRAINT fk_nv FOREIGN KEY (MaCN) REFERENCES dbo.ChiNhanh(MaCN) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.KhachHang ADD CONSTRAINT fk_KH FOREIGN KEY (MaCN) REFERENCES dbo.ChiNhanh(MaCN)

--- thuc nghiem

update LINK.QuanLyCuaHangSach.dbo.NhanVien set DiaChi = N'Thái Bình' where MaNV = 'NV5'

insert into LINK.QuanLyCuaHangSach.dbo.NhanVien (MaNV, TenNV, DiaChi, TenChiNhanh, MaCN) values ('NV100', 'Test', 'DN', N'Đà Nẵng', 'CN1')

delete LINK.QuanLyCuaHangSach.dbo.NhanVien where MaNV = 'NV100'

SELECT * FROM LINK.QuanLyCuaHangSach.dbo.NhanVien


