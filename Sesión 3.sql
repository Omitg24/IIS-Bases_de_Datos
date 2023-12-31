--PRACTICA ERT1
CREATE TABLE CARRERA (
    CODCARR VARCHAR(8),
    NOMBREC VARCHAR(20),
    DURACION DECIMAL(1,0),
    CONSTRAINT PK_CODCARR PRIMARY KEY (CODCARR)
);

CREATE TABLE PROFESOR (
    DNIP VARCHAR(8),
    NOMBREP VARCHAR(20),
    APELLIDOP VARCHAR(20),
    DOMICILIOP VARCHAR(20),
    CONSTRAINT PK_DNIP PRIMARY KEY (DNIP)
);

CREATE TABLE ALUMNO (
    DNIA VARCHAR(8),
    NOMA VARCHAR(20),
    APELLA VARCHAR(20),
    DOMICILIOA VARCHAR(20),
    F_NACIMIENTO DATE,
    F_INGRESO DATE,
    CONSTRAINT PK_DNIA PRIMARY KEY (DNIA)
);

CREATE TABLE ASIGNATURA (
    CODASIG VARCHAR(8),
    NOMASIG VARCHAR(20),
    CURSO DECIMAL(1,0),
    CREDITOS DECIMAL (2,0),
    TIPO VARCHAR(20),
    CODCARR VARCHAR(8) NOT NULL,
    CONSTRAINT PK_CODASIG PRIMARY KEY (CODASIG),
    CONSTRAINT FK_ASIGNATURA_CARRERA FOREIGN KEY (CODCARR)
        REFERENCES CARRERA(CODCARR)
);

CREATE TABLE IMPARTE (
    DNIP VARCHAR(8),
    CODASIG VARCHAR(8),
    CONSTRAINT PK_IMPARTE PRIMARY KEY (DNIP, CODASIG),
    CONSTRAINT FK_IMPARTE_PROFESOR FOREIGN KEY (DNIP)
        REFERENCES PROFESOR(DNIP),
    CONSTRAINT FK_IMPARTE_ASIGNATURA FOREIGN KEY (CODASIG)
        REFERENCES ASIGNATURA(CODASIG)    
);

CREATE TABLE CALIFICA_M1 (
    NOTA DECIMAL(2,2),
    FECHA_CALIFICACION DATE,
    DNIA VARCHAR(8) NOT NULL,
    DNIP VARCHAR(8) NOT NULL,
    CODASIG VARCHAR(8) NOT NULL,
    CONSTRAINT PK_CALIFICA_M1 PRIMARY KEY (DNIA, CODASIG),
    CONSTRAINT FK_CALIFICA_M1_ASIGNATURA FOREIGN KEY (CODASIG)
        REFERENCES ASIGNATURA(CODASIG),
    CONSTRAINT FK_CALIFICA_M1_PROFESOR FOREIGN KEY (DNIP)
        REFERENCES PROFESOR(DNIP),
    CONSTRAINT FK_CALIFICA_M1_ALUMNO FOREIGN KEY (DNIA)
        REFERENCES ALUMNO(DNIA) 
);

CREATE TABLE CALIFICA_M2 (
    NOTA DECIMAL(2,2),
    FECHA_CALIFICACION DATE,
    DNIA VARCHAR(8) NOT NULL,
    DNIP VARCHAR(8) NOT NULL,
    CODASIG VARCHAR(8) NOT NULL,
    CONSTRAINT PK_CALIFICA_M2 PRIMARY KEY (DNIA, DNIP,CODASIG),
    CONSTRAINT FK_CALIFICA_M2_IMPARTE FOREIGN KEY (DNIP, CODASIG)
        REFERENCES IMPARTE(DNIP, CODASIG),
    CONSTRAINT FK_CALIFICA_M2_ALUMNO FOREIGN KEY (DNIA)
        REFERENCES ALUMNO(DNIA) 
);

--PRACTICA ERT2
CREATE TABLE CINE (
    CODCINE VARCHAR(8),
    LOCALIDAD VARCHAR(20),
    CONSTRAINT PK_CINE PRIMARY KEY (CODCINE)
);

CREATE TABLE CINE3D (
    CODCINE VARCHAR(8),
    NUMSALAS DECIMAL(2,0),
    CONSTRAINT PK_CINE3D PRIMARY KEY (CODCINE),
    CONSTRAINT FK_CINE3D_CINE FOREIGN KEY (CODCINE)
        REFERENCES CINE(CODCINE)
);

CREATE TABLE SALA (
    CODSALA VARCHAR(8),
    AFORO DECIMAL (3,0),
    CODCINE VARCHAR (8) NOT NULL,
    CONSTRAINT PK_SALA PRIMARY KEY (CODSALA),
    CONSTRAINT FK_SALA_CINE FOREIGN KEY (CODCINE)
        REFERENCES CINE(CODCINE)
);

CREATE TABLE PELICULA (
    CODPELICULA VARCHAR(8),
    TITULO VARCHAR(20),
    DURACION DECIMAL(2,0),
    TIPO VARCHAR(20),
    CODPELICULA_ORIGINAL VARCHAR(8),
    CONSTRAINT PK_PELICULA PRIMARY KEY(CODPELICULA),
    CONSTRAINT FK_PELICULA_PELICULA_ORIGINAL FOREIGN KEY (CODPELICULA_ORIGINAL)
        REFERENCES PELICULA (CODPELICULA),
    CONSTRAINT CK_PELICULA_TIPO CHECK(TIPO IN ('ficci�n', 'aventuras', 'terror')),
    CONSTRAINT UQ_PELICULA_TITULO UNIQUE (TITULO)    
);

CREATE TABLE PROYECTA (
    SESION DECIMAL(2,0),
    FECHA DATE,
    ENTRADAS_VENDIDAS DECIMAL(3,0),
    CODPELICULA VARCHAR(8) NOT NULL,
    CODSALA VARCHAR(8) NOT NULL,
    
    CONSTRAINT PK_PROYECTA PRIMARY KEY (CODPELICULA,CODSALA,SESION,FECHA),    
    CONSTRAINT FK_PROYECTA_PELICULA FOREIGN KEY (CODPELICULA)
        REFERENCES PELICULA(CODPELICULA),
    CONSTRAINT FK_PROYECTA_SALA FOREIGN KEY (CODSALA)
        REFERENCES SALA(CODSALA),
    CONSTRAINT CK_PROYECTA_SESION CHECK(SESION IN(5,7,10))    
);

CREATE TABLE ENTRADA (
    CODENTRADA VARCHAR(8),
    PRECIO DECIMAL (2,2),
    SESION DECIMAL(2,0),
    FECHA DATE NOT NULL,
    CODPELICULA VARCHAR(8) NOT NULL,
    CODSALA VARCHAR(8) NOT NULL,
    CONSTRAINT PK_ENTRADA PRIMARY KEY (CODENTRADA),
    CONSTRAINT FK_ENTRADA_PROYECTA FOREIGN KEY (SESION, FECHA, CODPELICULA, CODSALA)
        REFERENCES PROYECTA(SESION, FECHA, CODPELICULA, CODSALA)
);