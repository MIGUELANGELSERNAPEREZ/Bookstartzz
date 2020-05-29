$(document).ready(function () {
    debugger;
    $("#contenidoVista").load("FrmMenu.aspx"); //Carga predeterminadamente dentro de  FrmBookstarzz el FrmMenu

    $("#cntFrmMenu").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmMenu.aspx");
    });
    $("#cntGestionTitulos").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmGestionTitulos.aspx", { "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
    });
    $("#cntPedidos").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmPedidos.aspx", {"txtURL": 1}); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
    });
    debugger;
    $("#cntListaUsu").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmListaUsuarios.aspx");
    });
    $("#cntCarrito").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmCarrito.aspx", { "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
    });
});
//Funcion para limpiar el div#contenidoVista; en FrmBookstarzz
function limpiar() {
    $("#contenidoVista").empty();
}