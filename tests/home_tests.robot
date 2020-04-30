*** Settings ***
Documentation     Collection of home page test cases
Library           AppiumLibrary
Library           ${EXECDIR}${/}libs${/}appium_helper.py
Resource          ${EXECDIR}${/}impl${/}home_tests_impl.robot
Suite Setup       Common Suite Setup
Suite Teardown    Common Suite Teardown
Force Tags        home

*** Test Cases ***
Validate Available Standard Icons In Home Screen
    Standard Icons Should Be Present In Home Screen

Validate Available Quick Search Icons In Home Screen
    Quick Search Icons Should Be Present In Home Screen

Validate Available Menu Fields In Home Screen
    Home Screen: Click On Menu Icon
    Menu Fields Should Be Present

Validate Search Functionality In Home Screen
    [Setup]    Re-Launch Application
    Home Screen: Click On Quick Search Icon
    Search Screen: Search For Salon
    Salon Search Results Should Be Displayed
    [Teardown]    Quit Application

Validate Notifications In Home Screen
    [Setup]    Re-Launch Application
    Home Screen: Click On Notification Icon
    Notification Should Be Displayed
    [Teardown]    Quit Application

Validate Scroll Down In Home Screen
    [Setup]    Re-Launch Application
    Perform Scroll Down In Home Screen
    More Icon Should Be Present
    Quick Search Icons Should Not Be Present In Home Screen
    Standard Icons Should Be Present In Home Screen
    [Teardown]    Quit Application

Validate Scroll Up In Home Screen
    [Setup]    Re-Launch Application
    Perform Scroll Down In Home Screen
    Perform Scroll Up In Home Screen
    More Icon Should Not Be Present
    Quick Search Icons Should Be Present In Home Screen
    Standard Icons Should Be Present In Home Screen
    [Teardown]    Quit Application

Validate Nearbuy Blog Link
    [Setup]    Re-Launch Application
    Click On Nearbuy Blog Link
    Nearbuy Blog Should Be Loaded In Browser
    Web: Click On Menu In Blog
    Go Back To App Home Screen
    Standard Icons Should Be Present In Home Screen
    [Teardown]    Quit Application