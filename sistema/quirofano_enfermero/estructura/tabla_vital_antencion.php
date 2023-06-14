<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
 $id_atencion=$_REQUEST["id_atencion"];
// SELECT `id_signos`, atencion.fecha_registrada,paciente.cedula_paciente,paciente.nombre_paciente,atencion.estado_paciente_inicio, `pulso`, `presion`, `respiracion`, `temperatura` FROM `signosvitales` INNER JOIN atencion on atencion.id_atencion=signosvitales.id_atencion INNER JOIN paciente on paciente.cedula_paciente =atencion.cedula_paciente;
$tabla="signosvitales";
$campos=" `id_signos`, signosvitales.fecha_registrada,paciente.cedula_paciente,paciente.nombre_paciente,atencion.estado_paciente_inicio, `pulso`, `presion`, `respiracion`, `temperatura` ";
$where="where  atencion.id_atencion='$id_atencion' ORDER BY `signosvitales`.`id_signos` DESC";
$inner="
INNER JOIN atencion on atencion.id_atencion=signosvitales.id_atencion
INNER JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente 
INNER JOIN usuario on usuario.id_usuario = atencion.id_usuario 
INNER JOIN tipo_atencion on tipo_atencion.id_tipo=atencion.id_tipo 
";
$consulta=consultas("$tabla","$campos","$inner $where"); 
$html='
<table class="table tabla_signos ">
<thead>
  <tr>
  
  <th scope="col">Fecha</th>
    <th scope="col">pulso</th>
   
        <th scope="col">presion</th>
    <th scope="col">respiracion</th>
    <th scope="col">temperatura</th> 
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
    // $button='<button onclick="vitales(\''.$row["id_atencion"].'\')" title="Signo Vitales">
    // <i class="fa-solid fa-heart"></i>
    // </button>';
    $button="";
$html.='<tr>
<td>'.$row["fecha_registrada"].'</td> 
<td>'.$row["pulso"].'</td> 
<td>'.$row["presion"].'</td>
<td>'.$row["respiracion"].'</td>
<td>'.$row["temperatura"].'</td>  
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;