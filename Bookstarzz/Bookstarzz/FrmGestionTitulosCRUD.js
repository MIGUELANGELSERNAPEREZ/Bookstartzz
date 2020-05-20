$(document).ready(function () {
    dateP();
});

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