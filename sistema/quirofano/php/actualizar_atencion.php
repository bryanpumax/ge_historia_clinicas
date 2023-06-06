<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

$id_atencion=$_REQUEST["id_atencion"];
$descripcion= ($_REQUEST["descripcion"]); 
$tabla="atencion";
$campo="*";
//UPDATE `atencion` SET  `descripcion`='a',`fecha_inicio`=curdate(),`fecha_fin`=curdate() WHERE `id_atencion`='1'
$where="where id_atencion='$id_atencion' "; 
$valor_actualizar="`descripcion`='$descripcion',`fecha_inicio`=curdate(),`fecha_fin`=curdate() "; 
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()!=0) {
 
    $html="actualizada de atencion";
    update_table("$tabla", "$valor_actualizar", "$where");
}
echo $html;