<?php 

echo '------------CONEXION MYSQLI---------------';
echo '<br><br><br>';

/* Prueba conexion Mysqli */
include 'globalConfig.php';
include 'conexion/conexion.mysql.php';
include 'class/Usuario.php';
$usuario = new Usuarios();
$listado = $usuario->listado();

foreach($listado as $list){
    echo $list['id'] .'|'. $list['nombre'].'<br>';
}

echo '<br><br><br>';
echo '------------CONEXION PDO---------------';
echo '<br><br><br>';

/* Prueba conexion PDO */

require_once 'conexion/conexion.pdo.php';

$stmt = $conexion->prepare("SELECT * FROM clientes c ");
$stmt->execute();
// iterating over a statement
foreach($stmt as $row) {
    echo $row['id'] .'|'. $row['nombre'].'<br>';
}