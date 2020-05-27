using System;
using System.Collections.Generic;
using System.Text;
using Backend.clases;
using MySql.Data.MySqlClient;
using System.Data;
using Backend.Modelos;

namespace Backend.Modelos
{
    public class DaoUsuario
    {
        // regresa un usuario con los datos necesarios para comparar si el
        // usuario a registrarse es existente
        public Usuario getLogin(Usuario obj)
        {
            Usuario objUsu = null;
            try
            {

            MySqlCommand consulta = new  MySqlCommand();
            consulta.CommandText = "SELECT idUsuario, Email, contrasena, tipo FROM users " +
                "WHERE Email = @email and Contrasena = sha1(@contrasena);";
            consulta.Parameters.AddWithValue("email",obj.Email);
            consulta.Parameters.AddWithValue("Contrasena",obj.Password);

            DataTable tabla = DaoConexion.ejecutarConsulta(consulta);

            if (tabla.Rows.Count > 0 && tabla!= null)
            {
                objUsu = new Usuario();
                objUsu.logiarme(tabla.Rows[0].ItemArray);
            }

            DaoConexion.desconectar();

                return objUsu;
            }
            catch (Exception m)
            {
                Console.WriteLine(m);
                return objUsu;
            }  
        }

        public Usuario userExist(Usuario obj)
        {
            Usuario objUsu = null;
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "SELECT * FROM users WHERE email = (@email)" +
                    " or usuario = (@usuario) or telefono = (@telefono);";
                consulta.Parameters.AddWithValue("@email", obj.Email);
                consulta.Parameters.AddWithValue("@usuario", obj.UsuarioN);
                consulta.Parameters.AddWithValue("@telefono", obj.Telefono);

                DataTable tabla = DaoConexion.ejecutarConsulta(consulta);

                if (tabla.Rows.Count > 0 && tabla != null)
                {
                    objUsu = new Usuario(tabla.Rows[0].ItemArray);
                }

                DaoConexion.desconectar();

                return objUsu;
            }
            catch (Exception m)
            {
                Console.WriteLine(m);
                return objUsu;
            }

            
        }

        public List<Usuario> getAll()
        {
            List<Usuario> lista = new List<Usuario>();
            Usuario obj = null;
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "SELECT * FROM users;";

                DataTable tabla = DaoConexion.ejecutarConsulta(sentencia);
                if (tabla.Rows.Count > 0 && tabla!= null)
                {
                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        obj = new Usuario(tabla.Rows[i].ItemArray);
                        lista.Add(obj);
                    }

                }

                return lista;
            }
            catch (MySqlException ex)
            {
                throw new Exception("Se ha presentado un problema al obtener los datos");
            }

            finally
            {
                DaoConexion.desconectar();
            }
        }
        public int insertUser(Usuario obj)
        {
            int valor = 0;
            try
            {

            MySqlCommand consulta = new MySqlCommand();
            consulta.CommandText = "INSERT INTO users(Nombre,ApellidoP,ApellidoM," +
                "Email,Contrasena,tipo,usuario,telefono)VALUES(@nombre,@apellidoP,@apellidoM," +
                "@email,sha1(@pass),1,@usuario,@telefono);";

            consulta.Parameters.AddWithValue("@nombre",obj.Nombre);
            consulta.Parameters.AddWithValue("@apellidoP", obj.ApellidoP);
            consulta.Parameters.AddWithValue("@apellidoM", obj.ApellidoM);
            consulta.Parameters.AddWithValue("@email", obj.Email);
            consulta.Parameters.AddWithValue("@pass", obj.Password);
            consulta.Parameters.AddWithValue("@usuario", obj.UsuarioN);
            consulta.Parameters.AddWithValue("@telefono", obj.Telefono);
            
                valor = DaoConexion.ejecutarSentencia(consulta,false);

            DaoConexion.desconectar();
            }
            catch (Exception m)
            {
                Console.WriteLine(m);
            }

            return valor;

        }

        public bool Update(Usuario obj)
        {

            string sentencia = "UPDATE users SET Nombre = @nombre,"
                                + "ApellidoP = @apellidoP,"
                                + "ApellidoM = @apellidoM,"
                                + "Email = @email,"
                                + "contrasena = @contrasena,"
                                + "tipo = @tipo"
                                + "usuario = @usuario"
                                + "telefono = @tel,"
                                + "tarjeta = @tarjeta"
                                + "WHERE idUsuario = @idUsuario;";

            try
            {

                MySqlCommand consulta = new MySqlCommand(sentencia);
                consulta.Parameters.AddWithValue("@nombre", obj.Nombre);
                consulta.Parameters.AddWithValue("@apellidoP", obj.Nombre);
                consulta.Parameters.AddWithValue("@apellidoM", obj.Nombre);
                consulta.Parameters.AddWithValue("@email", obj.Nombre);
                consulta.Parameters.AddWithValue("@tipo", obj.Nombre);
                consulta.Parameters.AddWithValue("@usuario", obj.Nombre);
                consulta.Parameters.AddWithValue("@tel", obj.Nombre);
                consulta.Parameters.AddWithValue("@tarjeta", obj.Nombre);

                int valor = DaoConexion.ejecutarSentencia(consulta, false);

                if (valor == 1)
                {
                    return true;
                }
                else
                {
                    return false;
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

            return false;
        }


        public bool Delete(int id)
        {

            string sentencia = "Delete FROM users where idUsuario= @id";                               

            try
            {

                MySqlCommand consulta = new MySqlCommand(sentencia);
                consulta.Parameters.AddWithValue("@id", id);
                
                int valor = DaoConexion.ejecutarSentencia(consulta, false);

                if (valor == 1)
                {
                    return true;
                }
                else
                {
                    return false;
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

            return false;
        }

        public Usuario getOne(int id)
        {

            Usuario obj = null;

            try
            {
                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "SELECT * FROM users where IdUsuario = @id;";
                consulta.Parameters.AddWithValue("@id", id);

                DataTable tabla = DaoConexion.ejecutarConsulta(consulta);
                if (tabla.Rows.Count > 0)
                {
                    obj = new Usuario(tabla.Rows[0].ItemArray);
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

    }
}
