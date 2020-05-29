$(document).ready(function () {
    validaURL(); //Validamos para que no acceda explicitamente a FrmPedidos.aspx
    //Reiniciamos los estilos para este Frm en especifico
    $("#divBloque2").removeClass("col-10");
    $("#divBloque1").removeClass("col-2 pr-0");
    $("#divBloque2").addClass("container-fluid");
    $("#divBloque1").addClass("col");

    dateP();//Inicializa el datepicker
    llenarInterfaz();
    mensaje(); //Se llama el metetodo de mensajes

    $("#btnCancelar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmGestionTitulos.aspx", { "txtURL": 1 });
    });

    $("#btnAceptar").click(function () {
        $("#formGestionTCRUD").data("bootstrapValidator").validate(); //Validar por defecto de Bootstrap
        if ($("#formGestionTCRUD").data("bootstrapValidator").isValid()) {
            if (parseInt($("#txtIdLibro").val()) > 0) {//La function(resul) trae true o false y solo funciona con boton de tipo submit
                Bookstarzz.ws.WSLibros.updateLibro(llenarModelo(), function (result) {
                    if (result == true) {
                        var idGlobal = $("#txtIdLibro").val();
                        limpiar();
                        $("#contenidoVista").load("FrmGestionTitulos.aspx", { "txtMsg": 1, "txtIdGlobal": idGlobal, "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
                    } else {
                        //Mensaje de error lado servidor
                        window.scrollTo(0, 0);
                        $("#txtInpMensaje").val("3");
                        mensaje();
                    }
                },
                    function (error) {

                    }
                );
            } else {
                Bookstarzz.ws.WSLibros.insertLibro(llenarModelo(), function (result) {
                    if (parseInt(result) > 0) {
                        limpiar();
                        $("#contenidoVista").load("FrmGestionTitulosCRUD.aspx", { "txtInpMensaje": "1", "txtURL": 1 }); //Le mando un valor para saber si esta direccionando desde FrmBookstarzz o escribiendo explicitamente la URL
                    } else {
                        //Mensaje de error lado servidor
                        window.scrollTo(0, 0);
                        $("#txtInpMensaje").val("3");
                        mensaje();
                    }
                },
                    function (error) {

                    }
                );
            }
        }
        else {
            //En caso de que el Boostrap validator detecte datos erroneos en formulario, manda mensaje de error
            window.scrollTo(0, 0);
            $("#txtInpMensaje").val("2");
            mensaje();
        }
    });
    validacionBootsVal(); //Activamos el plugin de Bootstrap validator
});

//Este metodo valida para que no se acceda explicitamente a la URL FrmPedidos.aspx
function validaURL() {
    debugger;
    const id = $("#txtURL").val();
    if (id != 1) {
        //Redirecciona al login
        window.location.replace("FrmBookstarzz.aspx");
    }
}

//Metodo utilizado para validar en caso de una insercion y enviar un mensaje
function mensaje() {
    //Codigos de mensaje: 0: no hay nada; 1 se inserto; 2 error lado cliente; 3 error lado servidor
    const id = $("#txtInpMensaje").val();
    if (id == 1) {
        $("#cntMsg").text("El libro se agregó con éxito"); //Se agrega el texto
        $("#divMsg").addClass("alert-success"); //Se agrega la clase de success al div
        $("#divMsg").css("display", "block"); //Se habilita el div para mostrarse
        setTimeout(function () {
            $("#divMsg").css("display", "none").fadeOut(); //Se asigna un tiempo de 3 segundos para cerrar automaticamente el div
        }, 3000);
    }
    if (id == 2) {
        $("#tipoMsg").text("Error: "); //Se agrega el texto
        $("#cntMsg").text("Verifica que la informacion introducida sea correcta y vuelve a intentarlo"); //Se agrega el texto
        $("#divMsg").addClass("alert-danger"); //Se agrega la clase de success al div
        $("#divMsg").css("display", "block"); //Se habilita el div para mostrarse
    }
    if (id == 3) {
        $("#tipoMsg").text("Error: "); //Se agrega el texto
        $("#cntMsg").text("Ha ocurrido un problema interno al intentar manipular/obtener la informacion"); //Se agrega el texto
        $("#divMsg").addClass("alert-danger"); //Se agrega la clase de success al div
        $("#divMsg").css("display", "block"); //Se habilita el div para mostrarse
    }
}

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
    let clasificacion;
    if (parseInt($("#txtIdLibro").val()) > 0) {
        obj.IdLibro = $("#body_bloque_2_txtIDLib").val();
    }
    obj.Nombre = $("#body_bloque_2_txtNombre").val();
    obj.Autor = $("#body_bloque_2_txtAutor").val();
    obj.NPaginas = $("#body_bloque_2_txtNumPaginas").val().trim();
    //Se convierte a entero el valor de la clasificacion, ya que asi lo guarda el objeto Libros
    if ($("#body_bloque_2_dropDownClasificacion").val() == "Niños") {
        clasificacion = 1;
    }
    if ($("#body_bloque_2_dropDownClasificacion").val() == "Adolecentes") {
        clasificacion = 2;
    }
    if ($("#body_bloque_2_dropDownClasificacion").val() == "Adultos") {
        clasificacion = 3;
    }
    obj.Clasificacion = clasificacion; //Se asigna el entero
    obj.Editorial = $("#body_bloque_2_txtEditorial").val();
    obj.ISBN = $("#body_bloque_2_txtISBN").val().trim();
    obj.FechaPublicacion = $("#body_bloque_2_txtCalendario").val();
    obj.Presio = $("#body_bloque_2_txtPrecio").val();
    obj.Descripcion = $("#body_bloque_2_txtDescripcion").val();
    return JSON.stringify(obj);
}

