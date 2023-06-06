<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

$id_atencion=$_REQUEST["id_atencion"];
$id_tipo= ($_REQUEST["id_tipo"]); 
$consulta=consultas("tipo_atencion", "*", "where id_tipo='$id_tipo'");
$rows=$consulta->fetch();
 $estado_paciente_inicio=str_replace("nivel de","",$rows["tipo_atencion"]);
$tabla="atencion";
$campo="*";
//UPDATE `atencion` SET  `descripcion`='a',`fecha_inicio`=curdate(),`fecha_fin`=curdate() WHERE `id_atencion`='1'
$where="where id_atencion='$id_atencion' "; 
$valor_actualizar="`id_tipo`='$id_tipo',`fecha_inicio`=curdate(),`fecha_fin`=curdate(),estado_paciente_inicio='$estado_paciente_inicio' "; 
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()!=0) {
 
    $html="actualizada de atencion";
    update_table("$tabla", "$valor_actualizar", "$where");
}
echo $html;