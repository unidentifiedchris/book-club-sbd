-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 05_funciones.sql
-- Descripcion: Las 4 funciones requeridas + procedimientos
--              interactivos para demostracion en defensa
-- Prefijo: CASJ_
-- ============================================================

-- ============================================================
--                FUNCION 1: CONVERSION MONETARIA
-- ============================================================

-- Funcion base: convierte un monto de una moneda a otra
CREATE OR REPLACE FUNCTION CASJ_FN_CONVERSION_MONETARIA (
    p_monto          IN NUMBER,
    p_moneda_origen  IN VARCHAR2,
    p_moneda_destino IN VARCHAR2 DEFAULT 'USD'
) RETURN NUMBER
IS
    v_tasa_origen  NUMBER(18,6);
    v_tasa_destino NUMBER(18,6);
    v_monto_usd    NUMBER(18,6);

    FUNCTION obtener_tasa(p_moneda VARCHAR2) RETURN NUMBER IS
    BEGIN
        RETURN CASE UPPER(p_moneda)
            WHEN 'USD' THEN 1.0
            WHEN 'VES' THEN 36.50
            WHEN 'EUR' THEN 0.92
            WHEN 'MXN' THEN 17.20
            WHEN 'COP' THEN 3950.00
            WHEN 'ARS' THEN 935.00
            WHEN 'GBP' THEN 0.79
            WHEN 'JPY' THEN 149.50
            WHEN 'INR' THEN 83.25
            WHEN 'BRL' THEN 4.97
            WHEN 'CNY' THEN 7.24
            WHEN 'CAD' THEN 1.36
            ELSE 1.0
        END;
    END obtener_tasa;

BEGIN
    IF p_monto IS NULL OR p_monto < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El monto debe ser un valor positivo');
    END IF;

    IF UPPER(p_moneda_origen) = UPPER(p_moneda_destino) THEN
        RETURN p_monto;
    END IF;

    v_tasa_origen := obtener_tasa(p_moneda_origen);
    v_tasa_destino := obtener_tasa(p_moneda_destino);

    v_monto_usd := p_monto / v_tasa_origen;

    RETURN ROUND(v_monto_usd * v_tasa_destino, 2);
END CASJ_FN_CONVERSION_MONETARIA;
/

