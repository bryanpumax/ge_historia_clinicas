<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);
// $pulso=$_REQUEST["pulso"];
$pulso= ($_REQUEST["pulso"]=="") ? 0 :$_REQUEST["pulso"]  ;
$presion= ($_REQUEST["presion"]=="") ? 0 : $_REQUEST["presion"] ;
$respiracion  = ($_REQUEST["respiracion"]=="") ? 0 : $_REQUEST["respiracion"] ;
$temperatura= ($_REQUEST["temperatura"]=="") ? 0 : $_REQUEST["temperatura"] ;
$id_atencion=trim($_REQUEST["id_atencion"]);
 



$tabla="signosvitales";
$id_signos="null";
$campo=" `id_signos`, `id_atencion`, `pulso`, `presion`, `respiracion`, `temperatura`,fecha_registrada";
$where="where id_atencion='$id_atencion'"; 
$valor_actualizar="pulso='$pulso',presion='$presion',respiracion='$respiracion',temperatura='$temperatura'";
$valor="$id_signos,'$id_atencion','$pulso','$presion','$respiracion','$temperatura',now()";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;

if ($consulta->rowCount()==0) {
   # code...
  
   insertar("$tabla", "$campo", "$valor");
   $sq=insertarprueba("$tabla", "$campo", "$valor");
   $html="registro de signo $sq";
} else{
    
   update_table("$tabla", "$valor_actualizar", "$where");
   $sq=update_table_p("$tabla", "$valor_actualizar", "$where");
   $html="actualizacion de signo $sq";
}
$consulta=consultas($tabla, $campo, $where);
$row=$consulta->fetch();
$id_signos=$row["id_signos"];
echo $id_signos . " $html";  