function llenarInterfaz() {
    const id = $("#txtIdLibro").val();
    if (id > 0) {
        $("#tituloFRM").text("MODIFICAR");
        $("#body_bloque_2_lblIDLib").attr("hidden", false); //Se habilita input de id para verse
        $("#body_bloque_2_txtIDLib").attr("hidden", false); //Se habilita input de id para verse
        Bookstarzz.ws.WSLibros.getOne(id, llenarUI, function (e) {
            //Mensaje de error lado servidor
            $("#btnAceptar").attr("disabled", true);
            window.scrollTo(0, 0);
            $("#txtInpMensaje").val("3");
            mensaje();
        });
    }
    else {
        $("#tituloFRM").text("AGREGAR");
    }
}

function llenarUI(resul) {
    if (resul) {
        let clasificacion;
        let fecha;//Este es para guardar la fecha ya transformada
        //Se llena con body_bloque_2_ seguido del id por la notacion de controles ASP
        let obj = JSON.parse(resul);
        //Se procede a transformar la fecha de milisegundos y se guarda en la variable fecha. Y esta se pasa al #body_bloque_2_txtCalendario
        fecha = moment(obj.FechaPublicacion).format("YYYY-MM-DD");
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
        $("#body_bloque_2_txtCalendario").val(fecha);
        $("#body_bloque_2_txtPrecio").val(obj.Presio);
        $("#body_bloque_2_txtDescripcion").val(obj.Descripcion);
    } else {
        window.location.redirect("/");
    }
}

function validacionBootsVal() {
    $("#formGestionTCRUD").bootstrapValidator({
        feedbackIcons: {
            valid: "glyphicon glyphicon-ok",
            invalid: "glyphicon glyphicon-remove",
            validating: "glyphicon glyphicon-refresh"
        },
        fields: {
            ctl00$body_bloque_2$txtNombre: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 2,
                        max: 50,
                        message: "El elemento debe tener entre 2 y 50 caracteres"
                    },
                    regexp: {
                        regexp: /^[a-zA-ZñÑ0-9\s]+$/,
                        message: "El elemento debe contener caracteres alfanumericos"
                    }
                }
            },
            ctl00$body_bloque_2$txtAutor: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 2,
                        max: 50,
                        message: "El elemento debe tener entre 2 y 50 caracteres"
                    },
                    regexp: {
                        regexp: /^[a-zA-ZñÑ0-9\s]+$/,
                        message: "El elemento debe contener caracteres alfanumericos"
                    }
                }
            },
            ctl00$body_bloque_2$txtNumPaginas: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 1,
                        max: 11,
                        message: "El elemento debe tener entre 1 y 11 caracteres"
                    },
                    regexp: {
                        regexp: /^[1-9][0-9]*$/,
                        message: "El elemento debe contener solo caracteres numericos"
                    }
                }
            },
            ctl00$body_bloque_2$txtEditorial: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: "El elemento debe tener entre 2 y 30 caracteres"
                    },
                    regexp: {
                        regexp: /^[a-zA-ZñÑ0-9\s]+$/,
                        message: "El elemento debe contener caracteres alfanumericos"
                    }
                }
            },
            ctl00$body_bloque_2$txtISBN: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: "El elemento debe tener entre 2 y 30 caracteres"
                    },
                    regexp: {
                        regexp: /^[a-zA-ZñÑ0-9]+$/,
                        message: "El elemento debe contener caracteres alfanumericos. No se admiten espacios"
                    }
                }
            },
            ctl00$body_bloque_2$txtCalendario: {
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    date: {
                        format: "YYYY-MM-DD",
                        message: "Fecha no válida"
                    }
                }
            },
            ctl00$body_bloque_2$txtPrecio: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: "El elemento debe tener entre 1 y 10 caracteres"
                    },
                    regexp: {
                        regexp: /^[0-9]+([.][0-9]+)?$/,
                        message: "El elemento debe contener solo punto y caracteres numericos"
                    }
                }
            },
            ctl00$body_bloque_2$txtDescripcion: {
                message: "El elemento no es valido",
                validators: {
                    notEmpty: {
                        message: "El elemento es requerido y no puede quedar vacio"
                    },
                    stringLength: {
                        min: 2,
                        max: 300,
                        message: "El elemento debe tener entre 2 y 300 caracteres"
                    },
                    regexp: {
                        regexp: /^[a-zA-ZñÑ0-9\s]+$/,
                        message: "El elemento debe contener caracteres alfanumericos"
                    }
                }
            }
        }
    });
}