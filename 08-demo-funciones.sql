-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 08_demo_funciones.sql
-- Descripcion: Script de demostracion para la defensa (Rubrica 2 I)
-- Ejecutar DESPUES de 00_ejecutar_todo.sql
-- Prefijo: CASJ_
-- ============================================================

-- Activar output para ver los resultados de DBMS_OUTPUT
SET SERVEROUTPUT ON SIZE UNLIMITED;

PROMPT
PROMPT ============================================================
PROMPT     DEMOSTRACION DE FUNCIONES - RUBRICA 2 PARTE I
PROMPT     Equipo: Christopher, Andres, Salome, Jose (CASJ)
PROMPT ============================================================
PROMPT

-- ============================================================
-- DEMO 1: CONVERSION MONETARIA
-- ============================================================
PROMPT ============================================================
PROMPT DEMO 1: Conversion Monetaria
PROMPT ============================================================
PROMPT

-- 1a. Convertir 100 USD a Bolivares (desde Venezuela)
EXEC CASJ_SP_CONVERTIR_MONEDA(100, 'Venezuela');

PROMPT ---
PROMPT

-- 1b. Convertir 5000 Pesos Mexicanos a USD
EXEC CASJ_SP_CONVERTIR_MONEDA(5000, 'Mexico');

PROMPT ---
PROMPT

-- 1c. Convertir 250 Euros a USD (usando codigo de moneda directo)
EXEC CASJ_SP_CONVERTIR_MONEDA(250, 'EUR');

PROMPT ---
PROMPT

-- 1d. Convertir cuota de membresia ($100 USD) a moneda de Colombia
EXEC CASJ_SP_CONVERTIR_MONEDA(100, 'USD', 'COP');

-- ============================================================
-- DEMO 2: EDAD Y ANTIGUEDAD DE MIEMBRO
-- ============================================================
PROMPT
PROMPT ============================================================
PROMPT DEMO 2: Edad y Antiguedad de Miembro
PROMPT ============================================================
PROMPT

-- 2a. Primero ver la lista de miembros (sin parametros)
EXEC CASJ_SP_INFO_MIEMBRO();

PROMPT ---
PROMPT

-- 2b. Consultar un miembro adulto especifico (usar los nombres del listado)
EXEC CASJ_SP_INFO_MIEMBRO('Alejandro', 'Garcia');

PROMPT ---
PROMPT

-- 2c. Consultar un miembro juvenil
EXEC CASJ_SP_INFO_MIEMBRO('Tomas', 'Garcia');

-- ============================================================
-- DEMO 3: % PROMEDIO PARTICIPACION MENSUAL POR TIPO DE GRUPO
-- ============================================================
PROMPT
PROMPT ============================================================
PROMPT DEMO 3: Promedio Participacion Mensual por Tipo de Grupo
PROMPT ============================================================
PROMPT

-- 3a. Primero ver opciones disponibles (sin parametros)
EXEC CASJ_SP_PARTICIPACION_MENSUAL();

PROMPT ---
PROMPT

-- 3b. Ver participacion de grupos ADULTOS en Enero 2026
EXEC CASJ_SP_PARTICIPACION_MENSUAL('ADULTO', 1, 2026);

PROMPT ---
PROMPT

-- 3c. Ver participacion de grupos JUVENILES en Enero 2026
EXEC CASJ_SP_PARTICIPACION_MENSUAL('JUVENIL', 1, 2026);

PROMPT ---
PROMPT

-- 3d. Ver participacion de grupos INFANTILES en Enero 2026
EXEC CASJ_SP_PARTICIPACION_MENSUAL('INFANTIL', 1, 2026);

-- ============================================================
-- DEMO 4: % PARTICIPACION BIMESTRE MIEMBRO
-- ============================================================
PROMPT
PROMPT ============================================================
PROMPT DEMO 4: Participacion Bimestral de un Miembro
PROMPT ============================================================
PROMPT

-- 4a. Primero ver opciones disponibles (sin parametros)
EXEC CASJ_SP_PARTICIPACION_BIMESTRE();

PROMPT ---
PROMPT

-- 4b. Consultar participacion del primer miembro adulto (que tiene inasistencias)
EXEC CASJ_SP_PARTICIPACION_BIMESTRE('Alejandro', 'Garcia', 1, 2026);

PROMPT ---
PROMPT

-- 4c. Consultar un miembro con buena asistencia
EXEC CASJ_SP_PARTICIPACION_BIMESTRE('Valentina', 'Rodriguez', 1, 2026);

PROMPT
PROMPT ============================================================
PROMPT     FIN DE LA DEMOSTRACION
PROMPT ============================================================
PROMPT
