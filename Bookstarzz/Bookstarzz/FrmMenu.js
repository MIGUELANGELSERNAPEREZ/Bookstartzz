$(document).ready(function () {
    // traemos los dados del web service de Libros para 
    //de los 10 libros mas vistos hasta ahora como recomenadacion
    //al usuario. esta info la mandamos a la funcion cargarcarusel
    Bookstarzz.ws.WSLibros.getPopulares(cargarCaruserl, function (e) { });
    Bookstarzz.ws.WSCategorias.getAll(crearSidebar, function (e) { });   
    //cntGestionTitulos es el id del nav en la pagina maestra Maestra.Master
    //contenidito es el id del div ubicado adentro del bloque_2 en FrmMenu
    $("#cntGestionTitulos").click(function () {
        $("#contenidito").load("FrmGestionTitulos.aspx");
    });
});


function cargarCaruserl(result) {
   
 //validamos si el web services nos regresa la cadena esperada
    if (result) {
        
        const ruta = "libros/"; // creamos una ruta donde se encuentran nuestras img
        let arreglo = JSON.parse(result); // hacemos un parse a json
        let nombre = "";

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
                
            $(".glide__slides").append($("<img\>").attr(
                "src", ruta + nombre + ".jpg"));
                $("img").addClass("cuadros");
               
                nombre = "";
               // console.log(libro.Nombre);
               //$("img").append($("<li\>").html(libro.Nombre));
            });

        for (var i = 0; i < 10; i++) {
            $(".glide__bullets").append("<button/>").addClass(
                "glide__bullet");
            $(".glide__bullets").attr("data-glide-dir",i);            

        }

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
        alert("false");

            window.location("FrmLogin.aspx");
        
    }
    
}

function crearSidebar(result) {
    debugger;
    console.log(result);
    if (result) {
        let arreglo = JSON.parse(result);
        arreglo.forEach(
            function (categoria) {
                debugger;
                $(".list-group").append($("<a\>").addClass("list-group-item list-group-item-action").html(categoria.Nombre).attr("href","#"));          

            });

    } else {
        alert("Regreso Vasio");

    } 
}
