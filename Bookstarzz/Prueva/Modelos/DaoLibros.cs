﻿using System;
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
            catch (Exception)
            {
                return null;
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
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "INSERT INTO Libros(nombre, autor, editorial, ISBN, fechaPublicacion, precio, numeroPaginas, descripcion, clasificacion) VALUES(" +
                    "@nombre, @autor, @editorial, @ISBN, @fechaPublicacion, @precio, @numeroPaginas, @descripcion, @clasificacion);";

                consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
                consulta.Parameters.AddWithValue("@autor", obj.Autor);
                consulta.Parameters.AddWithValue("@editorial", obj.Editorial);
                consulta.Parameters.AddWithValue("@ISBN", obj.ISBN);
                consulta.Parameters.AddWithValue("@fechaPublicacion", obj.FechaPublicacion);
                consulta.Parameters.AddWithValue("@precio", obj.Presio);
                consulta.Parameters.AddWithValue("@numeroPaginas", obj.NPaginas);
                consulta.Parameters.AddWithValue("@descripcion", obj.Descripcion);
                consulta.Parameters.AddWithValue("@clasificacion", obj.Clasificacion);

                int valor = DaoConexion.ejecutarSentencia(consulta, true);

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

    }
}
