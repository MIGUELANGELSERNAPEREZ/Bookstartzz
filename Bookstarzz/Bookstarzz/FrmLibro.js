$(document).ready(function () {
    debugger;
    if (parseInt($("#txtId").val()) > 0) {
        infoLibro($("#txtId").val());
    } else {

    }


});

//Funcion para normalizar la fecha
function normalizar(datos) {
    //EL metodo moment es propio de la libreria moment.js para convertir fechas
    datos['FechaPublicacion'] = moment(datos['FechaPublicacion']).format("YYYY-MM-DD");
    return datos;
}

function infoLibro(id) {
    
    Bookstarzz.ws.WSLibros.getOne(id ,function (result) {

        if (result) {

            let arreglo = normalizar(JSON.parse(result)); //Mandamos el JSON al metodo normalizar, que devuelve el objeto con la fecha ya normalizada
            let nombre = "";

            $("#titulo").val(arreglo.Nombre);
            $("#ano").val(arreglo.FechaPublicacion );
            $("#genero").val(arreglo.Nombre);
            $("#autor").val(arreglo.Autor);
            $("#sinopsis").val(arreglo.Descripcion);
            $("#clasificacion").val(arreglo.Clasificacion);
            $("#paginas").val(arreglo.NPaginas);
            $("#presio").val(arreglo.Presio);

            for (var i = 0; i < arreglo.Nombre.length; i++) {

                if (arreglo.Nombre[i] != " ") {
                    nombre += arreglo.Nombre[i];
                }
            }

            $(".col-2").append($("<img\>").attr("src", "libros/" + nombre + ".jpg").attr("id", arreglo.IdLibro).addClass("cuadros"));

        } else {
            alert("error");
        }

    });
}
