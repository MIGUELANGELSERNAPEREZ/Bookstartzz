<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="FrmMenu.aspx.cs" Inherits="Bookstarzz.FrmMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <link rel="stylesheet" href="css/main.css">  
    <!-- Glide CSS -->        
    <link rel="stylesheet" href="glide-3.2.4/dist/css/glide.core.min.css">
    <link rel="stylesheet" href="glide-3.2.4/dist/css/glide.theme.min.css">  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <h1 class="text-center text-light">Bookstartzz</h1>
     <h2 class="text-center text-light">Mas populares <span class="badge badge-warning">GLIDE JS</span></h2> 
      
    <div style="height:100px"></div>
    
    <div class="glide">
        <div class="glide__track" data-glide-el="track">
            <ul class="glide__slides">
              <li class="cuadros" style = "background-image: url(libros/harri1.jpg);"> 1 Harry poter</li>
              <li class="cuadros">2 Harry poter</li>
              <li class="cuadros">3 Harry poter</li>
              <li class="cuadros">4 Harry poter</li>
              <li class="cuadros">5 Harry poter</li>
            </ul>
         </div>
    
        <!-- Estilo flechas de navegación -->
        <div class="glide__arrows" data-glide-el="controls">
            <button class="glide__arrow glide__arrow--left" data-glide-dir="<">prev</button>
            <button class="glide__arrow glide__arrow--right" data-glide-dir=">">next</button>
        </div>  
        
        <!-- Estilo bullets (puntos) -->
        <div class="glide__bullets" data-glide-el="controls[nav]">
            <button class="glide__bullet" data-glide-dir="=0"></button>
            <button class="glide__bullet" data-glide-dir="=1"></button>
            <button class="glide__bullet" data-glide-dir="=2"></button>
            <button class="glide__bullet" data-glide-dir="=3"></button>     
            <button class="glide__bullet" data-glide-dir="=4"></button>     
        </div>
        
    </div>  
          
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="popper/popper.min.js"></script>
    
    <!-- Glide JS -->    
    <script src="glide-3.2.4/dist/glide.min.js"></script>

    <script>    
        var glide = new Glide('.glide', {
            type: 'slider', //hay dos tipos slider y carrousel
            startAt: 3, //adónde inicia el slider
            focusAt: 'center',
            autoplay: 2000, //inicia automatic en miliseg
            perView: 4, //cantidad de slide en pantalla
            breakpoints: { //para el tamaño de pantalla
                800: { perView: 2 },
                480: { perView: 1 }
            }
        })
        glide.mount()
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script src="frmMenu.js"></script> 
</asp:Content>
