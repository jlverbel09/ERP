<form method="POST" action="suma.php" name="suma">
    <label for="">Valor 1</label>
    <input type="text" id="" name="valor1">
    <label for="">Valor 2</label>
    <input type="text" id="" name="valor2">
    <input type="submit" value="sumar" name="sumado">
</form>
<h1>RESULTADO CALCULO</h1>

<?php 
if(isset($_POST['sumado'])){
    if(empty($_POST['valor1'])){
        echo '- Digite el valor 1<br>';
    }
    if(empty($_POST['valor2'])){
        echo '- Digite el valor 2';
    }
    if(!empty($_POST['valor1']) && (!empty($_POST['valor2'])) ){
        echo 'El resultado es: '. suma($_POST['valor1'],$_POST['valor2']);
    }
}

echo '<br><br>-----------------------------------------------------------------------';

function suma($paramA, $paramB){
    return $paramA+$paramB;
}

echo '<h2>EJEMPLOS DIRECTOS</h2>';
echo suma(4,5);
echo '<br>';
echo suma(75,45);
echo '<br>';
echo suma(32,18);
echo '<br>';
echo suma(21,51);
echo '<br>';
echo suma(515,745);