$(document).ready(function () {
    debugger;
    $("#contenidoVista").load("FrmMenu.aspx"); //Carga predeterminadamente dentro de  FrmBookstarzz el FrmMenu

    $("#cntFrmMenu").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmMenu.aspx");
    });
    $("#cntGestionTitulos").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmGestionTitulos.aspx");
    });
    $("#cntPedidos").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmPedidos.aspx");
    });
    debugger;
    $("#cntListaUsu").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmListaUsuarios.aspx");
    });
});

//Funcion para limpiar el div#contenidoVista; en FrmBookstarzz
function limpiar() {
    $("#contenidoVista").empty();
}