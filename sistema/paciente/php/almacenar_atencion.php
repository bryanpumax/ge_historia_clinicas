<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 $cedula_paciente=seguridad($_REQUEST["cedula_paciente"]);
$cedula_medico=trim($_REQUEST["cedula_medico"]);
$id_usuario=seguridad($_REQUEST["id_usuario"]);
$id_tipo=$_REQUEST["id_tipo"];
$consulta=consultas("tipo_atencion", "*", "where id_tipo='$id_tipo'");
$rows=$consulta->fetch();
 $estado_paciente_inicio=str_replace("nivel de","",$rows["tipo_atencion"]);
 $tabla="atencion";
 $id_atencion="null";
$campo="`id_atencion`, `cedula_paciente`, `cedula_medico`, `id_usuario`, `id_tipo`, `estado_paciente_inicio`, `descripcion`, `fecha_inicio`, `fecha_fin`, `fecha_registrada`";
$where="where cedula_paciente='$cedula_paciente' and  cedula_medico='$cedula_medico'  and fecha_inicio=curdate() and fecha_registrada=curdate()"; 
$valor_actualizar="cedula_medico='$cedula_medico',id_usuario='$id_usuario',id_tipo='$id_tipo',estado_paciente_inicio='$estado_paciente_inicio'";
$valor="  $id_atencion,'$cedula_paciente','$cedula_medico','$id_usuario','$id_tipo','$estado_paciente_inicio','',curdate(),curdate(),curdate()";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;

if ($consulta->rowCount()==0) {
    # code...
    $html="registro de contacto";
    insertar("$tabla", "$campo", "$valor");
} else{
    update_table("$tabla", "$valor_actualizar", "$where");
}
$consulta=consultas($tabla, $campo, $where);
$row=$consulta->fetch();
$html=$row["id_atencion"];
echo $html;  