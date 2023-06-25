<?php
/* 
https://hospital.lab-mrtecks.com/sistema/consultorio/php/examen_medico.php?id_atencion=8
*/
date_default_timezone_set('America/Guayaquil');
 
$dia=date("d");
$m=date("m");
$anio=date("Y");
$i=date("i");

//  session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);   
   include "../../../assets/php_plugins/vendor/autoload.php";
   
  $id=rand(1,$anio+$m);
  use Dompdf\Dompdf; 
// Crea una instancia de dompdf
$dompdf = new Dompdf(); 
// Carga el archivo HTML
ob_start();
include "formato_examen.php";

 $html=ob_get_clean();
// echo $html; 
// Convierte el HTML a PDF
$dompdf->loadHtml($html);

// (Opcional) Puedes configurar opciones adicionales, como el tamaño de página y la orientación
$dompdf->setPaper('A4', 'portrait');

// Renderiza el documento PDF
$dompdf->render();
$fecha=$id."_$i";
// Genera la salida del PDF en el navegador
$dompdf->stream("examen_$fecha.pdf");
 