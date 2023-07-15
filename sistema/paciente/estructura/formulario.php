<?php
$fecha_actual = date("Y-m-d");
?>
<div class="row">
  <div class="col-xs-12 col-lg-4 col-sm-4 col-md-4">
    <nav id="navbar-example3" class="h-100 flex-column align-items-stretch pe-4 border-end">
      <nav class="nav nav-pills flex-column">
        <a class="nav-link active navlink_t1" href="#item-1" onclick="presentar('1')">Datos de Paciente</a>
        <a class="nav-link navlink_t2 " href="#item-2" onclick="presentar('2')">Alergias</a>
        <a class="nav-link navlink_t3" href="#item-3" onclick="presentar('3')">Antecedentes de paciente</a>
        <a class="nav-link navlink_t4" href="#item-4" onclick="presentar('4')">Doctor</a>

        <a class="nav-link navlink_t5" href="#item-5" onclick="presentar('5')">Acompañante de paciente</a>
        <a class="nav-link navlink_t6" href="#item-6" onclick="presentar('6')">Atencion</a>

        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">Nº Paso</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link contador_pagina" href="#">1</a>
            </li>

          </ul>
        </nav>


        <nav aria-label="Page navigation example mb-3 api_consulta">
          <ul class="pagination">

            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">Consulta</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link api" href="#">#</a>
            </li>

          </ul>
        </nav>

      </nav>
    </nav>
  </div>

  <div class="col-lg-8 col-sm-8 col-md-8 col-xs-12">
    <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
      <div id="item-1">
        <!-- Datos paciente -->

        <div class="form-floating mb-2">
          <input type="text" class="form-control" id="cedula_paciente" name="cedula_paciente" placeholder="h" onchange="cedula_paciente_ft()" onkeypress="return  numeros(event);" onkeyup="return limitar(event,this.value,10);" maxlength="10">
          <label for="floatingInput">Cedula Paciente <i class="cedula_not"></i></label>

        </div>
        <div class="row mb-2">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <input type="text" class="form-control" id="nombre_paciente" name="nombre_paciente" placeholder="g" onkeypress="return letra(event);" onkeyup="return limitar(event,this.value,120);" maxlength="120">
              <label for="floatingPassword">Nombre de Paciente</label>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <select class="form-select" id="sexo_paciente" name="sexo_paciente" aria-label="Floating label select example">
                <option value="0">Seleccione sexo</option>
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
              </select>

              <label for="floatingInput">Sexo Paciente</label>
            </div>
          </div>
        </div>
        <div class="row mb-2">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" placeholder="g" max="<?= $fecha_actual ?>">
              <label for="floatingPassword">Fecha de nacimiento de Paciente</label>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <select class="form-select" id="estado_civil" name="estado_civil" aria-label="Floating label select example">
                <option value="0">Seleccione el estado de paciente </option>
                <option value="Soltero/a">Soltero/a</option>
                <option value="Casado/a">Casado/a</option>
                <option value="Union de hecho">Union de hecho</option>
                <option value="Divorciado/a">Divorciado/a</option>
                <option value="Viudo/a">Viudo/a</option>
              </select>

              <label for="floatingInput">Estado civil de Paciente</label>
            </div>
          </div>
        </div>






        <div class="row mb-2">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <select class="form-select" id="tipo_sangre" name="tipo_sangre" aria-label="Floating label select example">
                <option value="0">Tipo de sangre</option>
                <option value="A">A+</option>
                <option value="O">O+</option>
                <option value="B">B+</option>
                <option value="AB">AB+</option>
                <!-- negativos -->
                <option value="A-">A-</option>
                <option value="O-">O-</option>
                <option value="B-">B-</option>
                <option value="AB-">AB-</option>
              </select>

              <label for="floatingPassword">Tipo de Sangre de Paciente</label>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <input type="telf" class="form-control" id="telefono_paciente" name="telefono_paciente" onkeypress="return numeros(event);" onkeyup="return limitar(event,this.value,10);" maxlength="10" placeholder="h">
              <label for="floatingInput">Telefono de Paciente</label>
            </div>
          </div>
        </div>

        <div class="offset-lg-9 offset-sm-9 offset-md-9 ">
          <button type="button" class="btn btn-outline-primary" onclick="sig_paciente()">Siguiente</button>
        </div>







      </div>


      <div id="item-2" class="d-none">
        <!-- alergias -->
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <!--  -->

            <!-- select  -->


            <div class="form-floating">
              <input type="text" class="form-control" id="alergias" name="alergias" placeholder="namem" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,100);">
            
              <label for="floatingInput">Alergias</label>
            </div>


            <!-- select Alergias -->

          </div>

        </div>

        <div class="row mt-3">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-floating">
              <select class="form-select" id="gravedad" name="gravedad" aria-label="Floating label select example">
                <option value="Ninguna">No tiene alergia</option>
                <option value="Leve">Leve</option>
                <option value="Moderada">Moderada</option>
                <option value="Grave">Grave</option>
              </select>
              <label for="floatingSelect">Gravedad de la alergia</label>
            </div>
          </div>

        </div>
        <div class="row mt-3">


          <div class="col">
            <button type="button" class="btn btn-outline-primary" onclick="presentar('1')">Atras</button>
          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary" onclick="almacenar_alergia()">Almacenar alergia</button>
          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary" onclick="sig_alergias()">Siguiente</button>
          </div>
        </div>
        <div class="row mt-4">
          <div class="tabla_alergia">

          </div>

        </div>
      </div>
      <!-- alergias -->
      <div id="item-3" class="d-none">
        <!--Antecedentes de paciente  -->

        <div class="row mb-2">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="tipo_enfermedad" name="tipo_enfermedad" placeholder="namecom" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);">
              <label for="floatingInput">Tipo de enfermedad</label>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating mb-3">
              <input type="date" class="form-control" id="fecha_dianostico" name="fecha_dianostico" placeholder="namecom" max="<?= $fecha_actual ?>">
              <label for="floatingInput">fecha de diagnostico</label>
            </div>
          </div>
        </div>
        <div class="row mb-2">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="tratamiento_recibido" name="tratamiento_recibido" placeholder="namecom" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);" maxlength="120">
              <label for="floatingInput">Tratamiento recibido</label>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="estado_actual" name="estado_actual" placeholder="namecom" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);">
              <label for="floatingInput">Estado de la enfermedad</label>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
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
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="nombre_familiar" name="nombre_familiar" onkeypress="return letra(event);" onkeyup="return limitar(event,this.value,120);" maxlength="120" placeholder="name@example.com">
              <label for="floatingInput">Nombre de familiar</label>
            </div>
          </div>

        </div>

        <div class="row mt-3">


          <div class="col">
            <button type="button" class="btn btn-outline-primary" onclick="presentar('2')">Atras</button>
          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary" onclick="almacenar_antecedentes_paciente()">Almacenar antecedentes</button>
          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary antecedentes" onclick="sig_antecedentes()">Siguiente</button>
          </div>
        </div>
        <div class="row mt-4">
          <div class="tabla_antecedentes_familiar">

          </div>

        </div>
        <!--Antecedentes de paciente  -->
      </div>
      <div id="item-4" class="d-none">
        <!-- Doctor -->
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating mb-4">
              <select class="form-select" id="id_especialidad" name="id_especialidad" onchange="buscar_doctor_especialidad()" aria-label="Floating label select example">

                <option value="x"></option>

              </select>
              <label for="floatingSelect">Especialidad</label>
            </div>
            <article class="nivel_atencion"></article>

          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

            <div class="form-floating mb-4">
              <select class="form-select" id="cedula_medico" name="cedula_medico" onchange="doctor_estado()" aria-label="Floating label select example">

                <option value="0"></option>

              </select>
              <label for="floatingSelect">Doctor</label>
            </div>
            <article class="estado_doctor"></article>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col">
            <button type="button" class="btn btn-outline-primary" onclick="presentar('3')">Atras</button>
          </div>
          <div class="col ">

          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary" onclick="sig_medico()">Siguiente</button>
          </div>
        </div>
        <!-- Doctor -->
      </div>
      <div id="item-5" class="d-none">
        <!-- Contacto -->

        <div class="form-floating mb-2">
          <input type="text" class="form-control contacto" id="cedula_contacto" name="cedula_contacto" placeholder="h" onkeypress="return numeros(event);" onchange="cedula_contacto_ft()" maxlength="10">
          <label for="floatingInput">Cedula contacto <i class="cedula_not2"></i></label>

        </div>
        <div class="row mb-2">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <input type="text" class="form-control contacto" id="nombre_contacto" name="nombre_contacto" placeholder="g" onkeypress="return letra(event);">
              <label for="floatingPassword">Nombre de contacto</label>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

            <div class="form-floating">
              <select class="form-select" id="parentesco_contacto" name="parentesco_contacto" aria-label="Floating label select example">
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
        </div>



        <div class="row mb-2">

          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-floating">
              <input type="telf" class="form-control contacto" id="telefono_contacto" name="telefono_contacto" onkeypress="return numeros(event);" onkeyup="return limitar(event,this.value,10);" maxlength="10" placeholder="h">
              <label for="floatingInput">Telefono </label>
            </div>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col">
            <button type="button" class="btn btn-outline-primary" onclick="presentar('4')">Atras</button>
          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary" onclick="almacenar_contacto()">Almacenar contacto</button>
          </div>
          <div class="col ">
            <button type="button" class="btn btn-outline-primary" onclick="presentar('6')">Siguiente</button>
          </div>
        </div>


        <div class="tabla_contacto">

        </div>
        <!-- Contacto -->
      </div>
      <div id="item-6" class="d-none">

        <div class="row">
          <div class="col-sm-6 mb-3 mb-sm-0">
            <div class="card">
              <div class="card-body">
                <h3>Paciente</h3>
                <p class="dato_paciente"></p>
                <h3>Lo va atender </h3>
                <p class="datos_doctor"></p>
              </div>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="card">
              <div class="card-body">
                <h3>Signos Vitales</h3>

                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="pulso" name="pulso" placeholder="name@example.com">
                  <label for="floatingInput">Frecuencia cardíaca </label>
                </div>
                <div class="form-floating">
                  <input type="text" class="form-control" id="presion" name="presion" placeholder="Password">
                  <label for="floatingPassword">Presión arterial</label>
                </div>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="respiracion" name="respiracion" placeholder="name@example.com">
                  <label for="floatingInput">Frecuencia respiratoria </label>
                </div>

                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="temperatura" name="temperatura" placeholder="name@example.com">
                  <label for="floatingInput">Temperatura</label>
                </div>

                <input type="hidden" name="id_usuario" id="id_usuario">
                <div class="offset-lg-9 offset-sm-9 offset-md-9 ">
                  <button type="button" class="btn btn-outline-primary" onclick="save_all()">Guardar Todo</button>
                </div>

              </div>
            </div>
          </div>
        </div>




      </div>
    </div>






  </div>

</div>