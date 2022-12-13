USE MASTER;
go
if DB_ID (N'GestionDeTrabajoFinDeCarrera') is not null
drop database GestionDeTrabajoFinDeCarrera;
go
create database GestionDeTrabajoFinDeCarrera
on
(name = GestionDeTrabajoFinDeCarrera_dat,
filename = 'C:\bd\GestionDeTrabajoFinDeCarrera.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = GestionDeTrabajoFinDeCarrera_log,
filename = 'C:\bd\GestionDeTrabajoFinDeCarrera.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE GestionDeTrabajoFinDeCarrera;
go
create table Alumno
(
idAlumno int not null,
idGrupo int not null,
idProfesor int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
matricula varchar (20) not null,
rfc varchar (40) not null,
fechaIncorporacion datetime not null,
estatus bit default 1 not null);
go
create table Grupo
(
idGrupo int not null,
nombre varchar(20) not null,
numeroComponente int not null,
numero int not null,
estatus bit default 1 not null);
go
create table Profesor
(idProfesor int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
rfc varchar(40) not null,
direccion varchar(50) not null,
colonia varchar(20) not null,
estado varchar(20) not null,
municipio varchar(20) not null,
calle varchar(20) not null,
numero int not null,
estatus bit default 1 not null);
go
create table TFC
(idTfc int not null,
numeroOrden int not null,
fechaComienzo datetime not null,
tema varchar(20),
estatus bit default 1 not null,
idAlumno int not null,
idTribunal int not null,
fecha datetime not null);
go
create table Tribunal
(
idTribunal int not null,
lugarExamen varchar(50) not null,
numero int not null,
numeroComponentes int not null,
estatus bit default 1 not null);
go
create table AlumnoProfesor
(idAlumnoProfesor int not null,
idAlumno int not null,
idProfesor int not null,
estatus bit default 1 not null);
go
create table ProfesorTribunal
(idProfesorTribunal int not null,
idProfesor int not null,
idTribunal int not null,
estatus bit default 1 not null);
--llaves primarias
alter table Alumno Add constraint PK_Alumno Primary key (idAlumno)
alter table Grupo Add constraint PK_Grupo Primary key (idGrupo)
alter table Profesor Add constraint PK_Profesor Primary key (idProfesor)
alter table Tfc Add constraint PK_Tfc Primary key (idTfc)
alter table Tribunal Add constraint PK_Tribunal Primary key (idTribunal)
alter table AlumnoProfesor Add constraint PK_AlumnoProfesor Primary key (idAlumnoProfesor)
alter table ProfesorTribunal Add constraint PK_ProfesorTribunal Primary key (idProfesorTribunal)
--llaves foraneas
--Alumno
alter table Alumno Add constraint FK_AlumnoGrupo foreign key (idGrupo) references grupo(idGrupo)
alter table Alumno Add constraint FK_AlumnoProfesor foreign key (idProfesor) references profesor(idProfesor) 
--Tfc
alter table Tfc Add constraint FK_TfcAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table Tfc Add constraint FK_TfcTribunal foreign key (idTribunal) references tribunal(idTribunal) 
--AlumnoProfesor
alter table AlumnoProfesor Add constraint AlumnoProfesorAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoProfesor Add constraint AlumnoProfesorProfesor foreign key (idProfesor) references profesor(idProfesor) 
--ProfesorTribunal
alter table ProfesorTribunal Add constraint FK_ProfesorTribunalProfesor foreign key (idProfesor) references profesor(idProfesor)
alter table ProfesorTribunal Add constraint FK_ProfesorTribunalTribunal foreign key (idTribunal) references tribunal(idTribunal) 
--Indices
create index IX_Alumno ON Alumno(idAlumno)
create index IX_Grupo ON Grupo(idGrupo)
create index IX_Profesor ON Profesor(idProfesor)
create index IX_Tfc ON Tfc(idTfc)
create index IX_Tribunal ON Tribunal(idTribunal)
create index IX_AlumnoProfesor ON AlumnoProfesor(idAlumnoProfesor)
create index IX_ProfesorTribunal ON ProfesorTribunal(idProfesorTribunal)