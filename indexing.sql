CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user ENCODING 'utf8';

\i ./scripts/car_models.sql

\i ./scripts/car_model_data.sql -- * 10

\timing

SELECT DISTINCT make_title COUNT FROM car_models WHERE make_code = 'LAM'; --48.620 ms

SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; -- 46.401 ms

SELECT make_code,model_code,model_title,year FROM car_models WHERE make_code = 'LAM'; -- 43.557 ms

SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015; -- 164.121 ms

SELECT * FROM car_models WHERE year = 2010; -- 70.074 ms

CREATE INDEX make_code_index ON car_models(make_code); -- 5054.875 ms

CREATE INDEX year_index ON car_models(year); -- 932.199 ms

SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM'; -- 1.178 ms

SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; -- 4.834 ms

SELECT make_code, model_code,model_title,year FROM car_models WHERE make_code = 'LAM'; -- 2.776 ms

SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015; -- 141.658 ms

SELECT * FROM car_models WHERE year = 2010; -- 28.607 ms

--Year selects probably aren't showing as much performance improvement because they are numbers, not strings


