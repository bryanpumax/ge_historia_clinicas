<?php
include("../conexion/interacion.php");
$tabla="resultado";
$campo="id_resultados, id_det_examen, valor";
$total=1;
$canti=$_REQUEST["canti"]; 
$id_examen=$_REQUEST["id_examen"];
for ($i=1; $i <=$canti ; $i++) {
    $iddetalle=$_REQUEST["iddetalle$i"] ;
    $value=$_REQUEST["value$i"] ;
    $valor_actualizar="valor='$value'";
    $where="where id_det_examen=$iddetalle" ; 
$consulta=consultas("$tabla","$campo","$inner $where");
if ($consulta->rowcount()==0) {
    # code...
    
    $valor="null,$iddetalle,'$value'";
insertar("$tabla","$campo","$valor");
$total++;
}else {
    # code...
    update_table("$tabla","$valor_actualizar","$where");
}
  
}

update_table("examen","estado='Inactivo'","where id_examen='$id_examen'");
echo "ok";
?>