-- ============================================================
-- Procedimiento interactivo para CONVERSION MONETARIA
-- ============================================================
CREATE OR REPLACE PROCEDURE CASJ_SP_CONVERTIR_MONEDA (
    p_monto         IN NUMBER,
    p_pais_o_moneda IN VARCHAR2,
    p_destino       IN VARCHAR2 DEFAULT 'USD'
) IS
    v_moneda_origen  VARCHAR2(10);
    v_nombre_moneda  VARCHAR2(100);
    v_pais_nombre    VARCHAR2(100);
    v_resultado      NUMBER(18,2);
    v_tasa           NUMBER(18,6);
    v_encontrado     BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('╔══════════════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║           CASJ - CONVERSION MONETARIA                  ║');
    DBMS_OUTPUT.PUT_LINE('╚══════════════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');

    -- Intentar buscar por nombre de pais primero
    BEGIN
        SELECT p.moneda, p.nombre
        INTO v_moneda_origen, v_pais_nombre
        FROM casj_paises p
        WHERE UPPER(p.nombre) = UPPER(p_pais_o_moneda)
        AND ROWNUM = 1;
        v_encontrado := TRUE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;

    -- Si no se encontro por pais, buscar por codigo de moneda
    IF NOT v_encontrado THEN
        BEGIN
            SELECT p.moneda, p.nombre
            INTO v_moneda_origen, v_pais_nombre
            FROM casj_paises p
            WHERE UPPER(p.moneda) = UPPER(p_pais_o_moneda)
            AND ROWNUM = 1;
            v_encontrado := TRUE;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN NULL;
        END;
    END IF;

    -- Si todavia no se encontro, usar el codigo directamente
    IF NOT v_encontrado THEN
        v_moneda_origen := UPPER(p_pais_o_moneda);
        v_pais_nombre := '(Codigo directo)';
    END IF;

    -- Obtener nombre descriptivo de la moneda
    v_nombre_moneda := CASE UPPER(v_moneda_origen)
        WHEN 'USD' THEN 'Dolar Americano'
        WHEN 'VES' THEN 'Bolivar Venezolano'
        WHEN 'EUR' THEN 'Euro'
        WHEN 'MXN' THEN 'Peso Mexicano'
        WHEN 'COP' THEN 'Peso Colombiano'
        WHEN 'ARS' THEN 'Peso Argentino'
        WHEN 'GBP' THEN 'Libra Esterlina'
        WHEN 'JPY' THEN 'Yen Japones'
        WHEN 'INR' THEN 'Rupia India'
        WHEN 'BRL' THEN 'Real Brasileno'
        WHEN 'CNY' THEN 'Yuan Chino'
        WHEN 'CAD' THEN 'Dolar Canadiense'
        ELSE v_moneda_origen
    END;

    -- Calcular tasa
    v_tasa := CASE UPPER(v_moneda_origen)
        WHEN 'USD' THEN 1.0 WHEN 'VES' THEN 36.50 WHEN 'EUR' THEN 0.92
        WHEN 'MXN' THEN 17.20 WHEN 'COP' THEN 3950.00 WHEN 'ARS' THEN 935.00
        WHEN 'GBP' THEN 0.79 WHEN 'JPY' THEN 149.50 WHEN 'INR' THEN 83.25
        WHEN 'BRL' THEN 4.97 WHEN 'CNY' THEN 7.24 WHEN 'CAD' THEN 1.36
        ELSE 1.0
    END;

    v_resultado := CASJ_FN_CONVERSION_MONETARIA(p_monto, v_moneda_origen, UPPER(p_destino));

    DBMS_OUTPUT.PUT_LINE('  Pais/Moneda origen: ' || v_pais_nombre || ' (' || v_moneda_origen || ' - ' || v_nombre_moneda || ')');
    DBMS_OUTPUT.PUT_LINE('  Tasa actual:        1 USD = ' || TO_CHAR(v_tasa, '999,999.99') || ' ' || v_moneda_origen);
    DBMS_OUTPUT.PUT_LINE('  ───────────────────────────────────────────────────');
    DBMS_OUTPUT.PUT_LINE('  Monto original:     ' || TO_CHAR(p_monto, '999,999,999.99') || ' ' || v_moneda_origen);
    DBMS_OUTPUT.PUT_LINE('  Monto convertido:   ' || TO_CHAR(v_resultado, '999,999,999.99') || ' ' || UPPER(p_destino));
    DBMS_OUTPUT.PUT_LINE('');

    -- Tabla de referencia
    DBMS_OUTPUT.PUT_LINE('  ┌─────────────────────────────────────────────────────────┐');
    DBMS_OUTPUT.PUT_LINE('  │  TABLA DE REFERENCIA DE MONEDAS DISPONIBLES             │');
    DBMS_OUTPUT.PUT_LINE('  ├────────────────┬──────────┬─────────────────────────────┤');
    DBMS_OUTPUT.PUT_LINE('  │ PAIS           │ MONEDA   │ TASA vs USD                 │');
    DBMS_OUTPUT.PUT_LINE('  ├────────────────┼──────────┼─────────────────────────────┤');
    FOR r IN (SELECT pais, codigo_moneda, tasa_vs_usd FROM CASJ_VW_PAISES_MONEDAS ORDER BY pais) LOOP
        DBMS_OUTPUT.PUT_LINE('  │ ' || RPAD(r.pais, 15) || '│ ' || RPAD(r.codigo_moneda, 9) || '│ 1 USD = ' || RPAD(TO_CHAR(r.tasa_vs_usd, '999,999.99'), 21) || '│');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('  └────────────────┴──────────┴─────────────────────────────┘');
    DBMS_OUTPUT.PUT_LINE('');
END CASJ_SP_CONVERTIR_MONEDA;
/

-- ============================================================
--    FUNCION 2: EDAD MIEMBRO / ANTIGUEDAD EN CLUB MIEMBRO
-- ============================================================

-- Funcion: Edad del miembro
CREATE OR REPLACE FUNCTION CASJ_FN_EDAD_MIEMBRO (
    p_id_miembro IN NUMBER
) RETURN NUMBER
IS
    v_fecha_nac DATE;
BEGIN
    SELECT fecha_nacimiento INTO v_fecha_nac
    FROM casj_miembros_lectores
    WHERE id_miembro = p_id_miembro;

    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, v_fecha_nac) / 12);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20012, 'No se encontro el miembro con ID: ' || p_id_miembro);
END CASJ_FN_EDAD_MIEMBRO;
/

-- Funcion: Antiguedad en el club
CREATE OR REPLACE FUNCTION CASJ_FN_ANTIGUEDAD_CLUB_MIEMBRO (
    p_id_miembro IN NUMBER,
    p_id_club    IN NUMBER DEFAULT NULL
) RETURN VARCHAR2
IS
    v_fecha_inicio DATE;
    v_fecha_fin    DATE;
    v_meses        NUMBER;
    v_anios        NUMBER;
    v_meses_rest   NUMBER;
    v_club_id      NUMBER := p_id_club;
    v_nombre_club  VARCHAR2(200);
