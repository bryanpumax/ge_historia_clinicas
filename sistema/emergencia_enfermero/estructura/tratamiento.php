<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);  
 
$id_atencion=$_REQUEST["id_atencion"];
$tabla="detalle_tratamiento";
$campos="
seguimiento_medicamento.id_seguimiento_medicamento,
detalle_tratamiento.id_detalle_tratamiento,concat(medicamento.descripcion,'/', medicamento.forma,'/',medicamento.concentracion ) as medicamento,usuario.nombre_usu,seguimiento_medicamento.fecha_suministrada,seguimiento_medicamento.hora_suministrada,case
when  seguimiento_medicamento.donde= 'Co' THEN 'Consultorio' 
when seguimiento_medicamento.donde= 'Em' THEN 'Emergencia'  
when  seguimiento_medicamento.donde= 'Hp' THEN 'Hospitilizacion'
when  seguimiento_medicamento.donde= 'Qr' THEN 'Quirofano'   
when  seguimiento_medicamento.donde= 'Ca' THEN 'Casa'    
end  as donde  
,case
when  seguimiento_medicamento.dosis= '1' THEN 'Desayuno' 
when seguimiento_medicamento.dosis= '2' THEN 'Almuerzo'  
when  seguimiento_medicamento.dosis= '3' THEN 'Cena'  
end  as dosis  
";
$where="where tratamiento.id_atencion='$id_atencion' and estado_tratamiento in ('Inicia','Continua')  
ORDER BY `seguimiento_medicamento`.`id_seguimiento_medicamento` DESC
";
$inner="
INNER JOIN tratamiento on tratamiento.id_tratamiento=detalle_tratamiento.id_tratamiento
INNER JOIN medicamento on medicamento.id_medicamento=detalle_tratamiento.id_medicamento 
INNER JOIN seguimiento_medicamento on seguimiento_medicamento.id_detalle_tratamiento=detalle_tratamiento.id_detalle_tratamiento
INNER JOIN usuario on usuario.id_usuario=seguimiento_medicamento.id_usuario
";
$consulta=consultas("$tabla","$campos","$inner $where");
$html='
<table class="table tbl_tratamiento ">
<thead>
  <tr> 
    <th scope="col">Medicamento</th> 
    <th scope="col">Fecha suministrada</th> 
    <th scope="col">hora suministrada</th> 
    <th scope="col">Donde suministrado</th> 
    <th scope="col">Dosis suministrado</th> 
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
  $id_detalle_tratamiento=$row["id_detalle_tratamiento"]; 
 $id_seguimiento_medicamento=$row["id_seguimiento_medicamento"];
      //   
$html.='<tr title="'.$id_seguimiento_medicamento.'">
  
<td>'.$row["medicamento"].'</td>  
<td>'.$row["fecha_suministrada"].'</td>  
<td>'.$row["hora_suministrada"].'</td> 
<td>'.$row["donde"].'</td>  
<td>'.$row["dosis"].'</td>  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
?>
