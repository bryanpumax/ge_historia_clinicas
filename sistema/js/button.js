 

 
function presentar(pagina) {
    var  titulo=localStorage.getItem("titulo");
 if (pagina>="1") {
    generar_tbl_medicamento()
    mostrar_tbl_tratamiento()
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
 

function tabla_alergia_paciente(cedula_paciente) {
    $(".consulta").html(""); 
    var  dominio=localStorage.getItem("dominio")+"sistema/quirofano/estructura/alergias_paciente.php";
    var  titulo=localStorage.getItem("titulo"); 
    $(".titulo").html("Quirofano-Alergia de paciente seleccionado"); 
    $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente="+cedula_paciente, 
        success: function (response) {
            $(".consulta").html(response); 

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
  
function tabla_antecedentes_familiarC(cedula_paciente) { 
    var  dominio=localStorage.getItem("dominio")+"sistema/quirofano/estructura/tabla_antecedentes_familiar.php";
    var  titulo=localStorage.getItem("titulo");
    $(".titulo").html("Quirofano-Antecedentes de paciente seleccionado"); 
    $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente="+cedula_paciente, 
        success: function (response) {
            $(".consulta").html(response); 

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
  
  function desaparecer() { 
    $(".consulta").html("");
    $(".formulario").html("");
}

function formulario_medico(id_atencion) {
    desaparecer();
        var  dominio=localStorage.getItem("dominio")

    $.ajax({
        type: "POST",
        url: dominio+"sistema/quirofano/estructura/formulario.php",
        data: "id_atencion="+id_atencion,
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



function generar_tbl_medicamento() {
    var dominio = localStorage.getItem("dominio") + "sistema/quirofano/estructura/generar_tbl_medicamento.php";
    var titulo = localStorage.getItem("titulo");
    select_Prueba_medica()
    $(".id_medicamento").attr("checked", false)
    var variable;
    $.ajax({
      type: "POST",
      url: dominio,
      data: variable,
      success: function(response) {
        $(".generar_tbl_medicamento").html(response);
        formato_dt_table("tbl_medicamento","2,4")
 
      }
    });

  }

  function medicamento_seleccionado(id_medicamento, codigo, descripcion, forma) {

    var checkBox = document.getElementById("id_medicamento" + id_medicamento);
    let input_id_medicamento = $("#id_medicamento_input").val();
    let input_descripcion = $("#descripcion_medicamento_input").val();
    let input_forma = $("#forma_medicamento_input").val();
    let input_codigo = $("#codigo_medicamento_input").val();
    let array_id_medicamento = [];
    let array_codigo = [];
    let array_descripcion = [];
    let array_forma = [];
    let text_codigo = "";
    let text_descripcion = "";
    let text_forma = "";
    let text_id_medicamento = "";
    if (checkBox.checked == true) {
      array_id_medicamento.push(id_medicamento)
      array_id_medicamento.push(input_id_medicamento)
      array_codigo.push(codigo)
      array_codigo.push(input_codigo)
      array_descripcion.push(descripcion)
      array_descripcion.push(input_descripcion)
      array_forma.push(forma)
      array_forma.push(input_forma)
      text_codigo = array_codigo;
      text_descripcion = array_descripcion;
      text_forma = array_forma;
      text_id_medicamento = array_id_medicamento;
    } else {
      text_codigo = input_codigo.replace(codigo + ",", "")
      text_descripcion = input_descripcion.replace(descripcion + ",", "")
      text_forma = input_forma.replace(forma + ",", "")
      text_id_medicamento = input_id_medicamento.replace(id_medicamento + ",", "")
    }

    $("#descripcion_medicamento_input").val(text_descripcion);
    let text_id_medicamento2 = text_id_medicamento.toString().replace(",x", "")
    let text_id_medicamento3 = text_id_medicamento2.replace("x", "")
    $("#id_medicamento_input").val(text_id_medicamento3);
    $("#forma_medicamento_input").val(text_forma);
    $("#codigo_medicamento_input").val(text_codigo);
    let texto2 = text_codigo.toString().replace(",x", "")
    texto2 = texto2.toString().replace("x", "")
    $("#codigo_medicamento").val(texto2);
    $("#codigo_medicamento_formulario").val(texto2);
  }

  function formato_dt_table(cualtabla,columnas) {
    let col=columnas.split(",")
    let columnass=col.map((str) => parseInt(str))
  
    $("." + cualtabla + "").DataTable({
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
      "lengthMenu": [
        [5, 10, 25, 50, -1],
        [5, 10, 25, 50, "All"]
      ],
      "pageLength": 5,
      "bProcessing": true,
      columnDefs: [{
        targets: columnass,
        createdCell: function(cell) {
          var $cell = $(cell);


          $(cell).contents().wrapAll("<div class='content'></div>");
          var $content = $cell.find(".content");

          $(cell).append($("<a>Leer mas</a>"));
          $btn = $(cell).find("a");

          $content.css({
            "height": "30px",
            "overflow": "hidden"
          })
          $cell.data("isLess", true);

          $btn.click(function() {
            var isLess = $cell.data("isLess");
            $content.css("height", isLess ? "auto" : "30px")
            $(this).text(isLess ? "Leer menos" : "Leer mas")
            $cell.data("isLess", !isLess)
          })
        }
      }]

    })

  }

  function guardar_diagnostico() {
    var dominio = localStorage.getItem("dominio") + "sistema/quirofano/php/actualizar_atencion.php";
    var titulo = localStorage.getItem("titulo");
    var descripcion = $("#descripcion").val();
    var id_atencion = $("#id_atencion").val();
    if (descripcion == "") {
      // alert_bonita("","")
      alert_bonita("error", titulo, "Ingrese diagnostico de paciente");
      return;
      return;
    }
    var variable = "id_atencion=" + id_atencion + "&descripcion=" + descripcion
    $.ajax({
      type: "POST",
      url: dominio,
      data: variable,
      success: function(response) {
        presentar('3')
      }
    });
  }
 
    function mostrar_tbl_tratamiento() { 
var dominio = localStorage.getItem("dominio") + "sistema/quirofano/estructura/tratamiento.php";
    var titulo = localStorage.getItem("titulo");
    var id_atencion = $("#id_atencion").val();
    var variable = "id_atencion=" + id_atencion  
    select_Prueba_medica()
    $.ajax({
      type: "POST",
      url: dominio,
      data: variable,
      success: function(response) {
        $(".tabla_tratamiento").html(response);
        formato_dt_table("tbl_tratamiento","0,4,5")
      }
    });
    examen()
     }

      function guardar_tratamiento() {
       var dominio = localStorage.getItem("dominio") + "sistema/quirofano/php/tratamiento.php";
    var titulo = localStorage.getItem("titulo");
var id_atencion = $("#id_atencion").val();
var tratamiento = $("#tratamiento").val();
var estado_tratamiento = $("#estado_tratamiento").val();
var duracion = $("#duracion").val();
var id_medicamento_input=$("#id_medicamento_input").val();
var hora_consumo=$("#hora_consumo").val();
if (tratamiento==="") {alert_bonita("error",titulo,"Ingrese tratamiento");return;}
if (estado_tratamiento==="0") {alert_bonita("error",titulo,"seleccione el estado de tratamiento");return;}
if (duracion==="") {alert_bonita("error",titulo,"ingrese hasta cuando tiene que realizar el tratamiento");return;}
if (id_medicamento_input==="x" || id_medicamento_input==="") {alert_bonita("error",titulo,"Seleccione el medicamento para el tratamiento");return;}
if (hora_consumo==="") {alert_bonita("error",titulo,"ingrese hora que  debe tomar medicamento");return;}
var variable="id_atencion="+id_atencion+"&tratamiento="+tratamiento+"&estado_tratamiento="+estado_tratamiento+"&duracion="+duracion+"&id_medicamento_input="+id_medicamento_input+"&hora_consumo="+hora_consumo;
$.ajax({
 type: "POST",
 url: dominio,
 data: variable, 
 success: function (response) {
   limpiar3()
   generar_tbl_medicamento()
   mostrar_tbl_tratamiento()
 }
});
    }
    function limpiar3() {
     $("#tratamiento").val('');
      $("#estado_tratamiento").val();
    $("#duracion").val('');
    $("#codigo_medicamento_formulario").val("");
  $("#id_medicamento_input").val("x");
   $("#descripcion_medicamento_input").val("x");
    $("#forma_medicamento_input").val("x");
  $("#codigo_medicamento_input").val("x");
  $("#hora_consumo").val("");
    }

    function select_Prueba_medica() {
        //select_Prueba_medica.php
        var dominio = localStorage.getItem("dominio") + "sistema/quirofano/estructura/select_Prueba_medica.php";
        var titulo = localStorage.getItem("titulo");
        var variable=""
        $.ajax({
            type: "POST",
            url: dominio,
            data: variable, 
            success: function (response) {
            $("#id_pr_medica").html(response);
            }
           });
   
      }
      function eliminar_detalle_tratamiento(id_detalle_tratamiento,id_tratamiento){
        var dominio = localStorage.getItem("dominio") + "sistema/quirofano/php/eliminar_detalle_tratamiento.php";
        var titulo = localStorage.getItem("titulo");
        var variable="id_detalle_tratamiento="+id_detalle_tratamiento+"&id_tratamiento="+id_tratamiento
        $.ajax({
            type: "POST",
            url: dominio,
            data: variable, 
            success: function (response) {
              limpiar3()
              generar_tbl_medicamento()
              mostrar_tbl_tratamiento()
            }
           });
      }

      function examen() {
        var dominio = localStorage.getItem("dominio") + "sistema/quirofano/estructura/examen.php";
    var titulo = localStorage.getItem("titulo");
    var id_atencion = $("#id_atencion").val();
    var variable = "id_atencion=" + id_atencion  
    
    $.ajax({
      type: "POST",
      url: dominio,
      data: variable,
      success: function(response) {
        $(".tabla_examen").html(response);
        formato_dt_table("tbl_examen","0,1")
      }
    });
        }

        function eliminar_detalle_examen(id_det_examen,id_examen){
          var dominio = localStorage.getItem("dominio") + "sistema/quirofano/php/eliminar_detalle_examen.php";
          var titulo = localStorage.getItem("titulo");
          var variable="id_det_examen="+id_det_examen+"&id_examen="+id_examen
          $.ajax({
              type: "POST",
              url: dominio,
              data: variable, 
              success: function (response) {
                limpiar3()
                generar_tbl_medicamento()
                mostrar_tbl_tratamiento()
              }
             });
        }

        function guardar_examen() {
          var id_atencion = $("#id_atencion").val();
          var descripcion_examen = $("#descripcion_examen").val();
          var id_pr_medica = $("#id_pr_medica").val();
          $('#id_pr_medica option:selected').remove();
          var dominio = localStorage.getItem("dominio") + "sistema/quirofano/php/guardar_examen.php";
          var titulo = localStorage.getItem("titulo");
          var variable = "id_atencion=" + id_atencion + "&descripcion_examen=" + descripcion_examen + "&id_pr_medica=" + id_pr_medica
          $.ajax({
            type: "POST",
            url: dominio,
            data: variable,
            success: function(response) {
              examen()
            }
          });
        }

        function Finalizar() {
          var dominio = localStorage.getItem("dominio") + "sistema/quirofano/php/update_atencion.php";
          var titulo = localStorage.getItem("titulo");
          var id_atencion = $("#id_atencion").val();
          var id_tipo = $("#id_tipo").val();
          var variable="id_atencion="+id_atencion+"&id_tipo="+id_tipo
          $.ajax({
            type: "POST",
            url: dominio,
            data: variable,
            success: function(response) {
              tabla_paciente()
            }
          });
          }

          function select_id_tipo(id_tipo) {
            var dominio = localStorage.getItem("dominio") + "sistema/quirofano/estructura/select_tipo_atencion.php";
            var titulo = localStorage.getItem("titulo");
            var variable="id_tipo="+id_tipo
            $.ajax({
              type: "POST",
              url: dominio,
              data: variable,
              success: function(response) {
$("#id_tipo").html(response);              }
            });
          }