BEGIN
    IF v_club_id IS NULL THEN
        BEGIN
            SELECT id_club INTO v_club_id
            FROM casj_historico_membresia
            WHERE id_miembro = p_id_miembro AND activo = 'S' AND ROWNUM = 1;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN RETURN 'Sin membresia activa';
        END;
    END IF;

    SELECT hm.fecha_inicio, NVL(hm.fecha_fin, SYSDATE), c.nombre
    INTO v_fecha_inicio, v_fecha_fin, v_nombre_club
    FROM casj_historico_membresia hm
    JOIN casj_clubes c ON hm.id_club = c.id_club
    WHERE hm.id_miembro = p_id_miembro AND hm.id_club = v_club_id AND ROWNUM = 1
    ORDER BY hm.fecha_inicio DESC;

    v_meses := TRUNC(MONTHS_BETWEEN(v_fecha_fin, v_fecha_inicio));
    v_anios := TRUNC(v_meses / 12);
    v_meses_rest := MOD(v_meses, 12);

    RETURN v_nombre_club || ': ' ||
           CASE WHEN v_anios > 0 THEN v_anios || ' anio(s) ' ELSE '' END ||
           v_meses_rest || ' mes(es)';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20022, 'Sin membresia en el club especificado');
END CASJ_FN_ANTIGUEDAD_CLUB_MIEMBRO;
/

