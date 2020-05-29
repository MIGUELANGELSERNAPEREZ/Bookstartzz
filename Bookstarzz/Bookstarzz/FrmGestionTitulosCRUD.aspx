<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmGestionTitulosCRUD.aspx.cs" Inherits="Bookstarzz.FrmGestionTitulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/bootstrapValidator.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body_bloque_2" runat="server">
    <div id="divMsg" class="alert" style="display:none;" role="alert">
      <strong id="tipoMsg"></strong> <span id="cntMsg"></span>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>

    <form id="formGestionTCRUD" class="tblsDatatablesCRUD" runat="server">
     <%--Este input valida que no se pueda acceder explicitamente a la URL FrmPedidos.aspx--%>
    <input type="hidden" id="txtURL" value="<%= Request["txtURL"] != null ? Request["txtURL"] : "0" %>" />
         <%--Si la sesion no existe, redirecciona al login--%>
                    <%
                        if (Session["session"] == null || Session["session"].Equals("usu"))
                        {
                            Response.Redirect("FrmLogin.aspx");
                        }
                    %>
        <div class="container p-3 mb-2"> 
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
            </Services>
        </asp:ScriptManager>
        <center>
        <!--Este input recibe un valor en caso de que la accion sea Modificar -->
        <input type="hidden" id="txtIdLibro" value="<%= Request["inpIdLibro"] != null ? Request["inpIdLibro"] : "0" %>" />
        <%--Este input recibe un valor en caso de que haya una recarga de la pagina por el metodo de insercion--%>
        <input type="hidden" id="txtInpMensaje" value="<%= Request["txtInpMensaje"] != null ? Request["txtInpMensaje"] : "0" %>" />
        <div>
            <center>
                <h1 class="h1TitulosFrm" id="tituloFRM"></h1>
            </center>
            <div>
                <div>
                    <div class="form-group">
                        <asp:Label ID="lblIDLib" runat="server" Text="ID" hidden="true"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtIDLib" autocomplete="off" hidden="true" readOnly="true" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtNombre" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblAutor" runat="server" Text="Autor"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtAutor" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
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
                    <div class="form-group">
                        <asp:Label ID="lblEditorial" runat="server" Text="Editorial"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtEditorial" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblISBN" runat="server" Text="ISBN"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtISBN" autocomplete="off" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblCalendarFechaPub" runat="server" Text="Fecha de publicacion"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtCalendario" autocomplete="off" placeholder="yyyy-mm-dd" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPrecio" runat="server" Text="Precio"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtPrecio" autocomplete="off" placeholder="$0.00" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtDescripcion" TextMode="MultiLine" Rows="10" autocomplete="off" style="resize:none;" runat="server"></asp:TextBox><br />
                    </div>
                    <div class="form-row my-3  justify-content-around">
                        <button id="btnAceptar" type="button" class="btn btn-success btn-lg">Aceptar</button>
                        <button id="btnCancelar" type="button" class="btn btn-danger btn-lg">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        </center>

        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/bootstrap-datepicker.es.min.js"></script>
    <%--Librerias para transformar datos de objetos DateTime--%>
    <script src="js/moment.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="js/bootstrapValidator.js"></script>
    <script src="FrmGestionTitulosCRUD.js"></script>
</asp:Content>
