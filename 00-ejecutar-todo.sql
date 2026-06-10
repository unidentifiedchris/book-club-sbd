-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 00_ejecutar_todo.sql
-- Descripcion: Script principal que orquesta la creacion del BD
-- Prefijo: CASJ_
-- MBD: Oracle
-- ============================================================

SPOOL ejecucion_proyecto.log

PROMPT ============================================================
PROMPT INICIANDO CREACION DE BASE DE DATOS CLUBES DE LECTURA
PROMPT ============================================================

PROMPT ============================================================
PROMPT 1. Creando Secuencias
PROMPT ============================================================
@@01_secuencias.sql

PROMPT ============================================================
PROMPT 2. Creando Tablas
PROMPT ============================================================
@@02_tablas.sql

PROMPT ============================================================
PROMPT 3. Creando Indices
PROMPT ============================================================
@@03_indices.sql

PROMPT ============================================================
PROMPT 4. Creando Vistas
PROMPT ============================================================
@@04_vistas.sql

PROMPT ============================================================
PROMPT 5. Creando Funciones
PROMPT ============================================================
@@05_funciones.sql

PROMPT ============================================================
PROMPT 6. Insertando Datos
PROMPT ============================================================
@@06_inserts.sql

PROMPT ============================================================
PROMPT 7. Configurando Seguridad Logica
PROMPT ============================================================
-- Se omite la seguridad por instruccion del usuario
-- @@07_seguridad.sql

PROMPT ============================================================
PROMPT EJECUCION COMPLETADA
PROMPT Revisar archivo ejecucion_proyecto.log para detalles
PROMPT ============================================================

SPOOL OFF
