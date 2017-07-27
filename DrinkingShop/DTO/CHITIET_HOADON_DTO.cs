using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class CHITIET_HOADON_DTO
    {
        String maHoaDon;
        int maSanPham;
        long soLuong;

        public long SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }

        public int MaSanPham
        {
            get { return maSanPham; }
            set { maSanPham = value; }
        }

        public String MaHoaDon
        {
            get { return maHoaDon; }
            set { maHoaDon = value; }
        }
    }
}
