USE [dbCuaHangNuocGiaiKhat];
GO

IF OBJECT_ID('[dbo].[usp_BAOCAOTONKHOSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BAOCAOTONKHOSelect] 
END 
GO
CREATE PROC [dbo].[usp_BAOCAOTONKHOSelect] 
    @Ngay int,
    @Thang int,
    @Nam int,
    @MaSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Ngay], [Thang], [Nam], [MaSanPham], [TonDau], [SoLuongNhap], [SoLuongBan], [TonCuoi], [TrangThai] 
	FROM   [dbo].[BAOCAOTONKHO] 
	WHERE  ([Ngay] = @Ngay OR @Ngay IS NULL) 
	       AND ([Thang] = @Thang OR @Thang IS NULL) 
	       AND ([Nam] = @Nam OR @Nam IS NULL) 
	       AND ([MaSanPham] = @MaSanPham OR @MaSanPham IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_BAOCAOTONKHOInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BAOCAOTONKHOInsert] 
END 
GO
CREATE PROC [dbo].[usp_BAOCAOTONKHOInsert] 
    @Ngay int,
    @Thang int,
    @Nam int,
    @MaSanPham int,
    @TonDau bigint = NULL,
    @SoLuongNhap bigint = NULL,
    @SoLuongBan bigint = NULL,
    @TonCuoi bigint = NULL,
    @TrangThai nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[BAOCAOTONKHO] ([Ngay], [Thang], [Nam], [MaSanPham], [TonDau], [SoLuongNhap], [SoLuongBan], [TrangThai])
	SELECT @Ngay, @Thang, @Nam, @MaSanPham, @TonDau, @SoLuongNhap, @SoLuongBan, @TrangThai
	
	-- Begin Return Select <- do not remove
	SELECT [Ngay], [Thang], [Nam], [MaSanPham], [TonDau], [SoLuongNhap], [SoLuongBan], [TonCuoi], [TrangThai]
	FROM   [dbo].[BAOCAOTONKHO]
	WHERE  [Ngay] = @Ngay
	       AND [Thang] = @Thang
	       AND [Nam] = @Nam
	       AND [MaSanPham] = @MaSanPham
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_BAOCAOTONKHOUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BAOCAOTONKHOUpdate] 
END 
GO
CREATE PROC [dbo].[usp_BAOCAOTONKHOUpdate] 
    @Ngay int,
    @Thang int,
    @Nam int,
    @MaSanPham int,
    @TonDau bigint = NULL,
    @SoLuongNhap bigint = NULL,
    @SoLuongBan bigint = NULL,
    @TonCuoi bigint = NULL,
    @TrangThai nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[BAOCAOTONKHO]
	SET    [Ngay] = @Ngay, [Thang] = @Thang, [Nam] = @Nam, [MaSanPham] = @MaSanPham, [TonDau] = @TonDau, [SoLuongNhap] = @SoLuongNhap, [SoLuongBan] = @SoLuongBan, [TrangThai] = @TrangThai
	WHERE  [Ngay] = @Ngay
	       AND [Thang] = @Thang
	       AND [Nam] = @Nam
	       AND [MaSanPham] = @MaSanPham
	
	-- Begin Return Select <- do not remove
	SELECT [Ngay], [Thang], [Nam], [MaSanPham], [TonDau], [SoLuongNhap], [SoLuongBan], [TonCuoi], [TrangThai]
	FROM   [dbo].[BAOCAOTONKHO]
	WHERE  [Ngay] = @Ngay
	       AND [Thang] = @Thang
	       AND [Nam] = @Nam
	       AND [MaSanPham] = @MaSanPham	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_BAOCAOTONKHODelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BAOCAOTONKHODelete] 
