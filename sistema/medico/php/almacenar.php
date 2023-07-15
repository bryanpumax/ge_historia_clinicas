<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$cedula_medico=$_REQUEST["cedula_medico"];
$nombre_medico=$_REQUEST["nombre_medico"];
$telefono_medico=$_REQUEST["telefono_medico"];
$sexo_medico=$_REQUEST["sexo_medico"];
$id_especialidad=$_REQUEST["id_especialidad"];
$usuario_usuario=$_REQUEST["usuario_usuario"];
$contrase=$_REQUEST["contrase"];
$tabla="medico";
$campo="cedula_medico, nombre_medico, sexo_medico, telefono_medico, id_especialidad, estado_medico";
$where="where cedula_medico='$cedula_medico'";
$valor="'$cedula_medico', '$nombre_medico', '$sexo_medico', '$telefono_medico', $id_especialidad, 'Casa'";
$campo_actualizar="nombre_medico='$nombre_medico'";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code... 
    insertar("$tabla", "$campo", "$valor");
} else{
    update_table("$tabla", "$campo_actualizar", "$where");
}


$tabla="usuario";
$campo="`id_usuario`, `cedula_usu`, `nombre_usu`, `estado_usu`, `usuario_usuario`, `contrase`, `id_rol`";
$where="where cedula_usu='$cedula_medico'";
$valor="null,'$cedula_medico', '$nombre_medico', 'A', '$usuario_usuario', md5('$contrase'),1";
$consulta=consultas($tabla, $campo, $where);
$html="";
$i=1;
if ($consulta->rowCount()==0) {
    # code... 
    insertar("$tabla", "$campo", "$valor");
}  