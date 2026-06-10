-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL
-- Archivo: 04_vistas.sql
-- Descripcion: Vistas para consultas frecuentes y soporte a funciones
-- Prefijo: CASJ_
-- MBD: Oracle
-- ============================================================

-- ============================================================
-- 1. CASJ_VW_FICHA_MIEMBRO
-- Vista completa de cada miembro con todos sus datos
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_FICHA_MIEMBRO AS
SELECT
    m.id_miembro,
    m.primer_nombre || ' ' ||
        NVL(m.segundo_nombre || ' ', '') ||
        m.primer_apellido || ' ' ||
        m.segundo_apellido AS nombre_completo,
    m.primer_nombre,
    m.primer_apellido,
    m.segundo_apellido,
    m.doc_identidad,
    m.fecha_nacimiento,
    TRUNC(MONTHS_BETWEEN(SYSDATE, m.fecha_nacimiento) / 12) AS edad,
    m.email,
    m.telefono,
    -- Nacionalidad (FK directa)
    p_nac.gentilicio AS nacionalidad,
    -- Idiomas del miembro
    (SELECT LISTAGG(i.nombre, ', ') WITHIN GROUP (ORDER BY i.nombre)
     FROM casj_idioma_lector il
     JOIN casj_idiomas i ON il.id_idioma = i.id_idioma
     WHERE il.id_miembro = m.id_miembro) AS idiomas,
    -- Club activo
    hm.id_club,
    c.nombre AS club_actual,
    hm.fecha_inicio AS fecha_ingreso_club,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hm.fecha_inicio)) AS meses_antiguedad,
    -- Grupo activo
    a.id_grupo,
    DECODE(gl.tipo, 'A', 'ADULTO', 'J', 'JUVENIL', 'N', 'NINOS', gl.tipo) AS tipo_grupo,
    -- Representante
    r.nombre || ' ' || r.apellido AS representante
FROM casj_miembros_lectores m
LEFT JOIN casj_paises p_nac ON m.id_pais_nacionalidad = p_nac.id_pais
LEFT JOIN casj_historico_membresia hm ON m.id_miembro = hm.id_miembro
    AND hm.activo = 'S'
LEFT JOIN casj_clubes c ON hm.id_club = c.id_club
LEFT JOIN casj_asignaciones a ON m.id_miembro = a.id_miembro
    AND a.fecha_fin IS NULL
LEFT JOIN casj_grupos_lectura gl ON a.id_club = gl.id_club AND a.id_grupo = gl.id_grupo
LEFT JOIN casj_representantes r ON m.id_representante = r.id_representante;

-- ============================================================
-- 2. CASJ_VW_HISTORIAL_MIEMBRO
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_HISTORIAL_MIEMBRO AS
SELECT
    m.id_miembro,
    m.primer_nombre || ' ' || m.primer_apellido || ' ' || m.segundo_apellido AS nombre_completo,
    c.nombre AS nombre_club,
    hm.fecha_inicio,
    hm.fecha_fin,
    hm.activo,
    hm.motivo_salida,
    TRUNC(MONTHS_BETWEEN(NVL(hm.fecha_fin, SYSDATE), hm.fecha_inicio)) AS meses_en_club,
    -- Libros analizados en ese club
    (SELECT COUNT(DISTINCT cal.isbn)
     FROM casj_calendario_reunion_mes cal
     JOIN casj_asignaciones asig ON asig.id_club = cal.id_club
        AND asig.id_grupo = cal.id_grupo
        AND asig.id_miembro = m.id_miembro
     WHERE cal.id_club = c.id_club AND cal.realizada = 'S') AS libros_analizados
FROM casj_miembros_lectores m
JOIN casj_historico_membresia hm ON m.id_miembro = hm.id_miembro
JOIN casj_clubes c ON hm.id_club = c.id_club
ORDER BY m.id_miembro, hm.fecha_inicio;