END 
GO
CREATE PROC [dbo].[usp_BAOCAOTONKHODelete] 
    @Ngay int,
    @Thang int,
    @Nam int,
    @MaSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[BAOCAOTONKHO]
	WHERE  [Ngay] = @Ngay
	       AND [Thang] = @Thang
	       AND [Nam] = @Nam
	       AND [MaSanPham] = @MaSanPham

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_CHITIET_HOADONSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_HOADONSelect] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_HOADONSelect] 
    @MaHoaDon nvarchar(200),
    @MaSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaHoaDon], [MaSanPham], [SoLuong] 
	FROM   [dbo].[CHITIET_HOADON] 
	WHERE  ([MaHoaDon] = @MaHoaDon OR @MaHoaDon IS NULL) 
	       AND ([MaSanPham] = @MaSanPham OR @MaSanPham IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_HOADONInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_HOADONInsert] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_HOADONInsert] 
    @MaHoaDon nvarchar(200),
    @MaSanPham int,
    @SoLuong bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[CHITIET_HOADON] ([MaHoaDon], [MaSanPham], [SoLuong])
	SELECT @MaHoaDon, @MaSanPham, @SoLuong
	
	-- Begin Return Select <- do not remove
	SELECT [MaHoaDon], [MaSanPham], [SoLuong]
	FROM   [dbo].[CHITIET_HOADON]
	WHERE  [MaHoaDon] = @MaHoaDon
	       AND [MaSanPham] = @MaSanPham
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_HOADONUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_HOADONUpdate] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_HOADONUpdate] 
    @MaHoaDon nvarchar(200),
    @MaSanPham int,
    @SoLuong bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[CHITIET_HOADON]
	SET    [MaHoaDon] = @MaHoaDon, [MaSanPham] = @MaSanPham, [SoLuong] = @SoLuong
	WHERE  [MaHoaDon] = @MaHoaDon
	       AND [MaSanPham] = @MaSanPham
	
	-- Begin Return Select <- do not remove
	SELECT [MaHoaDon], [MaSanPham], [SoLuong]
	FROM   [dbo].[CHITIET_HOADON]
	WHERE  [MaHoaDon] = @MaHoaDon
	       AND [MaSanPham] = @MaSanPham	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_HOADONDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_HOADONDelete] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_HOADONDelete] 
    @MaHoaDon nvarchar(200),
    @MaSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[CHITIET_HOADON]
	WHERE  [MaHoaDon] = @MaHoaDon
	       AND [MaSanPham] = @MaSanPham

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_CHITIET_PHIEUMUAHANGSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_PHIEUMUAHANGSelect] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_PHIEUMUAHANGSelect] 
    @MaPhieuMuaHang int,
    @MaNguyenLieu int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaPhieuMuaHang], [MaNguyenLieu], [SoLuong] 
	FROM   [dbo].[CHITIET_PHIEUMUAHANG] 
	WHERE  ([MaPhieuMuaHang] = @MaPhieuMuaHang OR @MaPhieuMuaHang IS NULL) 
	       AND ([MaNguyenLieu] = @MaNguyenLieu OR @MaNguyenLieu IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_PHIEUMUAHANGInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_PHIEUMUAHANGInsert] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_PHIEUMUAHANGInsert] 
    @MaPhieuMuaHang int,
    @MaNguyenLieu int,
    @SoLuong bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[CHITIET_PHIEUMUAHANG] ([MaPhieuMuaHang], [MaNguyenLieu], [SoLuong])
	SELECT @MaPhieuMuaHang, @MaNguyenLieu, @SoLuong
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuMuaHang], [MaNguyenLieu], [SoLuong]
	FROM   [dbo].[CHITIET_PHIEUMUAHANG]
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang
	       AND [MaNguyenLieu] = @MaNguyenLieu
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_PHIEUMUAHANGUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_PHIEUMUAHANGUpdate] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_PHIEUMUAHANGUpdate] 
    @MaPhieuMuaHang int,
    @MaNguyenLieu int,
    @SoLuong bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[CHITIET_PHIEUMUAHANG]
	SET    [MaPhieuMuaHang] = @MaPhieuMuaHang, [MaNguyenLieu] = @MaNguyenLieu, [SoLuong] = @SoLuong
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang
	       AND [MaNguyenLieu] = @MaNguyenLieu
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuMuaHang], [MaNguyenLieu], [SoLuong]
	FROM   [dbo].[CHITIET_PHIEUMUAHANG]
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang
	       AND [MaNguyenLieu] = @MaNguyenLieu	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_PHIEUMUAHANGDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_PHIEUMUAHANGDelete] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_PHIEUMUAHANGDelete] 
    @MaPhieuMuaHang int,
    @MaNguyenLieu int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[CHITIET_PHIEUMUAHANG]
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang
	       AND [MaNguyenLieu] = @MaNguyenLieu

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_CHITIET_SANPHAMSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_SANPHAMSelect] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_SANPHAMSelect] 
    @MaSanPham int,
    @MaNguyenLieu int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaSanPham], [MaNguyenLieu], [SoLuong] 
	FROM   [dbo].[CHITIET_SANPHAM] 
	WHERE  ([MaSanPham] = @MaSanPham OR @MaSanPham IS NULL) 
	       AND ([MaNguyenLieu] = @MaNguyenLieu OR @MaNguyenLieu IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_SANPHAMInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_SANPHAMInsert] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_SANPHAMInsert] 
    @MaSanPham int,
    @MaNguyenLieu int,
    @SoLuong bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[CHITIET_SANPHAM] ([MaSanPham], [MaNguyenLieu], [SoLuong])
	SELECT @MaSanPham, @MaNguyenLieu, @SoLuong
	
	-- Begin Return Select <- do not remove
	SELECT [MaSanPham], [MaNguyenLieu], [SoLuong]
	FROM   [dbo].[CHITIET_SANPHAM]
	WHERE  [MaSanPham] = @MaSanPham
	       AND [MaNguyenLieu] = @MaNguyenLieu
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_SANPHAMUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_SANPHAMUpdate] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_SANPHAMUpdate] 
    @MaSanPham int,
    @MaNguyenLieu int,
    @SoLuong bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[CHITIET_SANPHAM]
	SET    [MaSanPham] = @MaSanPham, [MaNguyenLieu] = @MaNguyenLieu, [SoLuong] = @SoLuong
	WHERE  [MaSanPham] = @MaSanPham
	       AND [MaNguyenLieu] = @MaNguyenLieu
	
	-- Begin Return Select <- do not remove
	SELECT [MaSanPham], [MaNguyenLieu], [SoLuong]
	FROM   [dbo].[CHITIET_SANPHAM]
	WHERE  [MaSanPham] = @MaSanPham
	       AND [MaNguyenLieu] = @MaNguyenLieu	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CHITIET_SANPHAMDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CHITIET_SANPHAMDelete] 
