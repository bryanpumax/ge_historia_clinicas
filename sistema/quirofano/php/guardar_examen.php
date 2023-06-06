<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$id_atencion=seguridad($_REQUEST["id_atencion"]);
$descripcion_examen=trim($_REQUEST["descripcion_examen"]);
$id_pr_medica=seguridad($_REQUEST["id_pr_medica"]); 


 $tabla="examen";
$campo="id_examen, id_atencion, descripcion_examen";
$where="where id_atencion='$id_atencion' and  descripcion_examen='$descripcion_examen'";  
$valor="null, $id_atencion, '$descripcion_examen'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code...
    $html="registro de examen";
    insertar("$tabla", "$campo", "$valor");
} 
$consulta=consultas($tabla, $campo, $where);
$row=$consulta->fetch();
$id_examen=$row["id_examen"];
$tabla="detalle_examen";
$campo="id_det_examen, id_examen, observacionn, id_pr_medica";
$valor="null, $id_examen, '', '$id_pr_medica'";
$where="where id_examen='$id_examen' and id_pr_medica='$id_pr_medica'";
$consulta=consultas($tabla, $campo, $where);
if ($consulta->rowCount()==0) {
    # code...
    $html="registro de prueba";
    insertar("$tabla", "$campo", "$valor");
}
echo $html;