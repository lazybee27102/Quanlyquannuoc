using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class NHACUNGCAP_DTO
    {
        int maNhaCungCap;
        String tenNhaCungCap;
        String diaChiNhaCungCap;
        int soDienThoai;
        String ghiChu;
       

        public NHACUNGCAP_DTO()
        {
        }

        public NHACUNGCAP_DTO(String tenncc, String dc, int sdt, String ghichunhacc)
        {
            tenNhaCungCap = tenncc;
            diaChiNhaCungCap = dc;
            soDienThoai = sdt;
            ghiChu = ghichunhacc;
        }

        public String GhiChu
        {
            get { return ghiChu; }
            set { ghiChu = value; }
        }

        public int SoDienThoai
        {
            get { return soDienThoai; }
            set { soDienThoai = value; }
        }

        public String DiaChiNhaCungCap
        {
            get { return diaChiNhaCungCap; }
            set { diaChiNhaCungCap = value; }
        }

        public String TenNhaCungCap
        {
            get { return tenNhaCungCap; }
            set { tenNhaCungCap = value; }
        }

        public int MaNhaCungCap
        {
            get { return maNhaCungCap; }
            set { maNhaCungCap = value; }
        }
    }
}
