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
    public class DaoCategorias
    {
        public List<Categorias> getAll()
        {
            List<Categorias> lista = new List<Categorias>();
            Categorias obj = null;

            try
            {


                string sentencia = "SELECT * FROM categorias;";
                MySqlCommand consulta = new MySqlCommand(sentencia);

                DataTable tabla = DaoConexion.ejecutarConsulta(consulta);

                if (tabla.Rows.Count > 0)
                {
                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        obj = new Categorias(tabla.Rows[i].ItemArray);
                        lista.Add(obj);
                    }

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                DaoConexion.desconectar();
            }

            return lista;

        }




    }
}

