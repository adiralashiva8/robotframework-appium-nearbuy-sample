*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}${/}test_data${/}test_data.robot

*** Keywords ***
Launch Nearbuy Application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${NEARBUY_APP}
    ...    appPackage=${NEARBUY_APP_PACKAGE}
    ...    appActivity=${NEARBUY_APP_ACTIVITY}