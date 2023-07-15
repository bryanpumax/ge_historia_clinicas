<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);  
$cedula_usu=$_SESSION["cedula_usu"];
$tabla="atencion";
$campos="DISTINCT  atencion.id_atencion,atencion. cedula_paciente as cedula_paciente, atencion.cedula_medico, atencion.id_usuario,atencion.id_tipo, estado_paciente_inicio, descripcion, fecha_inicio, fecha_fin,atencion.fecha_registrada as fecha_registrada ,paciente.nombre_paciente,medico.nombre_medico,case
when  medico.estado_medico= 'Co' THEN 'Consultorio'
when  medico.estado_medico= 'Em' THEN 'Emergencia'
when  medico.estado_medico= 'Hp' THEN 'Hospitilizacion'
when  medico.estado_medico= 'Qr' THEN 'Quirofano'
when  medico.estado_medico= 'Ca' THEN 'Casa'
end  as estado_medico,
usuario.nombre_usu,tipo_atencion.tipo_atencion";
$where="where atencion.id_tipo in (1,2,3,4,5) and atencion.cedula_medico='$cedula_usu'    ORDER BY `examen`.`id_examen` DESC";
$inner="
 INNER JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente
 INNER JOIN medico on medico.cedula_medico=atencion.cedula_medico
 INNER JOIN usuario on usuario.id_usuario = atencion.id_usuario
INNER JOIN tipo_atencion on tipo_atencion.id_tipo=atencion.id_tipo
INNER JOIN examen on examen.id_atencion=atencion.id_atencion
";
$consulta=consultas("$tabla","$campos","$inner $where"); 
$html='
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Cedula</th>
    <th scope="col">Paciente</th>
    <th scope="col">Fecha-tratamiento</th>
    <th scope="col">Accion</th>
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
    $button='<button onclick="imprimir_examen(\''.$row["id_atencion"].'\')" title="">
    <i class="fa-regular fa-file-pdf"></i>
    </button>';
  
      //   
$html.='<tr>

<td>'.$row["cedula_paciente"].'</td>
<td>'.$row["nombre_paciente"].'</td>
<td>'.$row["fecha_registrada"].'</td> 
<td>'.$button.'</td>
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;