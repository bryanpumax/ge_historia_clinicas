<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$id_usuario = $_SESSION['id_usuario'];
$id_rol=$_SESSION["id_rol"];
$tabla="menu";
$campo="`id_menu`, `menu`, `icono`, `archivo`, `id_rol`";
$where=" where id_rol='$id_rol'";
$consulta=consultas("$tabla","$campo","$where");
$html=""; 

if ($consulta->rowCount()==0) {
    # code...
    $html.='<li class="nav-item">
   Tu rol No existe
    </li>';
}else{
while ($row=$consulta->fetch()) {
    # code...
    $menu=$row["menu"];
    $archivo=$row["archivo"];
    $parametros="'$menu','$archivo'";
    $html.=' <li   class="nav-item">
    <button class="nav-link text-white" onclick="menu_li('.$parametros.')">
    
    '.$row["menu"].'
    <span class="badge text-bg-light"><i class="'.$row["icono"].'"  ></i></span>
    </button> 
    </li>';
}
}
echo  $html;

