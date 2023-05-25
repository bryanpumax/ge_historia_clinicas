<?php

$dominio='https://hospital.lab-mrtecks.com/';
session_start(); // Iniciar la sesión
session_unset(); // Eliminar todas las variables de sesión
session_destroy(); // Destruir la sesión actual

// Borrar la cookie de sesión
if (isset($_COOKIE[session_name()])) {
   setcookie(session_name(), '', time()-42000, '/');
}
?>
<script>
      location.href="<?=$dominio?>"
</script>