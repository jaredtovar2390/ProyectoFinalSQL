USE MASTER;
go
if DB_ID (N'AgenciaDeViajesII') is not null
drop database AgenciaDeViajesII;
go
create database AgenciaDeViajesII
on
(name = AgenciaDeViajesII_dat,
filename = 'C:\bd\AgenciaDeViajesII.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = AgenciaDeViajesII_log,
filename = 'C:\bd\AgenciaDeViajesII.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE AgenciaDeViajesII;
go
create table Cliente
(
idCliente int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
estatus bit default 1 not null);
go
create table Finalidad
(
idFinalidad int not null,
estatus bit default 1 not null);
go
create table Hotel
(
idHotel int not null,
idPuntoRuta int not null,
nombre varchar(50) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table PuntoRuta 
(
idPuntoRuta int not null,
idTipoPuntoRuta int not null,
idTour int not null,
tipoEstancia varchar(20) not null,
estatus bit default 1 not null);
go
create table TipoPuntoRuta
(
idTipoPuntoRuta int not null,
estatus bit default 1 not null);
go
create table Tour
(
idTour int not null,
idFinalidad int not null,
descripcion varchar(60) not null,
estatus bit default 1 not null);
go
create table ClienteHotel
(
idClienteHotel int not null,
idCliente int not null,
idHotel int not null,
fecha datetime not null,
estatus bit default 1 not null);
go
create table ClienteTour
(
idClienteTour int not null,
idCliente int not null,
idTour int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Cliente Add constraint PK_Cliente Primary key (idCliente)
alter table Finalidad Add constraint PK_Finalidad Primary key (idFinalidad)
alter table Hotel Add constraint PK_Hotel Primary key (idHotel)
alter table PuntoRuta Add constraint PK_PuntoRuta Primary key (idPuntoRuta)
alter table TipoPuntoRuta Add constraint PK_TipoPuntoRuta Primary key (idTipoPuntoRuta)
alter table Tour Add constraint PK_Tour Primary key (idTour)
alter table ClienteHotel Add constraint PK_ClienteHotel Primary key (idClienteHotel)
alter table ClienteTour Add constraint PK_ClienteTour Primary key (idClienteTour)
--llaves foraneas
--Hotel
alter table Hotel Add constraint FK_HotelPuntoRuta foreign key (idPuntoRuta) references puntoRuta(idPuntoRuta)
--PuntoRuta
alter table PuntoRuta Add constraint FK_PuntoRutaTipoPuntoRuta foreign key (idTipoPuntoRuta) references tipoPuntoRuta(idTipoPuntoRuta)
alter table PuntoRuta Add constraint FK_PuntoRutaTour foreign key (idTour) references tour(idTour) 
--Tour
alter table Tour  Add constraint FK_TourFinalidad foreign key (idFinalidad) references finalidad(idFinalidad)
--ClienteHotel
alter table ClienteHotel Add constraint FK_ClienteHotelCliente foreign key (idCliente) references cliente(idCliente)
alter table ClienteHotel Add constraint FK_ClienteHotelHotel foreign key (idHotel) references hotel(idHotel)
--ClienteTour
alter table ClienteTour Add constraint FK_ClienteTourCliente foreign key (idCliente) references cliente(idCliente)
alter table ClienteTour Add constraint FK_ClienteTourTour foreign key (idTour) references tour(idTour)
--Indices
create index IX_Cliente ON Cliente(idCliente)
create index IX_Finalidad ON Finalidad(idFinalidad)
create index IX_Hotel ON Hotel(idHotel)
create index IX_PuntoRuta ON PuntoRuta(idPuntoRuta)
create index IX_TipoPuntoRuta ON TipoPuntoRuta(idTipoPuntoRuta)
create index IX_Tour ON Tour(idTour)
create index IX_ClienteHotel ON ClienteHotel(idClienteHotel)
create index IX_ClienteTour ON ClienteTour(idClienteTour)

