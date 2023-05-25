<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 
$id_contacto =seguridad($_REQUEST["id_contacto"]); 
$tabla="contacto";
$campo="`cedula_contacto`, `nombre_contacto`, `telefono`, `parentesco`, `cedula_paciente`";
$where="where id_contacto='$id_contacto'"; 
 
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()!=0) {
    
    $html="elimina contacto";
    eliminar("$tabla","$where");
}
echo $html;