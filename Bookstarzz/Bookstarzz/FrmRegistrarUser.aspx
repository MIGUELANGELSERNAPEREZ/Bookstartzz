<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraAfuera.Master" AutoEventWireup="true" CodeBehind="FrmRegistrarUser.aspx.cs" Inherits="Bookstarzz.FrmRegistrarUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.css" rel="stylesheet" />
    <link href="validaciones/boostrapValidator.min.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
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

   <div class="alert alert-danger hide" role="alert">
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
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="validaciones/bootstrapValidator.js"></script>
    <script src="FrmRegistrarUser.js"></script>
</asp:Content>
