CREATE DATABASE QuanLiSinhVien
USE QuanLiSinhVien
CREATE TABLE tblKhoa(
sMaKhoa CHAR(5) NOT NULL PRIMARY KEY ,
sTenKhoa NVARCHAR(30),
sDiaChi NVARCHAR(20),
sSoDT CHAR(15)
)
CREATE TABLE tblLop(
sMaLop CHAR(10) NOT NULL PRIMARY KEY,
sTenLop VARCHAR(30),
iSiSo INT,
sMaGV CHAR(5)
)
ALTER TABLE dbo.tblLop ADD CONSTRAINT FK_MaGV_L FOREIGN KEY(sMaGV) REFERENCES dbo.tblGiangVien(sMaGV)
CREATE TABLE tblGiangVien (
sMaGV CHAR(5) NOT NULL PRIMARY KEY ,
sTenGV NVARCHAR(30),
sGioiTinh NVARCHAR(5),
dNgaySinh DATE,
sMaKhoa CHAR(5), 
fLuongCB FLOAT,
fHeSoLuong FLOAT,
dNgayvaolam DATE, 
sSoDT VARCHAR(15)
)
ALTER TABLE dbo.tblGiangVien ADD CONSTRAINT FK_MaK2 FOREIGN KEY(sMaKhoa) REFERENCES dbo.tblKhoa(sMaKhoa)
CREATE TABLE tblSinhVien(
sMaSV VARCHAR(5) NOT NULL PRIMARY KEY,
sTenSV NVARCHAR(30),
sMaLop CHAR(10),
dNgaySinh DATE,
sDiaChi NVARCHAR(20),
sGioiTinh NVARCHAR(5),
sSoDT CHAR(15)
)
ALTER TABLE dbo.tblSinhVien ADD CONSTRAINT FK_MaLop FOREIGN KEY(sMaLop) REFERENCES dbo.tblLop(sMaLop)
CREATE TABLE tblMonHoc(
sMaMon VARCHAR(10) NOT NULL PRIMARY KEY,
sTenMon NVARCHAR(30),
iSoTC INT
)
ALTER TABLE dbo.tblMonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY(sMaGV) REFERENCES dbo.tblGiangVien(sMaGV)
ALTER TABLE dbo.tblMonHoc DROP COLUMN sMaGV
CREATE TABLE tblBangDiem(
sMaSV  VARCHAR(5) NOT NULL,
sMaMon VARCHAR(10) NOT NULL,
fDiemCC FLOAT,
fDiemGK FLOAT,
fDiemKTHP FLOAT, 
fDiemTK FLOAT  DEFAULT 0,
sMaGV CHAR(5) NOT NULL
)
SELECT *FROM dbo.tblBangDiem WHERE sMaSV = 'SV01'
ALTER TABLE dbo.tblBangDiem ADD CONSTRAINT FK_MaGV FOREIGN KEY(sMaGV) REFERENCES dbo.tblGiangVien(sMaGV)
ALTER TABLE dbo.tblBangDiem ADD CONSTRAINT PK_SV_Lop PRIMARY KEY(sMaSV, sMaMon, sMaGV) 
ALTER TABLE dbo.tblBangDiem ADD CONSTRAINT FK_SV FOREIGN KEY(sMaSV) REFERENCES dbo.tblSinhVien(sMaSV)
ALTER TABLE dbo.tblBangDiem ADD CONSTRAINT FK_Mon FOREIGN KEY(sMaMon) REFERENCES dbo.tblMonHoc(sMaMon)
INSERT INTO tblBangDiem(sMaSV,sMaMon,fDiemCC,fDiemGK,fDiemKTHP,sMaGV) VALUES('SV01', 'LTHSK', 9,8,7,'GV01')
-- =========== END CREATE TABLE===========
-- =========== START INSERT DATA==========
INSERT INTO tblKhoa(sMaKhoa,sTenKhoa,sDiaChi, sSoDT) 
VALUES('CNTT', N'Công nghệ thông tin', N'Định Công', '0123443746'),
('CNSH', N'Công nghệ sinh học', N'Trần Phú', '0123443046'),
('CNTP', N'Công nghệ thực phẩm', N'Yên Sở', '0123443946'),
('DTVT', N'Điện tử viễn thông', N'Nguyễn Chí Thanh', '0123463746'),
('FOE', N'Tiếng Ạnh', N'Nguyễn Trãi', '0123443146')
INSERT INTO tblGiangVien 
VALUES('GV01', N'Nguyễn Ngọc Vy', N'Nữ', '2001-01-01', 'CNTT', 2000, 0.1, '2018-01-01', '0988172666'),
('GV02', N'Nguyễn Kì Anh', N'Nữ', '2001-12-01', 'CNTP', 2000, 0.1, '2018-12-01', '0988822666'),
('GV03', N'Vũ Văn Bảo', N'Nam', '2000-12-09', 'DTVT', 2000, 0.1, '2019-12-01', '0988822600'),
('GV04', N'Nguyễn Thị Thanh Tâm', N'Nữ', '1999-3-09', 'CNSH', 2000, 0.2, '2017-12-01', '0988811600'),
('GV05', N'Nguyễn Duy Tuấn', N'Nam', '1998-3-01', 'FOE', 3000, 0.2, '2020-12-01', '0982211600')
INSERT INTO tblLop 
VALUES('LH01', '2110A01', 70, 'CNTT'),
('LH02', '2110A02', 65, 'CNSH'),
('LH03', '2110A03', 75, 'CNTP'),
('LH04', '2110A04', 60, 'DTVT'),
('LH05', '2110A05', 77, 'FOE')
INSERT INTO tblSinhVien 
VALUES('SV01', N'Nguyễn Thị Ánh Dương','LH01', '2003-09-09', N'Hà Nội', N'Nữ', '0911762345'),
('SV02', N'Bùi Phạm Như Hằng', 'LH02','2001-12-01', N'Hà Nam', N'Nữ', '0911760045'),
('SV03',  N'Phan Công Bình', 'LH03','2003-10-10', N'Thái Bình', N'Nam', '0911762300'),
('SV04',  N'Đặng Trọng Thắm', 'LH04','2002-12-29', N'Bắc Ninh', N'Nữ', '0911700345'),
('SV05',  N'Đỗ Hồng Anh', 'LH05','2003-01-01', N'An Giang', N'Nữ', '0911765545')
INSERT INTO tblMonHoc 
VALUES('LTHSK', N'Lập trình hướng sự kiện', 4),
('THDC', N'Tin học đại cương', 3),
('QTM', N'Quản trị mạng', 3),
('TRR', N'Toán rời rạc', 4),
('LTW', N'Lập trình web', 4)
SELECT *FROM dbo.tblMonHoc
INSERT INTO tblBangDiem (sMaSV, sMaMon, fDiemCC, fDiemGK, fDiemKTHP)
VALUES('SV01', 'LTHSK', 10, 8.0, 7.5),
('SV02', 'TRR', 9, 4.0, 5.5),
('SV02', 'TRR', 9, 4.0, 5.5),
('SV02', 'THDC', 10, 0.0, 5.5),
('SV03', 'QTM', 9, 7.0, 3.5),
('SV01', 'TRR', 8, 6.5, 6.5),
('SV05', 'LTW', 10, 8.0, 10)
-- ======== END INSERT DATA=======
-- ======== START CREATE VIEW ====
---	1.Tạo view tính tổng số (MONHOC) đã học của từng sinh viên
CREATE VIEW tongsomon_SV_hoc
AS 
SELECT SV.sMaSV, COUNT(sMaMon) [Số môn đã học]
FROM dbo.tblSinhVien AS SV, dbo.tblBangDiem AS BD
WHERE BD.sMaSV = SV.sMaSV
GROUP BY SV.sMaSV
SELECT *FROM tongsomon_SV_hoc
---	2.Tạo view thống kê số học sinh nam của từng môn học
CREATE VIEW so_SV_nam_MH
AS
SELECT tblMonHoc.sMaMon, COUNT(tblBangDiem.sMaSV) [Số sinh viên nam]
FROM dbo.tblSinhVien INNER JOIN dbo.tblBangDiem ON  tblBangDiem.sMaSV = tblSinhVien.sMaSV
INNER JOIN dbo.tblMonHoc ON tblMonHoc.sMaMon = tblBangDiem.sMaMon 
WHERE sGioiTinh = N'Nam' GROUP BY tblMonHoc.sMaMon
SELECT *FROM so_SV_nam_MH
--- 3. Tạo view thống kê số lượng sinh viên theo giới tính
CREATE VIEW so_SV_gioitinh
AS
SELECT sGioiTinh, COUNT(sMaSV) [Số sinh viên]
FROM dbo.tblSinhVien
GROUP BY sGioiTinh
---	3.Tạo view thống kê top 3 sinh viên có điểm trung bình cao nhất của Mã lớp X
CREATE VIEW top_DiemSV_LopX
AS
SELECT TOP(3) dbo.tblBangDiem.sMaSV, (fDiemKTHP+fDiemGK+fDiemCC)/3 [Điểm trung bình]
FROM dbo.tblSinhVien INNER JOIN dbo.tblBangDiem ON tblBangDiem.sMaSV = tblSinhVien.sMaSV 
WHERE sMaLop='LH01'
ORDER BY fDiemKTHP DESC 
SELECT *FROM dbo.tblBangDiem
---	4.Tạo view tính điểm trung bình của sinh viên trong từng môn học
CREATE VIEW diemTB_SV
AS
SELECT sMaSV, sMaMon, (fDiemKTHP+fDiemGK+fDiemCC)/3 [Điểm trung bình]
FROM dbo.tblBangDiem 
SELECT *FROM DiemSV_LopX
---	5.Tạo view thống kê môn học có số TC > 3
CREATE VIEW tinchi_MH_lonhon3
AS
SELECT sMaMon, sTenMon, iSoTC
FROM dbo.tblMonHoc
WHERE iSoTC>3
--========== END CREATE VIEW===========
--========== START SELECT==============
---	Thống kê danh sách giảng viên nữ của Khoa CNTT
SELECT sMaGV, sTenGV, sTenKhoa
FROM dbo.tblKhoa INNER JOIN dbo.tblGiangVien ON tblGiangVien.sMaKhoa = tblKhoa.sMaKhoa
WHERE sGioiTinh = N'Nữ' AND tblKhoa.sMaKhoa='CNTT'
SELECT *FROM dbo.tblGiangVien
---	Tính tuổi trung bình của các giảng viên
SELECT AVG(YEAR(GETDATE()) - YEAR(dNgaySinh))
FROM dbo.tblGiangVien
---	Cho biết giảng viên có tuổi cao nhất
SELECT TOP(1)sMaGV, sTenGV, (YEAR(GETDATE()) - YEAR(dNgaySinh)) [Tuổi]
FROM dbo.tblGiangVien ORDER BY [Tuổi] DESC
---	Thống kê số giảng viên nam trên 20 tuổi
SELECT sMaGV, sTenGV, (YEAR(GETDATE()) - YEAR(dNgaySinh)) AS tuoi
FROM dbo.tblGiangVien WHERE (YEAR(GETDATE()) - YEAR(dNgaySinh))>=25
---	Liệt kê số môn mà giảng viên dạy
SELECT tblGiangVien.sMaGV, sTenGV, COUNT(sMaMon)
FROM dbo.tblGiangVien INNER JOIN dbo.tblMonHoc ON tblMonHoc.sMaGV = tblGiangVien.sMaGV
GROUP BY tblGiangVien.sMaGV, sTenGV
---	Thống kê số sinh viên của từng lớp hành chính
SELECT tblSinhVien.sMaLop, sTenLop, COUNT(sMaSV) [Sĩ số]
FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop
GROUP BY tblSinhVien.sMaLop, sTenLop
---	Thống kê sinh viên đã từng phải học lại ít nhất 2 lần

