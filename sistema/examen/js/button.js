function formato_dt_table(cualtabla, columnas,ordenar) {
  let col = columnas.split(",");
  let columnass = col.map((str) => parseInt(str));

  $("." + cualtabla + "").DataTable({
    ordering: ordenar,
    language: {
      lengthMenu: "Mostrar _MENU_ registros",
      zeroRecords: "No se encontraron resultados en su busqueda",
      searchPlaceholder: "Buscar registros",
      info: "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
      infoEmpty: "No existen registros",
      infoFiltered: "(filtrado de un total de _MAX_ registros)",
      sSearch: "Buscar:",
      oPaginate: {
        first: "Primero",
        last: "Último",
        next: "Siguiente",
        previous: "Anterior",
      },
      aria: {
        sortAscending: ": Activar para ordenar la columna de manera ascendente",
        sortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
      select: {
        rows: {
          _: "Ha seleccionado %d filas",
          0: "No hay filas seleccionadas",
          1: "Ha seleccionado 1 fila",
        },
      },
    },
    lengthMenu: [
      [5, 10, 25, 50, -1],
      [5, 10, 25, 50, "All"],
    ],
    pageLength: 5,
    bProcessing: true,
    columnDefs: [
      {
        targets: columnass, 
        createdCell: function (cell) {
          var $cell = $(cell);

          $(cell).contents().wrapAll("<div class='content'></div>");
          var $content = $cell.find(".content");

          $(cell).append($("<a>Leer mas</a>"));
          $btn = $(cell).find("a");

          $content.css({
            height: "30px",
            overflow: "hidden",
          });
          $cell.data("isLess", true);

          $btn.click(function () {
            var isLess = $cell.data("isLess");
            $content.css("height", isLess ? "auto" : "30px");
            $(this).text(isLess ? "Leer menos" : "Leer mas");
            $cell.data("isLess", !isLess);
          });
        },
      },
    ],
  });
}

function imprimir_examen(id_atencion) {
  var dominio = localStorage.getItem("dominio") + "sistema/consultorio/php/examen_medico.php";
  var titulo = localStorage.getItem("titulo"); 
  var   variable= "id_atencion="+id_atencion 
 window.location.href=dominio+"?"+variable
}