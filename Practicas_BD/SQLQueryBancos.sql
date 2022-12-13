USE MASTER;
go
if DB_ID (N'Bancos') is not null
drop database Bancos;
go
create database Bancos
on
(name = Bancos_dat,
filename = 'C:\bd\Bancos.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = Bancos_log,
filename = 'C:\bd\Bancos.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE Bancos;
go
create table Cliente
(
idCliente int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
rfc varchar(30) not null,
curp varchar(30) not null,
estatus bit default 1 not null);
go
create table Cuenta
(
idCuenta int not null,
idSucursal int not null,
saldo int not null,
numero int not null,
estatus bit default 1 not null);
go
create table Domiciliacion
(
idDomiciliacion int not null,
descripcion varchar(60) not null,
fecha datetime not null,
estatus bit default 1 not null);
go
create table Prestamo 
(
idPrestamo int not null,
idCliente int not null,
fecha datetime not null,
plaza int not null,
monto int not null,
numeroFolio int not null,
estatus bit default 1 not null);
go
create table Sucursal
(
idSucursal int not null,
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
create table ClienteCuenta
(
idClienteCuenta int not null,
idCliente int not null,
idCuenta int not null,
privilegio varchar(20) not null,
estatus bit default 1 not null);
go
create table CuentaDomiciliacion
(
idCuentaDomiciliacion int not null,
idCuenta int not null,
idDomiciliacion int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Cliente Add constraint PK_Cliente Primary key (idCliente)
alter table Cuenta Add constraint PK_Cuenta Primary key (idCuenta)
alter table Domiciliacion Add constraint PK_Domiciliacion Primary key (idDomiciliacion)
alter table Prestamo Add constraint PK_Prestamo Primary key (idPrestamo)
alter table Sucursal Add constraint PK_Sucursal Primary key (idSucursal)
alter table ClienteCuenta Add constraint PK_ClienteCuenta Primary key (idClienteCuenta)
alter table CuentaDomiciliacion Add constraint PK_CuentaDomiciliacion Primary key (idCuentaDomiciliacion)
--llaves foraneas
--Viaje
alter table Cuenta Add constraint FK_CuentaSucursal foreign key (idSucursal) references sucursal(idSucursal)
--Prestamo
alter table Prestamo Add constraint FK_PrestamoCliente foreign key (idCliente) references cliente(idCliente)
--ClienteCuenta
alter table ClienteCuenta  Add constraint FK_ClienteCuentaCliente foreign key (idCliente) references cliente(idCliente)
alter table ClienteCuenta Add constraint FK_ClienteCuentaCuenta foreign key (idCuenta) references cuenta(idCuenta) 
--CuentaDomiciliacion
alter table CuentaDomiciliacion Add constraint FK_CuentaDomiciliacionCuenta foreign key (idCuenta) references cuenta(idCuenta)
alter table CuentaDomiciliacion Add constraint FK_CuentaDomiciliacionDomiciliacion foreign key (idDomiciliacion) references domiciliacion(idDomiciliacion) 
--Indices
create index IX_Cliente ON Cliente(idCliente)
create index IX_Cuenta ON Cuenta(idCuenta)
create index IX_Domiciliacion ON Domiciliacion(idDomiciliacion)
create index IX_Prestamo ON Prestamo(idPrestamo)
create index IX_Sucursal ON Sucursal(idSucursal)
create index IX_ClienteCuenta ON ClienteCuenta(idClienteCuenta)
create index IX_CuentaDomiciliacion ON CuentaDomiciliacion(idCuentaDomiciliacion)