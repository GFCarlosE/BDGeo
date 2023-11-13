CREATE DATABASE salle_around_me_db;
USE salle_around_me_db;

-- Tabla User
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    password TEXT,
    token TEXT,
    email TEXT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

-- Tabla Author
CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    father_lastname VARCHAR(60),
    mother_lastname VARCHAR(60),
    birthday DATETIME,
    death DATETIME,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

-- Tabla Tecnique
CREATE TABLE tecnique (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

-- Tabla Material
CREATE TABLE material (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

-- Tabla Category
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

-- Tabla Style
CREATE TABLE style (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

-- Tabla Mac_Address
CREATE TABLE mac_address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mac_address VARCHAR(20),
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0
);

CREATE TABLE attraction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    lat DECIMAL(15, 6) NOT NULL,
    lng DECIMAL(15, 6) NOT NULL,
    description TEXT,
    img JSON,
    size TEXT,
    id_author INT,
    id_style INT,
    id_user INT,
    id_mac_address INT,
    id_category INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0,
    FOREIGN KEY (id_author) REFERENCES author(id),
    FOREIGN KEY (id_style) REFERENCES style(id),
    FOREIGN KEY (id_user) REFERENCES user(id),
    FOREIGN KEY (id_mac_address) REFERENCES mac_address(id),
    FOREIGN KEY (id_category) REFERENCES category(id)
);

CREATE TABLE detail_tecnique (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_attraction INT,
    id_tecnique INT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0,
	FOREIGN KEY (id_attraction) REFERENCES attraction(id),
    FOREIGN KEY (id_tecnique) REFERENCES tecnique(id)
);

CREATE TABLE detail_material (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_attraction INT,
    id_material INT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT(1) DEFAULT 0,
	FOREIGN KEY (id_attraction) REFERENCES attraction(id),
    FOREIGN KEY (id_material) REFERENCES material(id)
);

-- Inserciones users
INSERT INTO user (name, password, token, email)
VALUES
    ('Usuario1', '', 'token1', 'usuario1@example.com'),
    ('Usuario2', '', 'token2', 'usuario2@example.com'),
    ('Usuario3', '', 'token3', 'usuario3@example.com'),
    ('Usuario4', '', 'token4', 'usuario4@example.com'),
    ('Usuario5', '', 'token5', 'usuario5@example.com'),
    ('Usuario6', '', 'token6', 'usuario6@example.com'),
    ('Usuario7', '', 'token7', 'usuario7@example.com'),
    ('Usuario8', '', 'token8', 'usuario8@example.com');

-- Inserciones author
INSERT INTO author (name, father_lastname, mother_lastname, birthday, death)
VALUES
    ('Autor1', 'ApellidoP1', 'ApellidoM1', '1990-01-01 00:00:00', '2000-01-01 00:00:00'),
    ('Autor2', 'ApellidoP2', 'ApellidoM2', '1985-03-15 00:00:00', '2015-06-20 00:00:00'),
    ('Autor3', 'ApellidoP3', 'ApellidoM3', '1978-09-10 00:00:00', '2022-02-28 00:00:00'),
    ('Autor4', 'ApellidoP4', 'ApellidoM4', '1982-07-25 00:00:00', '2010-12-05 00:00:00'),
    ('Autor5', 'ApellidoP5', 'ApellidoM5', '1995-04-30 00:00:00', '2018-11-15 00:00:00');

-- Inserciones tecnique
-- Inserciones tecnique
INSERT INTO tecnique (name)
VALUES
    ('NO APLICA'),
    ('Técnica2'),
    ('Técnica3'),
    ('Técnica4'),
    ('Técnica5');

-- Inserciones material
INSERT INTO material (name)
VALUES
    ('NO APLICA'),
    ('Material2'),
    ('Material3'),
    ('Material4'),
    ('Material5');

-- Inserciones category
INSERT INTO category (name, description)
VALUES
    ('Jardínes', 'Just a silly description 1.'),
    ('Edificios', 'Just a silly description 2.'),
    ('Canchas', 'Just a silly description 3.'),
    ('Capillas', 'Just a silly description 4.'),
    ('Plazas', 'Just a silly description 5.'),
    ('Museo', 'Just a silly description 6.'),
    ('Estacionamiento', 'Just a silly description 7.'),
    ('Category8', 'Just a silly description 8.');

-- Inserciones style
INSERT INTO style (name)
VALUES
    ('NO APLICA'),
    ('Estilo2'),
    ('Estilo3'),
    ('Estilo4'),
    ('Estilo5');

-- Inserciones mac_address
INSERT INTO mac_address (mac_address)
VALUES
    ('NO APLICA'),
    ('AA:BB:CC:DD:EE:FF'),
    ('12:34:56:78:90:AB'),
    ('98:76:54:32:10:FE'),
    ('C0:FF:EE:00:11:22'),
    ('55:44:33:22:11:00'),
    ('0A:0B:0C:0D:0E:0F'),
    ('1A:2B:3C:4D:5E:6F');
    
-- Inserciones attraction
INSERT INTO attraction (name, img, id_category, id_style, id_author, id_mac_address, id_user,lat,lng,size,description)
VALUES
    ('Jardín de la Inclusión', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_inclusion.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_inclusion_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_inclusion_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_inclusion_3.jpg"]', 1, 1, 1, 1, 1, 21.15157, -101.711369, 'NO APLICA', 'Este jardín está inspirado en un valor importante para la comunidad lasallista, la Inclusión. Desde su diseño muestra como todos son parte de la comunidad, todos ocupan un lugar especial y cada uno tiene la oportunidad de crecer y distinguirse. Lo anterior se ve representado en las plantas que se eligieron para adornar el espacio, juníperos, agapandos gigantes y enanos, lavanda, lirio, plumbago, salvia, margaritas, entre otras, que reflejan a una comunidad que acepta las diferencias de sus miembros, pero los acoge a todos.'),
    ('Jardín del Caos a la Claridad', '["https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_2.jpg"]', 1, 1, 1, 1, 1, 21.15294, -101.71094, 'NO APLICA', 'En su diseño se aprecian líneas de flores que representan los diferentes caminos que las personas tomamos, son caminos rápidos que invitan a moverse, a mejorar, a trascender. Este Jardín se conecta con el jardín de la transfiguración.'),
    ('Jardín de la Transfiguración', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_de_la_transfiguracion_4.jpg"]', 1, 1, 1, 1, 1, 21.153287, -101.711168, 'NO APLICA', 'Basado en el pasaje de la transfiguración del evangelio, pretende que todo el que pase por este sitio, sienta que en su ser resuene la frase "Este es mi hijo amado, en quien me complazco". En su recorrido va mostrando la trasformación de las personas al tener experiencias y nutrirse de ellas. Es un jardín con espacios dedicados a leer, a nutrir el conocimiento, y lograr la experiencia de que cada visitante se sienta plenamente amado y reconozca la muestra de la gloria de Dios.'),
    ('Jardín del Servicio', '["https://salle-images-bucket.s3.amazonaws.com/jardin_del_servicio.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_1.png", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_2.png", "https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_3.png"]', 1, 1, 1, 1, 1, 21.151067, -101.710672, 'NO APLICA', 'El Jardín es un maestro que enseña cómo vivir compartiendo, en él se encuentran árboles frutales y hierbas de olor comestible, todas al servicio de los demás. Tiene como elemento principal un olivo grande que recuerda a Jesús en el Huerto de los Olivos. En su diseño se pueden ver arcos que simbolizan cadenas que se unen y forman un todo, igual que se unen los miembros de esta Comunidad.'),
    ('Jardín de la Fraternidad', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_1.jpg"]', 1, 1, 1, 1, 1, 21.152454, -101.711552, 'NO APLICA', 'Dedicado a uno de los principales valores lasallistas, este Jardín enseña a ser y hacer, a construir en Comunidad. En su diseño se muestran círculos concéntricos inconclusos de agapandos blancos, de tal forma que quien mira el Jardín se vuelve parte de él, de la misma forma que cada persona se vuelve parte de la Comunidad. Al centro de cada círculo, se ubica un tabachin rojo que simboliza la presencia de Dios como centro de nuestra existencia.'),
    ('Jardín de la Fe', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_4.jpg"]', 1, 1, 1, 1, 1, 21.152103, -101.711458, 'NO APLICA', 'Este espacio es un escenario que nos lleva a vivir la experiencia de "El buen pastor" contenida en el Salmo 23. Su diseño, inspirado en esta liturgia, se invita a ser leído haciendo un recorrido de arriba hacia abajo, de esta manera se puede identificar cada elemento.'),
    ('Jardín Xerófilo del Bicentenario', '["https://salle-images-bucket.s3.amazonaws.com/Jard%C3%ADn+Xer%C3%B3filo+del+Bicentenario.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_Xerofilo_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_Xerofilo_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Jardin_Xerofilo_3.jpg"]', 1, 1, 1, 1, 1, 21.152869, -101.712109, 'NO APLICA', 'Este espacio tiene como objetivo fomentar la cultura por el cuidado de esta rama de la botánica: así mismo generar espacios de esparcimiento y reflexión en el alumnado, profesorado y visitantes. En el Jardín Xerófilo se pueden encontrar especies endémicas de nuestro país, algunas de ellas incluso en peligro de extinción.'),
    ('Forma', '["https://salle-images-bucket.s3.amazonaws.com/Escultura_Forma_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Forma_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Forma_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_forma.jpeg"]', 1, 1, 1, 1, 1, 21.15285, -101.71239, 'NO APLICA', '"Alberto Castro Leñero Vaciado en Bronce, 1998 Colección Instituto Oviedo Jardín Xerófilo"'),
    ('Llamados a Bogar Mar Adentro', '["https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Llamados_a_bogar_mar_adentro_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_Llamados+a+bogar+mar+adrentro.jpeg"]', 1, 1, 1, 1, 1, 21.15157, -101.71099, 'NO APLICA', '"Carlos Terrés Vaciado en Bronce, 2015 Colección Universidad De La Salle Plaza de la Fundación"'),
    ('Simbiosis', '["https://salle-images-bucket.s3.amazonaws.com/Escultura_Simbiosis_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Simbiosis_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Simbiosis_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/ecultura_Simbiosis.jpeg"]', 1, 1, 1, 1, 1, 21.15289, -101.711, 'NO APLICA', '"Ricardo Motilla Vaciado en bronce, 2003 (Edición 1/2) Colección Instituto Oviedo Escalinatas de la Biblioteca Central"'),
    ('Minotauro', '["https://salle-images-bucket.s3.amazonaws.com/Minotauro_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Minotauro_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Minotauro_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_Minotauro.jpeg"]', 1, 1, 1, 1, 1, 21.15342, -101.71226, 'NO APLICA', '"Javier de Jesús Hernández Martínez (Capelo) Vaciado en bronce, 2016 Colección Universidad De La Salle Bajío Acceso principal del Gimnasio"'),
    ('Actitud', '["https://salle-images-bucket.s3.amazonaws.com/Escultura_Actitud_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/escultura_actitud.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Escultura_Actitud_2.jpg"]', 1, 1, 1, 1, 1, 21.15265, -101.71202, 'NO APLICA', 'Ricado motilla'),
    ('Capilla edificio P', '["https://salle-images-bucket.s3.amazonaws.com/capilla+negocios1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios3.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios4.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+negocios5.jpeg"]', 1, 1, 1, 1, 1, 21.1539654, -101.7112652, 'NO APLICA', 'Capilla ubicada en la facultad de negocios edificio P'),
    ('Capilla edificio H', '["https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+idioma2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas3.jpeg", "https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas4.jpeg"]', 1, 1, 1, 1, 1, 21.1521891, -101.7113668, 'NO APLICA', 'Capilla ubicada in the center of idiomas, building H'),
    ('E', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_E_1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_E_2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_E_3.jpeg"]', 1, 1, 1, 1, 1, 21.151952, -101.709695, 'NO APLICA', '"Escuela de Agronomía Escuela de Enfermería Escuela de Veterinaria Hospital Veterinario para pequeñas especies Centro de Simulación para la Salud"'),
    ('F', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_F_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_F_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_F_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/edificio_f.jpg"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Talleres'),
    ('I', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_I_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_I_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_I_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/edificio_i.jpg"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Edificio de Ingenierías'),
    ('J', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_J_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_J_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_J_3.jpg"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Edificio de Arquitectura'),
     ('K', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_K_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_2.jpg", "https://salle-images-bucket-s3.amazonaws.com/Edificio_K_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_5.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_K_6.jpg"]', 1, 1, 1, 1, 1, 21.1524662, -101.7106637, 'NO APLICA', 'Talleres de diseño'),
    ('L', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_L_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_L_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/biblioteca.jpeg"]', 1, 1, 1, 1, 1, 21.1531389, -101.71097, 'NO APLICA', 'Biblioteca'),
    ('M', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_M_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_M_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_M_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_M_4.jpg"]', 1, 1, 1, 1, 1, 21.1531406, -101.7105346, 'NO APLICA', 'Edificio de Diseño'),
    ('O', '["https://salle-images-bucket.s3.amazonaws.com/EdificioO.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_O_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_O_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_O_3.jpg"]', 1, 1, 1, 1, 1, 21.15324402, -101.7126007, 'NO APLICA', 'Universum: Centro para realizar eventos y recinto con cancha de baloncesto. En el sector inferior se encuentra coordinación de Desarrollo y Gestión Cultura, la Coordinación de Grupos Estudiantiles, la Coordinación de Solidaridad y el Gimnasio'),
    ('P', '["https://salle-images-bucket.s3.amazonaws.com/EdificioP.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_P_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_P_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_P_3.jpg"]', 1, 1, 1, 1, 1, 21.15375328, -101.7113495, 'NO APLICA', 'Negocios: Edificio de la facultad de Turisimo y Gastronomía y Negocios. Ahí mismo se encuentra la Dirección de Investigación y Doctorado, así como el auditorio Miguel Febres Cordero.'),
    ('Q', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_Q_5.jpg", "https://salle-images-bucket.s3.amazonaws.com/EdificioQ.jpg"]', 1, 1, 1, 1, 1, 21.15363121, -101.711731, 'NO APLICA', 'Gastronomia: Unidad de pácticas para la facultad de Gastronomía'),
    ('R', '["https://salle-images-bucket.s3.amazonaws.com/Edificio_R.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_R_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_R_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/Edificio_R_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/edificio_r.jpg"]', 1, 1, 1, 1, 1, 21.151952, -101.709695, 'NO APLICA', 'Enfermería'),
    ('T1', '["https://salle-images-bucket.s3.amazonaws.com/EdificioT1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_Seccion2_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_Seccion2_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_Seccion2_3.jpg"]', 1, 1, 1, 1, 1, 21.15190697, -101.7110519, 'NO APLICA', 'Plaza San Juan Bautista de la Salle 1: Sección 1 de la Plaza de San Juan Bautista de la Salle'),
    ('T2', '["https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Plaza_Juan_Bautista_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/EdificioT2.jpg"]', 1, 1, 1, 1, 1, 21.15205574, -101.7108307, 'NO APLICA', 'Plaza San Juan Bautista de la Salle 2: Sección 2 of the Plaza de San Juan Bautista de la Salle'),
    ('U', '["https://salle-images-bucket.s3.amazonaws.com/U_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/U_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/U_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/U_4.jpg"]', 1, 1, 1, 1, 1, 21.153397, -101.71142, 'NO APLICA', 'Plaza del Centenario'),
    ('MIM', '["https://salle-images-bucket.s3.amazonaws.com/MiM_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/MiM_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/MiM_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/MiM_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/mim.jpeg"]', 1, 1, 1, 1, 1, 21.153397, -101.71142, 'NO APLICA', 'Museo MiM'),
    ('Cancha Uruguaya', '["https://salle-images-bucket.s3.amazonaws.com/cancha_uruguaya.png"]', 1, 1, 1, 1, 1, 21.1516419, -101.7127994, 'NO APLICA', 'Cancha Uruguaya'),
    ('Cancha Palco', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Palco_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Palco_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_palco.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Palco_3.jpg"]', 1, 1, 1, 1, 1, 21.1530975, -101.7127800, 'NO APLICA', 'Cancha Palco'),
    ('Cancha Escudos', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_escudo_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_escudo_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_escudos.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_escudo_3.jpg"]', 1, 1, 1, 1, 1, 21.151953, -101.7120809, 'NO APLICA', 'Cancha Escudos'),
    ('Cancha Tenis', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_tenis.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Tenis_4.jpg"]', 1, 1, 1, 1, 1, 21.1533351, -101.7130435, 'NO APLICA', 'Cancha Tenis'),
    ('Cancha de futbol rápido', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_futbol_rapido_1.jpeg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_futbol_rapido_2.jpeg", "https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_rapido.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_futbol_rapido_3.jpeg"]', 1, 1, 1, 1, 1, 21.1532695, -101.7118191, 'NO APLICA', 'Cancha Futbol Rápido'),
    ('Cancha de Basquetball (negocios)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Negocios_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Negocios_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_basketball_negocios.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Negocios_3.jpg"]', 1, 1, 1, 1, 1, 21.1537776, -101.7108276, 'NO APLICA', 'Cancha Basquet Negocios'),
    ('Cancha de Basquetball (Atrás de biblioteca)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_atras_biblioteca_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_atras_biblioteca_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_atras_biblioteca_3.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_baket_atras_de_biblioteca.png"]', 1, 1, 1, 1, 1, 21.1536093, -101.7106000, 'NO APLICA', 'Cancha Basquet Biblioteca'),
    ('Cancha futbol (medicina)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_medicina.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_3.jpg"]', 1, 1, 1, 1, 1, 21.1523255, -101.7100733, 'NO APLICA', 'Cancha Futbol Medicina'),
    ('Cancha futbol (patio hundido)', '["https://salle-images-bucket.s3.amazonaws.com/Cancha_Medicina_4.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Hundida_1.jpg", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Hundida_2.jpg", "https://salle-images-bucket.s3.amazonaws.com/cancha_patio_hundido.png", "https://salle-images-bucket.s3.amazonaws.com/Cancha_Hundida_3.jpg"]', 1, 1, 1, 1, 1, 21.1537776, -101.7108276, 'NO APLICA', 'Cancha Futbol Patio Hundido'),
    ('Estacionamiento_principal', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_principal.jpeg"]', 1, 1, 1, 1, 1, 21.1505678, -101.7108169, 'NO APLICA', 'EstacionamientoPrincipal'),
    ('Estacionamiento_principal_2', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_principal_2.jpeg"]', 1, 1, 1, 1, 1, 21.1536354, -101.7128998, 'NO APLICA', 'EstacionamientoPrincipal2'),
    ('Estacionamiento_2', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_2.jpeg"]', 1, 1, 1, 1, 1, 21.1511195, -101.712597, 'NO APLICA', 'Estacionamiento2'),
    ('Estacionamiento_3', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_3.jpeg"]', 1, 1, 1, 1, 1, 21.1523994, -101.7135925, 'NO APLICA', 'Estacionamiento3'),
    ('Estacionamiento_4', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_4.jpeg"]', 1, 1, 1, 1, 1, 21.1533704, -101.7136088, 'NO APLICA', 'Estacionamiento4'),
    ('Estacionamiento_maestros', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_maestros.jpeg"]', 1, 1, 1, 1, 1, 21.1519911, -101.7132727, 'NO APLICA', 'EstacionamientoMaestros'),
    ('Estacionamiento_7', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_7.jpeg"]', 1, 1, 1, 1, 1, 21.1529568, -101.7094848, 'NO APLICA', 'Estacionamiento7');

-- Inserciones detail_tecnique
INSERT INTO detail_tecnique (id_attraction, id_tecnique)
VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1);

-- Inserciones detail_material
INSERT INTO detail_material (id_attraction, id_material)
VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1);

