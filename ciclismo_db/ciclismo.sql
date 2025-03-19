-- EJERCICIO REALIZADO POR SERGIO DANIEL CASTELLANOS RODRIGUEZ
-- ELIMINAR LA BASE DE DATOS SI EXISTE.
DROP DATABASE IF EXISTS ciclismo_db;

-- CREAR LA BASE DE DATOS.
CREATE DATABASE ciclismo_db;

-- SELECCIONAR LA BASE DE DATOS.
USE ciclismo_db;

-- CREACIÓN DE LA TABLA EQUIPOS: ALMACENA INFORMACIÓN SOBRE LOS EQUIPOS PARTICIPANTES.
CREATE TABLE Equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID ÚNICO PARA CADA EQUIPO.
    nombre VARCHAR(100) NOT NULL,       -- NOMBRE DEL EQUIPO.
    pais VARCHAR(50) NOT NULL           -- PAÍS DE ORIGEN DEL EQUIPO.
);

-- CREACIÓN DE LA TABLA CICLISTAS: ALMACENA INFORMACIÓN SOBRE LOS CICLISTAS Y SU RELACIÓN CON LOS EQUIPOS.
CREATE TABLE Ciclistas (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID ÚNICO PARA CADA CICLISTA.
    nombre VARCHAR(100) NOT NULL,       -- NOMBRE DEL CICLISTA.
    equipo_id INT,                      -- ID DEL EQUIPO AL QUE PERTENECE EL CICLISTA.
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)  -- RELACIÓN CON LA TABLA EQUIPOS.
);

-- CREACIÓN DE LA TABLA CARRERAS: REGISTRA LAS CARRERAS EN LAS QUE PARTICIPAN LOS EQUIPOS.
CREATE TABLE Carreras (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID ÚNICO PARA CADA CARRERA.
    nombre VARCHAR(100) NOT NULL,       -- NOMBRE DE LA CARRERA.
    fecha DATE NOT NULL                 -- FECHA EN QUE SE REALIZA LA CARRERA.
);

-- CREACIÓN DE LA TABLA RESULTADOS: ALMACENA LOS RESULTADOS DE CADA CICLISTA EN LAS CARRERAS.
CREATE TABLE Resultados (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID ÚNICO PARA CADA RESULTADO.
    ciclista_id INT,                    -- ID DEL CICLISTA.
    carrera_id INT,                     -- ID DE LA CARRERA.
    posicion INT NOT NULL,              -- POSICIÓN DEL CICLISTA EN LA CARRERA.
    FOREIGN KEY (ciclista_id) REFERENCES Ciclistas(id),  -- RELACIÓN CON LA TABLA CICLISTAS.
    FOREIGN KEY (carrera_id) REFERENCES Carreras(id)     -- RELACIÓN CON LA TABLA CARRERAS.
);

-- CREACIÓN DE LA TABLA PATROCINADORES: ALMACENA INFORMACIÓN SOBRE LOS PATROCINADORES DE LOS EQUIPOS.
CREATE TABLE Patrocinadores (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID ÚNICO PARA CADA PATROCINADOR.
    nombre VARCHAR(100) NOT NULL,       -- NOMBRE DEL PATROCINADOR.
    equipo_id INT,                      -- ID DEL EQUIPO QUE PATROCINA.
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)  -- RELACIÓN CON LA TABLA EQUIPOS.
);

-- INSERTAR 10 REGISTROS DE PRUEBA EN LA TABLA EQUIPOS.
INSERT INTO Equipos (nombre, pais) VALUES
('Team Ineos', 'Reino Unido'),         -- EQUIPO 1.
('Jumbo-Visma', 'Países Bajos'),       -- EQUIPO 2.
('Deceuninck-Quick-Step', 'Bélgica'), -- EQUIPO 3.
('Movistar Team', 'España'),           -- EQUIPO 4.
('Trek-Segafredo', 'Estados Unidos'),  -- EQUIPO 5.
('Bahrain Victorious', 'Baréin'),      -- EQUIPO 6.
('UAE Team Emirates', 'Emiratos Árabes Unidos'), -- EQUIPO 7.
('EF Education-EasyPost', 'Estados Unidos'),     -- EQUIPO 8.
('Groupama-FDJ', 'Francia'),           -- EQUIPO 9.
('Bora-Hansgrohe', 'Alemania');        -- EQUIPO 10.

