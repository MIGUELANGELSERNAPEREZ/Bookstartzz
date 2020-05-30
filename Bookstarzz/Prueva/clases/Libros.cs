using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;


namespace Backend.clases
{
    public class Libros
    {

        //clasificacion enum('Niños','Adolecentes','adultos'
        /*ninos = 1
         adolecentes = 2
         adultos = 3; */
        public int IdLibro { get; set; }
        public string Nombre { get; set; }
        public string Autor { get; set; }
        public string Editorial { get; set; }
        public string ISBN{ get; set; }
        public DateTime FechaPublicacion { get; set; }
        public decimal Presio { get; set; }
        public int NPaginas { get; set; }
        public string Descripcion { get; set; }
        public int Visitas { get; set; }
        public int Clasificacion { get; set; }

        public Libros()
        {

        }

        public Libros(int idLibro, string nombre, string autor,
            string editorial, string isbn, DateTime fechaPublicacion,
            decimal presio, int nPaginas, string descripcion, int visitas
            , int clasificacion)
        {
            this.IdLibro = idLibro;
            this.Nombre = nombre;
            this.Autor = autor;
            this.Editorial = editorial;
            this.ISBN = isbn;
            this.FechaPublicacion = fechaPublicacion;
            this.Presio = presio;
            this.NPaginas = nPaginas;
            this.Descripcion = descripcion;
            this.Visitas = visitas;
            this.Clasificacion = clasificacion;
        }

        public Libros(Object[] campos)
        {
            this.IdLibro = int.Parse(campos[0].ToString());
            this.Nombre = campos[1].ToString();
            this.Autor = campos[2].ToString();
            this.Editorial = campos[3].ToString();
            this.ISBN = campos[4].ToString();
            this.FechaPublicacion = DateTime.Parse(campos[5].ToString());
            this.Presio = Decimal.Parse(campos[6].ToString());
            this.NPaginas = int.Parse(campos[7].ToString());
            this.Descripcion = campos[8].ToString();
            this.Visitas = int.Parse(campos[9].ToString());
            if (campos[10].ToString().Equals("Niños"))
            {
                this.Clasificacion = 1;
            }
            if (campos[10].ToString().Equals("Adolecentes"))
            {
                this.Clasificacion = 2;
            }
            if (campos[10].ToString().Equals("Adultos"))
            {
                this.Clasificacion = 3;
            }
        }

        public void Categorias(Object []campos)
        {
            IdLibro = int.Parse(campos[0].ToString());
            Nombre = campos[1].ToString();
        }

    }
}
