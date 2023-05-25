<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 
$id_alergias=seguridad($_REQUEST["id_alergias"]); 
$tabla="alergias";
$campo="`id_alergias`, `alergias`, `gravedad`, `cedula_paciente`";
$where="where id_alergias=$id_alergias"; 
$valor_actualizar="gravedad='$gravedad'";
$valor="null, '$alergias','$gravedad','$cedula_paciente'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()!=0) {
    
    $html="eliminar de alergia";
    eliminar("$tabla","$where");
}
echo $html;