CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
celular INT NOT NULL,
mail VARCHAR (50) NOT NULL,
contraseña VARCHAR (500) NOT NULL,
nacimiento  DATE NOT NULL
);

ALTER TABLE usuarios
ADD createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE usuarios
ADD updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
url VARCHAR (200) NOT NULL,
anio INT NOT NULL,
creacion DATE NOT NULL,
autor VARCHAR (50) NOT NULL,
genero VARCHAR (50) NOT NULL,
resumen TEXT,
usuarios_id INT UNSIGNED NOT NULL,
FOREIGN KEY (usuarios_id) REFERENCES usuarios (id)
);

ALTER TABLE productos
ADD createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE productos
ADD updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha DATE NOT NULL,
texto VARCHAR (500) NOT NULL,
usuarios_id INT UNSIGNED NOT NULL,
productos_id INT UNSIGNED NOT NULL,
FOREIGN KEY (productos_id) REFERENCES productos (id),
FOREIGN KEY (usuarios_id) REFERENCES usuarios (id)
);

ALTER TABLE comentarios
ADD createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE comentarios
ADD updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

INSERT INTO usuarios
VALUES (DEFAULT, 'KourtneyK',  155327835,  'kourt.kardashian@gmail.com', 'librosfan', '1999-04-09');
INSERT INTO usuarios
VALUES (DEFAULT, 'KylieJ',  155123435,  'kyliejenner@gmail.com', 'amoloslibros', '1997-08-06');
INSERT INTO usuarios
VALUES (DEFAULT, 'KhloeK',  155320987,  'khloe.kardashian@gmail.com', 'libros1234', '1992-05-02');
INSERT INTO usuarios
VALUES (DEFAULT, 'KendallJ',  155876545,  'kendalljenner@gmail.com', 'clublectura', '1999-07-10');
INSERT INTO usuarios
VALUES (DEFAULT, 'KrissJ',  155367485,  'krissjenner@gmail.com', 'libros9876', '1977-07-12');

SELECT id, nombre, celular, mail, contraseña, nacimiento
FROM usuarios;

