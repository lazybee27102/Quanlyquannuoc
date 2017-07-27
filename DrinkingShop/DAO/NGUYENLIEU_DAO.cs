using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class NGUYENLIEU_DAO
    {
        public static DataTable sp_Lay_NguyenLieu(int manl)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cmd = new SqlCommand("sp_Lay_NguyenLieu", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@MaNguyenLieu", SqlDbType.Int);
            cmd.Parameters["@MaNguyenLieu"].Value = manl;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtb = new DataTable();
            da.Fill(dtb);
            return dtb;
        }
        public static void sp_CapNhat_SoLuong_NguyenLieu(int manl, long sl)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cnd = new SqlCommand("sp_CapNhat_SoLuong_NguyenLieu", cnn);
            cnd.CommandType = CommandType.StoredProcedure;


            cnd.Parameters.Add("@MaNguyenLieu", SqlDbType.Int);
            cnd.Parameters.Add("@SoLuongTon", SqlDbType.BigInt);

            cnd.Parameters["@MaNguyenLieu"].Value = manl;
            cnd.Parameters["@SoLuongTon"].Value = sl;

            cnn.Open();
            cnd.ExecuteNonQuery();
            cnn.Close();
        }
    }
}
