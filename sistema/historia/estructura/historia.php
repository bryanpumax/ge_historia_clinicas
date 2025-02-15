<?php
/* 
https://hospitalclinicosantalucia.com/sistema/historia/estrucutra/historia.php?id_atencion=8

https://hospitalclinicosantalucia.com/sistema/historia/estructura/formato_historia.php?cedula=1720836400
*/
date_default_timezone_set('America/Guayaquil');
$cedula2=$_REQUEST["cedula"];
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
include "formato_historia.php";

 $html=ob_get_clean();
// echo $html; 
// Convierte el HTML a PDF
$dompdf->loadHtml($html);

// (Opcional) Puedes configurar opciones adicionales, como el tamaño de página y la orientación
$dompdf->setPaper('A4', 'portrait');
 
// Renderiza el documento PDF
$dompdf->render();
$totalPages=$dompdf->getCanvas()->get_page_count();
for ($i = 1; $i <= $totalPages; $i++) {
  $dompdf->getCanvas()->text(450, 800, "Página: $i $cedula2", null, 10, array(0, 0, 0));
}
$fecha=$id."_$i";
// Genera la salida del PDF en el navegador
$dompdf->stream("historial_$fecha.pdf");
 