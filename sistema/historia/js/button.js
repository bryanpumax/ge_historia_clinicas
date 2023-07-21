function desaparecer() {
    $(".nuevo_btn").addClass("d-none");
    $(".consulta").html("");
    $(".formulario").html("");
}
 function atencion_individual(cedula,nombre) {
    var variable={cedula}
    var  dominio=localStorage.getItem("dominio")+"sistema/historia/estructura/atencion_individual.php";
    var  titulo=localStorage.getItem("titulo");
    $(".titulo").html("Historial de "+nombre);
    $.ajax({
        type: "POST",
        url:dominio,
        data: variable,
        success: function (response) {
            $(".consulta").html(response);


            $(".smallmega").DataTable({
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

 function tratamiento(id_atencion,descripcion) {
    var variable={id_atencion,descripcion}
    var  dominio=localStorage.getItem("dominio")+"sistema/historia/estructura/tratamiento.php";
    var  titulo=localStorage.getItem("titulo");
    $(".titulo").html("Tratamiento de "+descripcion);
    $.ajax({
        type: "POST",
        url:dominio,
        data: variable,
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



 
 function examen(id_atencion,descripcion) {
    var variable={id_atencion,descripcion}
    var  dominio=localStorage.getItem("dominio")+"sistema/historia/estructura/examen.php";
    var  titulo=localStorage.getItem("titulo");
    $(".titulo").html("Examen de "+descripcion);
    $.ajax({
        type: "POST",
        url:dominio,
        data: variable,
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

 function detalle_examen(id_atencion,descripcion) {
    var variable={id_atencion,descripcion}
    var  dominio=localStorage.getItem("dominio")+"sistema/historia/estructura/detalle_examen.php";
    var  titulo=localStorage.getItem("titulo");
    $(".titulo").html("Examen de "+descripcion);
    $.ajax({
        type: "POST",
        url:dominio,
        data: variable,
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

 function pdf(cedula) {
    var dominio = localStorage.getItem("dominio") + "sistema/historia/estructura/historia.php";
  var titulo = localStorage.getItem("titulo"); 
  var   variable= "cedula="+cedula 
 window.location.href=dominio+"?"+variable 

   }