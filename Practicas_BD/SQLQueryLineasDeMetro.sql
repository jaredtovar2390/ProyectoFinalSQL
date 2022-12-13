USE MASTER;
go
if DB_ID (N'LineasDeMetro') is not null
drop database LineasDeMetro;
go
create database LineasDeMetro
on
(name = LineasDeMetro_dat,
filename = 'C:\bd\LineasDeMetro.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = LineasDeMetro_log,
filename = 'C:\bd\LineasDeMetro.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE LineasDeMetro;
go
create table Acceso
(
idAcceso int not null,
idEstacion int not null,
nombre varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table Cochera
(
idCochera int not null,
idEstacion int not null,
nombre varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table Estacion
(
idEstacion int not null,
nombre varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table Linea 
(
idLinea int not null,
nombre varchar(50) not null,
ruta varchar(50) not null,
estatus bit default 1 not null);
go
create table Tren
(
idTren int not null,
idLinea int not null,
idCochera int not null,
clave varchar(20) not null,
estatus bit default 1 not null);
go
create table EstacionLinea
(
idEstacionLinea int not null,
idEstacion int not null,
idLinea int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Acceso Add constraint PK_Acceso Primary key (idAcceso)
alter table Cochera Add constraint PK_Cochera Primary key (idCochera)
alter table Estacion Add constraint PK_Estacion Primary key (idEstacion)
alter table Linea Add constraint PK_Linea Primary key (idLinea)
alter table Tren Add constraint PK_Tren Primary key (idTren)
alter table EstacionLinea Add constraint PK_EstacionLinea Primary key (idEstacionLinea)
--llaves foraneas
--Acceso
alter table Acceso Add constraint FK_AccesoEstacion foreign key (idEstacion) references estacion(idEstacion)
--Cochera
alter table Cochera Add constraint FK_CocheraEstacion foreign key (idEstacion) references estacion(idEstacion)
--Tren
alter table Tren  Add constraint FK_TrenLinea foreign key (idLinea) references linea(idLinea)
alter table Tren Add constraint FK_TrenCochera foreign key (idCochera) references cochera(idCochera) 
--EstacionLinea
alter table EstacionLinea  Add constraint FK_EstacionLineaLinea foreign key (idLinea) references linea(idLinea)
alter table EstacionLinea Add constraint FK_EstacionLineaEstacion foreign key (idEstacion) references estacion(idEstacion) 
--Indices
create index IX_Acceso ON Acceso(idAcceso)
create index IX_Cochera ON Cochera(idCochera)
create index IX_Estacion ON Estacion(idEstacion)
create index IX_Linea ON Linea(idLinea)
create index IX_Tren ON Tren(idTren)
create index IX_EstacionLinea ON EstacionLinea(idEstacionLinea)