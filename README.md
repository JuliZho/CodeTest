## Flasky app and Test automation


### Needed Instalations:

* install Python 3.9 and SQLite3
* pip3.9 install flask
* pip3.9 install robotframework-seleniumlibrary

### To run Flasky app follow the below
* connect to the internet
* go to /CodeTest/flasky
#### Execute commands 
* set FLASK_APP=demo_app
* env/Scripts/activate.bat
*  ./run.sh

### Automation folder contains

RESOURSES folder 
* UI_Common.robot    - keywords for UI testing. 
   
   Libraries: SeleniumLibrary, PrepareData.py, BuiltIn
   
 * API_Common.robot   - keywords for API testing.  
   
   Libraries: SeleniumLibrary, PrepareData.py, BuiltIn, API_Requests.py

* PrepareData.py  - extracting test data from xlsx file. 

   Libraries: faker, openpyxl

* API_Requests.py  - request functions for API testing

  Libraries: openpyxl, requests, jsonpath, json, PrepareData

 * TestData.xlsx   - file with test data
   
RESULTS folder

* API   - API test results
* UI    - UI  test results

TEST_DATA_SCRIPTS
   
 * GenerateData.py  - generate test data.
 
 Libraries: faker, openpyxl
   
ROBOT_TESTS  folder

   * Login_Registration_Test_Suite_Firefox.robot  - robot test cases for UI.
   * API.robot - API tests.
   
## Test Case Execution

To execute the Login_Registration_Test_Suite_Firefox.robot file follow the below steps
 * go to /CodeTest/Automation

Execute command
* robot -d RESULTS\UI .\ROBOT_TESTS\Login_Registration_Test_Suite_Firefox.robot

To run the API.robot stay in the same folder and execute
* robot -d RESULTS\API .\ROBOT_TESTS\API.robot


Test Results
* API tests:  /Automation/RESULTS/API
* UI tests:  /Automation/RESULTS/UI

 
 







   
