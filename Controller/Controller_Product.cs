using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class Controller_Product
    {
        // Constructor de la clase con el cual asignamos valor a las variables que toman datos de la vista
        public Controller_Product() { }
        public int Id { get; set; }
        public int Brand { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public int Status { get; set; }
        public int Distributor { get; set; }
        public int Availability { get; set; }

        // Método con el cual llamamos el Modelo con el Query de datos y retornar a la vista
        public void InsertData(int Brand, string Name, double Price, int Status, int Distributor, int Availability)
        {
            Modelo_Product.InsertProduct(Brand, Name, Price, Status, Distributor, Availability);
        }
        public void DeleteData(int Id)
        {
            Modelo_Product.DeleteProduct(Id);
        }
    }
}
