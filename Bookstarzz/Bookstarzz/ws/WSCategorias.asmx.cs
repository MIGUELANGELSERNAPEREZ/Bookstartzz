using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Backend.Modelos;
using Backend.clases;
using System.Web.Script.Serialization;


namespace Bookstarzz.ws
{
    /// <summary>
    /// Summary description for WSCategorias
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WSCategorias : System.Web.Services.WebService
    {

        [WebMethod (EnableSession = true)]
        public string getAll()
        {
            //if (Session["session"]!=null)
            //{

                //if (Session["session"].ToString().Equals("1") || Session["session"].ToString().Equals("2"))
                //{
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return  jss.Serialize(new DaoCategorias().getAll());

            //    }

            //}


            //return "";
        }
    }
}
