<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 

//  SELECT `cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, medico.`id_especialidad`,especialidad.especialidad  FROM `medico`
//  INNER JOIN especialidad on especialidad.id_especialidad=medico.id_especialidad;
 
  
$tabla="especialidad";
$campo="  `id_especialidad`, `especialidad`";
$inner="";
$where="$inner "; 
$consulta=consultas($tabla, $campo, $where);
$html='<option value="0">Elige especialidad para doctor</option>';
while ($row=$consulta->fetch()) {
    # code...
$html.='<option value="'.$row["id_especialidad"].'">'.$row["especialidad"].'</option>';
}
echo $html;
?>
