\c my_assessment_db sayli_user


CREATE TABLE private_data.flat_owner_details (
    flat_owner_id SERIAL PRIMARY KEY,
    FlatNo INT REFERENCES private_data.flat_details(FlatNo),
    Owner json,
    bank_details VARCHAR(200)
);

-- introduce json to add info about user info


INSERT INTO private_data.flat_owner_details VALUES
(DEFAULT,032,'{"first name": "Ravindra","last name":"Navale","age":"65","gender": "Male","contact no":"+91982184120","email":"ravindra@gmail.com"}','AXIS BANK (Account NO: 213243)'),
(DEFAULT,034,'{"first name": "Ravindra","last name":"Navale","age":"65","gender": "Male","contact no":"+91982184120","email":"ravindra@gmail.com"}','AXIS BANK (Account NO: 213243)'),
(DEFAULT,012,'{"first name": "Sayli","last name":"Mane","age":"35","gender": "Female","contact no":"+919096172685","email":"sayli@gmail.com"}','AXIS BANK (Account NO: 657687)'),
(DEFAULT,011,'{"first name": "Sayli","last name":"Mane","age":"35","gender": "Female","contact no":"+919096172685","email":"sayli@gmail.com"}','AXIS BANK (Account NO: 657687)'),
(DEFAULT,004,'{"first name": "Ravindra","last name":"Navale","age":"65","gender": "Male","contact no":"+91982184120","email":"ravindra@gmail.com"}','AXIS BANK (Account NO: 213243)');

SELECT * FROM private_data.flat_owner_details;