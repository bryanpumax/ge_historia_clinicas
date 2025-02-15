<?php
include "sistema/conexion/interacion.php";
$cedula=$_REQUEST["cedula"];
$dominio='https://hospitalclinicosantalucia.com/';
$dominio2='https://hospitalclinicosantalucia.com/sistema/php/labqr.php';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include("./assets/estructura_inicio.php");
//  SELECT atencion.cedula_paciente,examen.descripcion_examen,examen.estado from examen inner JOIN atencion on atencion.id_atencion=examen.id_atencion WHERE atencion.cedula_paciente='1720836400' and examen.estado='Activo';
$tabla = "examen";
$campos = " atencion.cedula_paciente,examen.descripcion_examen,examen.estado,examen.id_examen,paciente.nombre_paciente 
    ";
$inner = " inner JOIN atencion on atencion.id_atencion=examen.id_atencion INNER JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente";
$where = " WHERE atencion.cedula_paciente='$cedula' and examen.estado in ('Activo','Inactivo')";
$consulta = consultas("$tabla", "$campos", "$inner $where");
$row=$consulta->fetch();
$nombre_paciente=$row["nombre_paciente"];
$codigo=codigo($row["id_examen"]);
$id_examen=($row["id_examen"]);

//  SELECT atencion.cedula_paciente,detalle_examen.id_det_examen,detalle_examen.id_examen,examen.descripcion_examen,examen.estado,Prueba_medica.prueba_medica from examen
// inner JOIN atencion on atencion.id_atencion=examen.id_atencion
// INNER JOIN detalle_examen on detalle_examen.id_examen=examen.id_examen
// INNER JOIN Prueba_medica on Prueba_medica.id_pr_medica=detalle_examen.id_pr_medica
// WHERE atencion.cedula_paciente='1720836400' and examen.estado='Activo';
$tabla = "examen";
$campos = " atencion.cedula_paciente,detalle_examen.id_det_examen,detalle_examen.id_examen,examen.descripcion_examen,examen.estado,Prueba_medica.prueba_medica";
$inner =" inner JOIN atencion on atencion.id_atencion=examen.id_atencion";
$inner .=" INNER JOIN detalle_examen on detalle_examen.id_examen=examen.id_examen ";
$inner .=" INNER JOIN Prueba_medica on Prueba_medica.id_pr_medica=detalle_examen.id_pr_medica ";
$where = " WHERE atencion.cedula_paciente='$cedula' and examen.estado='Activo'";
$consulta = consultas("$tabla", "$campos", "$inner $where");
$con=$consulta->rowcount();

$html="";$i=1;
while ($row=$consulta->fetch()) {
  
    $html.='<div class="form-floating mb-1 col-6">
    <input type="text" class="form-control" id="'.$i.'" name="'.$i.'" placeholder="name@example.com" data-detalle="'.$row["id_det_examen"].'" value="'.valor_input($row["id_det_examen"]).'">
    <label for="floatingInput">'.$row["prueba_medica"].'</label>
  </div>';
  $i++;

}
?>
<nav class="navbar bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="https://hospitalclinicosantalucia.com/assets/multimedia/logo.png" alt="Logo" width="100" height="60" class="d-inline-block align-text-top">
      Clinica Santa Lucia
    </a>
  </div>
</nav>
<div class="card">
Codigo examen <?=$codigo?><br>
Nombre paciente <?=$nombre_paciente?> <br>
<?php
if ($con==0) {
  # code...
  ?>
<div class="row">
 El examen  se  encuentra  inactivo quieres  habilitar llamar  clinica Santa Lucia
</div>
  <?php
  return;
}
?>
<div class="row">
<?=$html?>
</div>

<div class="mt-2"><button class="btn btn-primary" onclick="guardar_resultados()">Guardar</button></div>
</div>
<?php
function codigo( $var)
{
    $numero = 10;
$numeroConCeros = str_pad($var, $numero, "0", STR_PAD_LEFT);

return $numeroConCeros;
   
}
function valor_input($id_det_examen)
{
  $tabla = "resultado";
  $campos = " valor"; 
  $where = " WHERE id_det_examen='$id_det_examen'";
  $consulta = consultas("$tabla", "$campos", " $where");
$row=$consulta->fetch();
if( is_array($row)) {
  return $row["valor"];
 
}

}
function valor_input2($id_det_examen)
{
  $tabla = "resultado";
  $campos = " valor"; 
  $where = " WHERE id_det_examen='$id_det_examen'";
  $consulta = consultasp("$tabla", "$campos", " $where");
// $row=$consulta->fetch();
// return $row["valor"];
return $consulta;
}
include("./assets/estructura_fin.php");
?>
<script>

  function guardar_resultados() {
    var canti=$(".form-control").length;
    var id_examen="<?=$id_examen?>" ;
    var variable="id_examen="+id_examen+"&canti="+canti;
for (let index = 1;index <= canti ; index++){
 variable+="&iddetalle"+index+"="+$("#"+index).data("detalle")+"&value"+index+"="+$("#"+index).val();;
    }
 $.ajax({
  type: "POST",
  url: "<?=$dominio2?>",
  data: variable, 
  success: function (response) {
    alert_bonita("success","Clinica Santa Lucia","Se registro correctamente");
    setInterval(() => {
      location.href="<?=$dominio?>"
    }, 8000);
   
  }
 });
  }

</script>