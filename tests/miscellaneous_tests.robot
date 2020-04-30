*** Settings ***
Documentation     Collection of Miscellaneous test cases
Library           AppiumLibrary
Library           ${EXECDIR}${/}libs${/}appium_helper.py
Resource          ${EXECDIR}${/}impl${/}miscellaneous_tests_impl.robot
Suite Setup       Common Suite Setup
Suite Teardown    Common Suite Teardown
Test Setup        Re-Launch Application
Test Teardown     Quit Application
Force Tags        miscellaneous

*** Test Cases ***
Validate Application In Landscape Mode
    Turn Device To Landscape Mode
    Home Icon Should Be Present In Screen
    Turn Device To Portrait Mode
    Home Icon Should Be Present In Screen

Validate Application Status When No Internet Connection
    Turn Off Internet
    Click On Home Standard Icon
    Application Should Be In Offline
    [Teardown]    Connect Back To Internet

Validate Application Behaviour When Background App
    Click On Home Standard Icon
    Background App For 10 Seconds
    Click On Home Standard Icon
    Home Icon Should Be Present In Screen