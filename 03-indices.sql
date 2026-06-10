-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 03_indices.sql
-- Descripcion: Indices adicionales para FK y columnas frecuentes
-- Prefijo: CASJ_
-- MBD: Oracle
-- ============================================================

-- Indices del esquema reconciliado del grupo
CREATE INDEX casj_ix_ciudades_pais   ON casj_ciudades (id_pais);
CREATE INDEX casj_ix_clubes_ciudad   ON casj_clubes (id_ciudad);
CREATE INDEX casj_ix_clubes_inst     ON casj_clubes (id_institucion);
CREATE INDEX casj_ix_hm_club         ON casj_historico_membresia (id_club);
CREATE INDEX casj_ix_asig_miembro    ON casj_asignaciones (id_miembro);
CREATE INDEX casj_ix_libros_pais     ON casj_libros (id_pais_publicacion);
CREATE INDEX casj_ix_libros_idioma   ON casj_libros (id_idioma);
CREATE INDEX casj_ix_obras_club      ON casj_obras (id_club);
CREATE INDEX casj_ix_cal_libro       ON casj_calendario_reunion_mes (isbn);
CREATE INDEX casj_ix_miembros_nombre ON casj_miembros_lectores (primer_apellido, primer_nombre);
CREATE INDEX casj_ix_libros_titulo   ON casj_libros (titulo);

-- ============================================================
-- VERIFICACION
-- ============================================================
SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE UPPER(index_name) LIKE 'CASJ_%'
ORDER BY table_name, index_name;

