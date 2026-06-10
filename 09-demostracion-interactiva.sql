-- ============================================================
-- CLUBES DE LECTURA - DEMOSTRACION INTERACTIVA
-- Archivo: 09_demo_interactiva.sql
-- ============================================================

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET VERIFY OFF;
SET LINESIZE 150;

PROMPT ============================================================
PROMPT 1. CONVERSION MONETARIA
PROMPT ============================================================
PROMPT
PROMPT >>> Opciones de paises disponibles para la moneda (algunos):
SELECT nombre AS pais, moneda FROM casj_paises WHERE ROWNUM <= 15 ORDER BY nombre;
PROMPT
ACCEPT p_monto NUMBER PROMPT 'Ingrese el monto a convertir: '
ACCEPT p_pais CHAR PROMPT 'Ingrese el nombre del pais (ej. Japon, Espana, Brasil): '

PROMPT
PROMPT >>> Ejecutando conversion para &p_monto en &p_pais...
EXEC CASJ_SP_CONVERTIR_MONEDA(&p_monto, '&p_pais');
PROMPT
PROMPT Presiona ENTER para continuar...
PAUSE


PROMPT ============================================================
PROMPT 2. EDAD DEL MIEMBRO
PROMPT ============================================================
PROMPT
PROMPT >>> Lista de miembros registrados (primeros 15):
SELECT id_miembro, primer_nombre || ' ' || primer_apellido AS nombre_completo, TO_CHAR(fecha_nacimiento, 'DD/MM/YYYY') AS fec_nac FROM casj_miembros_lectores WHERE ROWNUM <= 15 ORDER BY id_miembro;
PROMPT
ACCEPT p_id_miembro1 NUMBER PROMPT 'Ingrese el ID del miembro para calcular su edad: '

PROMPT
PROMPT >>> Calculando edad para el miembro ID: &p_id_miembro1...
DECLARE
    v_edad NUMBER;
    v_nombre VARCHAR2(200);
BEGIN
    SELECT primer_nombre || ' ' || primer_apellido INTO v_nombre 
    FROM casj_miembros_lectores WHERE id_miembro = &p_id_miembro1;
    
    v_edad := CASJ_FN_EDAD_MIEMBRO(&p_id_miembro1);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('RESULTADO: El miembro ' || v_nombre || ' tiene ' || v_edad || ' anos de edad.');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se encontro ningun miembro con el ID ' || &p_id_miembro1);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
PROMPT
PROMPT Presiona ENTER para continuar...
PAUSE


PROMPT ============================================================
PROMPT 3. ANTIGUEDAD EN CLUB DEL MIEMBRO
PROMPT ============================================================
PROMPT
PROMPT >>> Lista de miembros disponibles:
SELECT id_miembro, primer_nombre || ' ' || primer_apellido AS nombre_completo FROM casj_miembros_lectores WHERE ROWNUM <= 15 ORDER BY id_miembro;
PROMPT
ACCEPT p_id_miembro2 NUMBER PROMPT 'Ingrese el ID del miembro para ver su antiguedad en sus clubes: '

PROMPT
PROMPT >>> Desplegando informacion de antiguedad para el miembro ID: &p_id_miembro2...
EXEC CASJ_SP_INFO_MIEMBRO(&p_id_miembro2);
PROMPT
PROMPT Presiona ENTER para continuar...
PAUSE


PROMPT ============================================================
PROMPT 4. PROMEDIO PARTICIPACION EN REUNIONES MENSUAL POR TIPO DE GRUPO
PROMPT ============================================================
PROMPT
PROMPT >>> Tipos de grupo disponibles:
PROMPT     N: Ninos (Menores de 13)
PROMPT     J: Juvenil (13 a 17)
PROMPT     A: Adultos (18 en adelante)
PROMPT
PROMPT >>> Años con reuniones registradas:
SELECT DISTINCT TO_CHAR(fecha_reunion, 'YYYY') AS ano_disponible FROM casj_calendario_reunion_mes ORDER BY 1 DESC;
PROMPT
ACCEPT p_tipo_grupo CHAR PROMPT 'Ingrese el tipo de grupo (A, J, N, Adulto, Juvenil, Ninos): '
ACCEPT p_mes NUMBER PROMPT 'Ingrese el numero de mes (ej. 1 para Enero): '
ACCEPT p_anio NUMBER PROMPT 'Ingrese el ano (ej. 2026): '

PROMPT
PROMPT >>> Calculando participacion para el grupo &p_tipo_grupo en el mes &p_mes del &p_anio...
EXEC CASJ_SP_PARTICIPACION_MENSUAL('&p_tipo_grupo', &p_mes, &p_anio);
PROMPT
PROMPT Presiona ENTER para continuar...
PAUSE


PROMPT ============================================================
PROMPT 5. PARTICIPACION BIMESTRE MIEMBRO
PROMPT ============================================================
PROMPT
PROMPT >>> Lista de miembros disponibles:
SELECT id_miembro, primer_nombre || ' ' || primer_apellido AS nombre_completo FROM casj_miembros_lectores WHERE ROWNUM <= 15 ORDER BY id_miembro;
PROMPT
PROMPT >>> Bimestres disponibles:
PROMPT     1: Enero - Febrero
PROMPT     2: Marzo - Abril
PROMPT     3: Mayo - Junio
PROMPT     4: Julio - Agosto
PROMPT     5: Septiembre - Octubre
PROMPT     6: Noviembre - Diciembre
PROMPT
ACCEPT p_id_lector NUMBER PROMPT 'Ingrese el ID del lector: '
ACCEPT p_bimestre NUMBER PROMPT 'Ingrese el numero de bimestre (1 al 6): '
ACCEPT p_anio_bim NUMBER PROMPT 'Ingrese el ano (ej. 2026): '

PROMPT
PROMPT >>> Calculando participacion bimestral para el lector &p_id_lector en bimestre &p_bimestre/&p_anio_bim...
EXEC CASJ_SP_PARTICIPACION_BIMESTRE(&p_id_lector, &p_bimestre, &p_anio_bim);
PROMPT
PROMPT ============================================================
PROMPT FIN DE LA DEMOSTRACION INTERACTIVA
PROMPT ============================================================
