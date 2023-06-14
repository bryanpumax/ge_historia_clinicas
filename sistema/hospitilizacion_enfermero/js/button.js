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

function tabla_alergia_paciente(cedula_paciente) {
  $(".consulta").html("");
  var dominio2 =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/formulario_alergia.php";
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/alergias_paciente.php";
  $.ajax({
    type: "POST",
    url: dominio2,
    data: "",
    success: function (response) {
      $(".consulta").html(response);
      $("#cedula_paciente").val(cedula_paciente);
      $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente=" + cedula_paciente,
        success: function (response) {
          $(".alergias_paciente").html(response);
          formato_dt_table("table_alergia", "",false);
        },
      });
    },
  });

  var titulo = localStorage.getItem("titulo");
  $(".titulo").html("Hospital-Alergia de paciente seleccionado");
}

function tabla_antecedentes_familiarC(cedula_paciente) {
  var dominio2 =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/formulario_antecedentes.php";
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/tabla_antecedentes_familiar.php";
  var titulo = localStorage.getItem("titulo");
  $(".titulo").html("Hospital-Antecedentes de paciente seleccionado");
  $.ajax({
    type: "POST",
    url: dominio2,
    data: "",
    success: function (response) {
      $(".consulta").html(response);
      $("#cedula_paciente").val(cedula_paciente);
      $.ajax({
        type: "POST",
        url: dominio,
        data: "cedula_paciente=" + cedula_paciente,
        success: function (response) {
          $(".tabla_antecedentes_familiar").html(response);
          formato_dt_table("table_antecedentes_paciente", "",false);
        },
      });
    },
  });
}

function desaparecer() {
  $(".consulta").html("");
  $(".formulario").html("");
}

function tabla_vital_antencion(id_atencion) {
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/tabla_vital_antencion.php";
  var titulo = localStorage.getItem("titulo");
  var variable = "id_atencion=" + id_atencion;
  $.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    success: function (htmlString) {
      $(".tabla_vital_antencion").html(htmlString);
      formato_dt_table("tabla_signos", "",false);
    },
  });
}

function vital() {
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/php/signos_vitales.php";
  var id_atencion = $("#id_atencion").val();
  var pulso = $("#pulso").val();
  var presion = $("#presion").val();
  let respiracion = $("#respiracion").val();
  let temperatura = $("#temperatura").val();
  var variable =
    "pulso=" +
    pulso +
    "&presion=" +
    presion +
    "&respiracion=" +
    respiracion +
    "&temperatura=" +
    temperatura +
    "&id_atencion=" +
    id_atencion;
  $.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    success: function (response) {
      $("#pulso").val("");
      $("#presion").val("");
      $("#respiracion").val("");
      $("#temperatura").val("");
      tabla_vital_antencion(id_atencion);
    },
  });
}

function almacenar_antecedentes_paciente() {
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/paciente/php/almacenar_antecedentes_paciente.php";
  var titulo = localStorage.getItem("titulo");
  var cedula_paciente = $("#cedula_paciente").val();
  if (cedula_paciente === "") {
    alert_bonita("error", titulo, "Ingrese cedula paciente");
    presentar(1);
    return;
  }
  var tipo_enfermedad = $("#tipo_enfermedad").val();
  var fecha_dianostico = $("#fecha_dianostico").val();
  var tratamiento_recibido = $("#tratamiento_recibido").val();
  var estado_actual = $("#estado_actual").val();
  var parentesco_familiar = $("#parentesco_familiar").val();
  var nombre_familiar = $("#nombre_familiar").val();
  if (nombre_familiar == "") {
    nombre_familiar = parentesco_familiar;
  }
  var antecedentes_enf_familia = tipo_enfermedad;
  var variable =
    "cedula_paciente=" +
    cedula_paciente +
    "&tipo_enfermedad=" +
    tipo_enfermedad +
    "&fecha_dianostico=" +
    fecha_dianostico +
    "&tratamiento_recibido=" +
    tratamiento_recibido +
    "&estado_actual=" +
    estado_actual +
    "&parentesco_familiar=" +
    parentesco_familiar +
    "&nombre_familiar=" +
    nombre_familiar +
    "&antecedentes_enf_familia=" +
    antecedentes_enf_familia;

  $.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    success: function (response) {
      //notificacion(response)
      tabla_antecedentes_familiarC(cedula_paciente);
    },
  });
}

function almacenar_alergia() {
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/paciente/php/almacenar_alergias.php";
  var titulo = localStorage.getItem("titulo");
  var cedula_paciente = $("#cedula_paciente").val();

  if (cedula_paciente === "") {
    alert_bonita("error", titulo, "Ingrese cedula paciente");
    presentar(1);
    return;
  }
  var gravedad = $("#gravedad").val();
  var alergias = $("#alergias").val();
  var variable =
    "cedula_paciente=" +
    cedula_paciente +
    "&gravedad=" +
    gravedad +
    "&alergias=" +
    alergias;

  $.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    success: function (response) {
      //notificacion(response)
      tabla_alergia_paciente(cedula_paciente);
      $("#gravedad").val("");
      $("#alergias").val("");
    },
  });
}

function seguimiento_medicamento(id_atencion) {
  $(".consulta").html("");
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/formulario_tratamiento.php";
  $.ajax({
    type: "POST",
    url: dominio,
    data: "",

    success: function (response) {
      $(".consulta").html(response);
      $("#id_atencion").val(id_atencion);
      tratamiento(id_atencion);
      select_id_detalle_tratamiento(id_atencion);
    },
  });
}
function tratamiento(id_atencion) {
  var variable = "id_atencion=" + id_atencion;
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/tratamiento.php";
  $.ajax({
    type: "POST",
    url: dominio,
    data: variable,
    success: function (htmlString) {
      $(".tratamiento").html(htmlString);
      formato_dt_table("tbl_tratamiento", "",false);
    },
  });
}

function select_id_detalle_tratamiento(id_atencion) {
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/estructura/select_medicamento.php";
  $.ajax({
    type: "POST",
    url: dominio,
    data: "id_atencion=" + id_atencion,
    success: function (response) {
      $("#id_detalle_tratamiento").html(response);
    },
  });
}
function almacenar_seguimiento() {
  var dominio =
    localStorage.getItem("dominio") +
    "sistema/hospitilizacion_enfermero/php/almacenar_seguimiento.php";
  var id_atencion = $("#id_atencion").val();
  var donde = $("#donde").val();
  var id_detalle_tratamiento = $("#id_detalle_tratamiento").val();
  var dosis = $("#dosis").val();
  var fecha_suministrada = $("#fecha_suministrada").val();
  var hora_suministrada = $("#hora_suministrada").val();
  var data = {
    id_atencion: id_atencion,
    donde: donde,
    id_detalle_tratamiento: id_detalle_tratamiento,
    dosis: dosis,
    fecha_suministrada: fecha_suministrada,
    hora_suministrada: hora_suministrada,
  };
  $.ajax({
    type: "POST",
    url: dominio,
    data: data,
    success: function (response) {
      seguimiento_medicamento(id_atencion);
    },
  });
}
