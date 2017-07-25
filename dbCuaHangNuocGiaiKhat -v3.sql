go
IF EXISTS(select * from sys.databases where name='dbCuaHangNuocGiaiKhat')
begin
use master
DROP DATABASE dbCuaHangNuocGiaiKhat
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
	DonGia money,-- do người nhập
	DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
	SoLuongChuyenDoi bigint,
	primary key (MaNguyenLieu),
)

go

CREATE TABLE SANPHAM -- sản phẩm
(
	MaSanPham int  identity primary key not null,
	MaLoaiSanPham int  ,
	TenSanPham nvarchar(100),
	GiaBan	money, -- do người nhập
	GhiChu nvarchar(200),
	foreign key (MaLoaiSanPham) references LOAISANPHAM(MaLoaiSanPham)
)

go

CREATE TABLE CHITIET_SANPHAM
(
	MaSanPham int,
	MaNguyenLieu int,
	SoLuong int,
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
create table PHONGBAN -- phòng ban
(
	MaPhongBan int identity primary key not null,
	TenPhongBan nvarchar(200)
	
)

go

create table NHANVIEN -- nhân viên
(
	MaNhanVien int identity primary key not null,
	MaPhongBan int,
	TenNhanVien nvarchar(200),
	DiaChi nvarchar(200),
	Email nvarchar(50),
	SoDienThoai int,
	GioiTinh	nvarchar(50),
	TinhTrang bit,
	foreign key (MaPhongBan) references PHONGBAN(MaPhongBan),

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
	DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
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

go

CREATE TABLE HOADON -- hoá đơn thanh toán 
(
	MaHoaDon int identity primary key not null,
	MaNhanVien int,
	NgayLap datetime,
	TongTien money,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
)

go

CREATE TABLE CHITIET_HOADON -- chi tiết hoá đơn
(
	MaHoaDon int ,
	MaSanPham int,
	SoLuong bigint,
	primary key (MaHoaDon, MaSanPham),
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
	foreign key (MaHoaDon) references HOADON(MaHoaDon),
)

go

CREATE TABLE SOCHO -- số chờ
(
	MaSoCho int  identity primary key,
	TinhTrang bit
)

go

CREATE TABLE PHIEUPHACHE -- phiếu yêu cầu pha chế
(
	MaPhieuPhaChe int primary key not null,
	MaSoCho int,
	MaHoaDon int  ,
	NgayLap datetime,
	TinhTrang bit ,
	foreign key (MaSoCho) references SOCHO(MaSoCho),
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


