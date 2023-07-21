<?php
include("../../conexion/interacion.php");
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$id_atencion = $_REQUEST["id_atencion"];
$tabla = "signosvitales";
$campos = "`id_signos`, `id_atencion`, `pulso`, `presion`, `respiracion`, `temperatura`";
$where = "where id_atencion='$id_atencion' ";
$inner = " 
";
$consulta = consultas("$tabla", "$campos", "$inner $where");
$row = $consulta->fetch();
$pulso = $row["pulso"];
$presion = $row["presion"];
$respiracion = $row["respiracion"];
$temperatura = $row["temperatura"];
?>
<script>
    $(document).ready(function () {
        tabla_vital_antencion("<?=$id_atencion?>")
    });
</script>
<div class="card">
    <div class="card-body">
        <div class="row">
        
            <div class="col-lg-1 col-sm-1 col-md-1 ">
             

                <input type="hidden" name="id_atencion" id="id_atencion" value="<?= $id_atencion ?>">
                <div class="row">
                <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button> 
                </div>
               
            </div>
            <div class="col-lg-11 col-sm-11 col-md-11 tabla_vital_antencion">

</div>
        </div>


    </div>
</div>