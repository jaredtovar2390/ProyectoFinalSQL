USE MASTER;
go
if DB_ID (N'Carreteras') is not null
drop database Carreteras;
go
create database Carreteras
on
(name = Carreteras_dat,
filename = 'C:\bd\Carreteras.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = Carreteras_log,
filename = 'C:\bd\Carreteras.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE Carreteras;
go
create table Carretera
(
idCarretera int not null,
nombre varchar(50) not null,
estatus bit default 1 not null);
go
create table Municipal
(
idMunicipal int not null,
nombre varchar(50) not null,
estatus bit default 1 not null);
go
create table Tramo
(
idTramo int not null,
idCarretera int not null,
descripcion varchar(60) not null,
estatus bit default 1 not null);
go
create table TramoMunicipal
(
idTramoMunicipal int not null,
idTramo int not null,
idMunicipal int not null,
kilometro int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Carretera Add constraint PK_Carretera Primary key (idCarretera)
alter table Municipal Add constraint PK_Municipal Primary key (idMunicipal)
alter table Tramo Add constraint PK_Tramo Primary key (idTramo)
alter table TramoMunicipal Add constraint PK_TramoMunicipal Primary key (idTramoMunicipal)
--llaves foraneas
--Tramo
alter table Tramo Add constraint FK_TramoCarretera foreign key (idCarretera) references carretera(idCarretera)
--TramoMunicipal
alter table TramoMunicipal Add constraint FK_TramoMunicipalTramo foreign key (idTramo) references tramo(idTramo)
alter table TramoMunicipal Add constraint FK_TramoMunicipalMunicipal foreign key (idMunicipal) references municipal(idMunicipal) 
--Indices
create index IX_Carretera ON Carretera(idCarretera)
create index IX_Municipal ON Municipal(idMunicipal)
create index IX_Tramo ON Tramo(idTramo)
create index IX_TramoMunicipal ON TramoMunicipal(idTramoMunicipal)