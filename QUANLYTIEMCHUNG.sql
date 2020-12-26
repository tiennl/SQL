CREATE DATABASE QUANLYTIEMCHUNG

USE QUANLYTIEMCHUNG

CREATE TABLE CHUSOHUU
(
	MaChuSH NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenChuSH NVARCHAR(50),
	DiaChi NVARCHAR(50),
	SoDienThoai NVARCHAR(50)
)

CREATE TABLE LOAIVATNUOI
(
	MaLoaiVN NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenLoaiVN NVARCHAR(50) ,
	MoTaChiTiet NVARCHAR(50)
)

CREATE TABLE LOAIVACXIN
(
	MaLoaiVX NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenLoaiVX NVARCHAR(50),
	PhongBenh NVARCHAR(50),
	DieuKienTiem NVARCHAR(50),
	LieuTrinhTiem NVARCHAR(50),
	LieuLuong FLOAT
)

CREATE TABLE VATNUOI
(
	MaVN NVARCHAR(50) NOT NULL PRIMARY KEY,
	MaChuSH NVARCHAR(50) NOT NULL,
	MaLoaiVN NVARCHAR(50) NOT NULL,
	TenVN NVARCHAR(50),
	CanNang INT,
	GioiTinh NVARCHAR(50),
	Tuoi INT,
	TienSuBenhLy NVARCHAR(50),
	MauLong NVARCHAR(50),
	TinhTrangSucKhoe NVARCHAR(50)
	CONSTRAINT FK_VN_CSH
	FOREIGN KEY (MaChuSH) REFERENCES CHUSOHUU(MaChuSH),
	CONSTRAINT FK_VN_LVN
	FOREIGN KEY (MaLoaiVN) REFERENCES LOAIVATNUOI(MaLoaiVN)
)


CREATE TABLE TIEMCHUNG
(
	MaTC NVARCHAR(50) NOT NULL PRIMARY KEY,
	MaVN NVARCHAR(50) NOT NULL,
	MaLoaiVX NVARCHAR(50),
	NgayTiem DATE,
	LanTiem INT,
	CONSTRAINT FK_TC_LVX
	FOREIGN KEY (MaLoaiVX) REFERENCES LOAIVACXIN(MaLoaiVX),
	CONSTRAINT FK_TC_VN
	FOREIGN KEY (MaVN) REFERENCES VATNUOI(MaVN)
)

INSERT INTO CHUSOHUU VALUES
('SH001', 'Chu so huu 1', 'Hoa Hai', '0905111111'),
('SH002', 'Chu so huu 2', 'Lien Chieu', '0905111112'),
('SH003', 'Chu so huu 3', 'Hai Chau', '0905111113'),
('SH004', 'Chu so huu 4', 'Hoa Minh', '0905111114'),
('SH005', 'Chu so huu 5', 'Hoa Hai', '0905111115'),
('SH006', 'Chu so huu 6', 'Hoa Xuan', '0905111116'),
('SH007', 'Chu so huu 7', 'Thanh Khe', '0905111117'),
('SH008', 'Chu so huu 8', 'Cam Le', '0905111118'),
('SH009', 'Chu so huu 9', 'Hoa Xuan', '0905111119'),
('SH010', 'Chu so huu 10', 'Hoa Hai', '0905111120')

INSERT INTO LOAIVATNUOI VALUES
('LVN01', 'Cho', 'Loai thich an thit'),
('LVN02', 'Meo', 'Loai dong vat gay hai'),
('LVN03', 'Chuot', 'Dong vat nho'),
('LVN04', 'Chim', 'Dong vat co canh'),
('LVN05', 'Soc', 'La dong vat nho')

INSERT INTO VATNUOI VALUES 
('VN001', 'SH001', 'LVN01', 'Husky', 20, 'Duc', 12, 'Duong ruot', 'den', 'Dam bao'),
('VN002', 'SH001', 'LVN01', 'Donerman', 25, 'Cai', 24, 'Khong', 'trang', 'Dam bao'),
('VN003', 'SH003', 'LVN01', 'Alaskan', 15, 'Duc', 46, 'Khong', 'vang den', 'Dam bao'),
('VN004', 'SH004', 'LVN01', 'Chowchow', 30, 'Cai', 24, 'Viem man tai', 'trang den', 'Dam bao'),
('VN005', 'SH004', 'LVN02', 'MaineCoon', 12, 'Duc', 6, 'Viem mong', 'trang', 'Dam bao'),
('VN006', 'SH004', 'LVN02', 'Ragdoll', 10, 'Cai', 7, 'Khong', 'den', 'Dam bao'),
('VN007', 'SH008', 'LVN02', 'Ba Tu', 8, 'Duc', 5, 'Khong', 'den trang', 'Dam bao'),
('VN008', 'SH006', 'LVN02', 'Xiem', 4, 'Cai', 3, 'Nhiem sang', 'vang', 'Dam bao')

