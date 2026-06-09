-- ============================================================
-- CLUBES DE LECTURA - BASE DE DATOS TRANSACCIONAL (NUEVO MODELO)
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
    -- Nacionalidades
    (SELECT LISTAGG(p.gentilicio, ', ') WITHIN GROUP (ORDER BY p.gentilicio)
     FROM CASJ_MIEMBRO_NACIONALIDAD mn
     JOIN CASJ_PAIS p ON mn.id_pais = p.id_pais
     WHERE mn.id_miembro = m.id_miembro) AS nacionalidades,
    -- Idiomas
    (SELECT LISTAGG(i.nombre, ', ') WITHIN GROUP (ORDER BY i.nombre)
     FROM CASJ_IDIOMA_CLUB_LECTOR icl
     JOIN CASJ_IDIOMA i ON icl.id_idioma = i.id_idioma
     WHERE icl.id_club_lector = m.id_miembro) AS idiomas,
    -- Club activo
    hm.id_club,
    c.nombre AS club_actual,
    hm.fecha_inicio AS fecha_ingreso_club,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hm.fecha_inicio)) AS meses_antiguedad,
    -- Grupo activo
    gl.id_grupo,
    gl.tipo AS tipo_grupo,
    -- Representante
    r.nombre || ' ' || r.apellido AS representante
FROM CASJ_MIEMBRO m
LEFT JOIN CASJ_HISTORICO_MEMBRESIA hm ON m.id_miembro = hm.id_miembro
    AND hm.activo = 'S'
LEFT JOIN CASJ_CLUB c ON hm.id_club = c.id_club
LEFT JOIN CASJ_ASIGNACION a ON m.id_miembro = a.id_miembro
    AND a.fecha_fin IS NULL
LEFT JOIN CASJ_GRUPO_LECTURA gl ON a.id_grupo = gl.id_grupo
LEFT JOIN CASJ_REPRESENTANTE r ON m.id_representante = r.id_representante;

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
    (SELECT COUNT(DISTINCT cal.ISBN)
     FROM CASJ_CALENDARIO_REUNION_MES cal
     JOIN CASJ_GRUPO_LECTURA gl ON cal.id_grupo = gl.id_grupo
     JOIN CASJ_ASIGNACION asig ON asig.id_grupo = gl.id_grupo
        AND asig.id_miembro = m.id_miembro
     WHERE gl.id_club = c.id_club AND cal.realizada = 'S') AS libros_analizados
FROM CASJ_MIEMBRO m
JOIN CASJ_HISTORICO_MEMBRESIA hm ON m.id_miembro = hm.id_miembro
JOIN CASJ_CLUB c ON hm.id_club = c.id_club
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
     FROM CASJ_IDIOMA_CLUB_LECTOR icl
     JOIN CASJ_IDIOMA i ON icl.id_idioma = i.id_idioma
     WHERE icl.id_club_lector = c.id_club) AS idiomas,
    -- Grupos
    (SELECT COUNT(*) FROM CASJ_GRUPO_LECTURA gl WHERE gl.id_club = c.id_club AND gl.tipo = 'ADULTO') AS grupos_adultos,
    (SELECT COUNT(*) FROM CASJ_GRUPO_LECTURA gl WHERE gl.id_club = c.id_club AND gl.tipo = 'JUVENIL') AS grupos_juveniles,
    (SELECT COUNT(*) FROM CASJ_GRUPO_LECTURA gl WHERE gl.id_club = c.id_club AND gl.tipo = 'INFANTIL') AS grupos_infantiles,
    -- Total miembros activos
    (SELECT COUNT(DISTINCT hm.id_miembro)
     FROM CASJ_HISTORICO_MEMBRESIA hm
     WHERE hm.id_club = c.id_club AND hm.activo = 'S') AS miembros_activos,
    -- Clubes asociados
    (SELECT LISTAGG(c2.nombre, ', ') WITHIN GROUP (ORDER BY c2.nombre)
     FROM CASJ_ASOCIADOS a
     JOIN CASJ_CLUB c2 ON (CASE WHEN a.id_club_1 = c.id_club THEN a.id_club_2 ELSE a.id_club_1 END) = c2.id_club
     WHERE a.id_club_1 = c.id_club OR a.id_club_2 = c.id_club) AS clubes_asociados
FROM CASJ_CLUB c
JOIN CASJ_CIUDAD ci ON c.id_ciudad = ci.id_ciudad
JOIN CASJ_PAIS p ON ci.id_pais = p.id_pais
LEFT JOIN CASJ_INSTITUCION inst ON c.id_institucion = inst.id_institucion;

-- ============================================================
-- 4. CASJ_VW_FICHA_LIBRO
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_FICHA_LIBRO AS
SELECT
    l.ISBN,
    l.titulo,
    l.anio_publicacion,
    l.cantidad_pag,
    l.tipo_narrativa,
    l.temas_resumen,
    l.sinopsis,
    -- Autores
    (SELECT LISTAGG(au.nombre || ' ' || NVL(au.apellido,''), ', ') WITHIN GROUP (ORDER BY au.apellido)
     FROM CASJ_LIBRO_AUTOR la
     JOIN CASJ_AUTOR au ON la.id_autor = au.id_autor
     WHERE la.ISBN = l.ISBN) AS autores,
    -- Valoracion promedio
    (SELECT ROUND(AVG(cal.valoracionfinal), 2)
     FROM CASJ_CALENDARIO_REUNION_MES cal
     WHERE cal.ISBN = l.ISBN AND cal.valoracionfinal IS NOT NULL) AS valoracion_promedio,
    -- Veces discutido
    (SELECT COUNT(*)
     FROM CASJ_CALENDARIO_REUNION_MES cal
     WHERE cal.ISBN = l.ISBN AND cal.realizada = 'S') AS veces_analizado
