 <?php
  include "../../conexion/interacion.php";
  session_start();
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  $fecha_actual=DATE("Y-m-d");
  $id_atencion = $_REQUEST["id_atencion"];
  $tabla = "atencion";
  $campos = "id_atencion,atencion. cedula_paciente as cedula_paciente, atencion.cedula_medico, atencion.id_usuario,atencion.id_tipo, estado_paciente_inicio, descripcion, fecha_inicio, fecha_fin, fecha_registrada ,paciente.nombre_paciente,`paciente`.`sexo_paciente`,paciente.fecha_nacimiento,paciente.tipo_sangre,paciente.telefono_paciente,medico.nombre_medico,case when medico.estado_medico= 'Co' THEN 'Consultorio' when medico.estado_medico= 'Em' THEN 'Emergencia' when medico.estado_medico= 'Hp' THEN 'Hospitilizacion' when medico.estado_medico= 'Qr' THEN 'Quirofano' when medico.estado_medico= 'Ca' THEN 'Casa' end as estado_medico, usuario.nombre_usu,tipo_atencion.tipo_atencion
";
  $where = "where id_atencion='$id_atencion'";
  $inner = "
INNER JOIN paciente on paciente.cedula_paciente=atencion.cedula_paciente
INNER JOIN medico on medico.cedula_medico=atencion.cedula_medico
INNER JOIN usuario on usuario.id_usuario = atencion.id_usuario
INNER JOIN tipo_atencion on tipo_atencion.id_tipo=atencion.id_tipo";
  $consulta = consultas("$tabla", "$campos", "$inner $where");
  $row = $consulta->fetch();
  $cedula_paciente = $row["cedula_paciente"];
  $cedula_medico = $row["cedula_medico"];
  $id_usuario = $row["id_usuario"];
  $id_tipo = $row["id_tipo"];
  $estado_paciente_inicio = $row["estado_paciente_inicio"];
  $descripcion = $row["descripcion"];

  $nombre_paciente = $row["nombre_paciente"];
  $sexo_paciente = $row["sexo_paciente"];
  $fecha_nacimiento = $row["fecha_nacimiento"];
  $tipo_sangre = $row["tipo_sangre"];
  $telefono_paciente = $row["telefono_paciente"];
  $nombre_medico = $row["nombre_medico"];
  $estado_medico = $row["estado_medico"];
  $nombre_usu = $row["nombre_usu"];
  $tipo_atencion = $row["tipo_atencion"];
  ?>
 <script>
   $(document).ready(function() {
     $("#tipo_sangre").val("<?= $tipo_sangre ?>")
     $("#sexo_paciente").val("<?= $sexo_paciente ?>")
     $(".fpaciente").attr("disabled");
     $("#descripcion").val("<?= $descripcion ?>")

     select_id_tipo("<?=$id_tipo?>")
   });
 </script>
 <div class="row">
   <div class="col-xs-12 col-lg-4 col-sm-4 col-md-4">
     <nav id="navbar-example3" class="h-100 flex-column align-items-stretch pe-4 border-end">
       <nav class="nav nav-pills flex-column">
         <a class="nav-link active navlink_t1" href="#item-1" onclick="presentar('1')">Datos de Paciente</a>
         <a class="nav-link navlink_t2 " href="#item-2" onclick="presentar('2'); generar_tbl_medicamento();mostrar_tbl_tratamiento();select_id_tipo('<?=$id_tipo?>');">Diagnostico</a>
         <a class="nav-link navlink_t3 " href="#item-3" onclick="presentar('3'); generar_tbl_medicamento();mostrar_tbl_tratamiento();select_id_tipo('<?=$id_tipo?>');">Tratamiento</a>
         <a class="nav-link navlink_t4 " href="#item-4" onclick="presentar('4'); generar_tbl_medicamento();mostrar_tbl_tratamiento();select_id_tipo('<?=$id_tipo?>');">Examenes</a>
         <a class="nav-link navlink_t5 " href="#item-5" onclick="presentar('5'); generar_tbl_medicamento();mostrar_tbl_tratamiento();select_id_tipo('<?=$id_tipo?>');">Estado paciente</a>
         <a class="nav-link " href="#item-1" onclick="formulario_medico('<?= $id_atencion ?>')">Actualizar</a>

       </nav>
     </nav>
   </div>

   <div class="col-lg-8 col-sm-8 col-md-8 col-xs-12">
     <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
       <div id="item-1">
         <!--  -->
         <div class="form-floating mb-2">
           <input type="text" class="form-control fpaciente" id="cedula_paciente" name="cedula_paciente" disabled="disabled" value="<?= $cedula_paciente ?>">
           <label for="floatingInput">Cedula Paciente <i class="cedula_not"></i></label>

         </div>
         <div class="row mb-2">
           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <div class="form-floating">
               <input type="text" class="form-control fpaciente" id="nombre_paciente" name="nombre_paciente" value="<?= $nombre_paciente ?>" disabled="disabled">
               <label for="floatingPassword">Nombre de Paciente</label>
             </div>
           </div>
           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <div class="form-floating">
               <select class="form-select fpaciente" id="sexo_paciente" name="sexo_paciente" value="<?= $sexo_paciente ?>" disabled="disabled" aria-label="Floating label select example">
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
               <input type="date" class="form-control fpaciente" id="fecha_nacimiento" name="fecha_nacimiento" value="<?= $fecha_nacimiento ?>" disabled="disabled" max="<?= $fecha_actual ?>">
               <label for="floatingPassword">Fecha de nacimiento de Paciente</label>
             </div>
           </div>
           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <div class="form-floating">
               <select class="form-select fpaciente" id="tipo_sangre" name="tipo_sangre" aria-label="Floating label select example" disabled="disabled">
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
         </div>





         <input type="hidden" name="id_atencion" id="id_atencion" value="<?= $id_atencion ?>">


         <div class="offset-lg-9 offset-sm-9 offset-md-9 ">
           <button type="button" class="btn btn-outline-primary" onclick="presentar('2'); generar_tbl_medicamento();mostrar_tbl_tratamiento();select_id_tipo('<?=$id_tipo?>');">Siguiente</button>
         </div>

         <!--  -->
       </div>

       <div id="item-2" class="d-none">
         <!-- Diagnostico -->
         <div class="form-floating">
           <textarea class="form-control" placeholder="Leave a comment here" id="descripcion" name="descripcion" rows="10" cols="50" style="height: 241px;" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,120);"></textarea>
           <label for="floatingTextarea">Diagnostico</label>
         </div>
         <div class="offset-lg-9 offset-sm-9 offset-md-9 ">
           <button type="button" class="btn btn-outline-primary" onclick="presentar('1')">Atras</button>
           <button type="button" class="btn btn-outline-primary" onclick="guardar_diagnostico();; generar_tbl_medicamento();mostrar_tbl_tratamiento();">Siguiente</button>
         </div>
         <!-- Diagnostico -->
       </div>

       <div id="item-3" class="d-none">
         <!-- Tratamiento -->
         <div class="form-floating mb-3">
           <input type="text" class="form-control" id="tratamiento" name="tratamiento" placeholder="nameexample.com">
           <label for="floatingInput">Tratamiento</label>
         </div>

         <div class="form-floating mb-3">
           <select class="form-select" id="estado_tratamiento" name="estado_tratamiento" aria-label="Floating label select example">

             <option value="0">Seleccion estado de tratamiento</option>
             <option value="Inicia">Inicia</option>
             <option value="Continua">Continua</option>
             <option value="Termina">Termina</option>
           </select>
           <label for="floatingSelect">Estado</label>
         </div>

         <div class="form-floating mb-3">
           <input type="date" class="form-control" id="duracion" name="duracion" placeholder="nameexample.com" min="<?=$fecha_actual?>">
           <label for="floatingInput">Duracion</label>
         </div>
         <div class="form-floating mb-3">
           <input type="text" class="form-control" disabled id="codigo_medicamento_formulario" name="codigo_medicamento_formulario" placeholder="nameexample.com">
           <label for="floatingInput">Codigo Medicamento</label>
         </div>
         <div class="form-floating mb-3">
           <input type="text" class="form-control" id="hora_consumo" name="hora_consumo" placeholder="nameexample.com">
           <label for="floatingInput">Horario Medicamento</label>
         </div>
         <button type="button" class="btn btn-primary" onclick="imprimir_receta_medica()">
          Imprimir receta medica
         </button>
         <!-- medicamento -->
         
         <!-- Button trigger modal -->
         <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
           Medicamento
         </button>

         <!-- Modal -->
         <div class="modal fade   " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-fullscreen">
             <div class="modal-content">
               <div class="modal-header">
                 <h1 class="modal-title fs-5" id="exampleModalLabel">Medicamento</h1>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body generar_tbl_medicamento">

               </div>
               <div class="">
                 <div class="row mt-3">
                   <div class="col ">
                     Codigo medicamentos:
                     <input type="text" disabled class="form-control" name="codigo_medicamento" id="codigo_medicamento">
                   </div>
                   <div class="col"> <input value="x" type="hidden" name="id_medicamento_input" id="id_medicamento_input">
                     <input value="x" type="hidden" name="codigo_medicamento_input" id="codigo_medicamento_input">
                     <input value="x" type="hidden" name="descripcion_medicamento_input" id="descripcion_medicamento_input">
                     <input value="x" type="hidden" name="forma_medicamento_input" id="forma_medicamento_input">
                   </div>
                   <div class="col"> <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button></div>

                 </div>


               </div>
             </div>
           </div>
         </div>

         <!-- medicamento -->
         <div class="row mb-3 mt-3">
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="presentar('2')">Atras</button>
           </div>
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="guardar_tratamiento()">Guardar tratamiento</button>
           </div>
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="presentar('4')">Siguiente</button>
           </div>



         </div>
         <div class="tabla_tratamiento"></div>
         <!-- Tratamiento -->
       </div>

       <div id="item-4" class="d-none">
         <!-- Examen -->
         <p>Objetivo del examen es como la orden del examen</p>
         <div class="form-floating mb-3">
           <input type="text" class="form-control" id="descripcion_examen" name="descripcion_examen" placeholder="name@example.com">
           <label for="floatingInput">Objetivo de examen </label>
         </div>

         <div class="form-floating mb-3">
           <select class="form-select" id="id_pr_medica" name="id_pr_medica" aria-label="Floating label select example">

           </select>
           <label for="floatingSelect">Seleccione prueba medica</label>
         </div>

         <div class="row mb-3 mt-3">
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="presentar('3')">Atras</button>
           </div>
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="guardar_examen()">Guardar examen</button>
           </div>
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="presentar('5')">Siguiente</button>
           </div>
         </div>
         <div class="tabla_examen"></div>

         <!-- Examen -->
       </div>
       <div id="item-5" class="d-none">
         <!-- Estado final paciente -->
         <div class="form-floating">
  <select class="form-select" id="id_tipo" name="id_tipo" aria-label="Floating label select example">
 
  </select>
  <label for="floatingSelect">Estado de paciente</label>
</div>


         <div class="row mb-3 mt-3">
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="presentar('4')">Atras</button>
           </div>
      
           <div class="col">
             <button type="button" class="btn btn-outline-primary" onclick="Finalizar()">Finalizar</button>
           </div>
         </div>
         <!-- Estado final paciente -->
       </div>
     </div>

   </div>

 </div>