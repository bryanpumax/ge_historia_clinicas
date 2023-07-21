<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
//SELECT  from `` ;
$id_atencion=$_REQUEST["id_atencion"];
$tabla="detalle_examen";
$campos="Prueba_medica.prueba_medica,resultado.valor";
$where="  where detalle_examen.id_examen=$id_atencion ";
$inner="  INNER JOIN Prueba_medica on Prueba_medica.id_pr_medica=detalle_examen.id_pr_medica
INNER JOIN resultado on resultado.id_det_examen=detalle_examen.id_det_examen ";
$consulta=consultas("$tabla","$campos","$inner $where");
$html=' <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Prueba</th> 
    <th scope="col">REsultado</th>  
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
 
    

  
$html.='<tr>

<td>'.$row["prueba_medica"].'</td> 
<td>'.$row["valor"].'</td> 
  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
 