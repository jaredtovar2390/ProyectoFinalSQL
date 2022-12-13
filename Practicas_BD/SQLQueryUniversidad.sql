USE MASTER;
go
if DB_ID (N'Universidad') is not null
drop database Universidad;
go
create database Universidad
on
(name = Universidad_dat,
filename = 'C:\bd\Universidad.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = Universidad_log,
filename = 'C:\bd\Universidad.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE Universidad;
go
create table Area
(
idArea int not null,
nombre varchar(50) not null,
estatus bit default 1 not null);
go
create table Catedra
(
idCatedra int not null,
idDepartamento int not null,
idFacultad int not null,
nombre varchar(50) not null,
estatus bit default 1 not null);
go
create table Departamento
(idDepartamento int not null,
idArea int not null,
nombre varchar(50) not null,
estatus bit default 1 not null);
go
create table Facultad
(
idFacultad int not null,
nombre varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table Profesor
(idProfesor int not null,
idDepartamento int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
rfc varchar(40) not null,
domicilio varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table CatedraProfesor
(idCatedraProfesor int not null,
idCatedra int not null,
idProfesor int not null,
fechaAdscrito datetime not null,
estatus bit default 1 not null);
go
create table DepartamentoFacultad
(idDepartamentoFacultad int not null,
idDepartamento int not null,
idFacultad int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Area Add constraint PK_Area Primary key (idArea)
alter table Catedra Add constraint PK_Catedra Primary key (idCatedra)
alter table Departamento Add constraint PK_Departamento Primary key (idDepartamento)
alter table Facultad Add constraint PK_Facultad Primary key (idFacultad)
alter table Profesor Add constraint PK_Profesor Primary key (idProfesor)
alter table CatedraProfesor Add constraint PK_CatedraProfesor Primary key (idCatedraProfesor)
alter table DepartamentoFacultad Add constraint PK_DepartamentoFacultad Primary key (idDepartamentoFacultad)
--llaves foraneas
--Catedra
alter table Catedra Add constraint FK_CatedraDepartamento foreign key (idDepartamento) references departamento(idDepartamento)
alter table Catedra Add constraint FK_CatedraFacultad foreign key (idFacultad) references facultad(idFacultad) 
--Departamento
alter table Departamento Add constraint FK_DepartamentoArea foreign key (idArea) references area(idArea)
--Profesor
alter table Profesor Add constraint ProfesorDepartamento foreign key (idDepartamento) references departamento(idDepartamento)
--CatedraProfesor
alter table CatedraProfesor Add constraint FK_CatedraProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
alter table CatedraProfesor Add constraint FK_CatedraProfesorCatedra foreign key (idCatedra) references catedra(idCatedra) 
--DepartamentoFacultad
alter table DepartamentoFacultad Add constraint FK_DepartamentoFacultadDepartamento foreign key (idDepartamento) references departamento(idDepartamento)
alter table DepartamentoFacultad Add constraint FK_DepartamentoFacultadFacultad foreign key (idFacultad) references facultad(idFacultad) 
--Indices
create index IX_Area ON Area(idArea)
create index IX_Catedra ON Catedra(idCatedra)
create index IX_Departamento ON Departamento(idDepartamento)
create index IX_Facultad ON Facultad(idFacultad)
create index IX_Profesor ON Profesor(idProfesor)
create index IX_CatedraProfesor ON CatedraProfesor(idCatedraProfesor)
create index IX_DepartamentoFacultad ON DepartamentoFacultad(idDepartamentoFacultad)