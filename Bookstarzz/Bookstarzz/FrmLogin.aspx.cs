using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Backend.clases;
using Backend.Modelos;

namespace Bookstarzz
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text!="" && txtPassword.Text!="")
            {
                Usuario objUser = new Usuario();
                objUser.Email = txtEmail.Text;
                objUser.Password = txtPassword.Text;
                Usuario idUser = new DaoUsuario().getUser(objUser);

                if (idUser!=null)
                {
                    Session["Id_user"] = idUser.IdUsuario;
                    Response.Redirect("FrmMenu.aspx");
                }
                else
                {
                    // el usuario no fue encontrado, no existe
                }
            }
            else
            {
                // las cajas de texto estan vacias
            }

            
        }
    }
}