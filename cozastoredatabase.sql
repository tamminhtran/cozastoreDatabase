CREATE DATABASE cozastorefinal;
USE cozastorefinal;

CREATE TABLE users (
id int auto_increment,
username varchar(255) NOT NULL,
password varchar(255) NOT NULL,
email varchar (255) UNIQUE NOT NULL,

primary key(id)
);

CREATE TABLE blog (
id int auto_increment,
title varchar(512) NOT NULL,
image varchar(255),
content varchar(512) NOT NULL,
create_date datetime DEFAULT current_timestamp,
id_user int NOT NULL,

primary key(id)
);
ALTER TABLE blog ADD CONSTRAINT FK_blog_id_user FOREIGN KEY(id_user) REFERENCES users(id);

CREATE TABLE comment(
id int auto_increment,
content varchar(255) NOT NULL, 
email varchar(255) NOT NULL, 
name varchar(100), 
create_date datetime DEFAULT current_timestamp, 
id_blog int NOT NULL,

primary key (id));
ALTER TABLE comment ADD CONSTRAINT FK_comment_id_blog FOREIGN KEY(id_blog) REFERENCES blog(id);

CREATE TABLE blog_tag(
id_blog int NOT NULL, 
id_tag int NOT NULL, 
create_date datetime DEFAULT current_timestamp, 

primary key(id_blog, id_tag)
);

CREATE TABLE tag(
id int auto_increment, 
name varchar(50) NOT NULL, 
create_date datetime DEFAULT current_timestamp, 

primary key(id)
);

ALTER TABLE blog_tag ADD CONSTRAINT FK_blog_tag_id_blog FOREIGN KEY(id_blog) REFERENCES blog(id);
ALTER TABLE blog_tag ADD CONSTRAINT FK_blog_tag_id_tag FOREIGN KEY(id_tag) REFERENCES tag(id);

CREATE TABLE cart(
id int auto_increment, 
id_product int NOT NULL, 
quantity int NOT NULL, 
id_user int NOT NULL, 

primary key(id)
);

ALTER TABLE cart ADD CONSTRAINT FK_cart_id_user FOREIGN KEY(id_user) REFERENCES users(id);
CREATE TABLE product(
id int auto_increment,
name varchar(255) NOT NULL, 
images varchar(255) NOT NULL,
price decimal(15,3) NOT NULL, 
id_category int NOT NULL, 
description varchar(512), 
id_size int NOT NULL, 
id_colour int NOT NULL, 
quantity int NOT NULL,

primary key(id));
ALTER TABLE cart ADD CONSTRAINT FK_cart_id_product FOREIGN KEY(id_product) REFERENCES product(id);

CREATE TABLE category(
id int auto_increment, 
name varchar(100) NOT NULL,

primary key(id));
ALTER TABLE product ADD CONSTRAINT FK_product_id_category FOREIGN KEY(id_category) REFERENCES category(id);

CREATE TABLE carousel(
id int auto_increment, 
image varchar(255) NOT NULL,
title varchar(100) NOT NULL,
content varchar(512) NOT NULL, 
id_category int NOT NULL, 

primary key(id));
ALTER TABLE carousel ADD CONSTRAINT FK_carousel_id_category FOREIGN KEY(id_category) REFERENCES category(id);

CREATE TABLE sizes(
id int auto_increment,
name varchar(100) NOT NULL,

primary key(id));
ALTER TABLE product ADD CONSTRAINT FK_product_id_size FOREIGN KEY(id_size) REFERENCES sizes(id);

CREATE TABLE colour(
id int auto_increment,
name varchar(100) NOT NULL,

primary key(id));

ALTER TABLE product ADD CONSTRAINT FK_product_id_colour FOREIGN KEY(id_colour) REFERENCES colour(id);

CREATE TABLE orders(
id int auto_increment, 
id_user int NOT NULL,
id_status int NOT NULL, 
create_date datetime DEFAULT current_timestamp,

primary key(id));

ALTER TABLE orders ADD CONSTRAINT FK_orders_id_user FOREIGN KEY(id_user) REFERENCES users(id);

CREATE TABLE status(
id int auto_increment, 
name varchar(20) NOT NULL, 

primary key(id));

ALTER TABLE orders ADD CONSTRAINT FK_orders_id_status FOREIGN KEY(id_status) REFERENCES status(id);

CREATE TABLE product_orders(
id_product int,
id_order int,
quantity int NOT NULL,
price decimal(15,3) NOT NULL,

primary key(id_product, id_order));

ALTER TABLE product_orders ADD CONSTRAINT FK_produc_orders_id_product FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE product_orders ADD CONSTRAINT FK_product_orders_id_order FOREIGN KEY(id_order) REFERENCES orders(id);