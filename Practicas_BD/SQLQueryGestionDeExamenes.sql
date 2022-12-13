USE MASTER;
go
if DB_ID (N'GestionDeExamenes') is not null
drop database GestionDeExamenes;
go
create database GestionDeExamenes
on
(name = GestionDeExamenes_dat,
filename = 'C:\bd\GestionDeExamenes.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = GestionDeExamenes,
filename = 'C:\bd\GestionDeExamenes.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE GestionDeExamenes;
go
create table Alumno
(
idAlumno int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
matricula varchar (20) not null,
grupoClase varchar (40) not null,
estatus bit default 1 not null);
go
create table ExamenEscrito
(
idExamenEscrito int not null,
numeroExamen int not null,
numeroPreguntas int not null,
fechaRealizacion int not null,
estatus bit default 1 not null);
go
create table Practica
(
idPractica int not null,
codigo int not null,
titulo varchar(30) not null,
gradoDificultad varchar(20) not null,
tipo varchar(20) not null,
estatus bit default 1 not null);
go
create table Profesor
(idProfesor int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(30) not null,
apellidoMaterno varchar(30) not null,
matricula varchar (20) not null,
estatus bit default 1 not null);
go
create table AlumnoExamenEscrito
(idAlumnoExamenEscrito int not null,
idAlumno int not null,
idExamenEscrito int not null,
nota varchar(50) not null,
estatus bit default 1 not null);
go
create table AlumnoPractica
(
idAlumnoPractica int not null,
idAlumno int not null,
idPractica int not null,
fecha datetime not null,
nota varchar(50) not null,
estatus bit default 1 not null);
go
create table PracticaProfesor
(
idPracticaProfesor int not null,
idPractica int not null,
idProfesor int not null,
fechaDiseño datetime not null,
estatus bit default 1 not null);
--llaves primarias
alter table Alumno Add constraint PK_Alumno Primary key (idAlumno)
alter table ExamenEscrito Add constraint PK_ExamenEscrito Primary key (idExamenEscrito)
alter table Practica Add constraint PK_Practica Primary key (idPractica)
alter table Profesor Add constraint PK_Profesor Primary key (idProfesor)
alter table AlumnoExamenEscrito Add constraint PK_AlumnoExamenEscrito Primary key (idAlumnoExamenEscrito)
alter table AlumnoPractica Add constraint PK_AlumnoPractica Primary key (idAlumnoPractica)
alter table PracticaProfesor Add constraint PK_PracticaProfesor Primary key (idPracticaProfesor)
--llaves foraneas
--AlumnoExamenEscrito
alter table AlumnoExamenEscrito Add constraint FK_AlumnoExamenEscritoAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoExamenEscrito Add constraint FK_AlumnoExamenEscritoExamenEscrito foreign key (idExamenEscrito) references examenEscrito(idExamenEscrito) 
--AlumnoPractica
alter table AlumnoPractica Add constraint FK_AlumnoPracticaAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoPractica Add constraint FK_AlumnoPracticaPractica foreign key (idPractica) references practica(idPractica) 
--PracticaProfesor
alter table PracticaProfesor Add constraint FK_PracticaProfesorPractica foreign key (idPractica) references practica(idPractica)
alter table PracticaProfesor Add constraint FK_PracticaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor) 
--Indices
create index IX_Alumno ON Alumno(idAlumno)
create index IX_ExamenEscrito ON ExamenEscrito(idExamenEscrito)
create index IX_Practica ON Practica(idPractica)
create index IX_Profesor ON Profesor(idProfesor)
create index IX_AlumnoExamenEscrito ON AlumnoExamenEscrito(idAlumnoExamenEscrito)
create index IX_AlumnoPractica ON AlumnoPractica(idAlumnoPractica)
create index IX_PracticaProfesor ON PracticaProfesor(idPracticaProfesor)