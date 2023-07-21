 <?php 
 $fecha_actual=Date("Y-m-d");
 ?>
<div class="row">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
    <!--  -->
<input type="hidden" name="id_atencion" id="id_atencion">
<input type="hidden" name="donde" id="donde" value="Hp">
<div class="form-floating">
  <select class="form-select" id="id_detalle_tratamiento"  name="id_detalle_tratamiento"  aria-label="Floating label select example">
  </select>
  <label for="floatingSelect">Medicamento</label>
</div>

<div class="form-floating">
  <select class="form-select" id="dosis" name="dosis" aria-label="Floating label select example">
    
    <option value="1">Desayuno dosis</option>
    <option value="2">Almuerzo dosis</option>
    <option value="3">Cena dosis</option>
  </select>
  <label for="floatingSelect">Dosis dada</label>
</div>
<div class="form-floating mb-3">
  <input type="date" class="form-control" id="fecha_suministrada"  name="fecha_suministrada"max="<?=$fecha_actual?>" placeholder="name@example.com">
  <label for="floatingInput">Fecha de suministro</label>
</div>

<div class="form-floating mb-3">
  <input type="time" class="form-control" id="hora_suministrada"  name="hora_suministrada" placeholder="name@example.com">
  <label for="floatingInput">Tiempo de suministro</label>
</div>


<div class="row mt-3">


  <div class="col">
    <button type="button" class="btn btn-outline-danger" onclick="tabla_paciente()">Regresar</button>
  </div>
  <div class="col ">
    <button type="button" class="btn btn-outline-primary" onclick="almacenar_seguimiento()">Almacenar </button>

  </div>

</div>
<!--  -->
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
    <div class="tratamiento"></div>
</div>

</div>