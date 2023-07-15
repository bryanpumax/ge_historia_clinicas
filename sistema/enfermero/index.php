<?php 
session_start();
$boton="Enfermero"; 
$dominio='https://hospital.lab-mrtecks.com/sistema/enfermero/js/';
?>
<div class="row">
<button class="btn btn-primary nuevo_btn" onclick="nuevo_btn_m()">Nuevo <?=$boton?></button>
</div>
<div class="row">
<div class="col-lg-12  col-dm-12 col-sm-12 col-xs-12 formulario ">

</div>
<div class="col-lg-12  col-dm-12 col-sm-12 col-xs-12 consulta ">

</div>
</div>
<script class="jsindex_p" src="<?=$dominio?>index.js"></script>
<script class="jsbutton_p" src="<?=$dominio?>button.js"></script>
<script class="jsevento_p" src="<?=$dominio?>evento.js"></script>
