import builtins
from faker import Faker
from openpyxl import Workbook, load_workbook
# For testing positive scenario of registration and loging in
wb = load_workbook(filename="RESOURCES/TestData.xlsx")
ws = wb.active
def not_registered_user():
    for i in range(2, 101):
        while(ws.cell(row=i, column=6).value ==None):
            row_id=i
            return row_id
            break

row_id=not_registered_user()
print(row_id)          

def new_user_data_username():           
    username = ws.cell(row=row_id, column=1).value
    return username
def new_user_data_password():
    user_password = ws.cell(row=row_id, column=2).value
    return user_password
def new_user_data_first_name():
    first_name = ws.cell(row=row_id, column=3).value
    return first_name
def new_user_data_last_name():
    last_name = ws.cell(row=row_id, column=4).value
    return last_name
def new_user_phone_number():
    phone_number = ws.cell(row=row_id, column=5).value
    return  phone_number
    
def add_registered():
    ws.cell(row=row_id, column=6).value = "Yes"
    wb.save("RESOURCES/TestData.xlsx")

# For testing negative scenario of registration and loging in

def registered_user():
    for i in range(2, 101):
        while(ws.cell(row=i, column=6).value =="Yes"):
            row_id_neg=i
            return row_id_neg
            break

row_id_neg=registered_user()
print(row_id_neg) 

def registered_username():           
    username = ws.cell(row=row_id_neg, column=1).value
    return username

def user_password():
    user_password = ws.cell(row=row_id_neg, column=2).value
    return user_password
def registered_first_name():
    first_name = ws.cell(row=row_id_neg, column=3).value
    return first_name
def registered_last_name():
    last_name = ws.cell(row=row_id_neg, column=4).value
    return last_name
def registered_phone_number():
    phone_number = ws.cell(row=row_id_neg, column=5).value
    return  phone_number
    
def add_registered():
    ws.cell(row=row_id, column=6).value = "Yes"
    wb.save("RESOURCES/TestData.xlsx")
