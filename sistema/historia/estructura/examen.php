<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
//SELECT  from `` ;
$id_atencion=$_REQUEST["id_atencion"];
$tabla="examen";
$campos="concat(examen.descripcion_examen,' ') as descripcion_examen,atencion.fecha_registrada,id_examen";
$where="  where examen.id_atencion=$id_atencion ";
$inner="  INNER JOIN atencion on atencion.id_atencion=examen.id_atencion ";
$consulta=consultas("$tabla","$campos","$inner $where");
$html=' <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Examen</th> 
    <th scope="col">Fecha</th> 
    <th scope="col">Accion</th> 
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
 $descripcion=$row["descripcion_examen"];
 $id_examen=$row["id_examen"];
    $button='<button type="button" class="btn btn-outline-info" onclick="detalle_examen(\''.$id_examen.'\',\''.$descripcion.'\')">
    <i class="fa-solid fa-lungs-virus"></i>
    </button>'; 

  
$html.='<tr>

<td>'.$row["descripcion_examen"].'</td> 
<td>'.$row["fecha_registrada"].'</td> 

<td>'.$button.'</td>  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
 