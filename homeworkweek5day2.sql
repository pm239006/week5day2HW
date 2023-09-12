CREATE TABLE Movies (
  movie_id SERIAL PRIMARY KEY,
  movie_name VARCHAR(25),
  movie_length VARCHAR(7),
  movie_genre VARCHAR(20),
  director VARCHAR(25),
  cast_movie VARCHAR(500),
  description VARCHAR(500)
);

CREATE TABLE Tickets(
  ticket_id SERIAL PRIMARY KEY,
  tickets_price NUMERIC(10,2),
  movie_id INTEGER,
  customer_id INTEGER,
  payment_id NUMERIC(10,2),
  FOREIGN KEY (movie_id)REFERENCES Movies(movie_id)
);

CREATE TABLE Customers(
  customer_id SERIAL PRIMARY KEY,
  age INTEGER,
  first_name VARCHAR(25),
  last_name VARCHAR(25),
  email VARCHAR(50),
  ticket_id INTEGER,
  FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
);

CREATE TABLE Concessions(
  food_price SERIAL PRIMARY KEY,
  food_name VARCHAR(50),
  customer_id INTEGER,
  FOREIGN KEY (customer_id)REFERENCES Customers(customer_id)
);
_________________________________________________________________________________________________________________

CREATE OR REPLACE FUNCTION add_customers(
	_customer_id INTEGER,
    _age INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_email VARCHAR
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO customers
	VALUES(_customer_id, _age, _first_name, _last_name, _email);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM customers

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_customers(1, 4, 'Rylee', 'Wells', 'riles@gmail.com')
SELECT add_customers(2, 50, 'Bob', 'Burgers', 'burger12@gmail.com'),
SELECT add_customers(3, 17, 'Mickey', 'Mouse', 'hotdog@gmail.com'),
SELECT add_customers(4, 21,'Great', 'Wood', 'greatwood@gmail.com')



CREATE OR REPLACE FUNCTION add_tickets(
	_ticket_id INTEGER,
  	_tickets_price NUMERIC
	)
 	
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO tickets
	VALUES(_ticket_id,_tickets_price);
END;
$MAIN$
LANGUAGE plpgsql;
 
SELECT *
FROM tickets

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_tickets(500, '12.00')
SELECT add_tickets(501, '50.99'),
SELECT add_tickets(502, '32.99'),
SELECT add_tickets(503, '14.99')


CREATE OR REPLACE FUNCTION add_movies(
	_movie_id INTEGER,
  	_movie_name VARCHAR,
  	_movie_length VARCHAR,
  	_movie_genre VARCHAR,
  	_director VARCHAR,
  	_cast_movie VARCHAR,
  	_description VARCHAR
	)
 	
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO movies
	VALUES(_movie_id, _movie_name, _movie_length, _movie_genre,_director,_cast_movie,_description
	);
END;
$MAIN$
LANGUAGE plpgsql;
 
SELECT *
FROM movies

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_movies(23,'Barbie', '2:42','Greta Gerwig', 'fantasy comedy' ,'Margot Robbie Ryan Gosling','Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land.')
SELECT add_movies(48,'Twilight', '2:02','Catherine Hardwicke', 'romance drama' ,'Robert Pattinson and Kristen Stewart','Edward is a vampire whose family does not drink blood, and Bella, far from being frightened, enters into a dangerous romance with her immortal soulmate.')
SELECT add_movies(55,'Entergalactic', '1:40','Fletcher Moules', 'music special ' ,'Kid Cudi Jessica Williams ','Ambitious artist Jabari attempts to balance success and love after he moves into his dream Manhattan apartment and falls for his next-door neighbor.')
SELECT add_movies(99,'Super Mario Bros ', '1:32','Aaron Horvath', 'Animation' ,'Chris Pratt Jack Black','While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported through a mysterious pipe to a magical new world. But when the siblings are separated, an epic adventure begins.')

