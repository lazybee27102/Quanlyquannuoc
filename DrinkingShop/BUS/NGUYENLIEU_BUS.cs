using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class NGUYENLIEU_BUS
    {
        public static DataTable sp_Lay_NguyenLieu(int manl)
        {
            return NGUYENLIEU_DAO.sp_Lay_NguyenLieu(manl);
        }
        public static void sp_CapNhat_SoLuong_NguyenLieu(int manl, long sl)
        {
            NGUYENLIEU_DAO.sp_CapNhat_SoLuong_NguyenLieu(manl, sl);
        }
    }
}
