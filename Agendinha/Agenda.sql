CREATE DATABASE IF NOT EXISTS agenda;
USE agenda;

DROP TABLE IF EXISTS 'usuario';
CREATE TABLE 'usuario'(
	'idUsuario' INT(11) NOT NULL auto_increment,
	'nome' varchar(50) NOT NULL,
	'login' VARCHAR(20) NOT NULL,
	'senha' VARCHAR(10) NOT NULL,
	PRIMARY KEY('idUsuario'),
	UNIQUE KEY 'unique_login'('login')
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS 'contato';
CREATE TABLE 'contato'(
	'idContato' INT(11) NOT NULL auto_increment,
    'nome' VARCHAR(50) NOT NULL,
    'cargo' VARCHAR(30) default NULL,
	'empresa' VARCHAR(30) default NULL,
	'dataAniversario' date default NULL,
	'idUsuario' INT(11) default NULL,
	PRIMARY KEY('idContato'),
	KEY 'idUsuario'('idUsuario'),	
	CONSTRAINT 'FK_Contato_Usuario' FOREIGN KEY('idUsuario') 
	REFERENCES 'usuario'('idUsuario') ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS 'meiocontato';
CREATE TABLE 'meiocontato'(
	'idMeioContato' INT(11) NOT NULL auto_increment,
    'tipoContato' VARCHAR(15) NOT NULL,
    'conteudo' VARCHAR(250) NOT NULL,
	'idContato' INT(11) NOT NULL,	
	PRIMARY KEY('idMeioContato'),
	KEY 'idContato'('idContato'),	
	CONSTRAINT 'FK_MeioContato' FOREIGN KEY('idContato') 
	REFERENCES 'contato'('idContato') ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS 'endereco';
CREATE TABLE 'endereco'(
	'idEndereco' INT(11) NOT NULL auto_increment,
	'endereco' VARCHAR(250) NOT NULL,
	'numero' VARCHAR(10) default NULL,
	'complemento' VARCHAR(50) default NULL,
	'bairro' VARCHAR(100) NOT NULL,
	'cidade' VARCHAR(100) NOT NULL,
	'uf' CHAR(2) NOT NULL,
	'tipoEndereco' VARCHAR(10) default NULL,
	'idContato' INT(11) default NULL,
	PRIMARY KEY('idEndereco'),
	CONSTRAINT 'FK_Endereco_Contato' FOREIGN KEY('idContato') 
	REFERENCES 'contato'('idContato') ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;