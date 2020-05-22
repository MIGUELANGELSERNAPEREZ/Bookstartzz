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
    public partial class FrmRegistrarUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      
        public int validar()
        {
            int asiertos = 0;
            if (txtNombre.Value != "" && txtNombre.Value.Length <= 30)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-El Nombre es obligatorio." +
                    "2.- El Nombre debe de tener 30 caracteres o menos'); </script>");
            }

            if (txtApellidoP.Value!="" && txtApellidoP.Value.Length <= 30)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-El Apellido Paterno es obligatorio. \n" +
                  "2.- El Apellido Paterno debe de tener 30 caracteres o menos'); </script>");
            }

            if (TxtApellidoM.Value!="" && TxtApellidoM.Value.Length <= 30)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-El Apellido Materno es obligatorio. \n" +
                  "2.- El Apellido Materno debe de tener 30 caracteres o menos'); </script>");
            }

            if (TxtPass.Value!="" && txtConfirmar.Value!="" && TxtPass.Value.Length == 8
                && txtConfirmar.Value.Length == 8)
            {
                if (txtConfirmar.Value.Equals(TxtPass.Value))
                {
                    asiertos++;
                }
                else
                {
                    Response.Write("<script>alert('La contraseña y la confirmacion " +
                        "deben de ser iguales'); </script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Error: 1.-La Contraseña es obligatorio. \n" +
                 "2.- La confirmacion debe de tener 8 caracteres.\n" +
                 "3.-La Confirmacion es obligatorio. \n" +
                 "2.- La contraseña debe de tener 8 caracteres.'); </script>");
            }

            if (txtEmail.Value!="" && txtEmail.Value.Length <= 40)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script>alert('1.- El correo es obligatorio" +
                    "2.- El correo debe de tener maximo 45 caracteres'); </script>");
            }

            if (txtUsuario.Value!="" && txtUsuario.Value.Length <= 20)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script>alert('1.- El Usuario es obligatorio" +
                                    "2.- El Usuario debe de tener maximo 20 caracteres'); </script>");
            }

            if (txtTel.Value!="" && txtTel.Value.Length == 10)
            {
                asiertos++;
            }
            else
            {
                Response.Write("<script>alert('1.- El Telefono es obligatorio" +
                    "2.- El Telefono debe de tener 10 caracteres'); </script>");
            }


            return asiertos;
        }

     
        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            if (validar() == 7)
            {
                Usuario objUser = new Usuario(txtNombre.Value,
                    txtApellidoP.Value, TxtApellidoM.Value, txtEmail.Value,
                    TxtPass.Value, 1, txtUsuario.Value, txtTel.Value,"Indefinido");

                Usuario existente = new DaoUsuario().getUser(objUser);

                if (existente != null)
                {
                    //el usuario ya existe. notificamos de su existencia

                    if (objUser.Email.Equals(existente.Email))
                    {
                        Response.Write("<script> alert('El email ya existe. cambialo porfavor!!');" 
                            +" </script>");
                        
                    }
                    
                    
                }
                else
                {
                    // el usuario no existe ya lo agregamos
                    int estado = new DaoUsuario().insertUser(objUser);
                    if (estado > 0)
                    {
                        Response.Write("<script>" +
                 "window.addEventListener('load', function () {$('#mdlConfirmar').modal('show');});</script>");
                        Response.Redirect("FrmLogin.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('no se puedo agregar');</script>");
                    }

                }
            }
        }
    }
}