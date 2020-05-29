<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmLibro.aspx.cs" Inherits="Bookstarzz.FrmLibro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/main.css" rel="stylesheet" />
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
    <%--Input para obtener el id del usuario para agregar al carrito con localStorage--%>
    <input type="hidden" id="txtIdUsuario" value="<%=Session["id_user"]%>">
    <div class="container-fluid" style="top: 70px;">
       <div class="row">
           <div class="col">
               <div class="card">
                   <img class="card-img-top img-fluid" alt="No se pudo Cargar imagen">
                    <div class="card-body">
                        <p class="card-text">Bookstarzz Librery</p>
                    </div>
               </div>
            </div>
       </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">

    <div class="container-fluid pl-0 pt-3">
        <div class="row">
            <div class="col">
                <div class="alert alert-danger hide" role="alert">
                  <strong>Error:</strong> <span id="cntMsg">Sin errores</span>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>

                <center>
                <h1>Bookstarzz</h1>
                </center>
              <form id="FormLibro" runat="server">

                   <asp:ScriptManager ID="ScriptManagerLibro" runat="server">
                        <Services>
                            <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
                            <asp:ServiceReference Path="~/ws/WSCategorias.asmx" />
                        </Services>
                    </asp:ScriptManager>
               </form>
                <!-- uso normal del formulario-->
                  <input type="hidden" id="txtId" value="<%= Request["id"] != null ? Request["id"] : "0" %>"/>
                  <!-- se usa cuando se esta utilizando el input de buqueda de la pagina--> 
                 <input type="hidden" id="txtBuscar" value="<%= Request["nameBook"] != null ? Request["nameBook"] : "0" %>"/>


                 <div class="card" style="width: 100%;">
                    <div class="card-body">
                        <div class="card-header">
                        <h2 class="card-title">Informacion del Libro</h2>
                        </div>
                        
                            <div class="card-columns">
                                <label>Titulo del Libro: </label>
                                <p id="titulo" class="card-text"></p>
                             </div>
                             <div class="card-columns">
                                <label>Año: </label>
                                <p id="ano" class="card-text"></p> 
                            </div>
                            <div class="card-columns">
                                <label> Genero: </label>
                                <p id="genero" class="card-text"></p> 
                            </div>
                            <div class="card-columns">
                                <label>N°Paginas: </label>
                                <p id="paginas" class="card-text"></p> 
                            </div>
                            <div class="card-columns">
                                <label>Presio:</label>
                                <p id="presio" class="card-text"></p> 
                            </div>
                            <div class="card-columns">
                                <label>Autor: </label>
                                <p id="autor" class="card-text"></p> 
                            </div>
                            <div class="card-columns">
                                <label>Sinopsis: </label>
                                <p id="sinopsis" class="card-text"></p> 
                            </div>
                            <div class="card-columns">
                                <label>Clasificacion </label>
                                <p id="clasificacion" class="card-text"></p> 
                            </div>
                           <div class="card-columns">
                                  
                                 <Button type="button" id="btnLeer" name="btnLeer" class="btn btn-primary btn-lg btn-block" onclick="leerLibro()">Leer</Button>
                                 <a role="button" id="btnDescargar" class="btn btn-success btn-block btn-lg">Descargar Archivo</a>
                                 <Button type="button" id="btnAgregar" name="btnAgregar" class="btn btn-warning btn-lg btn-block" onclick="AgregarCarrito()">Agregar al Carrito</Button>
                           </div>
            
                     </div>  <!--fin  card-body-->
                  </div>  <!--fin card-->
                               
                  <br />
                             
            </div> <!--fin col-->
        </div>  <!--fin row-->

        <div class="row">
            <div class="col">
                <div class="container-pdf">
                   <!-- va el pdf-->
                </div>
            </div>

        </div>


     </div>  <!--fin container-->


          <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="toastActivar">
           <div class="toast-header">
                <img src="imagenes/pulgarArriba.jpg" class="rounded mr-2" alt="Pulgar arriba">
                <strong class="mr-auto">Bookstarzz</strong>
                <small class="text-muted">justo ahora</small>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
           </div>
           <div class="toast-body">
               <p id="toastMess">Gracias por leer el libro.</p> 
           </div>
        </div>

    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="popper/popper.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="FrmLibro.js"></script>
</asp:Content>
