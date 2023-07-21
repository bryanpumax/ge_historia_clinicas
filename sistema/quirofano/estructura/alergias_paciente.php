<?php
include("../../conexion/interacion.php");
$cedula_paciente=$_REQUEST["cedula_paciente"];

$tabla="alergias";
$campo="`id_alergias`, `alergias`, `gravedad`, `cedula_paciente`";
$where="where cedula_paciente='$cedula_paciente'"; 
$consulta=consultas($tabla, $campo, $where);
$html='
<button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
<table class="table table_alergia ">
<thead>
  <tr>
    <th scope="col">#</th>
    <th scope="col">Alergia</th>
    <th scope="col">Gravedad</th> 
  </tr>
</thead>
<tbody class="alergia_paciente">
  

';
$i=1;
 
while ($row=$consulta->fetch()) {
    $button='<button onclick="eliminar_alergia(\''.$row["id_alergias"].'\')">
    <i class="fa-solid fa-trash-can"></i>
    </button>';
$html.='<tr>
<td>'.$i.'</td>
<td>'.$row["alergias"].'</td>
<td>'.$row["gravedad"].'</td> 
</tr>
';
$i++;
}

$html.='</tbody>
</table>';
echo $html;  