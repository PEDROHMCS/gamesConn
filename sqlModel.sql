use master
drop database ListaJogos
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
	Cod_Usuario int foreign key references tblUsuario(Cod_Usuario) not null unique,
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


CREATE PROCEDURE usp_GetPlataforma
	@CodPlataforma int
AS 
	Begin
		select * from tblPlataforma where Cod_Plataforma = @CodPlataforma
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



CREATE PROCEDURE usp_InsertJogo
@gameCat int,
@gameName varchar(50),
@gameIcon varchar(255),
@gameSin varchar(1000)

AS
	Begin
		insert into tblJogo(Cod_Genero, Nome_Jogo, Imagem_Jogo, Sinopse_Jogo) values
		(@gameCat, @gameName, @gameIcon, @gameSin) 
	End

create procedure usp_GetJogo
@gameName varchar(50)
as
begin
	select * from tblJogo where Nome_Jogo = @gameName
end

create procedure usp_GetJogos
as
begin
	select * from tblJogo
end


exec usp_InsertUsuario 'Marques', 'salame21', 'pedrohmcspro@gmail.com', 'hollow.jpg', 0

drop procedure listarJogosUsuario

CREATE PROCEDURE listarJogosUsuario
@CodUser int
as
begin
	select Jogo.Nome_Jogo, listJg.Cod_Jogo, listJg.Cod_Lista, listJg.Estado_Lista_Jogo, gen.Nome_Genero, listJg.Descricao_Lista_Jogo, Jogo.Imagem_Jogo from tblJogo as Jogo inner join
		tblLista_Jogo as listJg on Jogo.Cod_Jogo = listJg.Cod_Jogo inner join
			tblGenero as gen on Jogo.Cod_Genero = gen.Cod_Genero inner join
				tblLista as lis on lis.Cod_Lista = listJg.Cod_Lista inner join
					tblUsuario as usuario on usuario.Cod_Usuario = lis.Cod_Usuario where usuario.Cod_Usuario = @CodUser
end

exec listarJogosUsuario 2

create procedure usp_getLista
@CodUsuario int
as
begin
	select * from tblLista where Cod_Usuario = @CodUsuario
end

create procedure usp_insertLista
@CodUsuario int
as
begin
	Declare @dbUserValues int;
	select @dbUserValues = Cod_Usuario from tblLista

	insert into tblLista(Cod_Usuario, Tamanho_Lista, JogosTerminados_Lista) values
	(@CodUsuario, 0, 0)
end

drop procedure usp_InsertListaJogo

create procedure usp_InsertListaJogo
@CodLista int, -- 1
@CodJogo int, -- 1
@Descricao varchar(255),
@EstadoJogo varchar(15)
as
begin
	Declare @codDb int
	select @codDb = Cod_Jogo from tblLista_Jogo where Cod_Lista = @CodLista
	
	print(@codDb)
	print(@codJogo)

	if(@CodJogo = @codDb)
		begin
			print('Error')
			print(@codDb)
		end
	else
	begin
		insert into tblLista_Jogo(Cod_Lista, Cod_Jogo, Descricao_Lista_Jogo, Estado_Lista_Jogo) values
		(@CodLista, @CodJogo, @Descricao, @EstadoJogo)
	end
	
end

create procedure usp_UpdateListaJogo
@CodLista int, -- 1
@CodJogo int, -- 1
@Descricao varchar(255),
@EstadoJogo varchar(15)
as
begin
	update tblLista_Jogo set Descricao_Lista_Jogo = @Descricao, Estado_Lista_Jogo = @EstadoJogo where Cod_Jogo = @CodJogo and Cod_Lista = @CodLista
end

exec usp_UpdateListaJogo 1, 2, 'Nova descrição', 'Pretendo Jogar'


delete from tblLista_Jogo

exec usp_InsertListaJogo 1, 1, 'atatatata', 'finalizado'

exec usp_GetUsuarios

select * from tblPlataforma

select * from tblGenero

select * from tblLista_Jogo

select * from tblJogo

delete from tblLista_Jogo where Cod_Lista_Jogo = 7