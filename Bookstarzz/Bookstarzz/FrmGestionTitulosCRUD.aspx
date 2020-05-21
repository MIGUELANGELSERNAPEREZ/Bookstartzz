<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulosCRUD.aspx.cs" Inherits="Bookstarzz.FrmGestionTitulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body_bloque_2" runat="server">
    <form id="formGestionTCRUD" runat="server">
        <!--Este input recibe un valor en caso de que la accion sea Modificar -->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
            </Services>
        </asp:ScriptManager>
        <input type="hidden" id="txtIdLibro" value="<%= Request["inpIdLibro"] != null ? Request["inpIdLibro"] : "0" %>" />
        <div>
            <h1 id="tituloFRM"></h1>
            <div>
                <div class="form-group">
                    <div>
                        <asp:Label ID="lblIDLib" runat="server" Text="ID"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtIDLib" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtNombre" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="lblAutor" runat="server" Text="Autor"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtAutor" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="lblNumPaginas" runat="server" Text="Numero de paginas"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtNumPaginas" autocomplete="off" placeholder="0" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblClasificacion" runat="server" Text="Clasificacion"></asp:Label>
                        <asp:DropDownList class="form-control" ID="dropDownClasificacion" runat="server">
                            <asp:ListItem Selected="True" Value="Niños" runat="server">Niños</asp:ListItem>
                            <asp:ListItem Value="Adolecentes" runat="server">Adolescentes</asp:ListItem>
                            <asp:ListItem Value="Adultos" runat="server">Adultos</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div>
                        <asp:Label ID="lblEditorial" runat="server" Text="Editorial"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtEditorial" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="lblISBN" runat="server" Text="ISBN"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtISBN" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="lblCalendarFechaPub" runat="server" Text="Fecha de publicacion"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtCalendario" autocomplete="off" placeholder="yyyy-mm-dd" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblPrecio" runat="server" Text="Precio"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtPrecio" autocomplete="off" placeholder="$0.00" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtDescripcion" TextMode="MultiLine" Rows="10" autocomplete="off" resize="none" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-row my-3  justify-content-around">
                        <button id="btnAceptar" type="button" class="btn btn-success btn-lg">Aceptar</button>
                        <button id="btnCancelar" type="button" class="btn btn-danger btn-lg">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/bootstrap-datepicker.es.min.js"></script>
    <script src="FrmGestionTitulosCRUD.js"></script>
</asp:Content>
