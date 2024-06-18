CREATE DATABASE my_assessment_db;

-- CREATE ROLE postgres WITH PASSWORD 'postgres';

-- GRANT ALL PRIVILEGES ON DATABASE my_assessment_db TO sayli_user;
-- \c my_assessment_db sayli_user

CREATE SCHEMA private_data;

CREATE TABLE private_data.flat_details(
    FlatNo INT PRIMARY KEY,
    FloorNo INT NOT NULL,
    Furnished VARCHAR(5) NOT NULL,
    Facilities TEXT[] DEFAULT NULL,
    PropertyType VARCHAR(5),
    Area_in_m2 INT,
    Price_range INT4RANGE, --- update
    Available_from DATE NOT NULL

    CHECK(PropertyType IN ('2BHK','1BHK','SHOP'))      
);

INSERT INTO private_data.flat_details VALUES
--(032,03,'Yes',ARRAY['wash-machine','dishwasher','cupboard','sofa'],'2BHK',70),
(034,03,'Yes',ARRAY['wash-machine','dishwasher','cupboard','sofa'],'2BHK',70),
(012,01,'No',ARRAY['wash-machine','cupboard','sofa'],'1BHK',60),
(011,01,'No',NULL,'2BHK',88),
(004,00,'No',NULL,'SHOP',550);

SELECT * FROM private_data.flat_details;