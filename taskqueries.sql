-- To get the monthly income of the owner 'Ravindra' 
SELECT SUM(rent) 
FROM rent_details 
JOIN flat_owner_details ON rent_details.flatno = flat_owner_details.flatno
WHERE flat_owner_details.owner->>'first name' = 'Ravindra';

-- To get the monthly income of the owner 'Sayli' 
SELECT SUM(rent) 
FROM rent_details 
JOIN flat_owner_details ON rent_details.flatno = flat_owner_details.flatno
WHERE flat_owner_details.owner->>'first name' = 'Sayli';

-- Get details of specific tenant based on tenant id with owner: 

SELECT fod.owner -> 'first name' AS "Owner's Name" , fod.flatno AS "Flat No",t.tenantname AS "Tenant Name"
FROM flat_owner_details AS fod
JOIN rent_details AS r ON fod.flatno=r.flatno
JOIN tenant_details AS t ON r.tenantid = t.tenantid;

-- How many properties own by each owner 

SELECT COUNT (*) AS "Property_count",owner->>'first name' AS "Owner" FROM flat_owner_details
GROUP BY owner->>'first name'; 

-- Owner wants notification to post the add or tennant for renewal of contract. 
SELECT fod.owner->>'first name' AS "Owner", fod.flatno AS "Flat No.",  td.tenantname AS "Tenant Name", rd.contractenddate-31 AS "Post Add. Or Send Notification"FROM flat_owner_details AS fod
JOIN rent_details AS rd ON fod.flatno = rd.flatno
JOIN tenant_details AS td ON rd.tenantid = td.tenantid;

-- How Much Specific tenant Spent on the rent yearly.
SELECT (r.rent*12) AS "Yearly Spent on Rent", t.tenantname "Tenant Name" FROM tenant_details AS t
LEFT JOIN rent_details AS r ON t.tenantid = r.tenantid;
