using System;
using System.Collections.Generic;
using System.Text;

namespace Backend.clases
{
    public class Usuario
    {
        //tipo = 1 usuario
        //tipo = 2 admin
        public int IdUsuario { get; set; }
        public String Nombre { get; set; }
        public string ApellidoP { get; set; }
        public string ApellidoM { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Tipo { get; set; }
        public string UsuarioN { get; set; }
        public string Telefono { get; set; }
        public string Targeta { get; set; }

        public Usuario(string nombre, string ApellidoP, string ApellidoM, String email,
            string password, int tipo,string usuarioN, string telefono, string targeta)
        {
            this.Nombre = nombre;
            this.ApellidoP = ApellidoP;
            this.ApellidoM = ApellidoM;
            this.Email = email;
            this.Password = password;
            this.Tipo = tipo;
            this.UsuarioN = usuarioN;
            this.Telefono = telefono;
            this.Targeta = targeta;
        }

        public Usuario(Object[]campos)
        {
            this.IdUsuario = int.Parse(campos[0].ToString());
            this.Nombre = campos[1].ToString();
            this.ApellidoP = campos[2].ToString();
            this.ApellidoM = campos[3].ToString();
            this.Email = campos[4].ToString();
            this.Password = campos[5].ToString();
            if (campos[6].ToString().Equals("user"))
            {
                this.Tipo = 1;
            }
            else
            {
                this.Tipo = 2;
            }
            this.UsuarioN = campos[7].ToString();
            this.Telefono = campos[8].ToString();
            this.Targeta = campos[9].ToString();

        }

        public Usuario() { }

        public void logiarme(Object[]campos)
        {
            this.IdUsuario = int.Parse(campos[0].ToString());
            this.Email = campos[1].ToString();
            this.Password = campos[2].ToString();

            if (campos[3].ToString().Equals("user"))
            {
                this.Tipo = 1;
            }
            else
            {
                this.Tipo = 2;
            }

            
        }
    }
}
