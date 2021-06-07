CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
celular INT NOT NULL,
mail VARCHAR (50) NOT NULL,
fotoPerfil VARCHAR (200) NOT NULL,
contraseña VARCHAR (500) NOT NULL,
nacimiento  DATE NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
foto VARCHAR (200) NOT NULL,
anio INT NOT NULL,
autor VARCHAR (50) NOT NULL,
genero VARCHAR (50) NOT NULL,
resumen TEXT,
usuarios_id INT UNSIGNED NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (usuarios_id) REFERENCES usuarios (id)
);



CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha DATE NOT NULL,
texto VARCHAR (500) NOT NULL,
usuarios_id INT UNSIGNED NOT NULL,
productos_id INT UNSIGNED NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (productos_id) REFERENCES productos (id),
FOREIGN KEY (usuarios_id) REFERENCES usuarios (id)
);


INSERT INTO usuarios
VALUES (DEFAULT, 'KourtneyK',  155327835,  'kourt.kardashian@gmail.com', '/images/usuarios/Kourtney.jpg',  'librosfan', '1999-04-09', DEFAULT, DEFAULT);
INSERT INTO usuarios
VALUES (DEFAULT, 'KylieJ',  155123435,  'kyliejenner@gmail.com', '/images/usuarios/Kylie.jpg', 'amoloslibros', '1997-08-06' , DEFAULT, DEFAULT);
INSERT INTO usuarios
VALUES (DEFAULT, 'KhloeK',  155320987,  'khloe.kardashian@gmail.com', '/images/usuarios/Khloe.jpg', 'libros1234', '1992-05-02' , DEFAULT, DEFAULT);
INSERT INTO usuarios
VALUES (DEFAULT, 'KendallJ',  155876545,  'kendalljenner@gmail.com', '/images/usuarios/Kendall.jpg', 'clublectura', '1999-07-10' , DEFAULT, DEFAULT);
INSERT INTO usuarios
VALUES (DEFAULT, 'KrissJ',  155367485,  'krissjenner@gmail.com', '/images/usuarios/Kris.jpg', 'libros9876', '1977-07-12' , DEFAULT, DEFAULT);

SELECT id, nombre, celular, mail, fotoPerfil, contraseña, nacimiento
FROM usuarios;

