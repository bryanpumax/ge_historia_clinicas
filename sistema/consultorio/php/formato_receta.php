<?php
session_start();
include "../../conexion/interacion.php";
$dominio = "";
$nombreImagen = "https://hospital.lab-mrtecks.com/assets/multimedia/logo2_imprimir.jpg";
$dominio = "data:image/png;base64," . base64_encode(file_get_contents($nombreImagen));
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$id_atencion = $_SESSION["id_atencion"];

$tabla = "atencion";
$campos = " medico.nombre_medico,medico.sexo_medico, 
CASE 
WHEN medico.sexo_medico='Masculino' then 'Dr.' 
WHEN medico.sexo_medico='Femenino' then 'Dra.' 
END as inicialsexo
 ,especialidad.especialidad ";
$inner = "INNER JOIN  paciente  on  paciente.cedula_paciente=atencion.cedula_paciente
INNER JOIN medico on medico.cedula_medico=atencion.cedula_medico
INNER JOIN especialidad on especialidad.id_especialidad=medico.id_especialidad";
$where = "where atencion.id_atencion=$id_atencion";
$consulta = consultas("$tabla", "$campos", "$inner $where");
$row = $consulta->fetch();
$nombre_medico = $row["nombre_medico"];
$inicialsexo = $row["inicialsexo"];
include "receta_medica_estilo.php";
?>
 

<!-- <div class="container">
       <div class="row">
<div class="col">
<img src="<?= $dominio ?>" alt="" srcset="" style="width: 30%;
    height: 30%;">

</div>
<div class="col">
<?= $inicialsexo . " " . $nombre_medico ?>
</div>
       </div>
  
    </div> -->

    <div class="row">
  <div class="col-sm-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Panel 1</h3>
      </div>
      <div class="panel-body">
        Contenido del panel 1
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Panel 2</h3>
      </div>
      <div class="panel-body">
        Contenido del panel 2
      </div>
    </div>
  </div>
</div>
