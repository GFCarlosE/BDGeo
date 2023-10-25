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

-- Tabla Detail_Attractive
CREATE TABLE detail_attractive (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(200),
    tecnique VARCHAR(50),
    material VARCHAR(50),
    size VARCHAR(50),
    style VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    address VARCHAR(100)
);

-- Tabla User
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    password VARCHAR(20),
    token VARCHAR(50),
    email VARCHAR(30)
);

-- Tabla Attractive
CREATE TABLE attractive (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    img VARCHAR(150),
    id_detail INT,
    id_category INT,
    id_author INT,
    id_coordinates INT,
    id_mac_address INT,
    id_user INT,
    FOREIGN KEY (id_detail) REFERENCES detail_attractive(id),
    FOREIGN KEY (id_category) REFERENCES category(id),
    FOREIGN KEY (id_author) REFERENCES author(id),
    FOREIGN KEY (id_coordinates) REFERENCES coordinates(id),
    FOREIGN KEY (id_mac_address) REFERENCES mac_address(id),
    FOREIGN KEY (id_user) REFERENCES user(id)
);
