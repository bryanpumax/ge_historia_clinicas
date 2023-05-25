<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
$cedula_paciente=$_REQUEST["cedula_paciente"];
 
$tabla="contacto";
$campo=" id_contacto,`cedula_contacto`, `nombre_contacto`, `telefono`, `parentesco`, `cedula_paciente`";
$where="where cedula_paciente='$cedula_paciente'"; 
$consulta=consultas($tabla, $campo, $where);
$html='
<table class="table table_contactos ">
<thead>
  <tr>
    <th scope="col">#</th>
    <th scope="col">Cedula</th>
    <th scope="col">Nombre</th>
    <th scope="col">Parentesco</th>
    <th scope="col">Telefono</th>
    <th scope="col">Accion</th>
  </tr>
</thead>
<tbody >
  

';
$i=1; 
while ($row=$consulta->fetch()) {
    $button='<button onclick="eliminar_contacto(\''.$row["id_contacto"].'\')">
    <i class="fa-solid fa-trash-can"></i>
    </button>';
$html.='<tr>
<td>'.$i.'</td>
<td>'.$row["cedula_contacto"].'</td>
<td>'.$row["nombre_contacto"].'</td>
<td>'.$row["parentesco"].'</td>
<td>'.$row["telefono"].'</td>
<td>'.$button.'</td>
</tr>
';
$i++;
}

$html.='</tbody>
</table>';
echo $html;  