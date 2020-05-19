$(document).ready(function () {
    //Cargo el metodo para adecuar la tabla antes de lanzar el plugin Datatables
    adecuarTabla();
});

function adecuarTabla() {
    let tabla = $('#body_bloque_2_grdVistaTitulos');
    //Obtengo la fila de los encabezados en el gridview colocó en el tbody (la primera)
    let fila = $(tabla).find("tbody tr:first").clone();
    //La elimino del tbody
    $(tabla).find("tbody tr:first").remove();
    //Creo un elemento thead y le añado la fila de encabezados
    let encabezado = $("<thead/>").append(fila);
    //Añado el thead a la tabla antes del tbody
    $(tabla).children('tbody').before(encabezado);
    //Activamos el plugin
    $('#body_bloque_2_grdVistaTitulos').DataTable();
}