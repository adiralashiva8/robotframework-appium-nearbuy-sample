*** Settings ***
Documentation     Collection of search page test cases
Library           AppiumLibrary
Library           ${EXECDIR}${/}lib${/}appium_helper.py
Suite Setup       Start Appium Server
Suite Teardown    Stop Appium Server

*** Test Cases ***
Validate Search Functionality In Search Screen
    No Operation

Validate Infinite Scroll In Search Screen
    No Operation

Validate Back Button Functionality In Search Screen
    No Operation

Validate View Details Of Search Record
    No Operation

Validate Add To Favourites Of Search Record
    No Operation

Validate Sort Search Record Using 'Near Me' Option
    No Operation

Validate Refresh By Dragging Down In Search Result Screen
    No Operation