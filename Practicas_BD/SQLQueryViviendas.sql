USE MASTER;
go
if DB_ID (N'Viviendas') is not null
drop database Viviendas;
go
create database Viviendas
on
(name = Viviendas_dat,
filename = 'C:\bd\Viviendas.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = Viviendas_log,
filename = 'C:\bd\Viviendas.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE Viviendas;
go
create table Municipio
(
idMunicipio int not null,
idVivienda int not null,
nombre varchar(50) not null,
estatus bit default 1 not null
);
go
create table Persona
(
idPersona int not null,
idVivienda int not null,
nombre varchar (50) not null,
apellidoPaterno varchar (30) not null,
apellidoMaterno varchar (30) not null,
estatus bit default 1 not null);
go
create table Vivienda
(
idVivienda int not null,
idPersona int not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Municipio Add constraint PK_Municipio Primary key (idMunicipio)
alter table Persona Add constraint PK_Persona Primary key (idPersona)
alter table Vivienda Add constraint PK_Vivienda Primary key (idVivienda)
--llaves foraneas
--Municipio
alter table Municipio Add constraint FK_MunicipioVivienda foreign key (idVivienda) references vivienda(idVivienda) 
--Persona
alter table Persona Add constraint FK_PersonaVivienda foreign key (idVivienda) references vivienda(idVivienda)
--Vivienda
alter table Vivienda Add constraint FK_ViviendaPersona foreign key (idVivienda) references vivienda(idVivienda) 
--Indices
create index IX_Municipio ON Municipio(idMunicipio)
create index IX_Persona ON Persona(idPersona)
create index IX_Vivienda ON Vivienda(idVivienda)