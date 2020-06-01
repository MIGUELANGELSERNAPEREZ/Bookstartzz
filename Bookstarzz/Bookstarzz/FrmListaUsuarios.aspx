<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="FrmListaUsuarios.aspx.cs" Inherits="Bookstarzz.FrmListaUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_bloque_1" runat="server">
        <link rel="stylesheet" href="css/main.min.css">
        <link href="css/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body_bloque_2" runat="server">
               <div class="alert alert-danger" style="display:none" role="alert">
                  <strong>Error:</strong> <span id="cntMsg">Ha ocurrido un error al intentar cargar la información</span>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
               </div>

                <div class="alert alert-success" style="display:none" role="alert">
                  <strong>Error:</strong> <span id="cntMsgExito">El Usuario se ha eliminado exitósamente</span>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>   

                <form runat="server" class=" tblsDatatables">
                            <!-------------------INICIA MODAL---------------------->
                        <div class="modal" id="mdlConfirmar" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h5 class="modal-title">Confirmar eliminación</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    </div>
                                    <div class="modal-body">
                                    <p>¿Estás seguro que deseas eliminar el Usuario: <strong><span id="nombre"></span></strong>?</p>
                                    </div>
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    <button type="button" id="btnConfirmarEliminar" class="btn btn-danger">Eliminar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Termina modal -->

                        <!-------------------INICIA MODAL DE ERROR---------------------->
                        <div class="modal" id="mdlError" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h5 class="modal-title">Error</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    </div>
                                    <div class="modal-body">
                                    <p>Ha ocurrido el siguiente error: <strong><span id="msgError"></span></strong></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Termina modal -->



                         <input type="hidden" id="IdUsuario"/>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                            <Services>
                                <asp:ServiceReference Path="ws/WSUsuarios.asmx" />
                            </Services>
                        </asp:ScriptManager>
                    <center>
                    <h1 class="h1TitulosFrm">Usuarios Registrados</h1>
                    </center>
                    <div class="row justify-content-center my-2">
                        <button id="btnAgregar" type="button" class="btn btn-primary">Agregar</button>    
                    </div>

                      <table id="tblUsuarios" class="table table-striped table-bordered"></table>

            </form> 
                <!-- fin form-->
           

       

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <script src="js/datatables.min.js"></script>
    <script src="FrmListaUsuarios.min.js"></script>
    
</asp:Content>
