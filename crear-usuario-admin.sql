-- 1. Crear el usuario administrador
CREATE USER 'adm'@'localhost' IDENTIFIED BY 'cifo_2026';

-- 2. Otorgarle absolutamente todos los permisos (rol de root)
GRANT ALL PRIVILEGES ON *.* TO 'adm'@'localhost' WITH GRANT OPTION;

-- 3. Aplicar los cambios en el sistema
FLUSH PRIVILEGES;

