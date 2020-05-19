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
    public partial class FrmGestionTitulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCRUD_Click(object sender, EventArgs e)
        {
            //INSERTAR
            Libros objlibros = new Libros();
            objlibros.Nombre = txtNombre.Text;
            objlibros.Autor = txtAutor.Text;
            objlibros.NPaginas = int.Parse(txtNumPaginas.Text);
            objlibros.Clasificacion = dropDownClasificacion.SelectedIndex;
            objlibros.Categoria = txtCategoria.Text;
            objlibros.Editorial = txtEditorial.Text;
            objlibros.ISBN = txtISBN.Text;
            objlibros.FechaPublicacion = DateTime.Parse(calendarFechaPub.SelectedDate.ToString("d", CultureInfo.CreateSpecificCulture("ja-JP")));
            objlibros.Presio = decimal.Parse(txtPrecio.Text);
            objlibros.Descripcion = txtDescripcion.Text;
            DaoLibros daoLibros = new DaoLibros();
            daoLibros.insertLibro(objlibros);

            //MODIFICAR
            //Libros objlibros = new Libros();
            //objlibros.IdLibro = int.Parse(txtidLibro.Text);
            //objlibros.Nombre = txtNombre.Text;
            //objlibros.Autor = txtAutor.Text;
            //objlibros.NPaginas = int.Parse(txtNumPaginas.Text);
            //objlibros.Clasificacion = dropDownClasificacion.SelectedValue.ToString();
            //objlibros.Categoria = txtCategoria.Text;
            //objlibros.Editorial = txtEditorial.Text;
            //objlibros.ISBN = txtISBN.Text;
            //objlibros.FechaPublicacion = DateTime.Parse(calendarFechaPub.SelectedDate.ToString("d", CultureInfo.CreateSpecificCulture("ja-JP")));
            //objlibros.Presio = decimal.Parse(txtPrecio.Text);
            //objlibros.Descripcion = txtDescripcion.Text;
            //DaoLibros daoLibros = new DaoLibros();
            //daoLibros.updateLibro(objlibros);

            //ELIMINAR
            //DaoLibros daolibros = new DaoLibros();
            //daolibros.deleteLibro(int.Parse(txtidLibro.Text));
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmMenu.aspx");
        }
    }
}