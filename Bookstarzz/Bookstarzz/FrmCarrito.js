$(document).ready(function () {
    let rutaImg = $("#rqtxtTitulo").val().replace(/\s/g, ''); //Quitamos espacios para poner la ruta de la imagen
    $("#imgPortada").attr("src", "libros/" + rutaImg+".jpg"); //Agregamos la ruta como valor de atributo del contenedor imagen

    $("#btnCancelar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmBookstarzz.aspx");
    });

    $(".eliminarCarrito").click(function () {
        $("#divCardLibros").html("");
        deshabilitaBtn();
    });
});

//Funcion para limpiar el div#contenidoVista; en FrmBookstarzz
function limpiar() {
    $("#contenidoVista").empty();
}

//Funcion para deshabilitar el boton entregado
function deshabilitaBtn() {
    $("#btnComprar").hide();
    $("#btnCancelar").hide();
}