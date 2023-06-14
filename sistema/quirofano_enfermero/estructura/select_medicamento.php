<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 

//  SELECT `cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, medico.`id_especialidad`,especialidad.especialidad  FROM `medico`
//  INNER JOIN especialidad on especialidad.id_especialidad=medico.id_especialidad;
 
$id_atencion=$_REQUEST["id_atencion"];
$tabla="detalle_tratamiento";
$campos="
id_detalle_tratamiento, detalle_tratamiento.id_tratamiento, hora_consumo, detalle_tratamiento.id_medicamento, id_atencion, tratamiento, estado_tratamiento, fecha_registrado, duracion,medicamento.descripcion,medicamento.forma,medicamento.concentracion 
";
$where="where tratamiento.id_atencion='$id_atencion' and estado_tratamiento in ('Inicia','Continua')";
$inner="
INNER JOIN tratamiento on tratamiento.id_tratamiento=detalle_tratamiento.id_tratamiento
INNER JOIN medicamento on medicamento.id_medicamento=detalle_tratamiento.id_medicamento
";
$consulta=consultas("$tabla","$campos","$inner $where");
$html='<option value="0">Seleccione medicamento</option>';
while ($row=$consulta->fetch()) {
    # code...
$html.='<option value="'.$row["id_detalle_tratamiento"].'">'.$row["descripcion"]."/".$row["forma"]."/".$row["concentracion"].'</option>';
}
echo $html;
?>
