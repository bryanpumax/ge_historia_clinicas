<?php 
     $usuario="lab_afuera";
    $password="b@l@123."; 
    $serve="localhost";
    $bdd="lab_hospita";
    $puerto="";
try{$pdo = new PDO(   "mysql:host=$serve;dbname=$bdd;charset=utf8",$usuario, $password,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

}catch (PDOException $e){die();}
?> 