
-- Create Locations Table
CREATE TABLE `locations` (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  coordinates GEOMETRY (POINT, 4326),
  city VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL,
);


-- Insert records
INSERT INTO locations (name, city, country, coordinates)
VALUES ('Rwanda Coding Academy', 'Nyabihu', 'Rwanda', ST_GeomFromText('POINT(-1.600700 29.514900)', 4326));

INSERT INTO locations (name, city, country, coordinates)
VALUES ('Kigali Convention Center', 'Kigali', 'Rwanda', ST_GeomFromText('POINT(-1.9537390773015435 30.093731531020865)', 4326));

INSERT INTO locations (name, city, country, coordinates)
VALUES ('Kigali Heights', 'Kigali', 'Rwanda', ST_GeomFromText('POINT(-1.9520234605925377 30.092658647449944)', 4326));

INSERT INTO locations (name, city, country, coordinates)
VALUES ('Volcanoes National Park', 'Musanze', 'Rwanda', ST_GeomFromText('POINT(-1.4313054271547225 29.599427969303886)', 4326));

INSERT INTO locations (name, city, country, coordinates)
VALUES ('One&Only Gorilla Nest', 'Musanze', 'Rwanda', ST_GeomFromText('POINT(-1.4417584095327924 29.57833946413188)', 4326));

INSERT INTO locations (name, city, country, coordinates)
VALUES ('Kigali Pele Stadium', 'Kigali', 'Rwanda', ST_GeomFromText('POINT(-1.9781330306774811 30.043880483977006)', 4326));

INSERT INTO locations (name, city, country, coordinates)
VALUES ('BK Arena', 'Kigali', 'Rwanda', ST_GeomFromText('POINT(-1.9529517685658309 30.115906060691096)', 4326));




