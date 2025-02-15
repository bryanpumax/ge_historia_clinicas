<?php
include("../../conexion/interacion.php");
session_start();
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL); 
$cedula_paciente=seguridad($_REQUEST["cedula_paciente"]);
$nombre_paciente=trim($_REQUEST["nombre_paciente"]);
$sexo_paciente=seguridad($_REQUEST["sexo_paciente"]);
$fecha_nacimiento=($_REQUEST["fecha_nacimiento"]);
$estado_civil=seguridad($_REQUEST["estado_civil"]);
$tipo_sangre=($_POST["tipo_sangre"]);
$telefono_paciente=seguridad($_REQUEST["telefono_paciente"]);
$tabla="paciente";
$campo="cedula_paciente, nombre_paciente, sexo_paciente, fecha_nacimiento, estado_civil, tipo_sangre, telefono_paciente";
$valor="'$cedula_paciente','$nombre_paciente','$sexo_paciente','$fecha_nacimiento','$estado_civil','$tipo_sangre','$telefono_paciente'";
$where="where cedula_paciente='$cedula_paciente'";
$valor_actualizar="nombre_paciente='$nombre_paciente',sexo_paciente='$sexo_paciente',fecha_nacimiento='$fecha_nacimiento',estado_civil='$estado_civil',tipo_sangre='$tipo_sangre',telefono_paciente='$telefono_paciente'";
$consulta=consultas("$tabla","$campo","$where");
$mensaje="";
if ($consulta->rowCount()==0) {
    # code...
    insertar("$tabla","$campo","$valor");
    $mensaje="Paciente registrado";
}else{
update_table("$tabla","$valor_actualizar","$where");
$mensaje="Paciente actualizado  $valor_actualizar";
}
echo $mensaje;