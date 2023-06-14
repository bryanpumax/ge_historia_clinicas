$(document).ready(function () {
    tabla_paciente()
});

function tabla_paciente() {
    var  dominio=localStorage.getItem("dominio")+"sistema/quirofano_enfermero/estructura/tabla.php";
    var  titulo=localStorage.getItem("titulo");
   $(".titulo").html("Quirofano");
    $(".nuevo_btn").removeClass("d-none");
    $(".consulta").html("");
    $(".formulario").html("");
    $.ajax({
        type: "POST",
        url:dominio,
        data: "",
        success: function (response) {
            $(".consulta").html(response);


            $(".tabla_atencion").DataTable({
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

function vitales(parametro){
    var  dominio=localStorage.getItem("dominio")+"sistema/quirofano_enfermero/estructura/formulario_vital.php";
    var  titulo=localStorage.getItem("titulo");
    var variable="id_atencion="+parametro
    $(".nuevo_btn").addClass("d-none");
    $(".consulta").html("");
    $(".formulario").html("");
    $(".titulo").html("Quirofano-Signos vitales de paciente seleccionado"); 
$.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    
    success: function (response) {
        $(".formulario").html(response);
    }
});
}
function vital() { 
    var pulso=$("#pulso").val();
    var presion= $("#presion").val();
     let respiracion=$("#respiracion").val();
     let temperatura=$("#temperatura").val();
     var id_atencion=$("#id_atencion").val();
var variable="pulso="+pulso+"&presion="+presion+"&respiracion="+respiracion+"&temperatura="+temperatura+"&id_atencion="+id_atencion
var  dominio=localStorage.getItem("dominio")+"sistema/quirofano_enfermero/php/signos_vitales.php";
$.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    success: function (response) {
       tabla_paciente()
    }
});

 }