using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using Backend.Modelos;
using Backend.clases;
using System.Security;
namespace Bookstarzz.ws
{
    /// <summary>
    /// Descripción breve de WSPedidos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WSPedidos : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public String getOne(int idPedido)
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoPedidos().getOne(idPedido));
                }

            }
            throw new SecurityException("Acceso restringido");
        }


        [WebMethod(EnableSession = true)]
        public String getAllPedidos()
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoPedidos().getAllPedidos());
                }

            }
            throw new SecurityException("Acceso restringido");
        }

        [WebMethod(EnableSession = true)]
        public bool updateEstatusPedido(String info)
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("admi"))
                {

                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return new DaoPedidos().updateEstatusPedido(jss.Deserialize<Pedidos>(info));
                }

            }
            throw new SecurityException("Acceso restringido");
        }
    }
}
