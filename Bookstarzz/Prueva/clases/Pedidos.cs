using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.clases
{
    public class Pedidos
    {
        public int idPedido { get; set; }
        public int idUsuario { get; set; }
        public string direccion { get; set; }
        public string ciudad { get; set; }
        public string formato { get; set; }
        public DateTime fechaCompra { get; set; }
        public string estatusPedido { get; set; }

        public Pedidos(int idPedido, int idUsuario, string direccion, string ciudad, string formato,
            DateTime fechaCompra, string estatusPedido)
        {
            this.idPedido = idPedido;
            this.idUsuario = idUsuario;
            this.direccion = direccion;
            this.ciudad = ciudad;
            this.formato = formato;
            this.fechaCompra = fechaCompra;
            this.estatusPedido = estatusPedido;
        }

        public Pedidos(Object[] campos)
        {
            this.idPedido = int.Parse(campos[0].ToString());
            this.idUsuario = int.Parse(campos[1].ToString());
            this.direccion = campos[2].ToString();
            this.ciudad = campos[3].ToString();
            this.formato = campos[4].ToString();
            this.fechaCompra = DateTime.Parse(campos[5].ToString());
            this.estatusPedido = campos[6].ToString();

        }
    }
}