END 
GO
CREATE PROC [dbo].[usp_CHITIET_SANPHAMDelete] 
    @MaSanPham int,
    @MaNguyenLieu int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[CHITIET_SANPHAM]
	WHERE  [MaSanPham] = @MaSanPham
	       AND [MaNguyenLieu] = @MaNguyenLieu

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_DONVITINHSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_DONVITINHSelect] 
END 
GO
CREATE PROC [dbo].[usp_DONVITINHSelect] 
    @DonViTinh nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [DonViTinh] 
	FROM   [dbo].[DONVITINH] 
	WHERE  ([DonViTinh] = @DonViTinh OR @DonViTinh IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_DONVITINHInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_DONVITINHInsert] 
END 
GO
CREATE PROC [dbo].[usp_DONVITINHInsert] 
    @DonViTinh nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[DONVITINH] ([DonViTinh])
	SELECT @DonViTinh
	
	-- Begin Return Select <- do not remove
	SELECT [DonViTinh]
	FROM   [dbo].[DONVITINH]
	WHERE  [DonViTinh] = @DonViTinh
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_DONVITINHUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_DONVITINHUpdate] 
END 
GO
CREATE PROC [dbo].[usp_DONVITINHUpdate] 
    @DonViTinh nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[DONVITINH]
	SET    [DonViTinh] = @DonViTinh
	WHERE  [DonViTinh] = @DonViTinh
	
	-- Begin Return Select <- do not remove
	SELECT [DonViTinh]
	FROM   [dbo].[DONVITINH]
	WHERE  [DonViTinh] = @DonViTinh	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_DONVITINHDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_DONVITINHDelete] 
END 
GO
CREATE PROC [dbo].[usp_DONVITINHDelete] 
    @DonViTinh nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[DONVITINH]
	WHERE  [DonViTinh] = @DonViTinh

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_HOADONSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_HOADONSelect] 
END 
GO
CREATE PROC [dbo].[usp_HOADONSelect] 
    @MaHoaDon nvarchar(200)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaHoaDon], [SoTheCho], [MaNhanVien], [NgayLap], [TongTien], [SoTienTra], [SoTienConLai] 
	FROM   [dbo].[HOADON] 
	WHERE  ([MaHoaDon] = @MaHoaDon OR @MaHoaDon IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_HOADONInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_HOADONInsert] 
END 
GO
CREATE PROC [dbo].[usp_HOADONInsert] 
    @MaHoaDon nvarchar(200),
    @SoTheCho int = NULL,
    @MaNhanVien int = NULL,
    @NgayLap datetime = NULL,
    @TongTien money = NULL,
    @SoTienTra money = NULL,
    @SoTienConLai money = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[HOADON] ([MaHoaDon], [SoTheCho], [MaNhanVien], [NgayLap], [TongTien], [SoTienTra])
	SELECT @MaHoaDon, @SoTheCho, @MaNhanVien, @NgayLap, @TongTien, @SoTienTra
	
	-- Begin Return Select <- do not remove
	SELECT [MaHoaDon], [SoTheCho], [MaNhanVien], [NgayLap], [TongTien], [SoTienTra], [SoTienConLai]
	FROM   [dbo].[HOADON]
	WHERE  [MaHoaDon] = @MaHoaDon
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_HOADONUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_HOADONUpdate] 
END 
GO
CREATE PROC [dbo].[usp_HOADONUpdate] 
    @MaHoaDon nvarchar(200),
    @SoTheCho int = NULL,
    @MaNhanVien int = NULL,
    @NgayLap datetime = NULL,
    @TongTien money = NULL,
    @SoTienTra money = NULL,
    @SoTienConLai money = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[HOADON]
	SET    [MaHoaDon] = @MaHoaDon, [SoTheCho] = @SoTheCho, [MaNhanVien] = @MaNhanVien, [NgayLap] = @NgayLap, [TongTien] = @TongTien, [SoTienTra] = @SoTienTra
	WHERE  [MaHoaDon] = @MaHoaDon
	
	-- Begin Return Select <- do not remove
	SELECT [MaHoaDon], [SoTheCho], [MaNhanVien], [NgayLap], [TongTien], [SoTienTra], [SoTienConLai]
	FROM   [dbo].[HOADON]
	WHERE  [MaHoaDon] = @MaHoaDon	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_HOADONDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_HOADONDelete] 
END 
GO
CREATE PROC [dbo].[usp_HOADONDelete] 
    @MaHoaDon nvarchar(200)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[HOADON]
	WHERE  [MaHoaDon] = @MaHoaDon

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_LOAINHANVIENSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAINHANVIENSelect] 
END 
GO
CREATE PROC [dbo].[usp_LOAINHANVIENSelect] 
    @MaLoaiNhanVien int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaLoaiNhanVien], [TenLoaiNhanVien] 
	FROM   [dbo].[LOAINHANVIEN] 
	WHERE  ([MaLoaiNhanVien] = @MaLoaiNhanVien OR @MaLoaiNhanVien IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_LOAINHANVIENInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAINHANVIENInsert] 
