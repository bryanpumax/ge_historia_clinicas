<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$cedula_usu = $_SESSION['cedula_usu'];
$id_rol = $_SESSION["id_rol"];
$html = "";
switch ($id_rol) {
  case '1':
    echo '<div class="row mx-auto">';
    echo contador_hospital_dr($cedula_usu);
    echo contador_quirofano_dr($cedula_usu);
    echo contador_emergencia_dr($cedula_usu);
    echo cant_tratamiento($cedula_usu);
        echo '</div>';
    break;
  case '2':
    echo '<div class="row mx-auto">';
echo contador_hospital();
echo contador_quirofano();
echo contador_emergencia();
    echo '</div>';
    echo '<div class="row mt-5  mx-auto">';  
echo '</div>';
    break;
  case '3':
    echo '<div class="row mx-auto">';
    echo contadordeusuario();
    echo count_atencion();
    echo count_examen();
    echo count_examen_activos();
    echo count_tratamiento(); 
echo '</div>';
// echo '<div class="row mx-auto">'; 
// echo grafico_atencion_areas();
// echo '</div>';
    break;

  default:
    # code...
    break;
}
//doctor

function contador_hospital_dr($cedula_medico)
{
  # code...
  //date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 day,'%m')>=date_format(fecha_registrada,'%m') 
  $tabla = "atencion";
  $campo = "count(*) as cmedico"; 
  $where = " where id_tipo=2 and cedula_medico='$cedula_medico' and date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 day,'%m')>=date_format(fecha_registrada,'%m') "; 
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-hospital fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Hospital
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}

function contador_quirofano_dr($cedula_medico)
{
  # code...
  $tabla = "atencion";
  $campo = "count(*) as cmedico"; 
  $where = " where id_tipo=3 and cedula_medico='$cedula_medico' and date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 day,'%m')>=date_format(fecha_registrada,'%m') "; 
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-radiation fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Quirofano
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}

function contador_emergencia_dr($cedula_medico)
{
  # code...
  $tabla = "atencion";
  $campo = "count(*) as cmedico"; 
  $where = " where id_tipo=4 and cedula_medico='$cedula_medico' and date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 day,'%m')>=date_format(fecha_registrada,'%m') "; 
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-truck-medical fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Emergencia
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}
function cant_tratamiento($cedula_medico){
  $tabla="detalle_tratamiento";
  $campos="count(*) as cmedico";
  $where="where atencion.cedula_medico='$cedula_medico' and date_format(tratamiento.fecha_registrado,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 day,'%m')>=date_format(tratamiento.fecha_registrado,'%m')";
  $inner="
  
  INNER JOIN tratamiento on tratamiento.id_tratamiento=detalle_tratamiento.id_tratamiento
  INNER JOIN medicamento on medicamento.id_medicamento=detalle_tratamiento.id_medicamento
  inner join atencion on atencion.id_atencion=tratamiento.id_atencion
  ";
  $consulta=consultas("$tabla","$campos","$inner $where"); 
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"]; 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    <i class="fa-solid fa-clipboard-user fa-5x"></i>
      
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
     Tratamiento
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}

//enfermeria
function fiebre()
{
  // 
  # code...
  $tabla = "signosvitales";
  $campo = "DISTINCT paciente.nombre_paciente,signosvitales.temperatura"; 
  $inner="INNER JOIN atencion on atencion.id_atencion=signosvitales.id_atencion inner JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente ";
  $where = "where date_format(signosvitales.fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 2 day,'%m')>=date_format(signosvitales.fecha_registrada,'%m') and signosvitales.temperatura>37"; 
  $consulta = consultas("$tabla", "$campo", "$inner $where");
  $html='<div class="card-group">';
  while ( $row = $consulta->fetch()) {
  $html.='
  <div class="card">
    
    <div class="card-body">
     '.$row["nombre_paciente"].' Tiene fiebre de '.$row["temperatura"].'
      
    </div>
  </div>
 
  
';
  }
  $html.='</div>';
  return $html;
}

function contador_hospital()
{
  # code...
  $tabla = "atencion";
  $campo = "count(*) as cmedico"; 
  $where = " where id_tipo=2"; 
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-hospital fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Hospital
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}

function contador_quirofano()
{
  # code...
  $tabla = "atencion";
  $campo = "count(*) as cmedico"; 
  $where = " where id_tipo=3"; 
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-radiation fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Quirofano
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}

function contador_emergencia()
{
  # code...
  $tabla = "atencion";
  $campo = "count(*) as cmedico"; 
  $where = " where id_tipo=4"; 
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
 
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-truck-medical fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Emergencia
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}


// admin

function contadordeusuario()
{
  # code...
  $tabla = "usuario";
  $campo = "count(*) as cmedico";
  $campo2 = "count(*) as cenfermero";
  $where = " where id_rol='1' and estado_usu='A'";
  $where2 = " where id_rol='2' and estado_usu='A'";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $cmedico = $row["cmedico"];
  $consulta = consultas("$tabla", "$campo2", "$where2");
  $row = $consulta->fetch();
  $cenfermero = $row["cenfermero"];
  $html = '
  
  <div class="col-sm-2 ">
    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-user-doctor fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cmedico . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Doctores
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div>
  <div class="col-sm-2">

    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-user-nurse fa-5x"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $cenfermero . '
        <span class="visually-hidden">unread messages</span>
      </span>
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Enfermeras
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}
function count_atencion(){
  //SELECT COUNT(*) FROM `atencion` WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m');
  $tabla = "atencion";
  $campo = "count(*) as atencion,date_format(curdate(),'%b') as mes";
  $where = " WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m')";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $atencion = $row["atencion"];
  $mes = $row["mes"];
  $html = '
  <div class="col-sm-2">

    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-hospital-user fa-5x"></i> 
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $atencion . '
        <span class="visually-hidden">unread messages</span>
      </span> 
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Pacientes atendidos '.$mes.'
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}