-- ============================================================
-- 3. CASJ_VW_FICHA_CLUB
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_FICHA_CLUB AS
SELECT
    c.id_club,
    c.nombre AS nombre_club,
    c.direccion,
    c.cod_postal,
    ci.nombre AS ciudad,
    p.nombre AS pais,
    p.moneda AS moneda_pais,
    CASE WHEN c.id_institucion IS NULL THEN 'INDEPENDIENTE' ELSE 'DEPENDIENTE' END AS tipo_club,
    c.cuota_membresia,
    inst.nombre AS institucion,
    -- Idiomas del club
    (SELECT LISTAGG(i.nombre, ', ') WITHIN GROUP (ORDER BY i.nombre)
     FROM casj_idioma_lector il
     JOIN casj_idiomas i ON il.id_idioma = i.id_idioma
     WHERE il.id_club = c.id_club) AS idiomas,
    -- Grupos por tipo
    (SELECT COUNT(*) FROM casj_grupos_lectura gl WHERE gl.id_club = c.id_club AND gl.tipo = 'A') AS grupos_adultos,
    (SELECT COUNT(*) FROM casj_grupos_lectura gl WHERE gl.id_club = c.id_club AND gl.tipo = 'J') AS grupos_juveniles,
    (SELECT COUNT(*) FROM casj_grupos_lectura gl WHERE gl.id_club = c.id_club AND gl.tipo = 'N') AS grupos_ninos,
    -- Total miembros activos
    (SELECT COUNT(DISTINCT hm.id_miembro)
     FROM casj_historico_membresia hm
     WHERE hm.id_club = c.id_club AND hm.activo = 'S') AS miembros_activos,
    -- Clubes asociados
    (SELECT LISTAGG(c2.nombre, ', ') WITHIN GROUP (ORDER BY c2.nombre)
     FROM casj_asociados a
     JOIN casj_clubes c2 ON (CASE WHEN a.id_club = c.id_club THEN a.id_club_asociado ELSE a.id_club END) = c2.id_club
     WHERE a.id_club = c.id_club OR a.id_club_asociado = c.id_club) AS clubes_asociados
FROM casj_clubes c
JOIN casj_ciudades ci ON c.id_ciudad = ci.id_ciudad
JOIN casj_paises p ON ci.id_pais = p.id_pais
LEFT JOIN casj_instituciones inst ON c.id_institucion = inst.id_institucion;

-- ============================================================
-- 4. CASJ_VW_FICHA_LIBRO
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_FICHA_LIBRO AS
SELECT
    l.isbn,
    l.titulo,
    l.anio_publicacion,
    l.cantidad_pag,
    l.tipo_narrativa,
    l.temas_resumen,
    l.sinopsis,
    p.nombre AS pais_publicacion,
    i.nombre AS idioma,
    l.orden_lectura,
    -- Autores
    (SELECT LISTAGG(au.nombre || ' ' || NVL(au.apellido,''), ', ') WITHIN GROUP (ORDER BY au.apellido)
     FROM casj_libro_autor la
     JOIN casj_autores au ON la.id_autor = au.id_autor
     WHERE la.isbn = l.isbn) AS autores,
    -- Valoracion promedio
    (SELECT ROUND(AVG(cal.valoracion_final), 2)
     FROM casj_calendario_reunion_mes cal
     WHERE cal.isbn = l.isbn AND cal.valoracion_final IS NOT NULL) AS valoracion_promedio,
    -- Veces discutido
    (SELECT COUNT(*)
     FROM casj_calendario_reunion_mes cal
     WHERE cal.isbn = l.isbn AND cal.realizada = 'S') AS veces_analizado
FROM casj_libros l
LEFT JOIN casj_paises p ON l.id_pais_publicacion = p.id_pais
LEFT JOIN casj_idiomas i ON l.id_idioma = i.id_idioma;

-- ============================================================
-- 5. CASJ_VW_LIBROS_VALORADOS
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_LIBROS_VALORADOS AS
SELECT
    l.isbn,
    l.titulo,
    (SELECT LISTAGG(au.nombre || ' ' || NVL(au.apellido,''), ', ') WITHIN GROUP (ORDER BY au.apellido)
     FROM casj_libro_autor la
     JOIN casj_autores au ON la.id_autor = au.id_autor
     WHERE la.isbn = l.isbn) AS autores,
    c.nombre AS club,
    ROUND(AVG(cal.valoracion_final), 2) AS valoracion_promedio,
    COUNT(*) AS veces_analizado
FROM casj_libros l
JOIN casj_calendario_reunion_mes cal ON l.isbn = cal.isbn
JOIN casj_grupos_lectura gl ON cal.id_club = gl.id_club AND cal.id_grupo = gl.id_grupo
JOIN casj_clubes c ON gl.id_club = c.id_club
WHERE cal.realizada = 'S' AND cal.valoracion_final IS NOT NULL
GROUP BY l.isbn, l.titulo, c.nombre
ORDER BY valoracion_promedio DESC, l.titulo;

-- ============================================================
-- 6. CASJ_VW_MIEMBROS_ACTIVOS
-- Vista clave para la interfaz interactiva de las funciones
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_MIEMBROS_ACTIVOS AS
SELECT
    m.id_miembro,
    m.primer_nombre,
    m.primer_apellido,
    m.segundo_apellido,
    m.primer_nombre || ' ' || m.primer_apellido || ' ' || m.segundo_apellido AS nombre_completo,
    m.doc_identidad,
    TRUNC(MONTHS_BETWEEN(SYSDATE, m.fecha_nacimiento) / 12) AS edad,
    c.id_club,
    c.nombre AS club,
    a.id_grupo,
    DECODE(gl.tipo, 'A', 'ADULTO', 'J', 'JUVENIL', 'N', 'NINOS', gl.tipo) AS tipo_grupo,
    hm.fecha_inicio AS miembro_desde,
    a.fecha_inicio AS en_grupo_desde
