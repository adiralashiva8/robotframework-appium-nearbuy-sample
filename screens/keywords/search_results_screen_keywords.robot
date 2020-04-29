*** Settings ***
Resource    ${EXECDIR}${/}screens${/}locators${/}search_results_screen_locators.robot

*** Keywords ***
Search Results Record Should Be Displayed
    Wait Until Page Contains Element    ${SEARCH_RESULTS_SCREEN_LOCATORS.result_record}