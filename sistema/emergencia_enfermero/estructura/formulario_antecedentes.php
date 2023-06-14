<?php 
$fecha_actual=Date("Y-m-d");
echo $fecha_actual;
?>
<div class="row">
  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
  <input type="hidden" name="cedula_paciente" id="cedula_paciente">

<div class="row mb-2">
  <div class="form-floating mb-3">
    <input type="text" class="form-control" id="tipo_enfermedad" name="tipo_enfermedad" placeholder="namecom" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);">
    <label for="floatingInput">Tipo de enfermedad</label>
  </div>
</div>
<div class="">
  <div class="form-floating mb-3">
    <input type="date" class="form-control" id="fecha_dianostico" name="fecha_dianostico" placeholder="namecom" max="<?= $fecha_actual ?>">
    <label for="floatingInput">fecha de diagnostico</label>
  </div>
</div>
<div class=" mb-2">
  <div class="">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="tratamiento_recibido" name="tratamiento_recibido" placeholder="namecom" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);">
      <label for="floatingInput">Tratamiento recibido</label>
    </div>
  </div>
  <div class="">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="estado_actual" name="estado_actual" placeholder="namecom" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);">
      <label for="floatingInput">Estado de la enfermedad</label>
    </div>
  </div>
</div>
<div class="">
  <div class="">
    <div class="form-floating">
      <select class="form-select" id="parentesco_familiar" name="parentesco_familiar" aria-label="Floating label select example">
        <option value="Ninguno">Nadie</option>
        <option value='Padre'> Padre</option>
        <option value='Madre'> Madre</option>
        <option value='Hijo/a'> Hijo/a</option>
        <option value='Hermano/a'> Hermano/a</option>
        <option value='Abuelo/a'> Abuelo/a</option>
        <option value='Nieto/a'> Nieto/a</option>
        <option value='Tío/a'> Tío/a</option>
        <option value='Sobrino/a'> Sobrino/a</option>
        <option value='Primo/a'> Primo/a</option>
        <option value='Yerno'> Yerno</option>
        <option value='Nuera'> Nuera</option>
        <option value='Esposo/a'> Esposo/a</option>
        <option value='Concubino/a'> Concubino/a</option>
        <option value='Hermanastro/a'> Hermanastro/a</option>
        <option value='Medio hermano/a'> Medio hermano/a</option>
        <option value='Padrastro'> Padrastro</option>
        <option value='Madrastra'> Madrastra</option>
        <option value='Hijastro/a'> Hijastro/a</option>
        <option value='Bisabuelo/a'> Bisabuelo/a</option>
        <option value='Bisnieto/a'> Bisnieto/a</option>
        <option value='Suegro/a'> Suegro/a</option>
        <option value='Cuñado/a'> Cuñado/a</option>
        <option value='Cuñado/a político'> Cuñado/a político</option>
        <option value='Yerno político'> Yerno político</option>
        <option value='Nuera política'> Nuera política</option>
        <option value='Padrastro político'> Padrastro político</option>
        <option value='Madrastra política'> Madrastra política</option>

      </select>
      <label for="floatingSelect">Parentesco que tiene con el paciente</label>
    </div>

  </div>
  <div class="">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="nombre_familiar" name="nombre_familiar" onkeypress="return letra(event);" onkeyup="return limitar(event,this.value,120);" placeholder="name@example.com">
      <label for="floatingInput">Nombre de familiar</label>
    </div>
  </div>

</div>

<div class="row mt-3">


  <div class="col">
    <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Cancelar</button>
  </div>
  <div class="col ">
    <button type="button" class="btn btn-outline-primary" onclick="almacenar_antecedentes_paciente()">Almacenar antecedentes</button>
  </div>

</div>
  </div>
  <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
    <div class="tabla_antecedentes_familiar">

    </div>

  </div>

</div>
