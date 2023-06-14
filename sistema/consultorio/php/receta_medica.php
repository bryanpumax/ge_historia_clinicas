<?php
/* 
https://hospital.lab-mrtecks.com/sistema/consultorio/php/receta_medica.php
*/
$fecha=date ("mdsmh");
 session_start();
 ini_set('display_errors', 1);
 ini_set('display_startup_errors', 1);   
   include "../../../assets/php_plugins/vendor/autoload.php";
  $id_atencion=$_REQUEST["id_atencion"];
  $_SESSION["id_atencion"]=$id_atencion;
  use Dompdf\Dompdf; 
// Crea una instancia de dompdf
$dompdf = new Dompdf(); 
// Carga el archivo HTML
ob_start();
include "formato_receta.php";
$html=ob_get_clean();
// $html = file_get_contents('formato_receta.php'); 
// Convierte el HTML a PDF
$dompdf->loadHtml($html);

// (Opcional) Puedes configurar opciones adicionales, como el tamaño de página y la orientación
$dompdf->setPaper('A4', 'landscape');

// Renderiza el documento PDF
$dompdf->render();

// Genera la salida del PDF en el navegador
$dompdf->stream("receta_$fecha.pdf");