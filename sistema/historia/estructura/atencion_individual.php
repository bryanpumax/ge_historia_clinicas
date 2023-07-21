<?php
 include "../../conexion/interacion.php";
 session_start();
 
//SELECT  from `` ;
$cedula=$_REQUEST["cedula"];
$tabla="paciente";
$campos="`cedula_paciente`, `nombre_paciente`, CASE WHEN sexo_paciente='MASCULINO' THEN 'M' else 'F' END as sexo_paciente, `fecha_nacimiento`, `estado_civil`, `tipo_sangre`, `telefono_paciente`";
$where=" where cedula_paciente='$cedula'  ";
$inner="";
$consulta=consultas("$tabla","$campos","$inner $where");
$row=$consulta->fetch();
$nombre_paciente=$row["nombre_paciente"];$sexo_paciente=$row["sexo_paciente"];$fecha_nacimiento=$row["fecha_nacimiento"];$estado_civil=$row["estado_civil"];$tipo_sangre=$row["tipo_sangre"];$telefono_paciente=$row["telefono_paciente"];
$cedula=$_REQUEST["cedula"];
$tabla="atencion";
$campos="UPPER(`descripcion`) as descripcion , `fecha_inicio`, `fecha_fin`,id_atencion";
$where=" where cedula_paciente='$cedula' and  descripcion!='' ";
$inner="";
$consultaDiagnostico=consultas("$tabla","$campos","$inner $where");
$consultaDiagnostico2=consultas("$tabla","$campos","$inner $where");
$tabla="alergias";
$campos="UPPER(`alergias`) as alergias , gravedad ";
$where=" where cedula_paciente='$cedula' ";
$inner="";
$consultaAlergia=consultas("$tabla","$campos","$inner $where");

$tabla="antecedentes_paciente";
$campos="`tipo_enfermedad`, `tratamiento_recibido`, `estado_actual`, parentesco_familiar";
$where=" where cedula_paciente='$cedula' ";
$inner="";
$consultaAntecedentes=consultas("$tabla","$campos","$inner $where");
?>                                    
<button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
<br> 
  <table class="table  table-bordered mt-5">
    <tr>
    <td   >Cedula</td><td   ><?=$cedula?></td>
        <td   >Nombre Apellido</td><td  colspan="5"><?=$nombre_paciente?></td>
    </tr>
   <tr>
    <td  >Sexo</td>
    <td  ><?=$sexo_paciente?></td>
    <td  >Tipo de sangre</td>
    <td  ><?=$tipo_sangre?></td>
    <td  >Fecha de nacimiento</td>
    <td  ><?=$fecha_nacimiento?></td>
    <td  >Telefono</td>
    <td  ><?=$telefono_paciente?></td>
   </tr>
  
  </table>
<br> 
<table class="table table-bordered mb-5  mt-5 smallmega"> 
<thead>
<th>Alergia</th>

<th>Gravedad</th> 
</thead>
<tbody>
<?php
$html="";
while ($row=$consultaAlergia->fetch()) {
$html.='<tr> 
<td >'.$row["alergias"].'</td>
<td >'.$row["gravedad"].'</td> 
</tr>
';
}
echo $html;
?>
</tbody>
</table>
<br>
<table class="table table-bordered mb-5  mt-5 smallmega"> 
<thead>
<th >Antecedentes</th>

<th>tratamiento recibido</th> 
<th>Estado</th>
<th >Familiar</th>
</thead>
<tbody>
<?php
$html="";
while ($row=$consultaAntecedentes->fetch()) {
$html.='<tr> 
<td >'.$row["tipo_enfermedad"].'</td>
<td>'.$row["tratamiento_recibido"].'</td> 
<td>'.$row["estado_actual"].'</td> 
<td >'.$row["parentesco_familiar"].'</td> 
</tr>
';
}
$html.='</tbody>
</table><br>';
echo $html;


$i=1; 
$html="";
$html='  <table class="table table-bordered mb-5  mt-5 smallmega">
<thead>
<th >Diagnostico</th>

