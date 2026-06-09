-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 06_inserts.sql
-- Descripcion: Inserts para todas las tablas tipo E y E-S
-- Prefijo: CASJ_
-- ============================================================
SET DEFINE OFF;

-- ============================================================
-- 1. CASJ_PAIS (Tipo E)
-- ============================================================
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (1, 'Japon', 'Japones', 'ASIA', 'NO');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (2, 'Brasil', 'Brasileno', 'AMERICA', 'NO');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (3, 'Canada', 'Canadiense', 'AMERICA', 'NO');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (4, 'Italia', 'Italiano', 'EUROPA', 'SI');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (5, 'Francia', 'Frances', 'EUROPA', 'SI');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (6, 'Alemania', 'Aleman', 'EUROPA', 'SI');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (7, 'Mexico', 'Mexicano', 'AMERICA', 'NO');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (8, 'Colombia', 'Colombiano', 'AMERICA', 'NO');
INSERT INTO CASJ_PAIS (id_pais, nombre, nacionalidad, continente, union_europea) VALUES (9, 'Argentina', 'Argentino', 'AMERICA', 'NO');

-- ============================================================
-- 2. CASJ_CIUDAD (Tipo E)
-- ============================================================
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (1, 1, 'Tokio');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (2, 1, 'Osaka');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (3, 2, 'Sao Paulo');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (4, 2, 'Rio de Janeiro');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (5, 3, 'Montreal');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (6, 3, 'Vancouver');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (7, 4, 'Milan');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (8, 4, 'Florencia');
INSERT INTO CASJ_CIUDAD (id_ciudad, id_pais, nombre) VALUES (9, 5, 'Paris');

-- ============================================================
-- 3. CASJ_INSTITUCION (Tipo E)
-- ============================================================
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (1, 1, 'Biblioteca Central de Tokio');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (2, 2, 'Universidad de Osaka');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (3, 3, 'Centro Cultural Sao Paulo');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (4, 4, 'Biblioteca Nacional de Brasil');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (5, 5, 'Montreal Community Center');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (6, 6, 'Vancouver Arts Institute');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (7, 7, 'Milano Cultura');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (8, 8, 'Accademia di Firenze');
INSERT INTO CASJ_INSTITUCION (id_institucion, id_ciudad, nombre) VALUES (9, 9, 'Institut de France');

-- ============================================================
-- 4. CASJ_CLUB_LECTOR Y CASJ_CLUB (Tipo E)
-- ============================================================
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (1, 1, 'CLUB', 'Tokio Readers Club');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (1, NULL, 'Club de lectura Tokio Readers Club', 'Lunes y Jueves', 30, 'ACTIVO', 'SI');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (2, 2, 'CLUB', 'Osaka Literary Society');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (2, 2, 'Club de lectura Osaka Literary Society', 'Lunes y Jueves', 30, 'ACTIVO', 'NO');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (3, 3, 'CLUB', 'Clube do Livro de Sao Paulo');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (3, NULL, 'Club de lectura Clube do Livro de Sao Paulo', 'Lunes y Jueves', 30, 'ACTIVO', 'SI');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (4, 4, 'CLUB', 'Leituras Cariocas');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (4, 4, 'Club de lectura Leituras Cariocas', 'Lunes y Jueves', 30, 'ACTIVO', 'NO');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (5, 5, 'CLUB', 'Montreal Bookworms');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (5, NULL, 'Club de lectura Montreal Bookworms', 'Lunes y Jueves', 30, 'ACTIVO', 'SI');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (6, 6, 'CLUB', 'Vancouver Pages');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (6, NULL, 'Club de lectura Vancouver Pages', 'Lunes y Jueves', 30, 'ACTIVO', 'SI');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (7, 7, 'CLUB', 'Milano Legge');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (7, 7, 'Club de lectura Milano Legge', 'Lunes y Jueves', 30, 'ACTIVO', 'NO');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (8, 8, 'CLUB', 'Circolo di Firenze');
INSERT INTO CASJ_CLUB (id_club, id_institucion, descripcion, dias_discuten, tiempo_max_libro, estatus, cuota_membresia) VALUES (8, NULL, 'Club de lectura Circolo di Firenze', 'Lunes y Jueves', 30, 'ACTIVO', 'SI');

-- ============================================================
-- 5. CASJ_ASOCIADOS (Tipo E-S)
-- ============================================================
INSERT INTO CASJ_ASOCIADOS (id_club_ppal, id_club_asc, fecha_inicio, fecha_fin) VALUES (1, 2, TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL);
INSERT INTO CASJ_ASOCIADOS (id_club_ppal, id_club_asc, fecha_inicio, fecha_fin) VALUES (3, 4, TO_DATE('2023-02-15', 'YYYY-MM-DD'), NULL);
INSERT INTO CASJ_ASOCIADOS (id_club_ppal, id_club_asc, fecha_inicio, fecha_fin) VALUES (5, 6, TO_DATE('2023-03-10', 'YYYY-MM-DD'), NULL);

-- ============================================================
-- 6. CASJ_IDIOMA (Tipo E)
-- ============================================================
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (1, 'Espanol');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (2, 'Ingles');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (3, 'Frances');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (4, 'Japones');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (5, 'Portugues');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (6, 'Italiano');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (7, 'Aleman');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (8, 'Ruso');
INSERT INTO CASJ_IDIOMA (id_idioma, nombre) VALUES (9, 'Chino');

