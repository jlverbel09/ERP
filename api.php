<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

require_once './conexion/conexion.pdo.php';
$data = (object) [];
/* 
    Guardado de datos de clientes verificando si es una Adicion o una Modificacion al registro 
*/
if (isset($_POST['accion']) && $_POST['accion'] == 'save') {
    if (empty($_POST['id'])) {
        $sql = "INSERT INTO clientes (cod_cliente, nombre, direccion, estado) VALUES (?,?,?,?)";
        $stmt = $conexion->prepare($sql);
        $response = $stmt->execute([$_POST['cod_cliente'], $_POST['nombre'], $_POST['direccion'], $_POST['estado']]);

        if ($response) {
            $data->status = 'success';
            $data->sql = $stmt;
        } else {
            $data->status = 'error';
            $data->sql = $stmt['queryString'];
            $data->response = $response;
        }
    } else {
        $sql = "UPDATE clientes SET cod_cliente= ? , nombre=?, direccion=?, estado=? WHERE id = " . $_POST['id'];
        $stmt = $conexion->prepare($sql);
        $response = $stmt->execute([$_POST['cod_cliente'], $_POST['nombre'], $_POST['direccion'], $_POST['estado']]);

        if ($response) {
            $data->status = 'success';
            $data->sql = $stmt;
        } else {
            $data->status = 'error';
            $data->sql = $stmt['queryString'];
            $data->response = $response;
        }
    }
}

/* 
    Lectura de datos de clientes registrados
*/
if (isset($_POST['accion']) && $_POST['accion'] == 'read') {

    $response = $conexion->query("SELECT * FROM clientes ORDER BY id DESC")->fetchAll();
    if ($response) {
        $data->response = $response;
        $data->status = 'success';
    }
}

/* 
    Eliminacion de clientes por medio de ID
*/
if (isset($_POST['accion']) && $_POST['accion'] == 'delete') {

    $id = $_POST['id'];

    $response = $conexion->query("DELETE FROM clientes WHERE id = $id")->execute();
    if ($response) {
        $data->response = $response;
        $data->status = 'success';
    }
}
/* 
    Lectura de datos de un cliente especifico por medio de ID
*/
if (isset($_POST['accion']) && $_POST['accion'] == 'read_one') {

    $id = $_POST['id'];

    $response = $conexion->query("SELECT * FROM clientes WHERE id = $id")->fetch();
    if ($response) {
        $data->response = $response;
        $data->status = 'success';
    }
}

echo json_encode($data);