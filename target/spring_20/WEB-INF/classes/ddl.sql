SET REFERENTIAL_INTEGRITY FALSE;
drop table if exists person cascade ;
drop table if exists role cascade ;
SET REFERENTIAL_INTEGRITY TRUE;

CREATE TABLE IF NOT EXISTS role
(
    id_role   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS person
(
    user_id   INT PRIMARY KEY AUTO_INCREMENT ,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    id_role INT NOT NULL ,
    FOREIGN KEY (id_role) REFERENCES role (id_role)
);

INSERT INTO role (name)
VALUES ('User');

INSERT INTO role (name)
VALUES ('Admin');

INSERT INTO  person (login, password, email, first_name, last_name, birthday, id_role)
VALUES ('admin', 'admin', 'artemsemenov15@gmail.com','Artem','Semenov', '2003-09-10', 2 ),
       ('user', 'user', 'arsenseva15@gmail.com','Arsen','Seva', '2002-09-10', 1 );

