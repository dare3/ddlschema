-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  airline_id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE countries
(
  countries_id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities
(
  cities_id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

CREATE TABLE flights
(
  flight_id SERIAL PRIMARY KEY,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  airline_id INT,
  from_country_id INT,
  to_country_id INT,
  from_city_id INT,
  to_city_id INT,
  FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
  FOREIGN KEY (from_country_id) REFERENCES countries(countries_id),
  FOREIGN KEY (to_country_id) REFERENCES countries(countries_id),
  FOREIGN KEY (from_city_id) REFERENCES cities(cities_id),
  FOREIGN KEY (to_city_id) REFERENCES cities(cities_id)
);

CREATE TABLE passengers
(
  passenger_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat varchar(3) NOT NULL,
  flight_id INT,
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);


-- Insert data into the tables
INSERT INTO 
  countries (country_name) 
VALUES 
  ('United States'), 
  ('United Kingdom'), 
  ('Japan'), 
  ('Mexico'), 
  ('France'), 
  ('Morocco'), 
  ('UAE'), 
  ('China'), 
  ('Brazil'), 
  ('Chile');

INSERT INTO 
  cities (city_name) 
VALUES 
  ('Washington DC'), 
  ('Seattle'), 
  ('Tokyo'), 
  ('London'), 
  ('Los Angeles'), 
  ('Las Vegas'), 
  ('Paris'), 
  ('Casablanca'), 
  ('Dubai'), 
  ('Beijing'), 
  ('New York'), 
  ('Charlotte'), 
  ('Cedar Rapids'), 
  ('Sao Paolo'), 
  ('Santiago'),
  ('New Orleans'),
  ('Mexico City'),
  ('Chicago');

INSERT INTO 
  airlines (airline_name) 
VALUES 
  ('United'),
  ('British Airways'), 
  ('Delta'), 
  ('TUI Fly Belgium'),
  ('Air China'), 
  ('American Airlines'), 
  ('Avianca Brasil');




INSERT INTO 
  flights (departure, arrival, airline_id, from_country_id, to_country_id, from_city_id, to_city_id) 
VALUES 
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 1, 1, 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 1, 4, 2, 17),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 6, 7, 8),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 7, 8, 9, 10),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 1, 1, 11, 12),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 1, 1, 13, 18),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 1, 1, 12, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 9, 10, 14, 15);

INSERT INTO 
  passengers (first_name, last_name, seat, flight_id) 
VALUES 
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);