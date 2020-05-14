using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Libros objlibros = new Libros();
            objlibros.Nombre = txtNombre.Text;
            objlibros.Autor = txtAutor.Text;
            objlibros.NPaginas = int.Parse(txtNumPaginas.Text);
            objlibros.Clasificacion = dropDownClasificacion.SelectedValue.ToString();
            objlibros.Categoria = txtCategoria.Text;
            objlibros.Editorial = txtEditorial.Text;
            objlibros.ISBN = txtISBN.Text;
            objlibros.FechaPublicacion = DateTime.Parse(calendarFechaPub.SelectedDate.ToString("d", CultureInfo.CreateSpecificCulture("ja-JP")));
            objlibros.Presio = decimal.Parse(txtPrecio.Text);
            objlibros.Descripcion = txtDescripcion.Text;
            
            DaoLibros daoLibros = new DaoLibros();
            daoLibros.inserLibro(objlibros);
        }
    }
}