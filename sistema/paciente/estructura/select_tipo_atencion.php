<?php
 include("../../conexion/interacion.php");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1); 


  
$tabla="tipo_atencion";
$campo=" `id_tipo`, `tipo_atencion`";
$inner="";
$where="$inner "; 
$consulta=consultas($tabla, $campo, $where);
$html='
<div class="form-floating mb-4">
<select class="form-select" id="id_tipo" name="id_tipo"   aria-label="Floating label select example">

<option value="0">Elige nivel de atencion</option>


';

while ($row=$consulta->fetch()) {
    # code...
$html.='<option value="'.$row["id_tipo"].'">'.$row["tipo_atencion"].'</option>';
}
$html.='</select>
<label for="floatingSelect">Nivel de Atencion</label>
</div>';
echo $html;
?>
