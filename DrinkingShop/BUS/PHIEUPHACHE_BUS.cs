using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class PHIEUPHACHE_BUS
    {
        public static void sp_Them_PhieuPhaChe(PHIEUPHACHE_DTO ppc)
        {
            PHIEUPHACHE_DAO.sp_Them_PhieuPhaChe(ppc);
        }
    }
}