FROM casj_miembros_lectores m
JOIN casj_historico_membresia hm ON m.id_miembro = hm.id_miembro
    AND hm.activo = 'S'
JOIN casj_clubes c ON hm.id_club = c.id_club
JOIN casj_asignaciones a ON m.id_miembro = a.id_miembro
    AND a.fecha_fin IS NULL
JOIN casj_grupos_lectura gl ON a.id_club = gl.id_club AND a.id_grupo = gl.id_grupo
ORDER BY c.nombre, gl.tipo, m.primer_apellido;

-- ============================================================
-- 7. CASJ_VW_ASISTENCIA_BIMESTRE
-- Asistencias = Total reuniones - Inasistencias
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_ASISTENCIA_BIMESTRE AS
SELECT
    m.id_miembro,
    m.primer_nombre || ' ' || m.primer_apellido || ' ' || m.segundo_apellido AS nombre_completo,
    c.nombre AS club,
    DECODE(gl.tipo, 'A', 'ADULTO', 'J', 'JUVENIL', 'N', 'NINOS', gl.tipo) AS tipo_grupo,
    EXTRACT(YEAR FROM cal.fecha_reunion) AS anio,
    CEIL(EXTRACT(MONTH FROM cal.fecha_reunion) / 2) AS bimestre,
    COUNT(*) - COUNT(ina.id_miembro) AS reuniones_asistidas,
    COUNT(*) AS total_reuniones,
    ROUND((COUNT(*) - COUNT(ina.id_miembro)) * 100.0 /
          NULLIF(COUNT(*), 0), 2) AS porcentaje_asistencia
FROM casj_miembros_lectores m
JOIN casj_asignaciones asig ON m.id_miembro = asig.id_miembro
JOIN casj_grupos_lectura gl ON asig.id_club = gl.id_club AND asig.id_grupo = gl.id_grupo
JOIN casj_clubes c ON gl.id_club = c.id_club
JOIN casj_calendario_reunion_mes cal ON gl.id_club = cal.id_club AND gl.id_grupo = cal.id_grupo
    AND cal.fecha_reunion >= asig.fecha_inicio
    AND (asig.fecha_fin IS NULL OR cal.fecha_reunion <= asig.fecha_fin)
    AND cal.realizada = 'S'
LEFT JOIN casj_inasistencias ina ON cal.id_club = ina.id_club
    AND cal.id_grupo = ina.id_grupo
    AND cal.fecha_reunion = ina.fecha_reunion
    AND ina.id_miembro = m.id_miembro
GROUP BY m.id_miembro, m.primer_nombre, m.primer_apellido, m.segundo_apellido,
         c.nombre, gl.tipo,
         EXTRACT(YEAR FROM cal.fecha_reunion), CEIL(EXTRACT(MONTH FROM cal.fecha_reunion) / 2)
ORDER BY anio, bimestre, c.nombre, nombre_completo;

-- ============================================================
-- 8. CASJ_VW_ORDEN_LECTURA
-- Muestra el orden de lectura recomendado de sagas
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_ORDEN_LECTURA AS
SELECT
    l2.titulo AS libro,
    l2.anio_publicacion AS anio,
    l2.orden_lectura,
    l1.titulo AS libro_anterior,
    l1.anio_publicacion AS anio_anterior,
    (SELECT LISTAGG(au.nombre || ' ' || NVL(au.apellido,''), ', ') WITHIN GROUP (ORDER BY au.apellido)
     FROM casj_libro_autor la
     JOIN casj_autores au ON la.id_autor = au.id_autor
     WHERE la.isbn = l2.isbn) AS autor
FROM casj_libros l2
JOIN casj_libros l1 ON l2.isbn_anterior = l1.isbn
ORDER BY autor, l2.orden_lectura;

-- ============================================================
-- 9. CASJ_VW_PAISES_MONEDAS
-- Vista auxiliar para la funcion de conversion monetaria
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_PAISES_MONEDAS AS
SELECT
    p.id_pais,
    p.nombre AS pais,
    p.moneda AS codigo_moneda,
    CASE p.moneda
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
        ELSE p.moneda
    END AS nombre_moneda,
    CASE p.moneda
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
    END AS tasa_vs_usd
FROM casj_paises p;

-- ============================================================
-- VERIFICACION
-- ============================================================
SELECT view_name FROM user_views WHERE UPPER(view_name) LIKE 'CASJ_%' ORDER BY view_name;
