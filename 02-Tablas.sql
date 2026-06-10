-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 02_tablas.sql
-- Descripcion: DDL para creacion de tablas (esquema reconciliado)
-- Prefijo: CASJ_
-- MBD: Oracle
-- ============================================================

-- ============================================================
-- LIMPIEZA PREVIA (En orden inverso de dependencias)
-- ============================================================
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_inasistencias CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_calendario_reunion_mes CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_mejor_actor CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_presentaciones CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_elenco CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_libro_obra CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_obras CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_preferencias_miembro CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_libro_autor CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_autores CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_libros CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_asignaciones CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_grupos_lectura CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_pago_membresia CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_historico_membresia CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_idioma_lector CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_miembros_lectores CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_representantes CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_asociados CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_clubes CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_instituciones CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_ciudades CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_pais_idioma CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_idiomas CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE casj_paises CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
-- Limpiar tablas del esquema anterior si existieran
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_INASISTENCIA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CALENDARIO_REUNION_MES CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_MEJOR_ACTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PRESENTACION CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_ELENCO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_LIBRO_OBRA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_OBRA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PREFERENCIA_MIEMBRO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_LIBRO_AUTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_AUTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_LIBRO CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_ASIGNACION CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_GRUPO_LECTURA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PAGO_MEMBRESIA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_HISTORICO_MEMBRESIA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_IDIOMA_CLUB_LECTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
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
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CLUB_LECTOR CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_INSTITUCION CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_CIUDAD CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_IDIOMA CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CASJ_PAIS CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- ============================================================
-- 1. casj_paises (Tipo E)
-- ============================================================
CREATE TABLE casj_paises (
  id_pais    NUMBER(3)    NOT NULL,
  nombre     VARCHAR2(80) NOT NULL,
  gentilicio VARCHAR2(80) NOT NULL,
  moneda     VARCHAR2(40) NOT NULL,
  CONSTRAINT casj_pk_paises PRIMARY KEY (id_pais),
  CONSTRAINT casj_uq_paises_nombre UNIQUE (nombre)
);

-- ============================================================
-- 2. casj_idiomas (Tipo E)
-- ============================================================
CREATE TABLE casj_idiomas (
  id_idioma NUMBER(3)    NOT NULL,
  nombre    VARCHAR2(60) NOT NULL,
  CONSTRAINT casj_pk_idiomas PRIMARY KEY (id_idioma),
  CONSTRAINT casj_uq_idiomas_nombre UNIQUE (nombre)
);

-- ============================================================
-- 3. casj_pais_idioma (Tipo E)
-- ============================================================
CREATE TABLE casj_pais_idioma (
  id_pais   NUMBER(3) NOT NULL,
  id_idioma NUMBER(3) NOT NULL,
  CONSTRAINT casj_pk_pais_idioma PRIMARY KEY (id_pais, id_idioma),
  CONSTRAINT casj_fk_pi_pais FOREIGN KEY (id_pais) REFERENCES casj_paises (id_pais),
  CONSTRAINT casj_fk_pi_idioma FOREIGN KEY (id_idioma) REFERENCES casj_idiomas (id_idioma)
);

-- ============================================================
-- 4. casj_ciudades (Tipo E)
-- ============================================================
CREATE TABLE casj_ciudades (
  id_ciudad NUMBER(5)    NOT NULL,
  id_pais   NUMBER(3)    NOT NULL,
  nombre    VARCHAR2(80) NOT NULL,
  CONSTRAINT casj_pk_ciudades PRIMARY KEY (id_ciudad),
  CONSTRAINT casj_fk_ciudades_pais FOREIGN KEY (id_pais) REFERENCES casj_paises (id_pais),
  CONSTRAINT casj_uq_ciudad_pais_nombre UNIQUE (id_pais, nombre)
);

