CREATE DATABASE QUANLYBANHANG

USE QUANLYBANHANG

CREATE TABLE KHACHHANG
(
	MaKH NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenKH NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50),
	SDT NVARCHAR(50),
	DiaChi NVARCHAR(50)	
)

CREATE TABLE DMSANPHAM
(
	MaDM NVARCHAR(50) NOT NULL PRIMARY KEY,
	TenDanhMuc NVARCHAR(50),
	Mota NVARCHAR(50)
)

CREATE TABLE SANPHAM
(
	MaSP NVARCHAR(50) NOT NULL PRIMARY KEY,
	MaDM NVARCHAR(50) NOT NULL,
	TenSP NVARCHAR(50),
	GiaTien FLOAT,
	SoLuong INT,
	XuatXu NVARCHAR(50)

	CONSTRAINT FK_SP_DMSP
	FOREIGN KEY (MaDM) REFERENCES DMSANPHAM (MaDM)
)

CREATE TABLE THANHTOAN
(
	MaTT NVARCHAR(50) NOT NULL PRIMARY KEY,
	PhuongThucTT NVARCHAR(50)
)

CREATE TABLE DONHANG
(
	MaDH  NVARCHAR(50) NOT NULL PRIMARY KEY,
	MaKH  NVARCHAR(50) NOT NULL,
	MaTT  NVARCHAR(50) NOT NULL,
	NgayDat DATE
	CONSTRAINT FK_DH_KH
	FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
	CONSTRAINT FK_DH_TT
	FOREIGN KEY (MaTT) REFERENCES THANHTOAN(MaTT)
)

CREATE TABLE CHITIETDONHANG
(
	MaDH  NVARCHAR(50) NOT NULL,
	MaSP  NVARCHAR(50) NOT NULL,
	SoLuong INT,
	TongTien  FLOAT
	CONSTRAINT PK_CTDH_DH_SP
	PRIMARY KEY (MaDH, MaSP),
	CONSTRAINT FK_CTDH_DH
	FOREIGN KEY (MaDH) REFERENCES DONHANG(MaDH),
	CONSTRAINT FK_CTDH_SP
	FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP)
)

INSERT INTO KHACHHANG(MaKH, TenKH, Email, SDT, DiaChi) VALUES
('KH001', 'Tran Van An', 'antv@gmail.com', '0905123564','Lang Son'),
('KH002', 'Phan Phuoc', 'phuocp@gmail.com', '0932568984', 'Da Nang'),
('KH004', 'Tran Huu Anh', 'anhth@gmail.com', '0901865232', 'Ha Noi')

INSERT INTO DMSANPHAM(MaDM , TenDanhMuc, MoTa) VALUES
('DM01', 'Thoi Trang Nu', 'vay, ao danh cho nu'),
('DM02', 'Thoi Trang Nam', 'quan danh cho nam'),
('DM03', 'Trang suc', 'danh cho nu va nam')

INSERT INTO SANPHAM(MaSP, MaDM, TenSP, GiaTien, SoLuong, XuatXu) VALUES
('SP001', 'DM01', 'DamMaxi', 195000, 200, 'VN'),
('SP002', 'DM01', N'Tui Da Mỹ', 3000000, 50, 'HK'),
('SP003', 'DM02', 'Lac Tay Uc', 300000, 300, 'HQ')

INSERT INTO THANHTOAN(MaTT, PhuongThucTT) VALUES
('TT01', 'Visa'),
('TT02', 'Master Card'),
('TT03', 'JCB')

INSERT INTO DONHANG(MaDH , MaKH, MaTT, NgayDat) VALUES
('DH001', 'KH002 ', 'TT01 ', '2014-10-20'),
('DH002', 'KH002 ', 'TT01', '2015-05-15'),
('DH003', 'KH001', 'TT03', '2015-04-20')

INSERT INTO CHITIETDONHANG(MaDH , MaSP, SoLuong, TongTien) VALUES
('DH001', 'SP002', 3, 56.000 ),
('DH003', 'SP001', 10, 27.444),
('DH002', 'SP002', 10, 67.144)

/*Câu 1: Thực hiện yêu cầu sau:
a. Tạo một khung nhìn có tên là V_KhachHang để thấy được thông tin của tất cả các
đơn hàng có ngày đặt hàng nhỏ hơn ngày 06/15/2015 của những khách hàng có địa
chỉ là "Da Nang". (1 điểm)
b. Thông qua khung nhìn V_KhachHang thực hiện việc cập nhật ngày đặt hàng thành
06/15/2015 đối với những khách hang đặt hàng vào ngày 06/15/2014. (1 điểm)*/

CREATE VIEW V_KhachHang
AS 
SELECT * FROM DONHANG AS DH JOIN KHACHHANG AS KH ON DH.MaKH=KH.MaKH WHERE NgayDat < '2015-06-15' AND DiaChi = 'Da Nang'

UPDATE V_KhachHang
   SET NgayDat = '2015-06-15'
   WHERE NgayDat = '2014-06-15';


/*Câu 2: Tạo 2 thủ tục:
a. Thủ tục Sp_1: Dùng để xóa thông tin của những sản phẩm có mã sản phẩm được
truyền vào như một tham số của thủ tục. (1 điểm)
b. Thủ tục Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng CHITIETDONHANG
(Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung là không trùng
khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng có liên quan). (1 điểm)*/


/*Câu 3: Viết 2 bẫy sự kiện (trigger) cho bảng CHITIETDONHANG theo yêu cầu sau:
a. Trigger_1: Khi thực hiện đăng ký mới một đơn đặt hàng cho khách hàng thì cập nhật
lại số lượng sản phẩm trong bảng sản phẩm (tức là số lượng sản phẩm còn lại sau khi
đã bán). Bẫy sự kiện chỉ xử lý 1 bản ghi. (1 điểm)
b. Trigger_2: Khi cập nhập lại số lượng sản phẩm mà khách hàng đã đặt hàng, kiểm tra
xem số lượng cập nhật có phù hợp hay không (số lượng phải lớn hơn 1 và nhỏ hơn
100). Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không thì hiển thị thông báo "số
lượng sản phẩm được đặt hàng phải nằm trong khoảng giá trị từ 1 đến 100" và thực
hiện quay lui giao tác. (1 điểm)*/


/*Câu 4: Tạo hàm do người dùng định nghĩa (user-defined function) để tính điểm thưởng cho
khách hàng của tất cả các lần đặt hàng trong năm 2014, mã khách hàng sẽ được truyền
vào thông qua tham số đầu vào của hàm. Cụ thể như sau:
- Nếu tổng số tiền khách hàng đã trả cho tất cả các lần mua hàng dưới 2.000.000, thì trả
về kết quả là khách hàng được nhận 20 điểm thưởng. (1 điểm)
- Nếu tổng số tiền khách hàng đã trả cho tất cả các lần mua hàng từ 2.000.000 trở đi, thì
trả về kết quả là khách hàng được nhận 50 điểm thưởng. (1 điểm)*/


/*Câu 5: Tạo thủ tục Sp_SanPham tìm những sản phẩm đã từng được khách hàng đặt mua để
xóa thông tin về những sản phẩm đó trong bảng SANPHAM và xóa thông tin những
đơn hàng có liên quan đến những sản phẩm đó (tức là phải xóa những bản ghi trong bảng
DONHANG và CHITIETDONHANG có liên quan đến các sản phẩm đó). (2 điểm)*/