-- ============================================================
-- Procedimiento interactivo: INFO MIEMBRO (Edad + Antiguedad)
-- Acepta: ID del miembro
-- ============================================================
CREATE OR REPLACE PROCEDURE CASJ_SP_INFO_MIEMBRO (
    p_id_miembro IN NUMBER DEFAULT NULL
) IS
    v_id_miembro     NUMBER;
    v_edad           NUMBER;
    v_antiguedad     VARCHAR2(500);
    v_count          NUMBER := 0;

    CURSOR c_miembros IS
        SELECT id_miembro, nombre_completo, doc_identidad, edad,
               club, tipo_grupo, miembro_desde
        FROM CASJ_VW_MIEMBROS_ACTIVOS
        ORDER BY club, tipo_grupo, nombre_completo;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('╔══════════════════════════════════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║              CASJ - INFORMACION DE MIEMBRO (Edad y Antiguedad)             ║');
    DBMS_OUTPUT.PUT_LINE('╚══════════════════════════════════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');

    IF p_id_miembro IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('  LISTA DE MIEMBROS ACTIVOS:');
        DBMS_OUTPUT.PUT_LINE('  ┌──────┬──────────────────────────────────┬────────────┬──────┬─────────────────────────┬──────────┬────────────┐');
        DBMS_OUTPUT.PUT_LINE('  │ ID   │ NOMBRE COMPLETO                  │ DOCUMENTO  │ EDAD │ CLUB                    │ GRUPO    │ DESDE      │');
        DBMS_OUTPUT.PUT_LINE('  ├──────┼──────────────────────────────────┼────────────┼──────┼─────────────────────────┼──────────┼────────────┤');
        FOR r IN c_miembros LOOP
            DBMS_OUTPUT.PUT_LINE('  │ ' || RPAD(r.id_miembro, 5) || '│ ' ||
                RPAD(r.nombre_completo, 33) || '│ ' ||
                RPAD(r.doc_identidad, 11) || '│ ' ||
                RPAD(r.edad, 5) || '│ ' ||
                RPAD(r.club, 24) || '│ ' ||
                RPAD(r.tipo_grupo, 9) || '│ ' ||
                RPAD(TO_CHAR(r.miembro_desde, 'DD/MM/YYYY'), 11) || '│');
            v_count := v_count + 1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('  └──────┴──────────────────────────────────┴────────────┴──────┴─────────────────────────┴──────────┴────────────┘');
        DBMS_OUTPUT.PUT_LINE('  Total: ' || v_count || ' miembros activos');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('  USO: EXEC CASJ_SP_INFO_MIEMBRO(ID_DEL_MIEMBRO);');
        DBMS_OUTPUT.PUT_LINE('');
        RETURN;
    END IF;

    -- Buscar miembro por ID
    BEGIN
        SELECT m.id_miembro INTO v_id_miembro
        FROM casj_miembros_lectores m
        WHERE m.id_miembro = p_id_miembro;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('  *** ERROR: No se encontro miembro con ID "' || p_id_miembro || '" ***');
            DBMS_OUTPUT.PUT_LINE('  Ejecute CASJ_SP_INFO_MIEMBRO() sin parametros para ver la lista completa.');
            RETURN;
    END;

    -- Calcular edad y antiguedad
    v_edad := CASJ_FN_EDAD_MIEMBRO(v_id_miembro);
    v_antiguedad := CASJ_FN_ANTIGUEDAD_CLUB_MIEMBRO(v_id_miembro);

    -- Mostrar ficha completa
    DBMS_OUTPUT.PUT_LINE('  FICHA DEL MIEMBRO:');
    DBMS_OUTPUT.PUT_LINE('  ═══════════════════════════════════════════════════════');
    FOR r IN (SELECT * FROM CASJ_VW_FICHA_MIEMBRO WHERE id_miembro = v_id_miembro) LOOP
        DBMS_OUTPUT.PUT_LINE('  Nombre completo:    ' || r.nombre_completo);
        DBMS_OUTPUT.PUT_LINE('  Documento:          ' || r.doc_identidad);
        DBMS_OUTPUT.PUT_LINE('  Fecha nacimiento:   ' || TO_CHAR(r.fecha_nacimiento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('  Edad:               ' || v_edad || ' anios');
        DBMS_OUTPUT.PUT_LINE('  Email:              ' || r.email);
        DBMS_OUTPUT.PUT_LINE('  Telefono:           ' || r.telefono);
        DBMS_OUTPUT.PUT_LINE('  Nacionalidad:       ' || NVL(r.nacionalidad, 'N/A'));
        DBMS_OUTPUT.PUT_LINE('  Idioma(s):          ' || NVL(r.idiomas, 'N/A'));
        DBMS_OUTPUT.PUT_LINE('  ───────────────────────────────────────────────────');
        DBMS_OUTPUT.PUT_LINE('  Club actual:        ' || NVL(r.club_actual, 'Sin club'));
        DBMS_OUTPUT.PUT_LINE('  Antiguedad:         ' || v_antiguedad);
        DBMS_OUTPUT.PUT_LINE('  Meses en club:      ' || NVL(TO_CHAR(r.meses_antiguedad), '0'));
        DBMS_OUTPUT.PUT_LINE('  Tipo de grupo:      ' || NVL(r.tipo_grupo, 'Sin grupo'));
        DBMS_OUTPUT.PUT_LINE('  Representante:      ' || NVL(r.representante, 'No aplica'));
        DBMS_OUTPUT.PUT_LINE('  ═══════════════════════════════════════════════════');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END CASJ_SP_INFO_MIEMBRO;
/

-- ============================================================
-- FUNCION 3: % PROMEDIO PARTICIPACION MENSUAL POR TIPO DE GRUPO
-- ============================================================

CREATE OR REPLACE FUNCTION CASJ_FN_PROM_PARTICIPACION_MENSUAL (
    p_tipo_grupo IN VARCHAR2,
    p_mes        IN NUMBER,
    p_anio       IN NUMBER,
    p_id_club    IN NUMBER DEFAULT NULL
) RETURN NUMBER
IS
    v_total_asistencias NUMBER := 0;
    v_total_posibles    NUMBER := 0;
    v_tipo_char         CHAR(1);

    CURSOR c_grupos IS
        SELECT id_club, id_grupo FROM casj_grupos_lectura
        WHERE tipo = v_tipo_char
          AND (p_id_club IS NULL OR id_club = p_id_club);

    v_reuniones_grupo   NUMBER;
    v_miembros_grupo    NUMBER;
    v_inasistencias     NUMBER;
BEGIN
    -- Convertir tipo legible a char
    v_tipo_char := CASE UPPER(p_tipo_grupo)
        WHEN 'ADULTO' THEN 'A' WHEN 'JUVENIL' THEN 'J' WHEN 'NINOS' THEN 'N'
        WHEN 'A' THEN 'A' WHEN 'J' THEN 'J' WHEN 'N' THEN 'N'
        ELSE 'A'
    END;

    FOR r_grupo IN c_grupos LOOP
        -- Reuniones del mes
        SELECT COUNT(*) INTO v_reuniones_grupo
        FROM casj_calendario_reunion_mes
        WHERE id_club = r_grupo.id_club AND id_grupo = r_grupo.id_grupo
          AND EXTRACT(MONTH FROM fecha_reunion) = p_mes
          AND EXTRACT(YEAR FROM fecha_reunion) = p_anio
          AND realizada = 'S';

        -- Miembros en el grupo
        SELECT COUNT(*) INTO v_miembros_grupo
        FROM casj_asignaciones
        WHERE id_club = r_grupo.id_club AND id_grupo = r_grupo.id_grupo
          AND fecha_inicio <= LAST_DAY(TO_DATE(p_anio || '-' || LPAD(p_mes, 2, '0') || '-01', 'YYYY-MM-DD'))
          AND (fecha_fin IS NULL OR fecha_fin >= TO_DATE(p_anio || '-' || LPAD(p_mes, 2, '0') || '-01', 'YYYY-MM-DD'));

        -- Faltas
        SELECT COUNT(*) INTO v_inasistencias
        FROM casj_inasistencias i
        JOIN casj_calendario_reunion_mes cal
          ON i.id_club = cal.id_club AND i.id_grupo = cal.id_grupo AND i.fecha_reunion = cal.fecha_reunion
        WHERE cal.id_club = r_grupo.id_club AND cal.id_grupo = r_grupo.id_grupo
          AND EXTRACT(MONTH FROM cal.fecha_reunion) = p_mes
          AND EXTRACT(YEAR FROM cal.fecha_reunion) = p_anio
          AND cal.realizada = 'S';

        v_total_posibles := v_total_posibles + (v_reuniones_grupo * v_miembros_grupo);
        v_total_asistencias := v_total_asistencias + ((v_reuniones_grupo * v_miembros_grupo) - v_inasistencias);
    END LOOP;

    IF v_total_posibles > 0 THEN
        RETURN ROUND((v_total_asistencias / v_total_posibles) * 100, 2);
    ELSE
        RETURN 0;
    END IF;
END CASJ_FN_PROM_PARTICIPACION_MENSUAL;
/

-- ============================================================
-- Procedimiento interactivo: PARTICIPACION MENSUAL
-- ============================================================
CREATE OR REPLACE PROCEDURE CASJ_SP_PARTICIPACION_MENSUAL (
    p_tipo_grupo IN VARCHAR2 DEFAULT NULL,
    p_mes        IN NUMBER   DEFAULT NULL,
    p_anio       IN NUMBER   DEFAULT NULL
) IS
    v_porcentaje  NUMBER;
    v_total       NUMBER := 0;
    v_count       NUMBER := 0;
    v_nombre_mes  VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('╔══════════════════════════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║      CASJ - % PROMEDIO PARTICIPACION MENSUAL POR TIPO DE GRUPO     ║');
    DBMS_OUTPUT.PUT_LINE('╚══════════════════════════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');

    IF p_tipo_grupo IS NULL OR p_mes IS NULL OR p_anio IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('  TIPOS DE GRUPO DISPONIBLES:');
        DBMS_OUTPUT.PUT_LINE('    - ADULTO');
        DBMS_OUTPUT.PUT_LINE('    - JUVENIL');
        DBMS_OUTPUT.PUT_LINE('    - NINOS');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('  MESES: 1=Enero, 2=Febrero, ..., 12=Diciembre');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('  CLUBES CON GRUPOS:');
        DBMS_OUTPUT.PUT_LINE('  ┌─────────────────────────┬──────────┬────────────────┐');
        DBMS_OUTPUT.PUT_LINE('  │ CLUB                    │ GRUPO    │ MIEMBROS ACT.  │');
        DBMS_OUTPUT.PUT_LINE('  ├─────────────────────────┼──────────┼────────────────┤');
        FOR r IN (
            SELECT c.nombre AS club,
                   DECODE(gl.tipo, 'A', 'ADULTO', 'J', 'JUVENIL', 'N', 'NINOS') AS tipo,
                   COUNT(DISTINCT a.id_miembro) AS miembros
            FROM casj_clubes c
            JOIN casj_grupos_lectura gl ON c.id_club = gl.id_club
            LEFT JOIN casj_asignaciones a ON gl.id_club = a.id_club AND gl.id_grupo = a.id_grupo AND a.fecha_fin IS NULL
            GROUP BY c.nombre, gl.tipo
            ORDER BY c.nombre, gl.tipo
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('  │ ' || RPAD(r.club, 24) || '│ ' || RPAD(r.tipo, 9) || '│ ' || RPAD(r.miembros, 15) || '│');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('  └─────────────────────────┴──────────┴────────────────┘');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('  USO: EXEC CASJ_SP_PARTICIPACION_MENSUAL(''ADULTO'', 1, 2026);');
        DBMS_OUTPUT.PUT_LINE('');
        RETURN;
    END IF;

    v_nombre_mes := CASE p_mes
        WHEN 1 THEN 'Enero' WHEN 2 THEN 'Febrero' WHEN 3 THEN 'Marzo'
        WHEN 4 THEN 'Abril' WHEN 5 THEN 'Mayo' WHEN 6 THEN 'Junio'
        WHEN 7 THEN 'Julio' WHEN 8 THEN 'Agosto' WHEN 9 THEN 'Septiembre'
        WHEN 10 THEN 'Octubre' WHEN 11 THEN 'Noviembre' WHEN 12 THEN 'Diciembre'
        ELSE 'Desconocido'
    END;

    DBMS_OUTPUT.PUT_LINE('  Tipo de grupo:  ' || UPPER(p_tipo_grupo));
    DBMS_OUTPUT.PUT_LINE('  Periodo:        ' || v_nombre_mes || ' ' || p_anio);
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('  ┌─────────────────────────┬────────────────┬──────────────────────┐');
    DBMS_OUTPUT.PUT_LINE('  │ CLUB                    │ % ASISTENCIA   │ OBSERVACION          │');
    DBMS_OUTPUT.PUT_LINE('  ├─────────────────────────┼────────────────┼──────────────────────┤');

    FOR r IN (
        SELECT DISTINCT c.id_club, c.nombre
        FROM casj_clubes c
        JOIN casj_grupos_lectura gl ON c.id_club = gl.id_club
        WHERE gl.tipo = CASE UPPER(p_tipo_grupo)
            WHEN 'ADULTO' THEN 'A' WHEN 'JUVENIL' THEN 'J' WHEN 'NINOS' THEN 'N'
            ELSE UPPER(p_tipo_grupo)
        END
        ORDER BY c.nombre
    ) LOOP
        v_porcentaje := CASJ_FN_PROM_PARTICIPACION_MENSUAL(p_tipo_grupo, p_mes, p_anio, r.id_club);
        v_total := v_total + v_porcentaje;
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE('  │ ' || RPAD(r.nombre, 24) || '│ ' ||
            RPAD(TO_CHAR(v_porcentaje, '990.99') || '%', 15) || '│ ' ||
            RPAD(CASE
                WHEN v_porcentaje = 0 THEN 'Sin datos'
                WHEN v_porcentaje >= 90 THEN 'Excelente'
                WHEN v_porcentaje >= 70 THEN 'Buena'
                WHEN v_porcentaje >= 50 THEN 'Regular'
                ELSE 'Baja'
            END, 21) || '│');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('  ├─────────────────────────┼────────────────┼──────────────────────┤');
    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('  │ PROMEDIO GENERAL        │ ' ||
            RPAD(TO_CHAR(v_total / v_count, '990.99') || '%', 15) || '│                      │');
    ELSE
        DBMS_OUTPUT.PUT_LINE('  │ PROMEDIO GENERAL        │ N/A            │ Sin datos              │');
    END IF;
    DBMS_OUTPUT.PUT_LINE('  └─────────────────────────┴────────────────┴──────────────────────┘');
    DBMS_OUTPUT.PUT_LINE('');
END CASJ_SP_PARTICIPACION_MENSUAL;
/

-- ============================================================
--     FUNCION 4: % PARTICIPACION BIMESTRE MIEMBRO
-- ============================================================

CREATE OR REPLACE FUNCTION CASJ_FN_PARTICIPACION_BIMESTRE_MIEMBRO (
    p_id_miembro IN NUMBER,
    p_bimestre   IN NUMBER,
    p_anio       IN NUMBER
) RETURN NUMBER
IS
    v_id_club             NUMBER;
    v_id_grupo            NUMBER;
    v_reuniones_totales   NUMBER := 0;
    v_inasistencias       NUMBER := 0;
    v_asistencias         NUMBER := 0;
    v_resultado           NUMBER(5,2) := 0;
    v_mes_inicio          NUMBER;
    v_mes_fin             NUMBER;
    v_nombre_miembro      VARCHAR2(200);
BEGIN
    v_mes_inicio := (p_bimestre - 1) * 2 + 1;
    v_mes_fin := v_mes_inicio + 1;

    SELECT primer_nombre || ' ' || primer_apellido INTO v_nombre_miembro
    FROM casj_miembros_lectores WHERE id_miembro = p_id_miembro;

    BEGIN
        SELECT id_club, id_grupo INTO v_id_club, v_id_grupo
        FROM casj_asignaciones
        WHERE id_miembro = p_id_miembro
          AND fecha_inicio <= LAST_DAY(TO_DATE(p_anio || '-' || LPAD(v_mes_fin, 2, '0') || '-01', 'YYYY-MM-DD'))
          AND (fecha_fin IS NULL OR fecha_fin >= TO_DATE(p_anio || '-' || LPAD(v_mes_inicio, 2, '0') || '-01', 'YYYY-MM-DD'))
          AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RETURN 0;
    END;

    -- Total de reuniones del grupo en el bimestre
    SELECT COUNT(*) INTO v_reuniones_totales
    FROM casj_calendario_reunion_mes
    WHERE id_club = v_id_club AND id_grupo = v_id_grupo
      AND EXTRACT(YEAR FROM fecha_reunion) = p_anio
      AND EXTRACT(MONTH FROM fecha_reunion) BETWEEN v_mes_inicio AND v_mes_fin
      AND realizada = 'S';

    -- Inasistencias del miembro
    SELECT COUNT(*) INTO v_inasistencias
    FROM casj_inasistencias i
    JOIN casj_calendario_reunion_mes cal
      ON i.id_club = cal.id_club AND i.id_grupo = cal.id_grupo AND i.fecha_reunion = cal.fecha_reunion
    WHERE i.id_miembro = p_id_miembro
      AND cal.id_club = v_id_club AND cal.id_grupo = v_id_grupo
      AND EXTRACT(YEAR FROM cal.fecha_reunion) = p_anio
      AND EXTRACT(MONTH FROM cal.fecha_reunion) BETWEEN v_mes_inicio AND v_mes_fin
      AND cal.realizada = 'S';

    v_asistencias := v_reuniones_totales - v_inasistencias;

    IF v_reuniones_totales > 0 THEN
        v_resultado := ROUND((v_asistencias / v_reuniones_totales) * 100, 2);
    ELSE
        v_resultado := 100;
    END IF;

    IF v_resultado < 70 AND v_reuniones_totales > 0 THEN
        DBMS_OUTPUT.PUT_LINE('*** ALERTA: El miembro ' || v_nombre_miembro ||
            ' (ID: ' || p_id_miembro || ') tiene ' || v_resultado ||
            '% de asistencia en el bimestre ' || p_bimestre || '/' || p_anio ||
            '. SUPERA EL 30% DE INASISTENCIA - DEBE SER RETIRADO ***');
    END IF;

    RETURN v_resultado;
END CASJ_FN_PARTICIPACION_BIMESTRE_MIEMBRO;
/

-- ============================================================
-- Procedimiento interactivo: PARTICIPACION BIMESTRE
-- Acepta: id_miembro, bimestre, anio
-- ============================================================
CREATE OR REPLACE PROCEDURE CASJ_SP_PARTICIPACION_BIMESTRE (
    p_id_miembro IN NUMBER   DEFAULT NULL,
    p_bimestre   IN NUMBER   DEFAULT NULL,
    p_anio       IN NUMBER   DEFAULT NULL
) IS
    v_id_miembro     NUMBER;
    v_porcentaje     NUMBER;
    v_nombre_comp    VARCHAR2(200);
    v_club           VARCHAR2(200);
    v_tipo_grupo     VARCHAR2(50);
    v_mes_inicio     NUMBER;
    v_mes_fin        NUMBER;
    v_reuniones      NUMBER;
    v_inasistencias  NUMBER;
    v_id_club        NUMBER;
    v_id_grupo       NUMBER;
    v_nombre_bim     VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('╔══════════════════════════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║          CASJ - % PARTICIPACION BIMESTRAL DEL MIEMBRO              ║');
    DBMS_OUTPUT.PUT_LINE('╚══════════════════════════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');

    IF p_id_miembro IS NULL OR p_bimestre IS NULL OR p_anio IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('  MIEMBROS ACTIVOS DISPONIBLES:');
        DBMS_OUTPUT.PUT_LINE('  ┌──────┬──────────────────────────────────┬────────────┬─────────────────────────┬──────────┐');
        DBMS_OUTPUT.PUT_LINE('  │ ID   │ NOMBRE COMPLETO                  │ DOCUMENTO  │ CLUB                    │ GRUPO    │');
        DBMS_OUTPUT.PUT_LINE('  ├──────┼──────────────────────────────────┼────────────┼─────────────────────────┼──────────┤');
        FOR r IN (
            SELECT id_miembro, nombre_completo, doc_identidad, club, tipo_grupo
            FROM CASJ_VW_MIEMBROS_ACTIVOS
            ORDER BY club, tipo_grupo, nombre_completo
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('  │ ' || RPAD(r.id_miembro, 5) || '│ ' ||
                RPAD(r.nombre_completo, 33) || '│ ' ||
                RPAD(r.doc_identidad, 11) || '│ ' ||
                RPAD(r.club, 24) || '│ ' ||
                RPAD(r.tipo_grupo, 9) || '│');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('  └──────┴──────────────────────────────────┴────────────┴─────────────────────────┴──────────┘');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('  BIMESTRES: 1=Ene-Feb, 2=Mar-Abr, 3=May-Jun, 4=Jul-Ago, 5=Sep-Oct, 6=Nov-Dic');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('  USO: EXEC CASJ_SP_PARTICIPACION_BIMESTRE(ID_MIEMBRO, BIMESTRE, ANIO);');
        DBMS_OUTPUT.PUT_LINE('');
        RETURN;
    END IF;

    -- Buscar miembro por ID
    BEGIN
        SELECT m.id_miembro,
               m.primer_nombre || ' ' || m.primer_apellido || ' ' || m.segundo_apellido,
               c.nombre,
               DECODE(gl.tipo, 'A', 'ADULTO', 'J', 'JUVENIL', 'N', 'NINOS'),
               gl.id_club, gl.id_grupo
        INTO v_id_miembro, v_nombre_comp, v_club, v_tipo_grupo, v_id_club, v_id_grupo
        FROM casj_miembros_lectores m
        JOIN casj_historico_membresia hm ON m.id_miembro = hm.id_miembro AND hm.activo = 'S'
        JOIN casj_clubes c ON hm.id_club = c.id_club
        JOIN casj_asignaciones a ON m.id_miembro = a.id_miembro AND a.fecha_fin IS NULL
        JOIN casj_grupos_lectura gl ON a.id_club = gl.id_club AND a.id_grupo = gl.id_grupo
        WHERE m.id_miembro = p_id_miembro
          AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('  *** ERROR: No se encontro miembro activo con ID "' || p_id_miembro || '" ***');
            DBMS_OUTPUT.PUT_LINE('  Ejecute CASJ_SP_PARTICIPACION_BIMESTRE() sin parametros para ver la lista.');
            RETURN;
    END;

    v_porcentaje := CASJ_FN_PARTICIPACION_BIMESTRE_MIEMBRO(v_id_miembro, p_bimestre, p_anio);

    v_mes_inicio := (p_bimestre - 1) * 2 + 1;
    v_mes_fin := v_mes_inicio + 1;

    v_nombre_bim := CASE p_bimestre
        WHEN 1 THEN 'Enero - Febrero' WHEN 2 THEN 'Marzo - Abril'
        WHEN 3 THEN 'Mayo - Junio' WHEN 4 THEN 'Julio - Agosto'
        WHEN 5 THEN 'Septiembre - Octubre' WHEN 6 THEN 'Noviembre - Diciembre'
        ELSE 'Desconocido'
    END;

    SELECT COUNT(*) INTO v_reuniones
    FROM casj_calendario_reunion_mes
    WHERE id_club = v_id_club AND id_grupo = v_id_grupo
      AND EXTRACT(YEAR FROM fecha_reunion) = p_anio
      AND EXTRACT(MONTH FROM fecha_reunion) BETWEEN v_mes_inicio AND v_mes_fin
      AND realizada = 'S';

    SELECT COUNT(*) INTO v_inasistencias
    FROM casj_inasistencias i
    JOIN casj_calendario_reunion_mes cal
      ON i.id_club = cal.id_club AND i.id_grupo = cal.id_grupo AND i.fecha_reunion = cal.fecha_reunion
    WHERE i.id_miembro = v_id_miembro
      AND cal.id_club = v_id_club AND cal.id_grupo = v_id_grupo
      AND EXTRACT(YEAR FROM cal.fecha_reunion) = p_anio
      AND EXTRACT(MONTH FROM cal.fecha_reunion) BETWEEN v_mes_inicio AND v_mes_fin
      AND cal.realizada = 'S';

    DBMS_OUTPUT.PUT_LINE('  MIEMBRO:          ' || v_nombre_comp);
    DBMS_OUTPUT.PUT_LINE('  CLUB:             ' || v_club);
    DBMS_OUTPUT.PUT_LINE('  TIPO DE GRUPO:    ' || v_tipo_grupo);
    DBMS_OUTPUT.PUT_LINE('  PERIODO:          Bimestre ' || p_bimestre || ' (' || v_nombre_bim || ') ' || p_anio);
    DBMS_OUTPUT.PUT_LINE('  ══════════════════════════════════════════════════════');
    DBMS_OUTPUT.PUT_LINE('  Reuniones realizadas:   ' || v_reuniones);
    DBMS_OUTPUT.PUT_LINE('  Reuniones asistidas:    ' || (v_reuniones - v_inasistencias));
    DBMS_OUTPUT.PUT_LINE('  Inasistencias:          ' || v_inasistencias);
    DBMS_OUTPUT.PUT_LINE('  ──────────────────────────────────────────────────────');
    DBMS_OUTPUT.PUT_LINE('  *** PORCENTAJE DE ASISTENCIA: ' || TO_CHAR(v_porcentaje, '990.99') || '% ***');
    DBMS_OUTPUT.PUT_LINE('  ──────────────────────────────────────────────────────');

    IF v_reuniones = 0 THEN
        DBMS_OUTPUT.PUT_LINE('  NOTA: No hay reuniones registradas en este periodo.');
    ELSIF v_porcentaje >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('  ESTADO: EXCELENTE - Participacion sobresaliente');
    ELSIF v_porcentaje >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('  ESTADO: BUENA - Participacion aceptable');
    ELSIF v_porcentaje >= 50 THEN
        DBMS_OUTPUT.PUT_LINE('  ESTADO: ATENCION - Participacion por debajo del esperado');
    ELSE
        DBMS_OUTPUT.PUT_LINE('  ╔════════════════════════════════════════════════════╗');
        DBMS_OUTPUT.PUT_LINE('  ║  *** ALERTA CRITICA ***                            ║');
        DBMS_OUTPUT.PUT_LINE('  ║  Inasistencia supera el 30% del bimestre           ║');
        DBMS_OUTPUT.PUT_LINE('  ║  ACCION REQUERIDA: El miembro DEBE SER RETIRADO    ║');
        DBMS_OUTPUT.PUT_LINE('  ║  del club segun el reglamento establecido.          ║');
        DBMS_OUTPUT.PUT_LINE('  ╚════════════════════════════════════════════════════╝');
    END IF;
    DBMS_OUTPUT.PUT_LINE('');
END CASJ_SP_PARTICIPACION_BIMESTRE;
/

