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
    lat FLOAT,
    lng FLOAT
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

-- Inserciones author

-- Inserciones mac_address

-- Inserciones coordinates

-- Inserciones user

-- Inserciones tecnique

-- Inserciones style

-- Inserciones material

-- Inserciones address

-- Inserciones city

-- Inserciones country

-- Inserciones detail_attraction

-- Inserciones attraction
