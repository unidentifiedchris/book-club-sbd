-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL (NUEVO MODELO)
-- Archivo: 02_tablas.sql
-- Descripcion: DDL para creacion de tablas (Crow's Foot ER)
-- Prefijo: CASJ_
-- MBD: Oracle
-- ============================================================

-- ============================================================
-- LIMPIEZA PREVIA (En orden inverso de dependencias)
-- ============================================================
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_MEJOR_ACTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_INASISTENCIA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CALENDARIO_REUNION_MES CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PRESENTACION CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_ELENCO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_LIBRO_OBRA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_OBRA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_LIBRO_AUTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_AUTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PREFERENCIA_MIEMBRO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_LIBRO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PAGO_MEMBRESIA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_HISTORICO_MEMBRESIA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_ASIGNACION CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_GRUPO_LECTURA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_MIEMBRO_NACIONALIDAD CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_MIEMBRO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_REPRESENTANTE CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_ASOCIADOS CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CLUB CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_IDIOMA_CLUB_LECTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_IDIOMA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CLUB_LECTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_INSTITUCION CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CIUDAD CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PAIS CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- ============================================================
-- 1. CASJ_PAIS (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_PAIS (
    id_pais    NUMBER(10)    NOT NULL,
    nombre     VARCHAR2(100) NOT NULL,
    gentilicio VARCHAR2(100) NOT NULL,
    moneda     VARCHAR2(50)  NOT NULL,
    CONSTRAINT CASJ_PK_PAIS PRIMARY KEY (id_pais),
    CONSTRAINT CASJ_UQ_PAIS_NOMBRE UNIQUE (nombre)
);

-- ============================================================
-- 2. CASJ_CIUDAD (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_CIUDAD (
    id_ciudad NUMBER(10)    NOT NULL,
    nombre    VARCHAR2(100) NOT NULL,
    id_pais   NUMBER(10)    NOT NULL,
    CONSTRAINT CASJ_PK_CIUDAD PRIMARY KEY (id_ciudad),
    CONSTRAINT CASJ_FK_CIUDAD_PAIS FOREIGN KEY (id_pais) REFERENCES CASJ_PAIS (id_pais)
);

-- ============================================================
-- 3. CASJ_INSTITUCION (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_INSTITUCION (
    id_institucion NUMBER(10)    NOT NULL,
    nombre         VARCHAR2(200) NOT NULL,
    tipo           VARCHAR2(50)  NOT NULL,
    CONSTRAINT CASJ_PK_INSTITUCION PRIMARY KEY (id_institucion),
    CONSTRAINT CASJ_CK_INST_TIPO CHECK (tipo IN ('BIBLIOTECA','ESCUELA','COLEGIO','UNIVERSIDAD','OTRO'))
);

-- ============================================================
-- 4. CASJ_CLUB_LECTOR / IDIOMA_LECTOR (Tipo: E - Entrada)
-- Superclase para Club y Miembro
-- Implementa el arco exclusivo del diagrama ER
-- ============================================================
CREATE TABLE CASJ_CLUB_LECTOR (
    id   NUMBER(10)   NOT NULL,
    tipo VARCHAR2(20) NOT NULL,
    CONSTRAINT CASJ_PK_CLUB_LECTOR PRIMARY KEY (id),
    CONSTRAINT CASJ_CK_CL_TIPO CHECK (tipo IN ('CLUB', 'MIEMBRO'))
);

-- ============================================================
-- 5. CASJ_CLUB (Tipo: E - Entrada)
-- Subclase de CLUB_LECTOR
-- cuota_membresia: SI/NO indica si cobra membresia
-- Los independientes cobran $100 USD anuales, los dependientes no cobran
-- ============================================================
CREATE TABLE CASJ_CLUB (
    id_club         NUMBER(10)    NOT NULL,
    nombre          VARCHAR2(200) NOT NULL,
    direccion       VARCHAR2(500) NOT NULL,
    cod_postal      VARCHAR2(20)  NOT NULL,
    cuota_membresia VARCHAR2(2)   NOT NULL,
    id_ciudad       NUMBER(10)    NOT NULL,
    id_institucion  NUMBER(10),
    CONSTRAINT CASJ_PK_CLUB PRIMARY KEY (id_club),
    CONSTRAINT CASJ_FK_CLUB_SUPER FOREIGN KEY (id_club) REFERENCES CASJ_CLUB_LECTOR (id),
    CONSTRAINT CASJ_FK_CLUB_CIUDAD FOREIGN KEY (id_ciudad) REFERENCES CASJ_CIUDAD (id_ciudad),
    CONSTRAINT CASJ_FK_CLUB_INST FOREIGN KEY (id_institucion) REFERENCES CASJ_INSTITUCION (id_institucion),
    CONSTRAINT CASJ_UQ_CLUB_NOMBRE UNIQUE (nombre),
    CONSTRAINT CASJ_CK_CLUB_CUOTA CHECK (cuota_membresia IN ('SI', 'NO'))
);

-- ============================================================
-- 6. CASJ_ASOCIADOS (Tipo: E-S - Entrada/Salida)
-- Relacion recursiva N:M entre clubes
-- ============================================================
CREATE TABLE CASJ_ASOCIADOS (
    id_club_1 NUMBER(10) NOT NULL,
    id_club_2 NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_ASOCIADOS PRIMARY KEY (id_club_1, id_club_2),
    CONSTRAINT CASJ_FK_ASOC_C1 FOREIGN KEY (id_club_1) REFERENCES CASJ_CLUB (id_club),
    CONSTRAINT CASJ_FK_ASOC_C2 FOREIGN KEY (id_club_2) REFERENCES CASJ_CLUB (id_club),
    CONSTRAINT CASJ_CK_ASOC_DIF CHECK (id_club_1 != id_club_2)
);

-- ============================================================
-- 7. CASJ_IDIOMA (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_IDIOMA (
    id_idioma NUMBER(10)    NOT NULL,
    nombre    VARCHAR2(100) NOT NULL,
    CONSTRAINT CASJ_PK_IDIOMA PRIMARY KEY (id_idioma),
    CONSTRAINT CASJ_UQ_IDIOMA_NOM UNIQUE (nombre)
);

-- ============================================================
-- 8. CASJ_IDIOMA_CLUB_LECTOR (Tipo: E - Entrada)
-- "Se habla" - Relacion N:M entre IDIOMA y CLUB_LECTOR
-- ============================================================
CREATE TABLE CASJ_IDIOMA_CLUB_LECTOR (
    id_club_lector NUMBER(10) NOT NULL,
    id_idioma      NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_ICL PRIMARY KEY (id_club_lector, id_idioma),
    CONSTRAINT CASJ_FK_ICL_CL FOREIGN KEY (id_club_lector) REFERENCES CASJ_CLUB_LECTOR (id),
    CONSTRAINT CASJ_FK_ICL_ID FOREIGN KEY (id_idioma) REFERENCES CASJ_IDIOMA (id_idioma)
);

-- ============================================================
-- 9. CASJ_REPRESENTANTE (Tipo: E - Entrada)
-- Con relacion "Representa a" hacia MIEMBRO
-- ============================================================
CREATE TABLE CASJ_REPRESENTANTE (
    id_representante NUMBER(10)    NOT NULL,
    nombre           VARCHAR2(100) NOT NULL,
    apellido         VARCHAR2(100) NOT NULL,
    doc_identidad    VARCHAR2(20)  NOT NULL,
    CONSTRAINT CASJ_PK_REPRESENTANTE PRIMARY KEY (id_representante),
    CONSTRAINT CASJ_UQ_REP_DOC UNIQUE (doc_identidad)
);

-- ============================================================
-- 10. CASJ_MIEMBRO / MIEMBRO_LECTOR (Tipo: E - Entrada)
-- Subclase de CLUB_LECTOR
-- ============================================================
CREATE TABLE CASJ_MIEMBRO (
    id_miembro       NUMBER(10)    NOT NULL,
    primer_nombre    VARCHAR2(100) NOT NULL,
    segundo_nombre   VARCHAR2(100),
    primer_apellido  VARCHAR2(100) NOT NULL,
    segundo_apellido VARCHAR2(100) NOT NULL,
    fecha_nacimiento DATE          NOT NULL,
    email            VARCHAR2(150) NOT NULL,
    telefono         VARCHAR2(50)  NOT NULL,
    doc_identidad    VARCHAR2(20)  NOT NULL,
    id_representante NUMBER(10),
    CONSTRAINT CASJ_PK_MIEMBRO PRIMARY KEY (id_miembro),
    CONSTRAINT CASJ_FK_MIEMBRO_SUPER FOREIGN KEY (id_miembro) REFERENCES CASJ_CLUB_LECTOR (id),
    CONSTRAINT CASJ_FK_MIEMBRO_REP FOREIGN KEY (id_representante) REFERENCES CASJ_REPRESENTANTE (id_representante),
    CONSTRAINT CASJ_UQ_MIEMBRO_EMAIL UNIQUE (email),
    CONSTRAINT CASJ_UQ_MIEMBRO_DOC UNIQUE (doc_identidad)
);

-- ============================================================
-- 11. CASJ_MIEMBRO_NACIONALIDAD (Tipo: E - Entrada)
-- "Posee nacionalidad" / "Nacionaliza"
-- ============================================================
CREATE TABLE CASJ_MIEMBRO_NACIONALIDAD (
    id_miembro NUMBER(10) NOT NULL,
    id_pais    NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_MN PRIMARY KEY (id_miembro, id_pais),
    CONSTRAINT CASJ_FK_MN_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro),
    CONSTRAINT CASJ_FK_MN_PAIS FOREIGN KEY (id_pais) REFERENCES CASJ_PAIS (id_pais)
);

-- ============================================================
-- 12. CASJ_GRUPO_LECTURA (Tipo: E-S - Entrada/Salida)
-- ============================================================
CREATE TABLE CASJ_GRUPO_LECTURA (
    id_grupo       NUMBER(10)   NOT NULL,
    fecha_creacion DATE         NOT NULL,
    dia_reunion    VARCHAR2(20) NOT NULL,
    hora_inicio    VARCHAR2(5)  NOT NULL,
    tipo           VARCHAR2(50) NOT NULL,
    id_club        NUMBER(10)   NOT NULL,
    CONSTRAINT CASJ_PK_GRUPO PRIMARY KEY (id_grupo),
    CONSTRAINT CASJ_FK_GRUPO_CLUB FOREIGN KEY (id_club) REFERENCES CASJ_CLUB (id_club),
    CONSTRAINT CASJ_CK_GRUPO_TIPO CHECK (tipo IN ('INFANTIL', 'JUVENIL', 'ADULTO')),
    CONSTRAINT CASJ_CK_GRUPO_DIA CHECK (dia_reunion IN ('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO'))
);

-- ============================================================
-- 13. CASJ_ASIGNACION (Tipo: E-S - Entrada/Salida)
-- "Integra"
-- ============================================================
CREATE TABLE CASJ_ASIGNACION (
    id_grupo     NUMBER(10) NOT NULL,
    id_miembro   NUMBER(10) NOT NULL,
    fecha_inicio DATE       NOT NULL,
    fecha_fin    DATE,
    CONSTRAINT CASJ_PK_ASIGNACION PRIMARY KEY (id_grupo, id_miembro, fecha_inicio),
    CONSTRAINT CASJ_FK_ASIG_GRUPO FOREIGN KEY (id_grupo) REFERENCES CASJ_GRUPO_LECTURA (id_grupo),
    CONSTRAINT CASJ_FK_ASIG_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro)
);

-- ============================================================
-- 14. CASJ_HISTORICO_MEMBRESIA (Tipo: E-S - Entrada/Salida)
-- ============================================================
CREATE TABLE CASJ_HISTORICO_MEMBRESIA (
    id_club       NUMBER(10)    NOT NULL,
    id_miembro    NUMBER(10)    NOT NULL,
    fecha_inicio  DATE          NOT NULL,
    fecha_fin     DATE,
    motivo_salida VARCHAR2(500),
    activo        VARCHAR2(1)   NOT NULL,
    CONSTRAINT CASJ_PK_HISTORICO PRIMARY KEY (id_club, id_miembro, fecha_inicio),
    CONSTRAINT CASJ_FK_HIST_CLUB FOREIGN KEY (id_club) REFERENCES CASJ_CLUB (id_club),
    CONSTRAINT CASJ_FK_HIST_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro),
    CONSTRAINT CASJ_CK_HIST_ACTIVO CHECK (activo IN ('S', 'N')),
    CONSTRAINT CASJ_CK_HIST_MOTIVO CHECK (motivo_salida IS NULL OR motivo_salida IN ('VOLUNTARIO', 'DEUDAS', 'INASISTENCIA', 'OTRO'))
);

-- ============================================================
-- 15. CASJ_PAGO_MEMBRESIA (Tipo: S - Salida)
-- Simplificado segun ER: solo id y fecha_pago
-- El monto se calcula como $100 USD (fijo segun enunciado)
-- convertido a moneda local del pais del club
-- ============================================================
CREATE TABLE CASJ_PAGO_MEMBRESIA (
    id_pago       NUMBER(10)   NOT NULL,
    id_club       NUMBER(10)   NOT NULL,
    id_miembro    NUMBER(10)   NOT NULL,
    fecha_inicio  DATE         NOT NULL,
    fecha_pago    DATE         NOT NULL,
    CONSTRAINT CASJ_PK_PAGO PRIMARY KEY (id_pago),
    CONSTRAINT CASJ_FK_PAGO_HIST FOREIGN KEY (id_club, id_miembro, fecha_inicio) 
        REFERENCES CASJ_HISTORICO_MEMBRESIA (id_club, id_miembro, fecha_inicio)
);

-- ============================================================
-- 16. CASJ_LIBRO (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_LIBRO (
    ISBN             NUMBER(20)     NOT NULL,
    titulo           VARCHAR2(300)  NOT NULL,
    anio_publicacion NUMBER(4)      NOT NULL,
    cantidad_pag     NUMBER(5)      NOT NULL,
    tipo_narrativa   VARCHAR2(100)  NOT NULL,
    temas_resumen    VARCHAR2(1000) NOT NULL,
    sinopsis         CLOB           NOT NULL,
    ISBN_orden       NUMBER(20),
    CONSTRAINT CASJ_PK_LIBRO PRIMARY KEY (ISBN),
    CONSTRAINT CASJ_FK_LIBRO_ORDEN FOREIGN KEY (ISBN_orden) REFERENCES CASJ_LIBRO (ISBN),
    CONSTRAINT CASJ_CK_LIBRO_TIPO CHECK (tipo_narrativa IN ('NOVELA','CUENTO','MITO','FABULA','LEYENDA','EPOPEYA'))
);

-- ============================================================
-- 18. CASJ_AUTOR (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_AUTOR (
    id_autor  NUMBER(10)    NOT NULL,
    nombre    VARCHAR2(100),
    apellido  VARCHAR2(100),
    seudonimo VARCHAR2(100),
    CONSTRAINT CASJ_PK_AUTOR PRIMARY KEY (id_autor),
    CONSTRAINT CASJ_CK_AUTOR_REQ CHECK (nombre IS NOT NULL OR apellido IS NOT NULL OR seudonimo IS NOT NULL)
);

-- ============================================================
-- 19. CASJ_LIBRO_AUTOR (Tipo: E - Entrada)
-- "escrito por" / "escribe"
-- ============================================================
CREATE TABLE CASJ_LIBRO_AUTOR (
    ISBN     NUMBER(20) NOT NULL,
    id_autor NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_LA PRIMARY KEY (ISBN, id_autor),
    CONSTRAINT CASJ_FK_LA_LIBRO FOREIGN KEY (ISBN) REFERENCES CASJ_LIBRO (ISBN),
    CONSTRAINT CASJ_FK_LA_AUTOR FOREIGN KEY (id_autor) REFERENCES CASJ_AUTOR (id_autor)
);

-- ============================================================
-- 20. CASJ_PREFERENCIA_MIEMBRO (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_PREFERENCIA_MIEMBRO (
    id_miembro        NUMBER(10) NOT NULL,
    ISBN              NUMBER(20) NOT NULL,
    orden_preferencia NUMBER(3)  NOT NULL,
    CONSTRAINT CASJ_PK_PREFERENCIA PRIMARY KEY (id_miembro, ISBN),
    CONSTRAINT CASJ_FK_PREF_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro),
    CONSTRAINT CASJ_FK_PREF_LIBRO FOREIGN KEY (ISBN) REFERENCES CASJ_LIBRO (ISBN),
    CONSTRAINT CASJ_UQ_PREF_ORDEN UNIQUE (id_miembro, orden_preferencia)
);

-- ============================================================
-- 21. CASJ_OBRA (Tipo: E - Entrada)
-- ============================================================
CREATE TABLE CASJ_OBRA (
    id_obra       NUMBER(10)    NOT NULL,
    titulo        VARCHAR2(300) NOT NULL,
    costo_entrada NUMBER(18,2)  NOT NULL,
    estatus       VARCHAR2(50)  NOT NULL,
    CONSTRAINT CASJ_PK_OBRA PRIMARY KEY (id_obra),
    CONSTRAINT CASJ_CK_OBRA_EST CHECK (estatus IN ('ACTIVA', 'NO_ACTIVA', 'EN_PRODUCCION'))
);

-- ============================================================
-- 22. CASJ_LIBRO_OBRA (Tipo: E - Entrada)
-- "Inspira" / "Adapta"
-- ============================================================
CREATE TABLE CASJ_LIBRO_OBRA (
    ISBN    NUMBER(20) NOT NULL,
    id_obra NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_LO PRIMARY KEY (ISBN, id_obra),
    CONSTRAINT CASJ_FK_LOB_LIBRO FOREIGN KEY (ISBN) REFERENCES CASJ_LIBRO (ISBN),
    CONSTRAINT CASJ_FK_LOB_OBRA FOREIGN KEY (id_obra) REFERENCES CASJ_OBRA (id_obra)
);

-- ============================================================
-- 23. CASJ_ELENCO (Tipo: E - Entrada)
-- "Actua" / "Tiene"
-- ============================================================
CREATE TABLE CASJ_ELENCO (
    id_miembro NUMBER(10) NOT NULL,
    id_obra    NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_ELENCO PRIMARY KEY (id_miembro, id_obra),
    CONSTRAINT CASJ_FK_ELEN_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro),
    CONSTRAINT CASJ_FK_ELEN_OBRA FOREIGN KEY (id_obra) REFERENCES CASJ_OBRA (id_obra)
);

-- ============================================================
-- 24. CASJ_PRESENTACION (Tipo: S - Salida)
-- ============================================================
CREATE TABLE CASJ_PRESENTACION (
    id_obra           NUMBER(10)   NOT NULL,
    fecha             DATE         NOT NULL,
    valoracion        NUMBER(3,1)  NOT NULL,
    entradas_vendidas NUMBER(5)    NOT NULL,
    CONSTRAINT CASJ_PK_PRESENTACION PRIMARY KEY (id_obra, fecha),
    CONSTRAINT CASJ_FK_PRES_OBRA FOREIGN KEY (id_obra) REFERENCES CASJ_OBRA (id_obra)
);

-- ============================================================
-- 25. CASJ_MEJOR_ACTOR (Tipo: E - Entrada)
-- Voto del publico por mejor actor en cada presentacion
-- Puede haber empates (varios mejores actores por presentacion)
-- ============================================================
CREATE TABLE CASJ_MEJOR_ACTOR (
    id_obra         NUMBER(10) NOT NULL,
    fecha           DATE       NOT NULL,
    id_miembro      NUMBER(10) NOT NULL,
    CONSTRAINT CASJ_PK_MEJOR_ACTOR PRIMARY KEY (id_obra, fecha, id_miembro),
    CONSTRAINT CASJ_FK_MA_PRES FOREIGN KEY (id_obra, fecha) REFERENCES CASJ_PRESENTACION (id_obra, fecha),
    CONSTRAINT CASJ_FK_MA_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro)
);

-- ============================================================
-- 26. CASJ_CALENDARIO_REUNION_MES (Tipo: E-S - Entrada/Salida)
-- "Discutido"
-- ============================================================
CREATE TABLE CASJ_CALENDARIO_REUNION_MES (
    id_calendario   NUMBER(10)    NOT NULL,
    id_grupo        NUMBER(10)    NOT NULL,
    ISBN            NUMBER(20)    NOT NULL,
    fecha           DATE          NOT NULL,
    conclusiones    CLOB,
    valoracionfinal NUMBER(3,1),
    realizada       VARCHAR2(1)   NOT NULL,
    ultima_reunion  VARCHAR2(1),
    CONSTRAINT CASJ_PK_CALENDARIO PRIMARY KEY (id_calendario),
    CONSTRAINT CASJ_FK_CAL_GRUPO FOREIGN KEY (id_grupo) REFERENCES CASJ_GRUPO_LECTURA (id_grupo),
    CONSTRAINT CASJ_FK_CAL_LIBRO FOREIGN KEY (ISBN) REFERENCES CASJ_LIBRO (ISBN),
    CONSTRAINT CASJ_CK_CAL_REALIZADA CHECK (realizada IN ('S', 'N')),
    CONSTRAINT CASJ_CK_CAL_ULTIMA CHECK (ultima_reunion IN ('S', 'N', NULL))
);

-- ============================================================
-- 27. CASJ_INASISTENCIA (Tipo: E-S - Entrada/Salida)
-- "Asiste" - Solo guarda a los que faltaron
-- ============================================================
CREATE TABLE CASJ_INASISTENCIA (
    id_calendario NUMBER(10)   NOT NULL,
    id_miembro    NUMBER(10)   NOT NULL,
    asistencia    VARCHAR2(50) NOT NULL,
    CONSTRAINT CASJ_PK_INASISTENCIA PRIMARY KEY (id_calendario, id_miembro),
    CONSTRAINT CASJ_FK_INASIS_CAL FOREIGN KEY (id_calendario) REFERENCES CASJ_CALENDARIO_REUNION_MES (id_calendario),
    CONSTRAINT CASJ_FK_INASIS_MIEMBRO FOREIGN KEY (id_miembro) REFERENCES CASJ_MIEMBRO (id_miembro)
);
