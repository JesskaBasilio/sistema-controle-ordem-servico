create database dbinfox;
use dbinfox;

CREATE TABLE tbusuarios (
iduser INT PRIMARY KEY,
usuario VARCHAR(50) NOT NULL,
fone VARCHAR (15),
login VARCHAR (15) NOT NULL UNIQUE,
senha VARCHAR (15) NOT NULL
);

describe tbusuarios;

INSERT INTO tbusuarios (iduser, usuario, fone, login, senha)
VALUES (1, 'Maria Silva', '9999-9999', 'mariasilva', '01234');

SELECT * FROM tbusuarios;

INSERT INTO tbusuarios (iduser, usuario, fone, login, senha)
VALUES (2, 'Administrador', '9999-9999', 'admin', 'admin');

INSERT INTO tbusuarios (iduser, usuario, fone, login, senha, perfil)
VALUES (3, 'Bill Gates', '9999-9999', 'bill', '01234', "user");

UPDATE tbusuarios set fone='8888-8888' where iduser=2;

DELETE FROM tbusuarios WHERE iduser=3; 

CREATE TABLE tbclientes (
idClient INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpfCliente VARCHAR(50) NOT NULL,
foneCliente VARCHAR (15) NOT NULL,
emailCliente VARCHAR (50),
enderecoCliente VARCHAR(100),
numeroCasaCliente VARCHAR(50),
cidadeCliente VARCHAR (100),
estadoCliente VARCHAR (100),
bairroCliente VARCHAR (100),
cepCliente VARCHAR (50)
);
select idClient as id, nomeCliente as nome, cpfCliente as cpf, foneCliente as fone, emailCliente as email, enderecoCliente as endereco, 
numeroCasaCliente as numero, cidadeCliente as cidade, estadoCliente as estado, bairroCliente as bairro, cepCliente as cep from tbclientes; 

/*drop table tbclientes; caso precise deletar a tabela*/
/*a seleção abaixo ordena todos os clientes por ordem alfabética*/
SELECT * FROM tbclientes ORDER BY nomeCliente;


DESCRIBE tbclientes;

INSERT INTO tbclientes (nomeCliente, cpfCliente, foneCliente, emailCliente, enderecoCliente, 
numeroCasaCliente, cidadeCliente, estadoCliente, bairroCliente, cepCliente)
VALUES ('Gregory House', '111.111.111-11', '(00)99999-9999', 'gregory@gmail.com', 
'Rua Nova York', 'n°1B', 'São Paulo', 'SP', 'Jardim Mediterrâneo','99.999-999');

INSERT INTO tbclientes (nomeCliente, cpfCliente, foneCliente, emailCliente, enderecoCliente)
VALUES ('Gilmar Ambrosio', '111.111.111-11', '(00)99999-9999', 'gilmar@gmail.com', 
'Rua Esperança');

INSERT INTO tbclientes (nomeCliente, cpfCliente, foneCliente, emailCliente, enderecoCliente)
VALUES ('Gertrudes Contantine', '123.111.111-11', '(00)99999-8999', 'gertru@gmail.com', 
'Rua Brinquedo');

INSERT INTO tbclientes (nomeCliente, cpfCliente, foneCliente, emailCliente, enderecoCliente)
VALUES ('Jessica Katila', '111.177.111-11', '(00)99999-9559', 'jess@gmail.com', 
'Rua Coxinha');

INSERT INTO tbclientes (nomeCliente, cpfCliente, foneCliente, emailCliente, enderecoCliente)
VALUES ('Julamar Justino', '111.111.981-11', '(00)9998-9999', 'julmar@gmail.com', 
'Rua Esperança');

SELECT * FROM tbclientes WHERE nomeCliente LIKE "J%";

SELECT * FROM tbclientes;
SELECT idClient as Id, nomeCliente as Nome, foneCliente as Fone from tbclientes where nomeCliente like 'J%';
CREATE TABLE tbos (
OS INT PRIMARY KEY auto_increment,
data_os TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
equipamento VARCHAR (150) NOT NULL,
defeito VARCHAR (300) NOT NULL,
servico VARCHAR (150),
tecnico VARCHAR (100),
valor DECIMAL(10,2),
idClient INT NOT NULL,
FOREIGN KEY (idClient) references tbclientes (idClient)
);

DESCRIBE tbos;

INSERT INTO tbos (equipamento, defeito, servico, tecnico, valor, idClient)
VALUES ('notbook', 'não liga' , 'trocar fonte','José' , 87.50, 1);

-- a linha abaixo altera a tabela adicionando um campo em uma determinada posiçãoptimize
ALTER TABLE tbos add tipo VARCHAR (15) NOT NULL AFTER data_os;
ALTER TABLE tbos add situacao VARCHAR (15) NOT NULL AFTER tipo;
ALTER TABLE tbos MODIFY COLUMN situacao VARCHAR(20) NOT NULL;

select os, date_format(data_os, '%d/%m/%Y - %H:%i'), tipo, situacao, equipamento, defeito, servico, tecnico, valor, idClient from tbos where os=1;



SELECT * FROM tbos;

SELECT 
O.os,equipamento,defeito,servico,valor,
C.nomeCliente,foneCliente
FROM tbos AS O
INNER JOIN tbclientes AS C
ON (O.idClient = C.idClient);

ALTER TABLE tbusuarios add column perfil VARCHAR (20) NOT NULL;

ALTER TABLE tbusuarios drop column perfil;
SELECT * FROM tbusuarios;
UPDATE tbusuarios set perfil = "admin" WHERE idUser=2;
UPDATE tbusuarios set perfil = "admin" WHERE idUser=1;
/*O bloco de instrução abaixo faz a seleção e a união de dados de duas tabelas
OSER é uma variável que contém os campos desejados da tabela OS
CLI é outra variável que contém os campos desejados da tabela clientes*/
SELECT
OSER.os, data_os, tipo, situacao, equipamento, valor,
CLI.nomeCliente, foneCliente
FROM tbos AS OSER
INNER JOIN tbclientes AS CLI
ON (CLI.idClient = OSER.idClient);

/*o bloco abaixo traz a ordem de serviço específica*/
select * from tbos where os=2;

/*mostra o último número gerado dentro de uma OS*/
select max(os) from tbos;










