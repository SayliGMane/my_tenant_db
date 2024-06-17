\c my_assessment_db sayli_user

CREATE TABLE private_data.tenant_details(
    TenantID CHAR(5) REFERENCES rent_details(TenantID),
    TenantName TEXT UNIQUE,
    Gender CHAR(1) ,
    PermanentAddress VARCHAR(70),
    Occupation TEXT,
    UID_Number VARCHAR(10),
    ContactNumber VARCHAR(12)
    CHECK(GENDER IN ('M','F')) 
);

INSERT INTO private_data.tenant_details (TenantID, TenantName, Gender, PermanentAddress, Occupation, UID_Number, ContactNumber) VALUES
('TR001', 'Sandeep Marathe', 'M', 'Aurangabad', 'Banker', 'ADSM239851', '9696153332'),
('TR002', 'Suraj Gujar', 'M', 'Aurangabad', 'Clerk', 'ADSG027995', '9296222392'),
('TS001', 'Ajay Dongare', 'M', 'Solapur', 'Engineer', 'ADAD003526', '8896275385'),
('TS002', 'Sheetal Tanawade', 'F', 'Barshi', 'Engineer', 'ADST734296', '6932275341'),
('TR003', 'Pradeep Ghorpade', 'M', 'Solapur', 'Banker', 'ADPG219426', '8896212284');

SELECT * FROM private_data.tenant_details;
