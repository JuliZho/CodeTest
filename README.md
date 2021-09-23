## Flasky app and Test automation


### Installation Instructions


To run the demo application you need:

* install Python 3.9 and SQLite3
* pip3.9 install flask
* pip3.9 install robotframework-seleniumlibrary

## Run the Flasky app  ##
connect to the internet
go to Flasky folder

## Execute commands ##
set FLASK_APP=demo_app
env/Scripts/activate.bat
run run.sh file 


## Automation folder contains ##

RESOURSES folder 
   common.robot    - keywords. Libraries: SeleniumLibrary, PrepareData.py, BuiltIn
   PrepareData.py  - extracting test data from xlsx file. Libraries: faker, openpyxl
   TestData.xlsx   - file with test data
   
RESULTS
  log.html

TEST_DATA_SCRIPTS
   GenerateData.py  - generate test data. Libraries: faker, openpyxl
   
TESTS   
   Login_Registration_Test_Suite_Firefox.robot  - robot test cases for UI.
   

##To execute the  test file go to TEST directory and run##
    robot -d RESULTS .\TESTS\Login_Registration_Test_Suite_Firefox.robot






   
