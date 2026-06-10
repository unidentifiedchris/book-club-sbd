-- ============================================================
-- CLUBES DE LECTURA - DEMOSTRACION DE FUNCIONES
-- Archivo: 08_demo_funciones.sql
-- Descripcion: Script de demostracion para la defensa (Rubrica 2 I)
-- Ejecutar DESPUES de 00_ejecutar_todo.sql
-- Prefijo: CASJ_
-- ============================================================

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

-- 1a. Convertir 100 JPY a USD (Yen Japones)
EXEC CASJ_SP_CONVERTIR_MONEDA(100, 'Japon');

PROMPT ---
PROMPT

-- 1b. Convertir 5000 BRL a USD (Real Brasileno)
EXEC CASJ_SP_CONVERTIR_MONEDA(5000, 'Brasil');

PROMPT ---
PROMPT

-- 1c. Convertir 250 Euros a USD
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

-- 2b. Consultar un miembro especifico (usar el ID del listado)
EXEC CASJ_SP_INFO_MIEMBRO(1);

PROMPT ---
PROMPT

-- 2c. Consultar otro miembro
EXEC CASJ_SP_INFO_MIEMBRO(10);

-- ============================================================
-- DEMO 3: % PROMEDIO PARTICIPACION MENSUAL POR TIPO DE GRUPO
-- ============================================================
PROMPT
PROMPT ============================================================
PROMPT DEMO 3: Promedio Participacion Mensual por Tipo de Grupo
PROMPT ============================================================
PROMPT

-- 3a. Mostrar ayuda y clubes disponibles
EXEC CASJ_SP_PARTICIPACION_MENSUAL();

PROMPT ---
PROMPT

-- 3b. Participacion de grupos ADULTO en Enero 2026
EXEC CASJ_SP_PARTICIPACION_MENSUAL('ADULTO', 1, 2026);

PROMPT ---
PROMPT

-- 3c. Participacion de grupos JUVENIL en Febrero 2026
EXEC CASJ_SP_PARTICIPACION_MENSUAL('JUVENIL', 2, 2026);

-- ============================================================
-- DEMO 4: % PARTICIPACION BIMESTRE POR MIEMBRO
-- ============================================================
PROMPT
PROMPT ============================================================
PROMPT DEMO 4: Participacion Bimestral del Miembro
PROMPT ============================================================
PROMPT

-- 4a. Mostrar ayuda y miembros disponibles
EXEC CASJ_SP_PARTICIPACION_BIMESTRE();

PROMPT ---
PROMPT

-- 4b. Bimestre 1 (Ene-Feb) para el miembro ID 1
EXEC CASJ_SP_PARTICIPACION_BIMESTRE(1, 1, 2026);

PROMPT ---
PROMPT

-- 4c. Bimestre 2 (Mar-Abr) para otro miembro
EXEC CASJ_SP_PARTICIPACION_BIMESTRE(5, 2, 2026);

PROMPT
PROMPT ============================================================
PROMPT FIN DE LA DEMOSTRACION
PROMPT ============================================================

