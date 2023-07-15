<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

$cedula_paciente=$_REQUEST["cedula_paciente"];
$alergias= ($_REQUEST["alergias"]);
$gravedad= ($_REQUEST["gravedad"]);
$tabla="alergias";
$campo="`id_alergias`, `alergias`, `gravedad`, `cedula_paciente`";
$where="where cedula_paciente='$cedula_paciente' and alergias='$alergias'"; 
$valor_actualizar="gravedad='$gravedad'";
$valor="null, '$alergias','$gravedad','$cedula_paciente'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code...
    $html="registro de alergia";
    insertar("$tabla", "$campo", "$valor");
}else{
    $html="actualizada de alergia";
    update_table("$tabla", "$valor_actualizar", "$where");
}
echo $html;