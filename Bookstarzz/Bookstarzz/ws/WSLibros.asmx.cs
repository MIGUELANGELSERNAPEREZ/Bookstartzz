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
    /// Summary description for WSLibros
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WSLibros : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public String getOne(int idLibro)
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("usu") || tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoLibros().getOne(idLibro));
                }

            }
            return "";
        }


        [WebMethod(EnableSession = true)]
        public string getAll()
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("usu") || tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoLibros().getAll());
                }

            }
            return "";
        }

        [WebMethod(EnableSession = true)]
        public string getPopulares()
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("usu") || tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoLibros().getPopulares());
                }

            }
            throw new SecurityException("Acceso restringido");
        }


        [WebMethod(EnableSession = true)]
        public string getNuevos()
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("usu") || tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoLibros().getNuevos());
                }

            }
            throw new SecurityException("Acceso restringido");
        }


        [WebMethod(EnableSession = true)]
        public int insertLibro(String info)
        {

            //if (Session["session"] != null)
            //{
            //    string tipo = Session["session"].ToString();
            //    if (tipo.Equals("usu") || tipo.Equals("admi"))
            //    {

            JavaScriptSerializer jss = new JavaScriptSerializer();
            return new DaoLibros().insertLibro(jss.Deserialize<Libros>(info));
            //}

            //}
            //return "";
        }

        [WebMethod(EnableSession = true)]
        public bool updateLibro(String info)
        {

            //if (Session["session"]!=null)
            //{
            //    string tipo = Session["session"].ToString();
            //    if (tipo.Equals("usu") || tipo.Equals("admi"))
            //    {

            JavaScriptSerializer jss = new JavaScriptSerializer();
            return new DaoLibros().updateLibro(jss.Deserialize<Libros>(info));
            //    }

            //}
            //return "";
        }

        [WebMethod(EnableSession = true)]
        public bool deleteLibro(int id)
        {

            //if (Session["session"]!=null)
            //{
            //    string tipo = Session["session"].ToString();
            //    if (tipo.Equals("usu") || tipo.Equals("admi"))
            //    {

            return new DaoLibros().deleteLibro(id);
            //    }

            //}
            //return "";
        }

        [WebMethod(EnableSession = true)]

        public String traerLibro(string nombre)
        {

            if (Session["session"] != null)
            {
                string tipo = Session["session"].ToString();
                if (tipo.Equals("usu") || tipo.Equals("admi"))
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    return jss.Serialize(new DaoLibros().traerLibro(nombre));
                }

            }
            throw new SecurityException("Acceso restringido");
        }
    }
}

