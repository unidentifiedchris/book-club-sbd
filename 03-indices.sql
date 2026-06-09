-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL (NUEVO MODELO)
-- Archivo: 03_indices.sql
-- Descripcion: Indices adicionales (FK y columnas frecuentes)
-- Oracle NO crea indices automaticos en columnas FK
-- Prefijo: CASJ_
-- ============================================================

-- ============================================================
-- INDICES EN COLUMNAS FK (mejora JOIN performance)
-- ============================================================

-- CASJ_CIUDAD
CREATE INDEX CASJ_IDX_CIUDAD_PAIS ON CASJ_CIUDAD (id_pais);

-- CASJ_CLUB
CREATE INDEX CASJ_IDX_CLUB_CIUDAD ON CASJ_CLUB (id_ciudad);
CREATE INDEX CASJ_IDX_CLUB_INST ON CASJ_CLUB (id_institucion);

-- CASJ_ASOCIADOS
CREATE INDEX CASJ_IDX_ASOC_CLUB2 ON CASJ_ASOCIADOS (id_club_2);

-- CASJ_IDIOMA_CLUB_LECTOR
CREATE INDEX CASJ_IDX_ICL_IDIOMA ON CASJ_IDIOMA_CLUB_LECTOR (id_idioma);

-- CASJ_MIEMBRO
CREATE INDEX CASJ_IDX_MIEMBRO_REPR ON CASJ_MIEMBRO (id_representante);

-- CASJ_MIEMBRO_NACIONALIDAD
CREATE INDEX CASJ_IDX_MN_PAIS ON CASJ_MIEMBRO_NACIONALIDAD (id_pais);

-- CASJ_GRUPO_LECTURA
CREATE INDEX CASJ_IDX_GRUPO_CLUB ON CASJ_GRUPO_LECTURA (id_club);

-- CASJ_ASIGNACION
CREATE INDEX CASJ_IDX_ASIG_MIEMBRO ON CASJ_ASIGNACION (id_miembro);

-- CASJ_HISTORICO_MEMBRESIA
CREATE INDEX CASJ_IDX_HIST_MIEMBRO ON CASJ_HISTORICO_MEMBRESIA (id_miembro);
CREATE INDEX CASJ_IDX_HIST_ACTIVO ON CASJ_HISTORICO_MEMBRESIA (activo);

-- CASJ_PAGO_MEMBRESIA
CREATE INDEX CASJ_IDX_PAGO_MIEMBRO ON CASJ_PAGO_MEMBRESIA (id_miembro);

-- CASJ_PREFERENCIA_MIEMBRO
CREATE INDEX CASJ_IDX_PREF_LIBRO ON CASJ_PREFERENCIA_MIEMBRO (ISBN);

-- CASJ_LIBRO_AUTOR
CREATE INDEX CASJ_IDX_LA_AUTOR ON CASJ_LIBRO_AUTOR (id_autor);


-- CASJ_LIBRO_OBRA
CREATE INDEX CASJ_IDX_LOB_OBRA ON CASJ_LIBRO_OBRA (id_obra);

-- CASJ_ELENCO
CREATE INDEX CASJ_IDX_ELENCO_OBRA ON CASJ_ELENCO (id_obra);

-- CASJ_PRESENTACION

-- CASJ_MEJOR_ACTOR
CREATE INDEX CASJ_IDX_MA_MIEMBRO ON CASJ_MEJOR_ACTOR (id_miembro);

-- CASJ_CALENDARIO_REUNION_MES
CREATE INDEX CASJ_IDX_CAL_GRUPO ON CASJ_CALENDARIO_REUNION_MES (id_grupo);
CREATE INDEX CASJ_IDX_CAL_LIBRO ON CASJ_CALENDARIO_REUNION_MES (ISBN);
CREATE INDEX CASJ_IDX_CAL_FECHA ON CASJ_CALENDARIO_REUNION_MES (fecha);

-- CASJ_INASISTENCIA
CREATE INDEX CASJ_IDX_INASIS_MIEMBRO ON CASJ_INASISTENCIA (id_miembro);

-- ============================================================
-- INDICES EN COLUMNAS FRECUENTEMENTE CONSULTADAS
-- ============================================================

-- Busqueda por nombre/apellido de miembro
CREATE INDEX CASJ_IDX_MIEMBRO_NOMBRE ON CASJ_MIEMBRO (primer_apellido, primer_nombre);

-- Busqueda por doc_identidad de miembro
CREATE INDEX CASJ_IDX_MIEMBRO_DOC ON CASJ_MIEMBRO (doc_identidad);

-- Busqueda por titulo de libro
CREATE INDEX CASJ_IDX_LIBRO_TITULO ON CASJ_LIBRO (titulo);

-- ============================================================
-- VERIFICACION
-- ============================================================
SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE index_name LIKE 'CASJ_%'
ORDER BY table_name, index_name;
