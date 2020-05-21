<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmMenu.aspx.cs" Inherits="Bookstarzz.FrmMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="css/main.css">
    <!-- Glide CSS -->
    <link rel="stylesheet" href="glide-3.2.4/dist/css/glide.core.min.css">
    <link rel="stylesheet" href="glide-3.2.4/dist/css/glide.theme.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
    <!-- todo este bloque ayuda a que esta pagina pueda acceder al web service-->
    <form id="formMenu" runat="server">

    <asp:ScriptManager ID="ScriptManagerMenu" runat="server">
        <Services>
            <asp:ServiceReference Path="~/ws/WSLibros.asmx" />
            <asp:ServiceReference Path="~/ws/WSCategorias.asmx" />
        </Services>
    </asp:ScriptManager>
    </form>
    <!-- todo este bloque ayuda a que esta pagina pueda acceder al web service-->

    <!-- Sidebar -->

    <ul class="list-group">
        <a class="list-group-item list-group-item-action active" style="font-size: 20px;">Categorias
          </a>
    </ul>
    <!-- Fin del sidebar -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">

    <!--<div style="height:100px"></div>-->
    
    <div class="container-fluid pl-0 pt-3">
        <div class="row">
            <div class="col">

                <!-- inicia el carusel -->
                <div class="glide">
                    <div class="glide__track" data-glide-el="track">
                        <ul class="glide__slides">
                            <!-- Aqui van img pero se construyen en FrmMenu.js en tiempo
                de ejecucion-->
                        </ul>
                    </div>

                    <!-- Estilo flechas de navegación -->
                    <div class="glide__arrows" data-glide-el="controls">
                        <button class="glide__arrow glide__arrow--left" data-glide-dir="<">prev</button>
                        <button class="glide__arrow glide__arrow--right" data-glide-dir=">">next</button>
                    </div>

                    <!-- Estilo bullets (puntos) -->
                    <div class="glide__bullets" data-glide-el="controls[nav]">
                    </div>

                </div>
                <!-- termina el carusel-->
            </div>
            <!--fin de la columna-->
        </div>
        <!--fin de la fila-->

      </div> <!--fin del container-->
        <div class="row">
            <!--Inicio de la fila-->

    <div class="container-fluid pl-0 pt-3">
        <br />
        <br />
        <div class="container">
            <h2 >Ejemplares ya disponibles</h2>
        </div>
        <br />
        <br />
        <!--LIBROS NUEVOS SE MUESTRAN EN ESTA PARTE -->
        <div class="row uno" border="2"> </div> <!--fin de la fila-->
        <div class="row dos"> </div> <!--fin de la fila-->
        <div class="row tres"> </div> <!--fin de la fila-->
        <br />
        <a href="#" type="button" class="btn btn-primary btn-lg btn-block"> Ver Mas</a>
    </div>

    

            </div>
            <div class="col-3">
                <img src="libros/It.jpg" alt="Error" />

            </div>

        </div>
        <!--fin de la fila-->
        <div class="row">
            <!--Inicio de la fila-->

            <div class="col-3">
                <img src="libros/It.jpg" alt="Error" />

            </div>
            <div class="col-3">
                <img src="libros/It.jpg" alt="Error" />

            </div>
            <div class="col-3">
                <img src="libros/It.jpg" alt="Error" />

            </div>

        </div>
        <!--fin de la fila-->

    </div>
    <!--fin del container-->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="popper/popper.min.js"></script>

    <!-- Glide JS -->
    <script src="glide-3.2.4/dist/glide.min.js"></script>

    <script src="FrmMenu.js"></script>
</asp:Content>
