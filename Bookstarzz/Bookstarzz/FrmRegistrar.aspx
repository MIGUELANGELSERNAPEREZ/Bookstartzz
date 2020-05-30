<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmRegistrar.aspx.cs" Inherits="Bookstarzz.FrmRegistrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/estilo.css" rel="stylesheet" />
    <link href="validaciones/boostrapValidator.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
   

<div class="card bg-dark text-white">
  <img class="card-img" src="imagenes/usuarios.png" alt="imagen de una dibujo que simula a un usuario">
  <div class="card-img-overlay">
      
  </div>
</div>

    <br />
  <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
      <div class="card-header">Suscribete</div>
      <div class="card-body">
        <h5 class="card-title">La mejor pagina de lectura</h5>
        <p class="card-text">La pagina numero uno en libros en mexico.</p>
      </div>
</div>
<div class="card text-white bg-secondary mb-3" style="max-width: 18rem;">
  <div class="card-header">Sumate a la lectura</div>
  <div class="card-body">
    <h5 class="card-title">Manejamos concursos de lectura</h5>
    <p class="card-text">Puedes mostrar tus abilidades de lectura contra personas de todo el pais.</p>
  </div>
</div>
<div class="card text-white bg-success mb-3" style="max-width: 18rem;">
  <div class="card-header">Concursa</div>
  <div class="card-body">
    <h5 class="card-title">Hay premios!!</h5>
    <p class="card-text">Manejamos concursos para ganarte los libros de tu preferencia.</p>
  </div>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">
  <!-- Small modal Agregar-->

<div class="modal fade bd-example-modal-sm" id="mdlConfirmar"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <h2>Agregado exitosamente!!</h2>
    </div>
  </div>
</div>

 <!-- Small modal Existente-->

<div class="modal fade bd-example-modal-sm" id="mdlModificar"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <h2>Actualizacion correcta!!</h2>
    </div>
  </div>
</div>

   <center>
    <h1>Registrate</h1>

   <div class="alert alert-danger hide" role="alert" style="display:none">
      <strong>Error:</strong> <span id="cntMsg">Ha ocurrido un error al intentar cargar la información</span>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>



           <form  runat="server" id="FormMenu">

              <!-- acceder al webService-->
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
    
                       <Services>
                                <asp:ServiceReference Path="~/ws/WSUsuarios.asmx" />
                       </Services>

                    </asp:ScriptManager>
      
      
                          <input type="hidden" id="txtSesion" value="<%= Request["session"] != null ? Request["session"] : "0" %>"/>
                          <input type="hidden" id="txtEditar" value="<%= Request["editar"] != null ? Request["editar"] : "0" %>"/>


                          <div class="form-group">
                            <asp:label text="Nombre" runat="server" class="labels"/> <br />
                            <input type="text" class="form-control" name="txtNombre" id="txtNombre"
                                required="" maxlength="30" placeholder="Escribe tu nombre"/>
                        </div>
                        <br />

                        <div class="form-group">
                            <asp:label text="Apellido Paterno" class="labels" runat="server"/> <br />
                            <input type="text" class="form-control" name="txtApellidoP" id="txtApellidoP"
                                required maxlength="30" placeholder="Escribe tu apellido paterno"/>
                        </div>
                        <br />

                        <div class="form-group">
                            <asp:label text="Apellido Materno" class="labels" runat="server"/> <br />
                            <input type="text" class="form-control" name="txtApellidoM" id="txtApellidoM"
                                required maxlength="30" placeholder="Escribe tu apellido Materno"/>
                        </div>
                            <br />
                        <div class="form-group">
                            <asp:label text="Email" class="labels" runat="server"/> <br />
                            <input type="email" class="form-control" name="txtEmail" id="txtEmail"
                                placeholder="name@example.com" required maxlength="40"/>
    
                         </div>   
                            <br />
                          <div class="form-group">
                            <asp:label text="Contraseña" class="labels" runat="server"/> <br />
                            <input type="password" class="form-control" name="txtPass" id="txtPass" required
                                maxlength="8"/>
                        </div>
                           <br />
                          <div class="form-group">
                            <asp:label text="Confirmar" class="labels" runat="server"/> <br />
                            <input type="password" class="form-control" name="txtConfirmar" id="txtConfirmar" required
                                maxlength="8"/>
                           </div>
                          <br />
                          <div class="form-group">
                            <asp:label text="Usuario" class="labels" runat="server"/> <br />
                            <input type="text" class="form-control" name="txtUsuario" id="txtUsuario" required
                                maxlength="20" placeholder="ejeplo usu123"/>
                        </div>
                        <br />

                          <div class="form-group">
                            <asp:label text="Telefono" class="labels" runat="server"/> <br />
                            <input type="tel" name="txtTelefono" class="form-control" id="txtTel" required
                                maxlength="10" minlength="10" placeholder="4451001856S"/>
                          </div>
                               <br />
                   
                       <button type="button" id="BtnAgregar" name="BtnAgregar"
                           class="btn btn-success  btn-lg">Agregar</button>

                        <button type="button" id="BtnCancelar" name="btnCancelar"
                            class="btn btn-danger btn-lg">Cancelar</button>
                        <br />
          </form>
 
           </center>

        <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
     <script src="validaciones/bootstrapValidator.js"></script>
    <script src="FrmRegistrarUser.js"></script>
</asp:Content>