function count_examen(){
  //SELECT count(*) as examen FROM `examen` INNER JOIN atencion on atencion.id_atencion=examen.id_atencion WHERE date_format(atencion.fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format(atencion.fecha_registrada,'%m')=date_format(curdate(),'%m');
  $tabla = "examen";
  $campo = "count(*) as examen,date_format(curdate(),'%b') as mes";
  $inner="INNER JOIN atencion on atencion.id_atencion=examen.id_atencion";
  $where = " WHERE date_format(atencion.fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format(atencion.fecha_registrada,'%m')=date_format(curdate(),'%m') and estado='Inactivo'";
  $consulta = consultas("$tabla", "$campo", "$inner $where");
  $row = $consulta->fetch();
  $examen = $row["examen"];
  $mes = $row["mes"];
  $html = '
  <div class="col-sm-2">

    <button type="button" class="btn btn-primary position-relative">
    
      <i class="fa-solid fa-crutch fa-5x"></i> 
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $examen . '
        <span class="visually-hidden">unread messages</span>
      </span> 
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Examenes realizados en laboratorio en  '.$mes.'
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}
function count_examen_activos(){
  //SELECT count(*) as examen FROM `examen` INNER JOIN atencion on atencion.id_atencion=examen.id_atencion WHERE date_format(atencion.fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format(atencion.fecha_registrada,'%m')=date_format(curdate(),'%m');
  $tabla = "examen";
  $campo = "count(*) as examen,date_format(curdate(),'%b') as mes";
  $inner="INNER JOIN atencion on atencion.id_atencion=examen.id_atencion";
  $where = " WHERE  estado='Activo'";
  $consulta = consultas("$tabla", "$campo", "$inner $where");
  $row = $consulta->fetch();
  $examen = $row["examen"];
  $mes = $row["mes"];
  $html = '
  <div class="col-sm-2">

    <button type="button" class="btn btn-primary position-relative">
    <i class="fa-solid fa-pills fa-5x"></i> 
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $examen . '
        <span class="visually-hidden">unread messages</span>
      </span> 
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Examenes no usados
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}
function count_tratamiento(){
  //SELECT count(*) as tratamiento FROM tratamiento INNER JOIN atencion on atencion.id_atencion=tratamiento.id_atencion WHERE date_format(atencion.fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format(atencion.fecha_registrada,'%m')=date_format(curdate(),'%m') and atencion.id_tipo!=5;
  $tabla = "tratamiento";
  $campo = "count(*) as tratamiento ,date_format(curdate(),'%b') as mes";
  $inner="INNER JOIN atencion on atencion.id_atencion=tratamiento.id_atencion";
  $where = " WHERE date_format(atencion.fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format(atencion.fecha_registrada,'%m')=date_format(curdate(),'%m') and atencion.id_tipo in (2,3,4)";
  $consulta = consultas("$tabla", "$campo", "$inner $where");
  $row = $consulta->fetch();
  $tratamiento = $row["tratamiento"];
  $mes = $row["mes"];
  $html = '
  <div class="col-sm-2">

    <button type="button" class="btn btn-primary position-relative">
    <i class="fa-solid fa-bed-pulse fa-5x"></i> 
      
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        ' . $tratamiento . '
        <span class="visually-hidden">unread messages</span>
      </span> 
      <span class="position-absolute top-100 start-50 translate-middle badge rounded-pill bg-danger">
      Tratamientos de '.$mes.' en la clinica
      <span class="visually-hidden">unread messages</span>
    </span>
    </button>

  </div> 
';
  return $html;
}


function grafico_atencion_areas(){
  $tabla = "atencion";
  $campo = "count(*) as Consultorio";
  $where = " WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m') and atencion.id_tipo in (1)";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $Consultorio = $row["Consultorio"]; 
  $campo = "count(*) as Hospitalizacion";
  $where = " WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m') and atencion.id_tipo in (2)";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $Hospitalizacion = $row["Hospitalizacion"]; 
  $campo = "count(*) as Quirofano";
  $where = " WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m') and atencion.id_tipo in (3)";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $Quirofano = $row["Quirofano"]; 
  $campo = "count(*) as Emergencia";
  $where = " WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m') and atencion.id_tipo in (4)";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $Emergencia = $row["Emergencia"]; 
  $campo = "count(*) as Casa";
  $where = " WHERE date_format(fecha_registrada,'%Y')=date_format(curdate(),'%Y') and date_format( curdate() - INTERVAL 1 month,'%m')>=date_format(fecha_registrada,'%m') and atencion.id_tipo in (5)";
  $consulta = consultas("$tabla", "$campo", "$where");
  $row = $consulta->fetch();
  $Casa = $row["Casa"]; 
  
  $html='<div class="mt-4"  style="width: 50%;">
  <canvas id="areas" ></canvas>
</div> 
';
$html.="<script>
const ctx = document.getElementById('areas');

new Chart(ctx, {
  type: 'bar',
  indexAxis: 'y',
  data: {
    labels: ['Consultorio', 'Hospitalizacion', 'Quirofano', 'Emergencia','Casa'],
    datasets: [{
      label: 'Pacientes ',
      data: [$Consultorio, $Hospitalizacion, $Quirofano, $Emergencia,$Casa],
      borderWidth: 1
    }]
  },
  scales: {
    x: {
      stacked: true,
    },
    y: {
      stacked: true
    }
  },   barThickness: 1  ,
  
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: 'Pacientes atendidos en el mes anterior y actual'
      }
    }
  }
});
</script>";
return $html;
}
?>
 