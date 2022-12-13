USE MASTER;
go
if DB_ID (N'AgenciaDeAutos') is not null
drop database AgenciaDeAutos;
go
create database AgenciaDeAutos
on
(name = AgenciaDeAutos_dat,
filename = 'C:\bd\AgenciaDeAutos.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = AgenciaDeAutos_log,
filename = 'C:\bd\AgenciaDeAutos.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE AgenciaDeAutos;
go
create table Agencia
(
idAgencia int not null,
clave varchar(20) not null,
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
create table Cliente
(
idCliente int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
clave varchar(20) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table Coche
(
idCoche int not null,
idGaraje int not null,
clave varchar(20) not null,
costo int not null,
matricula varchar(30) not null,
estatus bit default 1 not null);
go
create table Garaje
(
idGaraje int not null,
clave varchar(20) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table Reserva
(
idReserva int not null,
idCliente int not null,
idAgencia int not null,
fechaInicio datetime not null,
fechaTermina datetime not null,
clave varchar(20) not null,
estatus bit default 1 not null);
go
create table CocheReserva
(
idCocheReserva int not null,
idCoche int not null,
idReserva int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Agencia Add constraint PK_Agencia Primary key (idAgencia)
alter table Cliente Add constraint PK_Cliente Primary key (idCliente)
alter table Coche Add constraint PK_Coche Primary key (idCoche)
alter table Garaje Add constraint PK_Garaje Primary key (idGaraje)
alter table Reserva Add constraint PK_Reserva Primary key (idReserva)
alter table CocheReserva Add constraint PK_CocheReserva Primary key (idCocheReserva)
--llaves foraneas
--Coche
alter table Coche Add constraint FK_CocheGaraje foreign key (idGaraje) references garaje(idGaraje)
--Reserva
alter table Reserva Add constraint FK_ReservaCliente foreign key (idCliente) references cliente(idCliente)
alter table Reserva Add constraint FK_ReservaAgencia foreign key (idAgencia) references agencia(idAgencia) 
--CocheReserva
alter table CocheReserva  Add constraint FK_CocheReservaCoche foreign key (idCoche) references coche(idCoche)
alter table CocheReserva Add constraint FK_CocheReservaReserva foreign key (idReserva) references reserva(idReserva) 
--Indices
create index IX_Agencia ON Agencia(idAgencia)
create index IX_Cliente ON Cliente(idCliente)
create index IX_Coche ON Coche(idCoche)
create index IX_Garaje ON Garaje(idGaraje)
create index IX_Reserva ON Reserva(idReserva)
create index IX_CocheReserva ON CocheReserva(idCocheReserva)