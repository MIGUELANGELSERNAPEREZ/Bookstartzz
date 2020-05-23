$(document).ready(function () {
   
    $("#BtnCancelar").click(function () {
        window.location = "FrmLogin.aspx";
    });

    $("#BtnAgregar").click(function () {
        $("#FormMenu").data('bootstrapValidator').validate();

        if ($("#frmMunicipio").data('bootstrapValidator').isValid()) {
            if (parseInt($("#txtIdUsuario").val()) > 0) {
                Bookstartzz.WS.WSUsuarios.update(modificar(), function (result) {
                    if (result == true) {
                        $("#divContenido").load("sireti/gestion_municipios/FrmListaMunicipiosAjax.aspx");
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
                Bookstartzz.WS.WSUsuarios.insert(agregar(), function (result) {
                    if (parseInt(result) > 0) {
                        $("#divContenido").load("sireti/gestion_municipios/FrmListaMunicipiosAjax.aspx");
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
            }
        }
    }); //Aqui termina el click


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
                        message: 'El municipio debe de tener minimo 5 cracteres y maximo 30'
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
                        message: 'El apellido paterno debe de tener minimo 5 cracteres y maximo 30'
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
                        message: 'El apellido materno debe de tener minimo 5 cracteres y maximo 30'
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
                        max: 30,
                        message: 'El email materno debe de tener minimo 10 cracteres y maximo 40'
                    }
                }
            }
        }
    });



    
});


function agregar() {
     public int IdUsuario { get; set; }
        public String Nombre { get; set; }
        public string ApellidoP { get; set; }
        public string ApellidoM { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Tipo { get; set; }
        public string UsuarioN { get; set; }
        public string Telefono { get; set; }
        public string Targeta { get; set; }
    let obj = {};
    obj.Nombre = $("#txtNombre").val().trim();
    obj.ApellidoP = $("#txtApellidoP").val().trim();
    obj.ApellidoM = $("#txtApellidoM").val().trim();
    obj.UsuarioN = $("#txtUsuario").val().trim();
    obj.Email = $("#txtEmail").val().trim();
    obj.Password = $("#txtPassword").val().trim();
    obj.Tipo = $("#txtTipo").val().trim();
    obj.Telefono = $("#txtTel").val().trim();

    return JSON.stringify(obj);
}

function modificar() {
    let obj = {};
    obj.IdMunicipio = $("#txtIdMunicipio").val();
    obj.Nombre = $("#txtMunicipio").val().trim();
    obj.IdEstado = $("#ddlEstado").val();
    return JSON.stringify(obj);
}
