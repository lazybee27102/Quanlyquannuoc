go
IF EXISTS(select * from sys.databases where name='dbDrinkingShop')
begin
use master
DROP DATABASE dbDrinkingShop
end
go
CREATE DATABASE dbDrinkingShop
go
USE dbDrinkingShop
go


CREATE TABLE NHACUNGCAP
(
	MaNhaCungCap	int identity primary key ,
	TenNhaCungCap	nvarchar(100),
	DiaChi nvarchar(200),
	SDT int,
	GhiChuNhaCungCap nvarchar(500),
)
go
CREATE TABLE LOAISANPHAM
(
	MaLoaiSanPham	int identity,
	TenLoaiSanPham	nvarchar(100),
	primary key ( MaLoaiSanPham),
)

go
CREATE TABLE DONVITINH
(
	DonViTinh nvarchar(100) primary key,
)
go
CREATE TABLE SANPHAM
(
	MaSanPham int  identity,
	MaLoaiSanPham int  ,
	TenSanPham nvarchar(100),
	DonGiaBan	money,
	DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
	SoLuongTon	bigint,
	DuocPhaChe bit ,
	primary key (MaSanPham),
	foreign key (MaLoaiSanPham) references LOAISANPHAM(MaLoaiSanPham),
)
go
CREATE TABLE SANPHAM_NHACUNGCAP
(
	MaSanPham	int ,
	MaNhaCungCap	int,
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
	foreign key (MaNhaCungCap) references NHACUNGCAP(MaNhaCungCap),
)
go
CREATE TABLE NGUYENLIEU
(
	MaNguyenLieu int  identity,
	TenNguyenLieu nvarchar(100),
	SoLuongTon	bigint,
	DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
	primary key (MaNguyenLieu),
)
go
CREATE TABLE NGUYENLIEU_NHACUNGCAP
(
	MaNguyenLieu	int ,
	MaNhaCungCap	int,
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu),
	foreign key (MaNhaCungCap) references NHACUNGCAP(MaNhaCungCap),
)
go
CREATE TABLE PHACHE
(
	MaPhaChe int identity primary key ,
	MaSanPham	int not null unique,
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
)
go
CREATE TABLE CHITIET_PHACHE
(
	MaPhaChe int ,
	MaNguyenLieu int  ,
	SoLuongNguyenLieuPhaChe bigint ,
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu),
)

go
create table NHANVIEN(
MaNhanVien int identity primary key,
HoTen nvarchar(200),
DiaChi nvarchar(200),
Email nvarchar(50),
SDT int,
GioiTinh	nvarchar(50),
)
go
CREATE TABLE PHIEUNHAP
(
	MaPhieuNhap int identity primary key not null,
	NgayNhap datetime,
	NguoiNhap int,
	TongTien money,
	TonTai bit,
	foreign key (NguoiNhap) references NHANVIEN(MaNhanVien),
)
go
CREATE TABLE CHITIET_PHIEUNHAP_SANPHAM
(
	MaPhieuNhap int  ,
	MaSanPham int ,
	DonViTinh nvarchar(100),
	SoLuongNhap int,
	DonGiaNhap	money,
	SoLuongQuyDoi int,
	ThanhTien as SoLuongNhap*DonGiaNhap,
	TonTai bit,
	primary key (MaPhieuNhap,MaSanPham),
	foreign key (MaPhieuNhap) references PHIEUNHAP(MaPhieuNhap),
	foreign key (DonViTinh) references DONVITINH(DonViTinh),
	foreign key (MaSanPham) references SANPHAM(MaSanPham)
)
go
CREATE TABLE CHITIET_PHIEUNHAP_NGUYENLIEU
(
	MaPhieuNhap int  ,
	MaNguyenLieu int ,
	DonViTinh nvarchar(100),
	SoLuongNhap int,
	DonGiaNhap	money,
	SoLuongQuyDoi int,
	ThanhTien as SoLuongNhap*DonGiaNhap,
	TonTai bit,
	primary key (MaPhieuNhap,MaNguyenLieu),
	foreign key (MaPhieuNhap) references PHIEUNHAP(MaPhieuNhap),
	foreign key (DonViTinh) references DONVITINH(DonViTinh),
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu),
)


