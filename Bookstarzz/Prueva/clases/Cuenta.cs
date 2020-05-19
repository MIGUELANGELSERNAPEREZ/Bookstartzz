using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.clases
{
    public class Cuenta
    {
        public int idCuenta { get; set; }
        public int idUsuario { get; set; }
        public string idNombre { get; set; }
        public int idLibro { get; set; }


        public Cuenta(int idCuenta, int idUsuario, string idNombre, int idLibro)
        {
            this.idCuenta = idCuenta;
            this.idUsuario = idUsuario;
            this.idNombre = idNombre;
            this.idLibro = idLibro;
        }

        public Cuenta(Object[] campos)
        {
            this.idCuenta = int.Parse(campos[0].ToString());
            this.idUsuario = int.Parse(campos[1].ToString());
            this.idNombre = campos[2].ToString();
            this.idLibro = int.Parse(campos[3].ToString());
        }
    }
}
