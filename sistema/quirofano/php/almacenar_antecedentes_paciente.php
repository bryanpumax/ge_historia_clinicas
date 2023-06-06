<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1); 

$cedula_paciente=$_REQUEST["cedula_paciente"];
$tipo_enfermedad=$_REQUEST["tipo_enfermedad"];
$fecha_dianostico=$_REQUEST["fecha_dianostico"];
$tratamiento_recibido=$_REQUEST["tratamiento_recibido"];
$estado_actual=$_REQUEST["estado_actual"];
$parentesco_familiar=$_REQUEST["parentesco_familiar"];
$nombre_familiar=$_REQUEST["nombre_familiar"];
$antecedentes_enf_familia=$_REQUEST["antecedentes_enf_familia"];
$tabla="antecedentes_paciente";
$campo=" id_antecedentes, tipo_enfermedad, fecha_dianostico, tratamiento_recibido, estado_actual, parentesco_familiar, nombre_familiar, antecedentes_enf_familia, cedula_paciente";
$where="where cedula_paciente='$cedula_paciente' and tipo_enfermedad='$tipo_enfermedad' and parentesco_familiar='$parentesco_familiar'"; 
$valor=" null, '$tipo_enfermedad', '$fecha_dianostico', '$tratamiento_recibido', '$estado_actual', '$parentesco_familiar', '$nombre_familiar', '$antecedentes_enf_familia', '$cedula_paciente'";
$valor_actualizar="fecha_dianostico='$fecha_dianostico',tratamiento_recibido='$tratamiento_recibido',estado_actual='$estado_actual',parentesco_familiar='$parentesco_familiar',nombre_familiar='$nombre_familiar',antecedentes_enf_familia='$antecedentes_enf_familia'";

$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code...
    $html="registro de antecedentes";
    insertar("$tabla", "$campo", "$valor");
}else{
    $html="actualizada de antecedentes";
    update_table("$tabla", "$valor_actualizar", "$where");
}
echo $html;