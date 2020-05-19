$(document).ready(function () {
    $("#body_txtCalendario").on("click", function () {
        $("#body_txtCalendario").datepicker({
            format: "yyyy-mm-dd",
            language: "es",
            autoclose: true,
            todayHighlight: true
        });
    });
});