INSERT INTO LOAIVACXIN(MaLoaiVX, TenLoaiVX, PhongBenh, DieuKienTiem, LieuTrinhTiem, LieuLuong) VALUES
('VX001', 'Vacxin 1', 'Cau trung', 'Duoi 1', 'Tiem 2 lan', 1),
('VX002', 'Vacxin 2', 'Thuong han', 'Tu 1 - 2', 'Tiem 1 lan', 3),
('VX003', 'Vacxin 3', 'Dich ta', 'Duoi 1', 'Tiem 1 lan', 1.5),
('VX004', 'Vacxin 4', 'Tu huyet', 'Duoi 1', 'Tiem 2 lan', 2),
('VX005', 'Vacxin 5', 'Lo mom', 'Tu 2 - 3', 'Tiem 1 lan', 1),
('VX006', 'Vacxin 6', 'Phe quan', 'Duoi 1', 'Uong 1 lan', 1.5),
('VX007', 'Vacxin 7', 'Cat xon', '1', 'Uong 1 lan', 2),
('VX008', 'Vacxin 8', 'Tieu chay', '1', 'Tiem 3 lan', 1),
('VX009', 'Vacxin 9', 'Ho hap', '1', 'Tiem 1 lan', 1),
('VX010', 'Vacxin 10', 'Care', 'Duoi 1', 'Tiem 4 lan', 3),
('VX011', 'Vacxin 11', 'Uong van', 'Tu 1 - 2', 'Uong 1 lan', 1.5),
('VX012', 'Vacxin 12', 'Tai xanh', '12', 'Uong 3 lan', 2.5)

INSERT INTO TIEMCHUNG(MaTC, MaVN, MaLoaiVX, NgayTiem, LanTiem) VALUES
('TC0001', 'VN001', 'VX007', '2016-11-20', 3),
('TC0002', 'VN001', 'VX006', '2016-10-23', 1),
('TC0003', 'VN005', 'VX010', '2016-08-03', 1),
('TC0004', 'VN005', 'VX011', '2016-09-19', 2),
('TC0005', 'VN005', 'VX011', '2016-09-19', 1),
('TC0006', 'VN007', 'VX001', '2016-12-07', 3),
('TC0007', 'VN007', 'VX002', '2015-04-10', 1),
('TC0008', 'VN008', 'VX003', '2014-10-20', 2),
('TC0009', 'VN008', 'VX002', '2014-08-06', 2),
('TC0010', 'VN008', 'VX001', '2015-06-05', 1),
('TC0011', 'VN003', 'VX008', '2015-08-08', 2),
('TC0012', 'VN003', 'VX008', '2016-04-10', 3),
('TC0013', 'VN001', 'VX006', '2016-09-07', 1),
('TC0014', 'VN001', 'VX007', '2016-10-09', 2),
('TC0015', 'VN003', 'VX007', '2014-10-08', 1)


/*Câu 1: Thực hiện yêu cầu sau:
a) Tạo một khung nhìn có tên là V_Vacxin để lấy thông tin của tất cả các loại vacxin đã từng được sử dụng 
để tiêm chủng cho vật nuôi và có liều lượng (LieuLuong) là “1” ml trên 1kg cân nặng. (1 điểm)*/
create view V_Vacxin as 
select lvx.* from LOAIVACXIN lvx join TIEMCHUNG tc on lvx.MaLoaiVX = tc.MaLoaiVX
where lvx.LieuLuong = 1


/*b) Thông qua khung nhìn V_Vacxin thực hiện cập nhật liều lượng (LieuLuong) thành “4” ml 
đối với tất cả các loại vacxin được nhìn thấy bởi khung nhìn này. (1 điểm)*/
update V_Vacxin
set LieuLuong = 4
where MaLoaiVX in (select MaLoaiVX from V_Vacxin)

select * from LOAIVACXIN
update LOAIVACXIN set LieuLuong = 1 where MaLoaiVX = 'VX001' or MaLoaiVX = 'VX008'

/* Câu 2: Tạo 2 Stored Procedure:
a) Stored Procedure Sp_1: Dùng để cập nhật thông tin của một vật nuôi nào đó với Mã vật nuôi (MaTN) 
được truyền vào như một tham số. (1 điểm)*/


