using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PHIEUPHACHE_DTO
    {
        int maPhieuPhaChe;
        int soTheCho;
        String maHoaDon;
        DateTime ngayLap;
        int tinhTrang;

        public int TinhTrang
        {
            get { return tinhTrang; }
            set { tinhTrang = value; }
        }

        public DateTime NgayLap
        {
            get { return ngayLap; }
            set { ngayLap = value; }
        }

        public String MaHoaDon
        {
            get { return maHoaDon; }
            set { maHoaDon = value; }
        }

        public int SoTheCho
        {
            get { return soTheCho; }
            set { soTheCho = value; }
        }

        public int MaPhieuPhaChe
        {
            get { return maPhieuPhaChe; }
            set { maPhieuPhaChe = value; }
        }

        public PHIEUPHACHE_DTO(int stc, String mahd, DateTime nl, int tt)
        {
            soTheCho = stc;
            maHoaDon = mahd;
            ngayLap = nl;
            tinhTrang = tt;
        }
        public PHIEUPHACHE_DTO()
        {
           
        }
    }
}
