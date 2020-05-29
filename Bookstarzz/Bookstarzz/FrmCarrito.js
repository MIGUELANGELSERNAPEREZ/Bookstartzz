$(document).ready(function () {
    validaURL(); //Validamos para que no acceda explicitamente a FrmPedidos.aspx
    obtenerLibros(); //Verifica si hay libros relacionados con el usuario

    if ($("#rqtxtIdLibro").val() > 0 ) {
        $("#divTamano").removeClass("ajustarTamano"); //Remueve la clase para modificar tamaño en caso de que haya algo en el carrito
    }

    $("#btnCancelar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmBookstarzz.aspx", { "txtURL": 1 });//Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
    });

    //$(".eliminarCarrito").click(function () {
    //    $("#divCardLibros").html("");
    //    $("#divTamano").addClass("ajustarTamano"); //Añadimos la clase para modificar el tamaño en caso de que no haya nada en el carrito
    //    deshabilitaBtn();
    //});
    cargarCategorias(); //Carga el panel de categorias
});

//Este metodo valida para que no se acceda explicitamente a la URL FrmPedidos.aspx
function validaURL() {
    const id = $("#txtURL").val();
    if (id != 1) {
        //Redirecciona al login
        window.location.replace("FrmBookstarzz.aspx");
    }
}

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

function obtenerLibros() {
    idUsuario = $("#txtIdUsuario").val(); //Guardams el id del usuario
    if (typeof (Storage) !== 'undefined') {
        if (localStorage.length > 0) {
            let libro = JSON.parse(localStorage.getItem("USUARIO" + idUsuario));
            let titulo;
            let autor;
            let precio;
            let imagen;
            for (let i = 0; i < libro.length; i++) {
                titulo = libro[i]["titulo"];
                autor = libro[i]["autor"];
                precio = libro[i]["precio"];
                imagen = libro[i]["titulo"].replace(/\s/g, '') + ".jpg";
                $("#contenedorLibros").css("display", "block");
                $("#contenedorLibros").append(
                    '<div id="divCardLibros" class="tblsDatatables">' +
                    '<div class="card" style="width: 97%;">' +
                    '<div class="card-body">' +

                    '<div class="card mb-3" style="max-width: 50%;">' +
                    '<div class="row no-gutters">' +
                    '<div class="col-md-4">' +
                    '<img id="imgPortada" src="libros/' + imagen + '" class="card-img" alt="...">' +
                    '</div>' +
                    '<div class="col-md-8">' +
                    '<div class="card-body">' +
                    '<h5 class="card-title" class="txtTitulo">' + titulo + '</h5>' +
                    '<p class="card-text" class="txtAutor">' + autor + '</p>' +
                    '<a href="#" class="card-text eliminarCarrito"><small class="text-muted">Eliminar del carrito</small></a>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="card mb-3" style="max-width: 50%;" >' +
                    '<div class="row no-gutters">' +
                    '<div class="col-md-8">' +
                    '<div class="card-body">' +
                    '<h5 class="card-title precioLibro"><strong class="txtPrecio">' + precio + '</strong></h5>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +

                    '</div>' +

                    '<br />' +

                    ' <div class="card" style="width: 97%;">' +
                    '<div class="card-body">' +
                    '<div class="card mb-3" style="max-width: 50%;">' +
                    '<div class="row no-gutters">' +
                    '<div class="col-md-8">' +
                    ' <div class="card-body">' +
                    '<h5 class="card-text" class="txtPrecio">' + precio + '</h5>' +
                    '<p class="card-title precioLibro"><strong class="txtTotal">' + precio + '</strong></p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +

                    '</div>' +

                    '<br />' +
                    '</div>');

            }
        }
    }
    else {

    }
}