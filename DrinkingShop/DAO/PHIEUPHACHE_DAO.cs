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
    public class PHIEUPHACHE_DAO
    {
        public static void sp_Them_PhieuPhaChe(PHIEUPHACHE_DTO ppc)
        {
            SqlConnection cnn = DBConnection.KetNoi();
            SqlCommand cnd = new SqlCommand("sp_Them_PhieuPhaChe", cnn);
            cnd.CommandType = CommandType.StoredProcedure;
            cnd.Parameters.Add("@SoTheCho", SqlDbType.Int);

            cnd.Parameters.Add("@MaHoaDon", SqlDbType.NVarChar, 200);

            cnd.Parameters.Add("@NgayLap", SqlDbType.DateTime);
            cnd.Parameters.Add("@TinhTrang", SqlDbType.Bit);


            cnd.Parameters["@SoTheCho"].Value = ppc.SoTheCho;
            cnd.Parameters["@MaHoaDon"].Value = ppc.MaHoaDon;

            cnd.Parameters["@NgayLap"].Value = ppc.NgayLap;

            cnd.Parameters["@TinhTrang"].Value = ppc.TinhTrang;




            cnn.Open();
            cnd.ExecuteNonQuery();
            cnn.Close();
        }
    }
}
