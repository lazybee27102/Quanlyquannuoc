using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class CHITIET_SANPHAM_DAO
    {
        public static DataTable sp_Lay_ChiTiet_SanPham(int masp)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cmd = new SqlCommand("sp_Lay_ChiTiet_SanPham", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@MaSanPham", SqlDbType.Int);
            cmd.Parameters["@MaSanPham"].Value = masp;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtb = new DataTable();
            da.Fill(dtb);
            return dtb;
        }
        public static void sp_CapNhat_SoLuong_ChiTiet_SanPham(int masp,long sl)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cnd = new SqlCommand("sp_CapNhat_SoLuong_ChiTiet_SanPham", cnn);
            cnd.CommandType = CommandType.StoredProcedure;


            cnd.Parameters.Add("@MaSanPham", SqlDbType.Int);
            cnd.Parameters.Add("@SoLuong", SqlDbType.BigInt);



            cnd.Parameters["@MaSanPham"].Value = masp;

            cnd.Parameters["@SoLuong"].Value = sl;




            cnn.Open();
            cnd.ExecuteNonQuery();
            cnn.Close();
        }
    }
}
