var tablaUsuarios;
$(document).ready(function () {
    debugger;
    //Reiniciamos los estilos para este Frm en especifico
    $("#divBloque2").removeClass("col-10");
    $("#divBloque1").removeClass("col-2 pr-0");

    $("#btnAgregar").click(function () {
        debugger;
        $("#contenidoVista").load("FrmRegistrar.aspx", { "session" : 1});
    });

    $("#btnConfirmarEliminar").click(cofirmEliminar);
    cargarMunicipios();
});

function cargarMunicipios() {
    debugger;

    Bookstarzz.ws.WSUsuarios.getAll(function (result) {
        if (result) {
            cargarDatos(JSON.parse(result));
        } else {
            window.location.replace("FrmLogin.aspx");
        }
    },
        function (error) {
            debugger;
            if (error._exceptionType == "System.Security.SecurityException") {
                //$("#cntMsg").text(error._message);
                //$("#cntMsg").parent().show();
                window.location.replace("FrmLogin.aspx");

            } else {

                $("#msgError").text(error._message);
                $("#mdlError").modal().show();
            }
        }
    );
}

function cargarDatos(datos) {
    //Almacenamos la referencia a la tabla con el plugin aplicado, ya que la usaremos para los filtros
    let tablaUsuarios = $('#tblUsuarios').dataTable({
        //Asignamos la colección de datos en JSON que se mostrarán en la tabla
        data: datos,
        //La tabla ajusta cada columna de acuerdo a los datos contenidos en ellas
        //pero podemos también asignar un ancho fijo de esta manera, targets representa los 
        //índices de las columnas a los que se les aplicará este tamaño

        columnDefs: [
            { width: "10%", targets: [0] },
            { width: "30%", targets: [1] },
            { width: "25%", targets: [2, 3, 4, 5, 6, 7, 8, 9] }
           
        ],
        columns: [

            //el valor colocado en title es el texto que aparecerá en la columna y el valor colocado en 
            //data deberá ser el nombre de la propiedad del pojo que recibirémos en la colección de datos
            { title: "IdUsuario", data: "IdUsuario" },
            { title: "Nombre", data: "Nombre" }, //Si quiere mostrarse el id se descomenta esta linea
            { title: "ApellidoP", data: "ApellidoP" },
            { title: "ApellidoM", data: "ApellidoM" },
            { title: "Email", data: "Email" }, //Si quiere mostrarse el id se descomenta esta linea
            { title: "Password", data: "Password" },
            { title: "Tipo", data: "Tipo" },
            { title: "Usuario", data: "UsuarioN" }, //Si quiere mostrarse el id se descomenta esta linea
            { title: "Telefono", data: "Telefono" },
            { title: "Targeta", data: "Targeta" },



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
                            '<button type="button" onclick="editar(' + data.IdUsuario + ')" class="btn btn-primary">Editar</button>' +
                            '<button type="button" onclick="eliminar(' + data.IdUsuario + ', \'' + data.Nombre + '\')" class="btn btn-danger">Eliminar</button>' +
                            '</div>';
                    }
            }
        ],
        //Cuando queremos hacer alguna adecuación del aspecto de la fila, por ejemplo, colorear una celda o 
        //toda la fila de acuerdo al valor de algún atributo
        //"fnRowCallback": function (row, data, displayIndex) {
        //sentencias de revisión de datos y adecuaciones de aspecto
        //},
    });  
   
}

function editar(id) {
    debugger;
    $("#contenidoVista").load("FrmRegistrar.aspx", { "editar": 1 });
}

function eliminar(id, nom) {
    debugger;
    
    $("#IdUsuario").val(id);
    $("#nombre").text(nom);
    $("#mdlConfirmar").modal();
}

// toma el id y borra el elemento seleccionado
function cofirmEliminar() {
    debugger;
    $("#mdlConfirmar").modal('hide');
    let id = $("#IdUsuario").val();
    Bookstarzz.ws.WSUsuarios.delete(id, function (result) {

        if (result) {

            recargarDatos();
            $("#cntMsgExito").parent().show();
            window.setTimeout(function () {
                $("#cntMsgExito").parent().alert('close');
            }, 10000);

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

//recarga los usuarios de la base de datos en la tabla
function recargarDatos() {

     tablaUsuarios.fnClearTable();
    Bookstarzz.ws.WSUsuarios.WSUsuarios.getAll(function (result) {
        if (result) {
            tablaUsuarios.fnAddData(JSON.parse(result));
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