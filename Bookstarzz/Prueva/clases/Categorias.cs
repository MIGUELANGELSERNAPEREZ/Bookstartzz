<<<<<<< HEAD
﻿using System;
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
=======
﻿using System;
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
>>>>>>> d3a8d22e5fcc769df4340a568a0dbb5b438103bd
