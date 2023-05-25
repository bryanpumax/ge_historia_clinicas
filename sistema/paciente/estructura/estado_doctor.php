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
case
when  medico.estado_medico= 'Co' THEN 'primary'
when  medico.estado_medico= 'Em' THEN 'secondary'
when  medico.estado_medico= 'Hp' THEN 'success'
when  medico.estado_medico= 'Qr' THEN 'danger'
when  medico.estado_medico= 'Ca' THEN 'warning'
end  as color,
case
when  medico.estado_medico= 'Co' THEN 'Consultorio'
when  medico.estado_medico= 'Em' THEN 'Emergencia'
when  medico.estado_medico= 'Hp' THEN 'Hospitilizacion'
when  medico.estado_medico= 'Qr' THEN 'Quirofano'
when  medico.estado_medico= 'Ca' THEN 'Casa'
end  as estado_medico,

case
when  medico.estado_medico= 'Co' THEN '<i class=\"fa-solid fa-stethoscope fa-2x\"></i>'
when  medico.estado_medico= 'Em' THEN '<i class=\"fa-solid fa-truck-medical fa-2x\"></i>'
when  medico.estado_medico= 'Hp' THEN '<i class=\"fa-solid fa-hospital fa-2x\"></i>'
when  medico.estado_medico= 'Qr' THEN '<i class=\"fa-solid fa-radiation fa-2x\"></i>'
when  medico.estado_medico= 'Ca' THEN '<i class=\"fa-solid fa-house fa-2x\"></i>'
end  as icono
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
$html='<p class="link-'.$row["color"].'">'.$row["icono"].' '.$row["estado_medico"].' </p>';

 $id_usuario=$_SESSION["id_usuario"];
$visor_array = array();
array_push($visor_array, array(  "estado"=>$html,"id_usuario"=>$id_usuario ));
 
echo json_encode($visor_array);   
