using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class NGUYENLIEU_NHACUNGCAP_DTO
    {
        int maNguyenLieu;

        public int MaNguyenLieu
        {
            get { return maNguyenLieu; }
            set { maNguyenLieu = value; }
        }

        int maNhaCungCap;

        public int MaNhaCungCap
        {
            get { return maNhaCungCap; }
            set { maNhaCungCap = value; }
        }
    }
}