END 
GO
CREATE PROC [dbo].[usp_LOAINHANVIENInsert] 
    @TenLoaiNhanVien nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[LOAINHANVIEN] ([TenLoaiNhanVien])
	SELECT @TenLoaiNhanVien
	
	-- Begin Return Select <- do not remove
	SELECT [MaLoaiNhanVien], [TenLoaiNhanVien]
	FROM   [dbo].[LOAINHANVIEN]
	WHERE  [MaLoaiNhanVien] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_LOAINHANVIENUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAINHANVIENUpdate] 
END 
GO
CREATE PROC [dbo].[usp_LOAINHANVIENUpdate] 
    @MaLoaiNhanVien int,
    @TenLoaiNhanVien nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[LOAINHANVIEN]
	SET    [TenLoaiNhanVien] = @TenLoaiNhanVien
	WHERE  [MaLoaiNhanVien] = @MaLoaiNhanVien
	
	-- Begin Return Select <- do not remove
	SELECT [MaLoaiNhanVien], [TenLoaiNhanVien]
	FROM   [dbo].[LOAINHANVIEN]
	WHERE  [MaLoaiNhanVien] = @MaLoaiNhanVien	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_LOAINHANVIENDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAINHANVIENDelete] 
END 
GO
CREATE PROC [dbo].[usp_LOAINHANVIENDelete] 
    @MaLoaiNhanVien int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[LOAINHANVIEN]
	WHERE  [MaLoaiNhanVien] = @MaLoaiNhanVien

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_LOAISANPHAMSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAISANPHAMSelect] 
END 
GO
CREATE PROC [dbo].[usp_LOAISANPHAMSelect] 
    @MaLoaiSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaLoaiSanPham], [TenLoaiSanPham] 
	FROM   [dbo].[LOAISANPHAM] 
	WHERE  ([MaLoaiSanPham] = @MaLoaiSanPham OR @MaLoaiSanPham IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_LOAISANPHAMInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAISANPHAMInsert] 
END 
GO
CREATE PROC [dbo].[usp_LOAISANPHAMInsert] 
    @TenLoaiSanPham nvarchar(100) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[LOAISANPHAM] ([TenLoaiSanPham])
	SELECT @TenLoaiSanPham
	
	-- Begin Return Select <- do not remove
	SELECT [MaLoaiSanPham], [TenLoaiSanPham]
	FROM   [dbo].[LOAISANPHAM]
	WHERE  [MaLoaiSanPham] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_LOAISANPHAMUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAISANPHAMUpdate] 
END 
GO
CREATE PROC [dbo].[usp_LOAISANPHAMUpdate] 
    @MaLoaiSanPham int,
    @TenLoaiSanPham nvarchar(100) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[LOAISANPHAM]
	SET    [TenLoaiSanPham] = @TenLoaiSanPham
	WHERE  [MaLoaiSanPham] = @MaLoaiSanPham
	
	-- Begin Return Select <- do not remove
	SELECT [MaLoaiSanPham], [TenLoaiSanPham]
	FROM   [dbo].[LOAISANPHAM]
	WHERE  [MaLoaiSanPham] = @MaLoaiSanPham	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_LOAISANPHAMDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_LOAISANPHAMDelete] 
