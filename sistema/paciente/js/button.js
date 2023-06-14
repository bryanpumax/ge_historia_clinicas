function desaparecer() {
    $(".nuevo_btn").addClass("d-none");
    $(".consulta").html("");
    $(".formulario").html("");
}

function nuevo_btn() {
    desaparecer();
        var  dominio=localStorage.getItem("dominio")
    $.ajax({
        type: "POST",
        url: dominio+"sistema/paciente/estructura/formulario.php",
        data: "",
        success: function (response) {
            $(".formulario").html(response);
        }
    });
}
function presentar(pagina) {
    var  titulo=localStorage.getItem("titulo");
var cedula_paciente=$("#cedula_paciente").val();
if (cedula_paciente==="") {
    alert_bonita("error",titulo,"Ingrese cedula paciente");
    sig_paciente()
    return;
}
$(".contador_pagina").html(pagina);
let  navlink=$(".nav-link").toArray().length;
for (let index = 1; index <=navlink; index++) {
    $("#item-"+index).addClass("d-none")
    $(".navlink_t"+index).removeClass("active")
    
    
}
$("#item-"+pagina).removeClass("d-none")    
$(".navlink_t"+pagina).addClass("active")

}
function sig_paciente() {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/almacenar_paciente.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();
    var nombre_paciente=$("#nombre_paciente").val();
    var sexo_paciente=$("#sexo_paciente").val();
    var fecha_nacimiento=$("#fecha_nacimiento").val();
    var estado_civil=$("#estado_civil").val(); 
    var telefono_paciente=$("#telefono_paciente").val();
    var tipo_sangre=$("#tipo_sangre").val();
    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente");return;
    }
    if (nombre_paciente==="") {
        alert_bonita("error",titulo,"Ingrese nombre paciente"); return;
    }
    if (sexo_paciente==="0") {
        alert_bonita("error",titulo,"Ingrese sexo paciente"); return;
    }
    if (fecha_nacimiento==="") {
        alert_bonita("error",titulo,"Ingrese fecha de nacimiento paciente");return;
    }
    if (estado_civil==="0") {
        alert_bonita("error",titulo,"Elija el estado civil paciente"); return;
    }
    if (tipo_sangre==="0") {
        alert_bonita("error",titulo,"Elija el tipo de sangre paciente"); return;
    }
    
    var data="cedula_paciente="+cedula_paciente+"&nombre_paciente="+nombre_paciente+"&sexo_paciente="+sexo_paciente+"&fecha_nacimiento="+fecha_nacimiento+"&estado_civil="+estado_civil+"&telefono_paciente="+telefono_paciente+"&tipo_sangre="+tipo_sangre
    $.ajax({
        type: "POST",
        url: dominio,
        data: data, 
        success: function (response) {
            //notificacion(response)

        }
    });
   presentar(2)
   tabla_alergia_paciente()
$(".api_consulta").addClass("d-none");
tabla_contacto();
tabla_antecedentes_familiar();
$(".dato_paciente").html(nombre_paciente);
}

function tabla_alergia_paciente() {
    $(".tabla_alergia").html(""); 
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/estructura/alergias_paciente.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();
    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente");return;
    } 
    $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente="+cedula_paciente, 
        success: function (response) {
            $(".tabla_alergia").html(response); 

            $(".table_alergia").DataTable({
                "language": {
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "zeroRecords": "No se encontraron resultados en su busqueda",  
                    "searchPlaceholder": "Buscar registros",    
                    "info": "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
                    "infoEmpty": "No existen registros",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sSearch": "Buscar:",
                    "oPaginate": {  
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                },
                "aria": {
                    "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                },
                "select": {
                    "rows": {
                        "_": "Ha seleccionado %d filas",
                        "0": "No hay filas seleccionadas",
                        "1": "Ha seleccionado 1 fila"
                        
                }
                }
            
            },
            "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],  
            "pageLength": 5,
            "bProcessing": true
            
            }
            )

        }
    });   
  }
function almacenar_alergia() {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/almacenar_alergias.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();

    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente"); presentar(1);return;
    }
    var gravedad=$("#gravedad").val()
    var alergias=$("#alergias").val()
    var variable="cedula_paciente="+cedula_paciente+"&gravedad="+gravedad+"&alergias="+alergias
   
    $.ajax({
        type: "POST",
        url: dominio,
        data: variable, 
        success: function (response) {
             //notificacion(response)
            tabla_alergia_paciente()
             $("#gravedad").val("")
    $("#alergias").val("")
        }
    });
}
function eliminar_alergia(id_alergias) {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/eliminar_alergia.php";
    var  titulo=localStorage.getItem("titulo");
$.ajax({
    type: "POST",
    url: dominio,
    data: "id_alergias="+id_alergias, 
    success: function (response) {
          //notificacion(response)
          tabla_alergia_paciente()
    }
});
  }
  function sig_alergias() {
    presentar(3);
   
    }
