<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmCarrito.aspx.cs" Inherits="Bookstarzz.FrmCarrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
    <!-- Sidebar -->

    <ul class="list-group">
        <a class="list-group-item list-group-item-action active" style="font-size: 20px;">Categorias
          </a>
    </ul>
    <!-- Fin del sidebar -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">
      <%--Input para obtener el id del usuario para agregar al carrito con localStorage--%>
      <input type="hidden" id="txtIdUsuario" value="<%=Session["id_user"]%>">
        <div class="container-fluid pl-0 pt-3">
        <div class="row">
            <div id="divTamano" class="col ajustarTamano">
                <div id="divMsg" class="alert" style="display:none;" role="alert">
                    <strong>Error:</strong> <span id="cntMsg">Sin errores</span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <center>
                <h1 class="h1TitulosFrm">CARRITO DE COMPRA</h1>
                </center>
                <form id="formCarrito" runat="server">
                     <%--Este input valida que no se pueda acceder explicitamente a la URL FrmPedidos.aspx--%>
                    <input type="hidden" id="txtURL" value="<%= Request["txtURL"] != null ? Request["txtURL"] : "0" %>" />
                    <asp:ScriptManager ID="ScriptManagerLibro" runat="server">
                        <Services>
                            <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
                            <asp:ServiceReference Path="~/ws/WSCategorias.asmx" />
                        </Services>
                    </asp:ScriptManager>
               </form>
                
                    <%--Si la sesion no existe, redirecciona al login--%>
                    <%
                        if (Session["session"] == null)
                        {
                            Response.Redirect("FrmLogin.aspx");
                        }
                    %>

                <%--Este div se llena dinamicamente con los libros--%>
                <div id="contenedorLibros" style="display:none;">

                </div>


                  <div>
                      <Button type="button" id="btnCancelar" name="btnCancelar" class="btn btn-danger btn-lg btn-block">CANCELAR</Button>
                      <Button type="button" id="btnComprar" name="btnComprar" class="btn btn-primary btn-lg btn-block"">COMPRAR</Button>
                  </div>




        </div>  <!--fin row-->

        </div>  <!--fin container-->
      </div>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <script src="popper/popper.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="FrmCarrito.js"></script>
</asp:Content>
