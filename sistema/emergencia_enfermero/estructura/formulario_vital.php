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
        
            <div class="col-lg-6 col-sm-6 col-md-6">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="pulso" name="pulso" value="<?= $pulso ?>" placeholder="name@example.com">
                    <label for="floatingInput">Frecuencia cardíaca </label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="presion" name="presion" value="<?= $presion ?>" placeholder="Password">
                    <label for="floatingPassword">Presión arterial</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="respiracion" name="respiracion" value="<?= $respiracion ?>" placeholder="name@example.com">
                    <label for="floatingInput">Frecuencia respiratoria </label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="temperatura" name="temperatura" value="<?= $temperatura ?>" placeholder="name@example.com">
                    <label for="floatingInput">Temperatura</label>
                </div>

                <input type="hidden" name="id_atencion" id="id_atencion" value="<?= $id_atencion ?>">
                <div class="row">
                <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
                    <button type="button" class="btn btn-outline-primary" onclick="vital()">Guardar </button>
                </div>
               
            </div>
            <div class="col-lg-6 col-sm-6 col-md-6 tabla_vital_antencion">

</div>
        </div>


    </div>
</div>