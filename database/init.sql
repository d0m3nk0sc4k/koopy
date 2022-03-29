CREATE TABLE
    USERS(
        id INT NOT NULL PRIMARY key AUTO_INCREMENT,
        name VARCHAR(250) NOT NULL,
        mail VARCHAR(250) NOT NULL UNIQUE,
        password VARCHAR(250) NOT NULL,
        profile_img VARCHAR(250),
        last_logon datetime
    );

CREATE TABLE
    PRODUCTS(
        id INT NOT NULL PRIMARY key AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        barcode VARCHAR(250),
        producer VARCHAR(150) NOT NULL
    );

CREATE TABLE
    FAMILY(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(200) NOT NULL,
        address VARCHAR(200),
        admin INT NOT NULL,
        FOREIGN key (admin) REFERENCES USERS(id)
    );

CREATE TABLE
    FAMILY_HAS_USER(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        id_u INT NOT NULL,
        id_f INT NOT NULL,
        FOREIGN KEY (id_u) REFERENCES USERS(id),
        FOREIGN key (id_f) REFERENCES FAMILY(id)
    );

CREATE TABLE
    LIST(
        id INT NOT NULL AUTO_INCREMENT PRIMARY key,
        name VARCHAR(100) NOT NULL,
        id_f INT NOT NULL,
        admin INT NOT NULL,
        FOREIGN KEY (id_f) REFERENCES FAMILY(id),
        FOREIGN KEY (admin) REFERENCES USERS(id)
    );

CREATE TABLE
    LIST_HAS_PRODUCTS(
        id INT NOT NULL PRIMARY key AUTO_INCREMENT,
        id_p INT NOT NULL,
        id_l INT NOT NULL,
        FOREIGN KEY (id_p) REFERENCES PRODUCTS(id),
        FOREIGN KEY (id_l) REFERENCES LIST(id)
    );