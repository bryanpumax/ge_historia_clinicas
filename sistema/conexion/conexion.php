<?php 
     $usuario="hospital_hospital";
    $password="#_QPqg}xM%08"; 
    $serve="localhost";
    $bdd="hospital_bdd";
    $puerto="";
try{$pdo = new PDO(   "mysql:host=$serve;dbname=$bdd;charset=utf8",$usuario, $password,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
 
}catch (PDOException $e){die();}
?> 