FROM CASJ_LIBRO l;

-- ============================================================
-- 5. CASJ_VW_LIBROS_VALORADOS
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_LIBROS_VALORADOS AS
SELECT
    l.ISBN,
    l.titulo,
    (SELECT LISTAGG(au.nombre || ' ' || NVL(au.apellido,''), ', ') WITHIN GROUP (ORDER BY au.apellido)
     FROM CASJ_LIBRO_AUTOR la
     JOIN CASJ_AUTOR au ON la.id_autor = au.id_autor
     WHERE la.ISBN = l.ISBN) AS autores,
    c.nombre AS club,
    ROUND(AVG(cal.valoracionfinal), 2) AS valoracion_promedio,
    COUNT(cal.id_calendario) AS veces_analizado
FROM CASJ_LIBRO l
JOIN CASJ_CALENDARIO_REUNION_MES cal ON l.ISBN = cal.ISBN
JOIN CASJ_GRUPO_LECTURA gl ON cal.id_grupo = gl.id_grupo
JOIN CASJ_CLUB c ON gl.id_club = c.id_club
WHERE cal.realizada = 'S' AND cal.valoracionfinal IS NOT NULL
GROUP BY l.ISBN, l.titulo, c.nombre
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
    gl.id_grupo,
    gl.tipo AS tipo_grupo,
    hm.fecha_inicio AS miembro_desde,
    a.fecha_inicio AS en_grupo_desde
FROM CASJ_MIEMBRO m
JOIN CASJ_HISTORICO_MEMBRESIA hm ON m.id_miembro = hm.id_miembro
    AND hm.activo = 'S'
JOIN CASJ_CLUB c ON hm.id_club = c.id_club
JOIN CASJ_ASIGNACION a ON m.id_miembro = a.id_miembro
    AND a.fecha_fin IS NULL
JOIN CASJ_GRUPO_LECTURA gl ON a.id_grupo = gl.id_grupo
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
    gl.tipo AS tipo_grupo,
    EXTRACT(YEAR FROM cal.fecha) AS anio,
    CEIL(EXTRACT(MONTH FROM cal.fecha) / 2) AS bimestre,
    COUNT(cal.id_calendario) - COUNT(i.id_calendario) AS reuniones_asistidas,
    COUNT(cal.id_calendario) AS total_reuniones,
    ROUND((COUNT(cal.id_calendario) - COUNT(i.id_calendario)) * 100.0 / 
          NULLIF(COUNT(cal.id_calendario), 0), 2) AS porcentaje_asistencia
FROM CASJ_MIEMBRO m
JOIN CASJ_ASIGNACION asig ON m.id_miembro = asig.id_miembro
JOIN CASJ_GRUPO_LECTURA gl ON asig.id_grupo = gl.id_grupo
JOIN CASJ_CLUB c ON gl.id_club = c.id_club
JOIN CASJ_CALENDARIO_REUNION_MES cal ON gl.id_grupo = cal.id_grupo
    AND cal.fecha >= asig.fecha_inicio 
    AND (asig.fecha_fin IS NULL OR cal.fecha <= asig.fecha_fin)
    AND cal.realizada = 'S'
LEFT JOIN CASJ_INASISTENCIA i ON cal.id_calendario = i.id_calendario 
    AND i.id_miembro = m.id_miembro
GROUP BY m.id_miembro, m.primer_nombre, m.primer_apellido, m.segundo_apellido,
         c.nombre, gl.tipo,
         EXTRACT(YEAR FROM cal.fecha), CEIL(EXTRACT(MONTH FROM cal.fecha) / 2)
ORDER BY anio, bimestre, c.nombre, nombre_completo;

-- ============================================================
-- 8. CASJ_VW_ORDEN_LECTURA
-- Muestra el orden de lectura recomendado de sagas
-- ============================================================
CREATE OR REPLACE VIEW CASJ_VW_ORDEN_LECTURA AS
SELECT
    l1.titulo AS libro_anterior,
    l1.anio_publicacion AS anio_anterior,
    l2.titulo AS libro_siguiente,
    l2.anio_publicacion AS anio_siguiente,
    (SELECT LISTAGG(au.nombre || ' ' || NVL(au.apellido,''), ', ') WITHIN GROUP (ORDER BY au.apellido)
     FROM CASJ_LIBRO_AUTOR la
     JOIN CASJ_AUTOR au ON la.id_autor = au.id_autor
     WHERE la.ISBN = l1.ISBN) AS autor
FROM CASJ_LIBRO l2
JOIN CASJ_LIBRO l1 ON l2.ISBN_orden = l1.ISBN
ORDER BY autor;

-- ============================================================
-- 9. CASJ_VW_PAISES_MONEDAS
-- Vista auxiliar para la funcion de conversion monetaria
-- Muestra paises disponibles con su moneda
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
        ELSE 1.0
    END AS tasa_vs_usd
FROM CASJ_PAIS p;

-- ============================================================
-- VERIFICACION
-- ============================================================
SELECT view_name FROM user_views WHERE view_name LIKE 'CASJ_%' ORDER BY view_name;
