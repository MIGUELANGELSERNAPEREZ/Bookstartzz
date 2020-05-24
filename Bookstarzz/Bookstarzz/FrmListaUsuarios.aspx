<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmListaUsuarios.aspx.cs" Inherits="Bookstarzz.FrmListaUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/datatable.css" rel="stylesheet" />
    <title>Usuarios</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>            
        <input type="hidden" id="IdMunicipio"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/ws/WSUsuarios" />
            </Services>
        </asp:ScriptManager>
    <h1>Usuarios registrados</h1>
    <div class="row justify-content-center my-2">
        <button id="btnAgregar" type="button" class="btn btn-primary">Agregar</button>    
    </div>
    <table id="tblUsuarios" class="table table-striped table-bordered"></table>

       </div>
    </form>
</body>
</html>

<script src="js/datatables.js"></script>