INSERT INTO productos
VALUES (DEFAULT, 'La chica de nieve', '/images/productos/bestseller1.jpg', 2020, 'Javier Castillo', 'Thriller', 'Thriller perfecto que cambia las reglas del género. El desfile de Acción de Gracias más famoso del planeta. Una niña de tres años desaparecida. ¿Dónde está Kiera Templeton? Nueva York, 1998, cabalgata de Acción de Gracias. Kiera Templeton, de tan solo tres años, desaparece entre la multitud. Tras una búsqueda frenética por toda la ciudad, alguien encuentra unos mechones de pelo junto a la ropa que llevaba puesta la pequeña.En 2003, el día que hubiese sido el octavo cumpleaños de Kiera, sus padres, Aaron y Grace Templeton, reciben en casa un extraño paquete con algo inesperado: una cinta de vídeo VHS con una grabación de un minuto de Kiera, jugando en una habitación desconocida.Miren Triggs, una estudiante de periodismo de la Universidad de Columbia, se siente atraída por el caso e inicia una investigación paralela que la lleva a desentrañar aspectos de su pasado que creía olvidados, y es que su historia personal, al igual que la de Kiera, está llena de incógnitas.Después del éxito de El día que se perdió la cordura, El día que se perdió el amor y Todo lo que sucedió con Miranda Huff, con más de 650.000 ejemplares vendidos, Javier Castillo regresa con La chica de nieve, un juego de espejos y un oscuro viaje a las profundidades de la desesperación. Una novela que muestra que lo peor siempre pasa inadvertido.', 3 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Un cuento perfecto', '/images/productos/bestseller2.jpg', 2020, 'Elísabet Benavent', 'Romance', 'Elísabet Benavent regresa al panorama de la literatura con una novela que explora el significado del éxito en la vida y reflexiona con ironía y humor acerca de las imposiciones sociales, la presión del grupo y la autoexigencia que, aunque cueste creerlo, no es sinónimo de felicidad. Los lectores han dicho...¡Un libro magnífico. Adictivo! Una historia real, bien escrita. He reído, llorado, suspirado. Elísabet, he leído todos tus libros y, aunque parezca imposible, sigues sorprendiéndome. Una historia madura que nos hace reflexionar. No es una novela al uso centrada en el amor de pareja, es eso y mucho más. Leer a Elísabet es entrar en la historia, sentirla y vivirla. Su pluma te atrapa. Te puede gustar un libro más que otro. Amar a un personaje y odiar a otros... pero siempre tienen algo que te marca y que se queda incrustado en el corazón.', 4 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'El enigma de la habitacion 622', '/images/productos/bestseller3.jpg', 2020, 'Joël Dicker', 'Thriller', 'Una noche de diciembre, un cadáver yace en el suelo de la habitación 622 del Palace de Verbier, un hotel de lujo en los Alpes suizos. La investigación policial no llegará nunca a término y el paso del tiempo hará que muchos olviden lo sucedido. Años más tarde, el escritor Joël Dicker llega a ese mismo hotel para recuperarse de una ruptura sentimental. No se imagina que terminará investigando el viejo crimen, y no lo hará solo: Scarlett, la bella huésped y aspirante a novelista de la habitación contigua, lo acompañará en la búsqueda mientras intenta aprender también las claves para escribir un buen libro. ¿Qué sucedió aquella noche en el Palace de Verbier? Es la gran pregunta de este thriller diabólico, construido con la precisión de un reloj suizo. Joël Dicker nos lleva finalmente a su país natal para narrarnos una investigación policial en la que se mezclan un triángulo amoroso, juegos de poder, traiciones y envidias en una Suiza no tan tranquila, donde la verdad es muy distinta a todo lo que hayamos imaginado.', 5 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'El club del crimen de los jueves', '/images/productos/bestseller4.jpg', 2020, 'Richard Osman', 'Thriller', 'En un pacífico complejo privado para jubilados, cuatro improbables amigos se reúnen una vez a la semana para revisar antiguos casos de asesinatos locales que quedaron sin resolver. Ellos son Ron, un exactivista socialista lleno de tatuajes y revolución; la dulce Joyce, una viuda que no es tan ingenua como aparenta; Ibrahim, un antiguo psiquiatra con una increíble capacidad de análisis, y la tremenda y enigmática Elizabeth, que, a sus 81 años, lidera el grupo de investigadores aficionados o no tanto.Cuando aparece el cadáver de un promotor inmobiliario de la zona con una misteriosa fotografía junto al cuerpo, El Club del Crimen de los Jueves se encuentra en medio de su primer caso real. Aunque sean octogenarios, los cuatro amigos guardan algunos trucos en la manga. ¿Podrá este grupo poco ortodoxo pero brillante atrapar al asesino?', 4 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'El Principito', '/images/productos/clasicos1.jpg', 1943, 'Antoine de Saint-Exupéry', 'Fantasía', 'El principito es un cuento poético que viene acompañado de ilustraciones hechas con acuarelas por el mismo Saint-Exupéry.11​ En él, un piloto se encuentra perdido en el desierto del Sahara después de que su avión sufriera una avería, pero para su sorpresa, es allí donde conoce a un pequeño príncipe proveniente de otro planeta. La historia tiene una temática filosófica, donde se incluyen críticas sociales dirigidas a la «extrañeza» con la que los adultos ven las cosas. Estas críticas a las cosas «importantes» y al mundo de los adultos van apareciendo en el libro a lo largo de la narración.', 4 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Orgullo y prejuicio', '/images/productos/clasicos2.jpg', 1813, 'Jane Austen', 'Romance', ' La señora Bennet ha criado a sus cinco hijas con el único deseo de encontrar marido. La llegada al vecindario de Charles Bingley, un joven rico y soltero, con algunas amistades despierta el interés de las hermanas Bennet y de las familias vecinas, que verán una excelente oportunidad para cumplir su propósito. Elizabeth, una de las hijas de los Bennet, empezará una singular relación con Darcy, uno de los amigos de Bingley, que desencadenará esta historia de orgullo y prejuicios entre los dos hasta llegar a conocer el verdadero amor.', 3 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Frankenstein', '/images/productos/clasicos3.jpg', 1818, 'Mary Shelley', 'Ficción', ' La noche del 16 de junio de 1816, después de que Lord Byron y Percy B. Shelley discutieran largamente sobre la posibilidad de descubrir el principuo vital de la naturaleza y transferirlo a un cuerpo inerte, Mary W. Shelley tuvo una memorable pesadilla sobre la visión de un monstruo creado por la ciencia humana. Éste sería el punto de partida de una de las obras más proféticas de la historia de la literatura: Frankenstein o el moderno Prometeo. Un drama romántico sobre la voluntad prometeica del ser humano, decidida a emular y planteando nuevos problemas morales de consecuencias desconocidas. Los recientes avances de la ciencias biológicas, en esta época de clones y transgénicos, nos invitan a recorrer, convirtiendo su obra en un clásico tan vivo y actual como hace casi 200 años.', 2 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Los miserables', '/images/productos/clasicos4.jpg', 1862, 'Victor Hugo', 'Novela historica', 'Jean Valjean es un ex-presidiario. Cuando llega al pueblo de D., rumbo a su pueblo natal y presenta su pasaporte -en el que figura como ex-reo y ''hombre peligroso''- en el ayuntamiento, nadie se digna a acogerle y a darle de comer, salvo don Bienvenido, el párroco. Traicionando a su protector, Valjean le roba la cubertería de plata, pero le detienen en los alrededores, llevándole frente al párroco. Don Bienvenido decide no denunciarle, pero le arranca una promesa: usar lo que ha tomado para hacerse un hombre de bien.', 1 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Animales fantásticos: Los crímenes de Grindelwald', '/images/productos/ficcion1.jpg', 2018, 'J. K. Rowling', 'Fantasía', 'Al final de Animales fantásticos y dónde encontrarlos, el poderoso mago tenebroso Gellert Grindelwald es capturado en Nueva York con la ayuda de Newt Scamander. Pero, cumpliendo su amenaza, Grindelwald se escapa y se dispone a juntar seguidores, que no sospechan de sus motivos reales: criar magos de sangre limpia para gobernar a todos los seres no mágicos. En un esfuerzo por frustrar los planes de Grindelwald, Albus Dumbledore recluta a Newt, su exalumno de Hogwarts, quien se compromete a ayudar una vez más sin darse cuenta de los peligros que se avecinan. Los límites se definen mientras el amor y la lealtad se ponen a prueba, incluso entre los amigos y familiares más cercanos, en un mundo mágico cada vez más dividido', 3 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'La tia cosima', '/images/productos/ficcion2.jpg', 2020, 'Florencia Bonelli', 'Romance', '¿Puede el amor regalar una segunda oportunidad? Cósima es una mujer en la plenitud de la vida. Psicóloga de profesión y especializada en el tratamiento del autismo infantil; posee una fundación de enorme prestigio; donde se respira un ambiente cuidado y buen humor. Allí trabaja con perros especialmente adiestrados para ayudar a los niños con alguna condición del espectro autista. Es feliz con su trabajo; con sus amigos y sus sobrinos; a quienes dedica los pocos ratos libres de que dispone. En su adolescencia; sin embargo; padeció la crueldad de algunos compañeros de escuela; experiencia que la marcó profundamente; al tiempo que le sirvió para convertirse en la mujer comprometida que es hoy. Si bien esa etapa de sufrimiento quedó atrás; un día irrumpe de nuevo para ofrecerle algo que quizá deseaba: un amor inesperado; una pasión que la desborda; un abismo de sorpresa e incertidumbre. ¿Podrá ese amor reparar el daño que no se olvida? ¿Podrá deshacer la vergüenza; la frustración y el enojo? Con su nueva novela; Florencia Bonelli logra otra vez el misterio de la devoción lectora con una historia que perdura más allá de la última página.', 2 , DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Bruja Verde', '/images/productos/ficcion3.jpg', 2019, 'Arin Murphy-Hiscock', 'Fantasía', 'La bruja verde es una herborista sabia que abraza el poder de la naturaleza y emplea plantas, flores, aceites y hierbas para sanar. Siempre acude al mundo natural en busca de orientación, y respeta a todas y cada una de las criaturas vivientes, por pequeñas que sean.', 1, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Boulevard', '/images/productos/romantica1.jpg', 2020, 'Flor M. Salvador', 'Romance', 'Luke y Hasley no eran el prototipo de una pareja perfecta. Sin embargo, ambos le pusieron definición a lo que ellos crearon. Una historia de dos adolescentes que crean su propio boulevard ante la llovizna que hay en sus corazones, donde se entremezcla, por un lado, un azul cálido, y por el otro, un azul eléctrico, tiñéndose este por completo de un gris nostálgico. ¿Quién dijo que después de la tormenta sale el sol cuando puede haber un rayo?', 4, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Dímelo bajito', '/images/productos/romantica2.jpg', 2020, 'Mercedes Ron', 'Romance', 'Kami Hamilton tenía doce años cuando le dieron su primer beso: desde entonces los labios de Thiago Franco, el hermano de su mejor amigo Taylor, la persiguen en sueñospero nunca en la realidad. Los dos hermanos hace seis años que desaparecieron de su vida sin dejar rastro hasta ahora. Los hermanos han regresado y el mundo aparentemente perfecto de Kamilah se tambalea. Ella ya no es la niña inocente que conocieron: ahora es la más popular del instituto, donde la llaman la reina de cristal porque nunca deja entrever ningún sentimiento. Es perfecta y parece que nadie, ni siquiera su novio, puede acceder realmente a ella. Nadie excepto Thiago. ¿Podrá resistirse Kami a la simple presencia de Thiago? ¿La perdonará él por lo que sucedió cuando solo eran unos niños?', 1, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Uno siempre cambia al amor de su vida', '/images/productos/romantica3.jpg', 2016, 'Amalia Andrade', 'Romance', 'Kit de primeros auxilios para superar el desamorCambiar no es una renuncia sino una promesa, nos dice la autora. Porque si algo no funciona, SIEMPRE habrá un nuevo amor o una nueva vida. ', 4, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'La selección', '/images/productos/romantica4.jpg', 2012, 'Kiera Cass', 'Ficción', 'Para treinta y cinco chicas, la Selección es una oportunidad que solo se presenta una vez en la vida. La oportunidad de escapar de la vida que les ha tocado por nacer en una determinada familia. La oportunidad de que las trasladen a un mundo de trajes preciosos y joyas que no tienen precio.', 3, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'It', '/images/productos/terror1.jpg', 1986, 'Stephen King', 'Terror', 'It (en español, «Eso») es una novela de terror publicada en 1986 por el escritor estadounidense Stephen King.', 3, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'El extraño caso del doctor Jekyll y el señor Hyde', '/images/productos/terror2.jpg', 1886, 'Robert Louis Stevenson', 'Terror', 'En sus cuadernos, el Dr. Jekyll confiesa que en su juventud consiguió una poción que lograba transformar a una persona en uno solo de sus polos opuestos. Así, cada vez que Jekyll tomaba la poción, se metamorfoseaban en Hyde, un verdadero asesino y misántropo. Un día, Poole, el mayordomo del Dr. Jekyll, asegura que alguien ha matado a éste tras entrar en el laboratorio. En realidad, el cadáver que encuentran es el de Mr. Hyde, que se ha suicidado. Mientras, el Dr. Jekyll ha desaparecido. Publicada por primera vez en inglés en 1886 trata acerca de un abogado, Gabriel John Utterson, que investiga la extraña relación entre su viejo amigo, el Dr. Henry Jekyll, y el misántropo Edward Hyde. El libro es conocido por ser una representación vívida de la psicopatología correspondiente a un desdoblamiento de personalidad', 3, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES(DEFAULT, 'Carrie', '/images/productos/terror3.jpg', 1974, 'Stephen King', 'Terror', 'El escalofriante caso de una joven de apariencia insignificante que se transformó en un ser de poderes anormales, sembrando el terror en toda la ciudad. Con pulso mágico para mantener la tensión a lo largo de todo el libro, Stephen King narra la atormentada adolescencia de Carrie, y nos envuelve en una atmósfera sobrecogedora cuando la muchacha realiza una serie de descubrimientos hasta llegar al terrible momento de la venganza', 2, DEFAULT, DEFAULT );
INSERT INTO productos
VALUES (DEFAULT, 'El Resplandor', '/images/productos/terror4.jpg', 1977,  'Stephen King', 'Terror', 'Jack Torrance acepta una oferta de trabajo en un hotel de montaña que se encuentra a 65 kilómetros del pueblo más cercano. Además, las carreteras se encuentran cerradas al tráfico por las fuertes nevadas del invierno. Pronto comenzarán a manifestarse espíritus y apariciones extrañas. Es el propio hotel el que intenta controlar tanto a los vivos como a los muertos. Danny, el hijo de Jack tiene la capacidad de ver visiones sobre el pasado del hotel y de resistirse a su poder hipnótico. Es entonces cuando su padre comienza a enloquecer.', 3, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Utopia', '/images/productos/ficcion4.jpg', 1516, 'Tomas Moro', 'Ficcion', 'Moro relata una misión diplomática en Flandes que el rey inglés Enrique VIII encargó. Allí Peter Gilles le presenta a Rafael Hitlodeo, un portugués que ha viajado.', 3, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'El psiconalista', '/images/productos/thriller1.jpg', 2002, ' John Katzenbach', 'Thriller', 'El psicoanalista es una novela de suspenso y psicología, la cual cuenta lo que vive el Doctor Frederick Starks después de recibir una carta amenazadora en la que le indican que debe suicidarse, o de lo contrario en quince días matarían poco a poco a todos los miembros de su familia.', 3, DEFAULT, DEFAULT);
INSERT INTO productos
VALUES (DEFAULT, 'Harry Potter y la piedra filosofal', '/images/productos/fantasia1.jpg', 1997, ' J. K. Rowling', 'Fantasía', 'El día de su cumpleaños, Harry Potter descubre que es hijo de dos conocidos hechiceros, de los que ha heredado poderes mágicos. Debe asistir a una famosa escuela de magia y hechicería, donde entabla una amistad con dos jóvenes que se convertirán en sus compañeros de aventura. Durante su primer año en Hogwarts, descubre que un malévolo y poderoso mago llamado Voldemort está en busca de una piedra filosofal que alarga la vida de quien la posee.', 3, DEFAULT, DEFAULT);



SELECT id, nombre, foto, anio, autor, genero, resumen, usuarios_id
FROM productos;


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 1 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 1 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 1 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 1 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 1 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 2 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 2 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 2, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 2 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 2 , DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 3 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 3 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 3 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 3 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 3 , DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 4 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 4 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 4 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 4 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 4 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 5 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 5 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 5 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 5 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 5 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 6 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 6 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 6 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 6 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 6 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 7 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 7 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 7 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 7 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 7 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 8 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 8 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 8 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 8 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 8 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 9 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 9 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 9 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 9 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 9 , DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 10 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 10 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 10 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 10 , DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 10 , DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 11, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 11, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 11, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 11, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 11, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 12, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 12, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 12, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 12, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 12, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 13, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 13, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 13, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 13, DEFAULT,DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 13,DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 14, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 14, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 14, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 14, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 14, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2020-05-12', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 15, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2020-05-03', 'Me encantó este libro, me lo leí en dos días.', 2, 15, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2020-11-10', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 15, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2020-05-03', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 15, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2020-02-01', 'Este catalogo es buenisimo, me encanta', 5, 15, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2019-06-05', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 16, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2019-02-08', 'Me encantó este libro, me lo leí en dos días.', 2, 16, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2019-05-07', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 16, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2019-03-04', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 16, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2019-12-12', 'Este catalogo es buenisimo, me encanta', 5, 16, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2018-01-12', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 17, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2018-02-02', 'Me encantó este libro, me lo leí en dos días.', 2, 17, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2018-10-04', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 17, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2018-12-11', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 17, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2018-01-05', 'Este catalogo es buenisimo, me encanta', 5, 17, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 18, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 18, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 18, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 18, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 18, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 19, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 19, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 19, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 19, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 19, DEFAULT, DEFAULT);


INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 20, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 20, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 20, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 20, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 20, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 21, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 21, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 21, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 21, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 21, DEFAULT, DEFAULT);

INSERT INTO comentarios
VALUES (DEFAULT, '2021-04-06', 'Excelente novela, como siempre, la autora nos tiene acostumbrados a la perfección en redacción!', 1, 22, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-05-06', 'Me encantó este libro, me lo leí en dos días.', 2, 22, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-07-09', 'Me sorprendió, pensé que sería como los otros libros de la autora, pero éste está mejor desarrollado, es menos predecible que otros que he leído de ella, me gustó bastante.', 3, 22, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Intrigante, fácil de leer y contado de una manera muy cinematográfica, lo cual hace que te enganches muchísimo.', 4, 22, DEFAULT, DEFAULT);
INSERT INTO comentarios
VALUES (DEFAULT, '2021-09-08', 'Este catalogo es buenisimo, me encanta', 5, 22, DEFAULT, DEFAULT);


SELECT id, fecha, texto, usuarios_id, productos_id
FROM comentarios;