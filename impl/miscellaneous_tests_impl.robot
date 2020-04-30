*** Settings ***
Library     ${EXECDIR}${/}libs${/}cmd_helper.py
Resource    ${EXECDIR}${/}common${/}app_common_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}home_screen_keywords.robot

*** Keywords ***
Turn Device To Landscape Mode
    ${status}=    Run Keyword And Return Status    Landscape
    Run Keyword If    ${status}    Run Keywords
    ...    Capture Page Screenshot
    ...    AND    Fail    Application allows landscape Mode

Turn Device To Portrait Mode
    Portrait
    Sleep   1s
    Capture Page Screenshot

Turn Off Internet
    Execute Command    adb shell svc wifi disable
    Execute Command    adb shell svc data disable
    # wait for few seconds to reflect changes
    Sleep   5s

Connect Back To Internet
    Execute Command    adb shell svc wifi enable
    Execute Command    adb shell svc data enable
    # wait for few seconds to reflect changes
    Sleep   5s

Click On Home Standard Icon
    Click On Text Widget    Home

Background App For 10 Seconds
    Background App    seconds=10

Home Icon Should Be Present In Screen
    Text Widget Should Be Present    Home

Application Should Be In Offline
    Text Widget Should Not Be Present    Home