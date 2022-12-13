USE MASTER;
go
if DB_ID (N'ConcesionarioDeAutomoviles') is not null
drop database ConcesionarioDeAutomoviles;
go
create database ConcesionarioDeAutomoviles
on
(name = ConcesionarioDeAutomoviles_dat,
filename = 'C:\bd\ConcesionarioDeAutomoviles.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = ConcesionarioDeAutomoviles_log,
filename = 'C:\bd\ConcesionarioDeAutomoviles.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE ConcesionarioDeAutomoviles;
go
create table Cliente
(
idCliente int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
rfc varchar (40) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table Opcion
(
idOpcion int not null,
nombre varchar(20) not null,
descripcion varchar(60) not null,
estatus bit default 1 not null);
go
create table Usado
(idUsado int not null,
idCliente int not null,
marca varchar(30) not null,
modelo varchar(30) not null,
matricula varchar(30) not null,
precio int not null,
fecha datetime not null,
estatus bit default 1 not null);
go
create table Vehiculo
(idVehiculo int not null,
marca varchar(30) not null,
modelo varchar(30) not null,
cilindro varchar(30) not null,
precio int not null,
estatus bit default 1 not null);
go
create table Vendedor
(
idVendedor int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
telefono int not null,
estatus bit default 1 not null);
go
create table Venta
(
idVenta int not null,
idVehiculo int not null,
idVendedor int not null,
idCliente int not null,
fecha datetime not null,
matricula varchar(30) not null,
estatus bit default 1 not null);
go
create table OpcionVehiculo
(
idOpcionVehiculo int not null,
idOpcion int not null,
idVehiculo int not null,
precio int not null,
estatus bit default 1 not null);
go
create table OpcionVenta
(
idOpcionVenta int not null,
idOpcion int not null,
idVenta int not null,
precio int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Cliente Add constraint PK_Cliente Primary key (idCliente)
alter table Opcion Add constraint PK_Opcion Primary key (idOpcion)
alter table Usado Add constraint PK_Usado Primary key (idUsado)
alter table Vehiculo Add constraint PK_Vehiculo Primary key (idVehiculo)
alter table Vendedor Add constraint PK_Vendedor Primary key (idVendedor)
alter table Venta Add constraint PK_Venta Primary key (idVenta)
alter table OpcionVehiculo Add constraint PK_OpcionVehiculo Primary key (idOpcionVehiculo)
alter table OpcionVenta Add constraint PK_OpcionVenta Primary key (idOpcionVenta)
--llaves foraneas
--Usado
alter table Usado Add constraint FK_UsadoCliente foreign key (idCliente) references cliente(idCliente)
--Venta
alter table Venta Add constraint FK_VentaVehiculo foreign key (idVehiculo) references vehiculo(idVehiculo)
alter table Venta Add constraint FK_VentaVendedor foreign key (idVendedor) references vendedor(idVendedor ) 
alter table Venta Add constraint FK_VentaCliente foreign key (idCliente) references cliente(idCliente) 
--OpcionVehiculo
alter table OpcionVehiculo Add constraint FK_OpcionVehiculoOpcion foreign key (idOpcion) references opcion(idOpcion)
alter table OpcionVehiculo Add constraint FK_OpcionVehiculoVehiculo foreign key (idVehiculo) references vehiculo(idVehiculo) 
--OpcionVenta
alter table OpcionVenta Add constraint FK_OpcionVentaOpcion foreign key (idOpcion) references opcion(idOpcion)
alter table OpcionVenta Add constraint FK_OpcionVentaVenta foreign key (idVenta) references venta(idVenta) 
--Indices
create index IX_Cliente ON Cliente(idCliente)
create index IX_Opcion ON Opcion(idOpcion)
create index IX_Usado ON Usado(idUsado)
create index IX_Vehiculo ON Vehiculo(idVehiculo)
create index IX_Vendedor ON Vendedor(idVendedor)
create index IX_Venta ON Venta(idVenta)
create index IX_OpcionVehiculo ON OpcionVehiculo(idOpcionVehiculo)
create index IX_OpcionVenta ON OpcionVenta(idOpcionVenta)