CREATE TABLE movies(
	id_movies INT PRIMARY KEY,
	title varchar(50),
	genre varchar(100)
);

CREATE TABLE ratings(
	id_raiting INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	user_id INT,
	id_movies INT,
	time_stamp BIGINT
);
