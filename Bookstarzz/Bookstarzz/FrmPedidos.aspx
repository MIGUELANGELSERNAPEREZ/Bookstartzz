<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmPedidos.aspx.cs" Inherits="Bookstarzz.FrmPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/main.css">
    <link href="css/datatables.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body_bloque_2" runat="server">
    <form id="formPedidos" runat="server">

             <!-------------------INICIA MODAL---------------------->
    <div class="modal" id="mdlConfirmar" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title">Confirmar eliminación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                <p>¿Estás seguro que deseas eliminar el libro: <strong><span id="spnLibro"></span></strong>?</p>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" id="btnConfirmarEliminar" class="btn btn-danger">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
    <!--Termina modal -->
        <%--Este input revibe el id del Libro para poder realizar las operaciones de editar y eliminar en la misma pagina o en otras--%>
        <input type="hidden" id="inpIdLibro"/>
        <%--Se incluye la referencia al WebService--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <%--<asp:ServiceReference Path="~/ws/WSUsuarios.asmx" />--%>
                <asp:ServiceReference Path="~/ws/WSPedidos.asmx" />
            </Services>
        </asp:ScriptManager>
        <%--Este input guarda el id que servira para modificar el estatus del pedido--%>
        <input type="hidden" id="txtIdPedido" value="" />
        <center>
            <h1 id="h1GestionTitulos">PEDIDOS</h1>
        </center>

        <%--Tabla que sera llenada con el script FrmGestionTitulos, usando el WebService--%>
        <div>
            <table id="tblPedidos" class="table table-striped table-bordered"></table>
        </div>
        <div class="form-group">
            <asp:TextBox class="form-control" ID="txtDetallesPedido" Readonly="true" TextMode="MultiLine" Rows="10" autocomplete="off" resize="none" runat="server"></asp:TextBox><br />
        </div>
        <div class="row justify-content-center my-2">
            <button id="btnEntregado" type="button" class="btn btn-primary" >Marcar como entregado</button>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="js/datatables.js"></script>
    <%--Librerias para transformar datos de objetos DateTime--%>
    <script src="js/moment.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="FrmPedidos.js"></script>
</asp:Content>