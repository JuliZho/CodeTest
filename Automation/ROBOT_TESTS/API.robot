*** Settings ***
Documentation  Test Suite: Testing API with valid and invalid data
Resource  ../RESOURCES/API_Common.robot
Suite Setup  log to console  Started testing
Suite Teardown  log to console  Finished testing
*** Test Cases ***

GET Receive personall data about exact user - success
    Receive data exact user

GET Receive the token - success
     Receive Token Success

GET Receive the token - failure
     Receive Token Failure

GET Receive all registered users username - valid token
     Receive users Success

GET Receive all registered usernames - invalid token
    Receive users Failure





