<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
//SELECT  from `` ;
$tabla="usuario";
$campos="`cedula_usu`, `nombre_usu`, `estado_usu`, `usuario_usuario`, `contrase`, `id_rol`";
$where="where    id_rol=2"; 
$consulta=consultas("$tabla","$campos"," $where");
$html='
<table class="table tabla_atencion ">
<thead>
  <tr>
  
    <th scope="col">Cedula</th>
    <th scope="col">Enfermero</th> 
   
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
   
$html.='<tr>

<td>'.$row["cedula_usu"].'</td>
<td>'.$row["nombre_usu"].'</td> 
 
</tr>
';
$i++;
}

$html.='</tbody>
</table>';

echo $html;