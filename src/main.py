from src import db

from pprint import pprint 


def main():
    print("######## My Tenant Tracker ########")
    
    while True:
        try:
            ch = int(input("Select your option : \n1. All Existing Owners\n2. All Existing Tenants\n3. All Properties Details\n4. Monthly Income of Owner Ravindra\n 5. Monthly Income of Owner Sayli \n 6.How Many properties own by each owner:\n7.Extract Dates to post the advertise or tenant for renewal of contract :\n8.Yearly amount spent on rent by each tenant:"))
            if ch == 1:
                owner_details = db.fetch_all_owners_details()
                print("All Owner Details")
                pprint(owner_details)
            elif ch == 2:
                tenant_details = db.fetch_all_tenant_details()
                print("All Tenant Details")
                pprint(tenant_details)
            elif ch == 3:
                property_details = db.fetch_all_property_details()
                print("All Property Details")
                pprint(property_details)
            elif ch == 4:
                monthly_details_ravindra = db.monthly_income_details_ravindra()
                print(f"Monthly Income Details Of Ravindra: {monthly_details_ravindra[0]}")
            elif ch == 5:
                monthly_details_sayli = db.monthly_income_details_sayli()
                print(f"Monthly Income Details Of Ravindra: {monthly_details_sayli[0]}")
            elif ch == 6: 
                property_count = db.count_properties()
                print (f"Property Count For each owner : \n {property_count[0]}\n {property_count[1]}" )
            elif ch == 7:
                extracted_date = db.extract_date()
                print(f"Send the notification or post the Advertisement on below Dates: {extracted_date} ")
            elif ch == 8:
                rent_by_tenant = db.yearly_spent_by_tenant()
                print(f"Each Tenant spent below amount yearly on rent{rent_by_tenant}")
            elif ch == 9:
                print("Exiting...")
                break
            else:
                print("Invalid option, please select a valid option (1-8).")
                
        except ValueError:
            print("Invalid input, please enter a number (1-8).")
        except Exception as e:
            print(f"An error occurred: {e}")

if __name__ == "__main__":
    
    main()