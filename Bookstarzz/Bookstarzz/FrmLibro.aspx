<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmLibro.aspx.cs" Inherits="Bookstarzz.FrmLibro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/main.css" rel="stylesheet" />
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">

    <div class="container-fluid" style="top: 70px;">
       <div class="row">
           <div class="col-2">
                
            </div>
       </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">

    <div class="container-fluid pl-0 pt-3" style="top: 70px; left: 200px;">
        <div class="row">
            <div class="col">

              <form id="FormLibro" runat="server">
                   <asp:ScriptManager ID="ScriptManagerLibro" runat="server">
                        <Services>
                            <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
                            <asp:ServiceReference Path="~/ws/WSCategorias.asmx" />
                        </Services>
                    </asp:ScriptManager>

                  <input type="hidden" id="txtId" value="<%= Request["id"] != null ? Request["id"] : "0" %>"/>

                <div class="form-group">
                    <label>Titulo del Libro <input type="text" id="titulo" class="form-control" name="titulo" /></label>
                </div>
                <div class="form-group">
                    <label>Año <input type="text" id="ano" class="form-control" name="ano" /></label>
                </div>
                <div class="form-group">
                    <label> Genero <input type="text" id="genero" class="form-control" name="genero" /></label>
                </div>
                <div class="form-group">
                    <label>N°Paginas <input type="text" id="paginas" name="paginas" class="form-control" /></label>
                </div>
                <div class="form-group">
                    <label>Presio <input type="text" id="presio" name="presio" class="form-control" /></label>
                </div>
                <div class="form-group">
                    <label>Autor <input type="text" id="autor" name="autor" class="form-control" /></label>
                </div>
                <div class="form-group">
                    <label>Sinopsis <input type="text" id="sinopsis" name="sinopsis" class="form-control" /></label>
                </div>
                <div class="form-group">
                    <label>Clasificacion <input type="text" id="clasificacion" name="clasificacion" class="form-control"/></label>
                </div>
                
               </form>

                <br />
                 
                <Button type="button" id="btnLeer" name="btnLeer" class="btn btn-primary btn-lg">Leer</Button>
                <Button type="button" id="btnDescargar" name="btnDescargar" class="btn btn-success btn-lg">Leer</Button>
                <Button type="button" id="btnAgregar" name="btnAgregar" class="btn btn-warning btn-lg">Leer</Button>
                
            </div>
        </div>
     </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="popper/popper.min.js"></script>

    <script src="FrmLibro.js"></script>
</asp:Content>
