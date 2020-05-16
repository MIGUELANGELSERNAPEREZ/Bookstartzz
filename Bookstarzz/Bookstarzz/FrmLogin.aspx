<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraAfuera.Master" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="Bookstarzz.FrmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <div class="nav-scroller mb-2">
        <div class="navbar sticky-top navbar-expand-md navbar-dark bg-cyan font-weight-bold">            
        </div>
    </div>
    <div class="container px-3 py-3 mb-2">
    <form id="form1" runat="server" novalidate>
        <div id="divMensaje" class="alert alert-danger" runat="server">
            Ha ocurrido un error
        </div>

        <div id="divMsg" class="alert alert-danger" style="display:none;">
            Ha ocurrido un error
        </div>
        <div class="form-row justify-content-center">
        <div class="col-md-4 mb-3">
            <h1>Inicia Sesion</h1>
            <br />
          <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" TextMode="Email" autocomplete="off" class="form-control" runat="server" required></asp:TextBox>
              <div class="invalid-feedback">
                El correo electrónico es obligatorio y debe tener un formato válido
              </div>
            </div>
        </div>
        <div class="form-row justify-content-center">
            <div class="col-md-4 mb-3">
              <label for="txtPassword">Contraseña</label>            
                <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control"
                    autocomplete="off" runat="server" required MaxLength="20"></asp:TextBox>
             
                <div class="invalid-feedback">
                El correo electrónico es obligatorio y debe tener un formato válido
              </div>
            </div>
        </div>
        <br />
        <div class="form-row justify-content-center">
            <asp:Button ID="btnIniciarSesion" class="btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />             
        </div>
        <br />
        <br />
    </form>
    </div>
    
    <script>
        window.addEventListener('load', function () {
            var btn = document.getElementById("btnIniciarSesion");
            btn.addEventListener('click', function (evento) {
                
                //Obtener los controles a validar
                var txtEmail = document.getElementById("txtEmail");
                var txtPass = document.getElementById("txtPassword");
                try {
                    //Limpiar los estilos de validación
                    txtEmail.classList.remove('is-valid', 'is-invalid');
                    txtPass.classList.remove('is-valid', 'is-invalid');

                    //Obtener los valores ingresados en los controles
                    var email = txtEmail.value.trim();
                    var pass = txtPass.value.trim();

                    //Verificar si se ha ingresado datos en ellos
                    if (email == "" || pass == "") {
                        if (email == "") {
                            txtEmail.classList.add('is-invalid');
                        } else {
                            txtEmail.classList.add('is-valid');
                        }

                        if (pass == "") {
                            txtPass.classList.add('is-invalid');
                        } else {
                            txtPass.classList.add('is-valid');
                        }
                        //Cancelar el submit
                        evento.preventDefault();
                    }
                } catch (e) {
                    //mandar mensaje
                    document.getElementById('divMsg').style.display = 'block';
                    //cancelar submit
                    evento.preventDefault();
                    //salirme del método
                }
            });
        });
</script>

</asp:Content>
