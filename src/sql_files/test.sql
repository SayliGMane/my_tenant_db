
-- Adding Foreign Key
ALTER TABLE flat_owner_details
ADD CONSTRAINT fk
FOREIGN KEY (flatno)
REFERENCES flat_details;


ALTER TABLE  rent_details
ALTER COLUMN flatno SET DATA TYPE INT;

ALTER TABLE rent_details
ALTER COLUMN flatno TYPE INT USING flatno::INT;



ALTER TABLE rent_details
ADD CONSTRAINT fk
FOREIGN KEY (flatno)
REFERENCES flat_details;


SELECT * FROM flat_details AS fd 
JOIN flat_owner_details AS fod ON fd.flatno = fod.flatno;


UPDATE flat_owner_details 
SET owner='{"first name": "Ravindra","last name":"Navale","age":"65","gender": "Male","contact no":"+91982184120","email":"ravindra@gmail.com"}'
WHERE flatno = 032;

UPDATE flat_owner_details 
SET owner='{"first name": "Ravindra","last name":"Navale","age":"65","gender": "Male","contact no":"+91982184120","email":"ravindra@gmail.com"}'
WHERE flatno = 034;


UPDATE flat_owner_details 
SET owner='{"first name": "Sayli","last name":"Mane","age":"35","gender": "Female","contact no":"+919096172685","email":"sayli@gmail.com"}'
WHERE flatno = ;

-- updating flat_details table price range:
UPDATE flat_details 
SET price_range = int4range(49000, 55000, '[]')
WHERE flatno = 4;


UPDATE flat_details 
SET price_range = int4range(19000, 25000, '[]')
WHERE flatno = 11;

UPDATE flat_details 
SET price_range = int4range(14000, 20000, '[]')
WHERE flatno = 12;