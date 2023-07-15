<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
//SELECT  from `` ;
$tabla="medico";
$campos="`cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, especialidad.especialidad, 
case
when  medico.estado_medico= 'Co' THEN 'Consultorio'
when  medico.estado_medico= 'Em' THEN 'Emergencia'
when  medico.estado_medico= 'Hp' THEN 'Hospitilizacion'
when  medico.estado_medico= 'Qr' THEN 'Quirofano'
when  medico.estado_medico= 'Ca' THEN 'Casa'
end  as estado_medico";
$where=" ORDER BY `medico`.`sexo_medico` ASC  ";
$inner="INNER JOIN especialidad on especialidad.id_especialidad=medico.id_especialidad";
$consulta=consultas("$tabla","$campos","$inner $where");
$html='
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Cedula</th>
    <th scope="col">Doctor</th>
    <th scope="col">Especialidad</th>
    <th scope="col">¿Donde esta?</th> 
   
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
    $button='<button onclick="vitales(\''.$row["cedula_medico"].'\')" title="Signo Vitales">
    <i class="fa-solid fa-heart"></i>
    </button>';
$html.='<tr>

<td>'.$row["cedula_medico"].'</td>
<td>'.$row["nombre_medico"].'</td>
<td>'.$row["especialidad"].'</td>
<td>'.$row["estado_medico"].'</td>  
 
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;