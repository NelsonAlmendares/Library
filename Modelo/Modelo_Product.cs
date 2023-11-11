using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Modelo_Product
    {
        public static void InsertProduct(int Brand, string Name, double Price, int Status, int Distributor, int Availability)
        {
            
            try
            {
                // Query para insertar los datos en la base
                string InsertQuery;
                InsertQuery = "INSERT INTO [library].[products] ([product_brand], [product_name], [product_price], [id_productStatus], [id_productDistributor], [id_availability])";
                InsertQuery += "VALUES(@brand,@name,@price,@status,@distributor,@availability)";

                // Instancia para realizar instancia para la conexión con el Servidor
                SqlConnection GetConnet = Modelo_Conexion.Connect();
                SqlCommand InsertProduct = new SqlCommand(InsertQuery, GetConnet);

                // Mandamos los datos como parámetros en la consulta para la base:
                InsertProduct.Parameters.Add(new SqlParameter("@brand",SqlDbType.Int));
                InsertProduct.Parameters["@brand"].Value = Brand;
                InsertProduct.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar));
                InsertProduct.Parameters["@name"].Value = Name;
                InsertProduct.Parameters.Add(new SqlParameter("@price", SqlDbType.Decimal));
                InsertProduct.Parameters["@price"].Value = Price;
                InsertProduct.Parameters.Add(new SqlParameter("@status", SqlDbType.Int));
                InsertProduct.Parameters["@status"].Value = Status;
                InsertProduct.Parameters.Add(new SqlParameter("@distributor", SqlDbType.Int));
                InsertProduct.Parameters["@distributor"].Value = Distributor;
                InsertProduct.Parameters.Add(new SqlParameter("@availability", SqlDbType.Int));
                InsertProduct.Parameters["@availability"].Value = Availability;

                // Ejecutamos el query para insertar los datos 
                InsertProduct.ExecuteNonQuery();                

                // Cerramos la conexión para que pueda ser utilizada en otros métodos
                GetConnet.Close();                
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);                
            }
        }

       public static void DeleteProduct(int Id)
        {
            SqlConnection GetConnet = Modelo_Conexion.Connect();
            try
            {                
                GetConnet.Open();

                string consulta = "DELETE FROM [library].[products] WHERE [id_product] = " + Id;
                SqlCommand eliminar = new SqlCommand(consulta, GetConnet);

                eliminar.ExecuteNonQuery();
                Console.WriteLine("Registro eliminado exitosamente");                
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);
            }
            finally
            {
                GetConnet.Close();
            }
        }
        public static void ModifyProduct(int Id, int Brand, string Name, double Price, int Status, int Distributor, int Availability)
        {
            SqlConnection GetConnet = Modelo_Conexion.Connect();
            OleDbConnection GetOLDB = Modelo_Conexion.ConnectOLDB();
            try
            {
                GetConnet.Open();

                string actualizar;
                actualizar = "UPDATE [library].[products] SET ";
                actualizar += "[product_brand]= " + Brand + ", [product_name]= '" + Name + "', [product_price]= " + Price + ", [id_productStatus]= " + Status + ", [id_productDistributor]= " + Distributor + ", [id_availability]= " + Availability + "  WHERE [id_product] = " + Id;

                OleDbCommand datos = new OleDbCommand(actualizar, GetOLDB);
                GetOLDB.Open();

                datos.ExecuteNonQuery();
                Console.WriteLine("Registro actualizado exitosamente");                
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);
            }
            finally
            {
                GetConnet.Open();
                GetOLDB.Close();
            }
        }
    }
}
