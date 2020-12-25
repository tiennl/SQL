-- CURSOR

declare <tên con trỏ> cursor for <câu select>
open <tên con trỏ>

fetch next from <tên con trỏ> into <danh sách các biến tương ứng kết quả truy vấn>

while @@FETCH_STATUS = 0
begin
câu lệnh thực hiên
fetch next lại lần nữa
fetch next from <tên con trỏ> into <ds các biến tương ứng kq truy vấn>
end

close <tên con trỏ>
deallocate <tên con trỏ>


--- vidu
-- từ tuổi của gv
-- > 40 thì lương là 2500
-- 30 < tuổi < 40 thì lương là 2000
-- ngược lại là 1500
declare GiaoVienCursor cursor for select MaGV, YEAR(GETDATE()) - YEAR(NgSinh) from GIAOVIEN

open GiaoVienCursor

declare @MaGV char(10)
declare @Tuoi int

fetch next from GiaoVienCursor into @MaGV, @Tuoi

while @@FETCH_STATUS = 0
begin
	if @Tuoi > 40
	begin
		update GIAOVIEN set Luong = 2500 where MaGV = @MaGV
	end
	else 
	if @Tuoi > 30
	begin
		update GIAOVIEN set Luong = 2000 where MaGV = @MaGV
	end
	else 
	begin
		update GIAOVIEN set Luong = 1500 where MaGV = @MaGV
	end

	fetch next from GiaoVienCursor into @MaGV, @Tuoi
end

close GiaoVienCursor
deallocate GiaoVienCursor