-- ============================================================
-- 5. casj_instituciones (Tipo E)
-- ============================================================
CREATE TABLE casj_instituciones (
  id_institucion NUMBER(7)     NOT NULL,
  nombre         VARCHAR2(120) NOT NULL,
  tipo           VARCHAR2(20)  NOT NULL,
  CONSTRAINT casj_pk_instituciones PRIMARY KEY (id_institucion),
  CONSTRAINT casj_ck_inst_tipo CHECK (tipo IN ('BIBLIOTECA', 'UNIVERSIDAD', 'COLEGIO', 'OTRO'))
);

-- ============================================================
-- 6. casj_clubes (Tipo E)
-- ============================================================
CREATE TABLE casj_clubes (
  id_club         NUMBER(7)     NOT NULL,
  nombre          VARCHAR2(120) NOT NULL,
  direccion       VARCHAR2(200) NOT NULL,
  cod_postal      VARCHAR2(20)  NOT NULL,
  cuota_membresia CHAR(1),
  id_ciudad       NUMBER(5)     NOT NULL,
  id_institucion  NUMBER(7),
  CONSTRAINT casj_pk_clubes PRIMARY KEY (id_club),
  CONSTRAINT casj_fk_clubes_ciudad FOREIGN KEY (id_ciudad) REFERENCES casj_ciudades (id_ciudad),
  CONSTRAINT casj_fk_clubes_inst FOREIGN KEY (id_institucion) REFERENCES casj_instituciones (id_institucion),
  CONSTRAINT casj_ck_clubes_cuota CHECK (cuota_membresia IN ('S', 'N')),
  CONSTRAINT casj_uq_clubes_nombre UNIQUE (nombre)
);

-- ============================================================
-- 7. casj_asociados (Tipo E-S)
-- ============================================================
CREATE TABLE casj_asociados (
  id_club          NUMBER(7) NOT NULL,
  id_club_asociado NUMBER(7) NOT NULL,
  CONSTRAINT casj_pk_asociados PRIMARY KEY (id_club, id_club_asociado),
  CONSTRAINT casj_fk_asoc_club_a FOREIGN KEY (id_club) REFERENCES casj_clubes (id_club),
  CONSTRAINT casj_fk_asoc_club_b FOREIGN KEY (id_club_asociado) REFERENCES casj_clubes (id_club),
  CONSTRAINT casj_ck_asoc_no_self CHECK (id_club <> id_club_asociado)
);

-- ============================================================
-- 8. casj_representantes (Tipo E)
-- ============================================================
CREATE TABLE casj_representantes (
  id_representante NUMBER(8)    NOT NULL,
  nombre           VARCHAR2(80) NOT NULL,
  apellido         VARCHAR2(80) NOT NULL,
  doc_identidad    VARCHAR2(30) NOT NULL,
  CONSTRAINT casj_pk_representantes PRIMARY KEY (id_representante),
  CONSTRAINT casj_uq_repr_doc UNIQUE (doc_identidad)
);

-- ============================================================
-- 9. casj_miembros_lectores (Tipo E)
-- ============================================================
CREATE TABLE casj_miembros_lectores (
  id_miembro           NUMBER(8)     NOT NULL,
  primer_nombre        VARCHAR2(80)  NOT NULL,
  segundo_nombre       VARCHAR2(80),
  primer_apellido      VARCHAR2(80)  NOT NULL,
  segundo_apellido     VARCHAR2(80)  NOT NULL,
  fecha_nacimiento     DATE          NOT NULL,
  email                VARCHAR2(120) NOT NULL,
  telefono             VARCHAR2(30)  NOT NULL,
  doc_identidad        VARCHAR2(30)  NOT NULL,
  id_pais_nacionalidad NUMBER(3)     NOT NULL,
  id_representante     NUMBER(8),
  CONSTRAINT casj_pk_miembros PRIMARY KEY (id_miembro),
  CONSTRAINT casj_fk_miembros_pais FOREIGN KEY (id_pais_nacionalidad) REFERENCES casj_paises (id_pais),
  CONSTRAINT casj_fk_miembros_repr FOREIGN KEY (id_representante) REFERENCES casj_representantes (id_representante),
  CONSTRAINT casj_uq_miembros_doc UNIQUE (doc_identidad),
  CONSTRAINT casj_uq_miembros_email UNIQUE (email)
);

