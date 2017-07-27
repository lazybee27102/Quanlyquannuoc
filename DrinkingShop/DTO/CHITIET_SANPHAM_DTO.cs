using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class CHITIET_SANPHAM_DTO
    {
        int maSanPham;
        int maNguyenLieu;
        long soLuong;

        public long SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }

        public int MaNguyenLieu
        {
            get { return maNguyenLieu; }
            set { maNguyenLieu = value; }
        }

        public int MaSanPham
        {
            get { return maSanPham; }
            set { maSanPham = value; }
        }
    }
}
