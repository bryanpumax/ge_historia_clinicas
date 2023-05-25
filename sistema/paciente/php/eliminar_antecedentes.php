<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 
$id_antecedentes=seguridad($_REQUEST["id_antecedentes"]); 
$tabla="antecedentes_paciente";
$campo=" `id_antecedentes`, `tipo_enfermedad`, `fecha_dianostico`, `tratamiento_recibido`, `estado_actual`, `parentesco_familiar`, `nombre_familiar`, `antecedentes_enf_familia`, `cedula_paciente`";
$where="where id_antecedentes='$id_antecedentes'"; 
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()!=0) {
    
    $html="eliminar de antecedentes";
    eliminar("$tabla","$where");
}else{
    $html="no existe antecedentes";
}
echo $html;