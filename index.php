<!-- Aqui  si  quieres  usar  un  lading  page  aqui  va  su  codigo -->
<?php
header("Location: interfaz/login.php"); 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include("./assets/estructura_inicio.php");

 
include("./assets/estructura_fin.php");
?>
<script>
    $(document).ready(function () {
        window.location.href="https://hospitalclinicosantalucia.com/interfaz/login.php"
    });
</script>