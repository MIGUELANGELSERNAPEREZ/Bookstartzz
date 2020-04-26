using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Backend.clases;
using MySql.Data.MySqlClient;
using System.Data;
using Backend.Modelos;

namespace Backend.Modelos
{
    public class DaoLibros
    {
        public List<Libros> getPopulares()
        {
            Libros obj = null;
            List<Libros> list = new List<Libros>();
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "SELECT * FROM libros ORDER BY visitas DESC LIMIT 10;";

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

                if (tabla.Rows.Count > 0 && tabla!= null)
                {
                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        obj = new Libros(tabla.Rows[i].ItemArray);
                        list.Add(obj);
                    }
                }
            }
            catch (Exception m)
            {
                Console.WriteLine(m);
            }
            finally
            {
                DaoConexion.desconectar();
            }
            return list;
        }
    }
}
