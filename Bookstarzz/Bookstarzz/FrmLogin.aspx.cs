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
           string mensaje = "";

            if (txtEmail.Text!="" && txtPassword.Text!="")
            {
                Usuario objUser = new Usuario();
                objUser.Email = txtEmail.Text;
                objUser.Password = txtPassword.Text;

                try
                {
                    Usuario IdUser = new DaoUsuario().getLogin(objUser);


                    if (IdUser != null)
                    {
                        Session["id_user"] = IdUser.IdUsuario;
                        Session["session"] = null;
                        //si es usuario
                        if (IdUser.Tipo == 1)
                        {
                            Session["session"] = "usu";
                            Response.Redirect("FrmBookstarzz.aspx");

                        }
                        else
                        {
                            Session["session"] = "admi";
                            Response.Redirect("FrmBookstarzz.aspx");

                            //es administrador


                        }
                    }
                    else
                    {
                        divMensaje.InnerHtml = "El Usuario no existe";
                        divMensaje.Visible = true;
                        return;
                        //el usuario no existe
                    }
                }
                catch (Exception ex)
                {
                    divMensaje.InnerHtml = "No se a podido realizar la conexion con el servidor";
                    divMensaje.Visible = true;
                }

            }
            else
            {
                //agregar algo a las cajas estan vasias
                mensaje += "El email es un dato obligatorio<br>";
                mensaje += "El password es un dato obligatorio<br>";
                divMensaje.InnerHtml = mensaje;
                divMensaje.Visible = true;
                return;
            }
        }
    }
}