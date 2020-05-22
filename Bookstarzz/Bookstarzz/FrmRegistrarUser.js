
function btnCancelar() {

    window.location = "FrmLogin.aspx";

    debugger;
}

function btnAceptar() {
    console.log("entra");
    debugger;
    Bookstartzz.WS.WSUsuarios.insert(function (result) {
        debugger;
        if (result.equals("agregado")) {
            $('#mdlConfirmar').modal('show');
            alert("seagrego chido");
        } else if (result.equals("objetoNoValido")){
            $('#mdlConfirmar').modal('show');
            alert("no valido");
        } else if (result.equals("existente")) {
            alert("existente");
        }
    },
        function (error) {
            console.log(error);
        }

    );
    
}



