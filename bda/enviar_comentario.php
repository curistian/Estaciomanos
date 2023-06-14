<?php
#Conexão com BDA
include ("conexao.php");

#Coletando informações do HTML
$email = $_POST['email'];
$assunto = $_POST['subject'];
$comentario = $_POST['message'];

#Inserção de dados;
$sql = "INSERT INTO comentario(email_cmt,assunto_cmt,comentario_cmt) VALUES('$email', '$assunto','$comentario')";

#Confere se foi realizado corretamente
if (mysqli_query($mysqli, $sql)) {
    echo "Comentário enviado para nossa equipe com sucesso!"
} else {
    echo "houve um erro";
}   

?>