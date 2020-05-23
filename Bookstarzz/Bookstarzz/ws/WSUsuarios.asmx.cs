using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Web.Script.Serialization;
using System.Web.Services;
using Backend.clases;
using Backend.Modelos;

namespace Bookstarzz.ws
{
    /// <summary>
    /// Summary description for WSUsuarios
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WSUsuarios : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public List<Usuario> getAll()
        {
            if (Session["session"] != null)
            {
                string tipoUsuario = Session["session"].ToString();
                if (tipoUsuario.Equals("usu") || tipoUsuario.Equals("admi"))
                {
                    return new DaoUsuario().getAll();
                }
            }

            return null;
        }

        [WebMethod(EnableSession = true)]
        public int insert(string info)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();
            Usuario obj = jss.Deserialize<Usuario>(info);

            if (valido(obj))
            {
                Usuario usu = new DaoUsuario().userExist(obj);
                if (usu == null)
                {
                      
                   return new DaoUsuario().insertUser(obj); ;
                    
                }
                else
                {
                    throw new Exception("El usuario ya existe");
                }
            }

            throw new SecurityException("Acceso restringido");
        }


        public bool valido(Usuario obj)
        {
            
            if (obj.Telefono == "" && obj.Telefono.Length != 10)
            {

                throw new Exception("Los datos proporcionados no son válidos, verifica la información");
            }

            if (obj.UsuarioN == "" && obj.UsuarioN.Length > 20)
            {

                throw new Exception("Los datos proporcionados no son válidos, verifica la información");
            }

            if (obj.Email == "" && obj.Email.Length > 40)
            {
                throw new Exception("Los datos proporcionados no son válidos, verifica la información");
            }

            if (obj.Password == "" && obj.Password.Length != 8)
            {
                throw new Exception("Los datos proporcionados no son válidos, verifica la información");

            }

            if (obj.ApellidoM == "" && obj.ApellidoM.Length > 30)
            {
                throw new Exception("Los datos proporcionados no son válidos, verifica la información");
            }

            if (obj.ApellidoP == "" && obj.ApellidoP.Length > 30)
            {
                throw new Exception("Los datos proporcionados no son válidos, verifica la información");
            }
            

            if (obj.Nombre == "" && obj.Nombre.Length > 30)
            {
                throw new Exception("Los datos proporcionados no son válidos, verifica la información");
            }
              

            return true;
        }
    }
}
