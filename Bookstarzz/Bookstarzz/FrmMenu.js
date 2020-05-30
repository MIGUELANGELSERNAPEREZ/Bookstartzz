
$(document).ready(function () {
    debugger;
    // traemos los dados del web service de Libros para 
    //de los 10 libros mas vistos hasta ahora como recomenadacion
    //al usuario. esta info la mandamos a la funcion cargarcarusel
    Bookstarzz.ws.WSLibros.getPopulares(cargarCategorias, function (error) {

        if (error._exceptionType == "System.Security.SecurityException") {
            
            window.location.replace("FrmLogin.aspx");

        } else {

            $("#cntMsg").text("Error: no se ha podido cargar los libros en el carrucel");
            $("#cntMsg").parent().show();
        }
       

    });
    
    //analizamos si nuestro contenedor de erores trae uno
    if ($("#txtError").val() != "nada") {
        $("#cntMsg").text($("#txtError").val());
        $("#cntMsg").parent().show();
        $("#txtError").val("nada");
    } 
      
}); // fin del ready

var mas = 0;
let cantidad = 9
function verMas() {
    let traer = true;
    let total = 0;
    if (mas == 0) {
        cantidad += 9;
    } else {

        Bookstarzz.ws.WSLibros(function (result) {

            if (result) {
                total = JSON.parse(result);
            
            } else {
                $("#cntMsg").text("Error: no se ha podido cargar los libros nuevos en existencia");
                $("#cntMsg").parent().show();
            }

        }, function (error) {
                if (error._exceptionType == "System.Security.SecurityException") {

                    window.location.replace("FrmLogin.aspx");

                } else {

                    $("#cntMsg").text("Error: no se ha podido cargar los libros nuevos en existencia");
                    $("#cntMsg").parent().show();
                }

            });

        if (parseInt(total) > cantidad + 9) {           
            cantidad += 9;
        } else {
            traer = false;
        }
       
    }

    if (traer) {

        Bookstarzz.ws.WSLibros.getNuevos(cantidad, function (result) {

            if (result) {
                debugger;

                let libros = JSON.parse(result);
                let inicio = libros.length - 9;
                var datos = [];
                var objeto = {};


                for (var i = inicio; i < libros.length; i++) {

                    var nombre = libros[i];

                    datos.push({
                        "IdLibro": libros[i].IdLibro,
                        "Nombre": libros[i].Nombre
                    });
                }

                //objeto.datos = datos;
             
                //crearLibrosNuevos(JSON.stringify(objeto));
                crearLibrosNuevos(JSON.stringify(datos));

               

            } else {
                $("#cntMsg").text("Error: no se ha podido cargar los libros nuevos en existencia");
                $("#cntMsg").parent().show();
            }

        }, function (error) {
                if (error._exceptionType == "System.Security.SecurityException") {

                    window.location.replace("FrmLogin.aspx");

                } else {

                    $("#cntMsg").text("Error: no se ha podido cargar los libros nuevos en existencia");
                    $("#cntMsg").parent().show();
                }

        });

    } else {
        $("#cntMsg").text("Error: No hay mas libros para mostrar");
        $("#cntMsg").parent().show();
    }
   

}

function cargarCategorias(result) {

    Bookstarzz.ws.WSCategorias.getAll(crearSidebar, function (error) {

        if (error._exceptionType == "System.Security.SecurityException") {

            window.location.replace("FrmLogin.aspx");

        } else {

            $("#cntMsg").text("Error: no se ha podido cargar las categorias de los libros");
            $("#cntMsg").parent().show();
        }
       

    });
 //validamos si el web services nos regresa la cadena esperada
    if (result) {
        
        const ruta = "libros/"; // creamos una ruta donde se encuentran nuestras img
        let arreglo = JSON.parse(result); // hacemos un parse a json
        let nombre = "";
        let contador = 1;
        

        //vamos a recorrer cada objeto que tiene el arreglo
        arreglo.forEach(
            function (libro) {
             // le quitamos los espacios al titulo del libro para 
            //no tener problemas al buscar el nombre de la imagen
            for (var i = 0; i < libro.Nombre.length; i++) {
                
                if (libro.Nombre[i] != " ") {
                    nombre += libro.Nombre[i];
                } 
                }
                //enceguida de la clase .glide_slides agregaremos un
                //img al cual le agregaremos la ruta de nuestra img
                //para plasmarla. ademas de agregarle la clase que 
                // modificara su estructura

                $(".glide__slides").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro));
               
                nombre = "";
                let id = libro.IdLibro.toString();

                $("#" + id).bind("click", function () {
                    debugger;
                    //alert($(this).attr("id"));
                    $("#contenidoVista").load("FrmLibro.aspx", { "id": id });
                });

                $(".glide__bullets").append("<button/>").addClass(
                    "glide__bullet");
                $(".glide__bullets").attr("data-glide-dir", "cuadro"+contador); 

                contador++;
               
            });

       

        //iniciamos a crear la funcionalidad de nuestro carusel
        var glide = new Glide('.glide', {
            type: 'carousel', //hay dos tipos slider y carrousel
            startAt: 5, //adónde inicia el slider
            focusAt: 'center',
            autoplay: 2000, //inicia automatic en miliseg
            perView: 4, //cantidad de slide en pantalla
            breakpoints: { //para el tamaño de pantalla
                800: { perView: 2 },
                480: { perView: 1 }
            }
        })
        glide.mount()

    } else {       
        
        $("#cntMsg").text("Error: no se ha podido cargar el carrusel");
        $("#cntMsg").parent().show();  
    }
    
}

