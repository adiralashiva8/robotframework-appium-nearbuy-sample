*** Settings ***
Library    AppiumLibrary
Resource    ${EXECDIR}${/}common${/}app_common_keywords.robot

*** Test Cases ***
Validate Search Functionality In Nearbuy Web
    Launch Neaurbuy In Chrome
    Wait Until Logo Is Displayed
    Capture Page Screenshot
    [Teardown]    Quit Application


*** Keywords ***
Launch Neaurbuy In Chrome
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${CHROME_APP_PACKAGE}
    ...    appActivity=${CHROME_APP_ACTIVITY}
    ...    noReset=${True}
    ...    appWaitPackage=${CHROME_APP_ACTIVITY}
    ...    appWaitDuration=${APP_WAIT_TIME_OUT}
    ...    chromedriverExecutable=${EXECDIR}${/}test_data${/}drivers${/}chromedriver.exe

    Set Appium Timeout    ${ELEMENT_TIME_OUT}
    Go To Url    https://www.nearbuy.com/

Wait Until Logo Is Displayed
    Wait Until Keyword Succeeds    5x    350ms
    ...    Wait Until Page Contains Element    xpath=//img[contains(@src,'nearbuy')]