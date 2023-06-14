<?php

    #if que confere se todos os espaços estão preenchidos.

    if (isset($_POST['submit']) && !empty($_POST['senha'])){

        #Conexão com BDA
        include ("conexao.php");
        
        #Coleta de informações no HTML
        $email = $_POST['nomedaclasse'];
        $senha = $_POST['nomedaclasse'];

        #Código que verifica se o usuário é cadastrado no sistema
        $sql = "SELECT * FROM Usuario WHERE email_usu = '$email' AND senha_usu = '$senha'";

        #Informa se as informações foram encontradas no sistema
        $result = $mysqli ->query($sql);

        if (mysqli_num_rows ($result) < 1){
        #Informa o usuário que está faltando informações

        }
        #Caso o login tenha ocorrido de forma correta mostra um aviso
        else
    }

    #Caso os dados não estejam preenchidos
    else {
        
    }
?>