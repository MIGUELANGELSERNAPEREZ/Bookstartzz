$(document).ready(function () {
    $("#btnIniciarSesion").click(function () {
        $("#form1").data('bootstrapValidator').validate();

        if ($("#form1").data('bootstrapValidator').isValid()) {
            alert('valido');
        } else {
            alert('con errores');
        }
    }); //Aqui termina el click

    $('#form1').bootstrapValidator({
        framework: 'bootstrap',
        excluded: [':disabled', ':hidden'],
        fields: {
            txtEmail: {
                validators: {
                    notEmpty: { message: 'El usuario es obligatorio' },
                    emailAddress: {
                        message: 'No tiene un formato de correo válido'
                    }
                }
            },
            txtPassword: {
                validators: {
                    notEmpty: { message: 'La contraseña es obligatoria' },
                    regexp: {
                        regexp: /^[\w]{8,8}$/i,
                        message: 'Solo deben ser valores alfanuméricos 8 caracteres'
                    }
                }
            }
        }
    });


});
