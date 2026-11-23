-- Crear la base de datos universidad
DROP DATABASE IF EXISTS universidad;

CREATE DATABASE IF NOT EXISTS universidad
DEFAULT CHARACTER SET utf8mb4;

USE universidad;

-- CREAR TABLA CARRERAS
CREATE TABLE IF NOT EXISTS  carreras (
    id_carrera INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- CREAR TABLA MATERIAS 
CREATE TABLE IF NOT EXISTS  materia (
id_materia INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

-- AÑADIR CLAVE FORÁNEA A MATERIA
ALTER TABLE materia
ADD COLUMN id_carrera INT,
ADD CONSTRAINT fk_materia_carrera
    FOREIGN KEY (id_carrera)
    REFERENCES carreras(id_carrera);

-- VERIFICAR
DESCRIBE materia;
SHOW CREATE TABLE materia;

-- INSERTAR 3 CARRERAS
INSERT INTO carreras (nombre)
VALUES
    ('Informática'),
    ('Medicina'),
    ('Derecho');

 SELECT id_carrera, nombre
FROM carreras;

-- INSERTAR 3 MATERIAS
INSERT INTO materia (nombre, id_carrera)
VALUES
    ('Programación', 1),
    ('Anatomía', 2),
    ('Derecho Civil', 3);

SELECT id_materia, nombre, id_carrera
FROM materia;

-- INNER JOIN
SELECT
    c.nombre AS carrera,
    m.nombre AS materia
FROM carreras AS c
INNER JOIN materia AS m
    ON c.id_carrera = m.id_carrera;

-- VERIFICAR JOIN
SELECT
    c.id_carrera,
    c.nombre AS carrera,
    m.id_materia,
    m.nombre AS materia
FROM carreras AS c
INNER JOIN materia AS m
    ON c.id_carrera = m.id_carrera;

-- CREAR TABLA ESTUDIANTES
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_carrera INT,
    CONSTRAINT fk_estudiantes_carreras
        FOREIGN KEY (id_carrera)
        REFERENCES carreras(id_carrera)
);

-- INSERTAR 4 ESTUDIANTES
INSERT INTO estudiantes (nombre, id_carrera)
VALUES
    ('Ana García', 1),
    ('Pedro López', 2),
    ('María Martínez', 3),
    ('Juan Pérez', 1);

-- VERIFICAR
SELECT
    id_estudiante,
    nombre,
    id_carrera
FROM estudiantes;

-- INNER JOIN ESTUDIANTES Y CARRERAS
SELECT
    e.nombre AS estudiante,
    c.nombre AS carrera
FROM estudiantes AS e
INNER JOIN carreras AS c
    ON e.id_carrera = c.id_carrera;

 -- VERIFICAR INNER JOIN ESTUDIANTES Y CARRERAS
SELECT
    e.id_estudiante,
    e.nombre AS estudiante,
    e.id_carrera,
    c.nombre AS carrera
FROM estudiantes AS e
INNER JOIN carreras AS c
    ON e.id_carrera = c.id_carrera;

-- CREAR TABLA PROFESORES
CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_carrera INT,
    id_materia INT,
    CONSTRAINT fk_profesores_carreras
        FOREIGN KEY (id_carrera)
        REFERENCES carreras(id_carrera),
    CONSTRAINT fk_profesores_materia
        FOREIGN KEY (id_materia)
        REFERENCES materia(id_materia)
);

USE universidad;

-- INSERTAR CARRERA BIOLOGÍA
INSERT INTO carreras (nombre)
VALUES ('Biología');

SELECT
    id_carrera,
    nombre
FROM carreras;

-- LEFT JOIN CARRERAS Y ESTUDIANTES
SELECT
    c.id_carrera,
    c.nombre AS carrera,
    e.nombre AS estudiante
FROM carreras AS c
LEFT JOIN estudiantes AS e
    ON c.id_carrera = e.id_carrera;

-- lEFT JOIN CARRERAS Y MATERIAS
SELECT
    c.id_carrera,
    c.nombre AS carrera,
    m.nombre AS materia
FROM carreras AS c
LEFT JOIN materia AS m
    ON c.id_carrera = m.id_carrera;

SELECT *
FROM carreras
LEFT JOIN materia
    ON carreras.id_carrera = materia.id_carrera;

 -- INSERTAR MATERIA MATEMATICAS
INSERT INTO materia (nombre)
VALUES ('Matematicas');

-- JOIN CARRERA Y MATERIAS 
-- COMO LA NUEVA MATERIA NO TIENE CARRERA NO SALE LA MATERIA EN EL JOIN
SELECT
    c.id_carrera,
    c.nombre AS carrera,
    m.nombre AS materia
FROM carreras AS c
INNER JOIN materia AS m
    ON c.id_carrera = m.id_carrera;

-- RIGHT JOIN CARRERAS Y MATERIAS
SELECT
    c.nombre AS carrera,
    m.nombre AS materia
FROM carreras AS c
RIGHT JOIN materia AS m
    ON c.id_carrera = m.id_carrera;

