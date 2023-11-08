DROP DATABASE IF EXISTS testi;
CREATE DATABASE testi;
USE testi;

-- CREATE tables

CREATE TABLE Users (
  user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  user_level_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE Customers (
  customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE FavoriteMeals (
  id INT NOT NULL PRIMARY KEY,
  meal VARCHAR(255) NOT NULL,
  FOREIGN KEY (id) REFERENCES Customers(customer_id)
);

CREATE TABLE MediaItems (
  media_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  filesize INT NOT NULL,
  media_type VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (media_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users VALUES (260, 'VCHar', 'secret123', 'vchar@example.com', 1, null);
INSERT INTO Users VALUES (305, 'Donatello', 'secret234', 'dona@example.com', 1, null);
INSERT INTO Users VALUES (261, 'matti', 'secret125', 'matti@example.com', 1, null);


-- Inserting multiple records at once
INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type, created_at) 
  VALUES ('ffd8.jpg', 887574, 'Favorite drink', null, 305, 'image/jpeg', null),
         ('dbbd.jpg', 60703, 'Miika', 'My Photo', 305, 'image/jpeg', null),
         ('2f9b.jpg', 30635, 'Aksux and Jane', 'friends', 260, 'image/jpeg', null);


-- add media items
INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type, created_at) 
  VALUES ('ffd8.jpg', 887574, 'Favorite drink', '', 305, 'image/jpeg', null);


INSERT INTO Customers (name, password, address, phone, created_at)
  VALUES ('Katti', 'peruna123', 'Muumilaakso 3', '317400101', null),
         ('Hattivatti', 'Kattila123', 'Tampere 10', '8932749238', null);

INSERT INTO FavoriteMeals VALUES (1, 'Perunalaatikko');



UPDATE Customers SET address = 'pöllölaakso' WHERE customer_id = 1;


-- Select all columns from the MediaItems table:
SELECT * FROM MediaItems;

-- Select all media items for a specific user:
SELECT * FROM MediaItems WHERE user_id = 260;

-- Select usernames and emails from the Users table:
SELECT username, email FROM Users;

-- Select the top 5 largest media items
SELECT * FROM MediaItems ORDER BY filesize DESC LIMIT 2;

SELECT * FROM Customers;