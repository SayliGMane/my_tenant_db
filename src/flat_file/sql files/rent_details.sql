\c my_assessment_db sayli_user

CREATE TABLE private_data.rent_details (
    FlatNo INT REFERENCES private_data.flat_details(flatno),
    TenantID CHAR(5) PRIMARY KEY,
    ContractStartDate DATE CHECK (ContractStartDate < ContractEndDate),
    ContractEndDate DATE,
    Rent INT CHECK(Rent > 10000)
);



INSERT INTO private_data.rent_details (FlatNo, TenantID, ContractStartDate, ContractEndDate, Rent) VALUES
(032,'TR001', '2024-02-01', '2026-01-31', 30000),
(034,'TR002', '2023-06-01', '2024-05-31', 30000),
(012,'TS001', '2024-02-01', '2025-01-31', 15000),
(011,'TS002', '2024-04-01', '2025-01-31', 20000),
(004,'TR003', '2024-01-01', '2024-12-31', 50000);



SELECT * FROM private_data.rent_details;