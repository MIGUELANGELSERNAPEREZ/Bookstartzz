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
            divMensaje.Visible = false;
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text!="" && txtPassword.Text!="")
            {
                Usuario objUser = new Usuario();
                objUser.Email = txtEmail.Text;
                objUser.Password = txtPassword.Text;

                Usuario IdUser = new DaoUsuario().getLogin(objUser);
                if (IdUser!=null)
                {
                    Session["id_user"] = IdUser.IdUsuario;
                    Session["session"] = null;
                    //si es usuario
                    if (IdUser.Tipo == 1)
                    {
                        Session["session"] = "usu";
                        Response.Redirect("FrmMenu.aspx");
                        
                    }
                    else
                    {
                        Session["session"] = "admi";
                        //es administrador
                    }
                }
                else
                {
                    //el usuario no existe
                }
            }
            else
            {
                // es necesario agregar contenido a las cajas de texto
            }
        }
    }
}