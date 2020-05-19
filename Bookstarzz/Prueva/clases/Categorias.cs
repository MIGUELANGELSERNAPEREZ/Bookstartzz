using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.clases
{
    public class Categorias
    {

        public int idCategoria { get; set; }
        public string nombreCategoria { get; set; }

        public Categorias(string nombre)
        {           
            this.nombreCategoria = nombre;
        }

        public Categorias(Object[] campos)
        {
            this.idCategoria = int.Parse(campos[0].ToString());
            this.nombreCategoria = campos[1].ToString();

        }


    }
}
