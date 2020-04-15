using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookstarzz
{
    public partial class FrmRegistrarUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            validar();
            
        }

        private int validar()
        {
            int asiertos = 0;
            if (txtNombre.Value != "" && txtNombre.Value.Length <= 30)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-El Nombre es obligatorio." +
                    "2.- El Nombre debe de tener 30 caracteres o menos); </script>");
            }

            if (txtApellidoP.Value!="" && txtApellidoP.Value.Length <= 30)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-El Apellido Paterno es obligatorio. \n" +
                  "2.- El Apellido Paterno debe de tener 30 caracteres o menos); </script>");
            }

            if (TxtApellidoM.Value!="" && TxtApellidoM.Value.Length <= 30)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-El Apellido Materno es obligatorio. \n" +
                  "2.- El Apellido Materno debe de tener 30 caracteres o menos); </script>");
            }



            return asiertos;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
           

        }
    }
}