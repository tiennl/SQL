create database QUANLYDATHANGDIENTU

use QUANLYDATHANGDIENTU

create table KHACHHANG
(
	MaKH nvarchar(50) not null primary key,
	TenKH nvarchar(50) not null,
	Email nvarchar(50),
	SoDT nvarchar(50),
	DiaChi nvarchar(50)	
)

create table THANHTOAN
(
	MaTT nvarchar(50) not null primary key,
	PhuongThucTT nvarchar(50)
)

create table DONHANG
(
	MaDH nvarchar(50) not null primary key,
	MaKH nvarchar(50) not null,
	MaTT nvarchar(50) not null,
	NgayDat date
	constraint FK_DH_KH
	foreign key (MaKH) references KHACHHANG(MaKH),
	constraint FK_DH_TT
	foreign key (MaTT) references THANHTOAN(MaTT)
)

create table DMSANPHAM
(
	MaDM nvarchar(50) not null primary key,
	TenDanhMuc nvarchar(50),
	MoTa nvarchar(50)
)

create table SANPHAM
(
	MaSP nvarchar(50) not null primary key,
	MaDM nvarchar(50) not null,
	TenSP nvarchar(50),
	GiaTien float,
	SoLuongCon int,
	XuatXu nvarchar(50)
	constraint FK_SP_DMSP
	foreign key (MaDM) references DMSANPHAM (MaDM)
)

create table CHITIETDONHANG
(
	MaDH nvarchar(50) not null,
	MaSP nvarchar(50) not null,
	SoLuong int,
	TongTien float
	constraint PK_CTDH_DH_SP
	primary key (MaDH, MaSP),
	constraint FK_CTDH_DH
	foreign key (MaDH) references DONHANG(MaDH),
	constraint FK_CTDH_SP
	foreign key (MaSP) references SANPHAM(MaSP)
)

insert into KHACHHANG(MaKH, TenKH, Email, SoDT, DiaChi) values
('KH001', 'Tran Van A', 'atv@gmail.com', '0123456789','Nghe An'),
('KH002', 'Nguyen Hanh', 'hanhn@gmail.com', '0123456790', 'Da Nang'),
('KH004', 'Tran Minh Anh', 'anhtm@gmail.com', '0123456791', 'TP HCM')

insert into DMSANPHAM(MaDM , TenDanhMuc, MoTa) values
('DM01', 'Dien thoai', 'dien thoai thong minh, dien thoai trang den'),
('DM02', 'May tinh', 'may tinh xach tay, may tinh ban'),
('DM03', 'Phu kien', 'tai nghe, chuot, ban phim')

insert into SANPHAM(MaSP, MaDM, TenSP, GiaTien, SoLuongCon, XuatXu) values
('SP001', 'DM01', 'Iphone X', 20000000, 200, 'US'),
('SP002', 'DM01', 'Nokia 3', 9000000, 50, 'UK'),
('SP003', 'DM02', 'Macbook Pro', 40000000, 300, 'US'),
('SP004', 'DM03', 'Tai nghe Xiaomi', 100000, 300, 'TQ')

insert into THANHTOAN(MaTT, PhuongThucTT) values
('TT01', 'Tien mat'),
('TT03', 'Visa')

insert into DONHANG(MaDH , MaKH, MaTT, NgayDat) values
('DH001', 'KH001 ', 'TT01 ', '2020-01-20'),
('DH002', 'KH002 ', 'TT01', '2019-05-12'),
('DH003', 'KH001', 'TT03', '2020-04-25')

insert into CHITIETDONHANG(MaDH , MaSP, SoLuong, TongTien) values
('DH001', 'SP002', 3, 60000000),
('DH003', 'SP001', 10, 90000000),
('DH002', 'SP004', 10, 1000000)

--stt (176+10)%3+1=1
-- A1.1 Thêm mới nhiều bản ghi trên bảng trên bảng CTDH, số lượng và tổng tiền phải > 0,
-- mã đơn hàng phải có trong bảng DONHANG
alter trigger Trigger_kiemtra
on CHITIETDONHANG
for insert
as
begin
	declare @soluong int
	declare @tongtien float
	declare @madh nvarchar(50)
	select @soluong = SoLuong from inserted
	select @tongtien = TongTien from inserted
	select @madh = MaDH from inserted
	if (@soluong > 0 and @tongtien > 0 and exists ((select MaDH from DONHANG where MaDH = @madh))) 
	begin
		print 'Trigger Kiem Tra'
	end
	else
	begin
		print N'số lượng và tổng tiền phải lớn hơn 0, mã đơn hàng phải có trong bảng DONHANG'
		rollback tran
	end
end

insert into CHITIETDONHANG(MaDH , MaSP, SoLuong, TongTien) values
('DH003', 'SP004', 10, 1000000)

delete from CHITIETDONHANG where MaDH ='DH003'
select * from CHITIETDONHANG
select * from DONHANG

-- A2  (176+3)%3+1=3
-- A2.3 CHo sự kiện xóa nhiều bản ghi từ bảng KHACHHANG, ko thể xóa nếu tồn tại đơn hàng của khách hàng tương ứng
-- cũng như các chi tiết đơn hàng tương ứng trong các bảng DONHANG và CHITIETDONHANG

create trigger Trigger_XoaKH
on KHACHHANG
for delete
as
begin
	declare @makh nvarchar(50)
	select @makh = MaKH from deleted
	if not exists (select * from KHACHHANG kh join DONHANG dh on kh.MaKH = dh.MaKH 
				join CHITIETDONHANG ct on dh.MaDH = ct.MaDH where kh.MaKH = @makh)
	begin
		print 'Trigger Xoa KH'
	end
	else
	begin
		print N'kh đã có đơn hàng và chi tiết đơn hàng nên ko thể xóa'
		rollback tran
	end
end

select * from KHACHHANG kh join DONHANG dh on kh.MaKH = dh.MaKH 
join CHITIETDONHANG ct on dh.MaDH = ct.MaDH

delete from KHACHHANG where MaKH = 'KH004'

select * from CHITIETDONHANG
select * from DONHANG
select * from KHACHHANG

-- B1 (176+3)%3+1=3
-- B1.3 thực hiện thêm mới 1 bản ghi vào bảng DONHANG thỏa mãn đk A1.3, ngày đặt <= ngày hiện tại 
-- và MaKH phải có trong bảng KHACHHANHG
-- chưa được
alter proc SP_KiemTraNgayDat(
@madh nvarchar(50), 
@makh nvarchar(50), 
@matt nvarchar(50), 
@ngaydat date)
as 
	begin
		if exists (select MaKH from KHACHHANG where MaKH = @makh)
			begin
				if (@ngaydat <= GETDATE())
					insert into DONHANG values (@madh, @makh, @matt, @ngaydat)
				else print N'Không thêm được, ngày đặt phải <= ngày hiện tại'
			end
		else print N'Không thêm được, MaKH phải có trong bảng KHACHHANG'
	end

select * from DONHANG
delete from DONHANG where MaDH = 'DH004'

exec SP_KiemTraNgayDat 'DH005', 'KH005', 'TT01', '2021-12-01'

-- B2 (176+10)%3+1=1
-- B2.1


