<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraAfuera.Master" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="Bookstarzz.FrmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.min.css" rel="stylesheet" />
    <link href="validaciones/bootstrapValidator.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <center>
    <div class="container">
        <h1>Iniciar Sesion</h1>
    </div>
    </center>
    <div class="nav-scroller mb-2">
        <div class="navbar sticky-top navbar-expand-md navbar-dark bg-cyan font-weight-bold">            
        </div>
    </div>
    <div class="container px-3 py-3 mb-2">
    <form id="form1" runat="server" >
        <div id="divMensaje" class="alert alert-danger" runat="server">
            Ha ocurrido un error
        </div>

        <div id="divMsg" class="alert alert-danger" style="display:none;">
            Ha ocurrido un error
        </div>
        <div class="form-row justify-content-center">
            <div class="form-group col-md-4 mb-3">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail"  autocomplete="off" class="form-control" runat="server" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="txtPassword">Contraseña</label>
                <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control"  autocomplete="off" runat="server" required MaxLength="20"></asp:TextBox>
            </div>
        </div>
        <div class="form-row justify-content-center">
            <asp:Button ID="btnIniciarSesion" class="btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />
        </div>
    </form>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="validaciones/bootstrapValidator.js"></script>
    <script src="FrmLogin.min.js"></script>     
    
</asp:Content>
