function btnBuscar() {
    debugger;
    let nombre = $("#paginaMaestra").val();
    $("#contenidoVista").load("FrmLibro.aspx", { "nameBook": nombre });
}