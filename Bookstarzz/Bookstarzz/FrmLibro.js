$(document).ready(function () {
    debugger;
    if (parseInt($("#txtId").val()) > 0) {
        infoLibro($("#txtId").val());
    } else {

    }


});

function infoLibro(id) {
    
    Bookstarzz.ws.WSLibros.getOne(id ,function (result) {

        if (result) {
            
            let arreglo = JSON.parse(result);
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
