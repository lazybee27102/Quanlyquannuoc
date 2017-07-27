using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public static class DBConnection
    {
        public static string severName;
        public static SqlConnection KetNoi()
        {
            try
            {
                return new SqlConnection(@"Data Source=DESKTOP-085R96B;Initial Catalog=dbCuaHangNuocGiaiKhat;Integrated Security=True");

            }
            catch
            {
                return null;
            }
        }
    }
}
