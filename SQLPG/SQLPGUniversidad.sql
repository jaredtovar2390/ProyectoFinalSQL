create table Adeudo
(
idAdeudo serial primary key not null,
nombre varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
semestre char (2) not null,
fecha timestamp not null,
especialidad varchar (50) not null,
idUsuarioCrea int not null,
idUsuarioModifica int not null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Adeudo(nombre,semestre,fecha,especialidad, idUsuarioCrea, idUsuarioModifica)
values('Ingles','2','20130123','Mecanica',1,1),('Física','4','20220522','Física Cuántica',1,1),('Anatomía ','5', '20170807', 'Enfermería',1,1),('Matemáticas ','1', '20190712', 'informatica',1,1),('Ecología','3', '20200216', 'Energias renovables',1,1),
('fisiología','8', '20211011', 'Enfermería',1,1),('Economía','4', '20200915', 'Administracion de empresas',1,1),('Arte','4', '20180602', 'Arte',1,1),
('Historia','2', '20210518', 'Historia',1,1),('Psicología','7', '20220421', 'Enfermería',1,1);
select * from Adeudo;
create table Autor
(
idAutor serial primary key not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
nacionalidad varchar(20) not null,
trayectoria varchar(150) not null,
esatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Autor(nombre,apellidoPaterno,apellidoMaterno,nacionalidad,trayectoria,idUsuarioCrea,idUsuarioModifica)
values('Ricardo Eliécer','Neftalí Reyes','Basoalto ','Chile','Poema 12, Amor Soneto XXII, Poema 20, Poema 15 ',1,1),
('Gabriel','García','Márquez','Colombia','Cien años de soledad, El amor en los tiempos del cólera, El coronel no tiene quien le escriba, Crónica de una muerte anunciada',1,1),
('Isabel Angélica','Allende','Llona','Chile','La casa de los espíritus ',1,1),
('Mario','Vargas','Llosa','España','La ciudad y los perros, La tía Julia y el escribidor La fiesta del Chivo',1,1),
('Jorge Francisco Isidoro','Luis','Borges','Argentina','El Aleph,La biblioteca de Babel,Las ruinas circulares,Funes el memorioso',1,1),
('Julio','Florencio','Cortázar','Argentina','Casa Tomada, La noche boca arriba, La señorita Cora, El perseguidor, Carta a una señorita en París',1,1),
('Lucila','Godoy','Alcayaga','Chile','Besos, Caricia, Piececitos, Desolación, Amor, amor',1,1),
('Mario','Benedetti','Farrugia','Urugay','Hagamos un trato, No te salves, Viceversa, Por siempre, Te quiero',1,1),
('Carlos','Fuentes','Macías','Mexicana','La región más transparente, La muerte de Artemio Cruz, Terra Nostra, Aura, Los días enmascarados, Cantar de ciegos',1,1),
('Octavio Irineo','Paz','Lozano','Mexicana','Libertad bajo palabra Silencio Las palabras La poesía Decir, hacer',1,1);
select * from Autor;
create table Beca
(
idBeca serial primary key not null,
nombre varchar(50) not null,
monto varchar(20) not null,
razon varchar(100) not null,
fecha timestamp not null,
codigo char (10) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Beca(nombre,monto,razon,fecha,codigo,idUsuarioCrea,idUsuarioModifica)
values('Becas Benito Juárez','2400','cubrir los gastos básicos en instituciones públicas únicamente','20220116','N2zZrfcquB',1,1),
('Becas Benito Juárez','5258','cubrir los gastos básicos en instituciones públicas únicamente','20220116','Mg5pqWGf97',1,1),
('Becas Jóvenes escribiendo el futuro','840','apoyar económicamente a los sectores vulnerables de la población','20210321','7fnLB4tnvM',1,1),
('Becas Jóvenes construyendo el futuro','2450','enfocado a personas de entre 18 y 29 años que se encuentran sin trabajo ni estudios activos','20201229','mNNbVXrTF7',1,1),
('Becas Jóvenes construyendo el futuro','5258','enfocado a personas de entre 18 y 29 años que se encuentran sin trabajo ni estudios activos','20201212','yKCXWMyarb',1,1),
('Beca para el Bienestar Benito Juárez de Educación','840','apoyar a familia en condiciones de pobreza que tengan niños, menores de 18 años, en educación básica','20210516','xgc4CsHEQ7',1,1),
('Beca Aprovechamiento','1200','enfocado para personas con una calificacion mejor al promedio','20200605','gU4KVFeQ7g',1,1),
('Beca de transporte','1000','enfocado para personas que vivan lejos de la universidad y viajan en transporte publico','20191001','MRQThRHbtm',1,1),
('Becas deportiva','2000','enfocado para los estudiantes que son mejor de promedio en deportes','20201219','CDmnyZ6AHf',1,1),
('Becas para emprendedores','2400','enfocado para jóvenes que quieren impulsar su vida profesional y comenzar un proyecto empresarial','20210714','JbRDhXTPur',1,1);
select * from Beca;
create table Calificacion
(
idCalificacion serial primary key not null,
nota char (3) not null,
actividad varchar(30) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
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
('97','cuadro sinoptico',1,1);
select * from Calificacion;
create table Categoria
(
idCategoria serial primary key not null,
nombre varchar(20) not null,
descripcion varchar(150) not null,
notacion char(1) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Categoria(nombre,descripcion,notacion,idUsuarioCrea,idUsuarioModifica)
values('Terror','La experiencia de miedo intenso es conocida como terror','A',1,1),
('Ciencia ficcion','es un género cuyos contenidos se encuentran basados en supuestos logros científicos o técnicos que podrían lograrse en el futuro.','B',1,1),
('Documental','es la expresión de un aspecto de la realidad, mostrada en forma audiovisual','C',1,1),
('Historia','es la narración de los sucesos del pasado; generalmente los de la humanidad, aunque, también puede no estar centrada en el humano','D',1,1),
('Educacion','es el proceso de facilitar el aprendizaje o la adquisición de conocimientos, así como habilidades, valores, creencias y hábitos','E',1,1),
('Programacion','enfoca en organizar un conjunto de datos ordenados a seguir para ser ciertas cosas','F',1,1),
('Matematica','operan con números, símbolos, figuras geométricas','G',1,1),
('Manuales','guía de instrucciones que sirve para el uso de un dispositivo, la corrección de problemas','H',1,1),
('Geografia','La ubicación o localización geográfica es cualquier forma de localización en un contexto geográfico','I',1,1),
('Psicologia','investiga sobre los procesos mentales de personas y animales','J',1,1),
('Romance','poema narrativo, formado por una sola secuencia poética no dividida en estrofas','K',1,1),
('Lirico','comunicar mediante el ritmo e imágenes los sentimientos o emociones íntimas del autor','L',1,1);
select * from Categoria;
create table Certificado
(
idCertificado serial primary key not null,
fecha timestamp not null,
titulo varchar(40) not null,
descripcion varchar(100) not null,
responsable varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Certificado(fecha,titulo,descripcion,responsable,idUsuarioCrea,idUsuarioModifica)
values('20220102','Certificado laboral','ha trabajado en nuestra empresa como AUDITORA DE MEDIOS','Florencia Martínez',1,1),
('20211107','Certificado matematicas','ha trabajado en problemas matematicos y ah sido credito','Bernarda Gutiérrez',1,1),
('20211216','Certificado de estudios secundarios','en virtud de que demostro contar con los conocimientos correspondientes','Ezequiel flores perez',1,1),
('20200602','Certificado de honorabilidad','certificado correspondiente a la persona que es honorable con el curso','Elizabeth Palma',1,1),
('20200115','Certificado de realización de prácticas','certificado correspondiente a la persona que realiza practicas','Juan Perez',1,1),
('20220212','Certificado de idiomas','ha trabajado en Cursos de idiomas y ah sido acreditado','Berta Gutierrez',1,1),
('20221209','Certificado de mecanografia','certificado correspondiente a la persona que realiza pruebas de mecanografia','Maria del Carmen Salazar',1,1),
('20210414','Certificado de Programacion','Curso acreditado de curso de HTML y CSS','Gabriel Chavez',1,1),
('20190519','Certificado de Excel','Curso acreditado de que la persona sabe manejar microsoft excel','Jaime Estela',1,1),
('20220611','Certificado de Base de datos','Curso acreditado de que la persona sabe manejar Base de datos','jorge michael',1,1),
('20210907','Certificado Word','Curso acreditado de que la persona sabe manejar microsoft word','Esther Gabriela',1,1);
select * from Certificado;
create table Club
(
idClub serial primary key not null,
telefono char(10) not null,
nombre varchar(20) not null,
descripcion varchar(100) not null,
responsable varchar(50) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Club(telefono,nombre,descripcion,responsable,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('8661859508','Futbol','Club de deportes dedicado a el futbol','Bernarda Gutiérrez','coahuila','25870','libertad','monclova','jose lopez portillo',1,1),
('8661235647','Arte','Club de deportes dedicado a el Arte','Florencia Martínez','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1),
('8662378941','Karate','Club de deportes dedicado a el Karate','Elizabeth Palma','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1),
('8445612311','Tenis','Club de deportes dedicado a el Tenis','Esther Gabriela','coahuila','25716','Ampliación Roma','monclova','Acapulco',1,1),
('8445231326','BasquetBall','Club de deportes dedicado a el BasquetBall','jorge michael','coahuila','25716','Picasso','monclova','Benjamín Suárez P.',1,1),
('8668795462','Atletismo','Club de deportes dedicado a el Atletismo','Gabriel Chavez','coahuila','25716','Tecnológico','monclova','Bruno Neira',1,1),
('8664654231','Ajedrez','Club de deportes dedicado a el Ajedrez','Berta Gutierrez','coahuila','25716','Magisterio','monclova','Hipócrates',1,1),
('8667987654','Baile','Club de deportes dedicado a el Baile','Maria del Carmen Salazar','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1),
('8664564231','Gimnacio','Club de deportes dedicado a el Gimnacio','Juan Perez','coahuila','25716','Bugambilias','monclova','Palenque',1,1),
('8667894651','Teatro','Club de deportes dedicado a el Teatro','Berta Gutierrez','coahuila','25716','Chamizal','monclova','Peatonal B',1,1);
select * from Club;
create table Colegiatura
(
idColegiatura serial primary key not null,
cantidad char(10) not null,
periodo timestamp not null,
banco varchar(50) not null,
semestre char(2) not null,
descripcion varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from Colegiatura;
create table Concurso
(
idConcurso serial primary key not null,
fecha timestamp not null,
responsable varchar(50) not null,
nombre varchar(50) not null,
premio varchar(30) not null,
descripcion varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Concurso(fecha,responsable,nombre,premio,descripcion,idUsuarioCrea,idUsuarioModifica)
values('20220117', 'Juan Perez','Concurso de programacion','1600','Competencia Internacional de Programación Competitiva ICPC',1,1),
('20210907', 'Ezequiel flores perez','Concurso de Excel','1300','Competencia de excel',1,1),
('20210916', 'Florencia Martínez','Concurso de Word','2200','Competencia de word',1,1),
('20211216', 'Juan Perez','Concurso de Idiomas','4200','Competencia de idiomas',1,1),
('20220102', 'Juan Perez','Concurso de Carteles','2100','Competencia de Carteles de un documental',1,1),
('20190519', 'Juan Perez','Concurso de Idiomas','1400','Competencia de idiomas',1,1),
('20210414', 'Florencia Martínez','Concurso de Base de datos','2000','Competencia de Base de datos',1,1),
('20220611', 'Florencia Martínez','Concurso de Base de datos','2000','Competencia de Base de datos',1,1),
('20220118', 'Florencia Martínez','Concurso de Carteles','2100','Competencia de Carteles de un desarollo sustentable',1,1),
('20220102', 'Florencia Martínez','Concurso de programacion','1600','Competencia Internacional de Programación Competitiva ICPC',1,1);
select * from Colegiatura;
create table Conferencia
(
idConferencia serial primary key not null,
fecha timestamp not null,
responsable varchar(50) not null,
titulo varchar(40) not null,
participante char(4) not null,
razon varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Conferencia(fecha,responsable,titulo,participante,razon,idUsuarioCrea,idUsuarioModifica)
values('20210907', 'Juan Perez','Conferencia de Base de datos','102','Explicacion y descripcion de la materia de base de datos',1,1),
('20220117', 'Ezequiel flores perez','Conferencia de Ingles','134','Explicacion y descripcion de la materia de ingles',1,1),
('20210916', 'Florencia Martínez','Conferencia de arte','312','Explicacion y descripcion de la materia de arte',1,1),
('20190519', 'Florencia Martínez','Conferencia de matematicas','41','Explicacion y descripcion de la materia de matematicas',1,1),
('20220102', 'Ezequiel flores perez','Conferencia de sexualidad','32','Explicacion y descripcion de la sexualidad',1,1),
('20210414', 'Juan Perez','Conferencia de Empleo','45','Explicacion y descripcion de empleado y trabajo',1,1),
('20190519', 'Florencia Martínez','Conferencia de drogadiccion','123','Explicacion y descripcion de la drogadiccion ',1,1),
('20220611', 'Juan Perez','Conferencia de Estudios','41','Explicacion y descripcion de la conferencia de estudios',1,1),
('20220611', 'Florencia Martínez','Conferencia de drogadiccion','111','Explicacion y descripcion de la drogadiccion',1,1),
('20220118', 'Ezequiel flores perez','Conferencia de programacion','43','Explicacion y descripcion de la materia de Programacion',1,1);
select * from Conferencia;
create table Contrato
(
idContrato serial primary key not null,
fechaInicio timestamp not null,
fechaVencimiento timestamp not null,
nombre varchar(30) not null,
titulo varchar(30) not null,
razon varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Contrato(fechainicio,fechaVencimiento,nombre,titulo,razon,idUsuarioCrea,idUsuarioModifica)
values('20210907','20220907','Juan Perez','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20220117','20220917', 'Ezequiel flores perez','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20210916','20220201','Alan Jancito','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20190519','20201112', 'Bartolomé julian','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20220102','20220907', 'Adán Fidencio','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20210414','20210712','Mario Alan','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20190519','20200916', 'Jose Spulveda','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20220611','20221215', 'Florencia Lisa','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20220611','20220202', 'Ana Elizabeth','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1),
('20220118','20220313', 'Hilda Fuentes','Contrato de universidad','Enseñanza a estudiantes con su propia especialidad',1,1);
select * from Contrato;
create table Convocatoria
(
idConvocatoria serial primary key not null,
fecha timestamp not null,
responsable varchar(50) not null,
nombre varchar(60) not null,
descripcion varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into Convocatoria(fecha,responsable,nombre,descripcion,idUsuarioCrea,idUsuarioModifica)
values('20220117', 'Juan Perez','Convocatoria de Profesores para el cursos de programacion','Competencia Internacional de Programación Competitiva ICPC',1,1),
('20210907', 'Ezequiel flores perez','Convocatoria de Profesores para el cursos de Excel','Competencia de excel',1,1),
('20210916', 'Florencia Martínez','Convocatoria de Profesores para el cursos de Word','Competencia de word',1,1),
('20211216', 'Juan Perez','Convocatoria de Profesores para el cursos de Idiomas','Competencia de idiomas',1,1),
('20220102', 'Juan Perez','Convocatoria de Profesores para el cursos de Carteles','Competencia de Carteles de un documental',1,1),
('20190519', 'Juan Perez','Convocatoria de Profesores para el cursos de Idiomas','Competencia de idiomas',1,1),
('20210414', 'Florencia Martínez','Convocatoria de Profesores para el cursos de Base de datos','Competencia de Base de datos',1,1),
('20220611', 'Florencia Martínez','Convocatoria de Profesores para el cursos de Base de datos','Competencia de Base de datos',1,1),
('20220118', 'Florencia Martínez','Convocatoria de Profesores para el cursos de Carteles','Competencia de Carteles de un desarollo sustentable',1,1),
('20220102', 'Florencia Martínez','Convocatoria de Profesores para el cursos de programacion','Competencia Internacional de Programación Competitiva ICPC',1,1);
select * from Convocatoria;
create table CredencialEscolar 
(
idCredencialEscolar serial primary key not null,
vigenciaInicio timestamp not null,
vencimiento timestamp not null,
responsable varchar(50) not null,
universidad varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into CredencialEscolar(vigenciaInicio,vencimiento,responsable,universidad,idUsuarioCrea,idUsuarioModifica)
values('20210907','20220907','Juan Perez','TEC Saltillo',1,1),
('20220117','20220917', 'Ezequiel flores perez','TEC Monclova',1,1),
('20210916','20220201','Alan Jancito','TEC Monclova',1,1),
('20190519','20201112', 'Bartolomé julian','TEC Monterrey',1,1),
('20220102','20220907', 'Adán Fidencio','TEC Monclova',1,1),
('20210414','20210712','Mario Alan','TEC Saltillo',1,1),
('20190519','20200916', 'Jose Spulveda','TEC Monclova',1,1),
('20220611','20221215', 'Florencia Lisa','TEC Saltillo',1,1),
('20220611','20220202', 'Ana Elizabeth','TEC Monterrey',1,1),
('20220118','20220313', 'Hilda Fuentes','TEC Monterrey',1,1);
select * from CredencialEscolar;
create table Credito 
(
idCredito serial primary key not null,
cantidad char(2) not null,
responsable varchar(50) not null,
motivo varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Credito(cantidad,responsable,motivo,idUsuarioCrea,idUsuarioModifica)
values('1','Juan Perez','Acreditacion de curso',1,1),
('2', 'Ezequiel flores perez','Acreditacion de concurso',1,1),
('1','Alan Jancito','Acreditacion de concurso',1,1),
('2', 'Bartolomé julian','Acreditacion de concurso',1,1),
('1', 'Adán Fidencio','Acreditacion de curso',1,1),
('1','Mario Alan','Acreditacion de curso',1,1),
('2','Jose Spulveda','Acreditacion de concurso',1,1),
('1','Florencia Lisa','Acreditacion de curso',1,1),
('1','Ana Elizabeth','Acreditacion de concurso',1,1),
('2','Hilda Fuentes','Acreditacion de concurso',1,1);
select * from Credito;
create table Curso 
(
idCurso serial primary key not null,
fecha timestamp not null,
nombre varchar(30) not null,
cupo char(4) not null,
precio char(5) not null,
descripcion varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
cantidadParticipantes char(4) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from Curso;
create table Edificio 
(
idEdificio serial primary key not null,
numeroPiso char(2) not null,
nombre varchar(50) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from Edificio;
create table Editorial 
(
idEditorial serial primary key not null,
nombre varchar(50) not null,
telefono char(10) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Editorial(nombre,telefono,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('Acantilado','8661245671','coahuila','25870','libertad','monclova','jose lopez portillo',1,1),
('Aguilar','8664545541','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1),
('Akal','8665209657','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1),
('Alba','8667893849','coahuila','25716','Ampliación Roma','monclova','Acapulco',1,1),
('Alfaguara','8669639632','coahuila','25716','Picasso','monclova','Benjamín Suárez P.',1,1),
('Alianza','8667895213','coahuila','25716','Tecnológico','monclova','Bruno Neira',1,1),
('Almadía','8667894521','coahuila','25716','Magisterio','monclova','Hipócrates',1,1),
('Anagrama','866456213','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1),
('Debolsillo','8664512648','coahuila','25716','Bugambilias','monclova','Palenque',1,1),
('Herder','8661234575','coahuila','25716','Chamizal','monclova','Peatonal B',1,1);
select * from Editorial;
create table Equipo
(
idEquipo serial primary key not null,
nombre varchar(30) not null,
cantidad char(3) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from Equipo;
create table Foro
(
idForo serial primary key not null,
nombre varchar(30) not null,
link varchar(100) not null,
tema varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from Foro;
create table FeriaCiencia
(
idFeriaCiencia serial primary key not null,
participante varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
especialidad varchar(50) not null,
universidad varchar(50) not null,
fecha timestamp not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into FeriaCiencia(participante,apellidoPaterno,apellidoMaterno,especialidad,universidad,fecha,idUsuarioCrea,idUsuarioModifica)
values('Ricardo Eliécer','Neftalí Reyes','Basoalto ','Informatico','UNAM','20220117',1,1),
('Gabriel','García','Márquez','Informatico','Colmex','20210907',1,1),
('Isabel Angélica','Allende','Llona','Programacion','IPN','20220102',1,1),
('Mario','Vargas','Llosa','Mecanica','UAch','20220611',1,1),
('Jorge Francisco Isidoro','Luis','Borges','Energias Renovables','UAM','20220118',1,1),
('Julio','Florencio','Cortázar','Mecanica','UAEH','20210414',1,1),
('Lucila','Godoy','Alcayaga','Programacion','Tec','20220102',1,1),
('Mario','Benedetti','Farrugia','Energias Renovables','UAEMEx','20190519',1,1),
('Carlos','Fuentes','Macías','Electronica','UDG','20210916',1,1),
('Octavio Irineo','Paz','Lozano','Electronica','BUAP','20211216',1,1);
select * from FeriaCiencia;
create table Horario
(
idHorario serial primary key not null,
materia varchar(50) not null,
horaInicio char (5) not null,
horaTermina char (5) not null,
docente varchar (50) not null,
correo varchar (50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
--Registro
insert into Horario(materia,horaInicio,horaTermina,docente,correo,idUsuarioCrea,idUsuarioModifica)
values('calculo','1:10','2:00','Mario Benedetti','MarioBenedetti@gmail.com',1,1),
('fisica','12:20','2:00','Gabriel Garcia','GabrielGarcia@gmail.com',1,1),
('fundamentos de programacion','7:00','7:50','Lucila Fuentes','LucilaFuentes@gmail.com',1,1),
('calculo integral','8:40','10:20','Carlos Benedetti','CarlosBenedetti@gmail.com',1,1),
('fundamentos de base de datos','9:30','11:30','Octavio Irineo','OctavioIrineo@gmail.com',1,1),
('ingles','12:20','2:00','Mario Vargas','MarioVargas@gmail.com',1,1),
('sistemas operativos','7:50','8:40','Isabel Angélica','IsabelAngelica@gmail.com',1,1),
('Legislacion','7:50','8:40','Ricardo Eliécer','RicardoEliecer@gmail.com',1,1),
('Programacion orientado a objetos','7:50','8:40','Julio Florencio','JulioFlorencio@gmail.com',1,1),
('informatica','7:50','8:40','Julio Morales','JulioMorales@gmail.com',1,1);
select * from Horario;
create table Kardex
(
idKardex serial primary key not null,
asignatura varchar(50) not null,
oportunidad char (1) not null,
calificacion char (3) not null,
periodo timestamp not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
('informatica','1','81','20221105',1,1);
select * from Kardex;
create table Periodo
(
idPeriodo serial primary key not null,
fechaInicio timestamp not null,
fechaTermina timestamp not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
('20220118','20220313',1,1);
select * from Periodo;
create table Prestamo
(
idPrestamo serial primary key not null,
fechaInicio timestamp not null,
fechaFinal timestamp not null,
fechaEntrega timestamp not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
('20220118','20220313','20220411',1,1);
select * from Prestamo;
create table Proyecto
(
idProyecto serial primary key not null,
nombre varchar(40) not null,
fechaInicio timestamp not null,
fechaFinal timestamp not null,
descripcion varchar (100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
('informatica','20220118','20220313','Proyecto de Informatica',1,1);
select * from Proyecto;
create table Residencia
(
idResidencia serial primary key not null,
nombre varchar(40) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
descripcion varchar (100) not null,
cantidadHoras char (3) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into Residencia(nombre,estado,numero,colonia,ciudad,calle,descripcion,cantidadHoras,idUsuarioCrea,idUsuarioModifica)
values('Cemex','coahuila','25870','libertad','monclova','jose lopez portillo','empresa dedicada a contruccion','120',1,1),
('Femsa','coahuila','25716','PEMEX','monclova','Rafael De La Fuente','industria de alimentos','234',1,1),
('Alfa','coahuila','25716','Teocali','monclova','Jalisco Sur','empresa dedicada a contruccion','210',1,1),
('Arca','coahuila','25716','Ampliación Roma','monclova','Acapulco','industria de alimentos','210',1,1),
('Afirme','coahuila','25716','Picasso','monclova','Benjamín Suárez P.','empresa dedicada a contruccion','200',1,1),
('Softtec','coahuila','25716','Tecnológico','monclova','Bruno Neira','empresa dedicada a la informatica','190',1,1),
('Almadía','coahuila','25716','Magisterio','monclova','Hipócrates','empresa dedicada a contruccion','210',1,1),
('Anagrama','coahuila','25716','Mayo','monclova','Indios Tobosos','empresa dedicada a la informatica','200',1,1),
('Debolsillo','coahuila','25716','Bugambilias','monclova','Palenque','empresa dedicada a la informatica','189',1,1),
('Herder','coahuila','25716','Chamizal','monclova','Peatonal B','empresa dedicada a contruccion','192',1,1);
select * from Residencia;
create table Seccion
(
idSeccion serial primary key not null,
letra char(1) not null,
numero char(2) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from Seccion;
create table ServicioSocial
(
idServicioSocial serial primary key not null,
nombre varchar (40) not null,
fecha timestamp not null,
cantidadHoras char(3) not null,
descripcion varchar (100) not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into ServicioSocial(nombre,fecha,cantidadHoras,descripcion,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica)
values('Cemex','20210907','120','empresa dedicada a contruccion','coahuila','25870','libertad','monclova','jose lopez portillo',1,1),
('Femsa','20220117','234','industria de alimentos','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1),
('Alfa','20220917','210','empresa dedicada a contruccion','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1),
('Arca','20210916','210','industria de alimentos','coahuila','25716','Ampliación Roma','monclova','Acapulco',1,1),
('Afirme','20220201','200','empresa dedicada a contruccion','coahuila','25716','Picasso','monclova','Benjamín Suárez P.',1,1),
('Softtec','20190519','190','empresa dedicada a la informatica','coahuila','25716','Tecnológico','monclova','Bruno Neira',1,1),
('Almadía','20220102','210','empresa dedicada a contruccion','coahuila','25716','Magisterio','monclova','Hipócrates',1,1),
('Anagrama','20220907','200','empresa dedicada a la informatica','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1),
('Debolsillo','20220611','189','empresa dedicada a la informatica','coahuila','25716','Bugambilias','monclova','Palenque',1,1),
('Herder','20190519','192','empresa dedicada a contruccion','coahuila','25716','Chamizal','monclova','Peatonal B',1,1);
select * from ServicioSocial;
create table Tesis
(
idTesis serial primary key not null,
titulo varchar (60) not null,
descripcion varchar (150) not null,
fechaInicio timestamp not null,
fechaFinal timestamp not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into Tesis(titulo,descripcion,fechaInicio,fechaFinal,idUsuarioCrea,idUsuarioModifica)
values('Desarrollo sostenible','forma de organizar la producción y la relación de las personas con su medio ambiente','20210907','20221012',1,1),
('Programación de aplicaciones para dispositivos electrónicos','¿Cómo hacer un software seguro? ¿Qué hay que tener en cuenta para desarrollar una aplicación que sea fácil de entender?','20210907','20221012',1,1),
('La regulación de las criptomonedas','casos en los que ya se ha regulado el comercio de las criptomonedas o una posible regulación de criptomonedas a nivel internacional','20210907','20221012',1,1),
('La psicología en la publicidad','Analizar las campañas publicitarias desde una perspectiva psicológica','20210907','20221012',1,1),
('Tratamientos para la anorexia','¿Cuáles son los mejores tratamientos? ¿Es algo que se debe abordar solo desde la medicina o también desde la psicología?','20210907','20221012',1,1),
('El rol del periodista en la era digital','el rol del periodista en los periódicos en contraposición con el rol de periodista en las redes sociales','20210907','20221012',1,1),
('Enseñanza de idiomas a través del método comunicativo','investigar con mayor profundidad las ventajas y desventajas de un modelo que combine ambas maneras de enseñanza','20210907','20221012',1,1),
('Diseñar teniendo en cuenta el medioambiente','diseño en relación con la producción sostenible, políticas públicas que fomenten la producción con menos costo energético','20210907','20221012',1,1),
('Ventajas y desventajas de la comida orgánica','el impacto de la producción de los alimentos orgánicos en el medioambiente, el impacto en la salud del consumo','20210907','20221012',1,1),
('Cambios en las leyes impositivas','motivos de los cambios de estas leyes, capacitaciones en relación con estas leyes y propuestas para leyes impositivas más transparentes','20210907','20221012',1,1);
select * from Tesis;
create table Toefl
(
idToefl serial primary key not null,
nombre varchar (50) not null,
descripcion varchar (100) not null,
fecha timestamp not null,
cantidadPreguntas char (3) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into Toefl(nombre,descripcion,fecha,cantidadPreguntas,idUsuarioCrea,idUsuarioModifica)
values('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20210907','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20221012','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzadol','20201213','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20190321','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20220505','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20211114','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20200120','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20210921','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20220216','140',1,1),
('Test of English as a Foreign Language','es un examen escrito que mide el dominio del idioma inglés en niveles intermedio y avanzado','20190718','140',1,1);
select * from Toefl;
create table TipoArea
(
idTipoArea serial primary key not null,
nombre varchar (50) not null,
descripcion varchar (150) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into TipoArea(nombre,descripcion,idUsuarioCrea,idUsuarioModifica)
values('Control Escolar','Registrar y organizar la información de los participantes y usuarios de los programas de capacitación',1,1),
('Dinámica Escolar y Archivos.','Diseño de las tareas y evaluación actúan transformando las diferencias en desigualdades.',1,1),
('Infraestructura y Recursos Materiales','Infraestructura y Recursos Materiales de toda la universidad',1,1),
('Recursos Contables, Administrativos y Financieros','Recursos Contables, Administrativos y Financieros de todo la universidad',1,1),
('Recursos Humanos y Capacitación','Toda Capacitación y recursos humanos contables',1,1),
('Control Escolar','Registrar y organizar la información de los participantes y usuarios de los programas de capacitación y profesionalización',1,1),
('Atención y Orientación al alumnado y la comunidad','Atención y Orientación al alumnado',1,1),
('Apoyo al Aprendizaje','ayuda al alumnado a adquirirlo de manera más eficaz',1,1),
('Estrategias de apoyo','Numerosas estrategias para ayudar al alumnado',1,1),
('Apoyo de equipo','utilizacion de herramientas como impresoras',1,1);
select * from TipoArea;
create table TipoExamen
(
idTipoExamen serial primary key not null,
nombre varchar (50) not null,
descripcion varchar (100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
fecha timestamp not null,
cantidadPreguntas char (3) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from TipoExamen;
create table TransporteEscolar
(
idTransporteEscolar serial primary key not null,
nombre varchar (50) not null,
cantidad char(2) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
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
select * from TransporteEscolar;
create table Vacacion
(
idVacacion serial primary key not null,
fechaInicio timestamp not null,
fechaRegreso timestamp not null,
descripcion varchar (100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null);
insert into Vacacion(fechaInicio,fechaRegreso,descripcion,idUsuarioCrea,idUsuarioModifica)
values('20210907','20211012','Vacaciones de Verano',1,1),
('20220917','20220117','Vacaciones de invierno',1,1),
('20210916','20220201','Vacaciones de otoño',1,1),
('20190519','20201112','Vacacion de primavera',1,1),
('20220102','20220907','Vacacion de primavera',1,1),
('20210414','20210712','Vacacion de primavera',1,1),
('20190519','20190529','Vacaciones de semana santa',1,1),
('20220611','20221215','Vacaciones de Otoño',1,1),
('20220611','20220202','Vacaciones de invierno',1,1),
('20220118','20220313','Vacaciones de Verano',1,1);
select * from Vacacion;
--Empieza los foraneos
create table Actividad
(
idActividad serial primary key not null,
descripcion varchar (100) not null,
fecha timestamp not null,
estado varchar(50) not null,
numero char(5) not null,
colonia varchar(50) not null,
ciudad varchar(50) not null,
calle varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idClub int not null);
insert into Actividad(descripcion,fecha,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica,idClub)
Values('Actividad de Futbol','20211012','coahuila','25870','libertad','monclova','jose lopez portillo',1,1,1),
('Actividad de Arte','20220117','coahuila','25716','PEMEX','monclova','Rafael De La Fuente',1,1,2),
('Actividad de Karate','20220201','coahuila','25716','Teocali','monclova','Jalisco Sur',1,1,3),
('Actividad de Tenis','20201112','coahuila','25716','Ampliación Roma','monclova','Acapulco',1,1,4),
('Actividad de BasquetBall','20220907','coahuila','25716','Picasso','monclova','Benjamín Suárez P.',1,1,5),
('Actividad de Atletismo','20210712','coahuila','25716','Tecnológico','monclova','Bruno Neira',1,1,6),
('Actividad de Ajedrez','20190529','coahuila','25716','Magisterio','monclova','Hipócrates',1,1,7),
('Actividad de Baile','20220313','coahuila','25716','Mayo','monclova','Indios Tobosos',1,1,8),
('Actividad de Gimnasia','20220202','coahuila','25716','Bugambilias','monclova','Palenque',1,1,9),
('Actividad de Teatro','20221215','coahuila','25716','Chamizal','monclova','Peatonal B',1,1,10);
select * from Actividad;
create table Alumno
(
idAlumno serial primary key not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
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
fechaCrea timestamp null,
fechaModifica timestamp null,
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
idGrupo int not null);
insert into Alumno(nombre,apellidoPaterno,apellidoMaterno,matricula,curp,telefono,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica,idClub,idAdeudo,idForo,idTransporteEscolar,idCredencialEscolar,idServicioSocial,idResidencia,idCurso,idBeca,idFeriaCiencia,idToefl,idGrupo)
Values('Alejandro','Mendez','Mendez ','I20050032','FOGE530617MMCLRL09','8662152432','Coahuila','25700','Monclova Centro','Monclova','Oriente',1,1,1,1,1,1,1,1,1,1,1,1,1,1),
('Carlos','Cetino','Ruiz','I20050096','FOGI400206HGRLRG06','8661234512','Coahuila','25710','Los Cedros','Monclova','Nicolás Bravo',1,1,2,2,2,2,2,2,2,2,2,2,2,2),
('Héctor Leónidas','Revolorio','Quevedo','I20050049','FIEN851010MGRGSC08','8661561478','Coahuila','25714','Picasso','Monclova','Carrillo Puerto',1,1,3,3,3,3,3,3,3,3,3,3,3,3),
('Hugo Leonel','López','Villacorta','I20050052','HABS810221MMSRTY08','8667845121','Coahuila','25725','Arboledas','Monclova','Benjamín',1,1,4,4,4,4,4,4,4,4,4,4,4,4),
('Alejandro','Rivera','Pérez','I20050091','AAMR780430MGRBRN00','8663512484','Coahuila','25730','Aguanaval','Monclova','Frambuesa',1,1,5,5,5,5,5,5,5,5,5,5,5,5),
('Ana Francisca','Armira','Carreto','I20050041','AARJ990531HMSCMN09','8663214569','Coahuila','25734','Francisco Villa','Monclova','Kennedy',1,1,6,6,6,6,6,6,6,6,6,6,6,6),
('Claudia Patricia','Reynoso','Tecun','I20050002','CASL650625MVZMNC01','8669756421','Coahuila','25740','San Isidro','Monclova','Hacienda',1,1,7,7,7,7,7,7,7,7,7,7,7,7),
('Edgar Rolando','Equite','Fuentes','I20050009','EUDE910609HMSSVD01','8661523145','Coahuila','25740','San Miguel','Monclova','Jose sepulveda',1,1,8,8,8,8,8,8,8,8,8,8,8,8),
('Gerardo Enrique','Reyes','Aguilar','I20050011','GAAL720714HGRRBN01','8661234675','Coahuila','25747','21 de Marzo','Monclova','Jiménez',1,1,9,9,9,9,9,9,9,9,9,9,9,9),
('Gilberto','Santos','López','I20050012','GALG980917HBCRRD08','8664521311','Coahuila','25750','Independencia','Monclova','De Las Moras',1,1,10,10,10,10,10,10,10,10,10,10,10,10);
select * from Alumno;
create table Asignatura
(
idAsignatura serial primary key not null,
nombre varchar(50) not null,
semestre char(2) not null,
descripcion varchar(200) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idCalificacion int not null);
insert into Asignatura(nombre,semestre,descripcion,idUsuarioCrea,idUsuarioModifica,idCalificacion)
values('Quimica','1','ciencia que tiene por finalidad no sólo descubrir, sino también, y sobre todo, crear, ya que es el arte de hacer compleja la materia',1,1,1),
('Biologia','1','estudia los seres vivos de manera integral, desde el nivel molecular hasta como integrante de los ecosistemas',1,1,2),
('Fundamentos de Programacion','2','asignatura básica que permite crear programas que exhiban un comportamiento deseado',1,1,3),
('Sistemas operativos','4','funciones que desempeñan los sistemas operativos, así como las razones de diseño que determinan su estructura',1,1,4),
('Ingles','7','proporciona las estructuras básicas para el aprendizaje del idioma inglés.',1,1,5),
('Calculo integral','2','contribuye a desarrollar un pensamiento lógico-matemático al perfil del ingeniero y aporta las herramientas básicas para desarrollar el estudio',1,1,6),
('Calculo Diferencial','3','contribuye a desarrollar un pensamiento lógico-matemático al perfil del ingeniero y aporta las herramientas básicas para introducirse al estudio del cálculo y su aplicación',1,1,7),
('Ciencia y tecnologia','1','se ocupa de conocer y comprender los objetivos y fenómenos ya existentes, la tecnología trata de crear productos y servicios que aun no existen, pero que son necesarios',1,1,8),
('Base de datos','5','asignatura obligatoria que consta de 6 créditos y que introducirá al estudiante en las áreas fundamentales de esta materia',1,1,9),
('Administracion de archivos','3','gestión que se orienta a la implementación de toda la cartera de servicios que se ofrece, de manera tanto interna como externa, desde el área de Archivos de cualquier organización',1,1,10);
select * from Asignatura;
create table Area
(
idArea serial primary key not null,
descripcion varchar(100) not null,
nombre varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idTipoArea int not null,
idEdificio int not null);
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
select * from Area;
create table Aula
(
idAula serial primary key not null,
nombre varchar(30) not null,
numero varchar(10) not null,
tamaño varchar(10) not null,
cantidadSillas char(3) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idEdificio int not null);
insert into Aula(nombre,numero,tamaño,cantidadSillas,idUsuarioCrea,idUsuarioModifica,idEdificio)
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
select * from Aula;
create table Carrera
(
idCarrera serial primary key not null,
nombre varchar(30) not null,
cantidadSemestre char(2) not null,
descripcion varchar(200) not null,
cantidadAsignatura char(2) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idPeriodo int not null);
insert into Carrera(nombre,cantidadSemestre,descripcion,cantidadAsignatura,idUsuarioCrea,idUsuarioModifica,idPeriodo)
values('Ing.Informatico,','9',' transforma y administra la información a través del diseño, desarrollo y aplicación de la tecnología.','40',1,1,1),
('Ing.Mecanica,','8',' Combina los principios de la física de la ingeniería y las matemáticas con la ciencia de los materiales, a fin de diseñar, analizar, fabricar y mantener sistemas mecánicos','20',1,1,2),
('Ing.GestionEmpresarial,','10','es una carrera dedicada a la gestión, creación y uso de metodologías y técnicas creativas para el desarrollo empresarial de las organizaciones e incluso instituciones.','30',1,1,3),
('Ing.EnergiasRenovables,','8',' ocupa del diseño, instalación y mantenimiento de los sistemas que funcionan y aprovechan la energía solar, eólica, hidráulica, bioenergía y maremotriz','40',1,1,4),
('Ing.Electronica,','9','encarga de resolver problemas de la ingeniería tales como el control de procesos industriales y de sistemas electrónicos de potencia','40',1,1,5),
('Artes y humanidades,','8','área de estudio que agrupa a las profesiones que se dedican a resguardar, comprender y sistematizar el acervo cultural de un país','40',1,1,6),
('Administración y negocios,','10','utilizar principios de eficiencia y racionalidad en los recursos tanto financieros, como humanos y materiales en las organizaciones e instituciones públicas y privadas','40',1,1,7),
('Ing.industrial,','9','integra proyectos para diseñar, operar y administrar los sistemas de producción, de manufactura y de servicio en el sector automotriz, alimenticio, de automatización, educativo y metalúrgico.','40',1,1,8),
('Ing.Mecatronica,','9','es la que une la ingeniería mecánica, ingeniería electrónica, ingeniería de control e ingeniería informática, para diseñar y desarrollar productos que involucren sistemas de control','40',1,1,9),
('Ing.Quimica,','8','diseñan, optimizan, controlan y administran los procesos para transformar de manera física y química las materias primas','40',1,1,10);
select * from Carrera;
create table Empleado
(
idEmpleado serial primary key not null,
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
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idArea int not null);
insert into Empleado(nombre,apellidoPaterno,apellidoMaterno,telefono,estado,numero,colonia,ciudad,calle,rfc,idUsuarioCrea,idUsuarioModifica,idArea)
Values('Jaime Francisco','Aguayo','González','8662157432','Coahuila','25700','Monclova Centro','Monclova','Oriente','JAAG221220IL7',1,1,1),
('Andrea','Heredia','Chávez','8661234112','Coahuila','25710','Los Cedros','Monclova','Nicolás Bravo','HECA2212078E5',1,1,2),
('Ruth Silvana','Lagunes','Cortés','8661961478','Coahuila','25714','Picasso','Monclova','Carrillo Puerto','LACR221207KD7',1,1,3),
('Luis Felipe','Delgado','Barrón','8667745121','Coahuila','25725','Arboledas','Monclova','Benjamín','DEBL2212078E2',1,1,4),
('Espejo Ramos','Hansel','Andres','8663545484','Coahuila','25730','Aguanaval','Monclova','Frambuesa','EEHA221207QT10',1,1,5),
('Aniyensy Sarai','Flores','Aguilar','8663214569','Coahuila','25734','Francisco Villa','Monclova','Kennedy','AIFA2212206Q2',1,1,6),
('José Ignacio','Gómez','Vargas','8669756421','Coahuila','25740','San Isidro','Monclova','Hacienda','IAGV2212312I4',1,1,7),
('González Trejo','Cipriano','Ariel','8661523145','Coahuila','25740','San Miguel','Monclova','Fuentes','GOCA221221I83',1,1,8),
('Hernández Palacios','Reyes','Aguilar','8661234675','Coahuila','25747','21 de Marzo','Monclova','Jiménez','Hernandez Palacios',1,1,9),
('Itzel','Garcia','Nuñez','8664521311','Coahuila','25750','Independencia','Monclova','De Las Moras','NUGI221221GK6',1,1,10);
select * from Empleado;
create table Examen
(
idExamen serial primary key not null,
numeroPregunta char(3) not null,
fecha timestamp not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
semestre char(2) not null,
especialidad varchar(30) not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idTipoExamen int not null,
idCalificacion int not null);
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
select * from Examen;
create table Grupo
(
idGrupo serial primary key not null,
nombre varchar(50) not null, 
cantidadAlumno char(3) not null,
especialidad varchar(30) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idAula int not null,
idSeccion int not null);
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
select * from Grupo;
create table Libro
(
idLibro serial primary key not null,
titulo varchar(50) not null,
idioma char(10) not null,
edicion char(10) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
fecha timestamp not null,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idAula int not null,
idPrestamo int not null);
insert into Libro(titulo,idioma,edicion,fecha,idUsuarioCrea,idUsuarioModifica,idAula,idPrestamo)
values('Los Miserables','Español','1','20210907',1,1,1,1),
('El Alquimista','Español','1','20190718',1,1,2,2),
('El Capitalismo','Español','2','20220216',1,1,3,3),
('La Divina Comedia','Español','1','20200120',1,1,4,4),
('Cien años de Soledad','Español','2','20211114',1,1,5,5),
('El retrato de Dorian Grey','Español','2','20201213',1,1,6,6),
('El Principito','Español','1','20221012',1,1,7,7),
('Un mundo feliz','Español','1','20210504',1,1,8,8),
('A sangre fría','Español','1','20111112',1,1,9,9),
('Nada ','Español','1','20190911',1,1,10,10);
select * from Libro;
create table Practica
(
idPractica serial primary key not null,
evaluacion varchar(100) not null,
descripcion varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idCalificacion int not null);
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
select * from Practica;
create table Producto
(
idProducto serial primary key not null,
nombre varchar(40) not null,
cantidad char(4) not null,
precio char(3) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idArea int not null);
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
select * from Producto;
create table Profesor
(
idProfesor serial primary key not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
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
fechaCrea timestamp null,
fechaModifica timestamp null,
idArea int not null);
insert into Profesor(nombre,apellidoPaterno,apellidoMaterno,maestria,telefono,estado,numero,colonia,ciudad,calle,rfc,idUsuarioCrea,idUsuarioModifica,idArea)
Values('Jaime Francisco','Aguayo','González','Educación','8662157432','Coahuila','25700','Monclova Centro','Monclova','Oriente','JAAG221220IL7',1,1,1),
('Andrea','Heredia','Chávez','Psicopedagogía','8661234112','Coahuila','25710','Los Cedros','Monclova','Nicolás Bravo','HECA2212078E5',1,1,2),
('Ruth Silvana','Lagunes','Cortés','Ingeniería de Mantenimiento','8661961478','Coahuila','25714','Picasso','Monclova','Carrillo Puerto','LACR221207KD7',1,1,3),
('Luis Felipe','Delgado','Barrón','Ingenieria de informatica','8667745121','Coahuila','25725','Arboledas','Monclova','Benjamín','DEBL2212078E2',1,1,4),
('Espejo Ramos','Hansel','Andres','Servidores web','8663545484','Coahuila','25730','Aguanaval','Monclova','Frambuesa','EEHA221207QT10',1,1,5),
('Aniyensy Sarai','Flores','Aguilar','Base de datos','8663214569','Coahuila','25734','Francisco Villa','Monclova','Kennedy','AIFA2212206Q2',1,1,6),
('José Ignacio','Gómez','Vargas','Ingeneria de mantenimiento','8669756421','Coahuila','25740','San Isidro','Monclova','Hacienda','IAGV2212312I4',1,1,7),
('González Trejo','Cipriano','Ariel','Ingenieria en informatica','8661523145','Coahuila','25740','San Miguel','Monclova','Fuentes','GOCA221221I83',1,1,8),
('Hernández Palacios','Reyes','Aguilar','Cisco','8661234675','Coahuila','25747','21 de Marzo','Monclova','Jiménez','Hernandez Palacios',1,1,9),
('Itzel','Garcia','Nuñez','Calculo','8664521311','Coahuila','25750','Independencia','Monclova','De Las Moras','NUGI221221GK6',1,1,10);
select * from Profesor;
create table Recurso
(
idRecurso serial primary key not null,
fechaInicio timestamp not null,
fechaFinal timestamp not null,
descripcion varchar(100) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idAdeudo int not null);
insert into Recurso(fechaInicio,fechaFinal,descripcion,idUsuarioCrea,idUsuarioModifica,idAdeudo)
Values('20210907','20211012','Clases en vacaciones de Verano',1,1,1),
('20220917','20220117','Clases en vacaciones de invierno',1,1,2),
('20210916','20220201','Clases en vacaciones de Otoño',1,1,3),
('20190519','20201112','Clases en vacaciones de primavera',1,1,4),
('20220102','20220907','Clases en vacaciones de primavera',1,1,5),
('20210414','20210712','Clases en vacaciones de primavera',1,1,6),
('20190519','20190529','Clases en vacaciones de Verano',1,1,7),
('20220611','20221215','Clases en vacaciones de otoño',1,1,8),
('20220611','20220202','Clases en vacaciones de invierno',1,1,9),
('20220118','20220313','Clases en vacaciones de verano',1,1,10);
select * from Recurso;
create table Sinodal
(
idSinodal serial primary key not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
telefono char(10) not null,
correo varchar(50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idFeriaCiencia int not null);
insert into Sinodal(nombre,apellidoPaterno,apellidoMaterno,telefono,correo,idUsuarioCrea,idUsuarioModifica,idFeriaCiencia)
values('Ricardo Eliécer','Neftalí Reyes','Basoalto ','8662157432','MarioBenedetti@gmail.com',1,1,1),
('Gabriel','García','Márquez','8661961478','GabrielGarcia@gmail.com',1,1,2),
('Isabel Angélica','Allende','Llona','8661961478','LucilaFuentes@gmail.com',1,1,3),
('Mario','Vargas','Llosa','8667745121','CarlosBenedetti@gmail.com',1,1,4),
('Jorge Francisco Isidoro','Luis','Borges','8664521311','OctavioIrineo@gmail.com',1,1,5),
('Julio','Florencio','Cortázar','8669756421','MarioVargas@gmail.com',1,1,6),
('Lucila','Godoy','Alcayaga','8661853215','JulioFlorencio@gmail.com',1,1,7),
('Mario','Benedetti','Farrugia','8664512212','MarioBenedetti@gmail.com',1,1,8),
('Carlos','Fuentes','Macías','8665421364','CarlosFuetes@gmail.com',1,1,9),
('Octavio Irineo','Paz','Lozano','8661452134','OctavioIrineo@gmail.com',1,1,10);
select * from Sinodal;
create table Taller
(
idTaller serial primary key not null,
nombre varchar (50) not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE,
idUsuarioCrea int not null,
idUsuarioModifica int null,
fechaCrea timestamp null,
fechaModifica timestamp null,
idEdificio int not null);
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
select * from Taller;
--Tablas N-M
create table AsignaturaProfesor
(
idAsignaturaProfesor serial primary key not null,
idAsignatura int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AsignaturaProfesor(idAsignatura,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AsignaturaProfesor;
create table AsignaturaCarrera
(
idAsignaturaCarrera serial primary key not null,
idAsignatura int not null,
idCarrera int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AsignaturaCarrera(idAsignatura,idCarrera)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AsignaturaCarrera;
create table AlumnoPrestamo
(
idAlumnoPrestamo serial primary key not null,
idAlumno int not null,
idPrestamo int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoPrestamo(idAlumno,idPrestamo)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoPrestamo;
create table AlumnoCredito
(
idAlumnoCredito serial primary key not null,
idAlumno int not null,
idCredito int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoCredito(idAlumno,idCredito)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoCredito;
create table AlumnoColegiatura
(
idAlumnoColegiatura serial primary key not null,
idAlumno int not null,
idColegiatura int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoColegiatura(idAlumno,idColegiatura)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoColegiatura;
create table AlumnoKardex
(
idAlumnoKardex serial primary key not null,
idAlumno int not null,
idKardex int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoKardex(idAlumno,idKardex)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoKardex;
create table AlumnoConcurso
(
idAlumnoConcurso serial primary key not null,
idAlumno int not null,
idConcurso int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoConcurso(idAlumno,idConcurso)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoConcurso;
create table AlumnoAsignatura
(
idAlumnoAsignatura serial primary key not null,
idAlumno int not null,
idAsignatura int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoAsignatura(idAlumno,idAsignatura)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoAsignatura;
create table AlumnoExamen
(
idAlumnoExamen serial primary key not null,
idAlumno int not null,
idExamen int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoExamen(idAlumno,idExamen)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoExamen;
create table AlumnoHorario
(
idAlumnoHorario serial primary key not null,
idAlumno int not null,
idHorario int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoHorario(idAlumno,idHorario)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoHorario;
create table AlumnoVacacion
(
idAlumnoVacacion serial primary key not null,
idAlumno int not null,
idVacacion int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoVacacion(idAlumno,idVacacion)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoVacacion;
create table AlumnoProyecto
(
idAlumnoProyecto serial primary key not null,
idAlumno int not null,
idProyecto int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoProyecto(idAlumno,idProyecto)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoProyecto;
create table AlumnoTesis
(
idAlumnoTesis serial primary key not null,
idAlumno int not null,
idTesis int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AlumnoTesis(idAlumno,idTesis)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AlumnoTesis;
create table AutorLibro
(
idAutorLibro serial primary key not null,
idAutor int not null,
idLibro int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into AutorLibro(idAutor,idLibro)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from AutorLibro;
create table CategoriaLibro
(
idCategoriaLibro serial primary key not null,
idCategoria int not null,
idLibro int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into CategoriaLibro(idCategoria,idLibro)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from CategoriaLibro;
create table CertificadoCurso
(
idCertificadoCurso serial primary key not null,
idCertificado int not null,
idCurso int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into CertificadoCurso(idCertificado,idCurso)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from CertificadoCurso;
create table ColegiaturaEmpleado
(
idColegiaturaEmpleado serial primary key not null,
idColegiatura int not null,
idEmpleado int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ColegiaturaEmpleado(idColegiatura,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ColegiaturaEmpleado;
create table ConcursoEmpleado
(
idConcursoEmpleado serial primary key not null,
idConcurso int not null,
idEmpleado int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ConcursoEmpleado(idConcurso,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConcursoEmpleado;
create table ConferenciaEmpleado
(
idConferenciaEmpleado serial primary key not null,
idConferencia int not null,
idEmpleado int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ConferenciaEmpleado(idConferencia,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConferenciaEmpleado;
create table ConferenciaProfesor
(
idConferenciaProfesor serial primary key not null,
idConferencia int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ConferenciaProfesor(idConferencia,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConferenciaProfesor;
create table ContratoEmpleado
(
idContratoEmpleado serial primary key not null,
idContrato int not null,
idEmpleado int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ContratoEmpleado(idContrato,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ContratoEmpleado;
create table ContratoProfesor
(
idContratoProfesor serial primary key not null,
idContrato int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ContratoProfesor(idContrato,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ContratoProfesor;
create table ConvocatoriaProfesor
(
idConvocatoriaProfesor serial primary key not null,
idConvocatoria int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ConvocatoriaProfesor(idConvocatoria,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConvocatoriaProfesor;
create table ConvocatoriaEmpleado
(
idConvocatoriaEmpleado serial primary key not null,
idConvocatoria int not null,
idEmpleado int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ConvocatoriaEmpleado(idConvocatoria,idEmpleado)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ConvocatoriaEmpleado;
create table EditorialLibro
(
idEditorialLibro serial primary key not null,
idEditorial int not null,
idLibro int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into EditorialLibro(idEditorial,idLibro)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EditorialLibro;
create table EmpleadoKardex
(
idEmpleadoKardex serial primary key not null,
idEmpleado int not null,
idKardex int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into EmpleadoKardex(idEmpleado,idKardex)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EmpleadoKardex;
create table EmpleadoServicioSocial
(
idEmpleadoServicioSocial serial primary key not null,
idEmpleado int not null,
idServicioSocial int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into EmpleadoServicioSocial(idEmpleado,idServicioSocial)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EmpleadoServicioSocial;
create table EmpleadoResidencia
(
idEmpleadoResidencia serial primary key not null,
idEmpleado int not null,
idResidencia int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into EmpleadoResidencia(idEmpleado,idResidencia)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EmpleadoResidencia;
create table EquipoTaller
(
idEquipoTaller serial primary key not null,
idEquipo int not null,
idTaller int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into EquipoTaller(idEquipo,idTaller)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from EquipoTaller;
create table HorarioProfesor
(
idHorarioProfesor serial primary key not null,
idHorario int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into HorarioProfesor(idHorario,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from HorarioProfesor;
create table PracticaProfesor
(
idPracticaProfesor serial primary key not null,
idPractica int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into PracticaProfesor(idPractica,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from PracticaProfesor;
create table ProfesorProyecto
(
idProfesorProyecto serial primary key not null,
idProyecto int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ProfesorProyecto(idProyecto,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ProfesorProyecto;
create table ProfesorVacacion
(
idProfesorVacacion serial primary key not null,
idVacacion int not null,
idProfesor int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ProfesorVacacion(idVacacion,idProfesor)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ProfesorVacacion;
create table ProyectoSinodal
(
idProyectoSinodal serial primary key not null,
idProyecto int not null,
idSinodal int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into ProyectoSinodal(idProyecto,idSinodal)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from ProyectoSinodal;
create table SinodalTesis
(
idSinodalTesis serial primary key not null,
idTesis int not null,
idSinodal int not null,
estatus BOOLEAN NOT NULL DEFAULT TRUE);
insert into SinodalTesis(idSinodal,idTesis)
values(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
select * from SinodalTesis;
--Llaves foraneas
--Actividad
alter table Actividad Add constraint FK_ActividadClub foreign key (idClub) references club(idClub);
--Alumno
alter table Alumno Add constraint FK_AlumnoClub foreign key (idClub) references club(idClub);
alter table Alumno Add constraint FK_AlumnoAdeudo foreign key (idAdeudo) references adeudo(idAdeudo);
alter table Alumno Add constraint FK_AlumnoForo foreign key (idForo) references foro(idForo);
alter table Alumno Add constraint FK_AlumnoTransporteEscolar foreign key (idTransporteEscolar) references transporteEscolar(idTransporteEscolar);
alter table Alumno Add constraint FK_AlumnoCredencialEscolar foreign key (idCredencialEscolar) references credencialEscolar(idCredencialEscolar);
alter table Alumno Add constraint FK_AlumnoServicioSocial foreign key (idServicioSocial) references servicioSocial(idServicioSocial);
alter table Alumno Add constraint FK_AlumnoResidencia foreign key (idResidencia) references residencia(idResidencia);
alter table Alumno Add constraint FK_AlumnoCurso foreign key (idCurso) references curso(idCurso);
alter table Alumno Add constraint FK_AlumnoBeca foreign key (idBeca) references beca(idBeca);
alter table Alumno Add constraint FK_AlumnoFeriaCiencia foreign key (idFeriaCiencia) references feriaCiencia(idFeriaCiencia);
alter table Alumno Add constraint FK_AlumnoToefl foreign key (idToefl) references toefl(idToefl);
--Asignatura
alter table Asignatura Add constraint FK_AsignaturaCalificacion foreign key (idCalificacion) references calificacion(idCalificacion);
--Area
alter table Area Add constraint FK_AreaTipoArea foreign key (idTipoArea) references TipoArea(idTipoArea);
alter table Area Add constraint FK_AreaEdificio foreign key (idEdificio) references edificio(idEdificio);
--Aula
alter table Aula Add constraint FK_AulaEdificio foreign key (idEdificio) references edificio(idEdificio);
--Carrera
alter table Carrera Add constraint FK_CarreraPeriodo foreign key (idPeriodo) references periodo(idPeriodo);
--Empleado
alter table Empleado Add constraint FK_EmpleadoArea foreign key (idArea) references area(idArea);
--Examen
alter table Examen Add constraint FK_ExamenCalificacion foreign key (idCalificacion) references calificacion(idCalificacion);
alter table Examen Add constraint FK_ExamenTipoExamen foreign key (idTipoExamen) references tipoExamen(idTipoExamen);
--Grupo
alter table Grupo Add constraint FK_GrupoAula foreign key (idAula) references aula(idAula);
alter table Grupo Add constraint FK_GrupoSeccion foreign key (idSeccion) references seccion(idSeccion);
--Libro
alter table Libro Add constraint FK_LibroAula foreign key (idAula) references aula(idAula);
alter table Libro Add constraint FK_LibroPrestamo foreign key (idPrestamo) references prestamo(idPrestamo);
--Practica
alter table Practica Add constraint FK_PracticaCalificacion foreign key (idCalificacion) references calificacion(idCalificacion);
--Producto
alter table Producto Add constraint FK_ProductoArea foreign key (idArea) references area(idArea);
--Profesor
alter table Profesor Add constraint FK_ProfesorArea foreign key (idArea) references area(idArea);
--Recurso
alter table Recurso Add constraint FK_RecursoAdeudo foreign key (idAdeudo) references adeudo(idAdeudo);
--Sinodal
alter table Sinodal Add constraint FK_SinodalFeriaCiencia foreign key (idFeriaCiencia) references feriaCiencia(idFeriaCiencia);
--Taller
alter table Taller Add constraint FK_TallerEdificio foreign key (idEdificio) references edificio(idEdificio);
--AsignaturaProfesor
alter table AsignaturaProfesor Add constraint FK_AsignaturaProfesorAsignatura foreign key (idAsignatura) references asignatura(idAsignatura);
alter table AsignaturaProfesor Add constraint FK_AsignaturaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor);
--AsignaturaCarrera
alter table AsignaturaCarrera Add constraint FK_AsignaturaCarreraAsignatura foreign key (idAsignatura) references asignatura(idAsignatura);
alter table AsignaturaCarrera Add constraint FK_AsignaturaCarreraCarrera foreign key (idCarrera) references carrera(idCarrera);
--AlumnoPrestamo
alter table AlumnoPrestamo Add constraint FK_AlumnoPrestamoAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoPrestamo Add constraint FK_AlumnoPrestamoPrestamo  foreign key (idPrestamo) references prestamo(idPrestamo);
--AlumnoCredito
alter table AlumnoCredito Add constraint FK_AlumnoCreditoAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoCredito Add constraint FK_AlumnoCreditoCredito  foreign key (idCredito) references credito(idCredito);
--AlumnoColegiatura
alter table AlumnoColegiatura Add constraint FK_AlumnoColegiaturaAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoColegiatura Add constraint FK_AlumnoColegiaturaColegiatura  foreign key (idColegiatura) references colegiatura(idColegiatura);
--AlumnoKardex
alter table AlumnoKardex Add constraint FK_AlumnoKardexAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoKardex Add constraint FK_AlumnoKardexKardex  foreign key (idKardex) references kardex(idKardex);
--AlumnoConcurso
alter table AlumnoConcurso Add constraint FK_AlumnoConcursoAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoConcurso Add constraint FK_AlumnoConcursoConcurso  foreign key (idConcurso) references concurso(idConcurso);
--AlumnoAsignatura
alter table AlumnoAsignatura Add constraint FK_AlumnoAsignaturaAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoAsignatura Add constraint FK_AlumnoAsignaturaAsignatura foreign key (idAsignatura) references asignatura(idAsignatura);
--AlumnoExamen
alter table AlumnoExamen Add constraint FK_AlumnoExamenAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoExamen Add constraint FK_AlumnoExamenExamen foreign key (idExamen) references examen(idExamen);
--AlumnoHorario
alter table AlumnoHorario Add constraint FK_AlumnoHorarioAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoHorario Add constraint FK_AlumnoHorarioHorario foreign key (idHorario) references horario(idHorario);
--AlumnoVacacion
alter table AlumnoVacacion Add constraint FK_AlumnoVacacionAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoVacacion Add constraint FK_AlumnoVacacionVacacion foreign key (idVacacion) references vacacion(idVacacion);
--AlumnoProyecto
alter table AlumnoProyecto Add constraint FK_AlumnoProyectoAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoProyecto Add constraint FK_AlumnoProyectoProyecto foreign key (idProyecto) references proyecto(idProyecto);
--AlumnoTesis
alter table AlumnoTesis Add constraint FK_AlumnoTesisAlumno foreign key (idAlumno) references alumno(idAlumno);
alter table AlumnoTesis Add constraint FK_AlumnoTesisTesis foreign key (idTesis) references tesis(idTesis);
--AutorLibro
alter table AutorLibro Add constraint FK_AutorLibroAutor foreign key (idAutor) references autor(idAutor);
alter table AutorLibro Add constraint FK_AutorLibroLibro foreign key (idLibro) references libro(idLibro);
--AutorLibro
alter table CategoriaLibro Add constraint FK_CategoriaLibroCategoria foreign key (idCategoria) references categoria(idCategoria);
alter table CategoriaLibro Add constraint FK_CategoriaLibroLibro foreign key (idLibro) references libro(idLibro);
--CertificadoCurso
alter table CertificadoCurso Add constraint FK_CertificadoCursoCertificado foreign key (idCertificado) references certificado(idCertificado);
alter table CertificadoCurso Add constraint FK_CertificadoCursoCurso foreign key (idCurso) references curso(idCurso);
--ColegiaturaEmpleado
alter table ColegiaturaEmpleado Add constraint FK_ColegiaturaEmpleadoColegiatura foreign key (idColegiatura) references colegiatura(idColegiatura);
alter table ColegiaturaEmpleado Add constraint FK_ColegiaturaEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
--ConcursoEmpleado
alter table ConcursoEmpleado Add constraint FK_ConcursoEmpleadoConcurso foreign key (idConcurso) references concurso(idConcurso);
alter table ConcursoEmpleado Add constraint FK_ConcursoEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
--ConferenciaEmpleado
alter table ConferenciaEmpleado Add constraint FK_ConferenciaEmpleadoConferencia foreign key (idConferencia) references conferencia(idConferencia);
alter table ConferenciaEmpleado Add constraint FK_ConferenciaEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
--AsignaturaProfesor
alter table ConferenciaProfesor Add constraint FK_ConferenciaProfesorConferencia foreign key (idConferencia) references conferencia(idConferencia);
alter table ConferenciaProfesor Add constraint FK_ConferenciaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor);
--ContratoProfesor
alter table ContratoProfesor Add constraint FK_ContratoProfesorContrato foreign key (idContrato) references contrato(idContrato);
alter table ContratoProfesor Add constraint FK_ContratoProfesorProfesor foreign key (idProfesor) references profesor(idProfesor);
--ContratoEmpleado
alter table ContratoEmpleado Add constraint FK_ContratoEmpleadoContrato foreign key (idContrato) references contrato(idContrato);
alter table ContratoEmpleado Add constraint FK_ContratoEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
--ConvocatoriaProfesor
alter table ConvocatoriaProfesor Add constraint FK_ConvocatoriaProfesorConvocatoria foreign key (idConvocatoria) references convocatoria(idConvocatoria);
alter table ConvocatoriaProfesor Add constraint FK_ConvocatoriaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor);
--ConvocatoriaEmpleado
alter table ConvocatoriaEmpleado Add constraint FK_ConvocatoriaEmpleadoConvocatoria foreign key (idConvocatoria) references convocatoria(idConvocatoria);
alter table ConvocatoriaEmpleado Add constraint FK_ConvocatoriaEmpleadoEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
--EditorialLibro
alter table EditorialLibro Add constraint FK_EditorialLibroEditorial foreign key (idEditorial) references editorial(idEditorial);
alter table EditorialLibro Add constraint FK_EditorialLibroLibro foreign key (idLibro) references libro(idLibro);
--EmpleadoKardex
alter table EmpleadoKardex Add constraint FK_EmpleadoKardexEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
alter table EmpleadoKardex Add constraint FK_EmpleadoKardexKardex foreign key (idKardex) references kardex(idKardex);
--EmpleadoServicioSocial
alter table EmpleadoServicioSocial Add constraint FK_EmpleadoServicioSocialEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
alter table EmpleadoServicioSocial Add constraint FK_EmpleadoServicioSocialServicioSocial foreign key (idServicioSocial) references servicioSocial(idServicioSocial);
--EmpleadoResidencia
alter table EmpleadoResidencia Add constraint FK_EmpleadoResidenciaEmpleado foreign key (idEmpleado) references empleado(idEmpleado);
alter table EmpleadoResidencia Add constraint FK_EmpleadoResidenciaResidencia foreign key (idResidencia) references residencia(idResidencia);
--EquipoTaller
alter table EquipoTaller Add constraint FK_EquipoTallerEquipo foreign key (idEquipo) references equipo(idEquipo);
alter table EquipoTaller Add constraint FK_EquipoTallerTaller foreign key (idTaller) references Taller(idTaller);
--HorarioProfesor
alter table HorarioProfesor Add constraint FK_HorarioProfesorHorario foreign key (idHorario) references horario(idHorario);
alter table HorarioProfesor Add constraint FK_HorarioProfesorProfesor foreign key (idProfesor) references profesor(idProfesor);
--PracticaProfesor
alter table PracticaProfesor Add constraint FK_PracticaProfesorPractica foreign key (idPractica) references practica(idPractica);
alter table PracticaProfesor Add constraint FK_PracticaProfesorProfesor foreign key (idProfesor) references profesor(idProfesor);
--ProfesorProyecto
alter table ProfesorProyecto Add constraint FK_ProfesorProyectoProfesor foreign key (idProfesor) references profesor(idProfesor);
alter table ProfesorProyecto Add constraint FK_ProfesorProyectoProyecto foreign key (idProyecto) references proyecto(idProyecto);
--ProfesorVacacion
alter table ProfesorVacacion Add constraint FK_ProfesorVacacionProfesor foreign key (idProfesor) references profesor(idProfesor);
alter table ProfesorVacacion Add constraint FK_ProfesorVacacionVacacion foreign key (idVacacion) references vacacion(idVacacion);
--ProyectoSinodal
alter table ProyectoSinodal Add constraint FK_ProyectoSinodalProyecto foreign key (idProyecto) references proyecto(idProyecto);
alter table ProyectoSinodal Add constraint FK_ProyectoSinodalSinodal foreign key (idSinodal) references sinodal(idSinodal);
--SinodalTesis
alter table SinodalTesis Add constraint FK_SinodalTesisSinodal foreign key (idSinodal) references sinodal(idSinodal);
alter table SinodalTesis Add constraint FK_SinodalTesisTesis foreign key (idTesis) references tesis(idTesis);
--Indices
create index IX_Actividad ON Actividad(idActividad);
create index IX_Adeudo ON Adeudo(idAdeudo);
create index IX_Alumno ON Alumno(idAlumno);
create index IX_Asignatura ON Asignatura(idAsignatura);
create index IX_Area ON Area(idArea);
create index IX_Autor ON Autor(idAutor);
create index IX_Aula ON Aula(idAula);
create index IX_Beca ON Beca(idBeca);
create index IX_Calificacion ON Calificacion(idCalificacion);
create index IX_Carrera ON Carrera(idCarrera);
create index IX_Categoria ON Categoria(idCategoria);
create index IX_Certificado ON Certificado(idCertificado);
create index IX_Club ON Club(idClub);
create index IX_Colegiatura ON Colegiatura(idColegiatura);
create index IX_Concurso ON Concurso(idConcurso);
create index IX_Conferencia ON Conferencia(idConferencia);
create index IX_Contrato ON Contrato(idContrato);
create index IX_Convocatoria ON Convocatoria(idConvocatoria);
create index IX_CredencialEscolar ON CredencialEscolar(idCredencialEscolar);
create index IX_Credito ON Credito(idCredito);
create index IX_Curso ON Curso(idCurso);
create index IX_Edificio ON Edificio(idEdificio);
create index IX_Editorial ON Editorial(idEditorial);
create index IX_Empleado ON Empleado(idEmpleado);
create index IX_Equipo ON Equipo(idEquipo);
create index IX_Examen ON Examen(idExamen);
create index IX_Foro ON Foro(idForo);
create index IX_FeriaCiencia ON FeriaCiencia(idFeriaCiencia);
create index IX_Grupo ON Grupo(idGrupo);
create index IX_Horario ON Horario(idHorario);
create index IX_Libro ON Libro(idLibro);
create index IX_Kardex ON Kardex(idKardex);
create index IX_Periodo ON Periodo(idPeriodo);
create index IX_Practica ON Practica(idPractica);
create index IX_Prestamo ON Prestamo(idPrestamo);
create index IX_Producto ON Producto(idProducto);
create index IX_Profesor ON Profesor(idProfesor);
create index IX_Proyecto ON Proyecto(idProyecto);
create index IX_Recurso ON Recurso(idRecurso);
create index IX_Residencia ON Residencia(idResidencia);
create index IX_Seccion ON Seccion(idSeccion);
create index IX_ServicioSocial ON ServicioSocial(idServicioSocial);
create index IX_Sinodal ON Sinodal(idSinodal);
create index IX_Taller ON Taller(idTaller);
create index IX_Tesis ON Tesis(idTesis);
create index IX_Toefl ON Toefl(idToefl);
create index IX_TipoArea ON TipoArea(idTipoArea);
create index IX_TipoExamen ON TipoExamen(idTipoExamen);
create index IX_TransporteEscolar ON TransporteEscolar(idTransporteEscolar);
create index IX_Vacacion ON Vacacion(idVacacion);
create index IX_AsignaturaProfesor ON AsignaturaProfesor(idAsignaturaProfesor);
create index IX_AsignaturaCarrera ON AsignaturaCarrera(idAsignaturaCarrera);
create index IX_AlumnoPrestamo ON AlumnoPrestamo(idAlumnoPrestamo);
create index IX_AlumnoCredito ON AlumnoCredito(idAlumnoCredito);
create index IX_AlumnoColegiatura ON AlumnoColegiatura(idAlumnoColegiatura);
create index IX_AlumnoKardex ON AlumnoKardex(idAlumnoKardex);
create index IX_AlumnoConcurso ON AlumnoConcurso(idAlumnoConcurso);
create index IX_AlumnoAsignatura ON AlumnoAsignatura(idAlumnoAsignatura);
create index IX_AlumnoExamen ON AlumnoExamen(idAlumnoExamen);
create index IX_AlumnoHorario ON AlumnoHorario(idAlumnoHorario);
create index IX_AlumnoVacacion ON AlumnoVacacion(idAlumnoVacacion);
create index IX_AlumnoProyecto ON AlumnoProyecto(idAlumnoProyecto);
create index IX_AlumnoTesis ON AlumnoTesis(idAlumnoTesis);
create index IX_AutorLibro ON AutorLibro(idAutorLibro);
create index IX_CategoriaLibro ON CategoriaLibro(idCategoriaLibro);
create index IX_CertificadoCurso ON CertificadoCurso(idCertificadoCurso);
create index IX_ColegiaturaEmpleado ON ColegiaturaEmpleado(idColegiaturaEmpleado);
create index IX_ConcursoEmpleado ON ConcursoEmpleado(idConcursoEmpleado);
create index IX_ConferenciaEmpleado ON ConferenciaEmpleado(idConferenciaEmpleado);
create index IX_ConferenciaProfesor ON ConferenciaProfesor(idConferenciaProfesor);
create index IX_ContratoEmpleado ON ContratoEmpleado(idContratoEmpleado);
create index IX_ContratoProfesor ON ContratoProfesor(idContratoProfesor);
create index IX_ConvocatoriaProfesor ON ConvocatoriaProfesor(idConvocatoriaProfesor);
create index IX_ConvocatoriaEmpleado ON ConvocatoriaEmpleado(idConvocatoriaEmpleado);
create index IX_EditorialLibro ON EditorialLibro(idEditorialLibro);
create index IX_EmpleadoKardex ON EmpleadoKardex(idEmpleadoKardex);
create index IX_EmpleadoServicioSocial ON EmpleadoServicioSocial(idEmpleadoServicioSocial);
create index IX_EmpleadoResidencia ON EmpleadoResidencia(idEmpleadoResidencia);
create index IX_EquipoTaller ON EquipoTaller(idEquipoTaller);
create index IX_HorarioProfesor ON HorarioProfesor(idHorarioProfesor);
create index IX_PracticaProfesor ON PracticaProfesor(idPracticaProfesor);
create index IX_ProfesorProyecto ON ProfesorProyecto(idProfesorProyecto);
create index IX_ProfesorVacacion ON ProfesorVacacion(idProfesorVacacion);
create index IX_ProyectoSinodal ON ProyectoSinodal(idProyectoSinodal);
create index IX_SinodalTesis ON SinodalTesis(idSinodalTesis);