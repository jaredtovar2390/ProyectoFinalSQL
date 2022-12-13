--SQL
use master;
Go
if db_id (N'ServicioMilitar') is not null
Drop database ServicioMilitar;
Create database ServicioMilitar
go
Use ServicioMilitar; 
create table Compania
(
idCompania int not null,
actividad Varchar(50) not null,
estatus bit default 1 not null,
);
go
create table Cuartel
(
idCuartel int not null,
codigo varchar(10) not null,
direccion Varchar(50) not null,
estatus bit default 1 not null,
);
go
create table Cuerpo
(
idCuerpo int not null,
denominacion varchar(50) not null,
estatus bit default 1 not null,
);
go
create table Servicio
(
idServicio int not null,
codigo varchar(10) not null,
descripcion Varchar(50) not null,
estatus bit default 1 not null,
);
go
create table Soldado
(
idSoldado int not null,
codigo varchar(10) not null,
nombre varchar(50) not null,
direccion Varchar(50) not null,
estatus bit default 1 not null,
);
go
