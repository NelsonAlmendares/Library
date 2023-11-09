using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class Controller_Login
    {
        // Constructor de la clase con el cual asignamos valor a las variables que toman datos de la vista
        public Controller_Login() { }
        public string User { get; set; }
        public string Pwd { get; set; }

        // Método con el cual llamamos el Modelo con el Query de datos y retornar a la vista
        public bool VerifyData(string User, string Pwd)
        {
            return Modelo_Login.LoginData(User, Pwd);
        }
    }
}
