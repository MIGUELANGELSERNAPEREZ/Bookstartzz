$(document).ready(function () {
    debugger;
    if (parseInt($("#txtId").val()) > 0) {
        infoLibro($("#txtId").val());
    } else {

    }

    $("leerLibro").click(function () {
       // <embed type="application/pdf" width="100%" height="100%">
        $(".container-pdf").css({ "width": "1000px", "heigth": "1000px" });
        $(".container-pdf").append($("<embed\>").attr("type", "application/pdf").attr("src", $("titulo").text()));
            
             });
            
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
            debugger;
            alert("entro");
            let arreglo = normalizar(JSON.parse(result)); //Mandamos el JSON al metodo normalizar, que devuelve el objeto con la fecha ya normalizada
            let nombre = "";

            $("#titulo").html(arreglo.Nombre);
            $("#ano").html(arreglo.FechaPublicacion );
            $("#genero").html(arreglo.Nombre);
            $("#autor").html(arreglo.Autor);
            $("#sinopsis").html(arreglo.Descripcion);            
            $("#paginas").html(arreglo.NPaginas);
            $("#presio").html(arreglo.Presio);

            if (arreglo.Clasificacion == 1) {
                $("#clasificacion").html("Niños");
            } else if (arreglo.Clasificacion == 2) {
                $("#clasificacion").html("Adolecentes");
            } else if (arreglo.Clasificacion == 3 ){
                $("#clasificacion").html("Adultos");
            }

            for (var i = 0; i < arreglo.Nombre.length; i++) {

                if (arreglo.Nombre[i] != " ") {
                    nombre += arreglo.Nombre[i];
                }
            }

            $(".card-img-top").attr("src", "libros/" + nombre + ".jpg").attr("id", arreglo.IdLibro);

        } else {
            alert("error");
        }

    });
}
