<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 
$id_tratamiento=seguridad($_REQUEST["id_tratamiento"]); 
$id_detalle_tratamiento=seguridad($_REQUEST["id_detalle_tratamiento"]); 
$tabla="detalle_tratamiento";
$campo="*";
$where="where  id_tratamiento='$id_tratamiento' and id_detalle_tratamiento='$id_detalle_tratamiento'";
$tabla2="tratamiento";
$where2="where  id_tratamiento='$id_tratamiento'  ";
$consulta=consultas($tabla, $campo, $where);
// 
$consulta2=consultas($tabla2, $campo, $where2);
$html="";
$i=1;
if ($consulta->rowCount()>0) {
    
    
    eliminar("$tabla","$where");
    $consulta=consultas($tabla, $campo, $where2);
    if ($consulta->rowCount()==0) {
              eliminar("$tabla2","$where2");
    }   
}

echo $html;