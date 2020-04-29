*** Settings ***
Resource    ${EXECDIR}${/}screens${/}locators${/}search_screen_locators.robot

*** Keywords ***
Input Text Into Search Textbox
    [Arguments]    ${value}
    Wait Until Page Contains Element    ${SEARCH_SCREEN_LOCATORS.search_text_box}
    Input Text    ${SEARCH_SCREEN_LOCATORS.search_text_box}    ${value}

Search Screen: Click Close Icon
    Wait Until Page Contains Element    ${SEARCH_SCREEN_LOCATORS.close_icon}
    Click Element    ${SEARCH_SCREEN_LOCATORS.close_icon}