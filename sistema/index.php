
<?php
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include("../assets/estructura_inicio.php"); 

$desconectar='https://hospital.lab-mrtecks.com/sistema/php/desconectar.php';
if (!isset($_SESSION["id_rol"]) ) {
  # code...
  echo '
  <script>
     location.href="'.$desconectar.'"
</script>
  ';

} 
?>
<div class="container-fluid">
<div class="mb-5" >
     <?php 
     include("./componente/menu.php");
     
     ?>
</div>
<hr>
    <div class="row mt-5">

<div class="col-lg-12 col-md-12 col-dm-12 col-xs-12">

<div class="card ">
  <div class="card-header ">
  <h2 class="titulo">Inicio</h2>
  </div>
  <div class="card-body contenido ">
 
 <div class="mostrar_doctores"></div>
    <div class="cantidad_personas_area"></div>
    <div class="cantidad_personas_casa_hoy"></div>
  </div>
 
</div>

</div>
    
</div>

 </div>

<?php
include("../assets/estructura_fin.php");
?>
 <script src="<?=$dominio?>/sistema/comportamiento.js"></script>