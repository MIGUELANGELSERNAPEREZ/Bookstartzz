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
        public int idLibro { get; set; }


        public Cuenta(int idCuenta, int idUsuario, int idLibro)
        {
            this.idCuenta = idCuenta;
            this.idUsuario = idUsuario;
            this.idLibro = idLibro;
        }

        public Cuenta(Object[] campos)
        {
            this.idCuenta = int.Parse(campos[0].ToString());
            this.idUsuario = int.Parse(campos[1].ToString());
            this.idLibro = int.Parse(campos[2].ToString());
        }
    }
}
