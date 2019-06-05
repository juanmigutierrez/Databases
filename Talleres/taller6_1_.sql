create table author(
name varchar(20),
addres varchar(20),
url varchar (30),
primary key(name)
);

create table publisher(
name varchar(20),
addres varchar(20),
url varchar (30),
primary key(name)
);

create table customer(
email varchar(25),
addres varchar(20),
url varchar (30),
phone numeric(10,0),
primary key(email)
);

create table book(
isbn varchar(20),
title varchar(20),
year date not null,
price numeric(10,2),
primary key(isbn)
);


create table warehouse(
code varchar(20),
addres varchar(20),
phone numeric(12,0),
primary key(code)
);

create table shopping_baket(
basket_id varchar(20),
primary key(basket_id)
);

create table written_by(
name varchar(20),
isbn varchar(20),
primary key(name,isbn),
foreign key(name) references author(name),
foreign key(isbn) references book(isbn)
);

create table written_by(
name varchar(20),
isbn varchar(20),
primary key(name,isbn),
foreign key(name) references author(name),
foreign key(isbn) references book(isbn)
);

create table published_by(
name varchar(20),
isbn varchar(20),
primary key(name,isbn),
foreign key(name) references publisher(name),
foreign key(isbn) references book(isbn)
);

create table contains(
basket_id varchar(20),
isbn varchar(20),
primary key(basket_id,isbn),
foreign key(basket_id) references shopping_baket(basket_id),
foreign key(isbn) references book(isbn)
);


create table stocks(
code varchar(20),
isbn varchar(20),
primary key(code,isbn),
foreign key(code) references warehouse(code),
foreign key(isbn) references book(isbn)
);

create table basket(
email varchar(20),
basket_id varchar(20),
primary key(email,basket_id),
foreign key(basket_id) references shopping_baket(basket_id),
foreign key(email) references customer(email)
);

-- FALTA PUNTO C Y D que solo es extender ! No olvidar hacerlos ! 

