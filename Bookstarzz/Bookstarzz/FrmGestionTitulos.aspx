<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulos.aspx.cs" Inherits="Bookstarzz.FrmTitulos" %>

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
    <script>
        $(document).ready(function () {
            /*
             *CORRECCION: El plugin requiere que la tabla tenga un thead con los encabezados de la
             * tabla y el gridview no genera este elemento, al traducir el gridview a tabla solo genera
             * un tbody y un tfooter, por lo que en el siguiente código adecúo la tabla antes de 
             * activar el plugin
             * */
            let tabla = $('#grdVistaTitulos');
            //Obtengo la fila de los encabezados en el gridview colocó en el tbody (la primera)
            let fila = $(tabla).find("tbody tr:first").clone();
            //La elimino del tbody
            $(tabla).find("tbody tr:first").remove();
            //Creo un elemento thead y le añado la fila de encabezados
            let encabezado = $("<thead/>").append(fila);
            //Añado el thead a la tabla antes del tbody
            $(tabla).children('tbody').before(encabezado);
            //Activamos el plugin
            $('#grdVistaTitulos').DataTable();


        });
        //function agregar() {
        //    $("#divContenido").load("FrmMunicipio.aspx");
        //}

        //function editar(btn) {
        //    let id = $(btn).closest("tr").children().first().text();
        //    $("#divContenido").load("FrmMunicipio.aspx", { "ClaveMun": id });
        //}

    </script>

</asp:Content>