CREATE DATABASE salle_around_me_db;
USE salle_around_me_db;

-- Tabla User
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    password TEXT,
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
INSERT INTO user (name, password, email)
VALUES
    ('Usuario1', '', 'usuario1@example.com');

-- Inserciones author
INSERT INTO author (name, father_lastname, mother_lastname, birthday, death)
VALUES
    ('Autor1', 'ApellidoP1', 'ApellidoM1', '1990-01-01 00:00:00', '2000-01-01 00:00:00'),
    ('Autor2', 'ApellidoP2', 'ApellidoM2', '1985-03-15 00:00:00', '2015-06-20 00:00:00'),
    ('Autor3', 'ApellidoP3', 'ApellidoM3', '1978-09-10 00:00:00', '2022-02-28 00:00:00'),
    ('Autor4', 'ApellidoP4', 'ApellidoM4', '1982-07-25 00:00:00', '2010-12-05 00:00:00'),
    ('Autor5', 'ApellidoP5', 'ApellidoM5', '1995-04-30 00:00:00', '2018-11-15 00:00:00'),
    ('Autor6', 'ApellidoP6', 'ApellidoM6', '1995-04-30 00:00:00', '2018-11-15 00:00:00');

-- Inserciones tecnique
-- Inserciones tecnique
INSERT INTO tecnique (name)
VALUES
    ('NO APLICA'),
    ('Acuarela'),
    ('Dibujo a lápiz'),
    ('Vaciado en bronce'),
    ('Talla en madera'),
    ('Modelado en arcilla'),
    ('Fundición en bronce'),
    ('Esculpido en mármol'),
    ('Esculpido en piedra'),
    ('Forja en metal'),
    ('Ensamblaje'),
    ('Soldadura'),
    ('Repujado en metal'),
    ('Esculpido en yeso'),
    ('Acabado de cerámica'),
    ('Talla en hielo'),
    ('Talla en jabón'),
    ('Plegado en papel'),
    ('Modelado en plastilina'),
    ('Grabado en relieve'),
    ('Modelado en cera'),
    ('Esulpido en arena'),
    ('Esculpido en alambre');

-- Inserciones material
INSERT INTO material (name)
VALUES
    ('NO APLICA'),
    ('Bronce'),
    ('Ladrillo'),
    ('Mármol'),
    ('Cantera'),
    ('Madera'),
    ('Arcilla'),
    ('Yeso'),
    ('Cerámica'),
    ('Vidrio'),
    ('Resina'),
    ('Aluminio'),
    ('Papel'),
    ('Plástico'),
    ('Hormigón'),
    ('Cartón'),
    ('Acrílico'),
    ('Cera'),
    ('Granito'),
    ('Hierro'),
    ('Acero');

-- Inserciones category
INSERT INTO category (name, description)
VALUES
    ('Jardínes', 'Jardínes de la salle.'),
    ('Edificios', 'Edificios de la salle.'),
    ('Canchas', 'Canchas de la salle.'),
    ('Capillas', 'Capillas de la salle.'),
    ('Plazas', 'Plazas de la salle.'),
    ('Museo', 'Museo.'),
    ('Estacionamientos', 'Estacionamientos de la salle');

