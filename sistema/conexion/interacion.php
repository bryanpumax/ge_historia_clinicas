<?php
function consultas($tabla, $campo, $texto_condicion)
{
    include("conexion.php");
    $sentecia = "SELECT $campo from $tabla $texto_condicion;";
    $sql = $pdo->query($sentecia);
    return $sql;
}
function operacion(  $campo )
{
    include("conexion.php");
    $sentecia = "SELECT $campo  ;";
    $sql = $pdo->query($sentecia);
    return $sql;
}

function consultasp($tabla, $campo, $texto_condicion)
{
    include("conexion.php");
    $sentecia = "SELECT $campo from $tabla $texto_condicion;";

    return $sentecia;
}
function insertar($tabla, $campo, $valor)
{
    include("conexion.php");
    $sentecia = "INSERT INTO  $tabla ($campo) values ($valor);";
    $sql = $pdo->query($sentecia);
    return $sql;
}

function insertarprueba($tabla, $campo, $valor)
{
    include("conexion.php");
    $sentecia = "INSERT INTO  $tabla ($campo) values ($valor);";

    return $sentecia;
}
function update_table($tabla, $campo_valor, $texto)
{
    include("conexion.php");
    $sentecia = "UPDATE $tabla SET $campo_valor   $texto";
    $sql = $pdo->query($sentecia);
    return $sql;
}
function update_table_p($tabla, $campo_valor, $texto)
{
    include("conexion.php");
    $sentecia = "UPDATE $tabla SET $campo_valor   $texto";
    return $sentecia;
}
function eliminar($tabla, $texto_condicion)
{
    include("conexion.php");
    $sentecia = "DELETE from $tabla $texto_condicion;";
    $sql = $pdo->query($sentecia);
    return $sql;
}
function eliminar_p($tabla, $texto_condicion)
{
    include("conexion.php");
    $sentecia = "DELETE from $tabla $texto_condicion;";
    $sql = ($sentecia);
    return $sql;
}


function echoResponse($response)
{
    echo json_encode($response);
}
function operacion_query($texto)
{
    include("conexion.php");
    $sentecia = "$texto;";
    $sql = $pdo->query($sentecia);
    return $sql;
}
function operacion_queryp($texto)
{
    include("conexion.php");
    $sentecia = "$texto;"; 
    return $sentecia;
}
function seguridad($texto){
    $texto=trim($texto);
    $texto=htmlentities($texto);
    $texto=texto_extraño($texto);
    return $texto;
    }
    function texto_extraño($texto){
        $texto=strtoupper($texto);
    $texto=str_replace("#","",$texto);
    $texto=str_replace("=","",$texto);
    $texto=str_replace("'","",$texto);
    $texto=str_replace('"',"",$texto);
    $texto=str_replace("&","",$texto);
    $texto=str_replace("AND","",$texto);
    $texto=str_replace("OR","",$texto);
    $texto=str_replace("SELECT","",$texto);
    $texto=str_replace("DELETE","",$texto);
    $texto=str_replace("UPDATE","",$texto);
    $texto=str_replace("UPDATE","",$texto);
    $texto=str_replace("DROP","",$texto);
    $texto=str_replace("ORDER","",$texto);
    $texto=str_replace("BY","",$texto);
    $texto=str_replace("*","",$texto);
    $texto=str_replace("-","",$texto);
    $texto=str_replace("+","",$texto);
    $texto=str_replace("?","",$texto);
    $texto=str_replace("|","",$texto);
    $texto=str_replace(";","",$texto);
    $texto=str_replace("COUNT","",$texto);
    $texto=str_replace("(","",$texto);
    $texto=str_replace(")","",$texto);
    
    return $texto;
    
    }

