<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 

$id_tipo=$_REQUEST["id_tipo"];
  
$tabla="tipo_atencion";
$campo="id_tipo, tipo_atencion";
$inner="";
$where=" "; 
$consulta=consultas($tabla, $campo, $where);
$html='  

';

while ($row=$consulta->fetch()) {
    # code...
$html.='<option value="'.$row["id_tipo"].'">'.$row["tipo_atencion"].'</option>';
}
 
echo $html;
?>
