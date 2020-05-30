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

        public List<Libros> getCategoria(int id)
        {
            List<Libros> lista = new List<Libros>();
            Libros obj = new Libros();

            try
            {
                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "SELECT libros_categorias.idLibros , libros.Nombre FROM Libros LEFT JOIN " +
                    "libros_categorias ON libros.idLibro = libros_categorias.idLibros where libros_categorias.idCategorias" +
                    " = @id  ORDER BY idLibros desc LIMIT 9;";

                consulta.Parameters.AddWithValue("@id", id);

                DataTable tabla = DaoConexion.ejecutarConsulta(consulta);

                if (tabla.Rows.Count > 0)
                {
                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        obj.Categorias(tabla.Rows[i].ItemArray);
                        lista.Add(obj);
                    }
                    
                }

                return lista;

            }
            catch (MySqlException ex)
            {
                throw new Exception("No se a podido acceder a la informacion");
            }

            finally
            {
                DaoConexion.desconectar();
            }
        }


    }
}

