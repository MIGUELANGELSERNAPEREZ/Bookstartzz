<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGenerarReportes.aspx.cs" Inherits="Bookstarzz.FrmGenerarReportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:GridView ID="gridExport" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
         
            <AlternatingRowStyle BackColor="White" />
         
       <Columns>
           <asp:BoundField DataField="idUsuario" HeaderText="Id"/>
           <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
           <asp:BoundField DataField="ApellidoP" HeaderText="Apellido Paterno"/>
           <asp:BoundField DataField="ApellidoM" HeaderText="Apellido Materno" />
           <asp:BoundField DataField="Email" HeaderText="Email"/>
           <asp:BoundField DataField="Password" HeaderText="Password" />
           <asp:BoundField DataField="Tipo" HeaderText="Tipo"/>
           <asp:BoundField DataField="UsuarioN" HeaderText="Usuario" />
           <asp:BoundField DataField="Telefono" HeaderText="Telefono"/>
           <asp:BoundField DataField="Targeta" HeaderText="Targeta" />
          

       </Columns>

            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />

    </asp:GridView>

            <asp:Button ID="Button1" runat="server" Text="Importar a Excel" OnClick="Button1_Click" />
        </div>
        </form>

    
</body>
</html>
