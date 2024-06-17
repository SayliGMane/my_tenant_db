import csv

file = open("sayli_example.csv","r")
csv_var = csv.reader(file,delimiter=",")
for row in csv_var:
    print(row)
