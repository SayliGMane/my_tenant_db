import psycopg2 as pg 

CONN = pg.connect(
  user = "postgres" ,
  password = "postgres",
  dbname = "my_assessment_db",
  port = 5432
)

def fetch_all_owners_details():
      # query 
    query = """
        SELECT * FROM private_data.flat_owner_details;
        """

      #Connection
    with CONN.cursor() as cursor:
        cursor.execute(query)
        owners = cursor.fetchall()
        return owners



def fetch_all_tenant_details():
      # query 
    query = """
        SELECT * FROM private_data.tenant_details;
        """

      #Connection
    with CONN.cursor() as cursor:
        cursor.execute(query)
        tenant = cursor.fetchall()
        return tenant    


def fetch_all_property_details():
    query = """SELECT * FROM private_data.flat_details"""
    with CONN.cursor() as cursor:
        cursor.execute(query) 
        property = cursor.fetchall()
        return property


def monthly_income_details_ravindra():
    query = """SELECT SUM(rent) 
                FROM private_data.rent_details 
                JOIN private_data.flat_owner_details ON private_data.rent_details.flatno = private_data.flat_owner_details.flatno
                WHERE private_data.flat_owner_details.owner->>'first name' = 'Ravindra';"""
    with CONN.cursor() as cursor:
        cursor.execute(query) 
        monthly_details = cursor.fetchone()
        return monthly_details
    

def monthly_income_details_sayli():
    query = """SELECT SUM(rent) 
                FROM private_data.rent_details 
                JOIN private_data.flat_owner_details ON private_data.rent_details.flatno = private_data.flat_owner_details.flatno
                WHERE private_data.flat_owner_details.owner->>'first name' = 'Sayli';"""
    with CONN.cursor() as cursor:
        cursor.execute(query) 
        monthly_details = cursor.fetchone()
        return monthly_details    
    
def count_properties():
    query = """SELECT COUNT (*) AS "Property_count",owner->>'first name' AS "Owner" FROM private_data.flat_owner_details
              GROUP BY owner->>'first name'; """
    with CONN.cursor() as cursor:
        cursor.execute(query) 
        property_count = cursor.fetchall()
        return property_count

def extract_date():
    query = """SELECT fod.owner->>'first name' AS "Owner", fod.flatno AS "Flat No.",  td.tenantname AS "Tenant Name", rd.contractenddate-31 AS "Post Add. Or Send Notification"FROM private_data.flat_owner_details AS fod
                JOIN private_data.rent_details AS rd ON fod.flatno = rd.flatno
                JOIN private_data.tenant_details AS td ON rd.tenantid = td.tenantid;
                  """
    with CONN.cursor() as cursor:
        cursor.execute(query) 
        extracted_date = cursor.fetchall()
        return extracted_date
             
def yearly_spent_by_tenant(): 
    query = """SELECT (r.rent*12) AS "Yearly Spent on Rent", t.tenantname "Tenant Name" FROM private_data.tenant_details AS t
               LEFT JOIN private_data.rent_details AS r ON t.tenantid = r.tenantid;
                  """
    with CONN.cursor() as cursor:
        cursor.execute(query) 
        rent_by_tenant = cursor.fetchall()
        return rent_by_tenant    