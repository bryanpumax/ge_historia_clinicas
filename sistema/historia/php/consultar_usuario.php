<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

$usuario_usuario=$_REQUEST["usuario_usuario"];

$tabla="usuario";
$campo="`id_usuario`, `cedula_usu`, `nombre_usu`, `estado_usu`, `usuario_usuario`, `contrase`, `id_rol`";
$where="where usuario_usuario='$usuario_usuario'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code... 
  echo true;
}  else{
    echo false;
}