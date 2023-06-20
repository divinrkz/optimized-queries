### GEOSPATIAL INDEXING

Geospatial indexing is a technique used in databases to efficiently store and retrieve records based on their geographic location. It involves indexing the spatial data in a database using a specialized data structure that can quickly identify which objects or data points are located within a particular geographic region.

The geospatial index supports distance, containment, and intersection queries for various geometric 2D shapes.

For this particular example, I am using `postgresql` to implement this technique.

------------
#### SCENARIO
I am creating a `locations` table where different geographical locations can be accounted for.
Most importantly, the `coordinates` field of this table is defined as a GEOMETRY(Point, 4326), representing a geographic point using latitude and longitude coordinates in the EPSG:4326 coordinate system.

****Note****: The EPSG:4326 coordinate system uses WGS 84, which is commonly used for latitude and longitude coordinates.

To add this `coordinates` field in postgres I am going to use Point type in PostgreSQL. With the help of `PostGIS` extension, which adds support for geographic objects and spatial indexing. 

1. Install Postgis
```sql
CREATE EXTENSION postgis;
```
2. Run the `setup-query.sql` to setup tables and test data.
3. Execute the `geographical-query.sql` to experimental geospatial indexing.
