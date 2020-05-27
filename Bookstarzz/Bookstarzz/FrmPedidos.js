var tablaPedidosDT;
$(document).ready(function () {
    //Reiniciamos los estilos para este Frm en especifico
    $("#divBloque2").removeClass("col-10");
    $("#divBloque1").removeClass("col-2 pr-0");
    $("#divBloque2").addClass("container-fluid");
    $("#divBloque1").addClass("col");

    //Se deshabilitan los botones
    deshabilitaBtn();

    $("#btnEntregado").click(function () {
        modificarEstatus("entregado");
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
            window.location.replace("FrmLogin.aspx");
        }
    }
        //}, //Este mensaje va para el Login
        //    function (error) {
        //        $("#cntMsg").text("Error: no se ha podido realizar la operación");
        //        $("#cntMsg").parent().show();
        //    }
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
            $("#body_bloque_2_txtDetallesPedido").html("DIRECCION: "+direccion + saltoLinea +
                "CIUDAD: "+ciudad + saltoLinea + "FORMATO: "+formato + saltoLinea + "FOLIO: "+idPedido + saltoLinea +
                "FECHA DE COMPRA: " + fechaCompra + saltoLinea + "ESTATUS DEL PEDIDO: " + estatusPedido);

            $("#txtIdPedido").val(id);//Asignamos aqui el id del pedido en este input oculto
        } else {
            window.location.replace("FrmLogin.aspx");
        }

    }
    );
        //let user = resultUser; /*result[0]['Nombre']*/
        //var pedido = resultPedido;
        //alert(n);
        //$("#body_bloque_2_txtDetallesPedido").append(n);
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
            } else {
                //Mensaje de error lado servidor
                //window.scrollTo(0, 0);
                //$("#txtInpMensaje").val("3");
                //mensaje();
            }
        },
            function (error) {
                ////Mensaje de error lado servidor
                //window.scrollTo(0, 0);
                //$("#txtInpMensaje").val("3");
                //mensaje();
            }
        );
    }
}


function recargarDatos() {
    tablaPedidosDT.fnClearTable();
    Bookstarzz.ws.WSPedidos.getAllPedidos(function (result) {
        if (result) {
            let objJSON = JSON.parse(result);

            tablaPedidosDT.fnAddData(normalizar(objJSON));
        } else {
            window.location.replace("FrmLogin.aspx");
        }
    },
        function (error) {
            //$("#cntMsg").text("Error: no se ha podido realizar la operación");
            //$("#cntMsg").parent().show();
        }
    );
}



