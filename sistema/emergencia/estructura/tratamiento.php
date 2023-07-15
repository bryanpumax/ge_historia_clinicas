<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);  
 
$id_atencion=$_REQUEST["id_atencion"];
$tabla="detalle_tratamiento";
$campos="
id_detalle_tratamiento, detalle_tratamiento.id_tratamiento, hora_consumo, detalle_tratamiento.id_medicamento, id_atencion, tratamiento, estado_tratamiento, fecha_registrado, duracion,medicamento.descripcion,medicamento.forma
";
$where="where tratamiento.id_atencion='$id_atencion'";
$inner="
INNER JOIN tratamiento on tratamiento.id_tratamiento=detalle_tratamiento.id_tratamiento
INNER JOIN medicamento on medicamento.id_medicamento=detalle_tratamiento.id_medicamento
";
$consulta=consultas("$tabla","$campos","$inner $where");

$html='
<table class="table tbl_tratamiento ">
<thead>
  <tr>
  
    <th scope="col">Tratamiento</th>
    <th scope="col">Estado Tratamiento</th>
    <th scope="col">Fecha registrada</th> 
    <th scope="col">Duracion</th>
    <th scope="col">Medicamento</th>
    <th scope="col">Hora consumo</th>
    <th scope="col">Accion</th>
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
  $id_detalle_tratamiento=$row["id_detalle_tratamiento"];
  $id_tratamiento=$row["id_tratamiento"];
    $button='<button class="btn btn-outline-primary " title="eliminar tratamiento" onclick="eliminar_detalle_tratamiento(\''.$id_detalle_tratamiento.'\',\''.$id_tratamiento.'\')"><i class="fa-solid fa-trash-can"></i></button>';
 
      //   
$html.='<tr>

<td>'.$row["tratamiento"].'</td>
<td>'.$row["estado_tratamiento"].'</td>  
<td>'.$row["fecha_registrado"].'</td>
<td>'.$row["duracion"].'</td>
<td>'.$row["descripcion"]."<br>".$row["forma"].'</td> 
<td>'.$row["hora_consumo"].'</td> 
<td>'.$button.'</td>
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
?>
