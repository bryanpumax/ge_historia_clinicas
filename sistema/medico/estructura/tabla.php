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
when  medico.estado_medico= 'Casa' THEN 'Casa'
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
    <th scope="col">Usuario</th> 
    <th scope="col">Accion</th> 
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
 
    $button=estado($row["cedula_medico"]);
    $usuario_usuario=usuario($row["cedula_medico"]);
$html.='<tr>

<td>'.$row["cedula_medico"].'</td>
<td>'.$row["nombre_medico"].'</td>
<td>'.$row["especialidad"].'</td>
<td>'.$row["estado_medico"].'</td>  
<td>'.$usuario_usuario.'</td>  
<td>'.$button.'</td>  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;

function estado($cedula)
{
  # code...
  $tabla="usuario";
$campos="estado_usu";
$where="where cedula_usu='$cedula' ";
$inner="";
$consulta=consultas("$tabla","$campos","$inner $where");
$row=$consulta->fetch();
$button="";
switch ($row['estado_usu']) {
  case 'A':
    $button='<button class="btn btn-outline-danger" onclick="estado(\''.$cedula.'\',\'D\')" title="Signo Vitales">
    <i class="fa-solid fa-unlock"></i>
    </button>';
    break;
  
case 'D':
  $button='<button class="btn btn-outline-secondary" onclick="estado(\''.$cedula.'\',\'A\')" title="Signo Vitales">
  <i class="fa-solid fa-lock"></i>
  </button>';
  break;
}
return $button;
}

function usuario($cedula)
{
  # code...
  $tabla="usuario";
$campos="usuario_usuario";
$where="where cedula_usu='$cedula' ";
$inner="";
$consulta=consultas("$tabla","$campos","$inner $where");
$row=$consulta->fetch();
 return $row["usuario_usuario"];
}