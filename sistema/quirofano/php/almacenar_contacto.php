<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$cedula_contacto=seguridad($_REQUEST["cedula_contacto"]);
$nombre_contacto=trim($_REQUEST["nombre_contacto"]);
$telefono_contacto=seguridad($_REQUEST["telefono_contacto"]);
$parentesco_contacto=$_REQUEST["parentesco_contacto"];
 $cedula_paciente=$_REQUEST["cedula_paciente"];


 $tabla="contacto";
$campo="`cedula_contacto`, `nombre_contacto`, `telefono`, `parentesco`, `cedula_paciente`";
$where="where cedula_contacto='$cedula_contacto' and  cedula_paciente='$cedula_paciente'"; 
$valor_actualizar="nombre_contacto='$nombre_contacto',telefono='$telefono_contacto',parentesco='$parentesco_contacto'";
$valor="  '$cedula_contacto','$nombre_contacto','$telefono_contacto','$parentesco_contacto','$cedula_paciente'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code...
    $html="registro de contacto";
    insertar("$tabla", "$campo", "$valor");
}else{
    $html="actualizada de contacto";
    update_table("$tabla", "$valor_actualizar", "$where");
}
echo $html;