---	Thống kê Sinh Viên có địa chỉ ở Hà Nội
SELECT *FROM dbo.tblSinhVien WHERE sDiaChi = N'Hà Nội'
---	Cho biết danh sách sinh viên có điểm KTHP > 9 của môn CSDL
SELECT tblSinhVien.sMaSV, sTenSV, fDiemKTHP FROM dbo.tblBangDiem INNER JOIN dbo.tblSinhVien ON tblSinhVien.sMaSV = tblBangDiem.sMaSV
WHERE fDiemKTHP>9
---	Cho biết danh sách sinh viên do giảng viên X chủ nhiệm
SELECT sMaSV, sTenSV, sTenGV FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop
INNER JOIN dbo.tblKhoa ON dbo.tblGiangVien.sMaGV = dbo.tblLop.sMaGV
INNER JOIN dbo.tblGiangVien ON dbo.tblGiangVien.sMaKhoa = dbo.tblLop.sMaGV
WHERE sMaGV = 'GV01'
---	Thống kê sinh viên có năm sinh là 2002
SELECT sMaSV, sTenSV, dNgaySinh FROM dbo.tblSinhVien WHERE YEAR(dNgaySinh)=2002
---	Thống kê sinh viên học LỚP 2110A05
SELECT sMaSV, sTenSV, sTenLop FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop WHERE sTenLop = '2110A05'
---	Thống kê sinh viên lớp X của khoa CNTT
SELECT dbo.tblSinhVien.* FROM dbo.tblSinhVien INNER JOIN  dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop INNER JOIN dbo.tblKhoa ON tblKhoa.sMaKhoa = tblLop.sMaKhoa
WHERE tblSinhVien.sMaLop= 'LH01' AND sTenKhoa = N'Công nghệ thông tin'
---	Thống kê số sinh viên của từng lớp hành chính
SELECT tblSinhVien.sMaLop, sTenLop, COUNT(sMaSV) FROM dbo.tblSinhVien 
INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop GROUP BY tblSinhVien.sMaLop, sTenLop
--- Cho biết các sinh viên có số tín chỉ học đc trên 5
SELECT tblSinhVien.sMaSV, sTenSV, SUM(iSoTC) [Số tín chỉ] FROM dbo.tblSinhVien INNER JOIN dbo.tblBangDiem ON tblBangDiem.sMaSV = tblSinhVien.sMaSV
INNER JOIN dbo.tblMonHoc ON tblMonHoc.sMaMon = tblBangDiem.sMaMon GROUP BY tblSinhVien.sMaSV, sTenSV HAVING SUM(iSoTC)>5
---	Thống kê Số sinh viên đi học không đầy đủ (Điểm CC < 10) của môn CSDL
SELECT *FROM dbo.tblBangDiem
SELECT sMaSV FROM dbo.tblBangDiem INNER JOIN dbo.tblMonHoc ON tblMonHoc.sMaMon = tblBangDiem.sMaMon WHERE fDiemCC <10 AND sTenMon = N'Toán rời rạc'
--========== END SELECT============
--========= START CREATE PROC======
-- viết thủ tục đưa ra ds sv 1 lớp và gv của lớp đó#
CREATE PROC ds_sv_gvcn
@tenlop varchar(30)
AS
 BEGIN
 IF(EXISTS(SELECT sTenLop FROM dbo.tblLop WHERE sTenLop LIKE @tenlop))
 BEGIN 
 SELECT dbo.tblSinhVien.*, dbo.tblLop. FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop INNER JOIN dbo.tblGiangVien 
 on tblGiangVien.sMaGV = tblLop.sMaGV
 END 
 END 