function tabla_antecedentes_familiar() {
    $(".tabla_antecedentes_familiar").html("");
    $("#tipo_enfermedad").val("")
    $("#fecha_dianostico").val("")
    $("#tratamiento_recibido").val("");
    $("#estado_actual").val("");
    $("#parentesco_familiar").val("");
    $("#nombre_familiar").val("");
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/estructura/tabla_antecedentes_familiar.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();
    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente");
        presentar(1);
        return;
    } 
    $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente="+cedula_paciente, 
        success: function (response) {
            $(".tabla_antecedentes_familiar").html(response); 

            $(".table_antecedentes_paciente").DataTable({
                "language": {
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "zeroRecords": "No se encontraron resultados en su busqueda",  
                    "searchPlaceholder": "Buscar registros",    
                    "info": "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
                    "infoEmpty": "No existen registros",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sSearch": "Buscar:",
                    "oPaginate": {  
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                },
                "aria": {
                    "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                },
                "select": {
                    "rows": {
                        "_": "Ha seleccionado %d filas",
                        "0": "No hay filas seleccionadas",
                        "1": "Ha seleccionado 1 fila"
                        
                }
                }
            
            },
            "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],  
            "pageLength": 5,
            "bProcessing": true
            
            }
            )

        }
    });  



  }
  function almacenar_antecedentes_paciente(){
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/almacenar_antecedentes_paciente.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();
    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente"); presentar(1);return;
    }
    var tipo_enfermedad=$("#tipo_enfermedad").val()
    var fecha_dianostico=$("#fecha_dianostico").val()
    var tratamiento_recibido=$("#tratamiento_recibido").val();
    var estado_actual=$("#estado_actual").val();
    var parentesco_familiar=$("#parentesco_familiar").val();
    var nombre_familiar=$("#nombre_familiar").val();
    if (nombre_familiar=="") {
        nombre_familiar= parentesco_familiar
    }
    var antecedentes_enf_familia=tipo_enfermedad
    var variable="cedula_paciente="+cedula_paciente+"&tipo_enfermedad="+tipo_enfermedad+"&fecha_dianostico="+fecha_dianostico+"&tratamiento_recibido="+tratamiento_recibido+"&estado_actual="+estado_actual+"&parentesco_familiar="+parentesco_familiar+"&nombre_familiar="+nombre_familiar+"&antecedentes_enf_familia="+antecedentes_enf_familia
   
    $.ajax({
        type: "POST",
        url: dominio,
        data: variable, 
        success: function (response) {
             //notificacion(response)
            tabla_antecedentes_familiar()
            
        }
    });
  }
function sig_antecedentes() {
    especialidad()
    presentar(4)

}
function especialidad() {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/";
    doctor_estado()
    nivel_atencion()
$.ajax({
    type: "POST",
    url: dominio+"estructura/select_especialidad.php",
    data: "", 
    success: function (response) {
        $("#id_especialidad").html(response);
    }
});

  }
  function buscar_doctor_especialidad() { 
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/";
    var cedula_paciente=$("#cedula_paciente").val();
    $(".estado_doctor").html("")
    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente"); presentar(1);return;
    }
    var  variable="id_especialidad="+$("#id_especialidad").val();
    $.ajax({
        type: "POST",
        url: dominio+"estructura/select_doctor.php",
        data: variable, 
        success: function (response) {
            $("#cedula_medico").html(response);
        }
    });
   }
   function doctor_estado() {
$(".estado_doctor").html("")

var  dominio=localStorage.getItem("dominio")+"sistema/paciente/";
var  variable="cedula_medico="+$("#cedula_medico").val();
$.ajax({
    type: "POST",
    url: dominio+"estructura/estado_doctor.php",
    data: variable, 
    dataType: "json",
    success: function (response) {
        var responses=response[0] 
        $(".estado_doctor").html(responses.estado)
        $("#id_usuario").val(responses.id_usuario);

    }
});
     }
  
   function cambio_rapido(){
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/js/";
    var fechas = new Date();
    var fecha_actual = (fechas.getFullYear().valueOf() + (fechas.getMonth() + 1).valueOf() + fechas.getDate().valueOf())*fechas.getMinutes();
    
    $(".jsbutton_p").attr("src", dominio+"button.js?v="+fecha_actual);
    $(".jsevento_p").attr("src", dominio+"evento.js?v="+fecha_actual);
   }

   function sig_medico() {
    var cedula_paciente=$("#cedula_paciente").val();
    let id_especialidad=$("#id_especialidad").val();
    let cedula_medico=$("#cedula_medico").val();
    let id_tipo=$("#id_tipo").val();
    //
    var  titulo=localStorage.getItem("titulo");
     if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente"); presentar(1);return;
    }
    if (id_especialidad==="x") {
        $(".antecedentes").click( );   
      return;
    
    }
