using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class CHITIET_SANPHAM_BUS
    {
        public static DataTable sp_Lay_ChiTiet_SanPham(int masp)
        {
            return CHITIET_SANPHAM_DAO.sp_Lay_ChiTiet_SanPham(masp);
        }
        public static void sp_CapNhat_SoLuong_ChiTiet_SanPham(int masp,long sl)
        {
            CHITIET_SANPHAM_DAO.sp_CapNhat_SoLuong_ChiTiet_SanPham(masp,sl);
        }
    }
}
