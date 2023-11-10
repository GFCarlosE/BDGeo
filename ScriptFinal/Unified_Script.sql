CREATE DATABASE lasalle_geodb;
USE lasalle_geodb;

-- Tabla Category
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(200)
);

-- Tabla Author
CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    lastname VARCHAR(60),
    birthday DATETIME,
    death DATETIME,
    description VARCHAR(200),
    img VARCHAR(150)
);

-- Tabla Mac_Address
CREATE TABLE mac_address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mac_address VARCHAR(20)
);

-- Tabla Coordinates
CREATE TABLE coordinates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lat DECIMAL(20,10),
    lng DECIMAL (20,10)
);

-- Tabla User
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    password VARCHAR(20),
    token VARCHAR(50),
    email VARCHAR(30)
);

-- Tabla Tecnique
CREATE TABLE tecnique (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
-- Tabla Style
CREATE TABLE style (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
-- Tabla Material
CREATE TABLE material (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
-- Tabla Address
CREATE TABLE address (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
-- Tabla City
CREATE TABLE city (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
-- Tabla Country
CREATE TABLE country (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60)
);

-- Tabla Detail_Attraction
CREATE TABLE detail_attraction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(200),
    size VARCHAR(50),
    tecnique_id INT,
    material_id INT,
    style_id INT,
    city_id INT,
    country_id INT,
    address_id INT,
	FOREIGN KEY (tecnique_id) REFERENCES tecnique(id),
    FOREIGN KEY (material_id) REFERENCES material(id),
    FOREIGN KEY (style_id) REFERENCES style(id),
    FOREIGN KEY (city_id) REFERENCES city(id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

-- Tabla Attraction
CREATE TABLE attraction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    img VARCHAR(150),
    id_detail INT,
    id_category INT,
    id_author INT,
    id_coordinates INT,
    id_mac_address INT,
    id_user INT,
    FOREIGN KEY (id_detail) REFERENCES detail_attraction(id),
    FOREIGN KEY (id_category) REFERENCES category(id),
    FOREIGN KEY (id_author) REFERENCES author(id),
    FOREIGN KEY (id_coordinates) REFERENCES coordinates(id),
    FOREIGN KEY (id_mac_address) REFERENCES mac_address(id),
    FOREIGN KEY (id_user) REFERENCES user(id)
);

-- Modificacion password
ALTER TABLE user MODIFY COLUMN password VARCHAR(255);

-- Modificacion img
ALTER TABLE attraction MODIFY img JSON;

-- Inserciones category
INSERT INTO category (name, description)
VALUES
    ('CategoriaPorDefecto', 'Just a silly description 1.'),
    ('Category2', 'Just a silly description 2.'),
    ('Category3', 'Just a silly description 3.'),
    ('Category4', 'Just a silly description 4.'),
    ('Category5', 'Just a silly description 5.'),
    ('Category6', 'Just a silly description 6.'),
    ('Category7', 'Just a silly description 7.'),
    ('Category8', 'Just a silly description 8.');
-- Inserciones author
INSERT INTO author (name, lastname, birthday, death, description, img)
VALUES
    ('Autor1', 'Apellido1', '1990-01-01 00:00:00', '2000-01-01 00:00:00', 'Descripción del Autor 1', 'PorEstablecer'),
    ('Autor2', 'Apellido2', '1985-03-15 00:00:00', '2015-06-20 00:00:00', 'Descripción del Autor 2', 'PorEstablecer'),
    ('Autor3', 'Apellido3', '1978-09-10 00:00:00', '2022-02-28 00:00:00', 'Descripción del Autor 3', 'PorEstablecer'),
    ('Autor4', 'Apellido4', '1982-07-25 00:00:00', '2010-12-05 00:00:00', 'Descripción del Autor 4', 'PorEstablecer'),
    ('Autor5', 'Apellido5', '1995-04-30 00:00:00', '2018-11-15 00:00:00', 'Descripción del Autor 5', 'PorEstablecer');
-- Inserciones mac_address
INSERT INTO mac_address (mac_address)
VALUES
    ('00:00:00:00:00:00'),
    ('AA:BB:CC:DD:EE:FF'),
    ('12:34:56:78:90:AB'),
    ('98:76:54:32:10:FE'),
    ('C0:FF:EE:00:11:22'),
    ('55:44:33:22:11:00'),
    ('0A:0B:0C:0D:0E:0F'),
    ('1A:2B:3C:4D:5E:6F');
    
-- Inserciones coordinates

INSERT INTO coordinates (lat, lng)
VALUES
    (21.15157, -101.711369),
    (21.15294, -101.71094),
    (21.153287, -101.711168),
    (21.151067, -101.710672),
    (21.152454, -101.711552),
    (21.152103, -101.711458),
    (21.152869, -101.712109),
    (21.15285, -101.71239),
    (21.15157, -101.71099),
    (21.15289, -101.711),
    (21.15342, -101.71226),
    (21.15265, -101.71202),
    (21.1539654, -101.7112652),
    (21.1521891, -101.7113668),
    (21.151952, -101.709695),
    (21.1527508, -101.7117571),
    (21.1527508, -101.7117571),
    (21.1527508, -101.7117571),
    (21.1524662, -101.7106637),
    (21.1531389, -101.71097),
    (21.1531406, -101.7105346),
    (21.15324402, -101.7126007),
    (21.15375328, -101.7113495),
    (21.15363121, -101.711731),
    (21.151952, -101.709695),
    (21.15190697, -101.7110519),
    (21.15205574, -101.7108307),
    (21.153397, -101.71142),
    (21.153397, -101.71142),
    (21.1516419, -101.7127994),
    (21.1530975, -101.7127800),
    (21.151953, -101.7120809),
    (21.1533351, -101.7130435),
    (21.1532695, -101.7118191),
    (21.1537776, -101.7108276),
    (21.1536093, -101.7106000),
    (21.1523255, -101.7100733),
    (21.1537776, -101.7108276),
    (21.1505678, -101.7108169),
    (21.1536354, -101.7128998),
    (21.1511195, -101.712597),
    (21.1523994, -101.7135925),
    (21.1533704, -101.7136088),
    (21.1519911, -101.7132727),
    (21.1529568, -101.7094848);

-- Inserciones user
INSERT INTO user (name, password, token, email)
VALUES
    ('Usuario1', 'password1', 'token1', 'usuario1@example.com'),
    ('Usuario2', 'password2', 'token2', 'usuario2@example.com'),
    ('Usuario3', 'password3', 'token3', 'usuario3@example.com'),
    ('Usuario4', 'password4', 'token4', 'usuario4@example.com'),
    ('Usuario5', 'password5', 'token5', 'usuario5@example.com'),
    ('Usuario6', 'password6', 'token6', 'usuario6@example.com'),
    ('Usuario7', 'password7', 'token7', 'usuario7@example.com'),
    ('Usuario8', 'password8', 'token8', 'usuario8@example.com');
-- Inserciones tecnique
INSERT INTO tecnique (name)
VALUES
    ('TécnicaPorDefecto'),
    ('Técnica2'),
    ('Técnica3'),
    ('Técnica4'),
    ('Técnica5');
-- Inserciones style
INSERT INTO style (name)
VALUES
    ('EstiloPorDefecto'),
    ('Estilo2'),
    ('Estilo3'),
    ('Estilo4'),
    ('Estilo5');
-- Inserciones material
INSERT INTO material (name)
VALUES
    ('MaterialPorDefecto'),
    ('Material2'),
    ('Material3'),
    ('Material4'),
    ('Material5');
-- Inserciones address
INSERT INTO address (name)
VALUES
    ('Dirección1'),
    ('Dirección2'),
    ('Dirección3'),
    ('Dirección4'),
    ('Dirección5');
-- Inserciones city
INSERT INTO city (name)
VALUES
    ('León'),
    ('Ciudad2'),
    ('Ciudad3'),
    ('Ciudad4'),
    ('Ciudad5');
-- Inserciones country
INSERT INTO country (name)
VALUES
    ('México'),
    ('País2'),
    ('País3'),
    ('País4'),
    ('País5');
    
-- Modificacion campo description
ALTER TABLE detail_attraction MODIFY description VARCHAR(600);

-- Inserciones detail_attraction
INSERT INTO detail_attraction (description, size, tecnique_id, material_id, style_id, city_id, country_id, address_id)
VALUES
    ('Este jardín está inspirado en un valor importante para la comunidad lasallista, la Inclusión. Desde su diseño muestra como todos son parte de la comunidad, todos ocupan un lugar especial y cada uno tiene la oportunidad de crecer y distinguirse. Lo anterior se ve representado en las plantas que se eligieron para adornar el espacio, juníperos, agapandos gigantes y enanos, lavanda, lirio, plumbago, salvia, margaritas, entre otras, que reflejan a una comunidad que acepta las diferencias de sus miembros, pero los acoge a todos.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('En su diseño se aprecian líneas de flores que representan los diferentes caminos que las personas tomamos, son caminos rápidos que invitan a moverse, a mejorar, a trascender. Este Jardín se conecta con el jardín de la transfiguración.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Basado en el pasaje de la transfiguración del evangelio, pretende que todo el que pase por este sitio, sienta que en su ser resuene la frase "Este es mi hijo amado, en quien me complazco". En su recorrido va mostrando la trasformación de las personas al tener experiencias y nutrirse de ellas. Es un jardín con espacios dedicados a leer, a nutrir el conocimiento, y lograr la experiencia de que cada visitante se sienta plenamente amado y reconozca la muestra de la gloria de Dios.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('El Jardín es un maestro que enseña cómo vivir compartiendo, en él se encuentran árboles frutales y hierbas de olor comestible, todas al servicio de los demás. Tiene como elemento principal un olivo grande que recuerda a Jesús en el Huerto de los Olivos. En su diseño se pueden ver arcos que simbolizan cadenas que se unen y forman un todo, igual que se unen los miembros de esta Comunidad.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Dedicado a uno de los principales valores lasallistas, este Jardín enseña a ser y hacer, a construir en Comunidad. En su diseño se muestran círculos concéntricos inconclusos de agapandos blancos, de tal forma que quien mira el Jardín se vuelve parte de él, de la misma forma que cada persona se vuelve parte de la Comunidad. Al centro de cada círculo, se ubica un tabachin rojo que simboliza la presencia de Dios como centro de nuestra existencia.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Este espacio es un escenario que nos lleva a vivir la experiencia de "El buen pastor" contenida en el Salmo 23. Su diseño, inspirado en esta liturgia, se invita a ser leído haciendo un recorrido de arriba hacia abajo, de esta manera se puede identificar cada elemento.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Este espacio tiene como objetivo fomentar la cultura por el cuidado de esta rama de la botánica: así mismo generar espacios de esparcimiento y reflexión en el alumnado, profesorado y visitantes. En el Jardín Xerófilo se pueden encontrar especies endémicas de nuestro país, algunas de ellas incluso en peligro de extinción.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('"Alberto Castro Leñero Vaciado en Bronce, 1998 Colección Instituto Oviedo Jardín Xerófilo"', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('"Carlos Terrés Vaciado en Bronce, 2015 Colección Universidad De La Salle Plaza de la Fundación"', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('"Ricardo Motilla Vaciado en bronce, 2003 (Edición 1/2) Colección Instituto Oviedo Escalinatas de la Biblioteca Central"', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('"Javier de Jesús Hernández Martínez (Capelo) Vaciado en bronce, 2016 Colección Universidad De La Salle Bajío Acceso principal del Gimnasio"', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Ricado motilla', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Capilla ubicada en la facultad de negocios edificio P', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Capilla ubicada in the center of idiomas, building H', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('"Escuela de Agronomía Escuela de Enfermería Escuela de Veterinaria Hospital Veterinario para pequeñas especies Centro de Simulación para la Salud"', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Talleres', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Edificio de Ingenierías', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Edificio de Arquitectura', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Talleres de diseño', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Biblioteca', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Edificio de Diseño', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Universum: Centro para realizar eventos y recinto con cancha de baloncesto. En el sector inferior se encuentra coordinación de Desarrollo y Gestión Cultura, la Coordinación de Grupos Estudiantiles, la Coordinación de Solidaridad y el Gimnasio', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Negocios: Edificio de la facultad de Turisimo y Gastronomía y Negocios. Ahí mismo se encuentra la Dirección de Investigación y Doctorado, así como el auditorio Miguel Febres Cordero.', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Gastronomia: Unidad de pácticas para la facultad de Gastronomía', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Enfermería', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Plaza San Juan Bautista de la Salle 1: Sección 1 de la Plaza de San Juan Bautista de la Salle', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Plaza San Juan Bautista de la Salle 2: Sección 2 of the Plaza de San Juan Bautista de la Salle', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Plaza del Centenario', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Museo MiM', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('EstacionamientoPrincipal', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('EstacionamientoPrincipal2', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento2', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento3', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento4', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('EstacionamientoMaestros', 'PorDefinir', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento7', 'PorDefinir', 1, 1, 1, 1, 1, 1);

-- Inserciones attraction
-- Insertar registros en la tabla attraction con el atributo img como JSON
INSERT INTO attraction (name, img, id_detail, id_category, id_author, id_coordinates, id_mac_address, id_user)
VALUES
    ('Jardín de la Inclusión', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_inclusion.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_inclusion_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_inclusion_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_inclusion_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Jardín del Caos a la Claridad', '["https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_2.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Jardín de la Transfiguración', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_4.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Jardín del Servicio', '["https://salle-images-bucket.s3.amazonaws.com/jardin_del_servicio.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_1.png", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_2.png", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_3.png"]', 1, 1, 1, 1, 1, 1),
    ('Jardín de la Fraternidad', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_1.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Jardín de la Fe', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_4.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Jardín Xerófilo del Bicentenario', '["https://salle-images-bucket.s3.amazonaws.com/Jard%C3%ADn+Xer%C3%B3filo+del+Bicentenario.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_Xerofilo_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_Xerofilo_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_Xerofilo_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Forma', '["https://salle-images-bucket.s3.amazonaws.com/Escultura_Forma_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Forma_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Forma_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_forma.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Llamados a Bogar Mar Adentro', '["https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_Llamados+a+bogar+mar+adrentro.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Simbiosis', '["https://salle-images-bucket.s3.amazonaws.com/Escultura_Simbiosis_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Simbiosis_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Simbiosis_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/ecultura_Simbiosis.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Minotauro', '["https://salle-images-bucket.s3.amazonaws.com/Minotauro_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Minotauro_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Minotauro_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_Minotauro.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Actitud', '["https://salle-images-bucket.s3.amazonaws.com/Escultura_Actitud_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_actitud.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Actitud_2.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Capilla edificio P', '["https://salle-images-bucket.s3.amazonaws.com/capilla+negocios1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios3.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios4.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios5.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Capilla edificio H', '["https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+idioma2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas3.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas4.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('E', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_E_1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_E_2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_E_3.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('F', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_F_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_F_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_F_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/edificio_f.jpg"]', 1, 1, 1, 1, 1, 1),
    ('I', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_I_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_I_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_I_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/edificio_i.jpg"]', 1, 1, 1, 1, 1, 1),
    ('J', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_J_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_J_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_J_3.jpg"]', 1, 1, 1, 1, 1, 1),
     ('K', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_K_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_2.jpg", "https://salle-images-bucket-s3.amazonaws.com/Edificio_K_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_5.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_6.jpg"]', 1, 1, 1, 1, 1, 1),
    ('L', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_L_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_L_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/biblioteca.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('M', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_M_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_M_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_M_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_M_4.jpg"]', 1, 1, 1, 1, 1, 1),
    ('O', '["https://salle-images-bucket.s3.amazonaws.com/EdificioO.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_O_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_O_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_O_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('P', '["https://salle-images-bucket.s3.amazonaws.com/EdificioP.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_P_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_P_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_P_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Q', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_5.jpg", "https://salle-images-bucket.s3.amazonaws.com/EdificioQ.jpg"]', 1, 1, 1, 1, 1, 1),
    ('R', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_R.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_R_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_R_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_R_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/edificio_r.jpg"]', 1, 1, 1, 1, 1, 1),
    ('T1', '["https://salle-images-bucket.s3.amazonaws.com/EdificioT1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_Seccion2_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_Seccion2_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_Seccion2_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('T2', '["https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/EdificioT2.jpg"]', 1, 1, 1, 1, 1, 1),
    ('U', '["https://salle-images-bucket.s3.amazonaws.com/U_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/U_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/U_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/U_4.jpg"]', 1, 1, 1, 1, 1, 1),
    ('MIM', '["https://salle-images-bucket.s3.amazonaws.com/MiM_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/MiM_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/MiM_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/MiM_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/mim.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha Uruguaya', '["https://salle-images-bucket.s3.amazonaws.com/cancha_uruguaya.png"]', 1, 1, 1, 1, 1, 1),
    ('Cancha Palco', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Palco_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Palco_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_palco.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Palco_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha escudos', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_escudo_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_escudo_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_escudos.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_escudo_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha Tenis', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_tenis.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_4.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha de futbol rápido', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_futbol_rapido_1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_futbol_rapido_2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_rapido.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_futbol_rapido_3.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha de Basquetball (negocios)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Negocios_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Negocios_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_basketball_negocios.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Negocios_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha de Basquetball (Atrás de biblioteca)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_atras_biblioteca_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_atras_biblioteca_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_atras_biblioteca_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_baket_atras_de_biblioteca.png"]', 1, 1, 1, 1, 1, 1),
    ('Cancha futbol (medicina)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_medicina.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Cancha futbol (patio hundido)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Hundida_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Hundida_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_patio_hundido.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Hundida_3.jpg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_principal', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_principal.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_principal_2', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_principal_2.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_2', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_2.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_3', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_3.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_4', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_4.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_maestros', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_maestros.jpeg"]', 1, 1, 1, 1, 1, 1),
    ('Estacionamiento_7', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_7.jpeg"]', 1, 1, 1, 1, 1, 1);

-- Inserción faltante en detail_attraction
INSERT INTO detail_attraction (description, size, tecnique_id, material_id, style_id, city_id, country_id, address_id)
VALUES ('Cancha', 'PorDefinir', 1, 1, 1, 1, 1, 1);

-- Modificaciones tabla id_detail 
SET @id_detail = 0;
UPDATE attraction
SET id_detail = (@id_detail := @id_detail + 1)
WHERE id BETWEEN 1 AND 45;

-- Añadir los campos para la creación, actualización y eliminación de un registro
-- Para la tabla 'category'
ALTER TABLE category
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'author'
ALTER TABLE author
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'mac_address'
ALTER TABLE mac_address
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'coordinates'
ALTER TABLE coordinates
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'user'
ALTER TABLE user
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'tecnique'
ALTER TABLE tecnique
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'style'
ALTER TABLE style
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'material'
ALTER TABLE material
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'address'
ALTER TABLE address
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'city'
ALTER TABLE city
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'country'
ALTER TABLE country
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'detail_attraction'
ALTER TABLE detail_attraction
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Para la tabla 'attraction'
ALTER TABLE attraction
ADD created_at DATETIME,
ADD updated_at DATETIME,
ADD is_deleted bool;

-- Ajuste de registros correctos para id_detail
UPDATE attraction SET id_detail = 45 WHERE id = 38;
UPDATE attraction SET id_detail = 38 WHERE id = 39;
UPDATE attraction SET id_detail = 39 WHERE id = 40;
UPDATE attraction SET id_detail = 40 WHERE id = 41;
UPDATE attraction SET id_detail = 41 WHERE id = 42;
UPDATE attraction SET id_detail = 42 WHERE id = 43;
UPDATE attraction SET id_detail = 43 WHERE id = 44;
UPDATE attraction SET id_detail = 44 WHERE id = 45;

-- Ajuste de registros correctos para coordenadas
SET @coordinates = 0;
UPDATE attraction
SET attraction.id_coordinates = (@coordinates := @coordinates + 1)
WHERE id BETWEEN 1 AND 45;

-- Ajuste de registros correctos para id_coordinates
UPDATE attraction SET id_coordinates = 45 WHERE id = 38;
UPDATE attraction SET id_coordinates = 38 WHERE id = 39;
UPDATE attraction SET id_coordinates = 39 WHERE id = 40;
UPDATE attraction SET id_coordinates = 40 WHERE id = 41;
UPDATE attraction SET id_coordinates = 41 WHERE id = 42;
UPDATE attraction SET id_coordinates = 42 WHERE id = 43;
UPDATE attraction SET id_coordinates = 43 WHERE id = 44;
UPDATE attraction SET id_coordinates = 44 WHERE id = 45;

-- Llenado de parámetro 'created_at' en todas las tablas
UPDATE category SET created_at = NOW();

UPDATE author SET created_at = NOW();

UPDATE mac_address SET created_at = NOW();

UPDATE coordinates SET created_at = NOW();

UPDATE user SET created_at = NOW();

UPDATE tecnique SET created_at = NOW();

UPDATE style SET created_at = NOW();

UPDATE material SET created_at = NOW();

UPDATE address SET created_at = NOW();

UPDATE city SET created_at = NOW();

UPDATE country SET created_at = NOW();

UPDATE detail_attraction SET created_at = NOW();

UPDATE attraction SET created_at = NOW();

-- Triggers
