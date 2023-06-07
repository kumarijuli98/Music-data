use MUSIC_DATA;


create table artist(
artist_id int primary key,
name varchar(50)
);

create table album(
album_id int ,
title varchar(50),
artist_id int,
foreign key (artist_id) references artist(artist_id),
primary key(album_id)

);



create table customer(
customer_id int primary key,
first_name varchar(20),
last_name varchar(20),
company varchar(20),
address varchar(20),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
phone int,
fax int,
email varchar(20),
support_rep_id int,
foreign key (support_rep_id) REFERENCES employee( employee_id)
);


create table employee(
employee_id int primary key,
last_name varchar(20),
first_name varchar(20),
title varchar(20),
reports_to int,
levels varchar(20),
birthdate Date,
hire_date Date,
address varchar(20),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
phone int,
fax int,
email varchar(20)
);


create table invoice(
invoice_id int PRIMARY KEY,
customer_id int,
invoice_date date,
billing_address varchar(20),
billing_city varchar(20),
billing_state varchar(20),
billing_country varchar(20),
billing_postal_code varchar(20),
total int,
foreign key (customer_id) references customer(customer_id)
);

create table invoice_line (
invoice_line_id int primary key,
invoice_id int,
track_id int,
unit_price int,
quantity int,
foreign key(invoice_line_id) references invoice(invoice_id),
foreign key (track_id) references playlist_track(track_id)
);



create table media_type (
media_type_id int primary key,
name varchar(20)
);

create table playlist (
playlist_id int primary key,
name varchar(20)
);

create  table playlist_track (
playlist_id	int,
track_id int primary key,
foreign key (playlist_id) references playlist(playlist_id)

);


create table genre(
genre_id int primary key,
name varchar(20)
);

create table track(
track_id int ,
name varchar(20),
album_id int,	
media_type_id int,	
genre_id int,
composer varchar(20),
milliseconds int,
bytes int,
unit_price int,
foreign key (album_id) references album(album_id),
foreign key (genre_id) references genre(genre_id),
foreign key (media_type_id) references media_type(media_type_id),
foreign key (track_id) references playlist_track(track_id),
primary key(album_id,genre_id,media_type_id,track_id)
);