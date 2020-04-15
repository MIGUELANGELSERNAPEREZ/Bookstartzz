<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraAfuera.Master" AutoEventWireup="true" CodeBehind="FrmRegistrarUser.aspx.cs" Inherits="Bookstarzz.FrmRegistrarUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <!-- Small modal -->

<div class="modal fade bd-example-modal-sm" id="mdlConfirmar"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <h2>Agregado exitosamente!!</h2>
    </div>
  </div>
</div>

   <center>
    <h1>Registrate</h1>
    
  <form  runat="server">
    <asp:label text="Nombre" runat="server"/> <br />
    <input type="text" name="txtNombre" value="" runat="server" id="txtNombre"
        required=""/>
    <br />
    <asp:label text="Apellido Paterno" runat="server"/> <br />
    <input type="text" name="txtApellidoP" value="" runat="server" id="txtApellidoP"
        required/>
    <br />
    <asp:label text="Apellido Materno" runat="server"/> <br />
    <input type="text" name="txtApellidoM" value="" runat="server" id="TxtApellidoM"
        required/>
    <br />
    <asp:label text="Email" runat="server"/> <br />
    <input type="email"  name="txtEmail" value="" runat="server" id="txtEmail"
        placeholder="name@example.com" required/>
    <br />
    <asp:label text="Contraseña" runat="server"/> <br />
    <input type="text" name="txtPass" value="" runat="server" id="TxtPass" required/>
       <br />
    <asp:label text="Confirmar" runat="server"/> <br />
    <input type="text" name="txtConfirmar" value="" runat="server" id="txtConfirmar" required/>
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
