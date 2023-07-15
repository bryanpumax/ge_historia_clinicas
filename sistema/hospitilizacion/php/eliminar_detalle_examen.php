<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 
$id_examen=seguridad($_REQUEST["id_examen"]); 
$id_det_examen=seguridad($_REQUEST["id_det_examen"]); 
$tabla="detalle_examen";
$campo="*";
$where="where  id_examen='$id_examen' and id_det_examen='$id_det_examen'";
$tabla2="examen";
$where2="where  id_examen='$id_examen'  ";
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