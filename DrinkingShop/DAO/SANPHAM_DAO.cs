using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class SANPHAM_DAO
    {
        public static DataTable sp_DanhSachSanPham()
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cmd = new SqlCommand("sp_DanhSachSanPham", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtb = new DataTable();
            da.Fill(dtb);
            return dtb;
        }
    }
}
