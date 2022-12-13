USE MASTER;
go
if DB_ID (N'FutbolSoccer') is not null
drop database FutbolSoccer;
go
create database FutbolSoccer
on
(name = FutbolSoccer_dat,
filename = 'C:\bd\FutbolSoccer.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = FutbolSoccer_log,
filename = 'C:\bd\FutbolSoccer.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE FutbolSoccer;
go
CREATE TABLE Colegiado
(
idColegiado int not null,
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
tipo varchar (50) not null,
estatus bit default 1 not null);
go
CREATE TABLE Equipo
(
idEquipo int not null,
nombre varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null);
go
CREATE TABLE Jugador
(
idJugador int not null,
idEquipo int null,
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
calle varchar (50) not null,
numero char (10) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
curp char (25) not null,
estatus bit default 1 not null);
go
CREATE TABLE Partido
(
idPartido int not null,
idEquipo int null,
nombre varchar (50) not null,
tipo varchar (50) not null,
estatus bit default 1 not null);
go
CREATE TABLE Puesto
(
idPuesto int not null,
nombre varchar (50) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
);
go
CREATE TABLE JugadorPuesto
(
idJugadorPuesto int not null,
idJugador int null,
idPuesto int null,
feche datetime not null,
estatus bit default 1 not null);
go
CREATE TABLE ColegiadoPartido
(
idColegiadoPartido int not null,
idColegiado int null,
idPartido int null,
estatus bit default 1 not null);
GO
--llaves primarias
alter table Colegiado Add constraint PK_Colegiado Primary key (idColegiado)
alter table Equipo Add constraint PK_Equipo Primary key (idEquipo)
alter table Jugador Add constraint PK_Jugador Primary key (idJugador)
alter table Partido Add constraint PK_Partido Primary key (idPartido)
alter table Puesto Add constraint PK_Puesto Primary key (idPuesto)
alter table JugadorPuesto Add constraint PK_JugadorPuesto Primary key (idJugadorPuesto)
alter table ColegiadoPartido Add constraint PK_ColegiadoPartido Primary key (idColegiadoPartido)
--llaves foraneas
--Jugador
alter table Jugador Add constraint FK_JugadorEquipo foreign key (idEquipo) references equipo(idEquipo)
--Partido
alter table Partido Add constraint FK_PartidoEquipo foreign key (idEquipo) references equipo(idEquipo)
--JugadorPuesto
alter table JugadorPuesto Add constraint FK_JugadorPuestoJugador foreign key (idJugador) references jugador(idJugador)
alter table JugadorPuesto Add constraint FK_JugadorPuestoPuesto foreign key (idPuesto) references puesto(idPuesto) 
--ColegiadoPartido
alter table ColegiadoPartido Add constraint FK_ColegiadoPartidoColegiado foreign key (idColegiado) references colegiado(idColegiado)
alter table ColegiadoPartido Add constraint FK_ColegiadoPartidoPartido foreign key (idPartido) references partido(idPartido) 
--Indices
create index IX_Colegiado ON Colegiado(idColegiado)
create index IX_Equipo ON Equipo(idEquipo)
create index IX_Jugador ON Jugador(idJugador)
create index IX_Partido ON Partido(idPartido)
create index IX_Puesto ON Puesto(idPuesto)
create index IX_JugadorPuesto ON JugadorPuesto(idJugadorPuesto)
create index IX_ColegiadoPartido ON ColegiadoPartido(idColegiadoPartido)