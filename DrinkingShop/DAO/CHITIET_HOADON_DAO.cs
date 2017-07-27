using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class CHITIET_HOADON_DAO
    {
        public static void sp_Them_ChiTiet_HoaDon(CHITIET_HOADON_DTO hd)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cnd = new SqlCommand("sp_Them_ChiTiet_HoaDon", cnn);
            cnd.CommandType = CommandType.StoredProcedure;

            cnd.Parameters.Add("@MaHoaDon", SqlDbType.NVarChar, 200);

            cnd.Parameters.Add("@MaSanPham", SqlDbType.Int);
            cnd.Parameters.Add("@SoLuong", SqlDbType.BigInt);


            cnd.Parameters["@MaHoaDon"].Value = hd.MaHoaDon;

            cnd.Parameters["@MaSanPham"].Value = hd.MaSanPham;

            cnd.Parameters["@SoLuong"].Value = hd.SoLuong;




            cnn.Open();
            cnd.ExecuteNonQuery();
            cnn.Close();
        }
    }
}
