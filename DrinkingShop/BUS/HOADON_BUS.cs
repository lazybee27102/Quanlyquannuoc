using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class HOADON_BUS
    {
        public static void sp_Them_HoaDon(HOADON_DTO hd)
        {
            HOADON_DAO.sp_Them_HoaDon(hd);
        }
    }
}
