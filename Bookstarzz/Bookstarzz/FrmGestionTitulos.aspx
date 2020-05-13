<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulos.aspx.cs" Inherits="Bookstarzz.FrmGestionTitulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>GESTION DE TITULOS</h1>
            <div>
                <div>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="Autor"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Numero de paginas"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label4" runat="server" Text="Clasificacion"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="Categoria"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Editorial"></asp:Label>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label7" runat="server" Text="ISBN"></asp:Label>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label8" runat="server" Text="Fecha de publicacion"></asp:Label>
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </div>
                    <div>
                        <asp:Label ID="Label9" runat="server" Text="Precio"></asp:Label>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><br />
                    </div>
                    <div>
                        <asp:Label ID="Label10" runat="server" Text="Descripcion"></asp:Label>
                        <asp:TextBox ID="TextBox8" TextMode="MultiLine" Rows="10" runat="server"></asp:TextBox><br />
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="ACEPTAR" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
