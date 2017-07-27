using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class NGUYENLIEU_DTO
    {
        int maNguyenLieu;

        public int MaNguyenLieu
        {
            get { return maNguyenLieu; }
            set { maNguyenLieu = value; }
        }
        String tenNguyenLieu;

        public String TenNguyenLieu
        {
            get { return tenNguyenLieu; }
            set { tenNguyenLieu = value; }
        }
        long soLuongTon;

        public long SoLuongTon
        {
            get { return soLuongTon; }
            set { soLuongTon = value; }
        }
        String donViTinh;

        public String DonViTinh
        {
            get { return donViTinh; }
            set { donViTinh = value; }
        }
        
    }
}