-- ============================================================
-- 7. CASJ_IDIOMA_CLUB_LECTOR (Tipo E)
-- ============================================================
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 1); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (4, 1); -- Japones
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 2); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (4, 2); -- Japones
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 3); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (5, 3); -- Portugues
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 4); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (5, 4); -- Portugues
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 5); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (3, 5); -- Frances
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 6); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (3, 6); -- Frances
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 7); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (6, 7); -- Italiano
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (2, 8); -- Ingles global
INSERT INTO CASJ_IDIOMA_CLUB_LECTOR (id_idioma, id_club_lector) VALUES (6, 8); -- Italiano

-- ============================================================
-- 8. CASJ_GRUPO_LECTURA (Tipo E-S)
-- ============================================================
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (1, 1, 'Grupo ADULTO Club 1', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (2, 1, 'Grupo JUVENIL Club 1', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (3, 1, 'Grupo INFANTIL Club 1', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (4, 2, 'Grupo ADULTO Club 2', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (5, 2, 'Grupo JUVENIL Club 2', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (6, 2, 'Grupo INFANTIL Club 2', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (7, 3, 'Grupo ADULTO Club 3', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (8, 3, 'Grupo JUVENIL Club 3', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (9, 3, 'Grupo INFANTIL Club 3', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (10, 4, 'Grupo ADULTO Club 4', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (11, 4, 'Grupo JUVENIL Club 4', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (12, 4, 'Grupo INFANTIL Club 4', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (13, 5, 'Grupo ADULTO Club 5', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (14, 5, 'Grupo JUVENIL Club 5', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (15, 5, 'Grupo INFANTIL Club 5', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (16, 6, 'Grupo ADULTO Club 6', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (17, 6, 'Grupo JUVENIL Club 6', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (18, 6, 'Grupo INFANTIL Club 6', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (19, 7, 'Grupo ADULTO Club 7', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (20, 7, 'Grupo JUVENIL Club 7', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (21, 7, 'Grupo INFANTIL Club 7', 'INFANTIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (22, 8, 'Grupo ADULTO Club 8', 'ADULTO', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (23, 8, 'Grupo JUVENIL Club 8', 'JUVENIL', '18:00', 20);
INSERT INTO CASJ_GRUPO_LECTURA (id_grupo, id_club, nombre, tipo, hora_discuten, cupo) VALUES (24, 8, 'Grupo INFANTIL Club 8', 'INFANTIL', '18:00', 20);

-- ============================================================
-- 9. CASJ_REPRESENTANTE (Tipo E)
-- ============================================================
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (1, 'RepNombre1', 'RepApellido1', 'rep1@mail.com', '5551231', 'Direccion Rep 1', 'DOC-REP-1');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (2, 'RepNombre2', 'RepApellido2', 'rep2@mail.com', '5551232', 'Direccion Rep 2', 'DOC-REP-2');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (3, 'RepNombre3', 'RepApellido3', 'rep3@mail.com', '5551233', 'Direccion Rep 3', 'DOC-REP-3');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (4, 'RepNombre4', 'RepApellido4', 'rep4@mail.com', '5551234', 'Direccion Rep 4', 'DOC-REP-4');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (5, 'RepNombre5', 'RepApellido5', 'rep5@mail.com', '5551235', 'Direccion Rep 5', 'DOC-REP-5');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (6, 'RepNombre6', 'RepApellido6', 'rep6@mail.com', '5551236', 'Direccion Rep 6', 'DOC-REP-6');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (7, 'RepNombre7', 'RepApellido7', 'rep7@mail.com', '5551237', 'Direccion Rep 7', 'DOC-REP-7');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (8, 'RepNombre8', 'RepApellido8', 'rep8@mail.com', '5551238', 'Direccion Rep 8', 'DOC-REP-8');
INSERT INTO CASJ_REPRESENTANTE (id_representante, primer_nombre, primer_apellido, correo, telefono, direccion, doc_identidad) VALUES (9, 'RepNombre9', 'RepApellido9', 'rep9@mail.com', '5551239', 'Direccion Rep 9', 'DOC-REP-9');

-- ============================================================
-- 10. CASJ_MIEMBRO (Tipo E)
-- ============================================================
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (9, 2, 'MIEMBRO', 'Valentina Rodriguez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (9, 1, NULL, 'Valentina', 'M', 'Rodriguez', 'A', 'M', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'user9@mail.com', 'DOC-M-9');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (10, 2, 'MIEMBRO', 'Santiago Martinez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (10, 1, NULL, 'Santiago', 'M', 'Martinez', 'A', 'M', TO_DATE('1973-05-15', 'YYYY-MM-DD'), 'user10@mail.com', 'DOC-M-10');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (11, 2, 'MIEMBRO', 'Camila Hernandez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (11, 1, 4, 'Camila', 'M', 'Hernandez', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user11@mail.com', 'DOC-M-11');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (12, 2, 'MIEMBRO', 'Mateo Lopez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (12, 1, NULL, 'Mateo', 'M', 'Lopez', 'A', 'M', TO_DATE('1993-05-15', 'YYYY-MM-DD'), 'user12@mail.com', 'DOC-M-12');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (13, 2, 'MIEMBRO', 'Isabella Gonzalez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (13, 1, NULL, 'Isabella', 'M', 'Gonzalez', 'A', 'M', TO_DATE('1978-05-15', 'YYYY-MM-DD'), 'user13@mail.com', 'DOC-M-13');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (14, 2, 'MIEMBRO', 'Leonardo Perez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (14, 1, 7, 'Leonardo', 'M', 'Perez', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user14@mail.com', 'DOC-M-14');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (15, 2, 'MIEMBRO', 'Valeria Sanchez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (15, 1, NULL, 'Valeria', 'M', 'Sanchez', 'A', 'M', TO_DATE('1977-05-15', 'YYYY-MM-DD'), 'user15@mail.com', 'DOC-M-15');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (16, 2, 'MIEMBRO', 'Diego Ramirez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (16, 1, NULL, 'Diego', 'M', 'Ramirez', 'A', 'M', TO_DATE('1974-05-15', 'YYYY-MM-DD'), 'user16@mail.com', 'DOC-M-16');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (17, 2, 'MIEMBRO', 'Mariana Torres');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (17, 1, 1, 'Mariana', 'M', 'Torres', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user17@mail.com', 'DOC-M-17');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (18, 2, 'MIEMBRO', 'Emiliano Flores');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (18, 1, NULL, 'Emiliano', 'M', 'Flores', 'A', 'M', TO_DATE('1991-05-15', 'YYYY-MM-DD'), 'user18@mail.com', 'DOC-M-18');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (19, 2, 'MIEMBRO', 'Sofia Rivera');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (19, 1, NULL, 'Sofia', 'M', 'Rivera', 'A', 'M', TO_DATE('1993-05-15', 'YYYY-MM-DD'), 'user19@mail.com', 'DOC-M-19');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (20, 2, 'MIEMBRO', 'Gabriel Gomez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (20, 1, 4, 'Gabriel', 'M', 'Gomez', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user20@mail.com', 'DOC-M-20');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (21, 3, 'MIEMBRO', 'Lucia Diaz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (21, 2, NULL, 'Lucia', 'M', 'Diaz', 'A', 'M', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'user21@mail.com', 'DOC-M-21');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (22, 3, 'MIEMBRO', 'Joaquin Cruz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (22, 2, NULL, 'Joaquin', 'M', 'Cruz', 'A', 'M', TO_DATE('1983-05-15', 'YYYY-MM-DD'), 'user22@mail.com', 'DOC-M-22');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (23, 3, 'MIEMBRO', 'Victoria Reyes');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (23, 2, 7, 'Victoria', 'M', 'Reyes', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user23@mail.com', 'DOC-M-23');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (24, 3, 'MIEMBRO', 'Daniel Morales');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (24, 2, NULL, 'Daniel', 'M', 'Morales', 'A', 'M', TO_DATE('1970-05-15', 'YYYY-MM-DD'), 'user24@mail.com', 'DOC-M-24');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (25, 3, 'MIEMBRO', 'Martina Ortiz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (25, 2, NULL, 'Martina', 'M', 'Ortiz', 'A', 'M', TO_DATE('1972-05-15', 'YYYY-MM-DD'), 'user25@mail.com', 'DOC-M-25');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (26, 3, 'MIEMBRO', 'Tomas Gutierrez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (26, 2, 1, 'Tomas', 'M', 'Gutierrez', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user26@mail.com', 'DOC-M-26');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (27, 3, 'MIEMBRO', 'Juliana Chavez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (27, 2, NULL, 'Juliana', 'M', 'Chavez', 'A', 'M', TO_DATE('1977-05-15', 'YYYY-MM-DD'), 'user27@mail.com', 'DOC-M-27');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (28, 3, 'MIEMBRO', 'Lucas Garcia');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (28, 2, NULL, 'Lucas', 'M', 'Garcia', 'A', 'M', TO_DATE('1986-05-15', 'YYYY-MM-DD'), 'user28@mail.com', 'DOC-M-28');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (29, 3, 'MIEMBRO', 'Elena Rodriguez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (29, 2, 4, 'Elena', 'M', 'Rodriguez', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user29@mail.com', 'DOC-M-29');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (30, 3, 'MIEMBRO', 'Matias Martinez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (30, 2, NULL, 'Matias', 'M', 'Martinez', 'A', 'M', TO_DATE('1987-05-15', 'YYYY-MM-DD'), 'user30@mail.com', 'DOC-M-30');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (31, 3, 'MIEMBRO', 'Daniela Hernandez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (31, 2, NULL, 'Daniela', 'M', 'Hernandez', 'A', 'M', TO_DATE('1976-05-15', 'YYYY-MM-DD'), 'user31@mail.com', 'DOC-M-31');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (32, 3, 'MIEMBRO', 'Alejandro Lopez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (32, 2, 7, 'Alejandro', 'M', 'Lopez', 'A', 'M', TO_DATE('2018-05-15', 'YYYY-MM-DD'), 'user32@mail.com', 'DOC-M-32');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (33, 4, 'MIEMBRO', 'Valentina Gonzalez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (33, 3, NULL, 'Valentina', 'M', 'Gonzalez', 'A', 'M', TO_DATE('1977-05-15', 'YYYY-MM-DD'), 'user33@mail.com', 'DOC-M-33');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (34, 4, 'MIEMBRO', 'Santiago Perez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (34, 3, NULL, 'Santiago', 'M', 'Perez', 'A', 'M', TO_DATE('1984-05-15', 'YYYY-MM-DD'), 'user34@mail.com', 'DOC-M-34');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (35, 4, 'MIEMBRO', 'Camila Sanchez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (35, 3, 1, 'Camila', 'M', 'Sanchez', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user35@mail.com', 'DOC-M-35');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (36, 4, 'MIEMBRO', 'Mateo Ramirez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (36, 3, NULL, 'Mateo', 'M', 'Ramirez', 'A', 'M', TO_DATE('1995-05-15', 'YYYY-MM-DD'), 'user36@mail.com', 'DOC-M-36');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (37, 4, 'MIEMBRO', 'Isabella Torres');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (37, 3, NULL, 'Isabella', 'M', 'Torres', 'A', 'M', TO_DATE('1997-05-15', 'YYYY-MM-DD'), 'user37@mail.com', 'DOC-M-37');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (38, 4, 'MIEMBRO', 'Leonardo Flores');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (38, 3, 4, 'Leonardo', 'M', 'Flores', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user38@mail.com', 'DOC-M-38');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (39, 4, 'MIEMBRO', 'Valeria Rivera');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (39, 3, NULL, 'Valeria', 'M', 'Rivera', 'A', 'M', TO_DATE('1994-05-15', 'YYYY-MM-DD'), 'user39@mail.com', 'DOC-M-39');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (40, 4, 'MIEMBRO', 'Diego Gomez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (40, 3, NULL, 'Diego', 'M', 'Gomez', 'A', 'M', TO_DATE('1995-05-15', 'YYYY-MM-DD'), 'user40@mail.com', 'DOC-M-40');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (41, 4, 'MIEMBRO', 'Mariana Diaz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (41, 3, 7, 'Mariana', 'M', 'Diaz', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user41@mail.com', 'DOC-M-41');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (42, 4, 'MIEMBRO', 'Emiliano Cruz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (42, 3, NULL, 'Emiliano', 'M', 'Cruz', 'A', 'M', TO_DATE('1992-05-15', 'YYYY-MM-DD'), 'user42@mail.com', 'DOC-M-42');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (43, 4, 'MIEMBRO', 'Sofia Reyes');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (43, 3, NULL, 'Sofia', 'M', 'Reyes', 'A', 'M', TO_DATE('1983-05-15', 'YYYY-MM-DD'), 'user43@mail.com', 'DOC-M-43');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (44, 4, 'MIEMBRO', 'Gabriel Morales');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (44, 3, 1, 'Gabriel', 'M', 'Morales', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user44@mail.com', 'DOC-M-44');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (45, 5, 'MIEMBRO', 'Lucia Ortiz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (45, 4, NULL, 'Lucia', 'M', 'Ortiz', 'A', 'M', TO_DATE('1978-05-15', 'YYYY-MM-DD'), 'user45@mail.com', 'DOC-M-45');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (46, 5, 'MIEMBRO', 'Joaquin Gutierrez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (46, 4, NULL, 'Joaquin', 'M', 'Gutierrez', 'A', 'M', TO_DATE('1974-05-15', 'YYYY-MM-DD'), 'user46@mail.com', 'DOC-M-46');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (47, 5, 'MIEMBRO', 'Victoria Chavez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (47, 4, 4, 'Victoria', 'M', 'Chavez', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user47@mail.com', 'DOC-M-47');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (48, 5, 'MIEMBRO', 'Daniel Garcia');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (48, 4, NULL, 'Daniel', 'M', 'Garcia', 'A', 'M', TO_DATE('2000-05-15', 'YYYY-MM-DD'), 'user48@mail.com', 'DOC-M-48');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (49, 5, 'MIEMBRO', 'Martina Rodriguez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (49, 4, NULL, 'Martina', 'M', 'Rodriguez', 'A', 'M', TO_DATE('1994-05-15', 'YYYY-MM-DD'), 'user49@mail.com', 'DOC-M-49');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (50, 5, 'MIEMBRO', 'Tomas Martinez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (50, 4, 7, 'Tomas', 'M', 'Martinez', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user50@mail.com', 'DOC-M-50');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (51, 5, 'MIEMBRO', 'Juliana Hernandez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (51, 4, NULL, 'Juliana', 'M', 'Hernandez', 'A', 'M', TO_DATE('1973-05-15', 'YYYY-MM-DD'), 'user51@mail.com', 'DOC-M-51');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (52, 5, 'MIEMBRO', 'Lucas Lopez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (52, 4, NULL, 'Lucas', 'M', 'Lopez', 'A', 'M', TO_DATE('1972-05-15', 'YYYY-MM-DD'), 'user52@mail.com', 'DOC-M-52');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (53, 5, 'MIEMBRO', 'Elena Gonzalez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (53, 4, 1, 'Elena', 'M', 'Gonzalez', 'A', 'M', TO_DATE('2018-05-15', 'YYYY-MM-DD'), 'user53@mail.com', 'DOC-M-53');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (54, 5, 'MIEMBRO', 'Matias Perez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (54, 4, NULL, 'Matias', 'M', 'Perez', 'A', 'M', TO_DATE('1973-05-15', 'YYYY-MM-DD'), 'user54@mail.com', 'DOC-M-54');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (55, 5, 'MIEMBRO', 'Daniela Sanchez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (55, 4, NULL, 'Daniela', 'M', 'Sanchez', 'A', 'M', TO_DATE('1981-05-15', 'YYYY-MM-DD'), 'user55@mail.com', 'DOC-M-55');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (56, 5, 'MIEMBRO', 'Alejandro Ramirez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (56, 4, 4, 'Alejandro', 'M', 'Ramirez', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user56@mail.com', 'DOC-M-56');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (57, 6, 'MIEMBRO', 'Valentina Torres');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (57, 5, NULL, 'Valentina', 'M', 'Torres', 'A', 'M', TO_DATE('1989-05-15', 'YYYY-MM-DD'), 'user57@mail.com', 'DOC-M-57');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (58, 6, 'MIEMBRO', 'Santiago Flores');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (58, 5, NULL, 'Santiago', 'M', 'Flores', 'A', 'M', TO_DATE('1978-05-15', 'YYYY-MM-DD'), 'user58@mail.com', 'DOC-M-58');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (59, 6, 'MIEMBRO', 'Camila Rivera');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (59, 5, 7, 'Camila', 'M', 'Rivera', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user59@mail.com', 'DOC-M-59');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (60, 6, 'MIEMBRO', 'Mateo Gomez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (60, 5, NULL, 'Mateo', 'M', 'Gomez', 'A', 'M', TO_DATE('1993-05-15', 'YYYY-MM-DD'), 'user60@mail.com', 'DOC-M-60');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (61, 6, 'MIEMBRO', 'Isabella Diaz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (61, 5, NULL, 'Isabella', 'M', 'Diaz', 'A', 'M', TO_DATE('1984-05-15', 'YYYY-MM-DD'), 'user61@mail.com', 'DOC-M-61');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (62, 6, 'MIEMBRO', 'Leonardo Cruz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (62, 5, 1, 'Leonardo', 'M', 'Cruz', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user62@mail.com', 'DOC-M-62');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (63, 6, 'MIEMBRO', 'Valeria Reyes');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (63, 5, NULL, 'Valeria', 'M', 'Reyes', 'A', 'M', TO_DATE('1999-05-15', 'YYYY-MM-DD'), 'user63@mail.com', 'DOC-M-63');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (64, 6, 'MIEMBRO', 'Diego Morales');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (64, 5, NULL, 'Diego', 'M', 'Morales', 'A', 'M', TO_DATE('1982-05-15', 'YYYY-MM-DD'), 'user64@mail.com', 'DOC-M-64');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (65, 6, 'MIEMBRO', 'Mariana Ortiz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (65, 5, 4, 'Mariana', 'M', 'Ortiz', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user65@mail.com', 'DOC-M-65');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (66, 6, 'MIEMBRO', 'Emiliano Gutierrez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (66, 5, NULL, 'Emiliano', 'M', 'Gutierrez', 'A', 'M', TO_DATE('1987-05-15', 'YYYY-MM-DD'), 'user66@mail.com', 'DOC-M-66');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (67, 6, 'MIEMBRO', 'Sofia Chavez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (67, 5, NULL, 'Sofia', 'M', 'Chavez', 'A', 'M', TO_DATE('1979-05-15', 'YYYY-MM-DD'), 'user67@mail.com', 'DOC-M-67');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (68, 6, 'MIEMBRO', 'Gabriel Garcia');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (68, 5, 7, 'Gabriel', 'M', 'Garcia', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user68@mail.com', 'DOC-M-68');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (69, 7, 'MIEMBRO', 'Lucia Rodriguez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (69, 6, NULL, 'Lucia', 'M', 'Rodriguez', 'A', 'M', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'user69@mail.com', 'DOC-M-69');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (70, 7, 'MIEMBRO', 'Joaquin Martinez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (70, 6, NULL, 'Joaquin', 'M', 'Martinez', 'A', 'M', TO_DATE('1976-05-15', 'YYYY-MM-DD'), 'user70@mail.com', 'DOC-M-70');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (71, 7, 'MIEMBRO', 'Victoria Hernandez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (71, 6, 1, 'Victoria', 'M', 'Hernandez', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user71@mail.com', 'DOC-M-71');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (72, 7, 'MIEMBRO', 'Daniel Lopez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (72, 6, NULL, 'Daniel', 'M', 'Lopez', 'A', 'M', TO_DATE('1971-05-15', 'YYYY-MM-DD'), 'user72@mail.com', 'DOC-M-72');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (73, 7, 'MIEMBRO', 'Martina Gonzalez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (73, 6, NULL, 'Martina', 'M', 'Gonzalez', 'A', 'M', TO_DATE('1991-05-15', 'YYYY-MM-DD'), 'user73@mail.com', 'DOC-M-73');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (74, 7, 'MIEMBRO', 'Tomas Perez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (74, 6, 4, 'Tomas', 'M', 'Perez', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user74@mail.com', 'DOC-M-74');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (75, 7, 'MIEMBRO', 'Juliana Sanchez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (75, 6, NULL, 'Juliana', 'M', 'Sanchez', 'A', 'M', TO_DATE('1994-05-15', 'YYYY-MM-DD'), 'user75@mail.com', 'DOC-M-75');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (76, 7, 'MIEMBRO', 'Lucas Ramirez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (76, 6, NULL, 'Lucas', 'M', 'Ramirez', 'A', 'M', TO_DATE('1979-05-15', 'YYYY-MM-DD'), 'user76@mail.com', 'DOC-M-76');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (77, 7, 'MIEMBRO', 'Elena Torres');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (77, 6, 7, 'Elena', 'M', 'Torres', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user77@mail.com', 'DOC-M-77');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (78, 7, 'MIEMBRO', 'Matias Flores');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (78, 6, NULL, 'Matias', 'M', 'Flores', 'A', 'M', TO_DATE('1997-05-15', 'YYYY-MM-DD'), 'user78@mail.com', 'DOC-M-78');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (79, 7, 'MIEMBRO', 'Daniela Rivera');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (79, 6, NULL, 'Daniela', 'M', 'Rivera', 'A', 'M', TO_DATE('1977-05-15', 'YYYY-MM-DD'), 'user79@mail.com', 'DOC-M-79');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (80, 7, 'MIEMBRO', 'Alejandro Gomez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (80, 6, 1, 'Alejandro', 'M', 'Gomez', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user80@mail.com', 'DOC-M-80');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (81, 8, 'MIEMBRO', 'Valentina Diaz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (81, 7, NULL, 'Valentina', 'M', 'Diaz', 'A', 'M', TO_DATE('1982-05-15', 'YYYY-MM-DD'), 'user81@mail.com', 'DOC-M-81');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (82, 8, 'MIEMBRO', 'Santiago Cruz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (82, 7, NULL, 'Santiago', 'M', 'Cruz', 'A', 'M', TO_DATE('1978-05-15', 'YYYY-MM-DD'), 'user82@mail.com', 'DOC-M-82');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (83, 8, 'MIEMBRO', 'Camila Reyes');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (83, 7, 4, 'Camila', 'M', 'Reyes', 'A', 'M', TO_DATE('2018-05-15', 'YYYY-MM-DD'), 'user83@mail.com', 'DOC-M-83');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (84, 8, 'MIEMBRO', 'Mateo Morales');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (84, 7, NULL, 'Mateo', 'M', 'Morales', 'A', 'M', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'user84@mail.com', 'DOC-M-84');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (85, 8, 'MIEMBRO', 'Isabella Ortiz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (85, 7, NULL, 'Isabella', 'M', 'Ortiz', 'A', 'M', TO_DATE('1996-05-15', 'YYYY-MM-DD'), 'user85@mail.com', 'DOC-M-85');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (86, 8, 'MIEMBRO', 'Leonardo Gutierrez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (86, 7, 7, 'Leonardo', 'M', 'Gutierrez', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user86@mail.com', 'DOC-M-86');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (87, 8, 'MIEMBRO', 'Valeria Chavez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (87, 7, NULL, 'Valeria', 'M', 'Chavez', 'A', 'M', TO_DATE('1975-05-15', 'YYYY-MM-DD'), 'user87@mail.com', 'DOC-M-87');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (88, 8, 'MIEMBRO', 'Diego Garcia');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (88, 7, NULL, 'Diego', 'M', 'Garcia', 'A', 'M', TO_DATE('1981-05-15', 'YYYY-MM-DD'), 'user88@mail.com', 'DOC-M-88');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (89, 8, 'MIEMBRO', 'Mariana Rodriguez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (89, 7, 1, 'Mariana', 'M', 'Rodriguez', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user89@mail.com', 'DOC-M-89');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (90, 8, 'MIEMBRO', 'Emiliano Martinez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (90, 7, NULL, 'Emiliano', 'M', 'Martinez', 'A', 'M', TO_DATE('1976-05-15', 'YYYY-MM-DD'), 'user90@mail.com', 'DOC-M-90');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (91, 8, 'MIEMBRO', 'Sofia Hernandez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (91, 7, NULL, 'Sofia', 'M', 'Hernandez', 'A', 'M', TO_DATE('1991-05-15', 'YYYY-MM-DD'), 'user91@mail.com', 'DOC-M-91');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (92, 8, 'MIEMBRO', 'Gabriel Lopez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (92, 7, 4, 'Gabriel', 'M', 'Lopez', 'A', 'M', TO_DATE('2017-05-15', 'YYYY-MM-DD'), 'user92@mail.com', 'DOC-M-92');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (93, 9, 'MIEMBRO', 'Lucia Gonzalez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (93, 8, NULL, 'Lucia', 'M', 'Gonzalez', 'A', 'M', TO_DATE('1992-05-15', 'YYYY-MM-DD'), 'user93@mail.com', 'DOC-M-93');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (94, 9, 'MIEMBRO', 'Joaquin Perez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (94, 8, NULL, 'Joaquin', 'M', 'Perez', 'A', 'M', TO_DATE('1999-05-15', 'YYYY-MM-DD'), 'user94@mail.com', 'DOC-M-94');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (95, 9, 'MIEMBRO', 'Victoria Sanchez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (95, 8, 7, 'Victoria', 'M', 'Sanchez', 'A', 'M', TO_DATE('2015-05-15', 'YYYY-MM-DD'), 'user95@mail.com', 'DOC-M-95');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (96, 9, 'MIEMBRO', 'Daniel Ramirez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (96, 8, NULL, 'Daniel', 'M', 'Ramirez', 'A', 'M', TO_DATE('1989-05-15', 'YYYY-MM-DD'), 'user96@mail.com', 'DOC-M-96');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (97, 9, 'MIEMBRO', 'Martina Torres');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (97, 8, NULL, 'Martina', 'M', 'Torres', 'A', 'M', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'user97@mail.com', 'DOC-M-97');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (98, 9, 'MIEMBRO', 'Tomas Flores');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (98, 8, 1, 'Tomas', 'M', 'Flores', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user98@mail.com', 'DOC-M-98');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (99, 9, 'MIEMBRO', 'Juliana Rivera');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (99, 8, NULL, 'Juliana', 'M', 'Rivera', 'A', 'M', TO_DATE('1987-05-15', 'YYYY-MM-DD'), 'user99@mail.com', 'DOC-M-99');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (100, 9, 'MIEMBRO', 'Lucas Gomez');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (100, 8, NULL, 'Lucas', 'M', 'Gomez', 'A', 'M', TO_DATE('1993-05-15', 'YYYY-MM-DD'), 'user100@mail.com', 'DOC-M-100');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (101, 9, 'MIEMBRO', 'Elena Diaz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (101, 8, 4, 'Elena', 'M', 'Diaz', 'A', 'M', TO_DATE('2016-05-15', 'YYYY-MM-DD'), 'user101@mail.com', 'DOC-M-101');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (102, 9, 'MIEMBRO', 'Matias Cruz');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (102, 8, NULL, 'Matias', 'M', 'Cruz', 'A', 'M', TO_DATE('1975-05-15', 'YYYY-MM-DD'), 'user102@mail.com', 'DOC-M-102');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (103, 9, 'MIEMBRO', 'Daniela Reyes');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (103, 8, NULL, 'Daniela', 'M', 'Reyes', 'A', 'M', TO_DATE('1984-05-15', 'YYYY-MM-DD'), 'user103@mail.com', 'DOC-M-103');
INSERT INTO CASJ_CLUB_LECTOR (id_club_lector, id_ciudad, tipo, nombre) VALUES (104, 9, 'MIEMBRO', 'Alejandro Morales');
INSERT INTO CASJ_MIEMBRO (id_miembro, id_club, id_representante, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, correo, doc_identidad) VALUES (104, 8, 7, 'Alejandro', 'M', 'Morales', 'A', 'M', TO_DATE('2018-05-15', 'YYYY-MM-DD'), 'user104@mail.com', 'DOC-M-104');

-- ============================================================
-- 11. CASJ_AUTOR (Tipo E)
-- ============================================================
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (1, 'Margaret', 'Weis', 'M. Weis');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (2, 'Tracy', 'Hickman', 'T. Hickman');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (3, 'Stanislaw', 'Lem', 'S. Lem');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (4, 'Dashiell', 'Hammett', 'D. Hammett');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (5, 'Gustavo Adolfo', 'Becquer', 'G.A. Becquer');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (6, 'Nicholas', 'Sparks', 'N. Sparks');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (7, 'Alexandre', 'Dumas', 'A. Dumas');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (8, 'Gunter', 'Grass', 'G. Grass');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (9, 'Anthony', 'Burgess', 'A. Burgess');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (10, 'Sheridan', 'Le Fanu', 'J.S. Le Fanu');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (11, 'Miguel', 'de Unamuno', 'M. Unamuno');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (12, 'Homero', 'Anomino', 'Homero');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (13, 'Juan', 'Rulfo', 'J. Rulfo');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (14, 'Friedrich', 'Nietzsche', 'F. Nietzsche');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (15, 'Johann Wolfgang', 'von Goethe', 'Goethe');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (16, 'Roald', 'Dahl', 'R. Dahl');
INSERT INTO CASJ_AUTOR (id_autor, nombre, apellido, seudonimo) VALUES (17, 'Haruki', 'Murakami', 'H. Murakami');

-- ============================================================
-- 12. CASJ_LIBRO (Tipo E)
-- ============================================================
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000001, 'La senda de la profecia', 1982, 350, 'NOVELA', 'Fantasia, Magia', 'Inicio de Belgarath');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000002, 'La reina de la hechiceria', 1982, 380, 'NOVELA', 'Fantasia, Magia', 'Secuela de Belgarath');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000003, 'La luz del orbe', 1983, 390, 'NOVELA', 'Fantasia, Magia', 'Tercero de Belgarath');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000004, 'Solaris', 1961, 280, 'NOVELA', 'Ciencia Ficcion, Espacio', 'Oceano viviente');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000005, 'El halcon maltes', 1930, 250, 'NOVELA', 'Negra, Detectives', 'Sam Spade busca estatuilla');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000006, 'Leyendas', 1858, 200, 'LEYENDA', 'Gotico, Romance', 'Historias folcloricas y sobrenaturales');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000007, 'El cuaderno de Noah', 1996, 210, 'NOVELA', 'Romance, Drama', 'Amor eterno');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000008, 'El conde de Montecristo', 1844, 1200, 'NOVELA', 'Aventura, Venganza', 'Dantes se venga');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000009, 'El tambor de hojalata', 1959, 500, 'NOVELA', 'Realismo Magico', 'Nino decide no crecer');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000010, 'La naranja mecanica', 1962, 200, 'NOVELA', 'Distopia, Violencia', 'Alex y sus drugos');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000011, 'Carmilla', 1872, 110, 'NOVELA', 'Terror, Vampiros', 'Vampira en Austria');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000012, 'Niebla', 1914, 230, 'NOVELA', 'Clasico, Filosofia', 'Nivola de Augusto Perez');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000013, 'La Odisea', 100, 400, 'EPOPEYA', 'Mitologia, Aventura', 'Regreso de Odiseo');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000014, 'El llano en llamas', 1953, 150, 'CUENTO', 'Realismo, Cuentos', 'Cuentos mexicanos');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000015, 'Asi hablo Zaratustra', 1883, 300, 'MITO', 'Filosofia, Superhombre', 'Ensenanzas del profeta');
INSERT INTO CASJ_LIBRO (ISBN, titulo, anio_publicacion, cantidad_pag, tipo_narrativa, temas_resumen, sinopsis) VALUES (9780000000016, 'Matilda', 1988, 240, 'FABULA', 'Infantil, Magia', 'Nina con poderes');

-- ============================================================
-- 13. CASJ_LIBRO_ORDEN (Tipo E) (Relacion recursiva)
-- ============================================================
INSERT INTO CASJ_LIBRO_ORDEN (ISBN_anterior, ISBN_siguiente, numero_orden) VALUES (9780000000001, 9780000000002, 1);
INSERT INTO CASJ_LIBRO_ORDEN (ISBN_anterior, ISBN_siguiente, numero_orden) VALUES (9780000000002, 9780000000003, 2);

-- ============================================================
-- 14. CASJ_LIBRO_AUTOR (Tipo E)
-- ============================================================
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000001, 1);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000001, 2);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000002, 1);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000002, 2);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000003, 1);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000003, 2);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000004, 3);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000005, 4);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000006, 5);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000007, 6);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000008, 7);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000009, 8);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000010, 9);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000011, 10);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000012, 11);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000013, 12);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000014, 13);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000015, 14);
INSERT INTO CASJ_LIBRO_AUTOR (ISBN, id_autor) VALUES (9780000000016, 16);

-- ============================================================
-- 15. CASJ_OBRA (Tipo E)
-- ============================================================
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (1, 'Obra Teatral 1', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (2, 'Obra Teatral 2', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (3, 'Obra Teatral 3', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (4, 'Obra Teatral 4', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (5, 'Obra Teatral 5', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (6, 'Obra Teatral 6', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (7, 'Obra Teatral 7', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (8, 'Obra Teatral 8', 15.00, 'ACTIVA');
INSERT INTO CASJ_OBRA (id_obra, titulo, costo_entrada, estatus) VALUES (9, 'Obra Teatral 9', 15.00, 'ACTIVA');

-- ============================================================
-- 16. CASJ_LIBRO_OBRA (Tipo E)
-- ============================================================
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000001, 1);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000002, 2);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000003, 3);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000004, 4);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000005, 5);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000006, 6);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000007, 7);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000008, 8);
INSERT INTO CASJ_LIBRO_OBRA (ISBN, id_obra) VALUES (9780000000009, 9);

-- ============================================================
-- 17. CASJ_PRESENTACION (Tipo S)
-- ============================================================
INSERT INTO CASJ_PRESENTACION (id_presentacion, id_obra, fecha, valoracion, entradas_vendidas) VALUES (1, 1, TO_DATE('2026-05-11', 'YYYY-MM-DD'), 4.5, 100);
INSERT INTO CASJ_PRESENTACION (id_presentacion, id_obra, fecha, valoracion, entradas_vendidas) VALUES (2, 2, TO_DATE('2026-05-12', 'YYYY-MM-DD'), 4.5, 100);
INSERT INTO CASJ_PRESENTACION (id_presentacion, id_obra, fecha, valoracion, entradas_vendidas) VALUES (3, 3, TO_DATE('2026-05-13', 'YYYY-MM-DD'), 4.5, 100);
INSERT INTO CASJ_PRESENTACION (id_presentacion, id_obra, fecha, valoracion, entradas_vendidas) VALUES (4, 4, TO_DATE('2026-05-14', 'YYYY-MM-DD'), 4.5, 100);

-- ============================================================
-- 18. CASJ_ELENCO y MEJOR_ACTOR
-- ============================================================
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (9, 1, 'PRINCIPAL', 'Personaje 9');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (10, 1, 'PRINCIPAL', 'Personaje 10');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (11, 1, 'PRINCIPAL', 'Personaje 11');
INSERT INTO CASJ_MEJOR_ACTOR (id_presentacion, id_miembro) VALUES (1, 9);
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (9, 2, 'PRINCIPAL', 'Personaje 9');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (10, 2, 'PRINCIPAL', 'Personaje 10');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (11, 2, 'PRINCIPAL', 'Personaje 11');
INSERT INTO CASJ_MEJOR_ACTOR (id_presentacion, id_miembro) VALUES (2, 9);
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (9, 3, 'PRINCIPAL', 'Personaje 9');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (10, 3, 'PRINCIPAL', 'Personaje 10');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (11, 3, 'PRINCIPAL', 'Personaje 11');
INSERT INTO CASJ_MEJOR_ACTOR (id_presentacion, id_miembro) VALUES (3, 9);
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (9, 4, 'PRINCIPAL', 'Personaje 9');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (10, 4, 'PRINCIPAL', 'Personaje 10');
INSERT INTO CASJ_ELENCO (id_miembro, id_obra, rol, nombre_personaje) VALUES (11, 4, 'PRINCIPAL', 'Personaje 11');
INSERT INTO CASJ_MEJOR_ACTOR (id_presentacion, id_miembro) VALUES (4, 9);

-- ============================================================
-- 19. CASJ_ASIGNACION
-- ============================================================
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000001, 1, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000002, 2, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000003, 3, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000004, 4, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000005, 5, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000006, 6, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000007, 7, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000008, 8, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000009, 9, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000010, 10, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000011, 11, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000012, 12, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000013, 13, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000014, 14, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000015, 15, TO_DATE('2026-01-01', 'YYYY-MM-DD'));
INSERT INTO CASJ_ASIGNACION (ISBN, id_grupo, fecha) VALUES (9780000000016, 16, TO_DATE('2026-01-01', 'YYYY-MM-DD'));

-- ============================================================
-- 20. CASJ_CALENDARIO_REUNION_MES e INASISTENCIA
-- ============================================================
INSERT INTO CASJ_CALENDARIO_REUNION_MES (id_calendario, id_grupo, ISBN, sesion, fecha_encuentro, estatus, valoracion) VALUES (1, 1, 9780000000001, 1, TO_DATE('2026-01-10', 'YYYY-MM-DD'), 'EFECTUADA', 4);
INSERT INTO CASJ_CALENDARIO_REUNION_MES (id_calendario, id_grupo, ISBN, sesion, fecha_encuentro, estatus, valoracion) VALUES (2, 1, 9780000000001, 2, TO_DATE('2026-01-24', 'YYYY-MM-DD'), 'EFECTUADA', 5);
INSERT INTO CASJ_INASISTENCIA (id_calendario, id_miembro) VALUES (1, 9);

-- ============================================================
-- 21. CASJ_HISTORICO_MEMBRESIA y CASJ_PAGO_MEMBRESIA
-- ============================================================
INSERT INTO CASJ_HISTORICO_MEMBRESIA (id_club, id_miembro, fecha_fin, motivo_salida) VALUES (1, 9, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'VOLUNTARIO');
INSERT INTO CASJ_PAGO_MEMBRESIA (id_pago, id_club, id_miembro, fecha_inicio, fecha_pago) VALUES (1, 1, 9, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-05', 'YYYY-MM-DD'));

COMMIT;
PROMPT >>> INSERTS COMPLETADOS EXITOSAMENTE.
