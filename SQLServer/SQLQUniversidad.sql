USE MASTER;
go
if DB_ID (N'Universidad') is not null
drop database Universidad;
go
create database Universidad
on
(name = Universidad_dat,
filename = 'C:\bd\Universidad.mdf',
size = 10,
maxsize = 50,
filegrowth = 5)
log on
(Name = Universidad_log,
filename = 'C:\bd\Universidad.ldf',
size = 5MB,
maxsize = 25MB,
filegrowth = 5MB);
GO
USE Universidad;
go
create table Adeudo
(
idAdeudo int identity (1,1) not null,
nombre varchar(50) not null,
esatus int default 1,
semestre char (2) not null,
fecha datetime not null,
especialidad varchar (50) not null,
idUsuarioCrea int not null,
idUsuarioModifica int not null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
go
insert into Adeudo(nombre,semestre,fecha,especialidad, idUsuarioCrea, idUsuarioModifica)
values('Ingles','2','20130123','Mecanica',1,1),('F�sica','4','20220522','F�sica Cu�ntica',1,1),('Anatom�a ','5', '20170807', 'Enfermer�a',1,1),('Matem�ticas ','1', '20190712', 'informatica',1,1),('Ecolog�a','3', '20200216', 'Energias renovables',1,1),
('fisiolog�a','8', '20211011', 'Enfermer�a',1,1),('Econom�a','4', '20200915', 'Administracion de empresas',1,1),('Arte','4', '20180602', 'Arte',1,1),
('Historia','2', '20210518', 'Historia',1,1),('Psicolog�a','7', '20220421', 'Enfermer�a',1,1)
select * from Adeudo
go
create table Autor
(
idAutor int identity (1,1) not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
nacionalidad varchar(20) not null,
trayectoria varchar(150) not null,
esatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
go
insert into Autor(nombre,apellidoPaterno,apellidoMaterno,nacionalidad,trayectoria,idUsuarioCrea,idUsuarioModifica)
values('Ricardo Eli�cer','Neftal� Reyes','Basoalto ','Chile','Poema 12, Amor Soneto XXII, Poema 20, Poema 15 ',1,1),
('Gabriel','Garc�a','M�rquez','Colombia','Cien a�os de soledad, El amor en los tiempos del c�lera, El coronel no tiene quien le escriba, Cr�nica de una muerte anunciada',1,1),
('Isabel Ang�lica','Allende','Llona','Chile','La casa de los esp�ritus ',1,1),
('Mario','Vargas','Llosa','Espa�a','La ciudad y los perros, La t�a Julia y el escribidor La fiesta del Chivo',1,1),
('Jorge Francisco Isidoro','Luis','Borges','Argentina','El Aleph,La biblioteca de Babel,Las ruinas circulares,Funes el memorioso',1,1),
('Julio','Florencio','Cort�zar','Argentina','Casa Tomada, La noche boca arriba, La se�orita Cora, El perseguidor, Carta a una se�orita en Par�s',1,1),
('Lucila','Godoy','Alcayaga','Chile','Besos, Caricia, Piececitos, Desolaci�n, Amor, amor',1,1),
('Mario','Benedetti','Farrugia','Urugay','Hagamos un trato, No te salves, Viceversa, Por siempre, Te quiero',1,1),
('Carlos','Fuentes','Mac�as','Mexicana','La regi�n m�s transparente, La muerte de Artemio Cruz, Terra Nostra, Aura, Los d�as enmascarados, Cantar de ciegos',1,1),
('Octavio Irineo','Paz','Lozano','Mexicana','Libertad bajo palabra Silencio Las palabras La poes�a Decir, hacer',1,1)
select * from Autor
go
create table Beca
(
idBeca int identity (1,1) not null,
nombre varchar(50) not null,
monto varchar(20) not null,
razon varchar(100) not null,
fecha datetime not null,
codigo char (10) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
go
insert into Beca(nombre,monto,razon,fecha,codigo,idUsuarioCrea,idUsuarioModifica)
values('Becas Benito Ju�rez','2400','cubrir los gastos b�sicos en instituciones p�blicas �nicamente','20220116','N2zZrfcquB',1,1),
('Becas Benito Ju�rez','5258','cubrir los gastos b�sicos en instituciones p�blicas �nicamente','20220116','Mg5pqWGf97',1,1),
('Becas J�venes escribiendo el futuro','840','apoyar econ�micamente a los sectores vulnerables de la poblaci�n','20210321','7fnLB4tnvM',1,1),
('Becas J�venes construyendo el futuro','2450','enfocado a personas de entre 18 y 29 a�os que se encuentran sin trabajo ni estudios activos','20201229','mNNbVXrTF7',1,1),
('Becas J�venes construyendo el futuro','5258','enfocado a personas de entre 18 y 29 a�os que se encuentran sin trabajo ni estudios activos','20201212','yKCXWMyarb',1,1),
('Beca para el Bienestar Benito Ju�rez de Educaci�n','840','apoyar a familia en condiciones de pobreza que tengan ni�os, menores de 18 a�os, en educaci�n b�sica','20210516','xgc4CsHEQ7',1,1),
('Beca Aprovechamiento','1200','enfocado para personas con una calificacion mejor al promedio','20200605','gU4KVFeQ7g',1,1),
('Beca de transporte','1000','enfocado para personas que vivan lejos de la universidad y viajan en transporte publico','20191001','MRQThRHbtm',1,1),
('Becas deportiva','2000','enfocado para los estudiantes que son mejor de promedio en deportes','20201219','CDmnyZ6AHf',1,1),
('Becas para emprendedores','2400','enfocado para j�venes que quieren impulsar su vida profesional y comenzar un proyecto empresarial','20210714','JbRDhXTPur',1,1)
select * from Beca
go
create table Calificacion
(
idCalificacion int identity (1,1) not null,
nota char (3) not null,
actividad varchar(30) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
go
insert into Calificacion(nota,actividad,idUsuarioCrea,idUsuarioModifica)
values('97','investigacion',1,1),
('70','diagrama er',1,1),
('82','modelo relacional',1,1),
('89','diccionario de datos',1,1),
('96','consulta',1,1),
('100','diagrama de flujo',1,1),
('78','ensayo',1,1),
('99','conceptos',1,1),
('89','diagramas',1,1),
('79','esquema',1,1),
('71','mapa mental',1,1),
('97','cuadro sinoptico',1,1)
select * from Calificacion
go
create table Categoria
(
idCategoria int identity (1,1) not null,
nombre varchar(20) not null,
descripcion varchar(150) not null,
notacion char(1) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
go
insert into Categoria(nombre,descripcion,notacion,idUsuarioCrea,idUsuarioModifica)
values('Terror','La experiencia de miedo intenso es conocida como terror','A',1,1),
('Ciencia ficcion','es un g�nero cuyos contenidos se encuentran basados en supuestos logros cient�ficos o t�cnicos que podr�an lograrse en el futuro.','B',1,1),
('Documental','es la expresi�n de un aspecto de la realidad, mostrada en forma audiovisual','C',1,1),
('Historia','es la narraci�n de los sucesos del pasado; generalmente los de la humanidad, aunque, tambi�n puede no estar centrada en el humano','D',1,1),
('Educacion','es el proceso de facilitar el aprendizaje o la adquisici�n de conocimientos, as� como habilidades, valores, creencias y h�bitos','E',1,1),
('Programacion','enfoca en organizar un conjunto de datos ordenados a seguir para ser ciertas cosas','F',1,1),
('Matematica','operan con n�meros, s�mbolos, figuras geom�tricas','G',1,1),
('Manuales','gu�a de instrucciones que sirve para el uso de un dispositivo, la correcci�n de problemas','H',1,1),
('Geografia','La ubicaci�n o localizaci�n geogr�fica es cualquier forma de localizaci�n en un contexto geogr�fico','I',1,1),
('Psicologia','investiga sobre los procesos mentales de personas y animales','J',1,1),
('Romance','poema narrativo, formado por una sola secuencia po�tica no dividida en estrofas','K',1,1),
('Lirico','comunicar mediante el ritmo e im�genes los sentimientos o emociones �ntimas del autor','L',1,1)
select * from Categoria
go
create table Certificado
(
idCertificado int identity (1,1) not null,
fecha datetime not null,
titulo varchar(40) not null,
descripcion varchar(100) not null,
responsable varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Certificado(fecha,titulo,descripcion,responsable,idUsuarioCrea,idUsuarioModifica)
values('20220102','Certificado laboral','ha trabajado en nuestra empresa como AUDITORA DE MEDIOS','Florencia Mart�nez',1,1),
('20211107','Certificado matematicas','ha trabajado en problemas matematicos y ah sido credito','Bernarda Guti�rrez',1,1),
('20211216','Certificado de estudios secundarios','en virtud de que demostro contar con los conocimientos correspondientes','Ezequiel flores perez',1,1),
('20200602','Certificado de honorabilidad','certificado correspondiente a la persona que es honorable con el curso','Elizabeth Palma',1,1),
('20200115','Certificado de realizaci�n de pr�cticas','certificado correspondiente a la persona que realiza practicas','Juan Perez',1,1),
('20220212','Certificado de idiomas','ha trabajado en Cursos de idiomas y ah sido acreditado','Berta Gutierrez',1,1),
('20221209','Certificado de mecanografia','certificado correspondiente a la persona que realiza pruebas de mecanografia','Maria del Carmen Salazar',1,1),
('20210414','Certificado de Programacion','Curso acreditado de curso de HTML y CSS','Gabriel Chavez',1,1),
('20190519','Certificado de Excel','Curso acreditado de que la persona sabe manejar microsoft excel','Jaime Estela',1,1),
('20220611','Certificado de Base de datos','Curso acreditado de que la persona sabe manejar Base de datos','jorge michael',1,1),
('20210907','Certificado Word','Curso acreditado de que la persona sabe manejar microsoft word','Esther Gabriela',1,1)
select * from Certificado
go
create table Club
(
idClub int identity (1,1) not null,
telefono char(10) not null,
nombre varchar(20) not null,
descripcion varchar(100) not null,
responsable varchar(50) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Club(telefono,nombre,descripcion,responsable,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('8661859508','Futbol','Club de deportes dedicado a el futbol','Bernarda Guti�rrez','coahuila','25870','libertad','monclova','jose lopez portillo',1,1),
('8661235647','Arte','Club de deportes dedicado a el Arte','Florencia Mart�nez','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1),
('8662378941','Karate','Club de deportes dedicado a el Karate','Elizabeth Palma','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1),
('8445612311','Tenis','Club de deportes dedicado a el Tenis','Esther Gabriela','coahuila','25716','Ampliaci�n Roma','monclova','Acapulco',1,1),
('8445231326','BasquetBall','Club de deportes dedicado a el BasquetBall','jorge michael','coahuila','25716','Picasso','monclova','Benjam�n Su�rez P.',1,1),
('8668795462','Atletismo','Club de deportes dedicado a el Atletismo','Gabriel Chavez','coahuila','25716','Tecnol�gico','monclova','Bruno Neira',1,1),
('8664654231','Ajedrez','Club de deportes dedicado a el Ajedrez','Berta Gutierrez','coahuila','25716','Magisterio','monclova','Hip�crates',1,1),
('8667987654','Baile','Club de deportes dedicado a el Baile','Maria del Carmen Salazar','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1),
('8664564231','Gimnacio','Club de deportes dedicado a el Gimnacio','Juan Perez','coahuila','25716','Bugambilias','monclova','Palenque',1,1),
('8667894651','Teatro','Club de deportes dedicado a el Teatro','Berta Gutierrez','coahuila','25716','Chamizal','monclova','Peatonal B',1,1)
select * from Club
go
create table Colegiatura
(
idColegiatura int identity (1,1) not null,
cantidad char(10) not null,
periodo datetime not null,
banco varchar(50) not null,
semestre char(2) not null,
descripcion varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Colegiatura(cantidad,periodo,banco,semestre,descripcion,idUsuarioCrea,idUsuarioModifica)
values('1800', '20220117','ScotiaBank','2','Pago de la colegiatura de la universidad de TEC',1,1),
('2400', '20210907','ScotiaBank','1','Pago de la colegiatura de la universidad de TEC',1,1),
('3200', '20211216','ScotiaBank','5','Pago de la colegiatura de la universidad de TEC',1,1),
('1600', '20210907','ScotiaBank','4','Pago de la colegiatura de la universidad de TEC',1,1),
('2100', '20210414','ScotiaBank','7','Pago de la colegiatura de la universidad de TEC',1,1),
('2300', '20190519','ScotiaBank','4','Pago de la colegiatura de la universidad de TEC',1,1),
('2100', '20220102','ScotiaBank','12','Pago de la colegiatura de la universidad de TEC',1,1),
('2000', '20220118','ScotiaBank','5','Pago de la colegiatura de la universidad de TEC',1,1),
('1200', '20220611','ScotiaBank','3','Pago de la colegiatura de la universidad de TEC',1,1),
('4500', '20220101','ScotiaBank','6','Pago de la colegiatura de la universidad de TEC',1,1);
select * from Colegiatura
go
create table Concurso
(
idConcurso int identity (1,1) not null,
fecha datetime not null,
responsable varchar(50) not null,
nombre varchar(50) not null,
premio varchar(30) not null,
descripcion varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Concurso(fecha,responsable,nombre,premio,descripcion,idUsuarioCrea,idUsuarioModifica)
values('20220117', 'Juan Perez','Concurso de programacion','1600','Competencia Internacional de Programaci�n Competitiva ICPC',1,1),
('20210907', 'Ezequiel flores perez','Concurso de Excel','1300','Competencia de excel',1,1),
('20210916', 'Florencia Mart�nez','Concurso de Word','2200','Competencia de word',1,1),
('20211216', 'Juan Perez','Concurso de Idiomas','4200','Competencia de idiomas',1,1),
('20220102', 'Juan Perez','Concurso de Carteles','2100','Competencia de Carteles de un documental',1,1),
('20190519', 'Juan Perez','Concurso de Idiomas','1400','Competencia de idiomas',1,1),
('20210414', 'Florencia Mart�nez','Concurso de Base de datos','2000','Competencia de Base de datos',1,1),
('20220611', 'Florencia Mart�nez','Concurso de Base de datos','2000','Competencia de Base de datos',1,1),
('20220118', 'Florencia Mart�nez','Concurso de Carteles','2100','Competencia de Carteles de un desarollo sustentable',1,1),
('20220102', 'Florencia Mart�nez','Concurso de programacion','1600','Competencia Internacional de Programaci�n Competitiva ICPC',1,1);
select * from Colegiatura
go
create table Conferencia
(
idConferencia int identity (1,1) not null,
fecha datetime not null,
responsable varchar(50) not null,
titulo varchar(40) not null,
participante char(4) not null,
razon varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Conferencia(fecha,responsable,titulo,participante,razon,idUsuarioCrea,idUsuarioModifica)
values('20210907', 'Juan Perez','Conferencia de Base de datos','102','Explicacion y descripcion de la materia de base de datos',1,1),
('20220117', 'Ezequiel flores perez','Conferencia de Ingles','134','Explicacion y descripcion de la materia de ingles',1,1),
('20210916', 'Florencia Mart�nez','Conferencia de arte','312','Explicacion y descripcion de la materia de arte',1,1),
('20190519', 'Florencia Mart�nez','Conferencia de matematicas','41','Explicacion y descripcion de la materia de matematicas',1,1),
('20220102', 'Ezequiel flores perez','Conferencia de sexualidad','32','Explicacion y descripcion de la sexualidad',1,1),
('20210414', 'Juan Perez','Conferencia de Empleo','45','Explicacion y descripcion de empleado y trabajo',1,1),
('20190519', 'Florencia Mart�nez','Conferencia de drogadiccion','123','Explicacion y descripcion de la drogadiccion ',1,1),
('20220611', 'Juan Perez','Conferencia de Estudios','41','Explicacion y descripcion de la conferencia de estudios',1,1),
('20220611', 'Florencia Mart�nez','Conferencia de drogadiccion','111','Explicacion y descripcion de la drogadiccion',1,1),
('20220118', 'Ezequiel flores perez','Conferencia de programacion','43','Explicacion y descripcion de la materia de Programacion',1,1);
select * from Conferencia
go
create table Contrato
(
idContrato int identity (1,1) not null,
fechaInicio datetime not null,
fechaVencimiento datetime not null,
nombre varchar(30) not null,
titulo varchar(30) not null,
razon varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Contrato(fechainicio,fechaVencimiento,nombre,titulo,razon,idUsuarioCrea,idUsuarioModifica)
values('20210907','20220907','Juan Perez','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20220117','20220917', 'Ezequiel flores perez','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20210916','20220201','Alan Jancito','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20190519','20201112', 'Bartolom� julian','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20220102','20220907', 'Ad�n Fidencio','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20210414','20210712','Mario Alan','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20190519','20200916', 'Jose Spulveda','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20220611','20221215', 'Florencia Lisa','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20220611','20220202', 'Ana Elizabeth','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1),
('20220118','20220313', 'Hilda Fuentes','Contrato de universidad','Ense�anza a estudiantes con su propia especialidad',1,1);
select * from Contrato
go
create table Convocatoria
(
idConvocatoria int identity (1,1) not null,
fecha datetime not null,
responsable varchar(50) not null,
nombre varchar(60) not null,
descripcion varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Convocatoria(fecha,responsable,nombre,descripcion,idUsuarioCrea,idUsuarioModifica)
values('20220117', 'Juan Perez','Convocatoria de Profesores para el cursos de programacion','Competencia Internacional de Programaci�n Competitiva ICPC',1,1),
('20210907', 'Ezequiel flores perez','Convocatoria de Profesores para el cursos de Excel','Competencia de excel',1,1),
('20210916', 'Florencia Mart�nez','Convocatoria de Profesores para el cursos de Word','Competencia de word',1,1),
('20211216', 'Juan Perez','Convocatoria de Profesores para el cursos de Idiomas','Competencia de idiomas',1,1),
('20220102', 'Juan Perez','Convocatoria de Profesores para el cursos de Carteles','Competencia de Carteles de un documental',1,1),
('20190519', 'Juan Perez','Convocatoria de Profesores para el cursos de Idiomas','Competencia de idiomas',1,1),
('20210414', 'Florencia Mart�nez','Convocatoria de Profesores para el cursos de Base de datos','Competencia de Base de datos',1,1),
('20220611', 'Florencia Mart�nez','Convocatoria de Profesores para el cursos de Base de datos','Competencia de Base de datos',1,1),
('20220118', 'Florencia Mart�nez','Convocatoria de Profesores para el cursos de Carteles','Competencia de Carteles de un desarollo sustentable',1,1),
('20220102', 'Florencia Mart�nez','Convocatoria de Profesores para el cursos de programacion','Competencia Internacional de Programaci�n Competitiva ICPC',1,1);
select * from Convocatoria
go
create table CredencialEscolar 
(
idCredencialEscolar int identity (1,1) not null,
vigenciaInicio datetime not null,
vencimiento datetime not null,
responsable varchar(50) not null,
universidad varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
go
insert into CredencialEscolar(vigenciaInicio,vencimiento,responsable,universidad,idUsuarioCrea,idUsuarioModifica)
values('20210907','20220907','Juan Perez','TEC Saltillo',1,1),
('20220117','20220917', 'Ezequiel flores perez','TEC Monclova',1,1),
('20210916','20220201','Alan Jancito','TEC Monclova',1,1),
('20190519','20201112', 'Bartolom� julian','TEC Monterrey',1,1),
('20220102','20220907', 'Ad�n Fidencio','TEC Monclova',1,1),
('20210414','20210712','Mario Alan','TEC Saltillo',1,1),
('20190519','20200916', 'Jose Spulveda','TEC Monclova',1,1),
('20220611','20221215', 'Florencia Lisa','TEC Saltillo',1,1),
('20220611','20220202', 'Ana Elizabeth','TEC Monterrey',1,1),
('20220118','20220313', 'Hilda Fuentes','TEC Monterrey',1,1)
select * from CredencialEscolar
go
create table Credito 
(
idCredito int identity (1,1) not null,
cantidad char(2) not null,
responsable varchar(50) not null,
motivo varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Credito(cantidad,responsable,motivo,idUsuarioCrea,idUsuarioModifica)
values('1','Juan Perez','Acreditacion de curso',1,1),
('2', 'Ezequiel flores perez','Acreditacion de concurso',1,1),
('1','Alan Jancito','Acreditacion de concurso',1,1),
('2', 'Bartolom� julian','Acreditacion de concurso',1,1),
('1', 'Ad�n Fidencio','Acreditacion de curso',1,1),
('1','Mario Alan','Acreditacion de curso',1,1),
('2','Jose Spulveda','Acreditacion de concurso',1,1),
('1','Florencia Lisa','Acreditacion de curso',1,1),
('1','Ana Elizabeth','Acreditacion de concurso',1,1),
('2','Hilda Fuentes','Acreditacion de concurso',1,1)
select * from Credito
go
create table Curso 
(
idCurso int identity (1,1) not null,
fecha datetime not null,
nombre varchar(30) not null,
cupo char(4) not null,
precio char(5) not null,
descripcion varchar(100) not null,
estatus int default 1,
cantidadParticipantes char(4) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Curso(fecha,nombre,cupo,precio,descripcion,cantidadParticipantes,idUsuarioCrea,idUsuarioModifica)
values('20220117','Curso de programacion','100','1600','Curso de programacion orientado a objetos','90',1,1),
('20210907','Curso de Excel','120','1300','curso de como manejar el excel','50',1,1),
('20210916','Curso de Word','100','2200','curso de como manejar el word','52',1,1),
('20211216','Curso de Idiomas','100','4200','curso de idioma frances','84',1,1),
('20220102','Curso de Carteles','100','2100','curso de como realizar carteles','67',1,1),
('20190519','Curso de Idiomas','100','1400','curso de idioma de Ingles','45',1,1),
('20210414','Curso de Base de datos','100','2000','curso de fundamentos de Base de datos','30',1,1),
('20220611','Curso de Base de datos','100','2000','curso de fundamentos de Base de datos','60',1,1),
('20220118','Curso de Carteles','100','2100','curso de como realizar carteles','75',1,1),
('20220102','Curso de programacion','100','1600','Curso de Fundamentos de programacion','67',1,1);
select * from Curso
go
create table Edificio 
(
idEdificio int identity (1,1) not null,
numeroPiso char(2) not null,
nombre varchar(50) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Edificio(numeroPiso,nombre,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('10','Edificio1','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('10','Edificio2','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('4','Edificio3','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('6','Edificio4','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('7','Edificio5','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('8','Edificio6','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('11','Edificio7','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('12','Edificio8','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('6','Edificio9','NuevoLeon','64010','Mitras','monterrey','morelos',1,1),
('7','Edificio10','NuevoLeon','64010','Mitras','monterrey','morelos',1,1);
select * from Edificio
go
create table Editorial 
(
idEditorial int identity (1,1) not null,
nombre varchar(50) not null,
telefono char(10) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
insert into Editorial(nombre,telefono,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('Acantilado','8661245671','coahuila','25870','libertad','monclova','jose lopez portillo',1,1),
('Aguilar','8664545541','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1),
('Akal','8665209657','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1),
('Alba','8667893849','coahuila','25716','Ampliaci�n Roma','monclova','Acapulco',1,1),
('Alfaguara','8669639632','coahuila','25716','Picasso','monclova','Benjam�n Su�rez P.',1,1),
('Alianza','8667895213','coahuila','25716','Tecnol�gico','monclova','Bruno Neira',1,1),
('Almad�a','8667894521','coahuila','25716','Magisterio','monclova','Hip�crates',1,1),
('Anagrama','866456213','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1),
('Debolsillo','8664512648','coahuila','25716','Bugambilias','monclova','Palenque',1,1),
('Herder','8661234575','coahuila','25716','Chamizal','monclova','Peatonal B',1,1)
select * from Editorial
go
create table Equipo
(
idEquipo int identity (1,1) not null,
nombre varchar(30) not null,
cantidad char(3) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
insert into Equipo(nombre,cantidad,idUsuarioCrea,idUsuarioModifica)
values('computadora','20',1,1),
('laptop','10',1,1),
('internet','2',1,1),
('teclado','20',1,1),
('raton','20',1,1),
('pantalla','20',1,1),
('cpu','20',1,1),
('fuente de poder','20',1,1),
('servidor','1',1,1),
('usb','3',1,1),
('disco duro','20',1,1);
select * from Equipo
go
create table Foro
(
idForo int identity (1,1) not null,
nombre varchar(30) not null,
link varchar(100) not null,
tema varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Foro(nombre,link,tema,idUsuarioCrea,idUsuarioModifica)
values('Foros 24h','www.foros24h.com/','noticias',1,1),
('MeriStation','www.as.com/meristation/','programacion',1,1),
('GSMspain','www.gsmspain.com/','noticias tecnologicas',1,1),
('El Otro Lado','www.elotrolado.net/','noticias',1,1),
('ForoMTB','www.foromtb.com/','foro de noticias',1,1),
('Foros ACB','www.foros.acb.com/','foro de noticias',1,1),
('Amstrad.es Forum','www.amstrad.es/forum/index.php','Foro de informatica',1,1),
('Bubok ','www.bubok.es/foros','noticias',1,1),
('Canonistas','www.canonistas.com/foros/','investigaciones',1,1),
('El Foro','www.elforo.com/','noticias informaticas',1,1),
('elhacker.NET','www.elhacker.net/','seguridad informatico',1,1);
select * from Foro
go
create table FeriaCiencia
(
idFeriaCiencia int identity (1,1) not null,
participante varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
especialidad varchar(50) not null,
universidad varchar(50) not null,
fecha datetime not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into FeriaCiencia(participante,apellidoPaterno,apellidoMaterno,especialidad,universidad,fecha,idUsuarioCrea,idUsuarioModifica)
values('Ricardo Eli�cer','Neftal� Reyes','Basoalto ','Informatico','UNAM','20220117',1,1),
('Gabriel','Garc�a','M�rquez','Informatico','Colmex','20210907',1,1),
('Isabel Ang�lica','Allende','Llona','Programacion','IPN','20220102',1,1),
('Mario','Vargas','Llosa','Mecanica','UAch','20220611',1,1),
('Jorge Francisco Isidoro','Luis','Borges','Energias Renovables','UAM','20220118',1,1),
('Julio','Florencio','Cort�zar','Mecanica','UAEH','20210414',1,1),
('Lucila','Godoy','Alcayaga','Programacion','Tec','20220102',1,1),
('Mario','Benedetti','Farrugia','Energias Renovables','UAEMEx','20190519',1,1),
('Carlos','Fuentes','Mac�as','Electronica','UDG','20210916',1,1),
('Octavio Irineo','Paz','Lozano','Electronica','BUAP','20211216',1,1)
select * from FeriaCiencia
go
create table Horario
(
idHorario int identity (1,1) not null,
materia varchar(50) not null,
horaInicio char (5) not null,
horaTermina char (5) not null,
docente varchar (50) not null,
correo varchar (50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
--Registro
insert into Horario(materia,horaInicio,horaTermina,docente,correo,idUsuarioCrea,idUsuarioModifica)
values('calculo','1:10','2:00','Mario Benedetti','MarioBenedetti@gmail.com',1,1),
('fisica','12:20','2:00','Gabriel Garcia','GabrielGarcia@gmail.com',1,1),
('fundamentos de programacion','7:00','7:50','Lucila Fuentes','LucilaFuentes@gmail.com',1,1),
('calculo integral','8:40','10:20','Carlos Benedetti','CarlosBenedetti@gmail.com',1,1),
('fundamentos de base de datos','9:30','11:30','Octavio Irineo','OctavioIrineo@gmail.com',1,1),
('ingles','12:20','2:00','Mario Vargas','MarioVargas@gmail.com',1,1),
('sistemas operativos','7:50','8:40','Isabel Ang�lica','IsabelAngelica@gmail.com',1,1),
('Legislacion','7:50','8:40','Ricardo Eli�cer','RicardoEliecer@gmail.com',1,1),
('Programacion orientado a objetos','7:50','8:40','Julio Florencio','JulioFlorencio@gmail.com',1,1),
('informatica','7:50','8:40','Julio Morales','JulioMorales@gmail.com',1,1)
select * from Horario
go
create table Kardex
(
idKardex int identity (1,1) not null,
asignatura varchar(50) not null,
oportunidad char (1) not null,
calificacion char (3) not null,
periodo datetime not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
--Registro
insert into Kardex(asignatura,oportunidad,calificacion,periodo,idUsuarioCrea,idUsuarioModifica)
values('calculo','1','95','20190117',1,1),
('fisica','1','91','20220102',1,1),
('fundamentos de programacion','1','92','20210907',1,1),
('calculo integral','2','75','20190521',1,1),
('fundamentos de base de datos','1','73','20210121',1,1),
('ingles','2','96','20220212',1,1),
('sistemas operativos','1','82','20211201',1,1),
('Legislacion','1','100','20220516',1,1),
('Programacion orientado a objetos','2','91','20190612',1,1),
('informatica','1','81','20221105',1,1)
select * from Kardex
go
create table Periodo
(
idPeriodo int identity (1,1) not null,
fechaInicio datetime not null,
fechaTermina datetime not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Periodo(fechainicio,fechaTermina,idUsuarioCrea,idUsuarioModifica)
values('20210907','20220907',1,1),
('20220117','20220917',1,1),
('20210916','20220201',1,1),
('20190519','20201112',1,1),
('20220102','20220907',1,1),
('20210414','20210712',1,1),
('20190519','20200916',1,1),
('20220611','20221215',1,1),
('20220611','20220202',1,1),
('20220118','20220313',1,1)
select * from Periodo
go
create table Prestamo
(
idPrestamo int identity (1,1) not null,
fechaInicio datetime not null,
fechaFinal datetime not null,
fechaEntrega datetime not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Prestamo(fechaInicio,fechaFinal,fechaEntrega,idUsuarioCrea,idUsuarioModifica)
values('20210907','20221012','20210912',1,1),
('20220117','20220917','20220125',1,1),
('20210916','20220201','20210927',1,1),
('20190519','20201112','20190619',1,1),
('20220102','20220907','20220202',1,1),
('20210414','20210712','20210614',1,1),
('20190519','20200916','20190719',1,1),
('20220611','20221215','20220811',1,1),
('20220611','20220202','20220711',1,1),
('20220118','20220313','20220411',1,1)
select * from Prestamo
go
create table Proyecto
(
idProyecto int identity (1,1) not null,
nombre varchar(40) not null,
fechaInicio datetime not null,
fechaFinal datetime not null,
descripcion varchar (100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Proyecto(nombre,fechaInicio,fechaFinal,descripcion,idUsuarioCrea,idUsuarioModifica)
values('cuidado medio ambiente','20210907','20221012','Proyecto de Cuidado del medio ambiente',1,1),
('programacion','20220117','20220917','Proyecto de Programacion',1,1),
('informatica','20210916','20220201','Proyecto de Informatica',1,1),
('matematicas','20190519','20201112','Proyecto de Matematicas',1,1),
('quimica','20220102','20220907','Proyecto de Quimica',1,1),
('diagrama','20210414','20210712','Proyecto de Diagrama',1,1),
('documentacion','20190519','20200916','Proyecto de Documentacion',1,1),
('ingles','20220611','20221215','Proyecto de Ingles',1,1),
('legislacion','20220611','20220202','Proyecto de Legislacion',1,1),
('informatica','20220118','20220313','Proyecto de Informatica',1,1)
select * from Proyecto
go
create table Residencia
(
idResidencia int identity (1,1) not null,
nombre varchar(40) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
descripcion varchar (100) not null,
cantidadHoras char (3) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Residencia(nombre,estado,numero,colonia,ciudad,calle,descripcion,cantidadHoras,idUsuarioCrea,idUsuarioModifica)
values('Cemex','coahuila','25870','libertad','monclova','jose lopez portillo','empresa dedicada a contruccion','120',1,1),
('Femsa','coahuila','25716','PEMEX','monclova','Rafael De La Fuente','industria de alimentos','234',1,1),
('Alfa','coahuila','25716','Teocali','monclova','Jalisco Sur','empresa dedicada a contruccion','210',1,1),
('Arca','coahuila','25716','Ampliaci�n Roma','monclova','Acapulco','industria de alimentos','210',1,1),
('Afirme','coahuila','25716','Picasso','monclova','Benjam�n Su�rez P.','empresa dedicada a contruccion','200',1,1),
('Softtec','coahuila','25716','Tecnol�gico','monclova','Bruno Neira','empresa dedicada a la informatica','190',1,1),
('Almad�a','coahuila','25716','Magisterio','monclova','Hip�crates','empresa dedicada a contruccion','210',1,1),
('Anagrama','coahuila','25716','Mayo','monclova','Indios Tobosos','empresa dedicada a la informatica','200',1,1),
('Debolsillo','coahuila','25716','Bugambilias','monclova','Palenque','empresa dedicada a la informatica','189',1,1),
('Herder','coahuila','25716','Chamizal','monclova','Peatonal B','empresa dedicada a contruccion','192',1,1);
select * from Residencia
go
create table Seccion
(
idSeccion int identity (1,1) not null,
letra char(1) not null,
numero char(2) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Seccion(letra,numero,idUsuarioCrea,idUsuarioModifica)
values('A','1',1,1),
('A','2',1,1),
('A','3',1,1),
('B','1',1,1),
('B','2',1,1),
('B','3',1,1),
('C','1',1,1),
('C','2',1,1),
('C','3',1,1),
('D','1',1,1),
('D','2',1,1);
select * from Seccion
go
create table ServicioSocial
(
idServicioSocial int identity (1,1) not null,
nombre varchar (40) not null,
fecha datetime not null,
cantidadHoras char(3) not null,
descripcion varchar (100) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into ServicioSocial(nombre,fecha,cantidadHoras,descripcion,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('Cemex','20210907','120','empresa dedicada a contruccion','coahuila','25870','libertad','monclova','jose lopez portillo',1,1),
('Femsa','20220117','234','industria de alimentos','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1),
('Alfa','20220917','210','empresa dedicada a contruccion','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1),
('Arca','20210916','210','industria de alimentos','coahuila','25716','Ampliaci�n Roma','monclova','Acapulco',1,1),
('Afirme','20220201','200','empresa dedicada a contruccion','coahuila','25716','Picasso','monclova','Benjam�n Su�rez P.',1,1),
('Softtec','20190519','190','empresa dedicada a la informatica','coahuila','25716','Tecnol�gico','monclova','Bruno Neira',1,1),
('Almad�a','20220102','210','empresa dedicada a contruccion','coahuila','25716','Magisterio','monclova','Hip�crates',1,1),
('Anagrama','20220907','200','empresa dedicada a la informatica','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1),
('Debolsillo','20220611','189','empresa dedicada a la informatica','coahuila','25716','Bugambilias','monclova','Palenque',1,1),
('Herder','20190519','192','empresa dedicada a contruccion','coahuila','25716','Chamizal','monclova','Peatonal B',1,1);
select * from ServicioSocial
go
create table Tesis
(
idTesis int identity (1,1) not null,
titulo varchar (60) not null,
descripcion varchar (150) not null,
fechaInicio datetime not null,
fechaFinal datetime not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Tesis(titulo,descripcion,fechaInicio,fechaFinal,idUsuarioCrea,idUsuarioModifica)
values('Desarrollo sostenible','forma de organizar la producci�n y la relaci�n de las personas con su medio ambiente','20210907','20221012',1,1),
('Programaci�n de aplicaciones para dispositivos electr�nicos','�C�mo hacer un software seguro? �Qu� hay que tener en cuenta para desarrollar una aplicaci�n que sea f�cil de entender?','20210907','20221012',1,1),
('La regulaci�n de las criptomonedas','casos en los que ya se ha regulado el comercio de las criptomonedas o una posible regulaci�n de criptomonedas a nivel internacional','20210907','20221012',1,1),
('La psicolog�a en la publicidad','Analizar las campa�as publicitarias desde una perspectiva psicol�gica','20210907','20221012',1,1),
('Tratamientos para la anorexia','�Cu�les son los mejores tratamientos? �Es algo que se debe abordar solo desde la medicina o tambi�n desde la psicolog�a?','20210907','20221012',1,1),
('El rol del periodista en la era digital','el rol del periodista en los peri�dicos en contraposici�n con el rol de periodista en las redes sociales','20210907','20221012',1,1),
('Ense�anza de idiomas a trav�s del m�todo comunicativo','investigar con mayor profundidad las ventajas y desventajas de un modelo que combine ambas maneras de ense�anza','20210907','20221012',1,1),
('Dise�ar teniendo en cuenta el medioambiente','dise�o en relaci�n con la producci�n sostenible, pol�ticas p�blicas que fomenten la producci�n con menos costo energ�tico','20210907','20221012',1,1),
('Ventajas y desventajas de la comida org�nica','el impacto de la producci�n de los alimentos org�nicos en el medioambiente, el impacto en la salud del consumo','20210907','20221012',1,1),
('Cambios en las leyes impositivas','motivos de los cambios de estas leyes, capacitaciones en relaci�n con estas leyes y propuestas para leyes impositivas m�s transparentes','20210907','20221012',1,1);
go
select * from Tesis
create table Toefl
(
idToefl int identity (1,1) not null,
nombre varchar (50) not null,
descripcion varchar (100) not null,
fecha datetime not null,
cantidadPreguntas char (3) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Toefl(nombre,descripcion,fecha,cantidadPreguntas,idUsuarioCrea,idUsuarioModifica)
values('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20210907','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20221012','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzadol','20201213','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20190321','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20220505','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20211114','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20200120','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20210921','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20220216','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma ingl�s en niveles intermedio y avanzado','20190718','140',1,1);
select * from Toefl
go
create table TipoArea
(
idTipoArea int identity (1,1) not null,
nombre varchar (50) not null,
descripcion varchar (150) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into TipoArea(nombre,descripcion,idUsuarioCrea,idUsuarioModifica)
values('Control Escolar','Registrar y organizar la informaci�n de los participantes y usuarios de los programas de capacitaci�n',1,1),
('Din�mica Escolar y Archivos.','Dise�o de las tareas y evaluaci�n act�an transformando las diferencias en desigualdades.',1,1),
('Infraestructura y Recursos Materiales','Infraestructura y Recursos Materiales de toda la universidad',1,1),
('Recursos Contables, Administrativos y Financieros','Recursos Contables, Administrativos y Financieros de todo la universidad',1,1),
('Recursos Humanos y Capacitaci�n','Toda Capacitaci�n y recursos humanos contables',1,1),
('Control Escolar','Registrar y organizar la informaci�n de los participantes y usuarios de los programas de capacitaci�n y profesionalizaci�n',1,1),
('Atenci�n y Orientaci�n al alumnado y la comunidad','Atenci�n y Orientaci�n al alumnado',1,1),
('Apoyo al Aprendizaje','ayuda al alumnado a adquirirlo de manera m�s eficaz',1,1),
('Estrategias de apoyo','Numerosas estrategias para ayudar al alumnado',1,1),
('Apoyo de equipo','utilizacion de herramientas como impresoras',1,1);
select * from TipoArea
go
create table TipoExamen
(
idTipoExamen int identity (1,1) not null,
nombre varchar (50) not null,
descripcion varchar (100) not null,
estatus int default 1,
fecha datetime not null,
cantidadPreguntas char (3) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into TipoExamen(nombre,descripcion,fecha,cantidadPreguntas,idUsuarioCrea,idUsuarioModifica)
values('Examen avance','es un examen en niveles intermedio y avanzado','20210907','100',1,1),
('Examen normal','examen de unidad con cualquier asignatura','20221012','50',1,1),
('Examen prueba','examen de prueba que no tiene ningun rendimiento en las calificaciones','20201213','20',1,1),
('Examen recuperacion','examen de recuperacion de una asignatura reprobada','20190321','60',1,1),
('Examen extraordinario','examen de una materia extraordinario','20220505','60',1,1),
('Examen avance ','es un examen en niveles intermedio y avanzado','20211114','100',1,1),
('Examen avance','es un examen en niveles intermedio y avanzado','20200120','100',1,1),
('Examen prueba','examen de prueba que no tiene ningun rendimiento en las calificaciones','20210921','50',1,1),
('Examen recuperacion','examen de recuperacion de una asignatura reprobada','20220216','60',1,1),
('Examen normal','examen de unidad con cualquier asignatura','20190718','50',1,1);
select * from TipoExamen
go
create table TransporteEscolar
(
idTransporteEscolar int identity (1,1) not null,
nombre varchar (50) not null,
cantidad char(2) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into TransporteEscolar(nombre,cantidad,idUsuarioCrea,idUsuarioModifica)
values('Camion TEC','1',1,1),
('Camion UNAM','3',1,1),
('Camion Colmex','2',1,1),
('Camion IPN','4',1,1),
('Camion UAM','5',1,1),
('Camion UAEMEx','3',1,1),
('Camion UDG','2',1,1),
('Camion BUAP','1',1,1),
('Camion UAch','4',1,1),
('Camion Politecnico','3',1,1);
select * from TransporteEscolar
go
create table Vacacion
(
idVacacion int identity (1,1) not null,
fechaInicio datetime not null,
fechaRegreso datetime not null,
descripcion varchar (100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null);
go
insert into Vacacion(fechaInicio,fechaRegreso,descripcion,idUsuarioCrea,idUsuarioModifica)
values('20210907','20211012','Vacaciones de Verano',1,1),
('20220917','20220117','Vacaciones de invierno',1,1),
('20210916','20220201','Vacaciones de oto�o',1,1),
('20190519','20201112','Vacacion de primavera',1,1),
('20220102','20220907','Vacacion de primavera',1,1),
('20210414','20210712','Vacacion de primavera',1,1),
('20190519','20190529','Vacaciones de semana santa',1,1),
('20220611','20221215','Vacaciones de Oto�o',1,1),
('20220611','20220202','Vacaciones de invierno',1,1),
('20220118','20220313','Vacaciones de Verano',1,1);
select * from Vacacion
go
--Empieza los foraneos
create table Actividad
(
idActividad int identity (1,1) not null,
descripcion varchar (100) not null,
fecha datetime not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idClub int not null);
go
insert into Actividad(descripcion,fecha,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica,idClub)
Values('Actividad de Futbol','20211012','coahuila','25870','libertad','monclova','jose lopez portillo',1,1,1),
('Actividad de Arte','20220117','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1,2),
('Actividad de Karate','20220201','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1,3),
('Actividad de Tenis','20201112','coahuila','25716','Ampliaci�n Roma','monclova','Acapulco',1,1,4),
('Actividad de BasquetBall','20220907','coahuila','25716','Picasso','monclova','Benjam�n Su�rez P.',1,1,5),
('Actividad de Atletismo','20210712','coahuila','25716','Tecnol�gico','monclova','Bruno Neira',1,1,6),
('Actividad de Ajedrez','20190529','coahuila','25716','Magisterio','monclova','Hip�crates',1,1,7),
('Actividad de Baile','20220313','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1,8),
('Actividad de Gimnasia','20220202','coahuila','25716','Bugambilias','monclova','Palenque',1,1,9),
('Actividad de Teatro','20221215','coahuila','25716','Chamizal','monclova','Peatonal B',1,1,10);
select * from Actividad
go
create table Alumno
(
idAlumno int identity (1,1) not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
estatus int default 1,
matricula varchar (20) not null,
curp varchar(18) not null,
telefono char(10) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idClub int not null,
idAdeudo int not null,
idForo int not null,
idTransporteEscolar int not null,
idCredencialEscolar int not null,
idServicioSocial int not null,
idResidencia int not null,
idCurso int not null,
idBeca int not null,
idFeriaCiencia int not null,
idToefl int not null,
idGrupo int not null,);
go
insert into Alumno(nombre,apellidoPaterno,apellidoMaterno,matricula,curp,telefono,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica,idClub,idAdeudo,idForo,idTransporteEscolar,idCredencialEscolar,idServicioSocial,idResidencia,idCurso,idBeca,idFeriaCiencia,idToefl,idGrupo)
Values('Alejandro','Mendez','Mendez ','I20050032','FOGE530617MMCLRL09','8662152432','Coahuila','25700','Monclova Centro','Monclova','Oriente',1,1,1,1,1,1,1,1,1,1,1,1,1,1),
('Carlos','Cetino','Ruiz','I20050096','FOGI400206HGRLRG06','8661234512','Coahuila','25710','Los Cedros','Monclova','Nicol�s Bravo',1,1,2,2,2,2,2,2,2,2,2,2,2,2),
('H�ctor Le�nidas','Revolorio','Quevedo','I20050049','FIEN851010MGRGSC08','8661561478','Coahuila','25714','Picasso','Monclova','Carrillo Puerto',1,1,3,3,3,3,3,3,3,3,3,3,3,3),
('Hugo Leonel','L�pez','Villacorta','I20050052','HABS810221MMSRTY08','8667845121','Coahuila','25725','Arboledas','Monclova','Benjam�n',1,1,4,4,4,4,4,4,4,4,4,4,4,4),
('Alejandro','Rivera','P�rez','I20050091','AAMR780430MGRBRN00','8663512484','Coahuila','25730','Aguanaval','Monclova','Frambuesa',1,1,5,5,5,5,5,5,5,5,5,5,5,5),
('Ana Francisca','Armira','Carreto','I20050041','AARJ990531HMSCMN09','8663214569','Coahuila','25734','Francisco Villa','Monclova','Kennedy',1,1,6,6,6,6,6,6,6,6,6,6,6,6),
('Claudia Patricia','Reynoso','Tecun','I20050002','CASL650625MVZMNC01','8669756421','Coahuila','25740','San Isidro','Monclova','Hacienda',1,1,7,7,7,7,7,7,7,7,7,7,7,7),
('Edgar Rolando','Equite','Fuentes','I20050009','EUDE910609HMSSVD01','8661523145','Coahuila','25740','San Miguel','Monclova','Jose sepulveda',1,1,8,8,8,8,8,8,8,8,8,8,8,8),
('Gerardo Enrique','Reyes','Aguilar','I20050011','GAAL720714HGRRBN01','8661234675','Coahuila','25747','21 de Marzo','Monclova','Jim�nez',1,1,9,9,9,9,9,9,9,9,9,9,9,9),
('Gilberto','Santos','L�pez','I20050012','GALG980917HBCRRD08','8664521311','Coahuila','25750','Independencia','Monclova','De Las Moras',1,1,10,10,10,10,10,10,10,10,10,10,10,10);
select * from Alumno
go
create table Asignatura
(
idAsignatura int identity (1,1) not null,
nombre varchar(50) not null,
semestre char(2) not null,
descripcion varchar(200) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idCalificacion int not null);
go
insert into Asignatura(nombre,semestre,descripcion,idUsuarioCrea,idUsuarioModifica,idCalificacion)
values('Quimica','1','ciencia que tiene por finalidad no s�lo descubrir, sino tambi�n, y sobre todo, crear, ya que es el arte de hacer compleja la materia',1,1,1),
('Biologia','1','estudia los seres vivos de manera integral, desde el nivel molecular hasta como integrante de los ecosistemas',1,1,2),
('Fundamentos de Programacion','2','asignatura b�sica que permite crear programas que exhiban un comportamiento deseado',1,1,3),
('Sistemas operativos','4','funciones que desempe�an los sistemas operativos, as� como las razones de dise�o que determinan su estructura',1,1,4),
('Ingles','7','proporciona las estructuras b�sicas para el aprendizaje del idioma ingl�s.',1,1,5),
('Calculo integral','2','contribuye a desarrollar un pensamiento l�gico-matem�tico al perfil del ingeniero y aporta las herramientas b�sicas para desarrollar el estudio',1,1,6),
('Calculo Diferencial','3','contribuye a desarrollar un pensamiento l�gico-matem�tico al perfil del ingeniero y aporta las herramientas b�sicas para introducirse al estudio del c�lculo y su aplicaci�n',1,1,7),
('Ciencia y tecnologia','1','se ocupa de conocer y comprender los objetivos y fen�menos ya existentes, la tecnolog�a trata de crear productos y servicios que aun no existen, pero que son necesarios',1,1,8),
('Base de datos','5','asignatura obligatoria que consta de 6 cr�ditos y que introducir� al estudiante en las �reas fundamentales de esta materia',1,1,9),
('Administracion de archivos','3','gesti�n que se orienta a la implementaci�n de toda la cartera de servicios que se ofrece, de manera tanto interna como externa, desde el �rea de Archivos de cualquier organizaci�n',1,1,10);
select * from Asignatura
go
create table Area
(
idArea int identity (1,1) not null,
descripcion varchar(100) not null,
nombre varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idTipoArea int not null,
idEdificio int not null);
go
insert into Area(nombre,descripcion,idUsuarioCrea,idUsuarioModifica,idTipoArea,idEdificio)
values('Area Informatica','Encargado de toda la informacion y comunicacion de la universidad',1,1,1,1),
('Area Prefectura','Encargado para controlar y dirigir alumnos',1,1,2,2),
('Area Cafeteria','Encargado de los productos que llegan a consumir el personal',1,1,3,3),
('Area Directivos','Encargado de dirigir a todo el personal',1,1,4,4),
('Area ServicioEscolar','Encargado de el Servicio Escolar',1,1,5,5),
('Area Colegiatura','Encargado de tramitar los pagos de colegiatura',1,1,6,6),
('Area Enfermeria','Encargado de dar apoyo a el personal si hay accidentes',1,1,7,7),
('Area Psicologo','Encargado de apoyar al alumno con problemas personales que este pasando',1,1,8,8),
('Area de Negocio','Encargado de los negocios que hace la universidad',1,1,9,9),
('Area de Apoyo','Apoyo a alumnos con problemas de discapacidad de fuerza mayor',1,1,10,10);
select * from Area
go
create table Aula
(
idAula int identity (1,1) not null,
nombre varchar(30) not null,
numero varchar(10) not null,
tama�o varchar(10) not null,
cantidadSillas char(3) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idEdificio int not null);
insert into Aula(nombre,numero,tama�o,cantidadSillas,idUsuarioCrea,idUsuarioModifica,idEdificio)
values('AulaInformatica,','1','80','40',1,1,1),
('AulaMecanica,','1','40','20',1,1,1),
('AulaGestion,','1','50','30',1,1,1),
('AulaDirectivo,','1','80','40',1,1,1),
('AulaConferencia,','1','80','40',1,1,1),
('AulaInformatica,','2','80','40',1,1,1),
('AulaMecanica,','2','80','40',1,1,1),
('AulaGestion,','2','80','40',1,1,1),
('AulaInformatica,','3','80','40',1,1,1),
('AulaMecanica,','3','80','40',1,1,1),
('AulaGestion,','3','80','40',1,1,1);
select * from Aula
go
create table Carrera
(
idCarrera int identity (1,1) not null,
nombre varchar(30) not null,
cantidadSemestre char(2) not null,
descripcion varchar(200) not null,
cantidadAsignatura char(2) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idPeriodo int not null);
go
insert into Carrera(nombre,cantidadSemestre,descripcion,cantidadAsignatura,idUsuarioCrea,idUsuarioModifica,idPeriodo)
values('Ing.Informatico,','9',' transforma y administra la informaci�n a trav�s del dise�o, desarrollo y aplicaci�n de la tecnolog�a.','40',1,1,1),
('Ing.Mecanica,','8',' Combina los principios de la f�sica de la ingenier�a y las matem�ticas con la ciencia de los materiales, a fin de dise�ar, analizar, fabricar y mantener sistemas mec�nicos','20',1,1,2),
('Ing.GestionEmpresarial,','10','es una carrera dedicada a la gesti�n, creaci�n y uso de metodolog�as y t�cnicas creativas para el desarrollo empresarial de las organizaciones e incluso instituciones.','30',1,1,3),
('Ing.EnergiasRenovables,','8',' ocupa del dise�o, instalaci�n y mantenimiento de los sistemas que funcionan y aprovechan la energ�a solar, e�lica, hidr�ulica, bioenerg�a y maremotriz','40',1,1,4),
('Ing.Electronica,','9','encarga de resolver problemas de la ingenier�a tales como el control de procesos industriales y de sistemas electr�nicos de potencia','40',1,1,5),
('Artes y humanidades,','8','�rea de estudio que agrupa a las profesiones que se dedican a resguardar, comprender y sistematizar el acervo cultural de un pa�s','40',1,1,6),
('Administraci�n y negocios,','10','utilizar principios de eficiencia y racionalidad en los recursos tanto financieros, como humanos y materiales en las organizaciones e instituciones p�blicas y privadas','40',1,1,7),
('Ing.industrial,','9','integra proyectos para dise�ar, operar y administrar los sistemas de producci�n, de manufactura y de servicio en el sector automotriz, alimenticio, de automatizaci�n, educativo y metal�rgico.','40',1,1,8),
('Ing.Mecatronica,','9','es la que une la ingenier�a mec�nica, ingenier�a electr�nica, ingenier�a de control e ingenier�a inform�tica, para dise�ar y desarrollar productos que involucren sistemas de control','40',1,1,9),
('Ing.Quimica,','8','dise�an, optimizan, controlan y administran los procesos para transformar de manera f�sica y qu�mica las materias primas','40',1,1,10);
select * from Carrera
go
create table Empleado
(
idEmpleado int identity (1,1) not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
telefono char(10) not null,
rfc char(20) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idArea int not null);
insert into Empleado(nombre,apellidoPaterno,apellidoMaterno,telefono,estado,numero,colonia,ciudad,calle,rfc,idUsuarioCrea,idUsuarioModifica,idArea)
Values('Jaime Francisco','Aguayo','Gonz�lez','8662157432','Coahuila','25700','Monclova Centro','Monclova','Oriente','JAAG221220IL7',1,1,1),
('Andrea','Heredia','Ch�vez','8661234112','Coahuila','25710','Los Cedros','Monclova','Nicol�s Bravo','HECA2212078E5',1,1,2),
('Ruth Silvana','Lagunes','Cort�s','8661961478','Coahuila','25714','Picasso','Monclova','Carrillo Puerto','LACR221207KD7',1,1,3),
('Luis Felipe','Delgado','Barr�n','8667745121','Coahuila','25725','Arboledas','Monclova','Benjam�n','DEBL2212078E2',1,1,4),
('Espejo Ramos','Hansel','Andres','8663545484','Coahuila','25730','Aguanaval','Monclova','Frambuesa','EEHA221207QT10',1,1,5),
('Aniyensy Sarai','Flores','Aguilar','8663214569','Coahuila','25734','Francisco Villa','Monclova','Kennedy','AIFA2212206Q2',1,1,6),
('Jos� Ignacio','G�mez','Vargas','8669756421','Coahuila','25740','San Isidro','Monclova','Hacienda','IAGV2212312I4',1,1,7),
('Gonz�lez Trejo','Cipriano','Ariel','8661523145','Coahuila','25740','San Miguel','Monclova','Fuentes','GOCA221221I83',1,1,8),
('Hern�ndez Palacios','Reyes','Aguilar','8661234675','Coahuila','25747','21 de Marzo','Monclova','Jim�nez','Hernandez Palacios',1,1,9),
('Itzel','Garcia','Nu�ez','8664521311','Coahuila','25750','Independencia','Monclova','De Las Moras','NUGI221221GK6',1,1,10);
select * from Empleado
go
create table Examen
(
idExamen int identity(1,1) not null,
numeroPregunta char(3) not null,
fecha datetime not null,
estatus int default 1,
semestre char(2) not null,
especialidad varchar(30) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idTipoExamen int not null,
idCalificacion int not null,
);
go
insert into Examen(numeroPregunta,fecha,semestre,especialidad,idUsuarioCrea,idUsuarioModifica,idTipoExamen,idCalificacion)
values('20','20210907','5','informatica',1,1,1,1),
('30','20221012','4','Mecanica',1,1,2,2),
('40','20201213','5','informatica',1,1,3,3),
('30','20190321','6','Gestion',1,1,4,4),
('40','20220505','7','informatica',1,1,5,5),
('50','20211114','8','Energias',1,1,6,6),
('40','20200120','3','Mecanica',1,1,7,7),
('20','20210921','2','Electronica',1,1,8,8),
('30','20220216','1','Electronica',1,1,9,9),
('40','20190718','4','informatica',1,1,10,10);
select * from Examen
go
create table Grupo
(
idGrupo int identity(1,1) not null,
nombre varchar(50) not null, 
cantidadAlumno char(3) not null,
especialidad varchar(30) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idAula int not null,
idSeccion int not null,
);
go
insert into Grupo(nombre,cantidadAlumno,especialidad,idUsuarioCrea,idUsuarioModifica,idAula,idSeccion)
values('GrupoA','34','informatica',1,1,1,1),
('GrupoB','32','Mecanica',1,1,2,2),
('GrupoA','31','informatica',1,1,3,3),
('GrupoB','12','Gestion',1,1,4,4),
('GrupoA','43','informatica',1,1,5,5),
('GrupoB','12','Energias',1,1,6,6),
('GrupoA','20','Mecanica',1,1,7,7),
('GrupoB','22','Electronica',1,1,8,8),
('GrupoA','35','Electronica',1,1,9,9),
('GrupoC','31','informatica',1,1,10,10);
select * from Grupo
go
create table Libro
(
idLibro int identity(1,1) not null,
titulo varchar(50) not null,
idioma char(10) not null,
edicion char(10) not null,
estatus int default 1,
fecha datetime not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idAula int not null,
idPrestamo int not null);
go
insert into Libro(titulo,idioma,edicion,fecha,idUsuarioCrea,idUsuarioModifica,idAula,idPrestamo)
values('Los Miserables','Espa�ol','1','20210907',1,1,1,1),
('El Alquimista','Espa�ol','1','20190718',1,1,2,2),
('El Capitalismo','Espa�ol','2','20220216',1,1,3,3),
('La Divina Comedia','Espa�ol','1','20200120',1,1,4,4),
('Cien a�os de Soledad','Espa�ol','2','20211114',1,1,5,5),
('El retrato de Dorian Grey','Espa�ol','2','20201213',1,1,6,6),
('El Principito','Espa�ol','1','20221012',1,1,7,7),
('Un mundo feliz','Espa�ol','1','20210504',1,1,8,8),
('A sangre fr�a','Espa�ol','1','20111112',1,1,9,9),
('Nada ','Espa�ol','1','20190911',1,1,10,10);
select * from Libro
go
create table Practica
(
idPractica int identity(1,1) not null,
evaluacion varchar(100) not null,
descripcion varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idCalificacion int not null);
go
insert into Practica(evaluacion,descripcion,idUsuarioCrea,idUsuarioModifica,idCalificacion)
Values('Investigacion completa','investigacion',1,1,1),
('diagrama er con 50 entidades','diagrama er',1,1,2),
('Completo con descripciones','diccionario de datos',1,1,3),
('Consulta con fuentes confiables','consulta',1,1,4),
('diagrama de flujo correcto','diagrama de flujo',1,1,5),
('Ensayo completo minimo 4 hojas','ensayo',1,1,6),
('Investigacion completa de concepto','conceptos',1,1,7),
('Investigacion de diagramas','diagramas',1,1,8),
('Esquemas completos','esquema',1,1,9),
('Cuadro sinoptico correctos','sinoptico',1,1,10);
select * from Practica
go
create table Producto
(
idProducto int identity(1,1) not null,
nombre varchar(40) not null,
cantidad char(4) not null,
precio char(3) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idArea int not null);
go
insert into Producto(nombre,cantidad,precio,idUsuarioCrea,idUsuarioModifica,idArea)
Values('Gringa','32','50',1,1,3),
('Tacos de olla','21','50',1,1,3),
('Agua','43','10',1,1,3),
('Refresco','53','16',1,1,3),
('Frituras','74','15',1,1,3),
('Dulces','31','3',1,1,3),
('Gorditas','43','20',1,1,3),
('Hamburgesa','30','40',1,1,3),
('Pizza','31','20',1,1,3),
('Jugo','32','15',1,1,3);
select * from Producto
go
create table Profesor
(
idProfesor int identity (1,1) not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
estatus int default 1,
maestria varchar (30) not null,
telefono char(10) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
rfc char(20) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idArea int not null);
go
insert into Profesor(nombre,apellidoPaterno,apellidoMaterno,maestria,telefono,estado,numero,colonia,ciudad,calle,rfc,idUsuarioCrea,idUsuarioModifica,idArea)
Values('Jaime Francisco','Aguayo','Gonz�lez','Educaci�n','8662157432','Coahuila','25700','Monclova Centro','Monclova','Oriente','JAAG221220IL7',1,1,1),
('Andrea','Heredia','Ch�vez','Psicopedagog�a','8661234112','Coahuila','25710','Los Cedros','Monclova','Nicol�s Bravo','HECA2212078E5',1,1,2),
('Ruth Silvana','Lagunes','Cort�s','Ingenier�a de Mantenimiento','8661961478','Coahuila','25714','Picasso','Monclova','Carrillo Puerto','LACR221207KD7',1,1,3),
('Luis Felipe','Delgado','Barr�n','Ingenieria de informatica','8667745121','Coahuila','25725','Arboledas','Monclova','Benjam�n','DEBL2212078E2',1,1,4),
('Espejo Ramos','Hansel','Andres','Servidores web','8663545484','Coahuila','25730','Aguanaval','Monclova','Frambuesa','EEHA221207QT10',1,1,5),
('Aniyensy Sarai','Flores','Aguilar','Base de datos','8663214569','Coahuila','25734','Francisco Villa','Monclova','Kennedy','AIFA2212206Q2',1,1,6),
('Jos� Ignacio','G�mez','Vargas','Ingeneria de mantenimiento','8669756421','Coahuila','25740','San Isidro','Monclova','Hacienda','IAGV2212312I4',1,1,7),
('Gonz�lez Trejo','Cipriano','Ariel','Ingenieria en informatica','8661523145','Coahuila','25740','San Miguel','Monclova','Fuentes','GOCA221221I83',1,1,8),
('Hern�ndez Palacios','Reyes','Aguilar','Cisco','8661234675','Coahuila','25747','21 de Marzo','Monclova','Jim�nez','Hernandez Palacios',1,1,9),
('Itzel','Garcia','Nu�ez','Calculo','8664521311','Coahuila','25750','Independencia','Monclova','De Las Moras','NUGI221221GK6',1,1,10);
select * from Profesor
go
create table Recurso
(
idRecurso int identity (1,1) not null,
fechaInicio datetime not null,
fechaFinal datetime not null,
descripcion varchar(100) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idAdeudo int not null);
go
insert into Recurso(fechaInicio,fechaFinal,descripcion,idUsuarioCrea,idUsuarioModifica,idAdeudo)
Values('20210907','20211012','Clases en vacaciones de Verano',1,1,1),
('20220917','20220117','Clases en vacaciones de invierno',1,1,2),
('20210916','20220201','Clases en vacaciones de Oto�o',1,1,3),
('20190519','20201112','Clases en vacaciones de primavera',1,1,4),
('20220102','20220907','Clases en vacaciones de primavera',1,1,5),
('20210414','20210712','Clases en vacaciones de primavera',1,1,6),
('20190519','20190529','Clases en vacaciones de Verano',1,1,7),
('20220611','20221215','Clases en vacaciones de oto�o',1,1,8),
('20220611','20220202','Clases en vacaciones de invierno',1,1,9),
('20220118','20220313','Clases en vacaciones de verano',1,1,10);
select * from Recurso
go
create table Sinodal
(
idSinodal int identity (1,1) not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
telefono char(10) not null,
correo varchar(50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idFeriaCiencia int not null);
go
insert into Sinodal(nombre,apellidoPaterno,apellidoMaterno,telefono,correo,idUsuarioCrea,idUsuarioModifica,idFeriaCiencia)
values('Ricardo Eli�cer','Neftal� Reyes','Basoalto ','8662157432','MarioBenedetti@gmail.com',1,1,1),
('Gabriel','Garc�a','M�rquez','8661961478','GabrielGarcia@gmail.com',1,1,2),
('Isabel Ang�lica','Allende','Llona','8661961478','LucilaFuentes@gmail.com',1,1,3),
('Mario','Vargas','Llosa','8667745121','CarlosBenedetti@gmail.com',1,1,4),
('Jorge Francisco Isidoro','Luis','Borges','8664521311','OctavioIrineo@gmail.com',1,1,5),
('Julio','Florencio','Cort�zar','8669756421','MarioVargas@gmail.com',1,1,6),
('Lucila','Godoy','Alcayaga','8661853215','JulioFlorencio@gmail.com',1,1,7),
('Mario','Benedetti','Farrugia','8664512212','MarioBenedetti@gmail.com',1,1,8),
('Carlos','Fuentes','Mac�as','8665421364','CarlosFuetes@gmail.com',1,1,9),
('Octavio Irineo','Paz','Lozano','8661452134','OctavioIrineo@gmail.com',1,1,10);
select * from Sinodal
go
create table Taller
(
idTaller int identity (1,1) not null,
nombre varchar (50) not null,
estatus int default 1,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea DateTime default getdate(),
fechaModifica DateTime null,
idEdificio int not null);
go
insert into Taller(nombre,idUsuarioCrea,idUsuarioModifica,idEdificio)
values('Taller Automotriz',1,1,1),
('Taller Electronica',1,1,2),
('Taller Informatica',1,1,3),
('Taller Mecanica',1,1,4),
('Taller Automotriz',1,1,5),
('Taller de contruccion',1,1,6),
('Taller de programacion',1,1,7),
('Taller de cisco',1,1,8),
('Taller de servidores web',1,1,9),
('Taller programacion2',1,1,10);
select * from Taller
--Tablas N-M
go
create table AsignaturaProfesor
(
idAsignaturaProfesor int identity (1,1) not null,
idAsignatura int not null,
idProfesor int not null,
estatus int default 1);
go
insert into AsignaturaProfesor(idAsignatura,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AsignaturaProfesor
go
create table AsignaturaCarrera
(
idAsignaturaCarrera int identity (1,1) not null,
idAsignatura int not null,
idCarrera int not null,
estatus int default 1,
);
go
insert into AsignaturaCarrera(idAsignatura,idCarrera)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AsignaturaCarrera
go
create table AlumnoPrestamo
(
idAlumnoPrestamo int identity (1,1) not null,
idAlumno int not null,
idPrestamo int not null,
estatus int default 1,
);
go
insert into AlumnoPrestamo(idAlumno,idPrestamo)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoPrestamo
go
create table AlumnoCredito
(
idAlumnoCredito int identity (1,1) not null,
idAlumno int not null,
idCredito int not null,
estatus int default 1,
);
go
insert into AlumnoCredito(idAlumno,idCredito)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoCredito
go
create table AlumnoColegiatura
(
idAlumnoColegiatura int identity (1,1) not null,
idAlumno int not null,
idColegiatura int not null,
estatus int default 1,
);
go
insert into AlumnoColegiatura(idAlumno,idColegiatura)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoColegiatura
go
create table AlumnoKardex
(
idAlumnoKardex int identity (1,1) not null,
idAlumno int not null,
idKardex int not null,
estatus int default 1,
);
go
insert into AlumnoKardex(idAlumno,idKardex)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoKardex
go
create table AlumnoConcurso
(
idAlumnoConcurso int identity (1,1) not null,
idAlumno int not null,
idConcurso int not null,
estatus int default 1,
);
go
insert into AlumnoConcurso(idAlumno,idConcurso)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoConcurso
go
create table AlumnoAsignatura
(
idAlumnoAsignatura int identity (1,1) not null,
idAlumno int not null,
idAsignatura int not null,
estatus int default 1,
);
go
insert into AlumnoAsignatura(idAlumno,idAsignatura)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoAsignatura
go
create table AlumnoExamen
(
idAlumnoExamen int identity (1,1) not null,
idAlumno int not null,
idExamen int not null,
estatus int default 1,
);
go
insert into AlumnoExamen(idAlumno,idExamen)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoExamen
go
create table AlumnoHorario
(
idAlumnoHorario int identity (1,1) not null,
idAlumno int not null,
idHorario int not null,
estatus int default 1,
);
go
insert into AlumnoHorario(idAlumno,idHorario)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoHorario
go
create table AlumnoVacacion
(
idAlumnoVacacion int identity (1,1) not null,
idAlumno int not null,
idVacacion int not null,
estatus int default 1,
);
go
insert into AlumnoVacacion(idAlumno,idVacacion)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoVacacion
go
create table AlumnoProyecto
(
idAlumnoProyecto int identity (1,1) not null,
idAlumno int not null,
idProyecto int not null,
estatus int default 1,
);
go
insert into AlumnoProyecto(idAlumno,idProyecto)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoProyecto
go
create table AlumnoTesis
(
idAlumnoTesis int identity (1,1) not null,
idAlumno int not null,
idTesis int not null,
estatus int default 1,
);
go
insert into AlumnoTesis(idAlumno,idTesis)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoTesis
go
create table AutorLibro
(
idAutorLibro int identity (1,1) not null,
idAutor int not null,
idLibro int not null,
estatus int default 1,
);
go
insert into AutorLibro(idAutor,idLibro)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AutorLibro
go
create table CategoriaLibro
(
idCategoriaLibro int identity (1,1) not null,
idCategoria int not null,
idLibro int not null,
estatus int default 1,
);
insert into CategoriaLibro(idCategoria,idLibro)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from CategoriaLibro
go
create table CertificadoCurso
(
idCertificadoCurso int identity (1,1) not null,
idCertificado int not null,
idCurso int not null,
estatus int default 1,
);
insert into CertificadoCurso(idCertificado,idCurso)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from CertificadoCurso
go
create table ColegiaturaEmpleado
(
idColegiaturaEmpleado int identity (1,1) not null,
idColegiatura int not null,
idEmpleado int not null,
estatus int default 1,
);
insert into ColegiaturaEmpleado(idColegiatura,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ColegiaturaEmpleado
go
create table ConcursoEmpleado
(
idConcursoEmpleado int identity (1,1) not null,
idConcurso int not null,
idEmpleado int not null,
estatus int default 1,
);
insert into ConcursoEmpleado(idConcurso,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConcursoEmpleado
go
create table ConferenciaEmpleado
(
idConferenciaEmpleado int identity (1,1) not null,
idConferencia int not null,
idEmpleado int not null,
estatus int default 1,
);
insert into ConferenciaEmpleado(idConferencia,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConferenciaEmpleado
go
create table ConferenciaProfesor
(
idConferenciaProfesor int identity (1,1) not null,
idConferencia int not null,
idProfesor int not null,
estatus int default 1,
);
insert into ConferenciaProfesor(idConferencia,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConferenciaProfesor
go
create table ContratoEmpleado
(
idContratoEmpleado int identity (1,1) not null,
idContrato int not null,
idEmpleado int not null,
estatus int default 1,
);
go
insert into ContratoEmpleado(idContrato,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ContratoEmpleado
go
create table ContratoProfesor
(
idContratoProfesor int identity (1,1) not null,
idContrato int not null,
idProfesor int not null,
estatus int default 1,
);
go
insert into ContratoProfesor(idContrato,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ContratoProfesor
go
create table ConvocatoriaProfesor
(
idConvocatoriaProfesor int identity (1,1) not null,
idConvocatoria int not null,
idProfesor int not null,
estatus int default 1,
);
go
insert into ConvocatoriaProfesor(idConvocatoria,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConvocatoriaProfesor
go
create table ConvocatoriaEmpleado
(
idConvocatoriaEmpleado int identity (1,1) not null,
idConvocatoria int not null,
idEmpleado int not null,
estatus int default 1,
);
go
insert into ConvocatoriaEmpleado(idConvocatoria,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConvocatoriaEmpleado
go
create table EditorialLibro
(
idEditorialLibro int identity (1,1) not null,
idEditorial int not null,
idLibro int not null,
estatus int default 1,
);
go
insert into EditorialLibro(idEditorial,idLibro)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EditorialLibro
go
create table EmpleadoKardex
(
idEmpleadoKardex int identity (1,1) not null,
idEmpleado int not null,
idKardex int not null,
estatus int default 1,
);
go
insert into EmpleadoKardex(idEmpleado,idKardex)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EmpleadoKardex
go
create table EmpleadoServicioSocial
(
idEmpleadoServicioSocial int identity (1,1) not null,
idEmpleado int not null,
idServicioSocial int not null,
estatus int default 1,
);
go
insert into EmpleadoServicioSocial(idEmpleado,idServicioSocial)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EmpleadoServicioSocial
go
create table EmpleadoResidencia
(
idEmpleadoResidencia int identity (1,1) not null,
idEmpleado int not null,
idResidencia int not null,
estatus int default 1,
);
go
insert into EmpleadoResidencia(idEmpleado,idResidencia)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EmpleadoResidencia
go
create table EquipoTaller
(
idEquipoTaller int identity (1,1) not null,
idEquipo int not null,
idTaller int not null,
estatus int default 1,
);
go
insert into EquipoTaller(idEquipo,idTaller)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EquipoTaller
go
create table HorarioProfesor
(
idHorarioProfesor int identity (1,1) not null,
idHorario int not null,
idProfesor int not null,
estatus int default 1,
);
go
insert into HorarioProfesor(idHorario,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from HorarioProfesor
go
create table PracticaProfesor
(
idPracticaProfesor int identity (1,1) not null,
idPractica int not null,
idProfesor int not null,
estatus int default 1,
);
go
insert into PracticaProfesor(idPractica,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from PracticaProfesor
go
create table ProfesorProyecto
(
idProfesorProyecto int identity (1,1) not null,
idProyecto int not null,
idProfesor int not null,
estatus int default 1,
);
go
insert into ProfesorProyecto(idProyecto,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ProfesorProyecto
go
create table ProfesorVacacion
(
idProfesorVacacion int identity (1,1) not null,
idVacacion int not null,
idProfesor int not null,
estatus int default 1,
);
go
insert into ProfesorVacacion(idVacacion,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ProfesorVacacion
go
create table ProyectoSinodal
(
idProyectoSinodal int identity (1,1) not null,
idProyecto int not null,
idSinodal int not null,
estatus int default 1,
);
go
insert into ProyectoSinodal(idProyecto,idSinodal)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ProyectoSinodal
go
create table SinodalTesis
(
idSinodalTesis int identity (1,1) not null,
idTesis int not null,
idSinodal int not null,
estatus int default 1,
);
go
insert into SinodalTesis(idSinodal,idTesis)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from SinodalTesis

--llaves primarias
alter table Actividad Add constraint PK_Actividad Primary key (idActividad)
alter table Adeudo Add constraint PK_Adeudo Primary key (idAdeudo)
alter table Alumno Add constraint PK_Alumno Primary key (idAlumno)
alter table Asignatura Add constraint PK_Asignatura Primary key (idAsignatura)
alter table Area Add constraint PK_Area Primary key (idArea)
alter table Autor Add constraint PK_Autor Primary key (idAutor)
alter table Aula Add constraint PK_Aula Primary key (idAula)
alter table Beca Add constraint PK_Beca Primary key (idBeca)
alter table Calificacion Add constraint PK_Calificacion Primary key (idCalificacion)
alter table Carrera Add constraint PK_Carrera Primary key (idCarrera)
alter table Categoria Add constraint PK_Categoria Primary key (idCategoria)
alter table Certificado Add constraint PK_Certificado Primary key (idCertificado)
alter table Club Add constraint PK_Club Primary key (idClub)
alter table Colegiatura Add constraint PK_Colegiatura Primary key (idColegiatura)
alter table Concurso Add constraint PK_Concurso Primary key (idConcurso)
alter table Conferencia Add constraint PK_Conferencia Primary key (idConferencia)
alter table Contrato Add constraint PK_Contrato Primary key (idContrato)
alter table Convocatoria Add constraint PK_Convocatoria Primary key (idConvocatoria)
alter table CredencialEscolar Add constraint PK_CredencialEscolar Primary key (idCredencialEscolar)
alter table Credito Add constraint PK_Credito Primary key (idCredito)
alter table Curso Add constraint PK_Curso Primary key (idCurso)
alter table Edificio Add constraint PK_Edificio Primary key (idEdificio)
alter table Editorial Add constraint PK_Editorial Primary key (idEditorial)
alter table Empleado Add constraint PK_Empleado Primary key (idEmpleado)
alter table Equipo Add constraint PK_Equipo Primary key (idEquipo)
alter table Examen Add constraint PK_Examen Primary key (idExamen)
alter table Foro Add constraint PK_Foro Primary key (idForo)
alter table FeriaCiencia Add constraint PK_FeriaCiencia Primary key (idFeriaCiencia)
alter table Grupo Add constraint PK_Grupo Primary key (idGrupo)
alter table Horario Add constraint PK_Horario Primary key (idHorario)
alter table Libro Add constraint PK_Libro Primary key (idLibro)
alter table Kardex Add constraint PK_Kardex Primary key (idKardex)
alter table Periodo Add constraint PK_Periodo Primary key (idPeriodo)
alter table Practica Add constraint PK_Practica Primary key (idPractica)
alter table Prestamo Add constraint PK_Prestamo Primary key (idPrestamo)
alter table Producto Add constraint PK_Producto Primary key (idProducto)
alter table Profesor Add constraint PK_Profesor Primary key (idProfesor)
alter table Proyecto Add constraint PK_Proyecto Primary key (idProyecto)
alter table Recurso Add constraint PK_Recurso Primary key (idRecurso)
alter table Residencia Add constraint PK_Residencia Primary key (idResidencia)
alter table Seccion Add constraint PK_Seccion Primary key (idSeccion)
alter table ServicioSocial Add constraint PK_ServicioSocial Primary key (idServicioSocial)
alter table Sinodal Add constraint PK_Sinodal Primary key (idSinodal)
alter table Taller Add constraint PK_Taller Primary key (idTaller)
alter table Tesis Add constraint PK_Tesis Primary key (idTesis)
alter table Toefl Add constraint PK_Toefl Primary key (idToefl)
alter table TipoArea Add constraint PK_TipoArea Primary key (idTipoArea)
alter table TipoExamen Add constraint PK_TipoExamen Primary key (idTipoExamen)
alter table TransporteEscolar Add constraint PK_TransporteEscolar Primary key (idTransporteEscolar) 
alter table Vacacion Add constraint PK_Vacacion Primary key (idVacacion)
alter table AsignaturaProfesor Add constraint PK_AsignaturaProfesor Primary key (idAsignaturaProfesor)
alter table AsignaturaCarrera Add constraint PK_AsignaturaCarrera Primary key (idAsignaturaCarrera)
alter table AlumnoPrestamo Add constraint PK_AlumnoPrestamo Primary key (idAlumnoPrestamo)
alter table AlumnoCredito Add constraint PK_AlumnoCredito Primary key (idAlumnoCredito)
alter table AlumnoColegiatura Add constraint PK_AlumnoColegiatura Primary key (idAlumnoColegiatura)
alter table AlumnoKardex Add constraint PK_AlumnoKardex Primary key (idAlumnoKardex)
alter table AlumnoConcurso Add constraint PK_AlumnoConcurso Primary key (idAlumnoConcurso)
alter table AlumnoAsignatura Add constraint PK_AlumnoAsignatura Primary key (idAlumnoAsignatura)
alter table AlumnoExamen Add constraint PK_AlumnoExamen Primary key (idAlumnoExamen)
alter table AlumnoHorario Add constraint PK_AlumnoHorario Primary key (idAlumnoHorario)
alter table AlumnoVacacion Add constraint PK_AlumnoVacacion Primary key (idAlumnoVacacion)
alter table AlumnoProyecto Add constraint PK_AlumnoProyecto Primary key (idAlumnoProyecto)
alter table AlumnoTesis Add constraint PK_AlumnoTesis Primary key (idAlumnoTesis)
alter table AutorLibro Add constraint PK_AutorLibro Primary key (idAutorLibro)
alter table CategoriaLibro Add constraint PK_CategoriaLibro Primary key (idCategoriaLibro)
alter table CertificadoCurso Add constraint PK_CertificadoCurso Primary key (idCertificadoCurso)
alter table ColegiaturaEmpleado Add constraint PK_ColegiaturaEmpleado Primary key (idColegiaturaEmpleado)
alter table ConcursoEmpleado Add constraint PK_ConcursoEmpleado Primary key (idConcursoEmpleado)
alter table ConferenciaEmpleado Add constraint PK_ConferenciaEmpleado Primary key (idConferenciaEmpleado)
alter table ConferenciaProfesor Add constraint PK_ConferenciaProfesor Primary key (idConferenciaProfesor) 
alter table ContratoEmpleado Add constraint PK_ContratoEmpleado Primary key (idContratoEmpleado)
alter table ContratoProfesor Add constraint PK_ContratoProfesor Primary key (idContratoProfesor)
alter table ConvocatoriaProfesor Add constraint PK_ConvocatoriaProfesor Primary key (idConvocatoriaProfesor)
alter table ConvocatoriaEmpleado Add constraint PK_ConvocatoriaEmpleado Primary key (idConvocatoriaEmpleado)
alter table EditorialLibro Add constraint PK_EditorialLibro Primary key (idEditorialLibro)
alter table EmpleadoKardex Add constraint PK_EmpleadoKardex Primary key (idEmpleadoKardex)
alter table EmpleadoServicioSocial Add constraint PK_EmpleadoServicioSocial Primary key (idEmpleadoServicioSocial)
alter table EmpleadoResidencia Add constraint PK_EmpleadoResidencia Primary key (idEmpleadoResidencia)
alter table EquipoTaller Add constraint PK_EquipoTaller Primary key (idEquipoTaller)
alter table HorarioProfesor Add constraint PK_HorarioProfesor Primary key (idHorarioProfesor)
alter table PracticaProfesor Add constraint PK_PracticaProfesor Primary key (idPracticaProfesor)
alter table ProfesorProyecto Add constraint PK_ProfesorProyecto Primary key (idProfesorProyecto)
alter table ProfesorVacacion Add constraint PK_ProfesorVacacion Primary key (idProfesorVacacion)
alter table ProyectoSinodal Add constraint PK_ProyectoSinodal Primary key (idProyectoSinodal)
alter table SinodalTesis Add constraint PK_SinodalTesis Primary key (idSinodalTesis)
--Llaves foraneas
--Actividad
alter table Actividad Add constraint FK_ActividadClub foreign key (idClub) references club(idClub)
--Alumno
alter table Alumno Add constraint FK_AlumnoClub foreign key (idClub) references club(idClub)
alter table Alumno Add constraint FK_AlumnoAdeudo foreign key (idAdeudo) references adeudo(idAdeudo)
alter table Alumno Add constraint FK_AlumnoForo foreign key (idForo) references foro(idForo)
alter table Alumno Add constraint FK_AlumnoTransporteEscolar foreign key (idTransporteEscolar) references transporteEscolar(idTransporteEscolar)
alter table Alumno Add constraint FK_AlumnoCredencialEscolar foreign key (idCredencialEscolar) references credencialEscolar(idCredencialEscolar)
alter table Alumno Add constraint FK_AlumnoServicioSocial foreign key (idServicioSocial) references servicioSocial(idServicioSocial)
alter table Alumno Add constraint FK_AlumnoResidencia foreign key (idResidencia) references residencia(idResidencia)
alter table Alumno Add constraint FK_AlumnoCurso foreign key (idCurso) references curso(idCurso)
alter table Alumno Add constraint FK_AlumnoBeca foreign key (idBeca) references beca(idBeca)
alter table Alumno Add constraint FK_AlumnoFeriaCiencia foreign key (idFeriaCiencia) references feriaCiencia(idFeriaCiencia)
alter table Alumno Add constraint FK_AlumnoToefl foreign key (idToefl) references toefl(idToefl)
--Asignatura
alter table Asignatura Add constraint FK_AsignaturaCalificacion foreign key (idCalificacion) references calificacion(idCalificacion)
--Area
alter table Area Add constraint FK_AreaTipoArea foreign key (idTipoArea) references TipoArea(idTipoArea)
alter table Area Add constraint FK_AreaEdificio foreign key (idEdificio) references edificio(idEdificio)
--Aula
alter table Aula Add constraint FK_AulaEdificio foreign key (idEdificio) references edificio(idEdificio)
--Carrera
alter table Carrera Add constraint FK_CarreraPeriodo foreign key (idPeriodo) references periodo(idPeriodo)
--Empleado
alter table Empleado Add constraint FK_EmpleadoArea foreign key (idArea) references area(idArea)
--Examen
alter table Examen Add constraint FK_ExamenCalificacion foreign key (idCalificacion) references calificacion(idCalificacion)
alter table Examen Add constraint FK_ExamenTipoExamen foreign key (idTipoExamen) references tipoExamen(idTipoExamen)
--Grupo
alter table Grupo Add constraint FK_GrupoAula foreign key (idAula) references aula(idAula)
alter table Grupo Add constraint FK_GrupoSeccion foreign key (idSeccion) references seccion(idSeccion)
--Libro
alter table Libro Add constraint FK_LibroAula foreign key (idAula) references aula(idAula)
alter table Libro Add constraint FK_LibroPrestamo foreign key (idPrestamo) references prestamo(idPrestamo)
--Practica
alter table Practica Add constraint FK_PracticaCalificacion foreign key (idCalificacion) references calificacion(idCalificacion)
--Producto
alter table Producto Add constraint FK_ProductoArea foreign key (idArea) references area(idArea)
--Profesor
alter table Profesor Add constraint FK_ProfesorArea foreign key (idArea) references area(idArea)
--Recurso
alter table Recurso Add constraint FK_RecursoAdeudo foreign key (idAdeudo) references adeudo(idAdeudo)
--Sinodal
alter table Sinodal Add constraint FK_SinodalFeriaCiencia foreign key (idFeriaCiencia) references feriaCiencia(idFeriaCiencia)
--Taller
alter table Taller Add constraint FK_TallerEdificio foreign key (idEdificio) references edificio(idEdificio)
--AsignaturaProfesor
alter table AsignaturaProfesor Add constraint FK_AsignaturaProfesorAsignatura foreign key (idAsignatura) references asignatura(idAsignatura)
alter table AsignaturaProfesor Add constraint FK_AsignaturaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
--AsignaturaCarrera
alter table AsignaturaCarrera Add constraint FK_AsignaturaCarreraAsignatura foreign key (idAsignatura) references asignatura(idAsignatura)
alter table AsignaturaCarrera Add constraint FK_AsignaturaCarreraCarrera foreign key (idCarrera) references carrera(idCarrera)
--AlumnoPrestamo
alter table AlumnoPrestamo Add constraint FK_AlumnoPrestamoAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoPrestamo Add constraint FK_AlumnoPrestamoPrestamo  foreign key (idPrestamo) references prestamo(idPrestamo)
--AlumnoCredito
alter table AlumnoCredito Add constraint FK_AlumnoCreditoAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoCredito Add constraint FK_AlumnoCreditoCredito  foreign key (idCredito) references credito(idCredito)
--AlumnoColegiatura
alter table AlumnoColegiatura Add constraint FK_AlumnoColegiaturaAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoColegiatura Add constraint FK_AlumnoColegiaturaColegiatura  foreign key (idColegiatura) references colegiatura(idColegiatura)
--AlumnoKardex
alter table AlumnoKardex Add constraint FK_AlumnoKardexAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoKardex Add constraint FK_AlumnoKardexKardex  foreign key (idKardex) references kardex(idKardex)
--AlumnoConcurso
alter table AlumnoConcurso Add constraint FK_AlumnoConcursoAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoConcurso Add constraint FK_AlumnoConcursoConcurso  foreign key (idConcurso) references concurso(idConcurso)
--AlumnoAsignatura
alter table AlumnoAsignatura Add constraint FK_AlumnoAsignaturaAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoAsignatura Add constraint FK_AlumnoAsignaturaAsignatura foreign key (idAsignatura) references asignatura(idAsignatura)
--AlumnoExamen
alter table AlumnoExamen Add constraint FK_AlumnoExamenAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoExamen Add constraint FK_AlumnoExamenExamen foreign key (idExamen) references examen(idExamen)
--AlumnoHorario
alter table AlumnoHorario Add constraint FK_AlumnoHorarioAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoHorario Add constraint FK_AlumnoHorarioHorario foreign key (idHorario) references horario(idHorario)
--AlumnoVacacion
alter table AlumnoVacacion Add constraint FK_AlumnoVacacionAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoVacacion Add constraint FK_AlumnoVacacionVacacion foreign key (idVacacion) references vacacion(idVacacion)
--AlumnoProyecto
alter table AlumnoProyecto Add constraint FK_AlumnoProyectoAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoProyecto Add constraint FK_AlumnoProyectoProyecto foreign key (idProyecto) references proyecto(idProyecto)
--AlumnoTesis
alter table AlumnoTesis Add constraint FK_AlumnoTesisAlumno foreign key (idAlumno) references alumno(idAlumno)
alter table AlumnoTesis Add constraint FK_AlumnoTesisTesis foreign key (idTesis) references tesis(idTesis)
--AutorLibro
alter table AutorLibro Add constraint FK_AutorLibroAutor foreign key (idAutor) references autor(idAutor)
alter table AutorLibro Add constraint FK_AutorLibroLibro foreign key (idLibro) references libro(idLibro)
--AutorLibro
alter table CategoriaLibro Add constraint FK_CategoriaLibroCategoria foreign key (idCategoria) references categoria(idCategoria)
alter table CategoriaLibro Add constraint FK_CategoriaLibroLibro foreign key (idLibro) references libro(idLibro)
--CertificadoCurso
alter table CertificadoCurso Add constraint FK_CertificadoCursoCertificado foreign key (idCertificado) references certificado(idCertificado)
alter table CertificadoCurso Add constraint FK_CertificadoCursoCurso foreign key (idCurso) references curso(idCurso)
--ColegiaturaEmpleado
alter table ColegiaturaEmpleado Add constraint FK_ColegiaturaEmpleadoColegiatura foreign key (idColegiatura) references colegiatura(idColegiatura)
alter table ColegiaturaEmpleado Add constraint FK_ColegiaturaEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
--ConcursoEmpleado
alter table ConcursoEmpleado Add constraint FK_ConcursoEmpleadoConcurso foreign key (idConcurso) references concurso(idConcurso)
alter table ConcursoEmpleado Add constraint FK_ConcursoEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
--ConferenciaEmpleado
alter table ConferenciaEmpleado Add constraint FK_ConferenciaEmpleadoConferencia foreign key (idConferencia) references conferencia(idConferencia)
alter table ConferenciaEmpleado Add constraint FK_ConferenciaEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
--AsignaturaProfesor
alter table ConferenciaProfesor Add constraint FK_ConferenciaProfesorConferencia foreign key (idConferencia) references conferencia(idConferencia)
alter table ConferenciaProfesor Add constraint FK_ConferenciaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
--ContratoProfesor
alter table ContratoProfesor Add constraint FK_ContratoProfesorContrato foreign key (idContrato) references contrato(idContrato)
alter table ContratoProfesor Add constraint FK_ContratoProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
--ContratoEmpleado
alter table ContratoEmpleado Add constraint FK_ContratoEmpleadoContrato foreign key (idContrato) references contrato(idContrato)
alter table ContratoEmpleado Add constraint FK_ContratoEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
--ConvocatoriaProfesor
alter table ConvocatoriaProfesor Add constraint FK_ConvocatoriaProfesorConvocatoria foreign key (idConvocatoria) references convocatoria(idConvocatoria)
alter table ConvocatoriaProfesor Add constraint FK_ConvocatoriaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
--ConvocatoriaEmpleado
alter table ConvocatoriaEmpleado Add constraint FK_ConvocatoriaEmpleadoConvocatoria foreign key (idConvocatoria) references convocatoria(idConvocatoria)
alter table ConvocatoriaEmpleado Add constraint FK_ConvocatoriaEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
--EditorialLibro
alter table EditorialLibro Add constraint FK_EditorialLibroEditorial foreign key (idEditorial) references editorial(idEditorial)
alter table EditorialLibro Add constraint FK_EditorialLibroLibro foreign key (idLibro) references libro(idLibro)
--EmpleadoKardex
alter table EmpleadoKardex Add constraint FK_EmpleadoKardexEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
alter table EmpleadoKardex Add constraint FK_EmpleadoKardexKardex foreign key (idKardex) references kardex(idKardex)
--EmpleadoServicioSocial
alter table EmpleadoServicioSocial Add constraint FK_EmpleadoServicioSocialEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
alter table EmpleadoServicioSocial Add constraint FK_EmpleadoServicioSocialServicioSocial foreign key (idServicioSocial) references servicioSocial(idServicioSocial)
--EmpleadoResidencia
alter table EmpleadoResidencia Add constraint FK_EmpleadoResidenciaEmpleado foreign key (idEmpleado) references empleado(idEmpleado)
alter table EmpleadoResidencia Add constraint FK_EmpleadoResidenciaResidencia foreign key (idResidencia) references residencia(idResidencia)
--EquipoTaller
alter table EquipoTaller Add constraint FK_EquipoTallerEquipo foreign key (idEquipo) references equipo(idEquipo)
alter table EquipoTaller Add constraint FK_EquipoTallerTaller foreign key (idTaller) references Taller(idTaller)
--HorarioProfesor
alter table HorarioProfesor Add constraint FK_HorarioProfesorHorario foreign key (idHorario) references horario(idHorario)
alter table HorarioProfesor Add constraint FK_HorarioProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
--PracticaProfesor
alter table PracticaProfesor Add constraint FK_PracticaProfesorPractica foreign key (idPractica) references practica(idPractica)
alter table PracticaProfesor Add constraint FK_PracticaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor)
--ProfesorProyecto
alter table ProfesorProyecto Add constraint FK_ProfesorProyectoProfesor foreign key (idProfesor) references profesor(idProfesor)
alter table ProfesorProyecto Add constraint FK_ProfesorProyectoProyecto foreign key (idProyecto) references proyecto(idProyecto)
--ProfesorVacacion
alter table ProfesorVacacion Add constraint FK_ProfesorVacacionProfesor foreign key (idProfesor) references profesor(idProfesor)
alter table ProfesorVacacion Add constraint FK_ProfesorVacacionVacacion foreign key (idVacacion) references vacacion(idVacacion)
--ProyectoSinodal
alter table ProyectoSinodal Add constraint FK_ProyectoSinodalProyecto foreign key (idProyecto) references proyecto(idProyecto)
alter table ProyectoSinodal Add constraint FK_ProyectoSinodalSinodal foreign key (idSinodal) references sinodal(idSinodal)
--SinodalTesis
alter table SinodalTesis Add constraint FK_SinodalTesisSinodal foreign key (idSinodal) references sinodal(idSinodal)
alter table SinodalTesis Add constraint FK_SinodalTesisTesis foreign key (idTesis) references tesis(idTesis)
--Indices
create index IX_Actividad ON Actividad(idActividad)
create index IX_Adeudo ON Adeudo(idAdeudo)
create index IX_Alumno ON Alumno(idAlumno)
create index IX_Asignatura ON Asignatura(idAsignatura)
create index IX_Area ON Area(idArea)
create index IX_Autor ON Autor(idAutor)
create index IX_Aula ON Aula(idAula)
create index IX_Beca ON Beca(idBeca)
create index IX_Calificacion ON Calificacion(idCalificacion)
create index IX_Carrera ON Carrera(idCarrera)
create index IX_Categoria ON Categoria(idCategoria)
create index IX_Certificado ON Certificado(idCertificado)
create index IX_Club ON Club(idClub)
create index IX_Colegiatura ON Colegiatura(idColegiatura)
create index IX_Concurso ON Concurso(idConcurso)
create index IX_Conferencia ON Conferencia(idConferencia)
create index IX_Contrato ON Contrato(idContrato)
create index IX_Convocatoria ON Convocatoria(idConvocatoria)
create index IX_CredencialEscolar ON CredencialEscolar(idCredencialEscolar)
create index IX_Credito ON Credito(idCredito)
create index IX_Curso ON Curso(idCurso)
create index IX_Edificio ON Edificio(idEdificio)
create index IX_Editorial ON Editorial(idEditorial)
create index IX_Empleado ON Empleado(idEmpleado)
create index IX_Equipo ON Equipo(idEquipo)
create index IX_Examen ON Examen(idExamen)
create index IX_Foro ON Foro(idForo)
create index IX_FeriaCiencia ON FeriaCiencia(idFeriaCiencia)
create index IX_Grupo ON Grupo(idGrupo)
create index IX_Horario ON Horario(idHorario)
create index IX_Libro ON Libro(idLibro)
create index IX_Kardex ON Kardex(idKardex)
create index IX_Periodo ON Periodo(idPeriodo)
create index IX_Practica ON Practica(idPractica)
create index IX_Prestamo ON Prestamo(idPrestamo)
create index IX_Producto ON Producto(idProducto)
create index IX_Profesor ON Profesor(idProfesor)
create index IX_Proyecto ON Proyecto(idProyecto)
create index IX_Recurso ON Recurso(idRecurso)
create index IX_Residencia ON Residencia(idResidencia)
create index IX_Seccion ON Seccion(idSeccion)
create index IX_ServicioSocial ON ServicioSocial(idServicioSocial)
create index IX_Sinodal ON Sinodal(idSinodal)
create index IX_Taller ON Taller(idTaller)
create index IX_Tesis ON Tesis(idTesis)
create index IX_Toefl ON Toefl(idToefl)
create index IX_TipoArea ON TipoArea(idTipoArea)
create index IX_TipoExamen ON TipoExamen(idTipoExamen)
create index IX_TransporteEscolar ON TransporteEscolar(idTransporteEscolar) 
create index IX_Vacacion ON Vacacion(idVacacion)
create index IX_AsignaturaProfesor ON AsignaturaProfesor(idAsignaturaProfesor)
create index IX_AsignaturaCarrera ON AsignaturaCarrera(idAsignaturaCarrera)
create index IX_AlumnoPrestamo ON AlumnoPrestamo(idAlumnoPrestamo)
create index IX_AlumnoCredito ON AlumnoCredito(idAlumnoCredito)
create index IX_AlumnoColegiatura ON AlumnoColegiatura(idAlumnoColegiatura)
create index IX_AlumnoKardex ON AlumnoKardex(idAlumnoKardex)
create index IX_AlumnoConcurso ON AlumnoConcurso(idAlumnoConcurso)
create index IX_AlumnoAsignatura ON AlumnoAsignatura(idAlumnoAsignatura)
create index IX_AlumnoExamen ON AlumnoExamen(idAlumnoExamen)
create index IX_AlumnoHorario ON AlumnoHorario(idAlumnoHorario)
create index IX_AlumnoVacacion ON AlumnoVacacion(idAlumnoVacacion)
create index IX_AlumnoProyecto ON AlumnoProyecto(idAlumnoProyecto)
create index IX_AlumnoTesis ON AlumnoTesis(idAlumnoTesis)
create index IX_AutorLibro ON AutorLibro(idAutorLibro)
create index IX_CategoriaLibro ON CategoriaLibro(idCategoriaLibro)
create index IX_CertificadoCurso ON CertificadoCurso(idCertificadoCurso)
create index IX_ColegiaturaEmpleado ON ColegiaturaEmpleado(idColegiaturaEmpleado)
create index IX_ConcursoEmpleado ON ConcursoEmpleado(idConcursoEmpleado)
create index IX_ConferenciaEmpleado ON ConferenciaEmpleado(idConferenciaEmpleado)
create index IX_ConferenciaProfesor ON ConferenciaProfesor(idConferenciaProfesor) 
create index IX_ContratoEmpleado ON ContratoEmpleado(idContratoEmpleado)
create index IX_ContratoProfesor ON ContratoProfesor(idContratoProfesor)
create index IX_ConvocatoriaProfesor ON ConvocatoriaProfesor(idConvocatoriaProfesor)
create index IX_ConvocatoriaEmpleado ON ConvocatoriaEmpleado(idConvocatoriaEmpleado)
create index IX_EditorialLibro ON EditorialLibro(idEditorialLibro)
create index IX_EmpleadoKardex ON EmpleadoKardex(idEmpleadoKardex)
create index IX_EmpleadoServicioSocial ON EmpleadoServicioSocial(idEmpleadoServicioSocial)
create index IX_EmpleadoResidencia ON EmpleadoResidencia(idEmpleadoResidencia)
create index IX_EquipoTaller ON EquipoTaller(idEquipoTaller)
create index IX_HorarioProfesor ON HorarioProfesor(idHorarioProfesor)
create index IX_PracticaProfesor ON PracticaProfesor(idPracticaProfesor)
create index IX_ProfesorProyecto ON ProfesorProyecto(idProfesorProyecto)
create index IX_ProfesorVacacion ON ProfesorVacacion(idProfesorVacacion)
create index IX_ProyectoSinodal ON ProyectoSinodal(idProyectoSinodal)
create index IX_SinodalTesis ON SinodalTesis(idSinodalTesis)