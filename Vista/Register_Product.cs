using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Vista
{
    public partial class Register_Product : Form
    {
        public Register_Product()
        {
            InitializeComponent();
        }

        private void Register_Product_Load(object sender, EventArgs e)
        {
            btnRegistrar.Enabled = false;
        }

        //VALIDACION DE NO PODER REGISTRAR SI HAY CAMPOS VACÍOS
        private void CampoVacio()
        {
            var vr = !string.IsNullOrEmpty(txtMarcaProd.Text) &&
                !string.IsNullOrEmpty(txtNombreProd.Text) &&
                !string.IsNullOrEmpty(txtPrecioProd.Text);
            btnRegistrar.Enabled = vr;
        }

        //LLAMANDO LA VALIDACIÓN DE CAMPOS VACÍOS
        private void txtMarcaProd_TextChanged(object sender, EventArgs e)
        {
            CampoVacio();
        }

        private void txtNombreProd_TextChanged(object sender, EventArgs e)
        {
            CampoVacio();
        }

        private void txtPrecioProd_TextChanged(object sender, EventArgs e)
        {
            CampoVacio();
        }

        // MÉTODO PARA QUE SOLO SE INGRESE TEXTO A UN TEXTBOX
        private void SoloLetras(KeyPressEventArgs V)
        {
            if (Char.IsLetter(V.KeyChar))
            {
                V.Handled = false;
            }
            else if (Char.IsSeparator(V.KeyChar))
            {
                V.Handled = false;
            }
            else if (Char.IsControl(V.KeyChar))
            {
                V.Handled = false;
            }
            else
            {
                V.Handled=true;
            }
        }

        // MÉTODO PARA QUE SOLO SE INGRESE NÚMEROS (SE PERMITEN DECIMALES) A UN TEXTBOX
        private void SoloNumeros(object sender, KeyPressEventArgs e, char cSymbol)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != cSymbol)
            {
                e.Handled = true;
            }
            if (e.KeyChar == cSymbol && (sender as TextBox).Text.IndexOf(cSymbol) > -1)
            {
                e.Handled = true;
            }
        }

        // EVENTOS KEY PRESS DE LOS TEXTBOX (PARA QUE SE VALIDE CADA TECLA QUE SE PULSA)
        private void txtNombreProd_KeyPress(object sender, KeyPressEventArgs e)
        {
            SoloLetras(e);
        }

        private void txtPrecioProd_KeyPress(object sender, KeyPressEventArgs e)
        {
            SoloNumeros(sender, e,'.');
        }
    }
}
