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
using System.Xml;
using System.Diagnostics;
using System.Globalization;

namespace Backend.Modelos
{
    public class DaoLibros
    {


        public Libros getOne(int id)
        {
            try
            {
                MySqlCommand sentencia = new MySqlCommand("SELECT * FROM libros WHERE idLibro="+id);

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);
                Libros objLibros = null;
                if (tabla != null && tabla.Rows.Count > 0)
                {
                    DataRow fila = tabla.Rows[0];
                    int clasificacion = 0;

                    //CultureInfo us = new CultureInfo("en-US");
                    //string fechaTexto = fila["fechaPublicacion"].ToString();
                    //string formatoFecha = "yyyy'-'MM'-'dd";

                    //DateTime.ParseExact(fechaTexto, formatoFecha, us)

                    if (fila["clasificacion"].ToString().Equals("Niños"))
                    {
                        clasificacion = 1;
                    }
                    if (fila["clasificacion"].ToString().Equals("Adolecentes"))
                    {
                        clasificacion = 2;
                    }
                    if (fila["clasificacion"].ToString().Equals("Adultos"))
                    {
                        clasificacion = 3;
                    }

                    objLibros = new Libros(id, fila["nombre"].ToString(), fila["autor"].ToString(),
                        fila["editorial"].ToString(), fila["isbn"].ToString(), DateTime.Parse(fila["fechaPublicacion"].ToString()), 
                        decimal.Parse(fila["precio"].ToString()), int.Parse(fila["numeroPaginas"].ToString()),
                        fila["descripcion"].ToString(), int.Parse(fila["visitas"].ToString()), clasificacion);
                }
                return objLibros;
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                DaoConexion.desconectar();
            }
        }

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
            catch (MySqlException e)
            {
                throw;
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
                sentencia.CommandText = "SELECT * FROM libros ORDER BY idLibro DESC LIMIT 9;";

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
            try
            {
                int valor = 0;
                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "INSERT INTO Libros(nombre, autor, editorial, isbn, fechaPublicacion, precio, numeroPaginas, descripcion, clasificacion) " +
                                       "VALUES(@nombre, @autor, @editorial, @isbn, @fechaPublicacion, @precio, @numeroPaginas, @descripcion, @clasificacion); SELECT LAST_INSERT_ID();";
                consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
                consulta.Parameters.AddWithValue("@autor", obj.Autor);
                consulta.Parameters.AddWithValue("@editorial", obj.Editorial);
                consulta.Parameters.AddWithValue("@isbn", obj.ISBN);
                string fecha = obj.FechaPublicacion.ToString("yyyy-MM-dd"); //Convertimos fecha al formato necesario para guardar en MySQL
                consulta.Parameters.AddWithValue("@fechaPublicacion", fecha);
                consulta.Parameters.AddWithValue("@precio", obj.Presio);
                consulta.Parameters.AddWithValue("@numeroPaginas", obj.NPaginas);
                consulta.Parameters.AddWithValue("@descripcion", obj.Descripcion);
                consulta.Parameters.AddWithValue("@clasificacion", obj.Clasificacion);


                valor = DaoConexion.ejecutarSentencia(consulta, true);

                return valor;
            }
            catch (Exception m)
            {
                return 0;
            }
            finally
            {
                DaoConexion.desconectar();
            }
        }
        public bool updateLibro(Libros obj)
        {
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "UPDATE Libros SET nombre = @nombre, autor = @autor," +
                    "editorial = @editorial, ISBN = @ISBN, fechaPublicacion = @fechaPublicacion, precio = @precio," +
                    "numeroPaginas = @numeroPaginas, descripcion = @descripcion, clasificacion = @clasificacion WHERE idLibro = @idLibro;";

                consulta.Parameters.AddWithValue("@idLibro", obj.IdLibro);
                consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
                consulta.Parameters.AddWithValue("@autor", obj.Autor);
                consulta.Parameters.AddWithValue("@editorial", obj.Editorial);
                consulta.Parameters.AddWithValue("@ISBN", obj.ISBN);
                consulta.Parameters.AddWithValue("@fechaPublicacion", obj.FechaPublicacion);
                consulta.Parameters.AddWithValue("@precio", obj.Presio);
                consulta.Parameters.AddWithValue("@numeroPaginas", obj.NPaginas);
                consulta.Parameters.AddWithValue("@descripcion", obj.Descripcion);
                consulta.Parameters.AddWithValue("@clasificacion", obj.Clasificacion);

                if (DaoConexion.ejecutarSentencia(consulta, false) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                    

            }
            catch (Exception m)
            {
                return false;
            }
            finally
            {
                DaoConexion.desconectar();
            }
        }

        public bool deleteLibro(int id)
        {
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "DELETE FROM Libros WHERE idLibro = @idLibro";

                consulta.Parameters.AddWithValue("@idLibro", id);

                if (DaoConexion.ejecutarSentencia(consulta, false) > 0)
                    return true;
                else
                    return false;

            }
            catch (Exception m)
            {
                return false;
            }
            finally
            {
                DaoConexion.desconectar();
            }

        }



        public Libros traerLibro(string nombre)
        {
                 
            Libros obj = null;

            try
            {
            MySqlCommand consulta = new MySqlCommand();
            consulta.CommandText = "SELECT * FROM libros where Nombre = @nombre;";
            consulta.Parameters.AddWithValue("@nombre", nombre);

            DataTable tabla = DaoConexion.ejecutarConsulta(consulta);
            if (tabla.Rows.Count > 0)
            {
                obj = new Libros(tabla.Rows[0].ItemArray);
            }

                
            }
            catch (MySqlException ex)
            {
                throw new Exception("Se ha presentado un problema al obtener los datos");
            }

            finally
            {
                DaoConexion.desconectar();

            }

            return obj;

        }

        public int insertVisita(int id)
        {
            int visitas = 0;
            try
            {
                
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "Select visitas from libros where idLibro = @id";
                sentencia.Parameters.AddWithValue("@id", id);

                DataTable table = DaoConexion.ejecutarConsulta(sentencia);
                if (table.Rows.Count > 0)
                {
                    Object[] camp = table.Rows[0].ItemArray;
                    visitas = int.Parse(camp[0].ToString());
                }

            }
            catch (MySqlException e)
            {
                throw new Exception("Error en la conexion");
            }

            try
            {
                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "UPDATE libros set visitas = @visita WHERE idLibro = @id";
                consulta.Parameters.AddWithValue("@id", id);
                consulta.Parameters.AddWithValue("@visita",  visitas + 1);

                return DaoConexion.ejecutarSentencia(consulta, false);
            }
            catch (MySqlException n)
            {
                throw new Exception("Se ha presentado un problema al obtener los datos");
            }

            finally
            {
                DaoConexion.desconectar();
            }
        }

    }
}
