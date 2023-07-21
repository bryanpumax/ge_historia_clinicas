<?php
include("../../conexion/interacion.php");
$cedula_paciente=$_REQUEST["cedula_paciente"];
//SELECT `id_antecedentes`, `tipo_enfermedad`, `fecha_dianostico`, `tratamiento_recibido`, `estado_actual`, `parentesco_familiar`, `nombre_familiar`, `antecedentes_enf_familia`, `cedula_paciente` FROM `antecedentes_paciente` WHERE cedula_paciente=''
$tabla="antecedentes_paciente";
$campo=" `id_antecedentes`, `tipo_enfermedad`, `fecha_dianostico`, `tratamiento_recibido`, `estado_actual`, `parentesco_familiar`, `nombre_familiar`, `antecedentes_enf_familia`, `cedula_paciente`";
$where="where cedula_paciente='$cedula_paciente'"; 
$consulta=consultas($tabla, $campo, $where);
$html='
<button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
<table class="table table_antecedentes_paciente ">
<thead>
  <tr>
    <th scope="col">#</th>
    <th scope="col">Enfermedad</th>
    <th scope="col">Fecha</th>
    <th scope="col">Parentesco</th> 
  </tr>
</thead>
<tbody >
  

';
$i=1;
 
while ($row=$consulta->fetch()) {
  
$html.='<tr>
<td>'.$i.'</td>
<td>'.$row["tipo_enfermedad"].'</td>
<td>'.$row["fecha_dianostico"].'</td>
<td>'.$row["parentesco_familiar"].'</td> 
</tr>
';
$i++;
}

$html.='</tbody>
</table>';
echo $html;  