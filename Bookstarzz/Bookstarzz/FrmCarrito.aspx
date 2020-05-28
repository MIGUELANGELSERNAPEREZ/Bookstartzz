<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmCarrito.aspx.cs" Inherits="Bookstarzz.FrmCarrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">
        <div class="container-fluid pl-0 pt-3">
        <div class="row">
            <div class="col">
                <div id="divMsg" class="alert" style="display:none;" role="alert">
                    <strong>Error:</strong> <span id="cntMsg">Sin errores</span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <center>
                <h1>CARRITO DE COMPRA</h1>
                </center>
                <form id="formCarrito" runat="server">
                    
                    <asp:ScriptManager ID="ScriptManagerLibro" runat="server">
                        <Services>
                            <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
                            <asp:ServiceReference Path="~/ws/WSCategorias.asmx" />
                        </Services>
                    </asp:ScriptManager>
               </form>
                <!-- Inputs ocultos donde llega la informacion del libro-->
                    <input type="hidden" id="rqtxtIdLibro" value="<%= Request["rqtxtIdLibro"] != null ? Request["rqtxtIdLibro"] : "0" %>"/>
                    <input type="hidden" id="rqtxtTitulo" value="<%= Request["rqtxtTitulo"] != null ? Request["rqtxtTitulo"] : "0" %>"/>
                    <input type="hidden" id="rqtxtAutor" value="<%= Request["rqtxtAutor"] != null ? Request["rqtxtAutor"] : "0" %>"/>
                    <input type="hidden" id="rqtxtPrecio" value="<%= Request["rqtxtPrecio"] != null ? Request["rqtxtPrecio"] : "0" %>"/>
                    
                    <%--Si la sesion no existe, redirecciona al login--%>
                    <%
                        if (Session["session"] == null)
                        {
                            Response.Redirect("FrmLogin.aspx");
                        }
                    %>
                <% //CODIGO PARA VERIFICAR SI HAY UN LIBRO EN EL CARRITO
                    if (Request.Form["rqtxtIdLibro"] != null)
                    {

                %>
                <div id="divCardLibros">
                    <div class="card" style="width: 97%;">
                        <div class="card-body">

                            <div class="card mb-3" style="max-width: 50%;">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img id="imgPortada" src="..." class="card-img" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Titulo: <%=Request.Form["rqtxtTitulo"]%></h5> <%--Asignamos directamente con codigo incrustado el titulo del libro--%>
                                            <p class="card-text">Autor: <%=Request.Form["rqtxtAutor"]%></p> <%--Asignamos directamente con codigo incrustado el autor del libro--%>
                                            <a href="#" class="card-text eliminarCarrito"><small class="text-muted">Eliminar del carrito</small></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3" style="max-width: 50%;" >
                                <div class="row no-gutters">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">$<%=Request.Form["rqtxtPrecio"]%></h5><%--Asignamos directamente con codigo incrustado el precio del libro--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                     <!--fin  card-body-->
                    </div>  
                    <!--fin card-->
                    <br />

                    <div class="card" style="width: 97%;">
                        <div class="card-body">
                            <div class="card mb-3" style="max-width: 50%;">
                                <div class="row no-gutters">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-text">$<%=Request.Form["rqtxtPrecio"]%></h5><%--Asignamos directamente con codigo incrustado el precio del libro--%>
                                        <p class="card-title" id="calculoPrecio"></p><%--Se llenara con codigo en base al calculo del precio realizado--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     <!--fin  card-body-->
                    </div>
                    <!--fin card-->       
                  <br />
            </div> 

                  <div>
                      <Button type="button" id="btnCancelar" name="btnCancelar" class="btn btn-danger btn-lg btn-block">CANCELAR</Button>
                      <Button type="button" id="btnComprar" name="btnComprar" class="btn btn-primary btn-lg btn-block"">COMPRAR</Button>
                  </div>
                <%
                    } //NO BORRAR LLAVE DE CODIGO
                %>
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
