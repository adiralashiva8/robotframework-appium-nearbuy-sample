*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}${/}test_data${/}test_data.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}app_common_screen_keywords.robot
Resource    ${EXECDIR}${/}common${/}app_common_keywords.robot

*** Keywords ***
Launch Nearbuy Application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${NEARBUY_APP}
    ...    appPackage=${NEARBUY_APP_PACKAGE}
    ...    appActivity=${NEARBUY_APP_ACTIVITY}
    ...    noReset=${True}
    ...    appWaitPackage=${NEARBUY_APP_ACTIVITY}
    ...    appWaitDuration=${APP_WAIT_TIME_OUT}
    ...    chromedriverExecutable=${EXECDIR}${/}test_data${/}drivers${/}chromedriver.exe

    Set Appium Timeout    ${ELEMENT_TIME_OUT}
    Wait Until Loading Indicator Disappear

Common Suite Setup
    Start Appium Server
    Launch Nearbuy Application

Common Suite Teardown
    Close Application
    Stop Appium Server

Re-Launch Application
    Launch Application
    Wait Until Loading Indicator Disappear