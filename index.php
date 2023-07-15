<!-- Aqui  si  quieres  usar  un  lading  page  aqui  va  su  codigo -->
<?php
header("Location: interfaz/login.php"); 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include("./assets/estructura_inicio.php");

?>
<div class="m-auto">
<a class="btn  btn-primary" href="http://hospital.lab-mrtecks.com/interfaz/login.php">Ingreso</a>
</div>
<?php
include("./assets/estructura_fin.php");
?>