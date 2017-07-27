using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SANPHAM_DTO
    {
        int maSanPham;
        int maLoaiSanPham;
        String tenSanPham;
        double giaBan;
        String donViBan;

        public String DonViBan
        {
            get { return donViBan; }
            set { donViBan = value; }
        }
        String ghiChu;

        
        public double GiaBan
        {
            get { return giaBan; }
            set { giaBan = value; }
        }

        public String TenSanPham
        {
            get { return tenSanPham; }
            set { tenSanPham = value; }
        }

        public int MaLoaiSanPham
        {
            get { return maLoaiSanPham; }
            set { maLoaiSanPham = value; }
        }

        public int MaSanPham
        {
            get { return maSanPham; }
            set { maSanPham = value; }
        }
        public String GhiChu
        {
            get { return ghiChu; }
            set { ghiChu = value; }
        }

       
    }
}
