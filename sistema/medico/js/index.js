$(document).ready(function () {
    tabla_paciente()
});

function tabla_paciente() {
    var  dominio=localStorage.getItem("dominio")+"sistema/medico/estructura/tabla.php";
    var  titulo=localStorage.getItem("titulo");
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
 