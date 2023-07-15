function cedula_paciente_ft() {
  var cedula_paciente = $("#cedula_paciente").val();
  let tamaño = cedula_paciente.length;

  if (tamaño > 9 && tamaño <= 10) {
    if (validarcedula(cedula_paciente)) {
      $(".cedula_not").addClass("fa-solid fa-triangle-exclamation");

      return;
    } else {
      $(".cedula_not").removeClass("fa-solid fa-triangle-exclamation");
      let variable =
        "cedula=" + cedula_paciente + "&usuario=Alex&contrase=Mina";
      api_cedula_exterior(variable);
    }
  }
}
function api_cedula_exterior(variable) {
  var today = new Date();
  var dd = String(today.getDate()).padStart(2, "0");
  var mm = String(today.getMonth() + 1).padStart(2, "0"); //January is 0!
  var yyyy = today.getFullYear();

  today = mm + "/" + dd + "/" + yyyy;

  $.ajax({
    type: "POST",
    url: "https://sistema.hostaljapon3.com/api/busqueda_exterior.php",
    data: variable,
    dataType: "Json",
  }).done(function (resp2) {
    var data = resp2;
    var inf = data[0].Inf;
    var cant_contratada = inf.cant_contratada;
    var cant_usada = inf.cant_usada;
    var infandi = data[0].infandi;

    if (cant_usada <= cant_contratada) {
      var respuesta = data[0].respuesta;
      var cant_mostrar = cant_usada + "/" + cant_contratada;
      var fecha_nacimiento = respuesta.fecha_nacimiento.replace(
        /(\d{2})-(\d{2})-(\d{4})/,
        "$3-$2-$1"
      );

      $(".api").html(cant_mostrar);
      $("#nombre_paciente").val(respuesta.nombres);
      $("#sexo_paciente").val(respuesta.sexo);
      $("#fecha_nacimiento").val(fecha_nacimiento);

      return;
    }
    if (cant_usada > cant_contratada) {
      $(".api").html(infandi);
      return;
    }
  });
}

function validarcedula(cedula_objeto) {
  var i;
  var cedula;
  var acumulado;
  cedula = cedula_objeto;
  var instancia;
  acumulado = 0;
  for (i = 1; i <= 9; i++) {
    if (i % 2 != 0) {
      instancia = cedula.substring(i - 1, i) * 2;
      if (instancia > 9) instancia -= 9;
    } else instancia = cedula.substring(i - 1, i);
    acumulado += parseInt(instancia);
  }
  while (acumulado > 0) acumulado -= 10;

  if (cedula.substring(9, 10) != acumulado * -1) {
    return true;
  } else {
    return false;
  }
}
/**** */

function cedula_contacto_ft() {
  var cedula_contacto = $("#cedula_contacto").val();
  let tamaño = cedula_contacto.length;

  if (tamaño > 9 && tamaño <= 10) {
    if (validarcedula(cedula_contacto)) {
      $(".cedula_not2").addClass("fa-solid fa-triangle-exclamation");

      return;
    } else {
      $(".cedula_not2").removeClass("fa-solid fa-triangle-exclamation");
      let variable =
        "cedula=" + cedula_contacto + "&usuario=Alex&contrase=Mina";
        cedula_contactos(variable);
    }
  }
}
function cedula_contactos(variable) {
  var today = new Date();
  var dd = String(today.getDate()).padStart(2, "0");
  var mm = String(today.getMonth() + 1).padStart(2, "0"); //January is 0!
  var yyyy = today.getFullYear();

  today = mm + "/" + dd + "/" + yyyy;

  $.ajax({
    type: "POST",
    url: "https://sistema.hostaljapon3.com/api/busqueda_exterior.php",
    data: variable,
    dataType: "Json",
  }).done(function (resp2) {
    var data = resp2;
    var inf = data[0].Inf;
    var cant_contratada = inf.cant_contratada;
    var cant_usada = inf.cant_usada;
    var infandi = data[0].infandi;

    if (cant_usada <= cant_contratada) {
      var respuesta = data[0].respuesta;
      var cant_mostrar = cant_usada + "/" + cant_contratada;
      var fecha_nacimiento = respuesta.fecha_nacimiento.replace(
        /(\d{2})-(\d{2})-(\d{4})/,
        "$3-$2-$1"
      );

      $(".api").html(cant_mostrar);
      $("#nombre_contacto").val(respuesta.nombres); 

      return;
    }
    if (cant_usada > cant_contratada) {
      $(".api").html(infandi);
      return;
    }
  });
}