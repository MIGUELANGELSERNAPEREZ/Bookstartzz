<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulos.aspx.cs" Inherits="Bookstarzz.FrmGestionTitulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/main.css">  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>GESTION DE TITULOS</h1>
            <div>
                <div class="form-group">
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtNombre" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="Autor"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtAutor" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Numero de paginas"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtNumPaginas" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Clasificacion"></asp:Label>
                        <asp:DropDownList class="form-control" ID="dropDownClasificacion" runat="server">
                            <asp:ListItem Selected="True" Value="Niños" runat="server">Niños</asp:ListItem>
                            <asp:ListItem Value="Adolecentes" runat="server">Adolecentes</asp:ListItem>
                            <asp:ListItem Value="Adultos" runat="server">Adultos</asp:ListItem>
                        </asp:DropDownList>
                        
                    </div>
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="Categoria"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtCategoria" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Editorial"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtEditorial" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label7" runat="server" Text="ISBN"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtISBN" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label8" runat="server" Text="Fecha de publicacion"></asp:Label>
                        <asp:Calendar ID="calendarFechaPub" runat="server"></asp:Calendar>
                    </div>
                    <div>
                        <asp:Label ID="Label9" runat="server" Text="Precio"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtPrecio" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label10" runat="server" Text="Descripcion"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtDescripcion" TextMode="MultiLine" Rows="10" runat="server"></asp:TextBox><br />
                    </div>
                    <asp:Button type="button" class="btn btn-success"  ID="btnCRUD" runat="server" Text="ACEPTAR" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </form>
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="popper/popper.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="frmMenu.js"></script> 
</asp:Content>