END 
GO
CREATE PROC [dbo].[usp_LOAISANPHAMDelete] 
    @MaLoaiSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[LOAISANPHAM]
	WHERE  [MaLoaiSanPham] = @MaLoaiSanPham

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_NGUYENLIEUSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEUSelect] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEUSelect] 
    @MaNguyenLieu int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaNguyenLieu], [TenNguyenLieu], [SoLuongTon], [DonGiaNhap], [DonViBan], [DonViNhap], [SoLuongChuyenDoi], [SoLuongToiThieu] 
	FROM   [dbo].[NGUYENLIEU] 
	WHERE  ([MaNguyenLieu] = @MaNguyenLieu OR @MaNguyenLieu IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NGUYENLIEUInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEUInsert] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEUInsert] 
    @TenNguyenLieu nvarchar(100) = NULL,
    @SoLuongTon bigint = NULL,
    @DonGiaNhap money = NULL,
    @DonViBan nvarchar(100) = NULL,
    @DonViNhap nvarchar(100) = NULL,
    @SoLuongChuyenDoi bigint = NULL,
    @SoLuongToiThieu bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[NGUYENLIEU] ([TenNguyenLieu], [SoLuongTon], [DonGiaNhap], [DonViBan], [DonViNhap], [SoLuongChuyenDoi], [SoLuongToiThieu])
	SELECT @TenNguyenLieu, @SoLuongTon, @DonGiaNhap, @DonViBan, @DonViNhap, @SoLuongChuyenDoi, @SoLuongToiThieu
	
	-- Begin Return Select <- do not remove
	SELECT [MaNguyenLieu], [TenNguyenLieu], [SoLuongTon], [DonGiaNhap], [DonViBan], [DonViNhap], [SoLuongChuyenDoi], [SoLuongToiThieu]
	FROM   [dbo].[NGUYENLIEU]
	WHERE  [MaNguyenLieu] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NGUYENLIEUUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEUUpdate] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEUUpdate] 
    @MaNguyenLieu int,
    @TenNguyenLieu nvarchar(100) = NULL,
    @SoLuongTon bigint = NULL,
    @DonGiaNhap money = NULL,
    @DonViBan nvarchar(100) = NULL,
    @DonViNhap nvarchar(100) = NULL,
    @SoLuongChuyenDoi bigint = NULL,
    @SoLuongToiThieu bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[NGUYENLIEU]
	SET    [TenNguyenLieu] = @TenNguyenLieu, [SoLuongTon] = @SoLuongTon, [DonGiaNhap] = @DonGiaNhap, [DonViBan] = @DonViBan, [DonViNhap] = @DonViNhap, [SoLuongChuyenDoi] = @SoLuongChuyenDoi, [SoLuongToiThieu] = @SoLuongToiThieu
	WHERE  [MaNguyenLieu] = @MaNguyenLieu
	
	-- Begin Return Select <- do not remove
	SELECT [MaNguyenLieu], [TenNguyenLieu], [SoLuongTon], [DonGiaNhap], [DonViBan], [DonViNhap], [SoLuongChuyenDoi], [SoLuongToiThieu]
	FROM   [dbo].[NGUYENLIEU]
	WHERE  [MaNguyenLieu] = @MaNguyenLieu	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NGUYENLIEUDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEUDelete] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEUDelete] 
    @MaNguyenLieu int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[NGUYENLIEU]
	WHERE  [MaNguyenLieu] = @MaNguyenLieu

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_NGUYENLIEU_NHACUNGCAPSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPSelect] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPSelect] 
    @MaNguyenLieu int,
    @MaNhaCungCap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaNguyenLieu], [MaNhaCungCap] 
	FROM   [dbo].[NGUYENLIEU_NHACUNGCAP] 
	WHERE  ([MaNguyenLieu] = @MaNguyenLieu OR @MaNguyenLieu IS NULL) 
	       AND ([MaNhaCungCap] = @MaNhaCungCap OR @MaNhaCungCap IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NGUYENLIEU_NHACUNGCAPInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPInsert] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPInsert] 
    @MaNguyenLieu int,
    @MaNhaCungCap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[NGUYENLIEU_NHACUNGCAP] ([MaNguyenLieu], [MaNhaCungCap])
	SELECT @MaNguyenLieu, @MaNhaCungCap
	
	-- Begin Return Select <- do not remove
	SELECT [MaNguyenLieu], [MaNhaCungCap]
	FROM   [dbo].[NGUYENLIEU_NHACUNGCAP]
	WHERE  [MaNguyenLieu] = @MaNguyenLieu
	       AND [MaNhaCungCap] = @MaNhaCungCap
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NGUYENLIEU_NHACUNGCAPUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPUpdate] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPUpdate] 
    @MaNguyenLieu int,
    @MaNhaCungCap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[NGUYENLIEU_NHACUNGCAP]
	SET    [MaNguyenLieu] = @MaNguyenLieu, [MaNhaCungCap] = @MaNhaCungCap
	WHERE  [MaNguyenLieu] = @MaNguyenLieu
	       AND [MaNhaCungCap] = @MaNhaCungCap
	
	-- Begin Return Select <- do not remove
	SELECT [MaNguyenLieu], [MaNhaCungCap]
	FROM   [dbo].[NGUYENLIEU_NHACUNGCAP]
	WHERE  [MaNguyenLieu] = @MaNguyenLieu
	       AND [MaNhaCungCap] = @MaNhaCungCap	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NGUYENLIEU_NHACUNGCAPDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPDelete] 
END 
GO
CREATE PROC [dbo].[usp_NGUYENLIEU_NHACUNGCAPDelete] 
    @MaNguyenLieu int,
    @MaNhaCungCap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[NGUYENLIEU_NHACUNGCAP]
	WHERE  [MaNguyenLieu] = @MaNguyenLieu
	       AND [MaNhaCungCap] = @MaNhaCungCap

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_NHACUNGCAPSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHACUNGCAPSelect] 
END 
GO
CREATE PROC [dbo].[usp_NHACUNGCAPSelect] 
    @MaNhaCungCap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoai], [GhiChu] 
	FROM   [dbo].[NHACUNGCAP] 
	WHERE  ([MaNhaCungCap] = @MaNhaCungCap OR @MaNhaCungCap IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NHACUNGCAPInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHACUNGCAPInsert] 
END 
GO
CREATE PROC [dbo].[usp_NHACUNGCAPInsert] 
    @TenNhaCungCap nvarchar(100) = NULL,
    @DiaChiNhaCungCap nvarchar(200) = NULL,
    @SoDienThoai int = NULL,
    @GhiChu nvarchar(500) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[NHACUNGCAP] ([TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoai], [GhiChu])
	SELECT @TenNhaCungCap, @DiaChiNhaCungCap, @SoDienThoai, @GhiChu
	
	-- Begin Return Select <- do not remove
	SELECT [MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoai], [GhiChu]
	FROM   [dbo].[NHACUNGCAP]
	WHERE  [MaNhaCungCap] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NHACUNGCAPUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHACUNGCAPUpdate] 
