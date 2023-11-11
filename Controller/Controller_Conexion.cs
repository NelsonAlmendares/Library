using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Modelo;
using System.Data.OleDb;

namespace Controller
{
    public class Controller_Conexion
    {
        public static SqlConnection Connect() 
        {
            return Modelo_Conexion.Connect();
        }
        public static OleDbConnection OLDBConnect()
        {
            return Modelo_Conexion.ConnectOLDB();
        }
    }
}
