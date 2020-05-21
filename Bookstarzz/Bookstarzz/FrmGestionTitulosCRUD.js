$(document).ready(function () {
    dateP();//Inicializa el datepicker
    llenarInterfaz();
    $("#btnCancelar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmGestionTitulos.aspx");
    });
    $("#btnAceptar").click(function () {
        if (true) {
            if (parseInt($("#txtIdLibro").val()) > 0) {//La function(resul) trae true o false y solo funciona con boton de tipo submit
                Bookstarzz.ws.WSLibros.updateLibro(llenarModelo(), function (result) {
                    if (result == true) {
                        limpiar();
                        $("#contenidoVista").load("FrmGestionTitulos.aspx");
                    } else {
                        //$("#cntMsg").text("Error: no se ha podido realizar la operación");
                        //$("#cntMsg").parent().show();
                    }
                },
                    function (error) {
                        //$("#cntMsg").text("Error: no se ha podido realizar la operación");
                        //$("#cntMsg").parent().show();
                    }
                );
            } else {
                Bookstarzz.ws.WSLibros.insertLibro(llenarModelo(), function (result) {
                    if (parseInt(result) > 0) {
                        limpiar();
                        $("#contenidoVista").load("FrmGestionTitulos.aspx");
                    } else {
                        //$("#cntMsg").text("Error: no se ha podido realizar la operación");
                        //$("#cntMsg").parent().show();
                    }
                },
                    function (error) {
                        //$("#cntMsg").text("Error: no se ha podido realizar la operación");
                        //$("#cntMsg").parent().show();
                    }
                );
            }
        }
    });
});

//Funcion para limpiar el contenedor principal donde se carga la pagina
function limpiar() {
    $("#contenidoVista").empty();
}

//Funcion para inizializar el datepicker
function dateP() {
    //Debo cambiar el id de datepicker para que sea dinamico con el name del site master
    $("#body_bloque_2_txtCalendario").datepicker({
        orientation: "top auto",
        format: "yyyy-mm-dd",
        language: "es",
        autoclose: true,
        todayHighlight: true
    });
}

function llenarModelo() {
    let obj = {};
    //let clasificacion;
    if (parseInt($("#txtIdLibro").val()) > 0) {
        obj.IdLibro = $("#body_bloque_2_txtIDLib").val();
    }
    obj.Nombre = $("#body_bloque_2_txtNombre").val();
    obj.Autor = $("#body_bloque_2_txtAutor").val();
    obj.NPaginas = $("#body_bloque_2_txtNumPaginas").val();
    //if ($("#body_bloque_2_dropDownClasificacion").val() == "Niños") {
    //    clasificacion = 1;
    //}
    //if ($("#body_bloque_2_dropDownClasificacion").val() == "Adolecentes") {
    //    clasificacion = 2;
    //}
    //if ($("#body_bloque_2_dropDownClasificacion").val() == "Adultos") {
    //    clasificacion = 3;
    //}
    obj.Clasificacion = 1;
    obj.Editorial = $("#body_bloque_2_txtEditorial").val();
    obj.ISBN = $("#body_bloque_2_txtISBN").val();
    obj.FechaPublicacion = $("#body_bloque_2_txtCalendario").val();
    obj.Presio = $("#body_bloque_2_txtPrecio").val();
    obj.Descripcion = $("#body_bloque_2_txtDescripcion").val();
    return JSON.stringify(obj);
}

function llenarInterfaz() {
    const id = $("#txtIdLibro").val();
    if (id > 0) {
        $("#tituloFRM").text("GESTION DE TITULOS - MODIFICAR");
        Bookstarzz.ws.WSLibros.getOne(id, llenarUI, function (e) {
            //$("#cntMsg").text("Error: al intentar obtener la información");
            //$("#cntMsg").parent().show();
        });
    }
}

function llenarUI(resul) {
    if (resul) {
        let clasificacion;
        //Se llena con body_bloque_2_ seguido del id por la notacion de controles ASP
        let obj = JSON.parse(resul);
        $("#body_bloque_2_txtIDLib").val(obj.IdLibro);
        $("#body_bloque_2_txtNombre").val(obj.Nombre);
        $("#body_bloque_2_txtAutor").val(obj.Autor);
        $("#body_bloque_2_txtNumPaginas").val(obj.NPaginas);
        if (obj.Clasificacion == 1) {
            clasificacion = "Niños"; //Niños es el identificador que tiene en el atributo VALUE
        }
        if (obj.Clasificacion == 2) {
            clasificacion = "Adolecentes";
        }
        if (obj.Clasificacion == 3) {
            clasificacion = "Adultos";
        }
        $("#body_bloque_2_dropDownClasificacion").val(clasificacion);
        $("#body_bloque_2_txtEditorial").val(obj.Editorial);
        $("#body_bloque_2_txtISBN").val(obj.ISBN);
        $("#body_bloque_2_txtCalendario").val(obj.FechaPublicacion);
        $("#body_bloque_2_txtPrecio").val(obj.Presio);
        $("#body_bloque_2_txtDescripcion").val(obj.Descripcion);
    } else {
        window.location.redirect("/");
    }
}

//function valido() {
//    let noval = 0;
//    $("#txtNombre").removeClass("is-valid", "is-invalid");
//    $("#txtAutor").removeClass("is-valid", "is-invalid");
//    $("#txtNumPaginas").removeClass("is-valid", "is-invalid");
//    $("#dropDownClasificacion").removeClass("is-valid", "is-invalid");
//    $("#txtEditorial").removeClass("is-valid", "is-invalid");
//    $("#txtISBN").removeClass("is-valid", "is-invalid");
//    $("#txtCalendario").removeClass("is-valid", "is-invalid");
//    $("#txtPrecio").removeClass("is-valid", "is-invalid");
//    $("#txtDescripcion").removeClass("is-valid", "is-invalid");
//    if ($("#txtNombre").val().trim().length >= 1 &&
//        $("#txtNombre").val().trim().length <= 50) {
//        $("#txtNombre").addClass("is-valid");
//    } else {
//        $("#txtNombre").addClass("is-invalid");
//        noval++;
//    }
//    return noval == 0 ? true : false;
//}