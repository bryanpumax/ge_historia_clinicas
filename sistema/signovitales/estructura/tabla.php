<?php
 include "../../conexion/interacion.php";
 session_start();
 
$tabla="signosvitales";
$campos=" `id_signos`, atencion.fecha_registrada,paciente.cedula_paciente,paciente.nombre_paciente,atencion.estado_paciente_inicio, `pulso`, `presion`, `respiracion`, `temperatura` ";
$where="where  tipo_atencion.tipo_atencion!='Casa' and  fecha_registrada=curdate()";
$inner="
INNER JOIN atencion on atencion.id_atencion=signosvitales.id_atencion
INNER JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente 
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
 
    $button="";
$html.='<tr>

<td>'.$row["cedula_paciente"].'</td>
<td>'.$row["nombre_paciente"].'</td>
<td>'.$row["estado_paciente_inicio"].'</td>
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