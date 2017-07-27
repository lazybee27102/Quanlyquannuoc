USE dbCuaHangNuocGiaiKhat

-----------------------------------------------SANPHAM-----------------------------------------------------
go
CREATE PROC sp_DanhSachSanPham
AS
BEGIN
		SELECT *
		FROM SANPHAM 
END
-----------------------------------------------HOADON-----------------------------------------------------
go
CREATE PROC sp_Them_HoaDon
(
@MaHoaDon nvarchar(200),
@SoTheCho	int,
@MaNhanVien	int,
@NgayLap	datetime,
@TongTien money,
@SoTienTra money
)
AS
BEGIN
		INSERT INTO HOADON VALUES(@MaHoaDon,@SoTheCho,@MaNhanVien,@NgayLap,@TongTien,@SoTienTra)
END

-----------------------------------------------CHITIET_HOADON-----------------------------------------------------
go
CREATE PROC sp_Them_ChiTiet_HoaDon
(
@MaHoaDon nvarchar(200),
@MaSanPham	int,
@SoLuong bigint
)
AS
BEGIN
		INSERT INTO CHITIET_HOADON VALUES(@MaHoaDon,@MaSanPham,@SoLuong)
END
-----------------------------------------------CHITIET_SANPHAM-----------------------------------------------------
go
CREATE PROC sp_Lay_ChiTiet_SanPham
(
@MaSanPham	int
)
AS
BEGIN
		SELECT * FROM
		CHITIET_SANPHAM
		WHERE MaSanPham=@MaSanPham
END
go
CREATE PROC sp_CapNhat_SoLuong_ChiTiet_SanPham
(
@MaSanPham	int,
@SoLuong bigint
)
AS
BEGIN
		UPDATE CHITIET_SANPHAM
		SET SoLuong=@SoLuong
		WHERE MaSanPham=@MaSanPham
END
-----------------------------------------------NGUYENLIEU-----------------------------------------------------
go
CREATE PROC sp_Lay_NguyenLieu
(
@MaNguyenLieu	int
)
AS
BEGIN
		SELECT * FROM
		NGUYENLIEU
		WHERE MaNguyenLieu=@MaNguyenLieu
END
go
CREATE PROC sp_CapNhat_SoLuong_NguyenLieu
(
@MaNguyenLieu	int,
@SoLuongTon bigint
)
AS
BEGIN
		UPDATE NGUYENLIEU
		SET SoLuongTon=@SoLuongTon
		WHERE MaNguyenLieu=@MaNguyenLieu
END

-----------------------------------------------YEUCAUPHACHE-----------------------------------------------------
go
CREATE PROC sp_Them_PhieuPhaChe
(
@SoTheCho int,
@MaHoaDon	nvarchar(200),
@NgayLap datetime,
@TinhTrang bit
)
AS
BEGIN
		INSERT INTO PHIEUPHACHE VALUES(@SoTheCho,@MaHoaDon,@NgayLap,@TinhTrang)
END