END 
GO
CREATE PROC [dbo].[usp_NHACUNGCAPUpdate] 
    @MaNhaCungCap int,
    @TenNhaCungCap nvarchar(100) = NULL,
    @DiaChiNhaCungCap nvarchar(200) = NULL,
    @SoDienThoai int = NULL,
    @GhiChu nvarchar(500) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[NHACUNGCAP]
	SET    [TenNhaCungCap] = @TenNhaCungCap, [DiaChiNhaCungCap] = @DiaChiNhaCungCap, [SoDienThoai] = @SoDienThoai, [GhiChu] = @GhiChu
	WHERE  [MaNhaCungCap] = @MaNhaCungCap
	
	-- Begin Return Select <- do not remove
	SELECT [MaNhaCungCap], [TenNhaCungCap], [DiaChiNhaCungCap], [SoDienThoai], [GhiChu]
	FROM   [dbo].[NHACUNGCAP]
	WHERE  [MaNhaCungCap] = @MaNhaCungCap	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NHACUNGCAPDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHACUNGCAPDelete] 
END 
GO
CREATE PROC [dbo].[usp_NHACUNGCAPDelete] 
    @MaNhaCungCap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[NHACUNGCAP]
	WHERE  [MaNhaCungCap] = @MaNhaCungCap

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_NHANVIENSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHANVIENSelect] 
END 
GO
CREATE PROC [dbo].[usp_NHANVIENSelect] 
    @MaNhanVien int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaNhanVien], [MaLoaiNhanVien], [TenNhanVien], [DiaChi], [Email], [SoDienThoai], [GioiTinh], [TinhTrang] 
	FROM   [dbo].[NHANVIEN] 
	WHERE  ([MaNhanVien] = @MaNhanVien OR @MaNhanVien IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NHANVIENInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHANVIENInsert] 
END 
GO
CREATE PROC [dbo].[usp_NHANVIENInsert] 
    @MaLoaiNhanVien int = NULL,
    @TenNhanVien nvarchar(200) = NULL,
    @DiaChi nvarchar(200) = NULL,
    @Email nvarchar(50) = NULL,
    @SoDienThoai int = NULL,
    @GioiTinh nvarchar(50) = NULL,
    @TinhTrang bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[NHANVIEN] ([MaLoaiNhanVien], [TenNhanVien], [DiaChi], [Email], [SoDienThoai], [GioiTinh], [TinhTrang])
	SELECT @MaLoaiNhanVien, @TenNhanVien, @DiaChi, @Email, @SoDienThoai, @GioiTinh, @TinhTrang
	
	-- Begin Return Select <- do not remove
	SELECT [MaNhanVien], [MaLoaiNhanVien], [TenNhanVien], [DiaChi], [Email], [SoDienThoai], [GioiTinh], [TinhTrang]
	FROM   [dbo].[NHANVIEN]
	WHERE  [MaNhanVien] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NHANVIENUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHANVIENUpdate] 
END 
GO
CREATE PROC [dbo].[usp_NHANVIENUpdate] 
    @MaNhanVien int,
    @MaLoaiNhanVien int = NULL,
    @TenNhanVien nvarchar(200) = NULL,
    @DiaChi nvarchar(200) = NULL,
    @Email nvarchar(50) = NULL,
    @SoDienThoai int = NULL,
    @GioiTinh nvarchar(50) = NULL,
    @TinhTrang bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[NHANVIEN]
	SET    [MaLoaiNhanVien] = @MaLoaiNhanVien, [TenNhanVien] = @TenNhanVien, [DiaChi] = @DiaChi, [Email] = @Email, [SoDienThoai] = @SoDienThoai, [GioiTinh] = @GioiTinh, [TinhTrang] = @TinhTrang
	WHERE  [MaNhanVien] = @MaNhanVien
	
	-- Begin Return Select <- do not remove
	SELECT [MaNhanVien], [MaLoaiNhanVien], [TenNhanVien], [DiaChi], [Email], [SoDienThoai], [GioiTinh], [TinhTrang]
	FROM   [dbo].[NHANVIEN]
	WHERE  [MaNhanVien] = @MaNhanVien	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_NHANVIENDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_NHANVIENDelete] 