if (id_especialidad==="0") {
    alert_bonita("error",titulo,"Elige especialidad"); return;

}
if (cedula_medico==="0") {
    alert_bonita("error",titulo,"Elige Medico"); return; 
}
if (id_tipo==="0") {
    alert_bonita("error",titulo,"Elige nivel de atencion que se  encuentra el paciente"); return; 
}
presentar(5)
datos_doctor()
   }
   function datos_doctor() {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/";
var  variable="cedula_medico="+$("#cedula_medico").val();

$.ajax({
    type: "POST",
    url: dominio+"estructura/datos_doctor.php",
    data: variable, 
    success: function (response) {
        $(".datos_doctor").html(response+" prioridad "+ $('select[name="id_tipo"] option:selected').text())
    }
});
   
   }
function nivel_atencion() {
    $(".nivel_atencion").html("");
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/";
    doctor_estado()
$.ajax({
    type: "POST",
    url: dominio+"estructura/select_tipo_atencion.php",
    data: "", 
    success: function (response) {
        $(".nivel_atencion").html(response);
    }
});
}
function almacenar_contacto() {
    
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/almacenar_contacto.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_contacto = $("#cedula_contacto").val();
    var nombre_contacto = $("#nombre_contacto").val();
    var telefono_contacto = $("#telefono_contacto").val();
    var parentesco_contacto = $("#parentesco_contacto").val();
    var cedula_paciente=$("#cedula_paciente").val();
    if (cedula_contacto=="") {
        alert_bonita("error",titulo,"Ingrese cedula ");return;
    }
    if (nombre_contacto=="") {
        alert_bonita("error",titulo,"Ingrese nombre ");return;
    }
    if (parentesco_contacto=="") {
        alert_bonita("error",titulo,"Seleccione el parentesco ");return;
    }
    var variable="cedula_contacto="+cedula_contacto+"&nombre_contacto="+nombre_contacto+"&telefono_contacto="+telefono_contacto+"&parentesco_contacto="+parentesco_contacto+"&cedula_paciente="+cedula_paciente;
    $.ajax({
        type: "POST",
        url: dominio,
        data: variable, 
        success: function (response) {
            $(".contacto").val("");
            tabla_contacto(); 

        }
    });
}

function eliminar_contacto(param) {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/eliminar_contacto.php";
    var  titulo=localStorage.getItem("titulo");
$.ajax({
    type: "POST",
    url: dominio,
    data: "id_contacto="+param, 
    success: function (response) {
          //notificacion(response)
          tabla_contacto()
    }
});
  }
function tabla_contacto(){ 
    $(".tabla_contacto").html(""); 
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/estructura/tabla_contacto.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();
    if (cedula_paciente==="") {
        alert_bonita("error",titulo,"Ingrese cedula paciente");
        presentar(1);
        return;
    } 
    $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente="+cedula_paciente, 
        success: function (response) {
            $(".tabla_contacto").html(response); 

            $(".table_contactos").DataTable({
                "language": {
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "zeroRecords": "No se encontraron resultados en su busqueda",  
                    "searchPlaceholder": "Buscar registros",    
                    "info": "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
                    "infoEmpty": "No existen registros",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sSearch": "Buscar:",
                    "oPaginate": {  
                        "first": "Primero",
                        "": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                },
                "aria": {
                    "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                },
                "select": {
                    "rows": {
                        "_": "Ha seleccionado %d filas",
                        "0": "No hay filas seleccionadas",
                        "1": "Ha seleccionado 1 fila"
                        
                }
                }
            
            },
            "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],  
            "pageLength": 5,
            "bProcessing": true
            
            }
            );

        }
    });  
}

function save_all(){    
    var  dominio1=localStorage.getItem("dominio")+"sistema/paciente/php/almacenar_atencion.php";
    var  dominio2=localStorage.getItem("dominio")+"sistema/paciente/php/signos_vitales.php";
    var  titulo=localStorage.getItem("titulo");
    var cedula_paciente=$("#cedula_paciente").val();
   var id_usuario= $("#id_usuario").val();
    let cedula_medico=$("#cedula_medico").val();
    let id_tipo=$("#id_tipo").val();
    //
    var variable="cedula_paciente="+cedula_paciente+"&id_usuario="+id_usuario+"&cedula_medico="+cedula_medico+"&id_tipo="+id_tipo
    var pulso=$("#pulso").val();
    var presion= $("#presion").val();
     let respiracion=$("#respiracion").val();
     let temperatura=$("#temperatura").val();
var variable2="pulso="+pulso+"&presion="+presion+"&respiracion="+respiracion+"&temperatura="+temperatura


    $.ajax({
        type: "POST",
        url: dominio1,
        data: variable,
        success: function (response) {
         variable2+="&id_atencion="+response   
         $.ajax({
            type: "POST",
            url: dominio2,
            data: variable2,
            success: function (response) {
               
            }
        });
        }
    });
 


    tabla_paciente()

}
function eliminar_antecedentes(id_alergias) {
    var  dominio=localStorage.getItem("dominio")+"sistema/paciente/php/eliminar_antecedentes.php";
    var  titulo=localStorage.getItem("titulo");
$.ajax({
    type: "POST",
    url: dominio,
    data: "id_antecedentes="+id_alergias, 
    success: function (response) {
          //notificacion(response)
          tabla_antecedentes_familiar()
    }
});
  }