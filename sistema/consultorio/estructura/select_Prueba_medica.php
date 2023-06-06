<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 


  
$tabla="Prueba_medica";
$campo=" id_pr_medica, prueba_medica";
$inner="";
$where=""; 
$consulta=consultas($tabla, $campo, $where);
$html='  
<option value="0">Elige la prueba</option> 
';

while ($row=$consulta->fetch()) {
    # code...
$html.='<option value="'.$row["id_pr_medica"].'">'.$row["prueba_medica"].'</option>';
}
 
echo $html;
?>
