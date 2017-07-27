using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class LOAISANPHAM_DTO
    {
        int maLoaiSanPham;
        String tenLoaiSanPham;

        public String TenLoaiSanPham
        {
            get { return tenLoaiSanPham; }
            set { tenLoaiSanPham = value; }
        }

        public int MaLoaiSanPham
        {
            get { return maLoaiSanPham; }
            set { maLoaiSanPham = value; }
        }

       
    }
}
