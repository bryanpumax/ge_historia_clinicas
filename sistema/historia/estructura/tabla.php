<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
//SELECT  from `` ;
$tabla="paciente";
$campos="DISTINCT paciente.cedula_paciente,paciente.nombre_paciente";
$where="   ";
$inner="INNER JOIN atencion on atencion.cedula_paciente=paciente.cedula_paciente";
$consulta=consultas("$tabla","$campos","$inner $where");
$html='
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Cedula</th>
    <th scope="col">Paciente</th> 
    <th scope="col">Accion</th> 
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
 
    $button='<button type="button" class="btn btn-outline-info" onclick="pdf(\''.$row["cedula_paciente"].'\')">
    <i class="fa-regular fa-file-pdf"></i>
    </button>'; 

    $button.='<button type="button" onclick="atencion_individual(\''.$row["cedula_paciente"].'\',\''.$row["nombre_paciente"].'\')" class="btn btn-outline-info">
    <i class="fa-solid fa-arrows-to-eye"></i>
    </button>'; 
$html.='<tr>

<td>'.$row["cedula_paciente"].'</td>
<td>'.$row["nombre_paciente"].'</td>
 
<td>'.$button.'</td>  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;
 