DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE (
  id SERIAL8 PRIMARY KEY,
  film_id INT8 REFERENCES film(id) ON DELETE CASCADE,
  customer_id INT8 REFERENCES customer(id) ON DELETE CASCADE
);
