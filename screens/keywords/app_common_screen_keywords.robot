*** Settings ***
Resource    ${EXECDIR}${/}screens${/}locators${/}app_common_screen_locators.robot
Resource    ${EXECDIR}${/}common${/}common_keywords.robot

*** Keywords ***
Wait Until Loading Indicator Disappear
    [Arguments]    ${retry}=3x    ${retry_interval}=350ms
    Wait Until Keyword Succeeds    ${retry}    ${retry_interval}
    ...    Wait Until Page Does Not Contain Element    ${APP_COMMON_SCREEN_LOCATORS.loading_indicator_icon}

Widget Textview Should Be Present
    [Arguments]    ${text}
    ${locator}=    Replace Placeholder    ${APP_COMMON_SCREEN_LOCATORS.common_widget_text}    TEXT    ${text}
    Wait Until Page Contains Element    ${locator}

Widget Textview Should Not Be Present
    [Arguments]    ${text}
    ${locator}=    Replace Placeholder    ${APP_COMMON_SCREEN_LOCATORS.common_widget_text}    TEXT    ${text}
    Wait Until Page Does Not Contain Element    ${locator}

List Of Text Widget Should Be Present
    [Arguments]    @{text}
    :FOR   ${text}    IN    @{text}
        \    Run Keyword And Continue On Failure
             ...    Widget Textview Should Be Present    ${text}

List Of Text Widget Should Not Be Present
    [Arguments]    @{text}
    :FOR   ${text}    IN    @{text}
        \    Run Keyword And Continue On Failure
             ...    Widget Textview Should Not Be Present    ${text}

Get Image Widget By Index
    [Arguments]    ${index}
    ${locator}=    Replace Placeholder    ${APP_COMMON_SCREEN_LOCATORS.common_widget_image}    INDEX    ${index}
    [Return]    ${locator}

Click On Text Widget
    [Arguments]    ${text}
    ${locator}=    Replace Placeholder    ${APP_COMMON_SCREEN_LOCATORS.common_widget_text}    TEXT    ${text}
    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}

Click Back Arrow Icon
    Wait Until Page Contains Element    ${APP_COMMON_SCREEN_LOCATORS.back_arrow_icon}
    Click Element    ${APP_COMMON_SCREEN_LOCATORS.back_arrow_icon}