END 
GO
CREATE PROC [dbo].[usp_NHANVIENDelete] 
    @MaNhanVien int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[NHANVIEN]
	WHERE  [MaNhanVien] = @MaNhanVien

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_PHIEUCHISelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUCHISelect] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUCHISelect] 
    @MaPhieuChi int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaPhieuChi], [MaPhieuNhap], [MaNhanVien], [NgayLap], [LyDoChi], [TongTienChi] 
	FROM   [dbo].[PHIEUCHI] 
	WHERE  ([MaPhieuChi] = @MaPhieuChi OR @MaPhieuChi IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUCHIInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUCHIInsert] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUCHIInsert] 
    @MaPhieuNhap int = NULL,
    @MaNhanVien int = NULL,
    @NgayLap datetime = NULL,
    @LyDoChi nvarchar(1000) = NULL,
    @TongTienChi money = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[PHIEUCHI] ([MaPhieuNhap], [MaNhanVien], [NgayLap], [LyDoChi], [TongTienChi])
	SELECT @MaPhieuNhap, @MaNhanVien, @NgayLap, @LyDoChi, @TongTienChi
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuChi], [MaPhieuNhap], [MaNhanVien], [NgayLap], [LyDoChi], [TongTienChi]
	FROM   [dbo].[PHIEUCHI]
	WHERE  [MaPhieuChi] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUCHIUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUCHIUpdate] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUCHIUpdate] 
    @MaPhieuChi int,
    @MaPhieuNhap int = NULL,
    @MaNhanVien int = NULL,
    @NgayLap datetime = NULL,
    @LyDoChi nvarchar(1000) = NULL,
    @TongTienChi money = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[PHIEUCHI]
	SET    [MaPhieuNhap] = @MaPhieuNhap, [MaNhanVien] = @MaNhanVien, [NgayLap] = @NgayLap, [LyDoChi] = @LyDoChi, [TongTienChi] = @TongTienChi
	WHERE  [MaPhieuChi] = @MaPhieuChi
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuChi], [MaPhieuNhap], [MaNhanVien], [NgayLap], [LyDoChi], [TongTienChi]
	FROM   [dbo].[PHIEUCHI]
	WHERE  [MaPhieuChi] = @MaPhieuChi	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUCHIDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUCHIDelete] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUCHIDelete] 
    @MaPhieuChi int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[PHIEUCHI]
	WHERE  [MaPhieuChi] = @MaPhieuChi

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_PHIEUMUAHANGSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUMUAHANGSelect] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUMUAHANGSelect] 
    @MaPhieuMuaHang int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien], [TinhTrang] 
	FROM   [dbo].[PHIEUMUAHANG] 
	WHERE  ([MaPhieuMuaHang] = @MaPhieuMuaHang OR @MaPhieuMuaHang IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUMUAHANGInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUMUAHANGInsert] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUMUAHANGInsert] 
    @NgayLap datetime = NULL,
    @MaNhanVien int = NULL,
    @TongTien money = NULL,
    @TinhTrang bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[PHIEUMUAHANG] ([NgayLap], [MaNhanVien], [TongTien], [TinhTrang])
	SELECT @NgayLap, @MaNhanVien, @TongTien, @TinhTrang
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien], [TinhTrang]
	FROM   [dbo].[PHIEUMUAHANG]
	WHERE  [MaPhieuMuaHang] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUMUAHANGUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUMUAHANGUpdate] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUMUAHANGUpdate] 
    @MaPhieuMuaHang int,
    @NgayLap datetime = NULL,
    @MaNhanVien int = NULL,
    @TongTien money = NULL,
    @TinhTrang bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[PHIEUMUAHANG]
	SET    [NgayLap] = @NgayLap, [MaNhanVien] = @MaNhanVien, [TongTien] = @TongTien, [TinhTrang] = @TinhTrang
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien], [TinhTrang]
	FROM   [dbo].[PHIEUMUAHANG]
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUMUAHANGDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUMUAHANGDelete] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUMUAHANGDelete] 
    @MaPhieuMuaHang int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[PHIEUMUAHANG]
	WHERE  [MaPhieuMuaHang] = @MaPhieuMuaHang

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_PHIEUNHAPSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUNHAPSelect] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUNHAPSelect] 
    @MaPhieuNhap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaPhieuNhap], [MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien] 
	FROM   [dbo].[PHIEUNHAP] 
	WHERE  ([MaPhieuNhap] = @MaPhieuNhap OR @MaPhieuNhap IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUNHAPInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUNHAPInsert] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUNHAPInsert] 
    @MaPhieuMuaHang int = NULL,
    @NgayLap datetime = NULL,
    @MaNhanVien int = NULL,
    @TongTien money = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[PHIEUNHAP] ([MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien])
	SELECT @MaPhieuMuaHang, @NgayLap, @MaNhanVien, @TongTien
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuNhap], [MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien]
	FROM   [dbo].[PHIEUNHAP]
	WHERE  [MaPhieuNhap] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUNHAPUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUNHAPUpdate] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUNHAPUpdate] 
    @MaPhieuNhap int,
    @MaPhieuMuaHang int = NULL,
    @NgayLap datetime = NULL,
    @MaNhanVien int = NULL,
    @TongTien money = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[PHIEUNHAP]
	SET    [MaPhieuMuaHang] = @MaPhieuMuaHang, [NgayLap] = @NgayLap, [MaNhanVien] = @MaNhanVien, [TongTien] = @TongTien
	WHERE  [MaPhieuNhap] = @MaPhieuNhap
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuNhap], [MaPhieuMuaHang], [NgayLap], [MaNhanVien], [TongTien]
	FROM   [dbo].[PHIEUNHAP]
	WHERE  [MaPhieuNhap] = @MaPhieuNhap	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUNHAPDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUNHAPDelete] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUNHAPDelete] 
    @MaPhieuNhap int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[PHIEUNHAP]
	WHERE  [MaPhieuNhap] = @MaPhieuNhap

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_PHIEUPHACHESelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUPHACHESelect] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUPHACHESelect] 
    @MaPhieuPhaChe int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaPhieuPhaChe], [SoTheCho], [MaHoaDon], [NgayLap], [TinhTrang] 
	FROM   [dbo].[PHIEUPHACHE] 
	WHERE  ([MaPhieuPhaChe] = @MaPhieuPhaChe OR @MaPhieuPhaChe IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUPHACHEInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUPHACHEInsert] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUPHACHEInsert] 
    @SoTheCho int = NULL,
    @MaHoaDon nvarchar(200) = NULL,
    @NgayLap datetime = NULL,
    @TinhTrang bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[PHIEUPHACHE] ([SoTheCho], [MaHoaDon], [NgayLap], [TinhTrang])
	SELECT @SoTheCho, @MaHoaDon, @NgayLap, @TinhTrang
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuPhaChe], [SoTheCho], [MaHoaDon], [NgayLap], [TinhTrang]
	FROM   [dbo].[PHIEUPHACHE]
	WHERE  [MaPhieuPhaChe] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUPHACHEUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUPHACHEUpdate] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUPHACHEUpdate] 
    @MaPhieuPhaChe int,
    @SoTheCho int = NULL,
    @MaHoaDon nvarchar(200) = NULL,
    @NgayLap datetime = NULL,
    @TinhTrang bit = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[PHIEUPHACHE]
	SET    [SoTheCho] = @SoTheCho, [MaHoaDon] = @MaHoaDon, [NgayLap] = @NgayLap, [TinhTrang] = @TinhTrang
	WHERE  [MaPhieuPhaChe] = @MaPhieuPhaChe
	
	-- Begin Return Select <- do not remove
	SELECT [MaPhieuPhaChe], [SoTheCho], [MaHoaDon], [NgayLap], [TinhTrang]
	FROM   [dbo].[PHIEUPHACHE]
	WHERE  [MaPhieuPhaChe] = @MaPhieuPhaChe	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_PHIEUPHACHEDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_PHIEUPHACHEDelete] 