INSERT INTO productos
VALUES (DEFAULT, 'La chica de nieve', '/images/productos/bestseller1.jpg', 2020, '2021-08-18' , 'Javier Castillo', 'Thriller', 'Thriller perfecto que cambia las reglas del género. El desfile de Acción de Gracias más famoso del planeta. Una niña de tres años desaparecida. ¿Dónde está Kiera Templeton? Nueva York, 1998, cabalgata de Acción de Gracias. Kiera Templeton, de tan solo tres años, desaparece entre la multitud. Tras una búsqueda frenética por toda la ciudad, alguien encuentra unos mechones de pelo junto a la ropa que llevaba puesta la pequeña.En 2003, el día que hubiese sido el octavo cumpleaños de Kiera, sus padres, Aaron y Grace Templeton, reciben en casa un extraño paquete con algo inesperado: una cinta de vídeo VHS con una grabación de un minuto de Kiera, jugando en una habitación desconocida.Miren Triggs, una estudiante de periodismo de la Universidad de Columbia, se siente atraída por el caso e inicia una investigación paralela que la lleva a desentrañar aspectos de su pasado que creía olvidados, y es que su historia personal, al igual que la de Kiera, está llena de incógnitas.Después del éxito de El día que se perdió la cordura, El día que se perdió el amor y Todo lo que sucedió con Miranda Huff, con más de 650.000 ejemplares vendidos, Javier Castillo regresa con La chica de nieve, un juego de espejos y un oscuro viaje a las profundidades de la desesperación. Una novela que muestra que lo peor siempre pasa inadvertido.', 3);
INSERT INTO productos
VALUES (DEFAULT, 'Un cuento perfecto', '/images/productos/bestseller2.jpg', 2020, '2021-07-19' , 'Elísabet Benavent', 'Romance', 'Elísabet Benavent regresa al panorama de la literatura con una novela que explora el significado del éxito en la vida y reflexiona con ironía y humor acerca de las imposiciones sociales, la presión del grupo y la autoexigencia que, aunque cueste creerlo, no es sinónimo de felicidad. Los lectores han dicho...¡Un libro magnífico. Adictivo! Una historia real, bien escrita. He reído, llorado, suspirado. Elísabet, he leído todos tus libros y, aunque parezca imposible, sigues sorprendiéndome. Una historia madura que nos hace reflexionar. No es una novela al uso centrada en el amor de pareja, es eso y mucho más. Leer a Elísabet es entrar en la historia, sentirla y vivirla. Su pluma te atrapa. Te puede gustar un libro más que otro. Amar a un personaje y odiar a otros... pero siempre tienen algo que te marca y que se queda incrustado en el corazón.', 4);
INSERT INTO productos
VALUES (DEFAULT, 'El enigma de la habitacion 622', '/images/productos/bestseller3.jpg', 2020, '2021-05-15' , 'Joël Dicker', 'Policial, thriller, suspenso', 'Una noche de diciembre, un cadáver yace en el suelo de la habitación 622 del Palace de Verbier, un hotel de lujo en los Alpes suizos. La investigación policial no llegará nunca a término y el paso del tiempo hará que muchos olviden lo sucedido. Años más tarde, el escritor Joël Dicker llega a ese mismo hotel para recuperarse de una ruptura sentimental. No se imagina que terminará investigando el viejo crimen, y no lo hará solo: Scarlett, la bella huésped y aspirante a novelista de la habitación contigua, lo acompañará en la búsqueda mientras intenta aprender también las claves para escribir un buen libro. ¿Qué sucedió aquella noche en el Palace de Verbier? Es la gran pregunta de este thriller diabólico, construido con la precisión de un reloj suizo. Joël Dicker nos lleva finalmente a su país natal para narrarnos una investigación policial en la que se mezclan un triángulo amoroso, juegos de poder, traiciones y envidias en una Suiza no tan tranquila, donde la verdad es muy distinta a todo lo que hayamos imaginado.', 5);
INSERT INTO productos
VALUES (DEFAULT, 'El club del crimen de los jueves', '/images/productos/bestseller4.jpg', 2020, '2021-08-17' , 'Richard Osman', 'Ficcion moderna y contemporanea', 'En un pacífico complejo privado para jubilados, cuatro improbables amigos se reúnen una vez a la semana para revisar antiguos casos de asesinatos locales que quedaron sin resolver. Ellos son Ron, un exactivista socialista lleno de tatuajes y revolución; la dulce Joyce, una viuda que no es tan ingenua como aparenta; Ibrahim, un antiguo psiquiatra con una increíble capacidad de análisis, y la tremenda y enigmática Elizabeth, que, a sus 81 años, lidera el grupo de investigadores aficionados o no tanto.Cuando aparece el cadáver de un promotor inmobiliario de la zona con una misteriosa fotografía junto al cuerpo, El Club del Crimen de los Jueves se encuentra en medio de su primer caso real. Aunque sean octogenarios, los cuatro amigos guardan algunos trucos en la manga. ¿Podrá este grupo poco ortodoxo pero brillante atrapar al asesino?', 4);
INSERT INTO productos
VALUES (DEFAULT, 'El Principito', '/images/productos/clasicos1.jpg', 1943, '2016-08-17' , 'Antoine de Saint-Exupéry', 'Novela filosófica y literatura infantil', 'El principito es un cuento poético que viene acompañado de ilustraciones hechas con acuarelas por el mismo Saint-Exupéry.11​ En él, un piloto se encuentra perdido en el desierto del Sahara después de que su avión sufriera una avería, pero para su sorpresa, es allí donde conoce a un pequeño príncipe proveniente de otro planeta. La historia tiene una temática filosófica, donde se incluyen críticas sociales dirigidas a la «extrañeza» con la que los adultos ven las cosas. Estas críticas a las cosas «importantes» y al mundo de los adultos van apareciendo en el libro a lo largo de la narración.', 4);
INSERT INTO productos
VALUES (DEFAULT, 'Orgullo y prejuicio', '/images/productos/clasicos2.jpg', 1813, '2019-09-23' , 'Jane Austen', 'Novela romantica', ' La señora Bennet ha criado a sus cinco hijas con el único deseo de encontrar marido. La llegada al vecindario de Charles Bingley, un joven rico y soltero, con algunas amistades despierta el interés de las hermanas Bennet y de las familias vecinas, que verán una excelente oportunidad para cumplir su propósito. Elizabeth, una de las hijas de los Bennet, empezará una singular relación con Darcy, uno de los amigos de Bingley, que desencadenará esta historia de orgullo y prejuicios entre los dos hasta llegar a conocer el verdadero amor.', 3);
INSERT INTO productos
VALUES (DEFAULT, 'Frankenstein', '/images/productos/clasicos3.jpg', 1818, '2019-04-11' , 'Mary Shelley', 'Ficcion', ' La noche del 16 de junio de 1816, después de que Lord Byron y Percy B. Shelley discutieran largamente sobre la posibilidad de descubrir el principuo vital de la naturaleza y transferirlo a un cuerpo inerte, Mary W. Shelley tuvo una memorable pesadilla sobre la visión de un monstruo creado por la ciencia humana. Éste sería el punto de partida de una de las obras más proféticas de la historia de la literatura: Frankenstein o el moderno Prometeo. Un drama romántico sobre la voluntad prometeica del ser humano, decidida a emular y planteando nuevos problemas morales de consecuencias desconocidas. Los recientes avances de la ciencias biológicas, en esta época de clones y transgénicos, nos invitan a recorrer, convirtiendo su obra en un clásico tan vivo y actual como hace casi 200 años.', 2);
INSERT INTO productos
VALUES (DEFAULT, 'Los miserables', '/images/productos/clasicos4.jpg', 1862, '2019-08-29' , 'Victor Hugo', 'Novela historica', 'Jean Valjean es un ex-presidiario. Cuando llega al pueblo de D., rumbo a su pueblo natal y presenta su pasaporte -en el que figura como ex-reo y ''hombre peligroso''- en el ayuntamiento, nadie se digna a acogerle y a darle de comer, salvo don Bienvenido, el párroco. Traicionando a su protector, Valjean le roba la cubertería de plata, pero le detienen en los alrededores, llevándole frente al párroco. Don Bienvenido decide no denunciarle, pero le arranca una promesa: usar lo que ha tomado para hacerse un hombre de bien.', 1);
INSERT INTO productos
VALUES (DEFAULT, 'Animales fantásticos: Los crímenes de Grindelwald', '/images/productos/ficcion1.jpg', 2018, '2019-02-22' , 'J. K. Rowling', 'Ficción, literatura infantil', 'Al final de Animales fantásticos y dónde encontrarlos, el poderoso mago tenebroso Gellert Grindelwald es capturado en Nueva York con la ayuda de Newt Scamander. Pero, cumpliendo su amenaza, Grindelwald se escapa y se dispone a juntar seguidores, que no sospechan de sus motivos reales: criar magos de sangre limpia para gobernar a todos los seres no mágicos. En un esfuerzo por frustrar los planes de Grindelwald, Albus Dumbledore recluta a Newt, su exalumno de Hogwarts, quien se compromete a ayudar una vez más sin darse cuenta de los peligros que se avecinan. Los límites se definen mientras el amor y la lealtad se ponen a prueba, incluso entre los amigos y familiares más cercanos, en un mundo mágico cada vez más dividido', 3);
INSERT INTO productos
VALUES (DEFAULT, 'La tia cosima', '/images/productos/ficcion2.jpg', 2020, '2021-12-22' , 'Florencia Bonelli', 'Romance contemporáneo, Ficción urbana', '¿Puede el amor regalar una segunda oportunidad? Cósima es una mujer en la plenitud de la vida. Psicóloga de profesión y especializada en el tratamiento del autismo infantil; posee una fundación de enorme prestigio; donde se respira un ambiente cuidado y buen humor. Allí trabaja con perros especialmente adiestrados para ayudar a los niños con alguna condición del espectro autista. Es feliz con su trabajo; con sus amigos y sus sobrinos; a quienes dedica los pocos ratos libres de que dispone. En su adolescencia; sin embargo; padeció la crueldad de algunos compañeros de escuela; experiencia que la marcó profundamente; al tiempo que le sirvió para convertirse en la mujer comprometida que es hoy. Si bien esa etapa de sufrimiento quedó atrás; un día irrumpe de nuevo para ofrecerle algo que quizá deseaba: un amor inesperado; una pasión que la desborda; un abismo de sorpresa e incertidumbre. ¿Podrá ese amor reparar el daño que no se olvida? ¿Podrá deshacer la vergüenza; la frustración y el enojo? Con su nueva novela; Florencia Bonelli logra otra vez el misterio de la devoción lectora con una historia que perdura más allá de la última página.', 2);
INSERT INTO productos
VALUES (DEFAULT, 'Dracula', '/images/productos/ficcion3.jpg', 1897, '2012-05-08' , 'Arin Murphy-Hiscock', 'Novela, Horror, Ficción gótica, Literatura fantástica, Novela epistolar', 'Drácula es la creación literaria más famosa del vampirismo. Contenido: El abogado Jonathan Harker descubre que, en el castillo del conde Drácula, este se comporta por las noches como un vampiro. Harker sigue a Drácula a Inglaterra, donde el conde busca nuevas víctimas, entre ellas, a Mina, la prometida de Harker.', 5);

SELECT id, nombre, url, anio, creacion, autor, genero, resumen, usuarios_id
FROM productos;


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 1);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 1);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 1);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 1);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 1);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 2);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 2);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 2);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 2);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 2);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 3);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 3);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 3);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 3);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 3);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 4);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 4);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 4);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 4);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 4);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 5);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 5);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 5);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 5);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 5);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 6);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 6);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 6);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 6);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 6);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 7);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 7);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 7);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 7);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 7);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 8);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 8);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 8);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 8);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 8);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 9);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 9);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 9);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 9);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 9);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 10);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 10);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 10);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 10);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 10);


SELECT id, fecha, texto, usuarios_id, productos_id
FROM comentarios;