---	Tạo thủ tục thêm sinh viên
CREATE PROC insert_SV
@maSV VARCHAR(5), @tenSV NVARCHAR(30), @maLop CHAR(10), @ngaysinh date, @diachi nvarchar(20), @gioitinh nvarchar(5), @sodt CHAR(15)
AS 
BEGIN
INSERT INTO tblSinhVien VALUES(@maSV, @tenSV, @maLop, @ngaysinh, @diachi, @gioitinh, @sodt )
END  
EXEC  insert_SV 'SV06', N'Nguyễn Trà My', 'LH03', '2004-09-12', N'Thái Nguyên', N'Nữ', '0911222321'
---	Tạo thủ tục sửa tên sinh viên theo mã sinh viên
CREATE PROC edit_SV
@maSV VARCHAR(5), @tenSV NVARCHAR(30), @maLop CHAR(10), @ngaysinh date, @diachi nvarchar(20), @gioitinh nvarchar(5), @sodt CHAR(15)
AS
BEGIN
UPDATE dbo.tblSinhVien SET sTenSV = @tenSV, sMaLop = @maLop, dNgaySinh = @ngaysinh, sGioiTinh = @gioitinh, sDiaChi = @diachi, sSoDT = @sodt 
WHERE sMaSV = @maSV
END 
---	Cho biết danh sách môn (tên môn) của sinh viên đã học, với mã sinh viên là tham số truyền vào
CREATE PROC dsMH_SV_dahoc
@maSV VARCHAR(5)
AS
BEGIN
SELECT tblSinhVien.sMaSV, sTenSV, sTenMon
FROM dbo.tblSinhVien INNER JOIN dbo.tblBangDiem ON tblBangDiem.sMaSV = tblSinhVien.sMaSV
INNER JOIN dbo.tblMonHoc ON tblMonHoc.sMaMon = tblBangDiem.sMaMon
WHERE tblSinhVien.sMaSV = 'SV01'
END 
---	Tạo thủ tục chèn thêm 1 giáo viên mới(kiểm tra thỏa mãn điều kiện)

