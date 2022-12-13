USE MASTER;
go
if DB_ID (N'ServicioMilitar') is not null
drop database ServicioMilitar;
go
create database ServicioMilitar
on
(name = ServicioMilitar_dat,
filename = 'C:\bd\ServicioMilitar.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = ServicioMilitar_log,
filename = 'C:\bd\ServicioMilitar.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE ServicioMilitar;
go
create table Compania
(
idCompania int not null,
actividad varchar(50) not null,
estatus bit default 1 not null
);
go
create table Cuartel
(
idCuartel int not null,
codigo varchar(10) not null,
direccion varchar (50) not null,
estatus bit default 1 not null);
go
create table Cuerpo
(idCuerpo int not null,
denominacion varchar(50) not null,
estatus bit default 1 not null);
go
create table Servicio
(idServicio int not null,
codigo varchar(10) not null,
descripcion varchar(50) not null,
estatus bit default 1 not null);
go
create table Soldado
(
idSoldado int not null,
idCuartel int not null,
idCompania int not null,
idCuerpo int not null,
nombre varchar (50) not null,
apellidoPaterno varchar (30) not null,
apellidoMaterno varchar (30) not null,
codigo varchar(10) not null,
graduacion varchar(20) not null,
estatus bit default 1 not null);
go
create table CompaniaCuartel
(
idCompaniaCuartel int not null,
idCompania int not null,
idCuartel int not null,
estatus bit default 1 not null);
go
create table SoldadoServicio
(
idSoldadoServicio int not null,
idSoldado int not null,
idServicio int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Compania Add constraint PK_Compania Primary key (idCompania)
alter table Cuartel Add constraint PK_Cuartel Primary key (idCuartel)
alter table Cuerpo Add constraint PK_Cuerpo Primary key (idCuerpo)
alter table Servicio Add constraint PK_Servicio Primary key (idServicio)
alter table Soldado Add constraint PK_Soldado Primary key (idSoldado)
alter table CompaniaCuartel Add constraint PK_CompaniaCuartel Primary key (idCompaniaCuartel)
alter table SoldadoServicio Add constraint PK_SoldadoServicio Primary key (idSoldadoServicio)
--llaves foraneas
--Soldado
alter table Soldado Add constraint FK_SoldadoCuartel foreign key (idCuartel) references Cuartel(idCuartel) 
alter table Soldado Add constraint FK_SoldadoCompania foreign key (idCompania) references Compania(idCompania)
alter table Soldado Add constraint FK_SoldadoCuerpo foreign key (idCuerpo) references Cuerpo(idCuerpo) 
--CompaniaCuartel
alter table CompaniaCuartel Add constraint FK_CompaniaCuartelCompania foreign key (idCompania) references Compania(idCompania)
alter table CompaniaCuartel Add constraint FK_CompaniaCuartelCuartel foreign key (idCuartel) references Cuartel(idCuartel) 
--SoldadoServicio
alter table SoldadoServicio Add constraint FK_SoldadoServicioSoldado foreign key (idSoldado) references Soldado(idSoldado)
alter table SoldadoServicio Add constraint FK_SoldadoServicioServicio foreign key (idServicio) references Servicio(idServicio) 
--Indices
create index IX_Compania ON Compania(idCompania)
create index IX_Cuartel ON Cuartel(idCuartel)
create index IX_Cuerpo ON Cuerpo(idCuerpo)
create index IX_Servicio ON Servicio(idServicio)
create index IX_Soldado ON Soldado(idSoldado)
create index IX_CompaniaCuartel ON CompaniaCuartel(idCompaniaCuartel)
create index IX_SoldadoServicio ON SoldadoServicio(idSoldadoServicio)