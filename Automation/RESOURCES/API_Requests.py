
from openpyxl import Workbook, load_workbook
import requests
from requests.models import HTTPBasicAuth
import jsonpath
import json
import PrepareData

url_get_token = "http://192.168.43.214:8080/api/auth/token"
url_get_information = "http://192.168.43.214:8080/api/users"
# url_update_user suports get/put methods
username = PrepareData.registered_username_api()
password = PrepareData.registered_user_password_api()
success_status="['SUCCESS']"
failure_status='FAILURE'
username_neg=PrepareData.not_registered_username_api()
password_neg=PrepareData.not_user_password_api()
url_update_user = "http://192.168.43.214:8080/api/users/"+username

def retrieve_token_data():
    url_responce = requests.get(url_get_token, headers={'Content-Type': 'application/json'}, auth=HTTPBasicAuth(username=username,password=password))
    token_json_data=json.loads(url_responce.text)
    return token_json_data
token_json_data=retrieve_token_data()

def rettrive_token_status():
    status=jsonpath.jsonpath(token_json_data, 'status')
    status=str(status[0])
    return status

def rettrive_token_message():
    message=jsonpath.jsonpath(token_json_data, 'message')
    message=str(message)
    return message

def retrieve_token():
    token=jsonpath.jsonpath(token_json_data, 'token')
    token=str(token[0])
    return token

token=retrieve_token()

#API outputs the usernames of all registered users
def get_users_info():
    url_response_gui=requests.get(url_get_information, headers={'Content-Type': 'application/json','Token': token})
    content_json=json.loads(url_response_gui.text)
    return content_json
get_users_info_json=get_users_info()

def get_users_info_usernames():
    usernames=jsonpath.jsonpath(get_users_info_json, 'payload')
    usernames=str(usernames[0])
    return usernames
users_usernames=get_users_info_usernames()

def get_users_info_status():
    status=jsonpath.jsonpath(get_users_info_json, 'status')
    status=str(status[0])
    return status
    
users_from_xslx=PrepareData.collect_registered_users_xlsx()
    
def chceck_users_count_correct():
    true="True"
    false="False"
    print(users_from_xslx)
    print(users_usernames)
    if (set(users_usernames)==set(users_from_xslx))== True:
        return true
    else:
        return false

# get data about the exact user
def get_info_about_exact_user_data():
     url_respose_gieu=requests.get(url_update_user, headers={'Content-Type': 'application/json','Token': token})
     json_exact_user_data=json.loads(url_respose_gieu.text)
     return json_exact_user_data
exact_user_data=get_info_about_exact_user_data()

# This function needs to be completed with accesing nested payload with user data: firstname, lastname, phone
def get_info_about_exact_user_payload():
     user_data_payload=jsonpath.jsonpath(exact_user_data, 'payload')
     user_data_payload=str(user_data_payload)
     return user_data_payload

def get_info_about_exact_user_status():
     user_data_status=jsonpath.jsonpath(exact_user_data, 'status')
     user_data_status=str(user_data_status[0])
     return user_data_status


# API tests negative scenario
def retrieve_token_data_neg():
    url_response = requests.get(url_get_token, headers={'Content-Type': 'application/json'}, auth=HTTPBasicAuth(username=username_neg,password=password_neg))
    token_json_data_neg=json.loads(url_response.text)
    return token_json_data_neg
token_json_data_neg=retrieve_token_data_neg()

def retrieve_token_neg_status():
    status=jsonpath.jsonpath(token_json_data_neg, 'status')
    status=str(status[0])
    return status
def retrieve_token_neg_message():
    message=jsonpath.jsonpath(token_json_data_neg, 'message')
    message=str(message[0])
    return message


invalid_token=PrepareData.invalid_token()

#API outputs the usernames of all registered users  - invalid token
def get_users_info_invalid():
    url_response_gui=requests.get(url_get_information, headers={'Content-Type': 'application/json','Token': invalid_token})
    token_json=json.loads(url_response_gui.text)
    return token_json
get_users_info_inv=get_users_info_invalid()

def get_users_status_invalid():
    status=jsonpath.jsonpath(get_users_info_inv, 'status')
    status=str(status[0])
    return status

def get_user_message_invalid():
    message=jsonpath.jsonpath(get_users_info_inv, 'message')
    message=str(message[0])
    return message
 
    