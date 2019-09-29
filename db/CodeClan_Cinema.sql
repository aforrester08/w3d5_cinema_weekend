DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE films (
  id SERIAL8 UNIQUE PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE screenings (
  id SERIAL8 UNIQUE PRIMARY KEY,
  film_title VARCHAR(255),
  time VARCHAR
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  film_id INT8 REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT8 REFERENCES screenings(id) ON DELETE CASCADE
);
