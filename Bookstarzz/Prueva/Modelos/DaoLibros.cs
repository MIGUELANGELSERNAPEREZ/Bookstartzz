using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Backend.clases;
using MySql.Data.MySqlClient;
using System.Data;
using Backend.Modelos;
using System.Security.Cryptography.X509Certificates;
using MySqlX.XDevAPI.Relational;

namespace Backend.Modelos
{
    public class DaoLibros
    {
        public List<Libros> getAll()
        {
            Libros obj = null;
            List<Libros> list = new List<Libros>();
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "SELECT * FROM libros;";

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

                if (tabla.Rows.Count > 0 && tabla != null)
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

        public List<Libros> getPopulares()
        {
            Libros obj = null;
            List<Libros> list = new List<Libros>();
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "SELECT * FROM libros ORDER BY visitas DESC LIMIT 10;";

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

                if (tabla.Rows.Count > 0 && tabla != null)
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

        public List<Libros> getNuevos()
        {
            Libros obj = null;
            List<Libros> list = new List<Libros>();
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "SELECT * FROM libros ORDER BY idLibro DESC LIMIT 10;";

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

                if (tabla.Rows.Count > 0 && tabla != null)
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

        public int insertLibro(Libros obj)
        {
            int valor = 0;
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "INSERT INTO Libros(nombre, autor, categoria, editorial, ISBN, fechaPublicacion, precio, numeroPaginas, descripcion, clasificacion) VALUES(" +
                    "@nombre, @autor, @categoria, @editorial, @ISBN, @fechaPublicacion, @precio, @numeroPaginas, @descripcion, @clasificacion);";

                consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
                consulta.Parameters.AddWithValue("@autor", obj.Autor);
                consulta.Parameters.AddWithValue("@categoria", obj.Categoria);
                consulta.Parameters.AddWithValue("@editorial", obj.Editorial);
                consulta.Parameters.AddWithValue("@ISBN", obj.ISBN);
                consulta.Parameters.AddWithValue("@fechaPublicacion", obj.FechaPublicacion);
                consulta.Parameters.AddWithValue("@precio", obj.Presio);
                consulta.Parameters.AddWithValue("@numeroPaginas", obj.NPaginas);
                consulta.Parameters.AddWithValue("@descripcion", obj.Descripcion);
                consulta.Parameters.AddWithValue("@clasificacion", obj.Clasificacion);

                valor = DaoConexion.ejecutarSentencia(consulta, false);

            }
            catch (Exception m)
            {
                Console.WriteLine(m);
            }
            finally
            {
                DaoConexion.desconectar();
            }
            return valor;

        }
        public int updateLibro(Libros obj)
        {
            int valor = 0;
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "UPDATE Libros SET nombre = @nombre, autor = @autor, categoria = @categoria," +
                    "editorial = @editorial, ISBN = @ISBN, fechaPublicacion = @fechaPublicacion, precio = @precio," +
                    "numeroPaginas = @numeroPaginas, descripcion = @descripcion, clasificacion = @clasificacion WHERE idLibro = @idLibro;";

                consulta.Parameters.AddWithValue("@idLibro", obj.IdLibro);
                consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
                consulta.Parameters.AddWithValue("@autor", obj.Autor);
                consulta.Parameters.AddWithValue("@categoria", obj.Categoria);
                consulta.Parameters.AddWithValue("@editorial", obj.Editorial);
                consulta.Parameters.AddWithValue("@ISBN", obj.ISBN);
                consulta.Parameters.AddWithValue("@fechaPublicacion", obj.FechaPublicacion);
                consulta.Parameters.AddWithValue("@precio", obj.Presio);
                consulta.Parameters.AddWithValue("@numeroPaginas", obj.NPaginas);
                consulta.Parameters.AddWithValue("@descripcion", obj.Descripcion);
                consulta.Parameters.AddWithValue("@clasificacion", obj.Clasificacion);

                valor = DaoConexion.ejecutarSentencia(consulta, false);

            }
            catch (Exception m)
            {
                Console.WriteLine(m);
            }
            finally
            {
                DaoConexion.desconectar();
            }
            return valor;

        }

        public int deleteLibro(int id)
        {
            int valor = 0;
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "DELETE FROM Libros WHERE idLibro = @idLibro";

                consulta.Parameters.AddWithValue("@idLibro", id);

                valor = DaoConexion.ejecutarSentencia(consulta, false);

            }
            catch (Exception m)
            {
                Console.WriteLine(m);
            }
            finally
            {
                DaoConexion.desconectar();
            }
            return valor;

        }

    }
}
