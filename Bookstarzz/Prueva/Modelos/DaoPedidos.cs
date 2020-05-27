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
    public class DaoPedidos
    {

        public List<Pedidos> getAllPedidos()
        {
            List<Pedidos> lista = new List<Pedidos>();

            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "SELECT * FROM Pedidos";

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

                foreach (DataRow fila in tabla.Rows)
                {
                    lista.Add(new Pedidos(
                        int.Parse(fila["IdPedido"].ToString()), int.Parse(fila["idUsuario"].ToString()),
                        fila["direccion"].ToString(), fila["ciudad"].ToString(), fila["formato"].ToString(),
                        DateTime.Parse(fila["fechaCompra"].ToString()), fila["estatusPedido"].ToString()
                        ));
                }

                return lista;
            }
            catch (MySqlException e)
            {
                throw new Exception("Se ha presentado un problema al obtener los datos");
            }
            finally
            {
                DaoConexion.desconectar();
            }
        }


        public Pedidos getOne(int id)
        {
            try
            {
                MySqlCommand sentencia = new MySqlCommand("SELECT * FROM Pedidos WHERE idPedido=" + id);

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);
                Pedidos objPedidos = null;
                if (tabla != null && tabla.Rows.Count > 0)
                {
                    DataRow fila = tabla.Rows[0];

                    objPedidos = new Pedidos(id, int.Parse(fila["idUsuario"].ToString()),
                        fila["direccion"].ToString(), fila["ciudad"].ToString(), fila["formato"].ToString(),
                        DateTime.Parse(fila["fechaCompra"].ToString()), fila["estatusPedido"].ToString());
                }
                return objPedidos;
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

        //public List<Libros> getAll()
        //{
        //    Libros obj = null;
        //    List<Libros> list = new List<Libros>();
        //    try
        //    {
        //        MySqlCommand sentencia = new MySqlCommand();
        //        sentencia.CommandText = "SELECT * FROM libros;";

        //        DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

        //        if (tabla.Rows.Count > 0 && tabla != null)
        //        {
        //            for (int i = 0; i < tabla.Rows.Count; i++)
        //            {
        //                obj = new Libros(tabla.Rows[i].ItemArray);
        //                list.Add(obj);
        //            }
        //        }
        //    }
        //    catch (Exception m)
        //    {
        //        Console.WriteLine(m);
        //    }
        //    finally
        //    {
        //        DaoConexion.desconectar();
        //    }
        //    return list;
        //}

        //public List<Libros> getPopulares()
        //{
        //    Libros obj = null;
        //    List<Libros> list = new List<Libros>();
        //    try
        //    {
        //        MySqlCommand sentencia = new MySqlCommand();
        //        sentencia.CommandText = "SELECT * FROM libros ORDER BY visitas DESC LIMIT 10;";

        //        DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

        //        if (tabla.Rows.Count > 0 && tabla != null)
        //        {
        //            for (int i = 0; i < tabla.Rows.Count; i++)
        //            {
        //                obj = new Libros(tabla.Rows[i].ItemArray);
        //                list.Add(obj);
        //            }
        //        }
        //    }
        //    catch (Exception m)
        //    {
        //        Console.WriteLine(m);
        //    }
        //    finally
        //    {
        //        DaoConexion.desconectar();
        //    }
        //    return list;
        //}

        //public List<Libros> getNuevos()
        //{
        //    Libros obj = null;
        //    List<Libros> list = new List<Libros>();
        //    try
        //    {
        //        MySqlCommand sentencia = new MySqlCommand();
        //        sentencia.CommandText = "SELECT * FROM libros ORDER BY idLibro DESC LIMIT 9;";

        //        DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);

        //        if (tabla.Rows.Count > 0 && tabla != null)
        //        {
        //            for (int i = 0; i < tabla.Rows.Count; i++)
        //            {
        //                obj = new Libros(tabla.Rows[i].ItemArray);
        //                list.Add(obj);
        //            }
        //        }
        //    }
        //    catch (Exception m)
        //    {
        //        Console.WriteLine(m);
        //    }
        //    finally
        //    {
        //        DaoConexion.desconectar();
        //    }
        //    return list;
        //}

        //public int insertLibro(Libros obj)
        //{
        //    try
        //    {
        //        int valor = 0;
        //        MySqlCommand consulta = new MySqlCommand();
        //        consulta.CommandText = "INSERT INTO Libros(nombre, autor, editorial, isbn, fechaPublicacion, precio, numeroPaginas, descripcion, clasificacion) " +
        //                               "VALUES(@nombre, @autor, @editorial, @isbn, @fechaPublicacion, @precio, @numeroPaginas, @descripcion, @clasificacion); SELECT LAST_INSERT_ID();";
        //        consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
        //        consulta.Parameters.AddWithValue("@autor", obj.Autor);
        //        consulta.Parameters.AddWithValue("@editorial", obj.Editorial);
        //        consulta.Parameters.AddWithValue("@isbn", obj.ISBN);
        //        string fecha = obj.FechaPublicacion.ToString("yyyy-MM-dd"); //Convertimos fecha al formato necesario para guardar en MySQL
        //        consulta.Parameters.AddWithValue("@fechaPublicacion", fecha);
        //        consulta.Parameters.AddWithValue("@precio", obj.Presio);
        //        consulta.Parameters.AddWithValue("@numeroPaginas", obj.NPaginas);
        //        consulta.Parameters.AddWithValue("@descripcion", obj.Descripcion);
        //        consulta.Parameters.AddWithValue("@clasificacion", obj.Clasificacion);


        //        valor = DaoConexion.ejecutarSentencia(consulta, true);

        //        return valor;
        //    }
        //    catch (Exception m)
        //    {
        //        return 0;
        //    }
        //    finally
        //    {
        //        DaoConexion.desconectar();
        //    }
        //}
        public bool updateEstatusPedido(Pedidos obj)
        {
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "UPDATE Pedidos SET estatusPedido = @estatusPedido WHERE idPedido = @idPedido";

                consulta.Parameters.AddWithValue("@idPedido", obj.idPedido);
                consulta.Parameters.AddWithValue("@estatusPedido", obj.estatusPedido);

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

        //public bool deleteLibro(int id)
        //{
        //    try
        //    {

        //        MySqlCommand consulta = new MySqlCommand();
        //        consulta.CommandText = "DELETE FROM Libros WHERE idLibro = @idLibro";

        //        consulta.Parameters.AddWithValue("@idLibro", id);

        //        if (DaoConexion.ejecutarSentencia(consulta, false) > 0)
        //            return true;
        //        else
        //            return false;

        //    }
        //    catch (Exception m)
        //    {
        //        return false;
        //    }
        //    finally
        //    {
        //        DaoConexion.desconectar();
        //    }

        //}
    }
}
