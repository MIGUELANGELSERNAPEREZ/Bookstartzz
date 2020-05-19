using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Backend.clases;
using Backend.Modelos;

namespace Bookstarzz
{
    public partial class FrmTitulos : System.Web.UI.Page
    {

        protected DaoLibros daoLibros = new DaoLibros();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGridList();
        }

        protected void BindGridList()
        {
            grdVistaTitulos.AutoGenerateColumns = false; //EVITA QUE AGREGUE LAS COLUMNAS DEL POJO A LA TABLA
            grdVistaTitulos.DataSource = daoLibros.getAll();
            grdVistaTitulos.DataBind(); //ENLAZA LA LISTA CON LA TABLA
        }

        protected void grdVistaTitulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdVistaTitulos.PageIndex = e.NewPageIndex;
            BindGridList();

        }

    }
}