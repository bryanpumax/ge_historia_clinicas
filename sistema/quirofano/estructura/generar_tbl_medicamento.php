<?php
 include "../../conexion/interacion.php";
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);  
 $tabla="medicamento";
$campos=" id_medicamento,codigo, descripcion, forma, concentracion, viaadmin, indicaciones";
$where="where codigo!='Código'";
$inner="";
$consulta=consultas("$tabla","$campos","$inner $where");
$html='<table class="table tbl_medicamento table-striped table-bordered " >
<thead>
  <tr>
  <th scope="col">#</th>
    <th scope="col">Codigo</th>
    <th scope="col">Descripcion</th>
    <th scope="col">Forma</th>
    <th scope="col">Indicaciones</th>
  </tr>
</thead>
<tbody>';
while ($row=$consulta->fetch()) {
  $id_medicamento=$row["id_medicamento"];
  $codigo=$row["codigo"];
  $descripcion=$row["descripcion"];
  $forma=$row["forma"]; 
  $indicaciones=$row["indicaciones"];
  
  $param="'$id_medicamento','$codigo','$descripcion','$forma'";

    $input='  <input class="form-check-input  id_medicamento'.$id_medicamento.'" type="checkbox" 
    id="id_medicamento'.$id_medicamento.'" name="id_medicamento'.$id_medicamento.'"
     onclick="medicamento_seleccionado('.$param.')">';
    $html.='<tr>
    <td>'.$input.'</td>
    <td>'.$codigo.'</td>
    <td>'.$descripcion.'</td>
    <td>'.$forma.'</td>
    <td>'.$indicaciones.'</td>
</tr>';
}  

$html.='</tbody>
</table>';
echo $html;
 