<?php

include("../conexion/interacion.php");
session_start();
$user=seguridad($_REQUEST["user"]);
$pass=seguridad($_REQUEST["pass"]);
$tabla="usuario";
$campo="`id_usuario`, `cedula_usu`, `nombre_usu`, `estado_usu`, `usuario_usuario`, `contrase`, usuario.id_rol,
rol.rol";
$where="where contrase=md5('$pass') and usuario_usuario='$user'";
$inner="INNER JOIN rol on rol.id_rol=usuario.id_rol";
$consulta=consultas("$tabla","$campo","$inner $where");
$mensaje="";$nombre_usu="";$rol="";
$estado="";
if ($consulta->rowCount()>0) {
while ($row=$consulta->fetch()) {
    $_SESSION["id_usuario"]=$row["id_usuario"];
    $_SESSION["id_rol"]=$row["id_rol"];
    $_SESSION["rol"]=$row["rol"];
    $_SESSION["nombre_usu"]=$row["nombre_usu"];
    $_SESSION["cedula_usu"]=$row["cedula_usu"];
    $estado=$row["estado_usu"];
    $nombre_usu=$row["nombre_usu"];
    $rol=$row["rol"];
}    
$mensaje="existe";
setcookie("nombre_cookie", "valor_cookie", time() + (24 * 3600));

}else{
$mensaje="noexiste";
}
if ($mensaje=="noexiste") {
    # code...
    session_destroy();
}

$visor_array = array();
array_push($visor_array, array(  "estado"=>$estado,"mensaje"=>$mensaje,"nombre"=>$nombre_usu ,"rol"=>$rol));
 
echo json_encode($visor_array);   