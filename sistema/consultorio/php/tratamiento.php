<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);   
 $tabla="tratamiento";
 $campo=" id_tratamiento, id_atencion, tratamiento, estado_tratamiento, fecha_registrado, duracion ";

$id_atencion=$_REQUEST["id_atencion"];
$tratamiento=$_REQUEST["tratamiento"];
$estado_tratamiento=$_REQUEST["estado_tratamiento"];
$duracion=$_REQUEST["duracion"];
$where="where id_atencion='$id_atencion' and tratamiento='$tratamiento'";
$consulta=consultas("$tabla","$campo","$where");
$valor=" null, $id_atencion,'$tratamiento', '$estado_tratamiento', curdate(), '$duracion'";
$accion="";
if ($consulta->rowCount()==0) {
    # code...
    insertar("$tabla", "$campo", "$valor");
    $accion.=insertarprueba("$tabla", "$campo", "$valor");
}
$consulta=consultas("$tabla","$campo","$where");
$row=$consulta->fetch();
$id_tratamiento=$row["id_tratamiento"];
$id_medicamento_input= explode(",",$_REQUEST["id_medicamento_input"]);
// echo $id_tratamiento;
 $hora_consumo=$_REQUEST["hora_consumo"];

$tabla="detalle_tratamiento";
$campo="id_detalle_tratamiento, id_tratamiento, hora_consumo, id_medicamento";
for ($i=0; $i <count($id_medicamento_input) ; $i++) { 
     $id_medicamento= $id_medicamento_input[$i];
     $where="where id_tratamiento='$id_tratamiento' and id_medicamento='$id_medicamento'";
     $consulta=consultas("$tabla","$campo","$where");
     $valor="null, $id_tratamiento, '$hora_consumo', $id_medicamento";
     if ($consulta->rowCount()==0) {
        # code...
        insertar("$tabla", "$campo", "$valor");
        $accion.=insertarprueba("$tabla", "$campo", "$valor");
    }
}
echo $accion;