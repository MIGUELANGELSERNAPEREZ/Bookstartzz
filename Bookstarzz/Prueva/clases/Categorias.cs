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

        public Categorias(int idCategoria, string nombreCategoria)
        {
            this.idCategoria = idCategoria;
            this.nombreCategoria = nombreCategoria;
        }

        public Categorias(Object[] campos)
        {
            this.idCategoria = int.Parse(campos[0].ToString());
            this.nombreCategoria = campos[1].ToString();
        }
    }
}
