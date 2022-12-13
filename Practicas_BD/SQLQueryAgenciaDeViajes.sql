USE MASTER;
go
if DB_ID (N'AgenciaDeViajes') is not null
drop database AgenciaDeViajes;
go
create database AgenciaDeViajes
on
(name = AgenciaDeViajes_dat,
filename = 'C:\bd\AgenciaDeViajes.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = AgenciaDeViajes_log,
filename = 'C:\bd\AgenciaDeViajes.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE AgenciaDeViajes;
go
create table Hotel
(
idHotel int not null,
nombre varchar(50) not null,
codigo varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table Sucursal
(
idSucursal int not null,
codigo varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table Turista
(
idTurista int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
codigo varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table Viaje 
(
idViaje int not null,
idSucursal int not null,
idTurista int not null,
estatus bit default 1 not null);
go
create table Vuelo
(
idVuelo int not null,
plazaTuristica varchar(30) not null,
destino varchar(20) not null,
origen varchar(20) not null,
plazasTotales int not null,
numeroVuelo int not null,
fecha datetime not null,
estatus bit default 1 not null);
go
create table ViajeHotel
(
idViajeHotel int not null,
idViaje int not null,
idHotel int not null,
fechaPartida datetime not null,
fechaLlegada datetime not null,
reginem varchar(20) not null,
estatus bit default 1 not null);
go
create table ViajeVuelo
(
idViajeVuelo int not null,
idViaje int not null,
idVuelo int not null,
clase varchar(20) not null,
estatus bit default 1 not null);
--llaves primarias
alter table Hotel Add constraint PK_Hotel Primary key (idHotel)
alter table Sucursal Add constraint PK_Sucursal Primary key (idSucursal)
alter table Turista Add constraint PK_Turista Primary key (idTurista)
alter table Viaje Add constraint PK_Viaje Primary key (idViaje)
alter table Vuelo Add constraint PK_Vuelo Primary key (idVuelo)
alter table ViajeHotel Add constraint PK_ViajeHotel Primary key (idViajeHotel)
alter table ViajeVuelo Add constraint PK_ViajeVuelo Primary key (idViajeVuelo)
--llaves foraneas
--Viaje
alter table Viaje Add constraint FK_ViajeSucursal foreign key (idSucursal) references sucursal(idSucursal)
alter table Viaje Add constraint FK_ViajeTurista foreign key (idTurista) references turista(idTurista) 
--ViajeHotel
alter table ViajeHotel Add constraint FK_ViajeHotelViaje foreign key (idViaje) references viaje(idViaje)
alter table ViajeHotel Add constraint FK_ViajeHotelHotel foreign key (idHotel) references hotel(idHotel) 
--ViajeVuelo
alter table ViajeVuelo  Add constraint FK_ViajeVueloViaje foreign key (idViaje) references viaje(idViaje)
alter table ViajeVuelo Add constraint FK_ViajeVueloVuelo foreign key (idVuelo) references vuelo(idVuelo) 
--Indices
create index IX_Hotel ON Hotel(idHotel)
create index IX_Sucursal ON Sucursal(idSucursal)
create index IX_Turista ON Turista(idTurista)
create index IX_Viaje ON Viaje(idViaje)
create index IX_Vuelo ON Vuelo(idVuelo)
create index IX_ViajeHotel ON ViajeHotel(idViajeHotel)
create index IX_ViajeVuelo ON ViajeVuelo(idViajeVuelo)