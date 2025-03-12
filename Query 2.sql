CREATE DATABASE test;

USE test; 

CREATE TABLE addresses (

	id INT,
    house_number INT,
	city VARCHAR(20),
    postcode VARCHAR(7)
);

CREATE TABLE people (

	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
); 

CREATE TABLE pets (

	id INT,
    name VARCHAR(20),
    species VARCHAR(20), 
    owner_id INT
); 

SHOW TABLES;


ALTER TABLE addresses
ADD PRIMARY KEY(id);
ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY (address_id) REFERENCES addresses(id);

ALTER TABLE pets
ADD CONSTRAINT u_unique UNIQUE (species);
ALTER TABLE pets
DROP INDEX u_unique;


SELECT * FROM pets;
ALTER TABLE pets CHANGE `species` `animal_type` VARCHAR(20);

DESCRIBE addresses;
ALTER TABLE addresses MODIFY city VARCHAR(20);

ALTER TABLE pets
ADD PRIMARY KEY (id);
ALTER TABLE people
ADD PRIMARY KEY (id);
ALTER TABLE pets
ADD CONSTRAINT FK_OwnerAddress
FOREIGN KEY (owner_id) REFERENCES people(id);
ALTER TABLE people 
ADD COLUMN email VARCHAR(30);
ALTER TABLE people
ADD CONSTRAINT u_email UNIQUE(email);
ALTER TABLE pets CHANGE `name` `first_name` VARCHAR(20);
ALTER TABLE addresses MODIFY postcode CHAR(7);
DESCRIBE addresses;



