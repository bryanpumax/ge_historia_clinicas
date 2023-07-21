<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

$cedula=$_REQUEST["cedula"];
$estado=$_REQUEST["estado"];
$tabla="usuario";
$campo="`id_usuario`, `cedula_usu`, `nombre_usu`, `estado_usu`, `usuario_usuario`, `contrase`, `id_rol`";
$where="where cedula_usu='$cedula'";
$campo_actualizar="estado_usu='$estado'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()>0) {
    # code... 
 update_table("$tabla","$campo_actualizar","$where");
}