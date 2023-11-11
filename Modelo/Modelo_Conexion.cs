using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security.Claims;
using System.Data.OleDb;

namespace Modelo
{
    public class Modelo_Conexion
    {
        public static SqlConnection Connect()
        {
            SqlConnection GetConnection;
            try
            {
                // Creamos variables para asignar la conexión con Sql Server
                string server, database, user, pwd;
                server = "DESKTOP-AKPGMGL";
                database = "Library";
                user = "sa";
                pwd = "123456";

                // Creamos la cadena de conexión con la base de datos
                string ConnetionSql = "Data Source= " + server + ";Initial Catalog= " + database + ";User ID=" + user + ";Password=" + pwd + ";";
                GetConnection = new SqlConnection(ConnetionSql);
                GetConnection.Open();
                return GetConnection;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);
                return null;
            }
        }

        public static OleDbConnection ConnectOLDB()
        {
            OleDbConnection GetOLDBConnection = new OleDbConnection();
            try
            {
                // Creamos variables para asignar la conexión con Sql Server
                string server, database, user, pwd;
                server = "DESKTOP-AKPGMGL";
                database = "Library";
                user = "sa";
                pwd = "123456";

                // Creamos la cadena de conexión con la base de datos
                string sqlOLEDB = @"PROVIDER=SQLOLEDB;Server=" + server + ";Database=" + database + ";Uid=" + user + ";Pwd=" + pwd + "";
                GetOLDBConnection = new OleDbConnection(sqlOLEDB);
                GetOLDBConnection.Open();
                return GetOLDBConnection;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);
                return null;
            }
        }
    }
}