-- INSERTAR 20 REGISTROS DE PRUEBA EN LA TABLA CICLISTAS.
INSERT INTO Ciclistas (nombre, equipo_id) VALUES
('Egan Bernal', 1),                    -- CICLISTA 1, EQUIPO 1.
('Primož Roglič', 2),                  -- CICLISTA 2, EQUIPO 2.
('Julian Alaphilippe', 3),             -- CICLISTA 3, EQUIPO 3.
('Alejandro Valverde', 4),             -- CICLISTA 4, EQUIPO 4.
('Bauke Mollema', 5),                  -- CICLISTA 5, EQUIPO 5.
('Mikel Landa', 6),                    -- CICLISTA 6, EQUIPO 6.
('Tadej Pogačar', 7),                  -- CICLISTA 7, EQUIPO 7.
('Rigoberto Urán', 8),                 -- CICLISTA 8, EQUIPO 8.
('Thibaut Pinot', 9),                  -- CICLISTA 9, EQUIPO 9.
('Peter Sagan', 10),                   -- CICLISTA 10, EQUIPO 10.
('Chris Froome', 1),                   -- CICLISTA 11, EQUIPO 1.
('Wout van Aert', 2),                  -- CICLISTA 12, EQUIPO 2.
('Remco Evenepoel', 3),                -- CICLISTA 13, EQUIPO 3.
('Enric Mas', 4),                      -- CICLISTA 14, EQUIPO 4.
('Richie Porte', 5),                   -- CICLISTA 15, EQUIPO 5.
('Jack Haig', 6),                      -- CICLISTA 16, EQUIPO 6.
('João Almeida', 7),                   -- CICLISTA 17, EQUIPO 7.
('Michael Woods', 8),                  -- CICLISTA 18, EQUIPO 8.
('David Gaudu', 9),                    -- CICLISTA 19, EQUIPO 9.
('Maximilian Schachmann', 10);         -- CICLISTA 20, EQUIPO 10.

-- INSERTAR 5 REGISTROS DE PRUEBA EN LA TABLA CARRERAS.
INSERT INTO Carreras (nombre, fecha) VALUES
('Tour de France', '2023-07-01'),     -- CARRERA 1.
('Vuelta a España', '2023-08-26'),    -- CARRERA 2.
('Giro de Italia', '2023-05-06'),     -- CARRERA 3.
('Paris-Roubaix', '2023-04-09'),      -- CARRERA 4.
('Liège-Bastogne-Liège', '2023-04-23'); -- CARRERA 5.

