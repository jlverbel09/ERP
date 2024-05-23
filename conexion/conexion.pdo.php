<?php
$servidor = "localhost";
$usuario = "test";
$password = "123456789";
$database = "erp";
try {
    $conexion = new PDO("mysql:host=$servidor;dbname=$database", $usuario, $password);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "Conexión realizada Satisfactoriamente";
} catch (PDOException $e) {
    echo "La conexión ha fallado: " . $e->getMessage();
}