var tablaPedidosDT;
$(document).ready(function () {
    //Reiniciamos los estilos para este Frm en especifico
    $("#divBloque2").removeClass("col-10");
    $("#divBloque1").removeClass("col-2 pr-0");
    $("#divBloque2").addClass("container-fluid");
    $("#divBloque1").addClass("col");

    //Se deshabilitan los botones
    deshabilitaBtn();

    //Boton eliminar del modal
    $("#btnConfirmarAccion").click(cofirmMoverEstatus);

    $("#btnEntregado").click(function () {
        const folio = $("#txtIdPedido").val();
        moverEstatus(folio); //Primero pasa a este metodo para preactivar el modal
    });

    cargarPedidos(); //Llammamos el WebService que cargara el DataTable con los pedidos

});

//Funcion para limpiar el contenedor principal donde se carga la pagina
function limpiar() {
    $("#contenidoVista").empty();
}

function cargarPedidos() {
    Bookstarzz.ws.WSPedidos.getAllPedidos(function (result) {
        if (result) {
            cargarDatos(JSON.parse(result));
        } else {
            //Redirecciona al login
            window.location.replace("FrmLogin.aspx");
        }
    },
        function (error) {
            //Mensaje de error lado servidor
            window.scrollTo(0, 0);
            $("#txtMsg").val("2");
            mensaje();
        }
    );
}

function cargarDatos(datos) {
    normalizar(datos);
    //Almacenamos la referencia a la tabla con el plugin aplicado, ya que la usaremos para los filtros
    tablaPedidosDT = $('#tblPedidos').dataTable({

        select: true,

        //Cambiamos el lenguaje del DataTable
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ libros",
            "infoEmpty": "Mostrando 0 a 0 de 0 libros",
            "infoFiltered": "(Filtrado de _MAX_ total libros)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ libros",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },

        //Asignamos la colección de datos en JSON que se mostrarán en la tabla
        data: datos,
        //La tabla ajusta cada columna de acuerdo a los datos contenidos en ellas
        //pero podemos también asignar un ancho fijo de esta manera, targets representa los 
        //índices de las columnas a los que se les aplicará este tamaño
        columnDefs: [
            { width: "5%", targets: [0] },
            { width: "35%", targets: [1, 2] },
            { width: "10%", targets: [3] },
            { width: "5%", targets: [4] },
            { width: "20%", targets: [5] },
            { width: "20%", targets: [6] }
        ],
        columns: [
            //el valor colocado en title es el texto que aparecerá en la columna y el valor colocado en 
            //data deberá ser el nombre de la propiedad del pojo que recibirémos en la colección de datos
            { title: "FOLIO", data: "idPedido" }, //Si quiere mostrarse el id se descomenta esta linea
            { title: "Cliente", data: "idUsuario" },
            { title: "Direccion", data: "direccion" },
            { title: "Ciudad", data: "ciudad" },
            { title: "Formato", data: "formato" },
            { title: "Fecha de compra", data: "fechaCompra" },
            { title: "Estatus del pedido", data: "estatusPedido" }
        ]
    });

    //En caso de que un renglon se seleccione, se detecta el id del pedido y se manda a llenarDetallePedido
    $('#tblPedidos tbody').on('click', 'tr', function () {
        deshabilitaBtn();
        const id = $(this).find('td').first().text(); //Obtenemos el id sacandolo del diseño de la tabla
        const estatus = ($(this).find('td').last().text()); //Obtenemos el estatus sacandolo del diseño de la tabla
        if (estatus == "preparado") {
            $("#btnEntregado").attr("disabled", false); //Activamos el boton para entregar
        }
        llenarDetallePedido(id);
    });
}

//Funcion ubicada en el boton de la tabla
function moverEstatus(folio) {
    //Span
    $("#spnFolio").text(folio);
    //Modal ubicaco en FrmGestionTitulos
    $("#mdlConfirmar").modal();
}

function cofirmMoverEstatus() {
    $("#mdlConfirmar").modal('hide');
    modificarEstatus("entregado")
}

//Funcion para deshabilitar el boton entregado
function deshabilitaBtn() {
    $("#btnEntregado").attr("disabled", true);
}

