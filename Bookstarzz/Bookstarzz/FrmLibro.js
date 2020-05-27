$(document).ready(function () {
    debugger;

    // validamos que se haya enviado el id del libro FrmMenu a esta nueva
    if (parseInt($("#txtId").val()) > 0) {
        infoLibro($("#txtId").val());

    } else {

    }

   /* $("leerLibro").click(function () {
       // <embed type="application/pdf" width="100%" height="100%">
        $(".container-pdf").css({ "width": "1000px", "heigth": "1000px" });
        $(".container-pdf").append($("<embed\>").attr("type", "application/pdf").attr("src", $("titulo").text()));
            
             });
   */
});


var crear = false; // nos ayuda para saber si si o si no ha sido creado el elemento pata mostrar el pdf
function leerLibro() {
    debugger;

    // si ya fue creado el eleemento mostramos o ocultamos el pdf
    if (crear) {

        $("#vista").toggle();
        $(".container-pdf").slideToggle(1000);;
    } else {
       // si a un no a sido creado el elemento para mostrar el pdf lo creamos
            crear = true;
            let titulo = $("#titulo").html();
            let ruta = quitarEspacios(titulo);
        $(".container-pdf").css({ "width": "100%", "height": "900px" });
        $(".container-pdf").append($("<embed\>").attr("id", "vista").attr("type", "application/pdf").attr("src", "libros/" + ruta + ".pdf").css({ "width": "100%", "height": "100%" }));
               
    }
    
}
           
            
            //Funcion para normalizar la fecha
function normalizar(datos) {
    //EL metodo moment es propio de la libreria moment.js para convertir fechas
    datos['FechaPublicacion'] = moment(datos['FechaPublicacion']).format("YYYY-MM-DD");
    return datos;
}


function quitarEspacios(Nombre) {
    let nombre = "";
    for (var i = 0; i < Nombre.length; i++) {

        if (Nombre[i] != " ") {
            nombre += Nombre[i];
        }
    }

    return nombre;
}


    //metodo que sirve para llenar la informacion del libro en las cards
function infoLibro(id) {
    
    Bookstarzz.ws.WSLibros.getOne(id ,function (result) {

        if (result) {
            debugger;
           
            let arreglo = normalizar(JSON.parse(result)); //Mandamos el JSON al metodo normalizar, que devuelve el objeto con la fecha ya normalizada
            let nombre = "";
            //metodo que carga la ruta del boton para poder descargar el archivo
            btnDescargar(arreglo.Nombre);

            //llenamos los inputs con el libro traido
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

            //agregamos un img con la portada del libro
            $(".card-img-top").attr("src", "libros/" + nombre + ".jpg").attr("id", arreglo.IdLibro);

        } else {
            alert("error");
        }

    });
}

function btnDescargar(nombre) {
    let ruta = quitarEspacios(nombre);
    $("#btnDescargar").attr("download", ruta).attr("href", "libros/" + ruta + ".pdf");
}