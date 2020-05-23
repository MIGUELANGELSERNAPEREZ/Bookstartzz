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

<div class="modal fade bd-example-modal-sm" id="mdlExiste"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <h2>EL usuario ya existe!!</h2>
    </div>
  </div>
</div>

   <center>
    <h1>Registrate</h1>
    
  <form  runat="server" id="FormMenu">

      <!-- acceder al webService-->
<asp:ScriptManager ID="ScriptManager1" runat="server">
    
   <Services>
            <asp:ServiceReference Path="~/ws/WSUsuarios.asmx" />
   </Services>

</asp:ScriptManager>
      
      <div class="form-group">
        <asp:label text="Nombre" runat="server" class="labels"/> <br />
        <input type="text" class="form-control" name="txtNombre" value="" runat="server" id="txtNombre"
            required="" maxlength="30" placeholder="Escribe tu nombre"/>
    </div>
    <br />

    <div class="form-group">
        <asp:label text="Apellido Paterno" class="labels" runat="server"/> <br />
        <input type="text" class="form-control" name="txtApellidoP" value="" runat="server" id="txtApellidoP"
            required maxlength="30" placeholder="Escribe tu apellido paterno"/>
    </div>
    <br />

    <div class="form-group">
        <asp:label text="Apellido Materno" class="labels" runat="server"/> <br />
        <input type="text" class="form-control" name="txtApellidoM" value="" runat="server" id="TxtApellidoM"
            required maxlength="30" placeholder="Escribe tu apellido Materno"/>
    </div>
        <br />
    <div class="form-group">
        <asp:label text="Email" class="labels" runat="server"/> <br />
        <input type="email" class="form-control" name="txtEmail" value="" runat="server" id="txtEmail"
            placeholder="name@example.com" required maxlength="40"/>
    
     </div>   
        <br />
      <div class="form-group">
        <asp:label text="Contraseña" class="labels" runat="server"/> <br />
        <input type="password" class="form-control" name="txtPass" value="" runat="server" id="TxtPass" required
            maxlength="8"/>
    </div>
       <br />
      <div class="form-group">
        <asp:label text="Confirmar" class="labels" runat="server"/> <br />
        <input type="password" class="form-control" name="txtConfirmar" value="" runat="server" id="txtConfirmar" required
            maxlength="8"/>
       </div>
      <br />
      <div class="form-group">
        <asp:label text="Usuario" class="labels" runat="server"/> <br />
        <input type="text" class="form-control" name="txtUsuario" value="" runat="server" id="txtUsuario" required
            maxlength="20" placeholder="ejeplo usu123"/>
    </div>
    <br />

      <div class="form-group">
        <asp:label text="Telefono" class="labels" runat="server"/> <br />
        <input type="tel" name="txtTelefono" class="form-control" value="" runat="server" id="txtTel" required
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
    <script src="FrmRegistrarUser.js"></script>
</asp:Content>
