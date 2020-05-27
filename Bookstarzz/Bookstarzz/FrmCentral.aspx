<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmCentral.aspx.cs" Inherits="Bookstarzz.FrmCentral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">

    <div class="card">
       <img src="imagenes/usuario.jpg" class="card-img-top" alt="Usuario">
           <div class="card-body">
              <h5 class="card-title">Usuario</h5>

               <div class="card-columns">
                    <label>Nombre: </label>
                       <p id="nombre" class="card-text"></p>
               </div>
               <div class="card-columns">
                    <label>Email: </label>
                    <p id="ano" class="card-text"></p> 
               </div>
               <div class="card-columns">
                    <label> Usuario: </label>
                    <p id="genero" class="card-text"></p> 
               </div>
       
           </div>
               
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">
    
    <div class="container-fluid pl-0 pt-3">
        <div class="row">
            <div class="col">
       
                <center>
                    <h1>Perfil de Administrador</h1>
                <center>

                <div class="card" style="width: 18rem;">
                  <img src="imagenes/usuarios.jpg" class="card-img-top" alt="Usuarios">
                  <div class="card-body">
                    <h5 class="card-title">Usuarios</h5>
                    <p class="card-text">El administrador puede agregar,eliminar.editar, ver usuarios</p>
                    <button type="button" class="btn btn-outline-primary" onclick="btnUsuarios()">Entrar</button>
                  </div>
                </div>

            </div> <!--fin del col -->
            <div class="col">
                <div class="card" style="width: 18rem;">
                  <img src="imagenes/gestion_titulos.jpg" class="card-img-top" alt="Usuarios">
                  <div class="card-body">
                    <h5 class="card-title">Gestion Titulos</h5>
                    <p class="card-text">El administrador puede agregar,eliminar.editar, ver libros</p>
                    <a role="button" class="btn btn-outline-primary" onclick="btnGestion()">Entrar</a>
                  </div>
                </div>

            </div>

          </div>  <!--fin del row --> 
      </div>  <!--fin del contenedor --> 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <script src="FrmCentral.js"></script>
</asp:Content>
