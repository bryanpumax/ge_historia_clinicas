<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);  
 
$id_atencion=$_REQUEST["id_atencion"];
$tabla="examen"; 

$campos="
examen.id_examen, id_atencion, descripcion_examen,detalle_examen.id_det_examen,Prueba_medica.prueba_medica 
";
$where="where examen.id_atencion='$id_atencion'";
$inner="
INNER JOIN detalle_examen on detalle_examen.id_examen=examen.id_examen
INNER JOIN Prueba_medica on Prueba_medica.id_pr_medica=detalle_examen.id_pr_medica
";
$consulta=consultas("$tabla","$campos","$inner $where");

$html='
<table class="table tbl_examen ">
<thead>
  <tr>
  
    <th scope="col">Obejtivo Examen</th>
    <th scope="col">Prueba medica</th> 
    <th scope="col">Accion</th>
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
  $id_examen=$row["id_examen"];
  $id_det_examen=$row["id_det_examen"]; 
    $button='<button class="btn btn-outline-primary " title="eliminar examen" onclick="eliminar_detalle_examen(\''.$id_det_examen.'\',\''.$id_examen.'\')"><i class="fa-solid fa-trash-can"></i></button>';
      //   
$html.='<tr>

<td>'.$row["descripcion_examen"].'</td>
<td>'.$row["prueba_medica"].'</td>  
 
<td>'.$button.'</td>
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
?>
 