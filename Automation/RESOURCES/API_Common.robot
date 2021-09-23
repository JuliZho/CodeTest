*** Settings ***
Library  PrepareData.py
Library  API_Requests.py
Library  BuiltIn
Library  SeleniumLibrary


Documentation  API common keywords
*** Variables ***
${result_success}  SUCCESS
${result_failed}   FAILURE
${string_true}     True
${string_false}    False
${invalid_token}   Invalid Token
${invalid_user}    Invalid User
*** Keywords ***

Receive data exact user
# needs to be added payload validtion, reading nested json
    ${user_data}   API_Requests.get_info_about_exact_user_payload
    ${status_eu}   API_Requests.get_info_about_exact_user_status
    Should Be Equal As Strings  ${status_eu}  ${result_success}


Receive Token Success
    ${status_ts}=  API_Requests.rettrive_token_status
    Should Be Equal As Strings  ${status_ts}   ${result_success}
    ${message_ts}=  API_Requests.rettrive_token_message
    Should Be Equal As Strings  ${message_ts}  ${string_false}

Receive Token Failure
    ${status_tf}=  API_Requests.retrieve_token_neg_status
    Should Be Equal As Strings  ${status_tf}   ${result_failed}
    ${message_tf}=  API_Requests.retrieve_token_neg_message
    Should Be Equal As Strings  ${message_tf}  ${invalid_user}

Receive users Success
    API_Requests.get_users_info
    ${status_gui}=  API_Requests.get_users_info_status
    Should Be Equal As Strings  ${status_gui}   ${result_success}
    ${usernames_gui}=  API_Requests.get_users_info_usernames
    ${usernames_xlsx}=  PrepareData.collect_registered_users_xlsx
    ${data_correct}=  API_Requests.chceck_users_count_correct  
    Should Be Equal As Strings  ${data_correct}   ${string_true}

Receive users Failure
    ${status_neg_gui}=  API_Requests.get_users_status_invalid
    Should Be Equal As Strings  ${status_neg_gui}   ${result_failed}
    ${message_neg_gui}=  API_Requests.get_user_message_invalid
    Should Be Equal As Strings  ${message_neg_gui}   ${invalid_token}
  
  
    



