<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulos.aspx.cs" Inherits="Bookstarzz.FrmTitulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/datatables.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body_bloque_2" runat="server">
    <form id="form1" runat="server">
        <h1>TITULOS</h1>
        <asp:GridView ID="grdVistaTitulos" CssClass="table table-bordered table-striped" runat="server">
            <Columns>
                <%--Los DataField son de la clase Libro, no de MySQL--%>
                <asp:BoundField DataField="IdLibro" HeaderText="Clave" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Autor" HeaderText="Autor" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                <asp:BoundField DataField="Editorial" HeaderText="Editorial" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="FechaPublicacion" HeaderText="Fecha de publicación" />
                <asp:BoundField DataField="Presio" HeaderText="Precio" />
                <asp:BoundField DataField="NPaginas" HeaderText="Páginas" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                <asp:BoundField DataField="Visitas" HeaderText="Visitas" />
                <asp:BoundField DataField="Clasificacion" HeaderText="Clasificación" />
            </Columns>
        </asp:GridView>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="js/datatables.js"></script>
    <script src="js/FrmGestionTitulos.js"></script>
</asp:Content>