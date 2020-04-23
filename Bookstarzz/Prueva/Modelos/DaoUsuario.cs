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

        public Usuario getUser(Usuario obj)
        {
            Usuario objUsu = null;
            try
            {

                MySqlCommand consulta = new MySqlCommand();
                consulta.CommandText = "SELECT * FROM users WHERE email = (@email)" +
                    " or usuario = (@usuario) or telefono = (@telefono) or" +
                    " tarjeta = (@tarjeta);";
                consulta.Parameters.AddWithValue("@email", obj.Email);
                consulta.Parameters.AddWithValue("@usuario", obj.UsuarioN);
                consulta.Parameters.AddWithValue("@telefono", obj.Telefono);
                consulta.Parameters.AddWithValue("@tarjeta", obj.Targeta);

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


        public int insertUser(Usuario obj)
        {
            int valor = 0;
            try
            {

            MySqlCommand consulta = new MySqlCommand();
            consulta.CommandText = "INSERT INTO users(Nombre,ApellidoP,ApellidoM," +
                "Email,Contrasena,tipo,usuario,telefono,tarjeta)VALUES(@nombre,@apellidoP,@apellidoM," +
                "@email,sha1(@pass),1,@usuario,@telefono,@targeta);";

            consulta.Parameters.AddWithValue("@nombre",obj.Nombre);
            consulta.Parameters.AddWithValue("@apellidoP", obj.ApellidoP);
            consulta.Parameters.AddWithValue("@apellidoM", obj.ApellidoM);
            consulta.Parameters.AddWithValue("@email", obj.Email);
            consulta.Parameters.AddWithValue("@pass", obj.Password);
            consulta.Parameters.AddWithValue("@usuario", obj.UsuarioN);
            consulta.Parameters.AddWithValue("@telefono", obj.Telefono);
            consulta.Parameters.AddWithValue("@targeta", obj.Targeta);
            
                valor = DaoConexion.ejecutarSentencia(consulta,false);

            DaoConexion.desconectar();
            }
            catch (Exception m)
            {
                Console.WriteLine(m);
            }

            return valor;

        }

        
    }
}