//Funcion que se encarga de llenar el textarea con la informacion especifica del pedido
function llenarDetallePedido(id) {
    $("#body_bloque_2_txtDetallesPedido").text("");
    Bookstarzz.ws.WSPedidos.getOne(id, function (result) {
        if (result) {
            const saltoLinea = "\r\n"; //Se crea asi, por que un salto de linea <br> no funciona como tal en contenedores TextBoxASP
            let objPedidos = normalizar(JSON.parse(result));
            let direccion = objPedidos["direccion"];
            let ciudad = objPedidos["ciudad"];
            let formato = objPedidos["formato"];
            let idPedido = objPedidos["idPedido"];
            let fechaCompra = objPedidos["fechaCompra"];
            let estatusPedido = objPedidos["estatusPedido"];
            //$("#body_bloque_2_txtDetallesPedido").append("<br>" + direccion);
            $("#body_bloque_2_txtDetallesPedido").html("DIRECCION: " + direccion + saltoLinea +
                "CIUDAD: " + ciudad + saltoLinea + "FORMATO: " + formato + saltoLinea + "FOLIO: " + idPedido + saltoLinea +
                "FECHA DE COMPRA: " + fechaCompra + saltoLinea + "ESTATUS DEL PEDIDO: " + estatusPedido);

            $("#txtIdPedido").val(id);//Asignamos aqui el id del pedido en este input oculto
        } else {
            //Redirecciona al login
            window.location.replace("FrmLogin.aspx");
        }

    },
        function (error) {
            //Mensaje de error lado servidor
            window.scrollTo(0, 0);
            $("#txtMsg").val("2");
            mensaje();
        }
    );
}

//Funcion usada para normalizar ciertos tipos de datos al momento de ser presentados
function normalizar(datos) {
    //Ciclo usado para transformar los milisegundos de DateTime en una Fecha normal
    //Metodo moment es de la libreria moment.js
    for (let i = 0; i < datos.length; i++) {
        datos[i]['fechaCompra'] = moment(datos[i]['fechaCompra']).format("YYYY-MM-DD");
        //Ifs usados para transformar el numero de la clasificacion
    }
    //Linea para cuando entra desde metodo de llenarDetallePedido
    datos['fechaCompra'] = moment(datos['fechaCompra']).format("YYYY-MM-DD");
    return datos;
}

//Funcion que modifica el estatus del pedido
function modificarEstatus(estatus) {
    const id = $("#txtIdPedido").val();
    let objPedidos = {};
    if (estatus == "entregado") {
        objPedidos.idPedido = id;
        objPedidos.estatusPedido = estatus;
        Bookstarzz.ws.WSPedidos.updateEstatusPedido(JSON.stringify(objPedidos), function (result) {
            if (result == true) {
                recargarDatos();
                deshabilitaBtn();
                window.scrollTo(0, 0);
                $("#txtMsg").val("1");
                mensaje();
            } else {
                //Redirecciona al login
                window.location.replace("FrmLogin.aspx");
            }
        },
            function (error) {
                //Mensaje de error lado servidor
                window.scrollTo(0, 0);
                $("#txtMsg").val("2");
                mensaje();
            }
        );
    }
}

function recargarDatos() {
    tablaPedidosDT.fnClearTable();
    Bookstarzz.ws.WSPedidos.getAllPedidos(function (result) {
        if (result) {
            let objJSON = JSON.parse(result);
            const id = $("#txtIdPedido").val();
            llenarDetallePedido(id);
            tablaPedidosDT.fnAddData(normalizar(objJSON));
        } else {
            //Redirecciona al login
            window.location.replace("FrmLogin.aspx");
        }
    },
        function (error) {
            //Mensaje de error lado servidor
            window.scrollTo(0, 0);
            $("#txtMsg").val("2");
            mensaje();
        }
    );
}

//Metodo utilizado para validar mensajes de exito y error
function mensaje() {
    //Codigos de mensaje: 0: no hay nada; 1 se modifico registro; 2 error lado servidor
    const id = $("#txtMsg").val();
    if (id == 1) {
        $("#cntMsg").text("El pedido paso de PREPARADO a ENTREGADO con éxito"); //Se agrega el texto
        $("#divMsg").addClass("alert-success"); //Se agrega la clase de success al div
        $("#divMsg").css("display", "block"); //Se habilita el div para mostrarse
        setTimeout(function () {
            $("#divMsg").css("display", "none").fadeOut(); //Se asigna un tiempo de 3 segundos para cerrar automaticamente el div
        }, 3000);
    }
    if (id == 2) {
        $("#tipoMsg").text("Error: "); //Se agrega el texto
        $("#cntMsg").text("Ha ocurrido un problema interno al intentar obtener la informacion"); //Se agrega el texto
        $("#divMsg").addClass("alert-danger"); //Se agrega la clase de success al div
        $("#divMsg").css("display", "block"); //Se habilita el div para mostrarse
    }
}