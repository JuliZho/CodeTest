*** Settings ***
Documentation  Test Suite: Registration and log in with valid and invalid data
Resource  ../RESOURCES/UI_Common.robot
*** Variables ***
${BROWSER}        firefox
*** Test Cases ***
User log in with invalid data
     Begin Web Test  ${BROWSER}
     Login with not registered data
     End Test

User registration with valid data
    [Documentation]  Test case tests user registration with new, valid data
    Begin Web Test  ${BROWSER}
    Register the new user
    End Test
   
User log in with valid data
   [Documentation]  User log in with valid data
   Begin Web Test  ${BROWSER}
   Login with new user
   End Test

User registration with invalid data
    [Documentation]  User registration with existing data in the system
    Begin Web Test  ${BROWSER}
    Register with existing username
    End Test
