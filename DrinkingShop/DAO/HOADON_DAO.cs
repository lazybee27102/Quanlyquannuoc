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
    public class HOADON_DAO
    {
        public static void sp_Them_HoaDon(HOADON_DTO hd)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cnd = new SqlCommand("sp_Them_HoaDon", cnn);
            cnd.CommandType = CommandType.StoredProcedure;

            cnd.Parameters.Add("@MaHoaDon", SqlDbType.NVarChar,200);
            cnd.Parameters.Add("@SoTheCho", SqlDbType.Int);

            cnd.Parameters.Add("@MaNhanVien", SqlDbType.Int);
            cnd.Parameters.Add("@NgayLap", SqlDbType.DateTime);
            cnd.Parameters.Add("@TongTien", SqlDbType.Money);
            cnd.Parameters.Add("@SoTienTra", SqlDbType.Money);


            cnd.Parameters["@MaHoaDon"].Value = hd.MaHoaDon;
            cnd.Parameters["@SoTheCho"].Value = hd.SoTheCho;

            cnd.Parameters["@MaNhanVien"].Value = hd.MaNhanVien;

            cnd.Parameters["@NgayLap"].Value = hd.NgayLap;
            cnd.Parameters["@TongTien"].Value = hd.TongTien;
            cnd.Parameters["@SoTienTra"].Value = hd.SoTienTra;

           


            cnn.Open();
            cnd.ExecuteNonQuery();
            cnn.Close();
        }
    }
}
