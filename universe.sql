-- Connect to universe database
\c universe

-- Create galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- Create star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  galaxy_id INT NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL,
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Create planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  star_id INT NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

-- Create moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  planet_id INT NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

-- Create planet_types table (5th table)
CREATE TABLE planet_types (
  planet_types_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  is_habitable BOOLEAN NOT NULL
);

-- Insert galaxy data (6 rows)
INSERT INTO galaxy (name, description, age_in_millions_of_years, distance_from_earth, is_spherical) VALUES
('Milky Way', 'Our home galaxy', 13600, 0, true),
('Andromeda', 'Nearest large galaxy', 10000, 2.5, true),
('Triangulum', 'Small spiral galaxy', 10000, 2.7, false),
('Sombrero', 'Galaxy with prominent dust lane', 13000, 29.3, true),
('Whirlpool', 'Interacting spiral galaxy', 12000, 31, true),
('Centaurus A', 'Giant elliptical galaxy', 13500, 13.7, true);

-- Insert star data (6 rows)
INSERT INTO star (name, galaxy_id, age_in_millions_of_years, distance_from_earth, has_life) VALUES
('Sun', 1, 4600, 0.000016, true),
('Sirius', 1, 2400, 8.6, false),
('Betelgeuse', 1, 11000, 640, false),
('Alpha Centauri', 1, 5000, 4.37, false),
('Vega', 1, 455, 25, false),
('Proxima Centauri', 1, 4850, 4.24, false);

-- Insert planet data (12 rows)
INSERT INTO planet (name, star_id, age_in_millions_of_years, distance_from_earth, has_life, is_spherical) VALUES
('Mercury', 1, 4600, 0.4, false, true),
('Venus', 1, 4600, 0.7, false, true),
('Earth', 1, 4600, 0, true, true),
('Mars', 1, 4600, 1.5, false, true),
('Jupiter', 1, 4600, 5.2, false, true),
('Saturn', 1, 4600, 9.5, false, true),
('Sirius b Prime', 2, 2400, 8.6, false, true),
('Sirius b Moon', 2, 2400, 8.6, false, false),
('Betelgeuse I', 3, 11000, 640, false, true),
('Betelgeuse II', 3, 11000, 640, false, false),
('Alpha Centauri b', 4, 5000, 4.37, false, true),
('Proxima c', 6, 4850, 4.24, false, true);

-- Insert moon data (20 rows)
INSERT INTO moon (name, planet_id, age_in_millions_of_years, distance_from_earth) VALUES
('Luna', 3, 4600, 0.0026),
('Phobos', 4, 4600, 1.5),
('Deimos', 4, 4600, 1.5),
('Io', 5, 4600, 5.2),
('Europa', 5, 4600, 5.2),
('Ganymede', 5, 4600, 5.2),
('Callisto', 5, 4600, 5.2),
('Titan', 6, 4600, 9.5),
('Rhea', 6, 4600, 9.5),
('Iapetus', 6, 4600, 9.5),
('Enceladus', 6, 4600, 9.5),
('Sirius b Moon 1', 7, 2400, 8.6),
('Sirius b Moon 2', 7, 2400, 8.6),
('Sirius b Moon 3', 8, 2400, 8.6),
('Betelgeuse Moon 1', 9, 11000, 640),
('Betelgeuse Moon 2', 9, 11000, 640),
('Betelgeuse Moon 3', 10, 11000, 640),
('Alpha Moon 1', 11, 5000, 4.37),
('Alpha Moon 2', 11, 5000, 4.37),
('Proxima Moon', 12, 4850, 4.24);

-- Insert planet_types data (3 rows)
INSERT INTO planet_types (name, description, is_habitable) VALUES
('Terrestrial', 'Rocky planet with solid surface', true),
('Gas Giant', 'Large planet composed mainly of gas', false),
('Ice Giant', 'Large planet with icy composition', false);
