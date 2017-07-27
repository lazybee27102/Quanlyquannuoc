using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HOADON_DTO
    {
        String maHoaDon;
        int soTheCho;

        public int SoTheCho
        {
            get { return soTheCho; }
            set { soTheCho = value; }
        }
        public String MaHoaDon
        {
            get { return maHoaDon; }
            set { maHoaDon = value; }
        }

        int maNhanVien;

        public int MaNhanVien
        {
            get { return maNhanVien; }
            set { maNhanVien = value; }
        }

        DateTime ngayLap;

        public DateTime NgayLap
        {
            get { return ngayLap; }
            set { ngayLap = value; }
        }

        double tongTien;

        public double TongTien
        {
            get { return tongTien; }
            set { tongTien = value; }
        }
        double soTienTra;

        public double SoTienTra
        {
            get { return soTienTra; }
            set { soTienTra = value; }
        }
        double soTienConLai;

        public double SoTienConLai
        {
            get { return soTienConLai; }
            set { soTienConLai = value; }
        }
        public HOADON_DTO()
        { }
        public HOADON_DTO(String mahd,int sothe,int manv, DateTime nl,double tt,double str)
        {
            maHoaDon = mahd;
            soTheCho = sothe;
            maNhanVien = manv;
            ngayLap = nl;
            tongTien = tt;
            soTienTra = str;
        }
    }
}
