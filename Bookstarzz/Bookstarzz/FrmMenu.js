$(document).ready(function () {
    cargarCaruserl();   
});

function cargarCaruserl() {
    FrontEnd.ws.WSLibros.getPopulares(function (result) {
        if (result) {
            cargarDatos(JSON.parse(result));
            console.log(result);
        } else {
            window.location.replace("FrmLogin.aspx");
        }
    },
        function (error) {
            $("#cntMsg").text("Error: no se ha podido realizar la operación");
            $("#cntMsg").parent().show();
        }
    );
}

function cargarDatos(datos) {
    //Almacenamos la referencia a la tabla con el plugin aplicado, ya que la usaremos para los filtros
    tablaMunicipios = $('#tblMunicipios').dataTable({
        //Asignamos la colección de datos en JSON que se mostrarán en la tabla
        data: datos,
        //La tabla ajusta cada columna de acuerdo a los datos contenidos en ellas
        //pero podemos también asignar un ancho fijo de esta manera, targets representa los 
        //índices de las columnas a los que se les aplicará este tamaño
        columnDefs: [
            { width: "15%", targets: [0] },
            { width: "25%", targets: [1] },
            { width: "20%", targets: [2, 3] }
        ],
        columns: [
            //el valor colocado en title es el texto que aparecerá en la columna y el valor colocado en 
            //data deberá ser el nombre de la propiedad del pojo que recibirémos en la colección de datos
            { title: "Clave Municipio", data: "IdMunicipio" }, //Si quiere mostrarse el id se descomenta esta linea
            { title: "Municipio", data: "Nombre" },
            { title: "Estado", data: "Estado" },
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
                            '<button type="button" onclick="editar(' + data.IdMunicipio + ')" class="btn btn-primary">Editar</button>' +
                            '<button type="button" onclick="eliminar(' + data.IdMunicipio + ', \'' + data.Nombre + '\')" class="btn btn-danger">Eliminar</button>' +
                            '</div>';
                    }
            }
        ],
        //Cuando queremos hacer alguna adecuación del aspecto de la fila, por ejemplo, colorear una celda o 
        //toda la fila de acuerdo al valor de algún atributo
        //"fnRowCallback": function (row, data, displayIndex) {
        //sentencias de revisión de datos y adecuaciones de aspecto
        //},
        "fnInitComplete": function (oSettings, json) {
            /*Configuración de los filtros individuales*/
            var fila = $(this).children("thead").children("tr").clone();
            var pie = $("<tfoot/>").append(fila).css("display", "table-header-group");
            $(this).children("thead").after(pie);
            $(fila).children().each(function () {
                $(this).prop("class", null);
            });

            $(fila).children("th").each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" class="filtro form-control input-sm"' +
                    ' style = "width:90%;" placeholder = "Buscar ' + title + '" /> ');
            });
            //Quitar filtro en la ultima columna (la de operaciones)
            $(fila).children("th:last").html('');
            //Activa el filtrado
            var tabla = this;
            tabla.api().columns().eq(0).each(function (colIdx) {
                $('#tblMunicipios tfoot th:eq(' + colIdx + ') input').on('keyup change', function () {
                    tabla.api().column(colIdx).search(this.value).draw();
                });
                $('input', tabla.api().column(colIdx).footer()).on('click', function (e) {
                    e.stopPropagation();
                });
            });
        }
    });
}