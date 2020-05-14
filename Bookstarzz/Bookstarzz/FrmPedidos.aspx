<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="FrmPedidos.aspx.cs" Inherits="Bookstarzz.FrmPedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
    <h1>PEDIDOS</h1>
        <div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView><br />
            </div>
            <div>
                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="10" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Marcar como enviado" />
                <asp:Button ID="Button2" runat="server" Text="Marcar como pendiente" />
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
