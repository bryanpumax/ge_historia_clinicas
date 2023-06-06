<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 
$id_atencion=$_REQUEST["id_atencion"];
$tabla="signosvitales";
$campos="`id_signos`, `id_atencion`, `pulso`, `presion`, `respiracion`, `temperatura`";
$where="where id_atencion='$id_atencion' ";
$inner=" 
";
$consulta=consultas("$tabla","$campos","$inner $where");
$row=$consulta->fetch();
$pulso=$row["pulso"];
$presion=$row["presion"];
$respiracion=$row["respiracion"];
$temperatura=$row["temperatura"];
?>
<div class="card">
    <div class="card-body"> 
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="pulso" name="pulso" value="<?=$pulso?>" placeholder="name@example.com">
            <label for="floatingInput">Frecuencia cardíaca </label>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control" id="presion" name="presion"  value="<?=$presion?>" placeholder="Password">
            <label for="floatingPassword">Presión arterial</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="respiracion" name="respiracion"  value="<?=$respiracion?>"  placeholder="name@example.com">
            <label for="floatingInput">Frecuencia respiratoria </label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="temperatura" name="temperatura"  value="<?=$temperatura?>" placeholder="name@example.com">
            <label for="floatingInput">Temperatura</label>
        </div>

        <input type="hidden" name="id_atencion" id="id_atencion" value="<?=$id_atencion?>">
        <div class="offset-lg-9 offset-sm-9 offset-md-9 ">
        <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Cancelar</button>
            <button type="button" class="btn btn-outline-primary" onclick="vital()">Guardar </button>
        </div>

    </div>
</div>