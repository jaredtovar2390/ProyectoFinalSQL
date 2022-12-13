USE MASTER;
go
if DB_ID (N'CtrlHospitalizacion') is not null
drop database CtrlHospitalizacion;
go
create database CtrlHospitalizacion
on
(name = CtrlHospitalizacion_dat,
filename = 'C:\bd\CtrlHospitalizacion.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = CtrlHospitalizacion_log,
filename = 'C:\bd\CtrlHospitalizacion.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE CtrlHospitalizacion;
go
create table Cama
(
idCama int not null,
idPlanta int not null,
numero int not null,
estatus bit default 1 not null
);
go
create table Diagnostico
(
idDiagnostico int not null,
idMedico int not null,
idPaciente int not null,
fecha datetime not null,
codigo varchar(10) not null,
descripcion varchar(60) not null,
estatus bit default 1 not null);
go
create table Medico
(idMedico int not null,
nombre varchar (50) not null,
apellidoPaterno varchar (30) not null,
apellidoMaterno varchar (30) not null,
numeroFicha int not null,
estatus bit default 1 not null);
go
create table Paciente
(idPaciente int not null,
nombre varchar (50) not null,
apellidoPaterno varchar (30) not null,
apellidoMaterno varchar (30) not null,
rfc varchar(50) not null,
nss int not null,
fechaNacimiento datetime not null,
estatus bit default 1 not null);
go
create table Planta
(
idPlanta int not null,
numeroPlanta int not null,
nombre varchar (50) not null,
numeroCama int not null,
estatus bit default 1 not null);
go
create table TarjetaVisita
(
idTarjetaVisita int not null,
idPaciente int not null,
fechaInicio datetime not null,
fechaFinal datetime not null,
estatus bit default 1 not null);
go
create table Visita
(
idVisita int not null,
idPaciente int not null,
idMedico int not null,
fecha datetime not null,
estatus bit default 1 not null)
go
create table CamaPaciente
(
idCamaPaciente int not null,
idPaciente int not null,
idCama int not null,
fecha datetime not null,
estatus bit default 1 not null);
--llaves primarias
alter table Cama Add constraint PK_Cama Primary key (idCama)
alter table Diagnostico Add constraint PK_Diagnostico Primary key (idDiagnostico)
alter table Medico Add constraint PK_Medico Primary key (idMedico)
alter table Paciente Add constraint PK_Paciente Primary key (idPaciente)
alter table Planta Add constraint PK_Planta Primary key (idPlanta)
alter table TarjetaVisita Add constraint PK_TarjetaVisita Primary key (idTarjetaVisita)
alter table Visita Add constraint PK_Visita Primary key (idVisita)
alter table CamaPaciente Add constraint PK_CamaPaciente Primary key (idCamaPaciente)
--llaves foraneas
--Cama
alter table Cama Add constraint FK_CamaPlanta foreign key (idPlanta) references planta(idPlanta) 
--Diagnostico
alter table Diagnostico Add constraint FK_DiagnosticoMedico foreign key (idMedico) references medico(idMedico)
alter table Diagnostico Add constraint FK_DiagnosticoPaciente foreign key (idPaciente) references paciente(idPaciente) 
--TarjetaVisita
alter table TarjetaVisita Add constraint FK_TarjetaVisitaPaciente foreign key (idPaciente) references paciente(idPaciente)
--Visita
alter table Visita Add constraint FK_VisitaMedico foreign key (idMedico) references medico(idMedico)
alter table Visita Add constraint FK_VisitaPaciente foreign key (idPaciente) references paciente(idPaciente) 
--CamaPaciente
alter table CamaPaciente Add constraint FK_CamaPacienteCama foreign key (idCama) references cama(idCama)
alter table CamaPaciente Add constraint FK_CamaPacientePaciente foreign key (idPaciente) references paciente(idPaciente) 
--Indices

create index IX_Cama ON Cama(idCama)
create index IX_Diagnostico ON Diagnostico(idDiagnostico)
create index IX_Medico ON Medico(idMedico)
create index IX_Paciente ON Paciente(idPaciente)
create index IX_Planta ON Planta(idPlanta)
create index IX_TarjetaVisita ON TarjetaVisita(idTarjetaVisita)
create index IX_Visita ON Visita(idVisita)
create index IX_CamaPaciente ON CamaPaciente(idCamaPaciente)