ALTER PROC insert_GV
@maGV CHAR(5), @tenGV NVARCHAR(30), @gioitinh nvarchar(5), @ngaysinh date, @maK CHAR(5), 
@luongCB float, @hsluong float, @ngayvaolam date, @sodt varchar(15)
AS 
BEGIN
IF(EXISTS(SELECT * FROM dbo.tblSinhVien WHERE sMaSV = @maGV)  )
BEGIN 
PRINT'This student has already existed.'
ROLLBACK TRAN
END 
IF (DATEDIFF(DAY, @ngaysinh, @ngayvaolam)/365 < 20)
BEGIN
PRINT'chua du tuoi lam giang vien'
ROLLBACK TRAN
END 
ELSE 
BEGIN 
INSERT INTO tblGiangVien VALUES(@maGV  , @tenGV , @gioitinh, @ngaysinh, @maK, 
@luongCB , @hsluong , @ngayvaolam , @sodt )
END 
END 
SELECT *FROM dbo.tblGiangVien
EXEC insert_GV 'GV01', N'SDJFDS', N'JD', '2000-01-01', 'CNTT', 1000, 0.1, '2023-01-01', '0988777651'

---	Tạo thủ tục cho danh sách các giáo viên nam thuộc khoa nào với tên khoa là tham số truyền vào
CREATE PROC GV_nam
@tenK varchar(30)
AS
BEGIN 
SELECT sMaGV, sTenGV FROM dbo.tblGiangVien INNER JOIN dbo.tblKhoa ON tblKhoa.sMaKhoa = tblGiangVien.sMaKhoa
WHERE sTenKhoa = N'Điện tử viễn thông' AND sGioiTinh = N'Nam'
END 
---	Tạo thủ tục cho danh sách các giáo viên sinh năm nào đó với năm là tham số truyền vào
CREATE PROC ds_GV_yearofbirth
@year int
AS 
BEGIN 
SELECT *FROM dbo.tblGiangVien WHERE YEAR(dNgaySinh) = @year
END 
---	Tạo thủ tục trích ra các sinh viên của @lop, @lop là tham số tuyền vào
CREATE PROC ds_SV_Lop
@tenLop varchar(30)
as 
BEGIN 
SELECT sMaSV, sTenSV FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop WHERE sTenLop = @tenLop
END 
--Tạo thủ tục tính số tiền học phải đóng của sinh viên, 
--với mã sinh viên là tham số truyền vào, số lượng tín chỉ của sinh viên đó là trả về. 
--Biết 1 TC là 378.000
ALTER PROC tinhtienhoc
@maSV VARCHAR(5), @tinhtienhoc float output
AS 
BEGIN 
IF(EXISTS (SELECT * FROM dbo.tblSinhVien WHERE sMaSV = @maSV))
BEGIN 
SELECT *FROM dbo.tblSinhVien WHERE sMaSV = @maSV
SELECT @tinhtienhoc = (SELECT SUM(iSoTC) FROM dbo.tblSinhVien INNER JOIN dbo.tblBangDiem ON tblBangDiem.sMaSV = tblSinhVien.sMaSV INNER JOIN dbo.tblMonHoc 
ON tblMonHoc.sMaMon = tblBangDiem.sMaMon WHERE tblSinhVien.sMaSV = @maSV GROUP BY tblSinhVien.sMaSV)
END 
ELSE 
BEGIN 
PRINT 'KHONG'
END 
END 
DECLARE @Sotien FLOAT  
EXEC tinhtienhoc 'SV08', @Sotien OUTPUT
SELECT @Sotien*378000 AS 'Số tiền sinh viên phải đóng'
--============ END CREATE PROC=========
--============ START CREATE TRIGGER====
---  tạo trigger tự động tăng giảm cột sĩ số trong lớp hành chính
SELECT *FROM dbo.tblLop
SELECT *FROM dbo.tblSinhVien
UPDATE dbo.tblLop SET iSiSo = view_lop.dem FROM dbo.tblLop INNER JOIN 
(SELECT tblSinhVien.sMaLop, COUNT(sMaSV) AS dem FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop   
GROUP BY tblSinhVien.sMaLop)
AS view_lop ON view_lop.sMaLop = tblLop.sMaLop  
ALTER TRIGGER auto_increase_SS ON tblSinhVien
FOR INSERT, DELETE
AS 
BEGIN 
UPDATE dbo.tblLop SET iSiSo = view_lop.dem FROM dbo.tblLop INNER JOIN 
(SELECT tblSinhVien.sMaLop, COUNT(sMaSV) AS dem FROM dbo.tblSinhVien INNER JOIN dbo.tblLop ON tblLop.sMaLop = tblSinhVien.sMaLop   GROUP BY tblSinhVien.sMaLop)
AS view_lop ON view_lop.sMaLop = tblLop.sMaLop 
PRINT'Da cap nhat thanh cong'
END  
INSERT INTO tblSinhVien VALUES('SV07',N'Vũ khánh Linh', 'LH03', '2001-09-08', N'Hà Nội', N'Nữ', '038309026')
DELETE FROM dbo.tblSinhVien WHERE sMaSV='SV07'
SELECT *FROM dbo.tblLop
--- Tạo trigger cập nhật với fDiemTK = 0.1*fDiemCC + 0.2*fDiemGK + 0.7*fDiemKTHP
SELECT *FROM dbo.tblBangDiem
ALTER TRIGGER update_mark ON tblBangDiem
FOR INSERT, UPDATE 
AS 
BEGIN 
UPDATE dbo.tblBangDiem SET dbo.tblBangDiem.fDiemTK= 0.1*dbo.tblBangDiem.fDiemCC+0.2*dbo.tblBangDiem.fDiemGK+0.7*dbo.tblBangDiem.fDiemKTHP 
FROM dbo.tblBangDiem, INSERTED WHERE dbo.tblBangDiem.sMaSV = inserted.sMaSV
END 
INSERT INTO tblBangDiem VALUES('SV03', 'LTW', 10, 9, 8)
--- Tạo trigger giới hạn số lượng giảng viên nữ của 1 khoa không được vượt quá 20 ==== CHƯA CHẠY
SELECT *FROM dbo.tblGiangVien
ALTER TRIGGER limit_GV_nu ON tblGiangVien
FOR INSERT 
AS 
IF(SELECT COUNT(dbo.tblGiangVien.sMaGV) AS [Số lượng giảng viên] FROM dbo.tblGiangVien AS GV INNER JOIN INSERTED AS INED ON dbo.tblGiangVien.sMaGV = INSERTED.sMaGV) > 5
BEGIN
PRINT'KHONG VUOT QUA 20 GV'
ROLLBACK TRAN
END  
INSERT INTO tblGiangVien VALUES('j', N'SDJ', N'JD', '2009-01-01', 'CNTT', 1000, 0.1, '2030-01-01', '098887156')
DELETE FROM tblGiangVien WHERE sTenGV = N'SDJ'
SELECT *FROM dbo.tblGiangVien
--- Số nv nam phải nhỏ hơn số nv nữ
ALTER TRIGGER SV_nam_nu ON dbo.tblSinhVien
FOR INSERT, UPDATE  
AS 
BEGIN
IF(SELECT COUNT(sv.sMaSV) FROM dbo.tblSinhVien AS sv WHERE sv.sGioiTinh = N'Nam') >=
(SELECT COUNT(sv.sMaSV) FROM dbo.tblSinhVien AS sv  WHERE sv.sGioiTinh = N'Nữ')
BEGIN
PRINT'sv nam phai it hon sv nu'
ROLLBACK TRAN
END 
END  
UPDATE dbo.tblSinhVien SET sGioiTinh = N'Nam' WHERE sMaSV = 'sv05'
SELECT *FROM dbo.tblSinhVien
---  Tuổi của nhân viên mới không quá 45 tuổi
CREATE TRIGGER gioihantuoiGV ON dbo.tblGiangVien
FOR INSERT, UPDATE 
AS 
BEGIN
IF(SELECT DATEDIFF(DAY, dbo.tblGiangVien.dNgaySinh, GETDATE()) FROM dbo.tblGiangVien, inserted WHERE dbo.tblGiangVien.sMaGV = inserted.sMaGV)/365 >= 45
BEGIN 
PRINT'Vuot  qua so tuoi quy dinh lam giang vien'
ROLLBACK TRAN
END 
END 
INSERT INTO tblGiangVien VALUES('GV06', N'Nguyễn Minh Anh', N'Nữ', '1930-01-01', 'DTVT', 1000, 0.1, '2023-01-01', '0988172634' )
SELECT *FROM dbo.tblGiangVien
--- Tạo trigger check số lượng môn học mà giảng viên dạy không được vượt quá 10
SELECT COUNT(sMaMon) FROM dbo.tblMonHoc GROUP BY sMaGV
SELECT *FROM dbo.tblMonHoc
CREATE TRIGGER gioihansomonGVday ON dbo.tblMonHoc
FOR INSERT, UPDATE 
AS BEGIN
      IF(SELECT  COUNT(dbo.tblMonHoc.sMaMon) FROM dbo.tblMonHoc, inserted WHERE dbo.tblMonHoc.sMaGV = inserted.sMaGV  GROUP BY dbo.tblMonHoc.sMaGV) > 2
	  BEGIN 
	  PRINT'Vuot qua so mon quy dinh duoc phep day'
	  ROLLBACK TRAN
	  END 
   END
