go
IF EXISTS(select * from sys.databases where name='dbCuaHangNuocGiaiKhat')
begin
use master
Drop database dbCuaHangNuocGiaiKhat
end
go
CREATE DATABASE dbCuaHangNuocGiaiKhat
go
USE dbCuaHangNuocGiaiKhat
go


CREATE TABLE NHACUNGCAP -- nhà cung cấp
(
	MaNhaCungCap	int identity primary key not null,
	TenNhaCungCap	nvarchar(100),
	DiaChiNhaCungCap nvarchar(200),
	SoDienThoai int,
	GhiChu nvarchar(500),
)

go

CREATE TABLE LOAISANPHAM -- loại sản phẩm
(
	MaLoaiSanPham	int identity,
	TenLoaiSanPham	nvarchar(100),
	primary key (MaLoaiSanPham),
)

go

CREATE TABLE DONVITINH -- đơn vị tính cho sản phẩm
(
	DonViTinh nvarchar(100) primary key,
)

go

CREATE TABLE NGUYENLIEU -- nguyên liệu
(
	MaNguyenLieu int  identity,
	TenNguyenLieu nvarchar(100),
	SoLuongTon	bigint,
	DonGiaNhap money,-- do người nhập
	DonViBan nvarchar(100) references DONVITINH(DonViTinh),
	DonViNhap nvarchar(100) references DONVITINH(DonViTinh),
	SoLuongChuyenDoi bigint,
	SoLuongToiThieu bigint,
	primary key (MaNguyenLieu),
)
go
CREATE TABLE SANPHAM -- sản phẩm
(
	MaSanPham int  identity primary key not null,
	MaLoaiSanPham int  ,
	TenSanPham nvarchar(100),
	GiaBan	money, -- do người nhập
	DonViBan nvarchar(100) references DONVITINH(DonViTinh),
	GhiChu nvarchar(200),
	foreign key (MaLoaiSanPham) references LOAISANPHAM(MaLoaiSanPham)
)
go

CREATE TABLE CHITIET_SANPHAM
(
	MaSanPham int,
	MaNguyenLieu int,
	SoLuong bigint,
	primary key (MaSanPham, MaNguyenLieu),
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu)
)

go

CREATE TABLE NGUYENLIEU_NHACUNGCAP -- nguyên liệu _ nhà cung cấp
(
	MaNguyenLieu	int,
	MaNhaCungCap	int,
	primary key(MaNguyenLieu, MaNhaCungCap),
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu),
	foreign key (MaNhaCungCap) references NHACUNGCAP(MaNhaCungCap),
)
go
-- Vừa Thêm
create table LOAINHANVIEN (-- 
	MaLoaiNhanVien int identity primary key not null,
	TenLoaiNhanVien nvarchar(200)
	
)

go

create table NHANVIEN -- nhân viên
(
	MaNhanVien int identity primary key not null,
	MaLoaiNhanVien int,
	TenNhanVien nvarchar(200),
	DiaChi nvarchar(200),
	Email nvarchar(50),
	SoDienThoai int,
	GioiTinh	nvarchar(50),
	TinhTrang bit,
	foreign key (MaLoaiNhanVien) references LOAINHANVIEN(MaLoaiNhanVien),

)



go

CREATE TABLE PHIEUMUAHANG 
(
	MaPhieuMuaHang int identity primary key not null,
	NgayLap datetime,
	MaNhanVien int,
	TongTien money,
	TinhTrang bit,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
)

go

CREATE TABLE CHITIET_PHIEUMUAHANG
(
	MaPhieuMuaHang int,
	MaNguyenLieu int,
	SoLuong bigint,
	--DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
	primary key (MaPhieuMuaHang, MaNguyenLieu),
	foreign key (MaPhieuMuaHang) references PHIEUMUAHANG(MaPhieuMuaHang),
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu)
)

go

CREATE TABLE PHIEUNHAP -- phiếu nhập
(
	MaPhieuNhap int identity primary key not null,
	MaPhieuMuaHang int,
	NgayLap datetime,
	MaNhanVien int,
	TongTien money,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
	foreign key (MaPhieuMuaHang) references PHIEUMUAHANG(MaPhieuMuaHang)
)


--go
--CREATE TABLE DATMON
--(
--	MaDatMon int identity primary key not null,
--	MaNhanVien int,
--	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
--)
--go

--CREATE TABLE CHITIET_DATMON -- chi tiết hoá đơn
--(
--	MaDatMon int ,
--	MaSanPham int,
--	SoLuong bigint,
--	primary key (MaDatMon, MaSanPham),
--	foreign key (MaSanPham) references SANPHAM(MaSanPham),
--	foreign key (MaDatMon) references DATMON(MaDatMon),
--)
go

CREATE TABLE HOADON -- hoá đơn thanh toán 
(
	MaHoaDon nvarchar(200) primary key,
	SoTheCho int,
	--MaDatMon int ,
	MaNhanVien int,
	NgayLap datetime,
	TongTien money,
	SoTienTra money,
	SoTienConLai  as TongTien - SoTienTra,
	--foreign key (MaDatMon) references DATMON(MaDatMon),

	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
)

go

CREATE TABLE CHITIET_HOADON -- chi tiết hoá đơn
(
	MaHoaDon nvarchar(200) ,
	MaSanPham int,
	SoLuong bigint,
	primary key (MaHoaDon, MaSanPham),
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
	foreign key (MaHoaDon) references HOADON(MaHoaDon),
)

go

--CREATE TABLE SOCHO -- số chờ
--(
--	MaSoCho int  identity primary key,
--	TinhTrang bit
--)

go

CREATE TABLE PHIEUPHACHE -- phiếu yêu cầu pha chế
(
	MaPhieuPhaChe int identity primary key not null,
	SoTheCho int,
	MaHoaDon nvarchar(200)  ,
	NgayLap datetime,
	TinhTrang bit ,
	foreign key (MaHoaDon) references HOADON(MaHoaDon),
)

go

CREATE TABLE PHIEUCHI
(
	MaPhieuChi int identity primary key not null,
	MaPhieuNhap int, 
	MaNhanVien int,
	NgayLap datetime,
	LyDoChi nvarchar(1000),
	TongTienChi money,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
	foreign key (MaPhieuNhap) references PHIEUNHAP(MaPhieuNhap)
)
go
CREATE TABLE BAOCAOTONKHO
(
	Ngay int,
	Thang int,
	Nam int,
	MaSanPham int foreign key references SANPHAM(MaSanPham),
	TonDau bigint,
	SoLuongNhap bigint,
	SoLuongBan bigint,
	TonCuoi as TonDau+SoLuongNhap-SoLuongBan,
	TrangThai nvarchar(200), --  còn hàng , hết hàng , sắp hết
	primary key (Ngay,Thang,Nam,MaSanPham)
)

