-- Query to return all locations near a certain location (longitude, latitude) in a given distance of meters.
-- Let's use coordinates of RDB Gishushu. (-1.9527476171893867, 30.103526354598248)
SET @longitude = -1.9527476171893867;
SET @latitude = 30.103526354598248;
SET @distance = 2000;
SELECT * FROM locations WHERE ST_DWithin(coordinates, ST_GeomFromText('POINT(@longitude @latitude)', 4326), @distance);