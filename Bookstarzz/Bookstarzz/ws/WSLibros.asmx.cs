using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Services;
using Backend.Modelos;
using Backend.clases;

namespace Bookstarzz.ws
{
    /// <summary>
    /// Summary description for WSLibros
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WSLibros : System.Web.Services.WebService
    {

        [WebMethod (EnableSession = true)]
      public string getPopulares() {

            if (Session["session"]!=null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("usu") || tipo.Equals("usu"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoLibros().getPopulares());
                }

            }
            return "";
        }
    }
}
