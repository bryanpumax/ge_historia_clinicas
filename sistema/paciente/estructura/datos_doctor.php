<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 

//  SELECT `cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, medico.`id_especialidad`,especialidad.especialidad  FROM `medico`
//  INNER JOIN especialidad on especialidad.id_especialidad=medico.id_especialidad;
 $cedula_medico=$_REQUEST["cedula_medico"];
  
$tabla="medico";
$campo="
 `cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`,especialidad.especialidad , `estado_medico` 
";
$inner="INNER JOIN especialidad on especialidad.id_especialidad=medico.id_especialidad";
$where="$inner where medico.cedula_medico='$cedula_medico' "; 

$consulta=consultas($tabla, $campo, $where);
if ($consulta->rowCount()<1) {
    # code...
    echo '<i class="fa-solid fa-user-nurse fa-2x" ></i>';
    return;
} 
$row=$consulta->fetch();
$mensaje="";
$especialidad=$row["especialidad"];
$nombre_medico=$row["nombre_medico"];
if ($row["sexo_medico"]=="MASCULINO") {
    # code...
    $mensaje.=" El doctor de $especialidad : $nombre_medico ";
}else{
    $mensaje.=" La doctora de $especialidad : $nombre_medico ";
}
 

echo $mensaje;
?>
