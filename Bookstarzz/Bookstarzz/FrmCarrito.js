$(document).ready(function () {
    let rutaImg = $("#rqtxtTitulo").val().replace(/\s/g, ''); //Quitamos espacios para poner la ruta de la imagen
    $("#imgPortada").attr("src", "libros/" + rutaImg+".jpg"); //Agregamos la ruta como valor de atributo del contenedor imagen

    if ($("#rqtxtIdLibro").val() > 0 ) {
        $("#divTamano").removeClass("ajustarTamano"); //Remueve la clase para modificar tamaño en caso de que haya algo en el carrito
    }

    $("#btnCancelar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmBookstarzz.aspx");
    });

    $(".eliminarCarrito").click(function () {
        $("#divCardLibros").html("");
        $("#divTamano").addClass("ajustarTamano"); //Añadimos la clase para modificar el tamaño en caso de que no haya nada en el carrito
        deshabilitaBtn();
    });
    cargarCategorias(); //Carga el panel de categorias
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

//Inician los dos metodos para cargar catgorias
function cargarCategorias() {
    Bookstarzz.ws.WSCategorias.getAll(crearSidebar, function (e) {
        $("#cntMsg").text("Error: no se ha podido cargar la seccion de categorias de los libros");
        $("#cntMsg").parent().show();
    });
}
function crearSidebar(result) {
    if (result) {
        let arreglo = JSON.parse(result);
        arreglo.forEach(
            function (categoria) {
                $(".list-group").append($("<a\>").addClass("list-group-item list-group-item-action").html(categoria.nombreCategoria).attr("href", "#"));

            });

    } else {
        $("#cntMsg").text("Error: no se ha podido Cargar las categorias de los libros");
        $("#cntMsg").parent().show();

    }
}
//Terminan los dos metodos para cargar catgorias