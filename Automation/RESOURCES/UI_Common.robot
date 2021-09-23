*** Settings ***
Library  SeleniumLibrary
Library  PrepareData.py
Library  BuiltIn

Documentation  UI common keywords
*** Variables ***
${LOGIN URL}       http://192.168.43.214:8080
*** Keywords ***
Begin Web Test
   [Arguments]  ${BROWSER}
   Open Browser  ${LOGIN URL}  ${BROWSER}
   Wait Until Page Contains  index page

End Test
  Close Browser

Login with not registered data
   PrepareData.not_registered_user
   Click Link  xpath=/html/body/nav/ul/li[2]/a
    ${username}=  PrepareData.new_user_data_username
   ${user_password}=  PrepareData.new_user_data_password
   Input Text  xpath=//*[@id="username"]  ${username}
   Input Text  xpath=//*[@id="password"]     ${user_password}
   Click Button  xpath=/html/body/section/form/input[3]
   Wait Until Page Contains   You provided incorrect login details 

Register the new user 
   Click Link  xpath=/html/body/nav/ul/li[1]/a
   ${username}=  PrepareData.new_user_data_username
   ${user_password}=  PrepareData.new_user_data_password
   ${first_name}=  PrepareData.new_user_data_first_name
   ${last_name}=  PrepareData.new_user_data_last_name
   ${phone_number}=  PrepareData.new_user_phone_number
   Input Text  xpath=//*[@id="username"]  ${username}
   Input Text  xpath=//*[@id="password"]  ${user_password}
   Input Text  xpath=//*[@id="firstname"]  ${first_name}
   Input Text  xpath=//*[@id="lastname"]  ${last_name}
   Input Text  xpath=//*[@id="phone"]     ${phone_number}
   Click Button  xpath=/html/body/section/form/input[6]
   Wait Until Page Contains  Log In



Login with new user
   Click Link  xpath=/html/body/nav/ul/li[2]/a
   ${username}=  PrepareData.new_user_data_username
   ${user_password}=  PrepareData.new_user_data_password
   Input Text  xpath=//*[@id="username"]  ${username}
   Input Text  xpath=//*[@id="password"]     ${user_password}
   Click Button  xpath=/html/body/section/form/input[3]
   Wait Until Page Contains  User Information
   PrepareData.add_registered


Register with existing username
   Click Link  xpath=/html/body/nav/ul/li[1]/a
   PrepareData.registered_user
   ${username}=  PrepareData.registered_username
   ${user_password}=  PrepareData.user_password
   ${first_name}=  PrepareData.registered_first_name
   ${last_name}=  PrepareData.registered_last_name
   ${phone_number}=  PrepareData.registered_phone_number
   Input Text  xpath=//*[@id="username"]  ${username}
   Input Text  xpath=//*[@id="password"]  ${user_password}
   Input Text  xpath=//*[@id="firstname"]  ${first_name}
   Input Text  xpath=//*[@id="lastname"]  ${last_name}
   Input Text  xpath=//*[@id="phone"]     ${phone_number}
   Click Button  xpath=/html/body/section/form/input[6]
   Wait Until Page Contains  User ${username} is already registered.
   

   