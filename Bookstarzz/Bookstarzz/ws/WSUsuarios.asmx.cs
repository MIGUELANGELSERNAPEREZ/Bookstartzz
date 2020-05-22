using System;
using System.Collections.Generic;
using System.Linq;
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
        public string insert(Usuario obj)
        {
            if (obj.Nombre != "" && obj.Nombre.Length <= 30)
            {
                if (obj.ApellidoP != "" && obj.ApellidoP.Length <= 30)
                {
                    if (obj.ApellidoM != "" && obj.ApellidoM.Length <= 30)
                    {
                        if (obj.Password != "" && obj.Password.Length == 8)
                        {

                            if (obj.Email != "" && obj.Email.Length <= 40)
                            {
                                if (obj.UsuarioN != "" && obj.UsuarioN.Length <= 20)
                                {
                                    if (obj.Telefono != "" && obj.Telefono.Length == 10)
                                    {
                                        Usuario usu  = new DaoUsuario().userExist(obj);
                                        if (usu == null)
                                        {
                                            int val = new DaoUsuario().insertUser(obj);
                                            if (val > 1)
                                            {
                                                return "agregado";
                                            }
                                        }
                                        else
                                        {
                                            return "existente";
                                        }                                        
                                       
                                    }
                                    else
                                    {
                                        return "objetoNoValido";
                                    }


                                }
                                else
                                {
                                    return "objetoNoValido";
                                }
                            }
                            else
                            {
                                return "objetoNoValido";
                            }

                        }
                        else
                        {
                            return "objetoNoValido";
                        }
                    }
                    else
                    {
                        return "objetoNoValido"; ;
                    }
                }
                else
                {
                    return "objetoNoValido";
                }
            }
            else
            {
                return "objetoNoValido";
            }
            return "objetoNoValido";
        }
    }
}
