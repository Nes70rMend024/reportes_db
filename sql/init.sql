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