using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.clases
{
    public class Categorias
    {

        public int IdCategoria { get; set; }
        public string Nombre { get; set; }

        public Categorias(string nombre)
        {           
            this.Nombre = nombre;
        }

        public Categorias(Object[] campos)
        {
            this.IdCategoria = int.Parse(campos[0].ToString());
            this.Nombre = campos[1].ToString();

        }


    }
}
