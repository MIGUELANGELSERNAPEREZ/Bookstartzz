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
    // [System.Web.Script.Services.ScriptService]
    public class WSUsuarios : System.Web.Services.WebService
    {

        [WebMethod (EnableSession = true)]
        public List<Usuario> getAll()
        {
            if (Session["session"]!=null)
            {
                string tipoUsuario = Session["session"].ToString();
                if (tipoUsuario.Equals("usu"))
                {
                    return new DaoUsuario().getAll();
                }
            }
            
            return null;
        }
    }
}