/* b) Stored Procedure Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng TIEMCHUNG với yêu cầu Sp_2 
phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung, với nguyên tắc là 
không được trùng khóa chính và đảm bảo toàn vẹn dữ liệu tham chiếu đến các bảng có liên quan. (1 điểm)*/
create proc Sp_2(
@MaTC nvarchar(50), 
@MaVN nvarchar(50), 
@MaLoaiVX nvarchar(50),
@NgayTiem date,
@LanTiem int)
as 
	begin
		if not exists (select MaVN, MaLoaiVX from TIEMCHUNG where MaVN = @MaVN and MaLoaiVX = @MaLoaiVX)
			begin
				if (@MaVN is null or exists (select MaVN from VATNUOI where MaVN = @MaVN))
				AND (@MaLoaiVX is null or exists (select MaLoaiVX from LOAIVACXIN where MaLoaiVX = @MaLoaiVX))
					insert into TIEMCHUNG values (@MaTC, @MaVN, @MaLoaiVX, @NgayTiem, @LanTiem)
				else print N'Không thêm được'
			end
		else print N'Không thêm được'
	end

exec Sp_2 'TC016', 'VN009', 'VX004', '2014-10-08', 1 

select * from TIEMCHUNG


/*Câu 3: Viết 2 Trigger cho bảng TIEMCHUNG theo yêu cầu sau:
a) Trigger_1: Khi thực hiện xóa một bản ghi từ bảng VATNUOI thì hiển thị tổng số bản ghi 
đã được xóa ra giao diện console của database server. (1 điểm)*/
-- chưa được
alter trigger Trigger_1
on TIEMCHUNG
for delete
as
begin
	declare @soluong int
	declare @MaVN nvarchar(50)
	select @soluong = COUNT(*) from deleted
	select @MaVN = MaVN from inserted
	print @soluong
end


/*b) Trigger_2: Khi thêm mới một bản ghi vào bảng TIEMCHUNG thì giá trị cột NgayTiem, 
cần kiểm tra xem thời gian thêm mới cột ngày tiêm (NgayTiem) có phù hợp hay không, với quy tắc: 
thời gian tiêm phải nhỏ hơn thời gian của lần tiêm chủng cuối cùng (bất kể loại vacxin nào) 
của vật nuôi ít nhất 30 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không thì sẽ hiển thị 
thông báo “Thời gian tiêm chủng phải nhỏ hơn thời gian tiêm chủng lần cuối cùng ít nhất 30 ngày” 
ra giao diện console của database server. (1 điểm)*/
alter trigger Trigger_2
on TIEMCHUNG
for insert
as
begin
		declare @ngaytiem date
		select @ngaytiem = TIEMCHUNG.NgayTiem from TIEMCHUNG join inserted on TIEMCHUNG.MaTC = inserted.MaTC
		if (@soluong <= 1 or @soluong >= 100)
		begin
			print N'số lượng sản phẩm được đặt hàng phải nằm trong khoảng giá trị từ 1 đến 100'
			rollback tran
		end
		else
		begin
			update CHITIETDONHANG set SoLuong = @soluong 
			from inserted join CHITIETDONHANG
			on inserted.MaDH = CHITIETDONHANG.MaDH
			print 'Trigger 2'
		end
end

/*Câu 4: Tạo 2 User-defined function để thực hiện các yêu cầu sau:
a) User-defined function funct1: Đếm số lượng các loại vacxin mà vật nuôi đã được tiêm chủng 
trong năm 2016, chỉ đếm đối với những vật nuôi có chủ sở hữu ở địa chỉ là “Hoa hai”. 
Mã vật nuôi được truyền vào như là một tham số của function này. (1 điểm).*/

	
/*b) User-defined function funct2: Tính số lần tiêm chủng nhiều nhất của tất cả 
các vật nuôi thuộc loài (TenLoaiTN) có tên là  là “Cho” .
Chỉ tính số lần tiêm trong khoảng thời gian từ đầu năm 2014 đến cuối năm 2016. (1 điểm)*/


/*Câu 5: Tạo Stored Procedure Sp_TiemChung để tìm những vật nuôi thuộc loài “Cho” và đã được tiêm chủng 
từ hai loại vacxin trở lên vào đầu năm 2014 đến cuối năm 2016 để xóa thông tin của những vật nuôi đó 
(tức là phải xóa những bản ghi trong bảng VATNUOI có liên quan) và xóa những lần tiêm chủng cho vật nuôi đó 
(tức là phải xóa những bản ghi trong bảng TIEMCHUNG có liên quan). (2 điểm)*/