<th>Fecha inicio</th> 
<th>Fecha Fin </th> 
</thead>
<tbody>
';
while ($row=$consultaDiagnostico->fetch()) {
$id_atencion=$row["id_atencion"];

$html.='
<tr>
<td> '.$row["descripcion"].'
</td>

<td > '.$row["fecha_inicio"].'</td>
<td >  '.$row["fecha_fin"].'</td> 
</tr>
';

  

}
$html.='<tbody> </table><br> ';
echo $html;
while ($row=$consultaDiagnostico2->fetch()) {
  $id_atencion=$row["id_atencion"]; 
   echo tratamiento($row["descripcion"],$id_atencion); 
   echo  examen($row["descripcion"],$id_atencion); 
  }


?>

<?php
function tratamiento($descripcions,$id_atencion)
{

$tabla="tratamiento";
$campos="`tratamiento`,concat(medicamento.descripcion,' ',medicamento.forma,' ',medicamento.concentracion) as medicamento";
$where="  WHERE tratamiento.id_atencion=$id_atencion";
$inner="INNER JOIN detalle_tratamiento on detalle_tratamiento.id_tratamiento=tratamiento.id_tratamiento
INNER JOIN medicamento on medicamento.id_medicamento=detalle_tratamiento.id_medicamento";
$consulta=consultas("$tabla","$campos","$inner $where"); 
$html='   <table class="table table-bordered mb-5  mt-5 smallmega">  ';
 
$html.='     
<thead class=" ">
 
<th ><strong>Tratamiento de '.$descripcions.'</strong></th>
<th ><strong>Medicamento</strong></th>  
 
</thead>
<tbody >

';
$i=1; 
while ($row=$consulta->fetch()) {
$html.='<tr>
<td >'.$row["tratamiento"].'</td>
<td >'.$row["medicamento"].'</td>
</tr>'; 
}

$html.='</tbody>';
$html.='</table> <br> ';
return $html;
}

function examen($descripcions,$id_atencion)
{

$tabla="examen";
$campos="concat(examen.descripcion_examen,' ') as descripcion_examen,atencion.fecha_registrada,id_examen";
$where="  where examen.id_atencion=$id_atencion ";
$inner="  INNER JOIN atencion on atencion.id_atencion=examen.id_atencion ";
$consulta=consultas("$tabla","$campos","$inner $where");
$consulta2=consultas("$tabla","$campos","$inner $where");
$html=' <br>  <table class="table table-bordered mb-5  mt-5 smallmega">  ';
$html.='   
<thead class=" ">
 

  <th ><strong>Examen de '.$descripcions.'</strong></th> 
  <th ><strong>Fecha</strong></th>  
 
</thead>
<tbody >
';
$i=1; 
while ($row=$consulta->fetch()) {
$descripcion=$row["descripcion_examen"];
$id_examen=$row["id_examen"]; 

$html.='<tr class=" "> 
<td >'.$row["descripcion_examen"].'</td> 
<td >'.$row["fecha_registrada"].'</td> 

</tr>

';

 
}

$html.='</tbody> ';
$html.='</table><br>';
echo $html;
while ($row=$consulta2->fetch()) {
  $descripcion=$row["descripcion_examen"];
  $id_examen=$row["id_examen"];  
   echo detalle_examen($descripcion,$id_examen);
  }
  



}

function detalle_examen($descripcions,$id_examen)
{

$tabla="detalle_examen";
$campos="Prueba_medica.prueba_medica,resultado.valor";
$where="  where detalle_examen.id_examen=$id_examen ";
$inner="  INNER JOIN Prueba_medica on Prueba_medica.id_pr_medica=detalle_examen.id_pr_medica
INNER JOIN resultado on resultado.id_det_examen=detalle_examen.id_det_examen ";
$consulta=consultas("$tabla","$campos","$inner $where");
$html=' <br> <table class="table table-bordered mb-5  mt-5 smallmega">  ';
$html.='  
<thead class=" ">
 

  <th ><strong>Prueba de '.$descripcions.'</strong></th> 
  <th ><strong>Resultado</strong></th>  
 
</thead>
<tbody >

';
$i=1; 
while ($row=$consulta->fetch()) {
 
$html.='<tr class=" "> 
<td >'.$row["prueba_medica"].'</td> 
<td >'.$row["valor"].'</td>  
</tr>
';
$i++;
}

$html.='</tbody> ';
$html.='</table> <br>';
echo $html;

}