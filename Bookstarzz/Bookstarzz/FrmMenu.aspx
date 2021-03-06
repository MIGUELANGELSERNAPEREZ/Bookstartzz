﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmMenu.aspx.cs" Inherits="Bookstarzz.FrmMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="css/main.min.css">
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

    
        <center>
            <h2 style="color:black">Mas populares <span class="badge badge-warning">Libros</span></h2>

            <!-- El div para mostrar los errores y notificar al usuario-->
            <div class="alert alert-danger" role="alert" id="divError" style="display:none">
                  <strong>Error:</strong> <span id="cntMsg"></span>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
            </div>
            <!-- sirve para contener el mensaje -->
             <input type="hidden" id="txtError" value="<%= Request["typeError"] != null ? Request["typeError"] : "nada" %>"/>
        </center>
   
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
                <div class="row uno"> </div> <!--fin de la fila-->
                    <br />
                <div class="row dos"> </div> <!--fin de la fila-->
                    <br />
                <div class="row tres"> </div> <!--fin de la fila-->
                
                <br />
                <button type="button" class="btn btn-primary btn-lg btn-block" onclick="verMas();"> Ver Mas</button>

                <br />

            </div>
        
            <!--fin del container-->
    </div>
        <!--fin de la fila-->
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="popper/popper.min.js"></script>

    <!-- Glide JS -->
    <script src="glide-3.2.4/dist/glide.min.js"></script>

    <script src="FrmMenu.min.js"></script>
</asp:Content>
