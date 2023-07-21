<?php
session_start();
include("../assets/estructura_inicio.php");
$dominio='https://hospital.lab-mrtecks.com/';
$titulo="Clinica Santa Lucia";
$dominio2='https://hospital.lab-mrtecks.com/sistema';
 
 
if ($_SESSION["id_rol"]=="" ) {
  # code...

}else{
  echo '
  <script>
     location.href="'.$dominio2.'"
</script>
  ';
}
?>
<style>
  body{
    background-color: #385995;
  }
</style>
<img src="<?=$dominio?>assets/multimedia/logo.png"  class="" style="margin-left: 578px !important;" alt="...">

<div class="card mt-4 mx-auto col-xs-12 col-lg-6 col-md-6 col-dm-6"  >
 
  <div class="card-body">
    <h5 class="card-title text-center">INGRESO AL SISTEMA</h5>
   
    <div class="form-floating mb-3">
  <input type="email" class="form-control" id="user" name="user" placeholder="name@example.com">
  <label for="floatingInput">Usuario</label>
</div>

<div class="form-floating mb-3">
  <input type="password" class="form-control" id="pass"  name="pass" placeholder="Password">
  <label for="floatingPassword">Contraseña</label>
</div>
<button type="button" class="btn btn-outline-dark mostrar" onclick="mostrar()"><i class="fa-regular fa-eye fa-beat animated"></i>Mostrar</button>

<button class="btn btn-primary" onclick="login()">Ingresar</button>
  
  </div>
</div>
<script>
 function mostrar() {
  var mostrar=$(".mostrar").html()
  
  if(mostrar=='<i class="fa-regular fa-eye fa-beat animated"></i>Mostrar'){
    $("#pass").attr("type", "text");
    $(".mostrar").html('<i class="fa-solid fa-eye-slash"></i>No Mostrar')
  }else{
    $("#pass").attr("type", "password");
    $(".mostrar").html('<i class="fa-regular fa-eye fa-beat animated"></i>Mostrar')
  }

   } 
function login() {
  let user=$("#user").val().trim();
  let pass=$("#pass").val().trim();
if (user=="") {
  alert_bonita("error","<?=$titulo?>","Ingrese usuario");
  return;
}
if (pass=="") {
  alert_bonita("error","<?=$titulo?>","Ingrese contraseña");
  return;
}
var variable="user="+user+"&pass="+pass
 
$.ajax({
  type: "POST",
  url: "<?=$dominio?>sistema/php/login.php",
  data: variable,  
  dataType: "json",
  success: function (response) {
var responses=response[0] 
  var estado=responses.estado
  var mensaje=responses.mensaje
  var nombre=responses.nombre
  var rol=responses.rol
   switch (mensaje) {
    case "existe":
      localStorage.setItem("dominio","<?=$dominio?>")
      localStorage.setItem("titulo","<?=$titulo?>")
      alert_bonita("success","<?=$titulo?>","Bienvenido "+nombre+"\n "+ rol);
      setTimeout(() => {
        location.href="<?=$dominio?>sistema/index.php"
      }, 1000);
      break;
   
    default:
    alert_bonita("error","<?=$titulo?>","Error ususario y contraseña");
    setTimeout(() => {
        location.href="<?=$dominio?>"
      }, 10000);
      break;
   
  }
}
});
}
</script>
<?php
include("../assets/estructura_fin.php");
?>

