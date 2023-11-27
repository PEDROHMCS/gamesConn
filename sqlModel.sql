use master

CREATE DATABASE ListaJogos;

USE ListaJogos;

CREATE TABLE tblUsuario (
	Cod_Usuario int primary key identity not null,
	Nome_Usuario varchar(50) not null unique,
	Email_Usuario varchar(100) not null unique,
	Senha_Usuario varchar(30) not null,
	Icone_Usuario varchar(255) DEFAULT('iconeUsuario/default.png'),
	Tipo_Usuario bit not null
)

CREATE TABLE tblLista (
	Cod_Lista int primary key identity not null,
	Cod_Usuario int foreign key references tblUsuario(Cod_Usuario) not null,
	Tamanho_Lista tinyint,
	JogosTerminados_Lista tinyint,
)

CREATE TABLE tblGenero (
	Cod_Genero int primary key identity not null,
	Nome_Genero varchar(50) not null unique,
	Descricao_Genero varchar(255)
)

CREATE TABLE tblJogo (
	Cod_Jogo int primary key identity not null,
	Cod_Genero int foreign key references tblGenero(Cod_Genero) not null,
	Nome_Jogo varchar(50) not null unique,
	Imagem_Jogo varchar(255) DEFAULT('imagem/default.png'),
	Sinopse_Jogo varchar(1000)
)

CREATE TABLE tblLista_Jogo (
	Cod_Lista_Jogo int primary key identity not null,
	Cod_Lista int foreign key references tblLista(Cod_Lista) not null,
	Cod_Jogo int foreign key references tblJogo(Cod_Jogo) not null,
	Descricao_Lista_Jogo varchar(255),
	Estado_Lista_Jogo varchar(15),
)

CREATE TABLE tblPlataforma (
	Cod_Plataforma int primary key identity not null,
	Nome_Plataforma varchar(50) unique,
	Icone_Plataforma varchar(255) DEFAULT('IconePlataforma/default.png')
)

CREATE TABLE tblJogo_Plataforma (
	Cod_Jogo_Plataforma int primary key identity not null,
	Cod_Jogo int foreign key references tblJogo(Cod_Jogo),
	Cod_Plataforma int foreign key references tblPlataforma(Cod_Plataforma),
)


CREATE PROCEDURE usp_InsertGenero
	@NomeGenero varchar(50),
	@DescGenero varchar(255)
AS
	Begin
		insert into tblGenero values(@NomeGenero, @DescGenero)
	End

CREATE PROCEDURE usp_DeleteGenero
	@CodGenero int
AS
	Begin
		delete tblGenero where Cod_Genero = @CodGenero
	End

CREATE PROCEDURE usp_GetGenero
	@CodGenero int
AS 
	Begin
		select * from tblGenero where Cod_Genero = @CodGenero
	End

CREATE PROCEDURE usp_InsertPlataforma
	@NomePlataforma varchar(50),
	@DescPlataforma varchar(255)
AS
	Begin
		insert into tblPlataforma values(@NomePlataforma, @DescPlataforma)
	End

CREATE PROCEDURE usp_DeletePlataforma
	@CodPlataforma int
AS
	Begin
		delete tblPlataforma where Cod_Plataforma = @CodPlataforma
	End

CREATE PROCEDURE usp_GetPlataforma
	@CodPlataforma int
AS 
	Begin
		select * from tblPlataforma where Cod_Plataforma = @CodPlataforma
	End



CREATE PROCEDURE usp_DeleteUsuario
	@CodUsuario int
AS
	Begin
		delete tblUsuario where Cod_Usuario = @CodUsuario
	End

CREATE PROCEDURE usp_GetUsuario
	@CodUsuario int
AS 
	Begin
		select * from tblUsuario where Cod_Usuario = @CodUsuario
	End

CREATE PROCEDURE usp_GetUsuarios
AS 
	Begin
		select * from tblUsuario
	End

CREATE PROCEDURE usp_InsertUsuario
	@NomeUsuario varchar(50),
	@SenhaUsuario varchar(30),
	@EmailUsuario varchar(100),
	@UserIcon varchar(255),
	@UserType bit
	

AS
	Begin
		insert into tblUsuario(Nome_Usuario, Senha_Usuario, Email_Usuario, Icone_Usuario, Tipo_Usuario) values
		(@NomeUsuario, @SenhaUsuario, @EmailUsuario, @UserIcon, @UserType) 
	End
