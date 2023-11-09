using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace Modelo
{
    public class Modelo_Login
    {
        public static bool LoginData(string User, string Pwd)
        {
            // Esta variable sirve como una promesa de tipo Booleana con la cual si hay datos en la tabla los evalúa y realiza un Login sin encriptacion:
            bool response = false;
            try
            {
                // Query para traer los datos de la base
                string SelectQuery = "SELECT * FROM [library].[employee] WHERE username_employee = @User AND password_employee = @Pwd;";
                // Instancia para realizar instancia para la conexión con el Servidor
                SqlConnection GetConnet = Modelo_Conexion.Connect();
                SqlCommand GetUser = new SqlCommand(SelectQuery, GetConnet);

                // Mandamos los datos como parámetros en la consulta para la base:
                GetUser.Parameters.AddWithValue("@User", User);
                GetUser.Parameters.AddWithValue("@Pwd", Pwd);

                // Creamos un objeto de la la librería Sql para verificar si hay datos en la tabla y los iteramos con un ciclo
                SqlDataReader read = GetUser.ExecuteReader();
                if (read.Read()) 
                {
                    response = true;
                }

                // Cerramos la conexión para que pueda ser utilizada en otros métodos
                GetConnet.Close();
                return response;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);
                return false;
            }
        }
    }
}
