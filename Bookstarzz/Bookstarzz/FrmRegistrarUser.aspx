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
    
  <form  runat="server">
    <asp:label text="Nombre" runat="server"/> <br />
    <input type="text" name="txtNombre" value="" runat="server" id="txtNombre"
        required="" maxlength="30"/>
    <br />
    <asp:label text="Apellido Paterno" runat="server"/> <br />
    <input type="text" name="txtApellidoP" value="" runat="server" id="txtApellidoP"
        required maxlength="30"/>
    <br />
    <asp:label text="Apellido Materno" runat="server"/> <br />
    <input type="text" name="txtApellidoM" value="" runat="server" id="TxtApellidoM"
        required maxlength="30"/>
    <br />
    <asp:label text="Email" runat="server"/> <br />
    <input type="email"  name="txtEmail" value="" runat="server" id="txtEmail"
        placeholder="name@example.com" required maxlength="40"/>
    <br />
    <asp:label text="Contraseña" runat="server"/> <br />
    <input type="password" name="txtPass" value="" runat="server" id="TxtPass" required
        maxlength="8"/>
       <br />
    <asp:label text="Confirmar" runat="server"/> <br />
    <input type="password" name="txtConfirmar" value="" runat="server" id="txtConfirmar" required
        maxlength="8"/>

      <br />
    <asp:label text="Usuario" runat="server"/> <br />
    <input type="text" name="txtUsuario" value="" runat="server" id="txtUsuario" required
        maxlength="20"/>

    <br />
    <asp:label text="Telefono" runat="server"/> <br />
    <input type="tel" name="txtTelefono" value="" runat="server" id="txtTel" required
        maxlength="10" minlength="10"/>
      <br />    
    <asp:label text="Targeta" runat="server"/> <br />
    <input type="text" name="txtTargeta" value="" runat="server" id="TxtTargeta" required
        maxlength="20" minlength="20"/>
      

      <br />
      <br />

    <asp:button text="Agregar" runat="server" id="btnAgregar" class="btn btn-success" OnClick="btnAgregar_Click"/>
    <button type="button"id="BtnCancelar" class="btn btn-danger" OnClick="btnCancelar();">Cancelar</button>
    <br />
  </form>
   </center>
    <script>
        function btnCancelar() {
            window.location = "FrmLogin.aspx";
        }

    </script>

</asp:Content>
