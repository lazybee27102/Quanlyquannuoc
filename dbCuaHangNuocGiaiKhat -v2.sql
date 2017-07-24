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
	MaNhaCungCap	int identity primary key ,
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
CREATE TABLE SANPHAM -- sản phẩm
(
	MaSanPham int  identity,
	MaLoaiSanPham int  ,
	TenSanPham nvarchar(100),
	DonGia	money,
	DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
	SoLuongTon	bigint,
	DuocPhaChe bit ,
	primary key (MaSanPham),
	foreign key (MaLoaiSanPham) references LOAISANPHAM(MaLoaiSanPham),
)
go
CREATE TABLE SANPHAM_NHACUNGCAP -- sản phẩm _ nhà cung cấp
(
	MaSanPham	int ,
	MaNhaCungCap	int,
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
	foreign key (MaNhaCungCap) references NHACUNGCAP(MaNhaCungCap),
)
go
CREATE TABLE NGUYENLIEU -- nguyên liệu
(
	MaNguyenLieu int  identity,
	TenNguyenLieu nvarchar(100),
	SoLuongTon	bigint,
	DonViTinh nvarchar(100) references DONVITINH(DonViTinh),
	primary key (MaNguyenLieu),
)
go
CREATE TABLE NGUYENLIEU_NHACUNGCAP -- nguyên liệu _ nhà cung cấp
(
	MaNguyenLieu	int ,
	MaNhaCungCap	int,
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu),
	foreign key (MaNhaCungCap) references NHACUNGCAP(MaNhaCungCap),
)
go
CREATE TABLE PHACHE -- pha chế
(
	MaPhaChe int identity primary key ,
	MaSanPham	int not null unique,
	foreign key (MaSanPham) references SANPHAM(MaSanPham),
)
go
CREATE TABLE CHITIET_PHACHE -- chi tiết pha chế
(
	MaPhaChe int ,
	MaNguyenLieu int  ,
	SoLuongNguyenLieuPhaChe bigint ,
	foreign key (MaPhaChe) references PHACHE(MaPhaChe),
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu),
)

go
create table NHANVIEN -- nhân viên
(
MaNhanVien int identity primary key,
TenNhanVien nvarchar(200),
DiaChi nvarchar(200),
Email nvarchar(50),
SoDienThoai int,
GioiTinh	nvarchar(50),
TinhTrang bit
)
go
CREATE TABLE PHIEUNHAP -- phiếu nhập
(
	MaPhieuNhap int identity primary key not null,
	NgayLap datetime,
	MaNhanVien int,
	TongTien money,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
)
go
CREATE TABLE CHITIET_PHIEUNHAP_SANPHAM -- chi tiết phiếu nhập cho sản phẩm
(
	MaPhieuNhap int  ,
	MaSanPham int ,
	DonViTinh nvarchar(100),
	SoLuongNhap int,
	DonGiaNhap	money,
	SoLuongQuyDoi int,
	ThanhTien as SoLuongNhap*DonGiaNhap,
	primary key (MaPhieuNhap,MaSanPham),
	foreign key (MaPhieuNhap) references PHIEUNHAP(MaPhieuNhap),
	foreign key (DonViTinh) references DONVITINH(DonViTinh),
	foreign key (MaSanPham) references SANPHAM(MaSanPham)
)
go
CREATE TABLE CHITIET_PHIEUNHAP_NGUYENLIEU -- chi tiết phiếu nhập cho nguyên liệu
(
	MaPhieuNhap int  ,
	MaNguyenLieu int ,
	DonViTinh nvarchar(100),
	SoLuongNhap int,
	DonGiaNhap	money,
	SoLuongQuyDoi int,
	ThanhTien as SoLuongNhap*DonGiaNhap,
	primary key (MaPhieuNhap,MaNguyenLieu),
	foreign key (MaPhieuNhap) references PHIEUNHAP(MaPhieuNhap),
	foreign key (DonViTinh) references DONVITINH(DonViTinh),
	foreign key (MaNguyenLieu) references NGUYENLIEU(MaNguyenLieu)
)
go
CREATE TABLE HOADON -- hoá đơn thanh toán 
(
	MaHoaDon nvarchar(200) primary key,
	MaNhanVien int,
	NgayLap datetime ,
	TongTien money,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
)
go
CREATE TABLE CHITIET_HOADON -- chi tiết hoá đơn
(
	MaHoaDon nvarchar(200)  ,
	MaSanPham int ,
	SoLuong int ,
	DonGia money,
	ThanhTien as SoLuong*DonGia,
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
	MaPhieuPhaChe nvarchar(200)  primary key,
	MaSoCho int ,
	MaHoaDon nvarchar(200) ,
	NgayLap datetime,
	TinhTrang bit ,
	foreign key (MaSoCho) references SOCHO(MaSoCho),
	foreign key (MaHoaDon) references HOADON(MaHoaDon),
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
	MaPhieuMuaHang int  ,
	TenHangHoa nvarchar(500),
	DonViTinh nvarchar(100),
	SoLuong int,
	DonGia	money,
	ThanhTien as SoLuong*DonGia,
	primary key (MaPhieuMuaHang),
	foreign key (MaPhieuMuaHang) references PHIEUMUAHANG(MaPhieuMuaHang),
	foreign key (DonViTinh) references DONVITINH(DonViTinh),
)
go
CREATE TABLE PHIEUCHI
(
	MaPhieuChi int identity primary key not null,
	MaNhanVien int,
	NgayLap datetime,
	TenNhaCungCap nvarchar(100),
	DiaChi nvarchar(500),
	NguoiNhanTien nvarchar(100),
	LyDoChi nvarchar(1000),
	TongTienChi money,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien),
)


