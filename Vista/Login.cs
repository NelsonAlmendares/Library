using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Controller;

namespace Vista
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        /* -> Realizamos una instancia con un nivel de encapsulamiento de solo lectura para que sea accesido 
            unicamente desde esta clase y no pueda cambiarse los valores que nos otorga */
        readonly Controller_Login SendData = new Controller_Login();

        void GetLlogin()
        {
            // Tomamos los valores que son Ingresados en los TextBox
            string User = Txt_User.Text;
            string Pwd = Txt_Pwd.Text;

            SendData.User = User;
            SendData.Pwd = Pwd;

            // Creamos una variable con la cual evaluamos si el método se realiza de manera correcta
            bool ReqData = SendData.VerifyData(User, Pwd);

            if (ReqData == true)
            {
                MessageBox.Show("Acceso conseguido! Bienvenido al sistema.", "LOGIN COMPROBADO", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else 
            {
                MessageBox.Show("Credenciales no válidas, vuelva a intentarlo.", "LOGIN FALLIDO", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Btn_Login_Click(object sender, EventArgs e)
        {
            GetLlogin();
        }
    }
}
