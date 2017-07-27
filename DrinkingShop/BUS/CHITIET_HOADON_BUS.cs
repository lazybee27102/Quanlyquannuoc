using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class CHITIET_HOADON_BUS
    {
        public static void sp_Them_ChiTiet_HoaDon(CHITIET_HOADON_DTO cthd)
        {
            CHITIET_HOADON_DAO.sp_Them_ChiTiet_HoaDon(cthd);
        }
    }
}
