--V1
CREATE TABLE aulas (
    id_aulas SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    edificio VARCHAR(50)
);


CREATE TABLE estados_pizarra (
    id_estados_pizarra SERIAL PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE
);


CREATE TABLE pizarras (
    id_pizarras SERIAL PRIMARY KEY,
    id_aula INT,
    id_estado INT,

    FOREIGN KEY (id_aula) REFERENCES aulas(id_aulas),
    FOREIGN KEY (id_estado) REFERENCES estados_pizarra(id_estados_pizarra)
);


CREATE TABLE tecnicos (
    id_tecnicos SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(50)
);

CREATE TABLE reportes_fallos (
    id_reportes_fallos SERIAL PRIMARY KEY,
    fecha DATE,
    descripcion VARCHAR(50),
    id_pizarra INT,
    id_tecnico INT,

    FOREIGN KEY (id_pizarra) REFERENCES pizarras(id_pizarras)
        ON DELETE CASCADE,

    FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnicos)
        ON DELETE SET NULL
);

-- V2 ---- Insertar datos de ejemplo ------
INSERT INTO aulas (nombre, edificio) VALUES
('Aula 101', 'Edificio A'),
('Aula 202', 'Edificio B'),
('Laboratorio 1', 'Edificio C');

INSERT INTO estados_pizarra (nombre) VALUES
('Operativa'),
('En Reparación'),
('Fuera de Servicio');

INSERT INTO pizarras (id_aula, id_estado) VALUES
(1, 1),
(2, 1),
(3, 1);

--V3 Datos restantes de ejemplo
INSERT INTO tecnicos (nombre, especialidad) VALUES
('Carlos López', 'Hardware'),
('Ana Martínez', 'Electrónica'),
('Luis Gómez', 'Sistemas');

INSERT INTO reportes_fallos (fecha, descripcion, id_pizarra, id_tecnico) VALUES
(CURRENT_DATE, 'No enciende', 1, 1),
(CURRENT_DATE, 'Pantalla dañada', 2, 2),
(CURRENT_DATE, 'Problema de conexión', 3, 3);

