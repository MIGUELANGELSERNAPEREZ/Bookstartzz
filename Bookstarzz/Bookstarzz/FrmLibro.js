var idLibro; //Id del libro global que se usara para mandarlo al FrmCarrito
var titulo; //Titulo del libro global que se usara para mandarlo al FrmCarrito
var autor; //Autor del libro global que se usara para mandarlo al FrmCarrito
var precio; //Precio del libro global que se usara para mandarlo al FrmCarrito
$(document).ready(function () {
    window.scrollTo(0, 0);
    
    // validamos que se haya enviado el id del libro FrmMenu a esta nueva
    if (parseInt($("#txtId").val()) > 0) {
        infoLibro($("#txtId").val());

    } else {

        if (($("#txtBuscar").val()) != 0) {
            let titulo = $("#txtBuscar").val();
            llenarDatos(titulo);
        } else {
            $("#contenidoVista").load("FrmMenu.aspx", { "typeError": "Libro no disponible" });
        }
       
    }

});

// el metodo de buscar un libro para el administrador
function llenarDatos(nombre) {

    if (nombre != null) {
        let libro = quitarEspacios(nombre);

        Bookstarzz.ws.WSLibros.traerLibro(nombre, function (result) {
            debugger;
            $("#contenidoVista").load("FrmMenu.aspx", { "typeError": "Libro no disponible" });
            if (result) {

                let arreglo = normalizar(JSON.parse(result)); //Mandamos el JSON al metodo normalizar, que devuelve el objeto con la fecha ya normalizada
                
                btnDescargar(arreglo.Nombre);
                //llenamos los inputs con el libro traido
                $("#titulo").html(arreglo.Nombre);
                $("#ano").html(arreglo.FechaPublicacion);
                $("#genero").html(arreglo.Nombre);
                $("#autor").html(arreglo.Autor);
                $("#sinopsis").html(arreglo.Descripcion);
                $("#paginas").html(arreglo.NPaginas);
                $("#presio").html(arreglo.Presio);

                if (arreglo.Clasificacion == 1) {
                    $("#clasificacion").html("Niños");
                } else if (arreglo.Clasificacion == 2) {
                    $("#clasificacion").html("Adolecentes");
                } else if (arreglo.Clasificacion == 3) {
                    $("#clasificacion").html("Adultos");
                }

                let nombre = quitarEspacios(arreglo.Nombre);

                //agregamos un img con la portada del libro
                $(".card-img-top").attr("src", "libros/" + nombre + ".jpg").attr("id", arreglo.IdLibro);
            } else {
                
                // window.location.replace("FrmLogin.aspx");
                $("#contenidoVista").load("FrmMenu.aspx", { "typeError": "Libro no disponible" });
            }

        },

            function (error) {
                $("#contenidoVista").load("FrmLogin.aspx", { "typeError": "Libro no disponible" });
            }
        );
    } else {
        $("#cntMsg").text("Error: No se pudo cargar la informacion del libro seleccionado");
        $("#cntMsg").parent().show();
    }

}


var crear = false; // nos ayuda para saber si si o si no ha sido creado el elemento pata mostrar el pdf
function leerLibro() {
    debugger;

    // si ya fue creado el eleemento mostramos o ocultamos el pdf
    if (crear) {
        
        $(".container-pdf").slideToggle(1000);;
    } else {
       // si a un no a sido creado el elemento para mostrar el pdf lo creamos
            crear = true;
            let titulo = $("#titulo").html();
            let ruta = quitarEspacios(titulo);
        $(".container-pdf").css({ "width": "100%", "height": "900px" });
        $(".container-pdf").append($("<embed\>").attr("id", "vista").attr("type", "application/pdf").attr("src", "pdfs/" + ruta + ".pdf").css({ "width": "100%", "height": "100%" }));
               
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
    
    Bookstarzz.ws.WSLibros.getOne(id, function (result) {

        if (result) {
            debugger;

            let arreglo = normalizar(JSON.parse(result)); //Mandamos el JSON al metodo normalizar, que devuelve el objeto con la fecha ya normalizada
            let nombre = "";
            //metodo que carga la ruta del boton para poder descargar el archivo
            btnDescargar(arreglo.Nombre);

            //llenamos los inputs con el libro traido
            $("#titulo").html(arreglo.Nombre);
            $("#ano").html(arreglo.FechaPublicacion);
            $("#genero").html(arreglo.Nombre);
            $("#autor").html(arreglo.Autor);
            $("#sinopsis").html(arreglo.Descripcion);
            $("#paginas").html(arreglo.NPaginas);
            $("#presio").html(arreglo.Presio);

            if (arreglo.Clasificacion == 1) {
                $("#clasificacion").html("Niños");
            } else if (arreglo.Clasificacion == 2) {
                $("#clasificacion").html("Adolecentes");
            } else if (arreglo.Clasificacion == 3) {
                $("#clasificacion").html("Adultos");
            }

            for (var i = 0; i < arreglo.Nombre.length; i++) {

                if (arreglo.Nombre[i] != " ") {
                    nombre += arreglo.Nombre[i];
                }
            }

            idLibro = id; //Se asigna el valor a la variable global para mandarlo a FrmCarrito
            titulo = arreglo.Nombre; //Se asigna el valor a la variable global para mandarlo a FrmCarrito
            autor = arreglo.Autor; //Se asigna el valor a la variable global para mandarlo a FrmCarrito
            precio = arreglo.Presio; //Se asigna el valor a la variable global para mandarlo a FrmCarrito

            //agregamos un img con la portada del libro
            $(".card-img-top").attr("src", "libros/" + nombre + ".jpg").attr("id", arreglo.IdLibro);

        } else {

            $("#contenidoVista").load("FrmMenu.aspx", { "typeError": "Ha abido un error al extraer la informacion del libro" });
        }

    },
        function (error) {
            $("#contenidoVista").load("FrmMenu.aspx", { "typeError": "Error: no se pudo llevar acavo la operacion" });
        }

    );
}

function btnDescargar(nombre) {
    if (nombre != null) {
        let ruta = quitarEspacios(nombre);
        $("#btnDescargar").attr("download", ruta).attr("href", "pdfs/" + ruta + ".pdf");
    } else {
        $("#cntMsg").text("Error: A ocurrido un error al realizar la descarga");
        $("#cntMsg").parent().show();
    }

   
}

//Funcion para limpiar el contenedor principal donde se carga la pagina
function limpiar() {
    $("#contenidoVista").empty();
}

function AgregarCarrito() {
    limpiar();
    $("#contenidoVista").load("FrmCarrito.aspx", { "rqtxtIdLibro": idLibro, "rqtxtTitulo": titulo, "rqtxtAutor": autor, "rqtxtPrecio": precio, "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
}