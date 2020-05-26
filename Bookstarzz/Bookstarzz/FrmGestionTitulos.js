var tablaLibrosDT;
$(document).ready(function () {
    //Reiniciamos los estilos para este Frm en especifico
    $("#divBloque2").removeClass("col-10"); 
    $("#divBloque1").removeClass("col-2 pr-0");
    $("#divBloque2").addClass("container-fluid");
    $("#divBloque1").addClass("col");

    cargarGestionTitulos();
    //Esto comentado es sin AJAX(metodos en webservices)
    //Cargo el metodo para adecuar la tabla antes de lanzar el plugin Datatables
    //adecuarTabla();

    //Boton agregar titulo FrmGestionTitulosCRUD
    $("#btnAgregar").click(function () {
        limpiar();
        $("#contenidoVista").load("FrmGestionTitulosCRUD.aspx");
    });

    //Boton eliminar del modal
    $("#btnConfirmarEliminar").click(cofirmEliminar);
});

//Funcion para limpiar el contenedor principal donde se carga la pagina
function limpiar() {
    $("#contenidoVista").empty();
}

function cargarGestionTitulos() {
    Bookstarzz.ws.WSLibros.getAll(function (result) {
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

//Funcion usada para normalizar ciertos tipos de datos al momento de ser presentados en la taba
function normalizar(datos) {
    //Ciclo usado para transformar los milisegundos de DateTime en una Fecha normal
    //Metodo moment es de la libreria moment.js
    for (let i = 0; i < datos.length; i++) {
        datos[i]['FechaPublicacion'] = moment(datos[i]['FechaPublicacion']).format("YYYY-MM-DD");
        //Ifs usados para transformar el numero de la clasificacion
        if (datos[i]['Clasificacion'] == 1) {
            datos[i]['Clasificacion'] = "Niños";
        }
        if (datos[i]['Clasificacion'] == 2) {
            datos[i]['Clasificacion'] = "Adolescentes";
        }
        if (datos[i]['Clasificacion'] == 3) {
            datos[i]['Clasificacion'] = "Adultos";
        }
    }
    return datos;
}

function cargarDatos(datos) {
    normalizar(datos);

    //Almacenamos la referencia a la tabla con el plugin aplicado, ya que la usaremos para los filtros
    tablaLibrosDT = $('#tblGestionTitulos').dataTable({

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
            { width: "10%", targets: [1, 2] },
            { width: "15%", targets: [3] },
            { width: "20%", targets: [4] },
            { width: "5%", targets: [5, 6, 7, 8] },
            { width: "20%", targets: [9] }
        ],
        columns: [
            //el valor colocado en title es el texto que aparecerá en la columna y el valor colocado en 
            //data deberá ser el nombre de la propiedad del pojo que recibirémos en la colección de datos
            { title: "ID", data: "IdLibro" }, //Si quiere mostrarse el id se descomenta esta linea
            { title: "Nombre", data: "Nombre" },
            { title: "Autor", data: "Autor" },
            { title: "ISBN", data: "ISBN" },
            { title: "Fecha de publicación", data: "FechaPublicacion" },
            { title: "Precio", data: "Presio" },
            { title: "Páginas", data: "NPaginas" },
            { title: "Visitas", data: "Visitas" },
            { title: "Clasificación", data: "Clasificacion" },
            { //Esta columna coloca los botones que representarán las operaciones de cada renglón
                //Este tipo de especificación también nos permite manipular la visualización de una columna
                //por ejemplo, hay veces que en una propiedad del objeto que es entera o trae datos representativos
                //como el Genero, solemos colocar solo M y F, y cuando los mostramos en la tabla queremos que se vea 
                //como Masculino y Femenino

                title: "", data: null, render:
                    //En este otro caso data trae el objeto que se carga en la fila, por ello podemos 
                    //acceder a todos los valores que vengan en el objeto
                    function (data, type, row) {
                        return '<div class="row justify-content-center">' +
                            '<button type="button" onclick="editar(' + data.IdLibro + ')" class="btn btn-primary">Editar</button>' +
                            '<button type="button" onclick="eliminar(' + data.IdLibro + ', \'' + data.Nombre + '\')" class="btn btn-danger">Eliminar</button>' +
                            '</div>';
                    }
            }
        ]/*,*/
        //Cuando queremos hacer alguna adecuación del aspecto de la fila, por ejemplo, colorear una celda o 
        //toda la fila de acuerdo al valor de algún atributo
        //"fnRowCallback": function (row, data, displayIndex) {
        //sentencias de revisión de datos y adecuaciones de aspecto
        //},
        //"fnInitComplete": function (oSettings, json) {
        //    /*Configuración de los filtros individuales*/
        //    var fila = $(this).children("thead").children("tr").clone();
        //    var pie = $("<tfoot/>").append(fila).css("display", "table-header-group");
        //    $(this).children("thead").after(pie);
        //    $(fila).children().each(function () {
        //        $(this).prop("class", null);
        //    });

        //    $(fila).children("th").each(function () {
        //        var title = $(this).text();
        //        $(this).html('<input type="text" class="filtro form-control input-sm"' +
        //            ' style = "width:90%;" placeholder = "Buscar ' + title + '" /> ');
        //    });
        //    //Quitar filtro en la ultima columna (la de operaciones)
        //    $(fila).children("th:last").html('');
        //    //Activa el filtrado
        //    var tabla = this;
        //    tabla.api().columns().eq(0).each(function (colIdx) {
        //        $('#tblGestionTitulos tfoot th:eq(' + colIdx + ') input').on('keyup change', function () {
        //            tabla.api().column(colIdx).search(this.value).draw();
        //        });
        //        $('input', tabla.api().column(colIdx).footer()).on('click', function (e) {
        //            e.stopPropagation();
        //        });
        //    });
        //}
    });
}


function editar(id) {
    limpiar();
    $("#contenidoVista").load("FrmGestionTitulosCRUD.aspx", { "inpIdLibro": id });
}


//Funcion ubicada en el boton de la tabla
function eliminar(id, mun) {
    //Input
    $("#inpIdLibro").val(id);
    //Span
    $("#spnLibro").text(mun);
    //Modal ubicaco en FrmGestionTitulos
    $("#mdlConfirmar").modal();
}


function cofirmEliminar() {
    $("#mdlConfirmar").modal('hide');
    let id = $("#inpIdLibro").val();
    Bookstarzz.ws.WSLibros.deleteLibro(id, function (result) {
        if (result) {

            recargarDatos();
            //$("#cntMsgExito").parent().show();
            //window.setTimeout(function () {
            //    $("#cntMsgExito").parent().alert('close');
            //}, 10000);

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


function recargarDatos() {
    tablaLibrosDT.fnClearTable();
    Bookstarzz.ws.WSLibros.getAll(function (result) {
        if (result) {
            let objJSON = JSON.parse(result);
            
            tablaLibrosDT.fnAddData(normalizar(objJSON));
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


//Esto comentado es sin AJAX(metodos en webservices)
//function adecuarTabla() {
//    let tabla = $('#body_bloque_2_grdVistaTitulos');
//    //Obtengo la fila de los encabezados en el gridview colocó en el tbody (la primera)
//    let fila = $(tabla).find("tbody tr:first").clone();
//    //La elimino del tbody
//    $(tabla).find("tbody tr:first").remove();
//    //Creo un elemento thead y le añado la fila de encabezados
//    let encabezado = $("<thead/>").append(fila);
//    //Añado el thead a la tabla antes del tbody
//    $(tabla).children('tbody').before(encabezado);
//    //Activamos el plugin
//    $('#body_bloque_2_grdVistaTitulos').DataTable();
//}
