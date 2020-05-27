$(document).ready(function () {
    $("#btnEntrar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmBookstarzz.aspx");
    });
});

//Funcion para limpiar el contenedor principal donde se carga la pagina
function limpiar() {
    $("#contenidoVista").empty();
}

