CREATE SCHEMA restaurante;
USE restaurante;

CREATE TABLE cliente(
idCliente INT PRIMARY KEY,
cpf VARCHAR(14),
nome VARCHAR(150),
rua VARCHAR(150),
numero INT,
bairro VARCHAR(50));

CREATE TABLE atendente(
matricula INT(3) ZEROFILL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
salario FLOAT NOT NULL,
responsavel INT(3) ZEROFILL,
CONSTRAINT ATEN_ATEN FOREIGN KEY (responsavel) REFERENCES atendente(matricula));

CREATE TABLE contato_atendente(
idAtendente INT(3) ZEROFILL NOT NULL,
telefone VARCHAR(15) NOT NULL,
PRIMARY KEY (idAtendente, telefone),
CONSTRAINT CON_ATEN FOREIGN KEY (idAtendente) REFERENCES atendente(matricula));

CREATE TABLE item(
codigo INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco FLOAT NOT NULL,
tipo ENUM("Prato", "Bebida"));

CREATE TABLE mesa(
numero INT(2) ZEROFILL PRIMARY KEY);

CREATE TABLE pedido(
idPedido INT AUTO_INCREMENT PRIMARY KEY,
inicio TIME NOT NULL,
fim TIME NOT NULL,
duracao INT AS (TIME_TO_SEC(fim) - TIME_TO_SEC(inicio)) STORED,
atendente INT(3) ZEROFILL NOT NULL,
cliente INT NOT NULL,
mesa INT(2) ZEROFILL NOT NULL,
CONSTRAINT PED_ATEN FOREIGN KEY (atendente) REFERENCES atendente(matricula),
CONSTRAINT PED_CLI FOREIGN KEY (cliente) REFERENCES cliente(idCliente),
CONSTRAINT PED_MESA FOREIGN KEY (mesa) REFERENCES mesa(numero));

CREATE TABLE pedido_has_items(
idPedido INT AUTO_INCREMENT NOT NULL,
idItem INT NOT NULL,
PRIMARY KEY (idPedido, idItem),
CONSTRAINT PED_PED FOREIGN KEY (idPedido) REFERENCES pedido(idPedido),
CONSTRAINT PED_ITEM FOREIGN KEY (idItem) REFERENCES item(codigo));
