SHOW VARIABLES LIKE 'secure_file_priv';
-- Guardar el archivo csv del Power Query acá 

DROP DATABASE ventas;

CREATE DATABASE IF NOT EXISTS ventas;
USE ventas;

CREATE TABLE IF NOT EXISTS ventas (
 año INT NOT NULL,
 mes INT NOT NULL,
 id INT NOT NULL,
 producto VARCHAR(100) NOT NULL,
 provincia VARCHAR(20) NOT NULL,
 ventas DECIMAL(10,2) NOT NULL
);
-- Las columnas deben ir en el mismo orden

SET GLOBAL local_infile = 1;

LOAD DATA INFILE -- quitar LOCAL (ya lo pone la instrucción anterior en 8.4)
    'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/Ventas.csv'
INTO TABLE ventas
CHARACTER SET latin1 -- cambiar el UTF8mb4 por latin1 que es el que usa Excel
FIELDS TERMINATED BY ';' -- Excel separa las columnas con ;
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM ventas;