-- ============================================================
-- 10. casj_idioma_lector (Tipo E) - Arco exclusivo Club/Miembro
-- ============================================================
CREATE TABLE casj_idioma_lector (
  id_idioma_lector NUMBER(10) NOT NULL,
  id_idioma        NUMBER(3)  NOT NULL,
  id_miembro       NUMBER(8),
  id_club          NUMBER(7),
  CONSTRAINT casj_pk_idioma_lector PRIMARY KEY (id_idioma_lector, id_idioma),
  CONSTRAINT casj_fk_il_miembro FOREIGN KEY (id_miembro) REFERENCES casj_miembros_lectores (id_miembro),
  CONSTRAINT casj_fk_il_idioma FOREIGN KEY (id_idioma) REFERENCES casj_idiomas (id_idioma),
  CONSTRAINT casj_fk_il_club FOREIGN KEY (id_club) REFERENCES casj_clubes (id_club),
  CONSTRAINT casj_ck_il_arco CHECK (
    (id_club IS NOT NULL AND id_miembro IS NULL) OR
    (id_club IS NULL AND id_miembro IS NOT NULL)
  )
);

-- ============================================================
-- 11. casj_historico_membresia (Tipo E-S)
-- ============================================================
CREATE TABLE casj_historico_membresia (
  id_miembro    NUMBER(8)    NOT NULL,
  id_club       NUMBER(7)    NOT NULL,
  fecha_inicio  DATE         NOT NULL,
  activo        CHAR(1)      NOT NULL,
  fecha_fin     DATE,
  motivo_salida VARCHAR2(20),
  CONSTRAINT casj_pk_hist_memb PRIMARY KEY (id_miembro, id_club, fecha_inicio),
  CONSTRAINT casj_fk_hm_miembro FOREIGN KEY (id_miembro) REFERENCES casj_miembros_lectores (id_miembro),
  CONSTRAINT casj_fk_hm_club FOREIGN KEY (id_club) REFERENCES casj_clubes (id_club),
  CONSTRAINT casj_ck_hm_activo CHECK (activo IN ('S', 'N')),
  CONSTRAINT casj_ck_hm_motivo CHECK (motivo_salida IS NULL OR motivo_salida IN ('VOLUNTARIO', 'DEUDAS', 'INASISTENCIA', 'OTRO')),
  CONSTRAINT casj_ck_hm_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

-- ============================================================
-- 12. casj_pago_membresia (Tipo S)
-- ============================================================
CREATE TABLE casj_pago_membresia (
  id_pago                NUMBER(10) NOT NULL,
  id_miembro             NUMBER(8)  NOT NULL,
  id_club                NUMBER(7)  NOT NULL,
  fecha_inicio_membresia DATE       NOT NULL,
  fecha_pago             DATE       NOT NULL,
  CONSTRAINT casj_pk_pago_memb PRIMARY KEY (id_club, id_miembro, fecha_inicio_membresia, id_pago),
  CONSTRAINT casj_fk_pm_hist FOREIGN KEY (id_miembro, id_club, fecha_inicio_membresia)
    REFERENCES casj_historico_membresia (id_miembro, id_club, fecha_inicio)
);

-- ============================================================
-- 13. casj_grupos_lectura (Tipo E-S)
-- ============================================================
CREATE TABLE casj_grupos_lectura (
  id_club        NUMBER(7)   NOT NULL,
  id_grupo       NUMBER(3)   NOT NULL,
  fecha_creacion DATE        NOT NULL,
  dia_reunion    NUMBER(1)   NOT NULL,
  hora_inicio    VARCHAR2(5) NOT NULL,
  tipo           CHAR(1)     NOT NULL,
  CONSTRAINT casj_pk_grupos PRIMARY KEY (id_club, id_grupo),
  CONSTRAINT casj_fk_grupos_club FOREIGN KEY (id_club) REFERENCES casj_clubes (id_club),
  CONSTRAINT casj_ck_grupos_tipo CHECK (tipo IN ('A', 'J', 'N')),
  CONSTRAINT casj_ck_grupos_dia CHECK (dia_reunion BETWEEN 1 AND 5)
);

-- ============================================================
-- 14. casj_asignaciones (Tipo E-S)
-- ============================================================
CREATE TABLE casj_asignaciones (
  id_club                NUMBER(7) NOT NULL,
  id_grupo               NUMBER(3) NOT NULL,
  id_miembro             NUMBER(8) NOT NULL,
  fecha_inicio           DATE      NOT NULL,
  fecha_fin              DATE,
  fecha_inicio_membresia DATE      NOT NULL,
  CONSTRAINT casj_pk_asignaciones PRIMARY KEY (id_club, id_grupo, id_miembro, fecha_inicio),
  CONSTRAINT casj_fk_asig_grupo FOREIGN KEY (id_club, id_grupo) REFERENCES casj_grupos_lectura (id_club, id_grupo),
  CONSTRAINT casj_fk_asig_hist FOREIGN KEY (id_miembro, id_club, fecha_inicio_membresia)
    REFERENCES casj_historico_membresia (id_miembro, id_club, fecha_inicio),
  CONSTRAINT casj_ck_asig_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

-- ============================================================
-- 15. casj_autores (Tipo E)
-- ============================================================
CREATE TABLE casj_autores (
  id_autor  NUMBER(8)    NOT NULL,
  nombre    VARCHAR2(80),
  apellido  VARCHAR2(80),
  seudonimo VARCHAR2(80),
  CONSTRAINT casj_pk_autores PRIMARY KEY (id_autor),
  CONSTRAINT casj_ck_autor_ident CHECK (nombre IS NOT NULL OR apellido IS NOT NULL OR seudonimo IS NOT NULL)
);

-- ============================================================
-- 16. casj_libros (Tipo E)
-- ============================================================
CREATE TABLE casj_libros (
  isbn                VARCHAR2(20)  NOT NULL,
  titulo              VARCHAR2(200) NOT NULL,
  anio_publicacion    NUMBER(4)     NOT NULL,
  cantidad_pag        NUMBER(6)     NOT NULL,
  tipo_narrativa      VARCHAR2(20)  NOT NULL,
  temas_resumen       VARCHAR2(400) NOT NULL,
  sinopsis            VARCHAR2(400) NOT NULL,
  id_pais_publicacion NUMBER(3)     NOT NULL,
  id_idioma           NUMBER(3)     NOT NULL,
  orden_lectura       NUMBER(3),
  isbn_anterior       VARCHAR2(20),
  CONSTRAINT casj_pk_libros PRIMARY KEY (isbn),
  CONSTRAINT casj_fk_libros_pais FOREIGN KEY (id_pais_publicacion) REFERENCES casj_paises (id_pais),
  CONSTRAINT casj_fk_libros_idioma FOREIGN KEY (id_idioma) REFERENCES casj_idiomas (id_idioma),
  CONSTRAINT casj_fk_libros_anterior FOREIGN KEY (isbn_anterior) REFERENCES casj_libros (isbn),
  CONSTRAINT casj_ck_libros_tipo CHECK (tipo_narrativa IN ('NOVELA', 'CUENTO', 'MITO', 'FABULA', 'LEYENDA', 'EPOPEYA')),
  CONSTRAINT casj_ck_libros_pag CHECK (cantidad_pag > 0)
);

-- ============================================================
-- 17. casj_libro_autor (Tipo E)
-- ============================================================
CREATE TABLE casj_libro_autor (
  isbn     VARCHAR2(20) NOT NULL,
  id_autor NUMBER(8)    NOT NULL,
  CONSTRAINT casj_pk_libro_autor PRIMARY KEY (isbn, id_autor),
  CONSTRAINT casj_fk_la_libro FOREIGN KEY (isbn) REFERENCES casj_libros (isbn),
  CONSTRAINT casj_fk_la_autor FOREIGN KEY (id_autor) REFERENCES casj_autores (id_autor)
);

-- ============================================================
-- 18. casj_preferencias_miembro (Tipo E)
-- ============================================================
CREATE TABLE casj_preferencias_miembro (
  id_miembro NUMBER(8)    NOT NULL,
  orden      NUMBER(3)    NOT NULL,
  isbn       VARCHAR2(20) NOT NULL,
  CONSTRAINT casj_pk_pref_miembro PRIMARY KEY (id_miembro, isbn, orden),
  CONSTRAINT casj_fk_pref_miembro FOREIGN KEY (id_miembro) REFERENCES casj_miembros_lectores (id_miembro),
  CONSTRAINT casj_fk_pref_libro FOREIGN KEY (isbn) REFERENCES casj_libros (isbn),
  CONSTRAINT casj_uq_pref_miembro_libro UNIQUE (id_miembro, isbn),
  CONSTRAINT casj_ck_pref_orden CHECK (orden > 0 AND orden < 4)
);

-- ============================================================
-- 19. casj_obras (Tipo E)
-- ============================================================
CREATE TABLE casj_obras (
  id_obra       NUMBER(6)     NOT NULL,
  id_club       NUMBER(7)     NOT NULL,
  titulo        VARCHAR2(200) NOT NULL,
  costo_entrada NUMBER(10,2)  NOT NULL,
  estatus       VARCHAR2(1)   NOT NULL,
  CONSTRAINT casj_pk_obras PRIMARY KEY (id_obra),
  CONSTRAINT casj_fk_obras_club FOREIGN KEY (id_club) REFERENCES casj_clubes (id_club),
  CONSTRAINT casj_ck_obras_costo CHECK (costo_entrada >= 0),
  CONSTRAINT casj_ck_obras_estatus CHECK (estatus IN ('A', 'I', 'P'))
);

-- ============================================================
-- 20. casj_libro_obra (Tipo E)
-- ============================================================
CREATE TABLE casj_libro_obra (
  isbn    VARCHAR2(20) NOT NULL,
  id_obra NUMBER(6)    NOT NULL,
  CONSTRAINT casj_pk_libro_obra PRIMARY KEY (isbn, id_obra),
  CONSTRAINT casj_fk_lo_libro FOREIGN KEY (isbn) REFERENCES casj_libros (isbn),
  CONSTRAINT casj_fk_lo_obra FOREIGN KEY (id_obra) REFERENCES casj_obras (id_obra)
);

-- ============================================================
-- 21. casj_elenco (Tipo E)
-- ============================================================
CREATE TABLE casj_elenco (
  id_obra    NUMBER(6) NOT NULL,
  id_miembro NUMBER(8) NOT NULL,
  CONSTRAINT casj_pk_elenco PRIMARY KEY (id_obra, id_miembro),
  CONSTRAINT casj_fk_elenco_obra FOREIGN KEY (id_obra) REFERENCES casj_obras (id_obra),
  CONSTRAINT casj_fk_elenco_miembro FOREIGN KEY (id_miembro) REFERENCES casj_miembros_lectores (id_miembro)
);

-- ============================================================
-- 22. casj_presentaciones (Tipo S)
-- ============================================================
CREATE TABLE casj_presentaciones (
  id_obra           NUMBER(6)  NOT NULL,
  fecha             DATE       NOT NULL,
  valoracion        NUMBER(1)  NOT NULL,
  entradas_vendidas NUMBER(3)  NOT NULL,
  CONSTRAINT casj_pk_presentaciones PRIMARY KEY (id_obra, fecha),
  CONSTRAINT casj_fk_pres_obra FOREIGN KEY (id_obra) REFERENCES casj_obras (id_obra),
  CONSTRAINT casj_ck_pres_val CHECK (valoracion > 0 AND valoracion < 6),
  CONSTRAINT casj_ck_pres_entradas CHECK (entradas_vendidas >= 0)
);

-- ============================================================
-- 23. casj_mejor_actor (Tipo E)
-- ============================================================
CREATE TABLE casj_mejor_actor (
  id_obra            NUMBER(6) NOT NULL,
  fecha_presentacion DATE      NOT NULL,
  id_miembro         NUMBER(8) NOT NULL,
  CONSTRAINT casj_pk_mejor_actor PRIMARY KEY (id_obra, fecha_presentacion, id_miembro),
  CONSTRAINT casj_fk_ma_presentacion FOREIGN KEY (id_obra, fecha_presentacion)
    REFERENCES casj_presentaciones (id_obra, fecha),
  CONSTRAINT casj_fk_ma_elenco FOREIGN KEY (id_obra, id_miembro)
    REFERENCES casj_elenco (id_obra, id_miembro)
);

-- ============================================================
-- 24. casj_calendario_reunion_mes (Tipo E-S)
-- ============================================================
CREATE TABLE casj_calendario_reunion_mes (
  id_club              NUMBER(7)     NOT NULL,
  id_grupo             NUMBER(3)     NOT NULL,
  isbn                 VARCHAR2(20)  NOT NULL,
  fecha_reunion        DATE          NOT NULL,
  id_miembro_moderador NUMBER(8)     NOT NULL,
  fecha_asignacion     DATE          NOT NULL,
  conclusiones         VARCHAR2(300),
  valoracion_final     NUMBER(1),
  realizada            CHAR(1)       NOT NULL,
  ultima_reunion       CHAR(1)       NOT NULL,
  CONSTRAINT casj_pk_cal_reunion PRIMARY KEY (id_club, id_grupo, fecha_reunion),
  CONSTRAINT casj_fk_cal_grupo FOREIGN KEY (id_club, id_grupo)
    REFERENCES casj_grupos_lectura (id_club, id_grupo),
  CONSTRAINT casj_fk_cal_libro FOREIGN KEY (isbn) REFERENCES casj_libros (isbn),
  CONSTRAINT casj_fk_cal_moderador FOREIGN KEY (id_miembro_moderador)
    REFERENCES casj_miembros_lectores (id_miembro),
  CONSTRAINT casj_fk_cal_asignacion FOREIGN KEY (id_club, id_grupo, id_miembro_moderador, fecha_asignacion)
    REFERENCES casj_asignaciones (id_club, id_grupo, id_miembro, fecha_inicio),
  CONSTRAINT casj_ck_cal_realizada CHECK (realizada IN ('S', 'N')),
  CONSTRAINT casj_ck_cal_ultima CHECK (ultima_reunion IN ('S', 'N')),
  CONSTRAINT casj_ck_cal_val CHECK (valoracion_final IS NULL OR valoracion_final BETWEEN 1 AND 5)
);

-- ============================================================
-- 25. casj_inasistencias (Tipo E-S)
-- ============================================================
CREATE TABLE casj_inasistencias (
  id_club       NUMBER(7) NOT NULL,
  id_grupo      NUMBER(3) NOT NULL,
  fecha_reunion DATE      NOT NULL,
  id_miembro    NUMBER(8) NOT NULL,
  asistencia    CHAR(1)   NOT NULL,
  CONSTRAINT casj_pk_inasistencias PRIMARY KEY (id_club, id_grupo, fecha_reunion, id_miembro),
  CONSTRAINT casj_fk_ina_cal FOREIGN KEY (id_club, id_grupo, fecha_reunion)
    REFERENCES casj_calendario_reunion_mes (id_club, id_grupo, fecha_reunion),
  CONSTRAINT casj_fk_ina_miembro FOREIGN KEY (id_miembro) REFERENCES casj_miembros_lectores (id_miembro),
  CONSTRAINT casj_ck_ina_asistencia CHECK (asistencia IN ('S', 'N'))
);

