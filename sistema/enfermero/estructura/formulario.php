<div class="row">
  <div class="col-lg-6 col-sm-6 col-dm-6">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="cedula_medico" name="cedula_medico" placeholder="namecom"
      onkeypress="return  numeros(event);" onkeyup="return limitar(event,this.value,10);">
      <label for="floatingInput">Cedula </label>
    </div>
  </div>
  <div class="col-lg-6 col-sm-6 col-dm-6">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="nombre_medico" name="nombre_medico" placeholder="namecom" onkeypress="return letra(event);" onkeyup="return limitar(event,this.value,120);">
      <label for="floatingInput">Nombre </label>
    </div>
  </div>
</div>



<div class="row">
  <div class="col-lg-6 col-sm-6 col-dm-6">
    <div class="form-floating">
      <select class="form-select" id="sexo_medico" name="sexo_medico" aria-label="Floating label select example">
        <option value="0" selected>Seleccione el sexo </option>
        <option value="Masculino">Masculino</option>
        <option value="Femenino">Femenino</option>
      </select>
      <label for="floatingSelect">Sexo</label>
    </div>
  </div>
  <div class="col-lg-6 col-sm-6 col-dm-6">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="telefono_medico" name="telefono_medico" placeholder="namecom"
      onkeypress="return  numeros(event);" onkeyup="return limitar(event,this.value,10);">
      <label for="floatingInput">Telefono </label>
    </div>
  </div>
</div>




  


<div class="row">
  <div class="col-lg-6 col-sm-6 col-dm-6">
<div class="form-floating mb-3">
  <input type="text" class="form-control" id="usuario_usuario" name="usuario_usuario" placeholder="name"  onkeyup="return limitar(event,this.value,120);">
  <label for="floatingInput">Usuario de acceso</label>
</div>
  </div>
  <div class="col-lg-6 col-sm-6 col-dm-6">
<div class="form-floating mb-3">
  <input type="text" class="form-control" id="contrase" name="contrase" placeholder="name"
 onkeyup="return limitar(event,this.value,120);">
  <label for="floatingInput">Contraseña de acceso</label>
</div>
  </div>
</div>
<div class="row">
<button type="button" class="btn btn-outline-primary" onclick="almacenar()">Almacenar</button>

</div>
<!-- `cedula_medico`, `nombre_medico`, `sexo_medico`, `telefono_medico`, `id_especialidad`, `estado_medico` -->