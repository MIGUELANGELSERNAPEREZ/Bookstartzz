<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraAfuera.Master" AutoEventWireup="true" CodeBehind="FrmRegistrarUser.aspx.cs" Inherits="Bookstarzz.FrmRegistrarUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.css" rel="stylesheet" />
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
      <div class="form-group">
    <asp:label text="Nombre" runat="server" class="labels"/> <br />
    <input type="text" class="form-control" name="txtNombre" value="" runat="server" id="txtNombre"
        required="" maxlength="30" placeholder="Escribe tu nombre"/>
    </div>
    <br />
    <asp:label text="Apellido Paterno" class="labels" runat="server"/> <br />
    <input type="text" class="form-control" name="txtApellidoP" value="" runat="server" id="txtApellidoP"
        required maxlength="30" placeholder="Escribe tu apellido paterno"/>
    <br />
    <asp:label text="Apellido Materno" class="labels" runat="server"/> <br />
    <input type="text" class="form-control" name="txtApellidoM" value="" runat="server" id="TxtApellidoM"
        required maxlength="30" placeholder="Escribe tu apellido Materno"/>
    <br />
    <asp:label text="Email" class="labels" runat="server"/> <br />
    <input type="email" class="form-control" name="txtEmail" value="" runat="server" id="txtEmail"
        placeholder="name@example.com" required maxlength="40"/>
    <br />
    <asp:label text="Contraseña" class="labels" runat="server"/> <br />
    <input type="password" class="form-control" name="txtPass" value="" runat="server" id="TxtPass" required
        maxlength="8"/>
       <br />
    <asp:label text="Confirmar" class="labels" runat="server"/> <br />
    <input type="password" class="form-control" name="txtConfirmar" value="" runat="server" id="txtConfirmar" required
        maxlength="8"/>

      <br />
    <asp:label text="Usuario" class="labels" runat="server"/> <br />
    <input type="text" class="form-control" name="txtUsuario" value="" runat="server" id="txtUsuario" required
        maxlength="20" placeholder="ejeplo usu123"/>

    <br />
    <asp:label text="Telefono" class="labels" runat="server"/> <br />
    <input type="tel" name="txtTelefono" class="form-control" value="" runat="server" id="txtTel" required
        maxlength="10" minlength="10" placeholder="4451001856S"/>
      <br />    
    <asp:label text="Targeta" class="labels" runat="server"/> <br />
    <input type="text" name="txtTargeta" class="form-control"  runat="server" id="TxtTargeta" required
        maxlength="20" minlength="20" placeholder=""/>
      

      <br />
      <br />

    <asp:button text="Agregar" runat="server" id="btnAgregar" 
        class="btn btn-success btn-lg" OnClick="btnAgregar_Click"/>

    <button type="button"id="BtnCancelar" class="btn btn-danger btn-lg btn-block"
        OnClick="btnCancelar();">Cancelar</button>
    <br />
  </form>
   </center>
    <script>
        function btnCancelar() {
            window.location = "FrmLogin.aspx";
        }

    </script>

</asp:Content>
