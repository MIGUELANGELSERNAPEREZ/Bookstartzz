$(document).ready(function () {
   
    $("#BtnCancelar").click(function () {
        window.location = "FrmLogin.aspx";
    });

    $("#BtnAgregar").click(function () {
        $("#FormMenu").data('bootstrapValidator').validate();

        if ($("#FormMenu").data('bootstrapValidator').isValid()) {
            if (parseInt($("#txtIdUsuario").val()) > 0) {
                Bookstarzz.ws.WSUsuarios.update(modificar(), function (result) {
                    if (result == true) {
                        $("#mdlModificar").modal("show");
                    } else {
                        $("#cntMsg").text("Error: no se ha podido realizar la operación");
                        $("#cntMsg").parent().show();
                    }
                },
                    function (error) {
                        $("#cntMsg").text("Error: no se ha podido realizar la operación");
                        $("#cntMsg").parent().show();
                    }
                );
            } else {
                Bookstarzz.ws.WSUsuarios.insert(agregar(), function (result) {
                    debugger;
                    if (parseInt(result) > 0) {
                        limpiar();
                        $('#mdlConfirmar').modal('show')
                    } else {
                        let message = "";
                        let arreglo = JSON.parse(result);
                        if (arreglo.UsuarioN != "") {
                            message += "El campo Usuario agregado no esta disponible";
                        }

                        if (arreglo.Email != "") {
                            message += ", El campo email agregado no esta disponible";
                        }

                        if (arreglo.Telefono != "") {
                            message += ", El campo telefono agregado no esta disponible";
                        }
                        $("#cntMsg").text(message);
                        $("#cntMsg").parent().show();
                    }
                },
                    function (error) {    
                            $("#cntMsg").text("Error: no se ha podido realizar la operación");
                            $("#cntMsg").parent().show();
                        
                       
                    }
                );
            }
        }
    }); //Aqui termina el click
// validaciones en el formulario con bootstrapValidator
    $('#FormMenu').bootstrapValidator({
        framework: 'bootstrap',
        excluded: [':disabled', ':hidden'],
        fields: {
            txtNombre: {
                validators: {
                    notEmpty: {
                        message: 'El Nombre no debe de estar vasio'
                    },
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El municipio debe de tener minimo 5 caracteres y maximo 30'
                    }
                }
            },
            txtApellidoP: {
                validators: {
                    notEmpty: {
                        message: 'El apellido paterno se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El apellido paterno debe de tener minimo 5 caracteres y maximo 30'
                    }
                }
            },

            txtApellidoM: {
                validators: {
                    notEmpty: {
                        message: 'El apellido materno se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El apellido materno debe de tener minimo 5 cacteres y maximo 30'
                    }
                }
            },

            txtEmail: {
                validators: {
                    notEmpty: {
                        message: 'El email se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 10,
                        max: 40,
                        message: 'El email debe de tener minimo 10 cacteres y maximo 40'
                    }
                }
            },

            txtPass: {
                validators: {
                    notEmpty: {
                        message: 'La contraseña se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 8,
                        max: 8,
                        message: 'La contraseña debe de tener 10 cacteres'
                    }
                }
            },

            txtConfirmar: {
                validators: {
                    notEmpty: {
                        message: 'La confirmacion se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 8,
                        max: 8,
                        message: 'La confirmacion debe de tener 8 caracteres'
                    }
                }
            },
            txtUsuario: {
                validators: {
                    notEmpty: {
                        message: 'El usuario se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 5,
                        max: 20,
                        message: 'El usuario debe de tener minimo 5 caracteres y maximo 20'
                    }
                }
            },

            txtTelefono: {
                validators: {
                    notEmpty: {
                        message: 'El telefono se requiere. no puede estar vasio'
                    },
                    stringLength: {
                        min: 10,
                        max: 10,
                        message: 'El telefono debe de tener 10 caracteres'
                    }
                }
            }
        }
    });   
});

function agregar() {
    debugger;
    let obj = {};
    obj.Nombre = $("#txtNombre").val().trim();
    obj.ApellidoP = $("#txtApellidoP").val().trim();
    obj.ApellidoM = $("#txtApellidoM").val().trim();
    obj.UsuarioN = $("#txtUsuario").val().trim();
    obj.Email = $("#txtEmail").val().trim();
    obj.Password = $("#txtPass").val().trim();
    obj.Tipo = 1;
    obj.Telefono = $("#txtTel").val().trim();

    return JSON.stringify(obj);
}

function modificar(result) {

    let obj = JSON.parse(result);

    $("#txtNombre").val(obj.Nombre);
    $("#txtApellidoP").val(obj.ApellidoP);
    $("#txtApellidoM").val(obj.ApellidoM);
    $("#txtUsuario").val(obj.UsuarioN);
    $("#txtEmail").val(obj.Email);
    $("#txtPass").val(obj.Password);
    $("#txtConfirmar").val(obj.Password);
    $("#txtTel").val(obj.Telefono);

    return JSON.stringify(obj);
}

function limpiar () {
    $("#txtNombre").val("");
    $("#txtApellidoP").val("");
    $("#txtApellidoM").val("");
    $("#txtUsuario").val("");
    $("#txtEmail").val("");
    $("#txtPass").val("");
    $("#txtConfirmar").val("");
    $("#txtTel").val("");
}