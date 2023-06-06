<?php
// Ruta del archivo CSV
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
$archivo = '../../../assets/multimedia/medicamento2023.csv';
include("../../conexion/interacion.php");
// Abrir el archivo en modo lectura
$tabla="medicamento";
$campo="id_medicamento, codigo, descripcion, forma, concentracion, viaadmin, indicaciones";
$in=1;
if (($gestor = fopen($archivo, 'r')) !== false) {
    // Leer cada línea del archivo
    while (($datos = fgetcsv($gestor, 1000, ',')) !== false) {
        
        // Acceder a los datos de cada columna
        $codigo = $datos[0];
        $descripcion = str_replace("*","",$datos[1]);
        $forma = str_replace("'","",$datos[2]);
        $concentracion = str_replace("'","",$datos[3]);
        $viaadmin = str_replace("'","",$datos[8]);
        $indicaciones=str_replace("'","",$datos[9]);
        // ...
        
        $where="where descripcion='$descripcion' and viaadmin='$viaadmin' and concentracion='$concentracion' and indicaciones='$indicaciones' and forma='$forma'";
        // Hacer algo con los datos 
        $consulta=consultas("$tabla","$campo","$where");
        $consultaw=consultasp("$tabla","$campo","$where");
        $valor="null,'$codigo','$descripcion','$forma','$concentracion','$viaadmin','$indicaciones'";
        $actualizar="descripcion='$descripcion',forma='$forma',concentracion='$concentracion',viaadmin='$viaadmin',indicaciones='$indicaciones'";
    $accion="";
        if ($consulta->rowCount()>0) {
            # code...
            $accion= update_table("$tabla","$actualizar","$where");
             update_table_p("$tabla","$actualizar","$where");
                }else{
                    $accion=    insertar("$tabla","$campo","$valor");
           insertarprueba("$tabla","$campo","$valor");
        }
        echo "medicamento $in  <br>";
        var_dump($accion);
        echo "  <br>";
        $in++;
    }
 
    // Cerrar el archivo
    fclose($gestor);
} else {
    echo "No se pudo abrir el archivo.";
}

?>
