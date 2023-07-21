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
    <th scope="col">Usuario</th> 
    <th scope="col">Accion</th> 
   
  </tr>
</thead>
<tbody >
  
';
$i=1; 
while ($row=$consulta->fetch()) {
  $button=estado($row["cedula_usu"]);
$html.='<tr>

<td>'.$row["cedula_usu"].'</td>
<td>'.$row["nombre_usu"].'</td> 
<td>'.$row["usuario_usuario"].'</td> 
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
 