CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50),
fecha DATE NOT NULL,
texto VARCHAR (500),
likes INT
);

CREATE TABLE productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50),
url VARCHAR (200),
fecha DATE NOT NULL,
autor VARCHAR (50),
genero VARCHAR (50),
usuarios_id INT UNSIGNED NOT NULL,
FOREIGN KEY (usuarios_id) REFERENCES usuarios (id)
);

CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha DATE NOT NULL,
texto VARCHAR (500),
usuarios_id INT UNSIGNED NOT NULL,
productos_id INT UNSIGNED NOT NULL,
FOREIGN KEY (productos_id) REFERENCES productos (id),
FOREIGN KEY (usuarios_id) REFERENCES usuarios (id)
);

ALTER TABLE usuarios
add celular INT NOT NULL;

ALTER TABLE usuarios
DROP texto;

ALTER TABLE usuarios
DROP likes;

ALTER TABLE usuarios
add apellido VARCHAR (50);

ALTER TABLE usuarios
add email VARCHAR (200);

ALTER TABLE usuarios
add contraseña VARCHAR (50);

INSERT INTO usuarios
VALUES (DEFAULT, 'Kourtney', '2010-04-02', 155327835, 'Kardashian', 'kourt.kardashian@gmail.com', 'kourtney');

SELECT id, nombre, fecha, celular, apellido, email, contraseña
FROM usuarios;

DELETE FROM usuarios WHERE id=2;

ALTER TABLE productos
add descripcion VARCHAR (600);

INSERT INTO productos
VALUES (DEFAULT, 'Dimelo bajito', '/images/productos/romantica2.jpg','2013-08-18', 'Mercedes Ron', 'Romance', 6, '            {usuario: "Kris Jenner", comentario : " Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo. "},
');

SELECT id, nombre, url, fecha, autor, genero, usuarios_id, descripcion
FROM productos;

DELETE FROM productos WHERE id=1;

INSERT INTO comentarios
VALUES (DEFAULT, '2017-04-06', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 4, 13);

SELECT id, fecha, texto, usuarios_id, productos_id
FROM comentarios;