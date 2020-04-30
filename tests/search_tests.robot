*** Settings ***
Documentation     Collection of search page test cases
Library           AppiumLibrary
Library           ${EXECDIR}${/}libs${/}appium_helper.py
Resource          ${EXECDIR}${/}impl${/}search_tests_impl.robot
Suite Setup       Common Suite Setup
Suite Teardown    Common Suite Teardown
Force Tags        search

*** Test Cases ***
Validate Search & Back Button Functionality In Search Screen
    Search Screen: Search For Ratnadeep
    Ratnadeep Search Results Should Be Displayed
    Click Left Icon
    Search Screen: Click Close Icon
    Home Icon Should Be Present In Screen
    [Teardown]    Quit Application

Validate Scroll Down In Search Results Screen
    No Operation

Validate Scroll Up In Search Results Screen
    No Operation

Validate View Details Of Search Record
    [Setup]    Re-Launch Application
    Search Screen: Search For Barbeque Nation
    Barbeque Nation Search Results Should Be Displayed
    Click On View Details Button
    Details Page Should Be Loaded
    [Teardown]    Quit Application

Validate Add To Favourites Of Search Record
    [Setup]    Re-Launch Application
    Search Screen: Search For Barbeque Nation
    Barbeque Nation Search Results Should Be Displayed
    Click On Add To Favourite
    Sign In To Favorite An Offer Screen Should Be Loaded
    [Teardown]    Quit Application

Validate Sort Search Record Using 'Rating' Option
    [Setup]    Re-Launch Application
    Search Screen: Search For Barbeque Nation
    Barbeque Nation Search Results Should Be Displayed
    Select Sort By Option    Rating
    Wait Until Loading Indicator Disappear
    Barbeque Nation Search Results Should Be Displayed
    [Teardown]    Quit Application

Validate Refresh By Dragging Down In Search Result Screen
    No Operation