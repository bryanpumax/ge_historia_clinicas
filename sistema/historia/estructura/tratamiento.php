<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
//SELECT  from `` ;
$id_atencion=$_REQUEST["id_atencion"];
$tabla="tratamiento";
$campos="`tratamiento`,concat(medicamento.descripcion,' ',medicamento.forma,' ',medicamento.concentracion) as medicamento";
$where="  WHERE tratamiento.id_atencion=$id_atencion";
$inner="INNER JOIN detalle_tratamiento on detalle_tratamiento.id_tratamiento=tratamiento.id_tratamiento
INNER JOIN medicamento on medicamento.id_medicamento=detalle_tratamiento.id_medicamento";
$consulta=consultas("$tabla","$campos","$inner $where"); 
$html=' <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Tratamiento</th>
    <th scope="col">Medicamento</th>  
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
 
  
$html.='<tr>

<td>'.$row["tratamiento"].'</td>
<td>'.$row["medicamento"].'</td>
  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
 