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
                    try {
                        JavaScriptSerializer jss = new JavaScriptSerializer();
                        return jss.Serialize(new DaoPedidos().getOne(idPedido));
                    }
                    catch
                    {
                        throw new Exception("Se ha presentado un problema al obtener los datos");
                    }
                    
                }

            }
            return null;
        }


        [WebMethod(EnableSession = true)]
        public String getAllPedidos()
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("admi"))
                {
                    try
                    {
                        JavaScriptSerializer jss = new JavaScriptSerializer();
                        return jss.Serialize(new DaoPedidos().getAllPedidos());
                    }
                    catch
                    {
                        throw new Exception("Se ha presentado un problema al obtener los datos");
                    }
                }

            }
            return null;
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
                    Pedidos obj = jss.Deserialize<Pedidos>(info);
                    if (valido(obj))
                    {
                        try
                        {
                            bool val = false;
                            return val = new DaoPedidos().updateEstatusPedido(obj);
                        }
                        catch
                        {
                            throw new Exception("Se ha presentado un problema al obtener los datos");
                        }
                    }
                }

            }
            return false;
        }

        public bool valido(Pedidos obj)
        {

            if (obj.estatusPedido == "")
            {

                return false;
            }

            return true;
        }

    }
}
