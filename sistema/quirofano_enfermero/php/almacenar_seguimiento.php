<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
 
 $id_usuario=$_SESSION["id_usuario"];
 $id_atencion = $_POST['id_atencion'];
 $donde = $_POST['donde'];
 $id_detalle_tratamiento = $_POST['id_detalle_tratamiento'];
 $dosis = $_POST['dosis'];
 $fecha_suministrada = $_POST['fecha_suministrada'];
 $hora_suministrada = $_POST['hora_suministrada'];

$tabla="seguimiento_medicamento"; 
$campo="`id_seguimiento_medicamento`, `id_usuario`, `id_detalle_tratamiento`, `fecha_suministrada`, `hora_suministrada`, `dosis`, `fecha_registrada`, `hora_registrada`, `donde`";
$where="where donde='$donde' and id_detalle_tratamiento='$id_detalle_tratamiento' and fecha_suministrada='$fecha_suministrada' and hora_suministrada='$hora_suministrada'"; 
$valor_actualizar=" ";
$valor="null,$id_usuario,$id_detalle_tratamiento,'$fecha_suministrada','$hora_suministrada','$dosis',curdate(),curtime(),'$donde'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;

     # code...
 if ($consulta->rowCount()==0) {
   insertar("$tabla", "$campo", "$valor");
} 
 
 