$(document).ready(function () {
    $("#cntFrmMenu").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmMenu.aspx");
    });
    $("#cntGestionTitulos").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmGestionTitulos.aspx");
    });
});

//Funcion para limpiar el div#contenidoVista; en FrmBookstarzz
function limpiar() {
    $("#contenidoVista").empty();
}