function desaparecer() {
    $(".nuevo_btn").addClass("d-none");
    $(".consulta").html("");
    $(".formulario").html("");
}

function nuevo_btn_m() {
    desaparecer();
        var  dominio=localStorage.getItem("dominio")
    $.ajax({
        type: "POST",
        url: dominio+"sistema/enfermero/estructura/formulario.php",
        data: "",
        success: function (response) {
            $(".formulario").html(response);id_especialidad()
        }
    });
}
  

function id_especialidad(){
    var  dominio=localStorage.getItem("dominio")
    $.ajax({
        type: "POST",
        url: dominio+"sistema/enfermero/estructura/id_especialidad.php",
        data: "",
        success: function (response) {
            $("#id_especialidad").html(response);
        }
    });
}

function almacenar() {
    var  titulo=localStorage.getItem("titulo");
    var  dominio=localStorage.getItem("dominio")
    var cedula_medico=$("#cedula_medico").val();
    if (cedula_medico==="") {alert_bonita("error",titulo,"Ingrese cedula Dr");return;}
    var nombre_medico= $("#nombre_medico").val();
    if (nombre_medico==="") {alert_bonita("error",titulo,"Ingrese nombre Dr");return;}
    var telefono_medico= $("#telefono_medico").val();
    if (telefono_medico==="") {alert_bonita("error",titulo,"Ingrese telefono Dr");return;}
    var sexo_medico=  $("#sexo_medico").val();
    if (sexo_medico==="0") {alert_bonita("error",titulo,"Seleccione el sexo Dr");return;}
    var id_especialidad=  $("#id_especialidad").val();
    if (id_especialidad==="0") {alert_bonita("error",titulo,"Seleccione la especialidad Dr");return;}
    var usuario_usuario=  $("#usuario_usuario").val();
    if (usuario_usuario==="") {alert_bonita("error",titulo,"Ingrese usuario Dr");return;}
    var contrase=  $("#contrase").val();
    if (contrase==="") {alert_bonita("error",titulo,"Ingrese contraseña Dr");return;}
    var variable={cedula_medico,nombre_medico,telefono_medico,sexo_medico,id_especialidad,usuario_usuario,contrase};
    $.ajax({
        type: "POST",
        url: dominio+"sistema/enfermero/php/almacenar.php",
        data: variable,
        success: function (response) {
            tabla_paciente()

        }
    });
}