//se encarga de cargar en pantalla las distintas categorias
function crearSidebar(result) {

    Bookstarzz.ws.WSLibros.getNuevos(9,crearLibrosNuevos, function (error) {
        if (error._exceptionType == "System.Security.SecurityException") {

            window.location.replace("FrmLogin.aspx");

        } else {

            $("#cntMsg").text("Error: no se ha podido cargar los libros nuevos en existencia");
            $("#cntMsg").parent().show();
        }
    });

    console.log(result);
    if (result) {
        let arreglo = JSON.parse(result);
        arreglo.forEach(
            function (categoria) {
                $(".list-group").append($("<a\>").addClass("list-group-item list-group-item-action").html(categoria.nombreCategoria).attr("href", "#").attr("id",categoria.idCategoria));          

                //le damos el evento clic
                $("#" + categoria.idCategoria).bind("click", function () {
                    debugger;
                    cargarXCategoria(categoria.idCategoria);

                });
            });

    } else {
        $("#cntMsg").text("Error: no se ha podido Cargar las categorias de los libros");
        $("#cntMsg").parent().show();

    } 
}


function cargarXCategoria( id ) {

    Bookstarzz.ws.WSCategorias.getCategoria(id, function (result) {

        if (result) {
            debugger;
            const ruta = "libros/";
            let arreglo = JSON.parse(result);
            let cont = 0;
            let nombre = "";
            arreglo.forEach(
                function (libro) {
                    for (var i = 0; i < libro.Nombre.length; i++) {

                        if (libro.Nombre[i] != " ") {
                            nombre += libro.Nombre[i];
                        }
                    }
                    //debugger;
                    if (cont < 3) {
                        debugger;

                        $(".uno").append($("<div\>").addClass("col-4").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro)));
                        //img = $(".uno").append($("<div\>").addClass("col-4").append($("<img\>")));

                    } else if (cont > 2 && cont < 6) {

                        //img = $(".dos").append($("<div\>").addClass("col-4").append($("<img\>")));
                        $(".dos").append($("<div\>").addClass("col-4").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro)));
                    } else {

                        //img = $(".uno").append($("<div\>").addClass("col-4").append($("<img\>")));
                        $(".tres").append($("<div\>").addClass("col-4").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro)));
                    }

                    let id = libro.IdLibro.toString();

                    $("#" + id).bind("click", function () {
                        debugger;
                        //alert($(this).attr("id"));
                        $("#contenidoVista").load("FrmLibro.aspx", { "id": id });

                    });

                    cont++;
                    nombre = "";
                });

        } else {
            $("#cntMsg").text("Error: no se ha podido cargar la pagina con la categoria especificada");
            $("#cntMsg").parent().show();
        }
    },

        function (error) {

            if (error._exceptionType == "System.Security.SecurityException") {

                window.location.replace("FrmLogin.aspx");

            } else {
               
                $("#cntMsg").text("No se ha podido cargar la pagina con la categoria especificada");
                $("#cntMsg").parent().show();
            }
            
        });

}

function crearLibrosNuevos( result ) {
    console.log(result);
    if (result) {
        debugger;
        const ruta = "libros/";
        let arreglo = JSON.parse(result);
        let cont = 0;
        let nombre = "";
        console.log(arreglo);
        arreglo.forEach(
            function (libro) {

                for (var i = 0; i < libro.Nombre.length; i++) {

                    if (libro.Nombre[i] != " ") {
                        nombre += libro.Nombre[i];
                    }
                }
                //debugger;
                if (cont < 3) {
                    debugger;

                    $(".uno").append($("<div\>").addClass("col-4").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro)));
                    //img = $(".uno").append($("<div\>").addClass("col-4").append($("<img\>")));

                } else if (cont > 2 && cont < 6) {
                    
                    //img = $(".dos").append($("<div\>").addClass("col-4").append($("<img\>")));
                    $(".dos").append($("<div\>").addClass("col-4").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro)));
                } else {

                    //img = $(".uno").append($("<div\>").addClass("col-4").append($("<img\>")));
                    $(".tres").append($("<div\>").addClass("col-4").append($("<img\>").attr("src", ruta + nombre + ".jpg").addClass("cuadros").attr("id", libro.IdLibro)));
                }

                let id = libro.IdLibro.toString();

                $("#" + id).bind("click", function () {
                    debugger;
                    //alert($(this).attr("id"));
                    $("#contenidoVista").load("FrmLibro.aspx", { "id": id });

                });

                cont++;
                nombre = "";
            });

    } else {
        $("#cntMsg").text("Error: no se ha podido cargar la seccion de los libros resientemente disponibles");
        $("#cntMsg").parent().show();
    } 
}

var NRows = 64; 

function TraerMasLibros(num) {
    if (num > 0) {

        let nomFila = NRows + num;


    } else {
        //errro
    }
}