-- INSERTAR 20 REGISTROS DE PRUEBA EN LA TABLA RESULTADOS.
INSERT INTO Resultados (ciclista_id, carrera_id, posicion) VALUES
(1, 1, 1),  -- EGAN BERNAL GANÓ EL TOUR DE FRANCE.
(2, 2, 1),  -- PRIMOŽ ROGLIČ GANÓ LA VUELTA A ESPAÑA.
(3, 3, 2),  -- JULIAN ALAPHILIPPE QUEDÓ SEGUNDO EN EL GIRO DE ITALIA.
(4, 1, 5),  -- ALEJANDRO VALVERDE QUEDÓ QUINTO EN EL TOUR DE FRANCE.
(5, 2, 3),  -- BAUKE MOLLEMA QUEDÓ TERCERO EN LA VUELTA A ESPAÑA.
(6, 3, 4),  -- MIKEL LANDA QUEDÓ CUARTO EN EL GIRO DE ITALIA.
(7, 1, 2),  -- TADEJ POGAČAR QUEDÓ SEGUNDO EN EL TOUR DE FRANCE.
(8, 2, 5),  -- RIGOBERTO URÁN QUEDÓ QUINTO EN LA VUELTA A ESPAÑA.
(9, 3, 6),  -- THIBAUT PINOT QUEDÓ SEXTO EN EL GIRO DE ITALIA.
(10, 1, 7), -- PETER SAGAN QUEDÓ SÉPTIMO EN EL TOUR DE FRANCE.
(11, 2, 8), -- CHRIS FROOME QUEDÓ OCTAVO EN LA VUELTA A ESPAÑA.
(12, 3, 9), -- WOUT VAN AERT QUEDÓ NOVENO EN EL GIRO DE ITALIA.
(13, 1, 10), -- REMCO EVENEPOEL QUEDÓ DÉCIMO EN EL TOUR DE FRANCE.
(14, 2, 2),  -- ENRIC MAS QUEDÓ SEGUNDO EN LA VUELTA A ESPAÑA.
(15, 3, 3),  -- RICHIE PORTE QUEDÓ TERCERO EN EL GIRO DE ITALIA.
(16, 1, 4),  -- JACK HAIG QUEDÓ CUARTO EN EL TOUR DE FRANCE.
(17, 2, 6),  -- JOÃO ALMEIDA QUEDÓ SEXTO EN LA VUELTA A ESPAÑA.
(18, 3, 7),  -- MICHAEL WOODS QUEDÓ SÉPTIMO EN EL GIRO DE ITALIA.
(19, 1, 8),  -- DAVID GAUDU QUEDÓ OCTAVO EN EL TOUR DE FRANCE.
(20, 2, 9);  -- MAXIMILIAN SCHACHMANN QUEDÓ NOVENO EN LA VUELTA A ESPAÑA.

-- INSERTAR 10 REGISTROS DE PRUEBA EN LA TABLA PATROCINADORES.
INSERT INTO Patrocinadores (nombre, equipo_id) VALUES
('INEOS', 1),                          -- PATROCINADOR 1, EQUIPO 1.
('Jumbo', 2),                          -- PATROCINADOR 2, EQUIPO 2.
('Quick-Step', 3),                     -- PATROCINADOR 3, EQUIPO 3.
('Movistar', 4),                       -- PATROCINADOR 4, EQUIPO 4.
('Trek', 5),                           -- PATROCINADOR 5, EQUIPO 5.
('Bahrain', 6),                        -- PATROCINADOR 6, EQUIPO 6.
('Emirates', 7),                       -- PATROCINADOR 7, EQUIPO 7.
('EF Education', 8),                   -- PATROCINADOR 8, EQUIPO 8.
('Groupama', 9),                       -- PATROCINADOR 9, EQUIPO 9.
('Bora', 10);                          -- PATROCINADOR 10, EQUIPO 10.

-- ACTUALIZA LA POSICIÓN DEL CICLISTA CON ID 4 (ALEJANDRO VALVERDE) EN LA CARRERA CON ID 1 (TOUR DE FRANCE).
UPDATE Resultados
SET posicion = 3
WHERE ciclista_id = 4 AND carrera_id = 1;

-- ELIMINA AL PATROCINADOR CON ID 3 (QUICK-STEP) DE LA TABLA PATROCINADORES.
DELETE FROM Patrocinadores
WHERE id = 3;

-- MUESTRA EL NOMBRE DE LOS CICLISTAS Y EL NOMBRE DE SUS EQUIPOS.
SELECT Ciclistas.nombre, Equipos.nombre AS equipo
FROM Ciclistas
INNER JOIN Equipos ON Ciclistas.equipo_id = Equipos.id;

-- MUESTRA TODAS LAS CARRERAS Y LOS RESULTADOS (SI LOS HAY) DE CADA CARRERA.
SELECT Carreras.nombre, Resultados.posicion
FROM Carreras
LEFT JOIN Resultados ON Carreras.id = Resultados.carrera_id;

-- MUESTRA TODOS LOS PATROCINADORES Y LOS EQUIPOS QUE PATROCINAN (INCLUYENDO EQUIPOS SIN PATROCINADORES).
SELECT Patrocinadores.nombre, Equipos.nombre AS equipo
FROM Patrocinadores
RIGHT JOIN Equipos ON Patrocinadores.equipo_id = Equipos.id;