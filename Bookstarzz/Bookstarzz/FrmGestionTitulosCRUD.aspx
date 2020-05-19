<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulosCRUD.aspx.cs" Inherits="Bookstarzz.FrmGestionTitulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body_bloque_2" runat="server">
    <form id="formGestionTCRUD" runat="server">
        <div>
            <h1>GESTION DE TITULOS</h1>
            <div>
                <div class="form-group">
                    <div>
                        <asp:TextBox class="form-control" ID="txtidLibro" autocomplete="off" runat="server"></asp:TextBox><br />
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
                        <asp:Label ID="lblCategoria" runat="server" Text="Categoria"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtCategoria" autocomplete="off" runat="server"></asp:TextBox><br />
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
                    <div>
                        <asp:Button type="button" class="btn btn-success" ID="btnCRUD" runat="server" Text="ACEPTAR" OnClick="btnCRUD_Click" />
                    </div>
                    <div>
                        <asp:Button type="button" class="btn btn-danger" ID="btnCancelar" runat="server" Text="CANCELAR" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- jQuery, Popper.js, Bootstrap JS -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/bootstrap-datepicker.es.min.js"></script>
    <script src="FrmGestionTitulosCRUD.js"></script>
</asp:Content>
