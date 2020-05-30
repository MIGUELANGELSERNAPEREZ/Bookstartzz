var idLibroGlobal; //se crea variable global para guardar el id del libro
$(document).ready(function () {
    validaURL(); //Validamos para que no acceda explicitamente a FrmPedidos.aspx
    if (localStorage.length == 0) {
        deshabilitaBtn();
    }
    obtenerLibros(); //Verifica si hay libros relacionados con el usuario
    if ($("#rqtxtIdLibro").val() > 0 ) {
        $("#divTamano").removeClass("ajustarTamano"); //Remueve la clase para modificar tamaño en caso de que haya algo en el carrito
    }

    $("#btnCancelar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmBookstarzz.aspx", { "txtURL": 1 });//Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
    });

    //Boton eliminar del modal
    $("#btnConfirmarEliminar").click(cofirmEliminar);

    $(".eliminarCarrito").click(function () {
        idLibroGlobal = $(this).attr("href");
        $("#mdlConfirmar").modal();
    });
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

//Funcion que se activa al dar clic en aceptar del mdal
function cofirmEliminar() {
    $("#mdlConfirmar").modal('hide');
    eliminarLibro(idLibroGlobal);
}


//Funcion que elimina el libro del carrito
function eliminarLibro(idLibro) {
    var idUsuario = $("#txtIdUsuario").val(); //Guardams el id del usuario
    if (typeof (Storage) !== "undefined") {
        var libroArray = []; //Creamos un array dinamico
        var regex = idLibro.replace(/\#/g, ''); //cortamos la cadena para que id quede solo numerico
        var idLibro = parseInt(regex.replace(/\./g, ',')); //Volveos a cortar y convertimos a entero el id
        libroArray = JSON.parse(localStorage.getItem("USUARIO" + idUsuario)) || []; //Creamos/obtenemos el Usuario
        //Este ciclo verifica que no se agregue dos veces el mismo libro
        for (var i = 0; i < libroArray.length; i++)
            if (libroArray[i]["idLibro"] && libroArray[i]["idLibro"] == idLibro) {
                libroArray.splice(i, 1); //Quitamos el elemento del arreglo
                break;
            }
        longitud = libroArray.length; //Guardamos la longitud del arreglo
        localStorage.setItem("USUARIO" + idUsuario, JSON.stringify(libroArray)); //Actualizamos el localStorage
        //Validamos en caso de que se elimine el ultimo elemento del carrito
        if (longitud == 0) {
            localStorage.removeItem("USUARIO" + idUsuario) //Eliminamos el registro especifico del storage
            limpiar();
            $("#divTamano").addClass("ajustarTamano"); //Añadimos la clase para modificar el tamaño en caso de que no haya nada en el carrito
            deshabilitaBtn();
            $("#contenidoVista").load("FrmCarrito.aspx", { "rqtxtIdLibro": idLibro, "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
        }
        else {
            limpiar();
            $("#contenidoVista").load("FrmCarrito.aspx", { "rqtxtIdLibro": idLibro, "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
        }
    } else {
        // Código cuando Storage NO es compatible
    }
}

//Funcion que pinta la pantalla con el contenido dinamico
function pintarPagina() {
    let libro = JSON.parse(localStorage.getItem("USUARIO" + idUsuario));
    let titulo;
    let autor;
    let precio;
    let imagen;
    for (let i = 0; i < libro.length; i++) {
        let idLibro = libro[i]["idLibro"];
        titulo = libro[i]["titulo"];
        autor = libro[i]["autor"];
        precio = libro[i]["precio"];
        imagen = libro[i]["titulo"].replace(/\s/g, '') + ".jpg";
        $("#contenedorLibros").css("display", "block");
        $("#contenedorLibros").append(
            '<div id="divCardLibros' + idLibro + '" class="tblsDatatables">' +
            '<div class="card" style="width: 97%;">' +
            '<div class="card-body">' +

            '<div class="mb-3" style="max-width: 67%;">' +
            '<div class="row no-gutters">' +
            '<div class="col-md-4">' +
            '<img id="imgPortada" src="libros/' + imagen + '" class="card-img" alt="...">' +
            '</div>' +
            '<div class="col-md-8">' +
            '<div class="card-body-carrito">' +
            '<h5 class="card-text" class="txtTitulo">Titulo: ' + titulo + '</h5>' +
            '<p class="card-text" class="txtAutor">Autor: ' + autor + '</p>' +
            '<a href="#' + idLibro + '" class="card-text eliminarCarrito"><small class="text-muted">Eliminar del carrito</small></a>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="mb-3" style="max-width: 100%;" >' +
            '<div class="row no-gutters">' +
            '<div class="col-md-8">' +
            '<div class="card-body">' +
            '<h5 class="card-title precioLibro"><strong class="txtPrecio">Precio c/u<br/>$' + precio + '</strong></h5>' +
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

function obtenerLibros() {
    idUsuario = $("#txtIdUsuario").val(); //Guardams el id del usuario
    if (typeof (Storage) !== 'undefined') {
        if (localStorage.length > 0) {
            $("#divTamano").removeClass("ajustarTamano");
            $("#divTamano").addClass("ajustarTamanoSI");
            pintarPagina();
        }
    }
    else {

    }
}