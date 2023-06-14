<?php
//
//  http://144.126.145.136:33016/sri/comprobantes/vouchers/emited?type=1&username=1720836400001&id=&password=Promes@s1997&taskmode=1&year=2023&month=5&day=31&captchakey=32d70a14d5a9d7971bb5b3fcc5b9fdc0&captchaurl=https://2captcha.com&download=1&archive=xml&txtPuntoEmision=100



// /*** */

// http://144.126.145.136:33016/sri/comprobantes/task/30DK6ADDJLISH9C6K


// $fecha_actual=Date("Y-m-d");
// echo $fecha_actual;
?>
<input type="hidden" name="cedula_paciente" id="cedula_paciente">
<div class="row">
    <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
        <div class="form-floating">
            <input type="text" class="form-control" id="alergias" name="alergias" placeholder="namem" onkeypress="return letranumero(event);" onkeyup="return limitar(event,this.value,100);">

            <label for="floatingInput">Alergias</label>
        </div>



        <div class=" mt-3">
            <div class=" col-xs-12">
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
        <div class=" mt-3">


            <div class="col">
                <button type="button" class="btn btn-outline-primary" onclick="tabla_paciente()">Cancelar</button>
            </div>
            <div class="col ">
                <button type="button" class="btn btn-outline-primary" onclick="almacenar_alergia()">Almacenar alergia</button>
            </div>

        </div>
    </div>
    <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
        <div class="alergias_paciente"></div>
    </div>

</div>