-- Inserciones style
INSERT INTO style (name)
VALUES
    ('NO APLICA'),
    ('Escultura');

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
    ('Jardín de la Inclusión', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_inclusion_1.webp", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_inclusion_2.webp", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_inclusion_3.webp", "https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_inclusion.webp"]', 1, 1, 1, 1, 1, 21.15157, -101.711369, 'NO APLICA', 'Este jardín está inspirado en un valor importante para la comunidad lasallista, la Inclusión. Desde su diseño muestra como todos son parte de la comunidad, todos ocupan un lugar especial y cada uno tiene la oportunidad de crecer y distinguirse. Lo anterior se ve representado en las plantas que se eligieron para adornar el espacio, juníperos, agapandos gigantes y enanos, lavanda, lirio, plumbago, salvia, margaritas, entre otras, que reflejan a una comunidad que acepta las diferencias de sus miembros, pero los acoge a todos.'),
    ('Jardín del Caos a la Claridad','["https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_1.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_2.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad_3.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_del_caos_a_la_claridad.webp"]', 1, 1, 1, 1, 1, 21.15294, -101.71094, 'NO APLICA', 'En su diseño se aprecian líneas de flores que representan los diferentes caminos que las personas tomamos, son caminos rápidos que invitan a moverse, a mejorar, a trascender. Este Jardín se conecta con el jardín de la transfiguración.'),
    ('Jardín de la Transfiguración', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion_1.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion_2.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion_3.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion_4.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_transfiguracion.webp"]', 1, 1, 1, 1, 1, 21.153287, -101.711168, 'NO APLICA', 'Basado en el pasaje de la transfiguración del evangelio, pretende que todo el que pase por este sitio, sienta que en su ser resuene la frase "Este es mi hijo amado, en quien me complazco". En su recorrido va mostrando la trasformación de las personas al tener experiencias y nutrirse de ellas. Es un jardín con espacios dedicados a leer, a nutrir el conocimiento, y lograr la experiencia de que cada visitante se sienta plenamente amado y reconozca la muestra de la gloria de Dios.'),
    ('Jardín del Servicio', '["https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_1.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_2.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_del_Servicio_3.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_del_servicio.webp"]', 1, 1, 1, 1, 1, 21.151067, -101.710672, 'NO APLICA', 'El Jardín es un maestro que enseña cómo vivir compartiendo, en él se encuentran árboles frutales y hierbas de olor comestible, todas al servicio de los demás. Tiene como elemento principal un olivo grande que recuerda a Jesús en el Huerto de los Olivos. En su diseño se pueden ver arcos que simbolizan cadenas que se unen y forman un todo, igual que se unen los miembros de esta Comunidad.'),
    ('Jardín de la Fraternidad', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_1.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_2.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad_3.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fraternidad.webp"]', 1, 1, 1, 1, 1, 21.152454, -101.711552, 'NO APLICA', 'Dedicado a uno de los principales valores lasallistas, este Jardín enseña a ser y hacer, a construir en Comunidad. En su diseño se muestran círculos concéntricos inconclusos de agapandos blancos, de tal forma que quien mira el Jardín se vuelve parte de él, de la misma forma que cada persona se vuelve parte de la Comunidad. Al centro de cada círculo, se ubica un tabachin rojo que simboliza la presencia de Dios como centro de nuestra existencia.'),
    ('Jardín de la Fe', '["https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_1.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_2.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_3.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe_4.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_de_la_fe.webp"]', 1, 1, 1, 1, 1, 21.152103, -101.711458, 'NO APLICA', 'Este espacio es un escenario que nos lleva a vivir la experiencia de "El buen pastor" contenida en el Salmo 23. Su diseño, inspirado en esta liturgia, se invita a ser leído haciendo un recorrido de arriba hacia abajo, de esta manera se puede identificar cada elemento.'),
    ('Jardín Xerófilo del Bicentenario', '["https://salle-images-bucket.s3.amazonaws.com/jardin_Xerofilo_1.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_Xerofilo_2.webp","https://salle-images-bucket.s3.amazonaws.com/jardin_Xerofilo_3.webp"]', 1, 1, 1, 1, 1, 21.152869, -101.712109, 'NO APLICA', 'Este espacio tiene como objetivo fomentar la cultura por el cuidado de esta rama de la botánica: así mismo generar espacios de esparcimiento y reflexión en el alumnado, profesorado y visitantes. En el Jardín Xerófilo se pueden encontrar especies endémicas de nuestro país, algunas de ellas incluso en peligro de extinción.'),
    ('Forma', '["https://salle-images-bucket.s3.amazonaws.com/escultura_Forma_1.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Forma_2.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Forma_3.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_forma.webp"]', 1, 1, 1, 1, 1, 21.15285, -101.71239, 'NO APLICA', '"Alberto Castro Leñero Vaciado en Bronce, 1998 Colección Instituto Oviedo Jardín Xerófilo"'),
    ('Llamados a Bogar Mar Adentro', '["https://salle-images-bucket.s3.amazonaws.com/escultura_Llamados+a+bogar+mar+adrentro.webp","https://salle-images-bucket.s3.amazonaws.com/llamados_a_bogar_mar_adentro_1.webp","https://salle-images-bucket.s3.amazonaws.com/llamados_a_bogar_mar_adentro_2.webp","https://salle-images-bucket.s3.amazonaws.com/llamados_a_bogar_mar_adentro_3.webp","https://salle-images-bucket.s3.amazonaws.com/llamados_a_bogar_mar_adentro_4.webp"]', 1, 1, 1, 1, 1, 21.15157, -101.71099, 'NO APLICA', '"Carlos Terrés Vaciado en Bronce, 2015 Colección Universidad De La Salle Plaza de la Fundación"'),
    ('Simbiosis', '["https://salle-images-bucket.s3.amazonaws.com/escultura_Simbiosis_1.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Simbiosis_2.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Simbiosis_3.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Simbiosis.webp"]', 1, 1, 1, 1, 1, 21.15289, -101.711, 'NO APLICA', '"Ricardo Motilla Vaciado en bronce, 2003 (Edición 1/2) Colección Instituto Oviedo Escalinatas de la Biblioteca Central"'),
    ('Minotauro', '["https://salle-images-bucket.s3.amazonaws.com/escultura_Minotauro_1.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Minotauro_2.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Minotauro_3.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Minotauro.webp"]', 1, 1, 1, 1, 1, 21.15342, -101.71226, 'NO APLICA', '"Javier de Jesús Hernández Martínez (Capelo) Vaciado en bronce, 2016 Colección Universidad De La Salle Bajío Acceso principal del Gimnasio"'),
    ('Actitud', '["https://salle-images-bucket.s3.amazonaws.com/escultura_Actitud_1.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_Actitud_2.webp","https://salle-images-bucket.s3.amazonaws.com/escultura_actitud.webp","https://salle-images-bucket.s3.amazonaws.com/jard%C3%ADnXer%C3%B3filodelBicentenario.webp"]', 1, 1, 1, 1, 1, 21.15265, -101.71202, 'NO APLICA', 'Ricado motilla'),
    ('Capilla edificio P', '["https://salle-images-bucket.s3.amazonaws.com/capilla+negocios1.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+negocios2.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+negocios3.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+negocios4.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+negocios5.webp"]', 1, 1, 1, 1, 1, 21.1539654, -101.7112652, 'NO APLICA', 'Capilla ubicada en la facultad de negocios edificio P'),
    ('Capilla edificio H', '["https://salle-images-bucket.s3.amazonaws.com/capilla+idioma2.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas1.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas3.webp","https://salle-images-bucket.s3.amazonaws.com/capilla+idiomas4.webp"]', 1, 1, 1, 1, 1, 21.1521891, -101.7113668, 'NO APLICA', 'Capilla ubicada in the center of idiomas, building H'),
    ('E', '["https://salle-images-bucket.s3.amazonaws.com/edificio_E_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_E_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_E_3.webp"]', 1, 1, 1, 1, 1, 21.151952, -101.709695, 'NO APLICA', '"Escuela de Agronomía Escuela de Enfermería Escuela de Veterinaria Hospital Veterinario para pequeñas especies Centro de Simulación para la Salud"'),
    ('F', '["https://salle-images-bucket.s3.amazonaws.com/edificio_F_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_F_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_F_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_f.webp"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Talleres'),
    ('I', '["https://salle-images-bucket.s3.amazonaws.com/edificio_I_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_I_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_I_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_i.webp"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Edificio de Ingenierías'),
    ('J', '["https://salle-images-bucket.s3.amazonaws.com/edificio_J_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_J_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_J_3.webp"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Edificio de Arquitectura'),
     ('K', '["https://salle-images-bucket.s3.amazonaws.com/edificio_K_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_K_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_K_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_K_4.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_K_5.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_K_6.webp"]', 1, 1, 1, 1, 1, 21.1524662, -101.7106637, 'NO APLICA', 'Talleres de diseño'),
    ('L', '["https://salle-images-bucket.s3.amazonaws.com/biblioteca.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_L_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_L_2.webp"]', 1, 1, 1, 1, 1, 21.1531389, -101.71097, 'NO APLICA', 'Biblioteca'),
    ('M', '["https://salle-images-bucket.s3.amazonaws.com/edificio_M_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_M_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_M_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_M_4.webp"]', 1, 1, 1, 1, 1, 21.1531406, -101.7105346, 'NO APLICA', 'Edificio de Diseño'),
    ('O', '["https://salle-images-bucket.s3.amazonaws.com/edificio_O_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_O_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_O_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificioO.webp"]', 1, 1, 1, 1, 1, 21.15324402, -101.7126007, 'NO APLICA', 'Universum: Centro para realizar eventos y recinto con cancha de baloncesto. En el sector inferior se encuentra coordinación de Desarrollo y Gestión Cultura, la Coordinación de Grupos Estudiantiles, la Coordinación de Solidaridad y el Gimnasio'),
    ('P', '["https://salle-images-bucket.s3.amazonaws.com/edificio_P_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_P_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_P_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificioP.webp"]', 1, 1, 1, 1, 1, 21.15375328, -101.7113495, 'NO APLICA', 'Negocios: Edificio de la facultad de Turisimo y Gastronomía y Negocios. Ahí mismo se encuentra la Dirección de Investigación y Doctorado, así como el auditorio Miguel Febres Cordero.'),
    ('Q', '["https://salle-images-bucket.s3.amazonaws.com/edificio_Q_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_Q_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_Q_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_Q_4.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_Q_5.webp","https://salle-images-bucket.s3.amazonaws.com/edificioQ.webp"]', 1, 1, 1, 1, 1, 21.15363121, -101.711731, 'NO APLICA', 'Gastronomia: Unidad de pácticas para la facultad de Gastronomía'),
    ('R', '["https://salle-images-bucket.s3.amazonaws.com/edificio_R_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_R_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_R_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_R_4.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_r.webp"]', 1, 1, 1, 1, 1, 21.151952, -101.709695, 'NO APLICA', 'Enfermería'),
    ('T1', '["https://salle-images-bucket.s3.amazonaws.com/edificioT1.webp","https://salle-images-bucket.s3.amazonaws.com/plaza_Juan_Bautista_Seccion2_1.webp","https://salle-images-bucket.s3.amazonaws.com/plaza_Juan_Bautista_Seccion2_2.webp","https://salle-images-bucket.s3.amazonaws.com/plaza_Juan_Bautista_Seccion2_3.webp"]', 1, 1, 1, 1, 1, 21.15190697, -101.7110519, 'NO APLICA', 'Plaza San Juan Bautista de la Salle 1: Sección 1 de la Plaza de San Juan Bautista de la Salle'),
    ('T2', '["https://salle-images-bucket.s3.amazonaws.com/edificioT2.webp","https://salle-images-bucket.s3.amazonaws.com/plaza_Juan_Bautista_1.webp","https://salle-images-bucket.s3.amazonaws.com/plaza_Juan_Bautista_2.webp","https://salle-images-bucket.s3.amazonaws.com/plaza_Juan_Bautista_3.webp"]', 1, 1, 1, 1, 1, 21.15205574, -101.7108307, 'NO APLICA', 'Plaza San Juan Bautista de la Salle 2: Sección 2 of the Plaza de San Juan Bautista de la Salle'),
    ('U', '["https://salle-images-bucket.s3.amazonaws.com/V_1.webp","https://salle-images-bucket.s3.amazonaws.com/V_2.webp","https://salle-images-bucket.s3.amazonaws.com/V_3.webp","https://salle-images-bucket.s3.amazonaws.com/V_4.webp"]', 1, 1, 1, 1, 1, 21.153397, -101.71142, 'NO APLICA', 'Plaza del Centenario'),
    ('MIM', '["https://salle-images-bucket.s3.amazonaws.com/mim.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_s.webp","https://salle-images-bucket.s3.amazonaws.com/MiM_1.webp","https://salle-images-bucket.s3.amazonaws.com/MiM_2.webp","https://salle-images-bucket.s3.amazonaws.com/MiM_3.webp","https://salle-images-bucket.s3.amazonaws.com/MiM_4.webp"]', 1, 1, 1, 1, 1, 21.153397, -101.71142, 'NO APLICA', 'Museo MiM'),
    ('Cancha Uruguaya', '["https://salle-images-bucket.s3.amazonaws.com/cancha_uruguaya.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Uruguaya_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Uruguaya_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Uruguaya_3.webp"]', 1, 1, 1, 1, 1, 21.1516419, -101.7127994, 'NO APLICA', 'Cancha Uruguaya'),
    ('Cancha Palco', '["https://salle-images-bucket.s3.amazonaws.com/cancha_Palco_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Palco_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Palco_3.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_palco.webp"]', 1, 1, 1, 1, 1, 21.1530975, -101.7127800, 'NO APLICA', 'Cancha Palco'),
    ('Cancha Escudos', '["https://salle-images-bucket.s3.amazonaws.com/cancha_escudo_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_escudo_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_escudo_3.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_escudos.webp"]', 1, 1, 1, 1, 1, 21.151953, -101.7120809, 'NO APLICA', 'Cancha Escudos'),
    ('Cancha Tenis', '["https://salle-images-bucket.s3.amazonaws.com/cancha_Tenis_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Tenis_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Tenis_3.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Tenis_4.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_tenis.webp"]', 1, 1, 1, 1, 1, 21.1533351, -101.7130435, 'NO APLICA', 'Cancha Tenis'),
    ('Cancha de futbol rápido', '["https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_rapido_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_rapido_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_rapido_3.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_futbol_rapido.webp"]', 1, 1, 1, 1, 1, 21.1532695, -101.7118191, 'NO APLICA', 'Cancha Futbol Rápido'),
    ('Cancha de Basquetball (negocios)', '["https://salle-images-bucket.s3.amazonaws.com/cancha_basketball_negocios.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Negocios_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Negocios_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Negocios_3.webp"]', 1, 1, 1, 1, 1, 21.1537776, -101.7108276, 'NO APLICA', 'Cancha Basquet Negocios'),
    ('Cancha de Basquetball (Atrás de biblioteca)', '["https://salle-images-bucket.s3.amazonaws.com/cancha_atras_biblioteca_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_atras_biblioteca_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_atras_biblioteca_3.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_baket_atras_de_biblioteca.webp"]', 1, 1, 1, 1, 1, 21.1536093, -101.7106000, 'NO APLICA', 'Cancha Basquet Biblioteca'),
    ('Cancha futbol (medicina)', '["https://salle-images-bucket.s3.amazonaws.com/cancha_Medicina_4.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Medicina_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Medicina_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Medicina_3.webp"]', 1, 1, 1, 1, 1, 21.1523255, -101.7100733, 'NO APLICA', 'Cancha Futbol Medicina'),
    ('Cancha futbol (patio hundido)', '["https://salle-images-bucket.s3.amazonaws.com/cancha_Hundida_1.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Hundida_2.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_Hundida_3.webp","https://salle-images-bucket.s3.amazonaws.com/cancha_patio_hundido.webp"]', 1, 1, 1, 1, 1, 21.1537776, -101.7108276, 'NO APLICA', 'Cancha Futbol Patio Hundido'),
    ('Estacionamiento principal', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_principal.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Principal_1.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Principal_2.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Principal_3.webp"]', 1, 1, 1, 1, 1, 21.1505678, -101.7108169, 'NO APLICA', 'EstacionamientoPrincipal'),
    ('Estacionamiento de Gastronomía', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Gastro_1.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Gastro_2.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Gastro.webp"]', 1, 1, 1, 1, 1, 21.1536354, -101.7128998, 'NO APLICA', 'EstacionamientoPrincipal2'),
    ('Estacionamiento Uruguayo', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Uruguayo_1.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Uruguayo_2.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Uruguayo_3.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Uruguayo.webp"]', 1, 1, 1, 1, 1, 21.1519911, -101.7132727, 'NO APLICA', 'EstacionamientoMaestros'),
    ('Estacionamiento de Diseño', '["https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Dise%C3%B1o_1.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Dise%C3%B1o_2.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Dise%C3%B1o_3.webp","https://salle-images-bucket.s3.amazonaws.com/estacionamiento_Dise%C3%B1o.webp"]', 1, 1, 1, 1, 1, 21.1529568, -101.7094848, 'NO APLICA', 'Estacionamiento7'),
    ('A', '["https://salle-images-bucket.s3.amazonaws.com/edificio_A1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_A2.webp"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Becas'),
    ('B', '["https://salle-images-bucket.s3.amazonaws.com/edificio_B_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_B_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_B_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_B_4.webp"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Rectoría'),
    ('D', '["https://salle-images-bucket.s3.amazonaws.com/edificio_D_1.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_D_2.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_D_3.webp","https://salle-images-bucket.s3.amazonaws.com/edificio_D_4.webp"]', 1, 1, 1, 1, 1, 21.1527508, -101.7117571, 'NO APLICA', 'Facultad de Odontología');

-- Inserciones detail_tecnique
INSERT INTO detail_tecnique (id_attraction, id_tecnique)
VALUES
(8,4),
(9,4),
(10,4),
(11,4),
(12,4);

-- Inserciones detail_material
INSERT INTO detail_material (id_attraction, id_material)
VALUES
(8,2),
(9,2),
(10,2),
(11,2),
(12,2);

-- Actualización de registros de atracciones
-- Obras
UPDATE attraction
SET
  id_category = 6,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 8 AND 12;

-- Capillas
UPDATE attraction
SET
  id_category = 4,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 13 AND 14;

-- Edificios
UPDATE attraction
SET
  id_category = 2,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 15 AND 25;

-- Plazas
UPDATE attraction
SET
  id_category = 5,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 26 AND 28;

-- Edificio MiM
UPDATE attraction
SET
  id_category = 2,
  update_at = CURRENT_TIMESTAMP
WHERE id = 29;

-- Canchas
UPDATE attraction
SET
  id_category = 3,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 30 AND 38;

-- Estacionamientos
UPDATE attraction
SET
  id_category = 7,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 39 AND 42;

-- Edificios
UPDATE attraction
SET
  id_category = 2,
  update_at = CURRENT_TIMESTAMP
WHERE id BETWEEN 43 AND 45;

-- Actualización de registro de usuario (Creacion de admin)
UPDATE user
SET
  password = 'pbkdf2:sha256:600000$oceua3hyQWbNU8lB$288becaf1a5f6772579280389efca76531de0a46ef058d862bf95c54a232cded',
  update_at = CURRENT_TIMESTAMP,
  email = 'admin@gmail.com',
  name = 'ADMIN'
WHERE id = '1';

-- Actualización de registros de autor
UPDATE `salle_around_me_db`.`author` SET `name` = 'NO APLICA', `father_lastname` = 'NO APLICA', `mother_lastname` = 'NO APLICA' WHERE (`id` = '1');
UPDATE `salle_around_me_db`.`author` SET `name` = 'Desconocido', `father_lastname` = 'Desconocido', `mother_lastname` = 'Desconocido', `birthday` = '0000-00-00 00:00:00', `death` = '0000-00-00 00:00:00' WHERE (`id` = '2');
UPDATE `salle_around_me_db`.`author` SET `name` = 'Alberto', `father_lastname` = 'Castro', `mother_lastname` = 'Leñero' WHERE (`id` = '3');
UPDATE `salle_around_me_db`.`author` SET `name` = 'José Carlos', `father_lastname` = 'Hernández', `mother_lastname` = 'Martín del Campo', `birthday` = '1950-10-30 00:00:00', `death` = '0000-00-00 00:00:00' WHERE (`id` = '4');
UPDATE `salle_around_me_db`.`author` SET `name` = 'Ricardo', `father_lastname` = 'Motilla', `mother_lastname` = 'Moreno' WHERE (`id` = '5');
UPDATE `salle_around_me_db`.`author` SET `name` = 'Javier de Jesús', `father_lastname` = 'Hernández', `mother_lastname` = 'Martínez' WHERE (`id` = '6');
UPDATE `salle_around_me_db`.`author` SET `birthday` = '1951-12-10 00:00:00', `death` = '0000-00-00 00:00:00' WHERE (`id` = '5');
UPDATE `salle_around_me_db`.`author` SET `birthday` = '1951-01-01 00:00:00', `death` = '0000-00-00 00:00:00' WHERE (`id` = '3');
UPDATE `salle_around_me_db`.`author` SET `birthday` = '1951-01-20 00:00:00' WHERE (`id` = '6');

-- Actualización de la tabla category
UPDATE `salle_around_me_db`.`category` SET `description` = 'Jardines de la salle' WHERE (`id` = '1');
UPDATE `salle_around_me_db`.`category` SET `description` = 'Edificios de la salle' WHERE (`id` = '2');
UPDATE `salle_around_me_db`.`category` SET `description` = 'Canchas de la salle' WHERE (`id` = '3');
UPDATE `salle_around_me_db`.`category` SET `description` = 'Capillas de la salle' WHERE (`id` = '4');
UPDATE `salle_around_me_db`.`category` SET `description` = 'Plazas de la salle' WHERE (`id` = '5');
UPDATE `salle_around_me_db`.`category` SET `description` = 'Museo de la salle' WHERE (`id` = '6');
UPDATE `salle_around_me_db`.`category` SET `description` = 'Estacionamientos de la salle' WHERE (`id` = '7');

-- Actualización de tabla attraction para relaciones de id's
UPDATE `salle_around_me_db`.`attraction` SET `id_author` = '3', `id_style` = '2' WHERE (`id` = '8');
UPDATE `salle_around_me_db`.`attraction` SET `id_author` = '4', `id_style` = '2' WHERE (`id` = '9');
UPDATE `salle_around_me_db`.`attraction` SET `id_author` = '5', `id_style` = '2' WHERE (`id` = '10');
UPDATE `salle_around_me_db`.`attraction` SET `id_author` = '6', `id_style` = '2' WHERE (`id` = '11');
UPDATE `salle_around_me_db`.`attraction` SET `id_author` = '5', `id_style` = '2' WHERE (`id` = '12');