END 
GO
CREATE PROC [dbo].[usp_PHIEUPHACHEDelete] 
    @MaPhieuPhaChe int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[PHIEUPHACHE]
	WHERE  [MaPhieuPhaChe] = @MaPhieuPhaChe

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_SANPHAMSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_SANPHAMSelect] 
END 
GO
CREATE PROC [dbo].[usp_SANPHAMSelect] 
    @MaSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [MaSanPham], [MaLoaiSanPham], [TenSanPham], [GiaBan], [DonViBan], [GhiChu] 
	FROM   [dbo].[SANPHAM] 
	WHERE  ([MaSanPham] = @MaSanPham OR @MaSanPham IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_SANPHAMInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_SANPHAMInsert] 
END 
GO
CREATE PROC [dbo].[usp_SANPHAMInsert] 
    @MaLoaiSanPham int = NULL,
    @TenSanPham nvarchar(100) = NULL,
    @GiaBan money = NULL,
    @DonViBan nvarchar(100) = NULL,
    @GhiChu nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[SANPHAM] ([MaLoaiSanPham], [TenSanPham], [GiaBan], [DonViBan], [GhiChu])
	SELECT @MaLoaiSanPham, @TenSanPham, @GiaBan, @DonViBan, @GhiChu
	
	-- Begin Return Select <- do not remove
	SELECT [MaSanPham], [MaLoaiSanPham], [TenSanPham], [GiaBan], [DonViBan], [GhiChu]
	FROM   [dbo].[SANPHAM]
	WHERE  [MaSanPham] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_SANPHAMUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_SANPHAMUpdate] 
END 
GO
CREATE PROC [dbo].[usp_SANPHAMUpdate] 
    @MaSanPham int,
    @MaLoaiSanPham int = NULL,
    @TenSanPham nvarchar(100) = NULL,
    @GiaBan money = NULL,
    @DonViBan nvarchar(100) = NULL,
    @GhiChu nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[SANPHAM]
	SET    [MaLoaiSanPham] = @MaLoaiSanPham, [TenSanPham] = @TenSanPham, [GiaBan] = @GiaBan, [DonViBan] = @DonViBan, [GhiChu] = @GhiChu
	WHERE  [MaSanPham] = @MaSanPham
	
	-- Begin Return Select <- do not remove
	SELECT [MaSanPham], [MaLoaiSanPham], [TenSanPham], [GiaBan], [DonViBan], [GhiChu]
	FROM   [dbo].[SANPHAM]
	WHERE  [MaSanPham] = @MaSanPham	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_SANPHAMDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_SANPHAMDelete] 
END 
GO
CREATE PROC [dbo].[usp_SANPHAMDelete] 
    @MaSanPham int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[SANPHAM]
	WHERE  [MaSanPham] = @MaSanPham

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

