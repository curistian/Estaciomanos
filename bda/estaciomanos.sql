CREATE DATABASE Estaciomanos;
USE DATABASE Estaciomanos;

/* 
    Banco de dados para o projeto do Estaciomanos
    usu = usuario, estac = estacionamento , cmt = comentario
*/

CREATE TABLE Usuario(
   id_usuario INT NOT NULL UNIQUE,
   nome_usu VARCHAR (50) NOT NULL,
   idade_usu DATETIME NOT NULL,
   email_usu VARCHAR (50) NOT NULL UNIQUE,
   telefone_usu VARCHAR (11) NOT NULL UNIQUE,

   PRIMARY KEY (id_usuario)
);

CREATE TABLE Endereço_Usuario(
    id_endereco INT NOT NULL UNIQUE,
    id_usuario_endereco INT NOT NULL,
    endereço_usuario VARCHAR (50) NOT NULL UNIQUE,
    rua_usuario VARCHAR (50) NOT NULL,
    bairro_usuario VARCHAR (20) NOT NULL,
    cidade_usuario VARCHAR (20) NOT NULL,
    
    PRIMARY KEY (id_endereco),
    FOREIGN KEY (id_usuario_endereco) REFERENCES Usuario (id_usuario)

    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cartao(
    id_cartao INT NOT NULL UNIQUE,
    id_cartao_usu INT NOT NULL,
    apelido_cartão VARCHAR (20) NOT NULL,
    cvv VARCHAR (3) NOT NULL,
    data_vencimento DATETIME NOT NULL,
    /*Tipo de pagamento crédito ou débito 
    0 Crédito | 1 Débito*/
    forma_de_pagamento BIT NOT NULL,

    PRIMARY KEY (id_cartao),
    FOREIGN KEY (id_cartao_usu) REFERENCES Usuario (id_usuario)

    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Estacionamento(
    id_estac INT NOT NULL UNIQUE,
    nome_estac VARCHAR (50) NOT NULL,
    telefone_estac VARCHAR (11) NOT NULL UNIQUE,
    email_estac VARCHAR (50) NOT NULL UNIQUE,

    PRIMARY KEY (id_estac),

);

CREATE TABLE Endereço_Estacionamento(
    id_endereco_estac INT NOT NULL UNIQUE,
    id_endereco_estacionamento INT NOT NULL,

    endereço_estacionamento VARCHAR (50) NOT NULL UNIQUE,
    rua_estacionamento VARCHAR (50) NOT NULL,
    bairro_estacionamento VARCHAR (20) NOT NULL,
    cidade_estacionamento VARCHAR (20) NOT NULL, 
    
    PRIMARY KEY (id_endereco_estac),
    FOREIGN KEY (id_endereco_estacionamento) REFERENCES Estacionamento (id_estac)

    ON DELETE CASCADE ON UPDATE CASCADE
);



/*FK  Usuario, Estacionamento*/
CREATE TABLE Reserva (
    id_pedido INT NOT NULL UNIQUE,
    id_pedido_usu INT NOT NULL,
    id_pedido_esta INT NOT NULL,
    descricao TEXT (300) NOT NULL,
    horario DATETIME NOT NULL,

    PRIMARY KEY (id_pedido),

    FOREIGN KEY (id_pedido_usu) REFERENCES Usuario (id_usuario),
    FOREIGN KEY (id_pedido_esta) REFERENCES Estacionamento (id_estacionamento)

    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Comentario (
    email_cmt VARCHAR (50) NOT NULL,
    assunto_cmt VARCHAR (50) NOT NULL,
    comentario_cmt TEXT (300) NOT NULL,

    PRIMARY KEY (email)
    
);