---   DROP TRIGGER gioihansomonGVday
   INSERT INTO tblMonHoc VALUES('XSTK&TH', N'Xác suất thống kê và toán học', 3, 'GV01')
--- tạo trigger tự động tính điểm tổng môn của sinh viên khi nhập vào bảng điẻm
SELECT *FROM dbo.tblBangDiem
ALTER TRIGGER autocalculateMark_SV ON dbo.tblBangDiem
FOR INSERT
AS 
BEGIN
IF UPDATE(fDiemTK)
UPDATE dbo.tblBangDiem SET fDiemTK = bd.fDiemCC*0.1 + bd.fDiemGK*0.2 + bd.fDiemKTHP*0.7 
FROM dbo.tblBangDiem AS bd, INSERTED WHERE bd.sMaSV = inserted.sMaSV
PRINT 'sua thanh cong'
END 
INSERT INTO tblBangDiem(sMaSV, sMaMon, fDiemCC, fDiemGK, fDiemKTHP) VALUES ('SV02', 'LTW', 10, 9, 7)
--- Thêm cột iTongSoGV(mặc định = 0) vào bảng tblKhoa.
--Tạo trigger sao cho mỗi khi thêm một giảng viên thì tổng số giảng viên được tăng tương ứng với số lượng được nhập vào
--Bảng giảng viên với bảng học
--========= END CREATE TRIGGER=========
--========= START CREATE USER, LOGIN, DISTRIBUTED DATABASE====
CREATE LOGIN SV1 WITH PASSWORD = '12345'
CREATE USER SV1 FOR LOGIN SV1 WITH DEFAULT_SCHEMA = QuanLiSinhVien
CREATE ROLE QUANLISV
GRANT ALL ON dbo.tblMonHoc TO QUANLISV 
GRANT SELECT TO SV1
ALTER ROLE QUANLISV ADD MEMBER SV1
REVOKE ALL FROM QUANLISV

