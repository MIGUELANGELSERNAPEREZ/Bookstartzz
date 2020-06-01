<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraAfuera.Master" AutoEventWireup="true" CodeBehind="FrmRegistrarUser.aspx.cs" Inherits="Bookstarzz.FrmRegistrarUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/estilo.min.css" rel="stylesheet" />
    <link href="validaciones/boostrapValidator.min.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <!-- Small modal Agregar-->

<div class="modal fade bd-example-modal-sm" id="mdlConfirmar"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <h2>Agregado exitosamente!!</h2>
    </div>
  </div>
</div>

 <!-- Small modal Existente-->

<div class="modal fade bd-example-modal-sm" id="mdlModificar"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <h2>Actualizacion correcta!!</h2>
    </div>
  </div>
</div>


    <div class="container-fluid px-0">
    <div class="row">
      <div class="col-2 pr-0">
        <!-- card -->
          <div class="alert alert-info" role="alert" style="top:70px;">
                  <h4 class="alert-heading">Suscribete!</h4>
                  <p>Bienvenido a la mejor biblioteca dijital de todo Mexico. en esta liberia encontraras los mejores ejemplares al mejor presio</p>
                  <hr>
                  <p class="mb-0">Manejamos promosiones, concursos de lectura con los cuales te puedes ganar premios.</p>
          </div>
          <br />
          <br />
          <br />
          <div class="card" style="width: 18rem;">
              <img class="card-img-top" src="imagenes/descuento.jpg" alt="imagen de un cartel con el 20& de descuento">
              <div class="card-body">
                <p class="card-text">Aprobecha los descuentos.</p>
              </div>
         </div>
        <!-- Fin del sidebar -->
      </div>
      <div class="col-10">
     <center>   <h1>Registrate</h1></center>  
        


        <!-- En este container va todo lo de la página -->
        <div class="container-fluid pl-0 pt-3">
          <div class="row">
            <div class="col">
                 <div class="alert alert-danger hide" role="alert" style="display:none">
                      <strong>Error:</strong> <span id="cntMsg">Ha ocurrido un error al intentar cargar la información</span>
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                 </div>

                <center>
                <form runat="server" id="FormMenu">
                       
                          <!-- acceder al webService-->
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
    
                               <Services>
                                        <asp:ServiceReference Path="~/ws/WSUsuarios.asmx" />
                               </Services>

                            </asp:ScriptManager>
      
     
                                 <div class="form-group">
                                        <asp:label text="Nombre" runat="server" class="labels"/> <br />
                                        <input type="text" class="form-control" name="txtNombre" id="txtNombre"
                                            required="" maxlength="30" placeholder="Escribe tu nombre"/>
                                    </div>
                                    <br />


                                <div class="form-group">
                                    <asp:label text="Apellido Paterno" class="labels" runat="server"/> <br />
                                    <input type="text" class="form-control" name="txtApellidoP" id="txtApellidoP"
                                        required maxlength="30" placeholder="Escribe tu apellido paterno"/>
                                </div>
                                <br />

                                <div class="form-group">
                                    <asp:label text="Apellido Materno" class="labels" runat="server"/> <br />
                                    <input type="text" class="form-control" name="txtApellidoM" id="txtApellidoM"
                                        required maxlength="30" placeholder="Escribe tu apellido Materno"/>
                                </div>
                                    <br />
                                <div class="form-group">
                                    <asp:label text="Email" class="labels" runat="server"/> <br />
                                    <input type="email" class="form-control" name="txtEmail" id="txtEmail"
                                        placeholder="name@example.com" required maxlength="40"/>
    
                                 </div>   
                                    <br />
                                  <div class="form-group">
                                    <asp:label text="Contraseña" class="labels" runat="server"/> <br />
                                    <input type="password" class="form-control" name="txtPass" id="txtPass" required
                                        maxlength="8"/>
                                </div>
                                   <br />
                                  <div class="form-group">
                                    <asp:label text="Confirmar" class="labels" runat="server"/> <br />
                                    <input type="password" class="form-control" name="txtConfirmar" id="txtConfirmar" required
                                        maxlength="8"/>
                                   </div>
                                  <br />
                                  <div class="form-group">
                                    <asp:label text="Usuario" class="labels" runat="server"/> <br />
                                    <input type="text" class="form-control" name="txtUsuario" id="txtUsuario" required
                                        maxlength="20" placeholder="ejeplo usu123"/>
                                </div>
                                <br />

                                  <div class="form-group">
                                    <asp:label text="Telefono" class="labels" runat="server"/> <br />
                                    <input type="tel" name="txtTelefono" class="form-control" id="txtTel" required
                                        maxlength="10" minlength="10" placeholder="4451001856S"/>
                                  </div>
                                      <br />    
  
                               <button type="button" id="BtnAgregar" name="BtnAgregar"
                                   class="btn btn-success  btn-lg">Agregar</button>

                                <button type="button" id="BtnCancelar" name="btnCancelar"
                                    class="btn btn-danger btn-lg">Cancelar</button>
                                <br />
                                <br />
                  </form>             
                  <br />

              <!--Este es el Carrusel-->
              <!-- Fin del carrusel -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    
 
    <br />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="validaciones/bootstrapValidator.js"></script>
    <script src="FrmRegistrarUser.min.js"></script>
</asp:Content>
