<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);  
$cedula_usu=$_SESSION["cedula_usu"];
$tabla="atencion";
$campos="id_atencion,atencion. cedula_paciente as cedula_paciente, atencion.cedula_medico, atencion.id_usuario,atencion.id_tipo, estado_paciente_inicio, descripcion, fecha_inicio, fecha_fin, fecha_registrada ,paciente.nombre_paciente,medico.nombre_medico,case
when  medico.estado_medico= 'Co' THEN 'Consultorio'
when  medico.estado_medico= 'Em' THEN 'Emergencia'
when  medico.estado_medico= 'Hp' THEN 'Hospitilizacion'
when  medico.estado_medico= 'Qr' THEN 'Quirofano'
when  medico.estado_medico= 'Ca' THEN 'Casa'
end  as estado_medico,
usuario.nombre_usu,tipo_atencion.tipo_atencion";
$where="where atencion.id_tipo=1 and atencion.cedula_medico='$cedula_usu'";
$inner="
 INNER JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente
 INNER JOIN medico on medico.cedula_medico=atencion.cedula_medico
 INNER JOIN usuario on usuario.id_usuario = atencion.id_usuario
INNER JOIN tipo_atencion on tipo_atencion.id_tipo=atencion.id_tipo
";
$consulta=consultas("$tabla","$campos","$inner $where");
$html='
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Cedula</th>
    <th scope="col">Paciente</th>
    <th scope="col">Estado paciente</th> 
    <th scope="col">Nivel atencion</th>
    <th scope="col">Fecha</th>
    <th scope="col">Accion</th>
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
    $button='<button onclick="vitales(\''.$row["id_atencion"].'\')" title="Signo Vitales">
    <i class="fa-solid fa-heart"></i>
    </button>';
    $button.='<button onclick="tabla_antecedentes_familiarC(\''.$row["cedula_paciente"].'\')" title="Antecedentes">
    <i class="fa-solid fa-people-group"></i>
    </button>';
    $button.='<button onclick="tabla_alergia_paciente(\''.$row["cedula_paciente"].'\')" title="alergia">
    <i class="fa-solid fa-head-side-virus"></i>
    </button>';
    $button.='<button onclick="formulario_medico(\''.$row["id_atencion"].'\')" title="Atencion">
    <i class="fa-solid fa-person-dots-from-line"></i>
    </button>';
      //   
$html.='<tr>

<td>'.$row["cedula_paciente"].'</td>
<td>'.$row["nombre_paciente"].'</td>
<td>'.$row["estado_paciente_inicio"].'</td> 
<td>'.$row["tipo_atencion"].'</td>
<td>'.$row["fecha_registrada"].'</td> 
<td>'.$button.'</td>
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;