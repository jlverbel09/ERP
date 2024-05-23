<?php 
class Usuarios
{
    private $operacion = "";
    private $db;
    function __construct() {
        $this->db = new ConnectDB();
    }


    function listado(){
        $query = "SELECT * FROM clientes ";
        $rst = $this->db->enviarQuery($query,'R');
        
        if(@$rst[0]['id'] != ""){
            return $rst;
        }else{
            return array("ErrorStatus"=>true);
        }
    }

}
?>