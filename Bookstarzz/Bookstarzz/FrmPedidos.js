var tablaPedidosDT;
$(document).ready(function () {
    //Reiniciamos los estilos para este Frm en especifico
    $("#divBloque2").removeClass("col-10");
    $("#divBloque1").removeClass("col-2 pr-0");
    $("#divBloque2").addClass("container-fluid");
    $("#divBloque1").addClass("col");

    cargarPedidos();
    //Esto comentado es sin AJAX(metodos en webservices)
    //Cargo el metodo para adecuar la tabla antes de lanzar el plugin Datatables
    //adecuarTabla();
    cargarUsuarios();
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

function cargarUsuarios() {
    Bookstarzz.ws.WSUsuarios.getAll(function (result) {
        if (result) {
            debugger;
            llenarDetallePedido(JSON.parse(result));
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

    //Almacenamos la referencia a la tabla con el plugin aplicado, ya que la usaremos para los filtros
    tablaPedidosDT = $('#tblPedidos').dataTable({

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
            { width: "10%", targets: [0] },
            { width: "40%", targets: [1, 2] },
            { width: "10%", targets: [3] },
            { width: "5%", targets: [4] },
            { width: "15%", targets: [5] },
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
}

function llenarDetallePedido(objJSON) {
    alert("HOLA");
    var n = objJSON[0]['Nombre'];
    alert(n);
    $("#body_bloque_2_txtDetallesPedido").append(n);
}

