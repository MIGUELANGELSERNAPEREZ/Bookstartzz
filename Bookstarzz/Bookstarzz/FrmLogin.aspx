<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="Bookstarzz.FrmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bookstarzz</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />

     <style>
        body {
            background-color: #eee;
        }

        header {
            line-height: 1;
            border-bottom: 4px solid black;
            font-weight: bold !important;
            background-color: white;
        }

            header .row {
                margin-right: 0;
            }

        footer {
            padding: .5rem 0 0;
            color: #076a7a;
            text-align: center;
            background-color: #f9f9f9;
            border-top: 4px solid #17a2b8;
        }

            footer p {
                margin-bottom:.5rem;
            }

        .bg-cyan {
            background-color: #17a2b8;
        }

        .container {
            background-color: #fff;
        }

        .dropdown-item:hover {
            background-color: #ade8f1;
        }
    </style>
</head>

   <body class="d-flex flex-column h-100">
    <header class="py-1">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Bookstartzz</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="FrmRegistrarUsu">Registrate <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="FrmLogin">Iniciar Sesion</a>
      </li>

      <li class="nav-item">
        <a class="nav-link disabled" href="#">Conocenos</a>
      </li>
    </ul>
  
  </div>
</nav>
    </header>
    <di class="nav-scroller mb-2">
        <div class="navbar sticky-top navbar-expand-md navbar-dark bg-danger font-weight-bold">            
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
            
                <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control"  autocomplete="off" runat="server" required MaxLength="20"></asp:TextBox>
              <div class="invalid-feedback">
                El correo electrónico es obligatorio y debe tener un formato válido
              </div>
            </div>
        </div>
        <div class="form-row justify-content-center">
            <asp:Button ID="btnIniciarSesion" class="btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />
        </div>
    </form>
    </div>
    <footer class="mt-auto py-3">
        <p>by <a href="http:\\www.itsur.edu.mx">Instituto Tecnológico Superior del Sur de Guanajuato</a>.</p>
        <p>Programación Web II</p>
    </footer>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap.js"></script>

    
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

</body>
</html>
