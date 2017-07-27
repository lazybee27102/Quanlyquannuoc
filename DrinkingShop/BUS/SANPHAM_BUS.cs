using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class SANPHAM_BUS
    {
        public static DataTable sp_DanhSachSanPham()
        {
            return SANPHAM_DAO.sp_DanhSachSanPham();
        }
    }
}
