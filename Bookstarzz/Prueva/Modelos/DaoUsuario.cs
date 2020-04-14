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
        public Usuario getUser(Usuario obj)
        {
            Usuario objUsu = null;
            try
            {

            MySqlCommand consulta = new  MySqlCommand();
            consulta.CommandText = "SELECT idUsuario, Email, contrasena, tipo FROM users " +
                "WHERE Email = @email and Contrasena = @contrasena;";
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
                
            }

            return objUsu;
        }
    }
}
