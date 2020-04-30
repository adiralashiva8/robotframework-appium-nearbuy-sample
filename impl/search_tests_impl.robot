*** Settings ***
Resource    ${EXECDIR}${/}common${/}app_common_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}home_screen_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}search_screen_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}search_results_screen_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}share_and_rate_screen_keywords.robot

*** Keywords ***
Click On Search Standard Icon
    Click On Text Widget    Search

Search Screen: Search For Ratnadeep
    Search Screen: Perform Search    Ratnadeep

Search Screen: Perform Search
    [Arguments]    ${value}
    Click On Search Standard Icon
    Input Text Into Search Textbox    ${value}
    #Press Keycode    66
    Click On Text Widget    Search

Search Results Should Be Loaded
    [Arguments]    ${value}
    Wait Until Loading Indicator Disappear
    Search Results Record Should Be Displayed
    Wait Until Page Contains    ${value}

Ratnadeep Search Results Should Be Displayed
    Search Results Should Be Loaded    Ratnadeep

Home Icon Should Be Present In Screen
    Text Widget Should Be Present    Home

Search Screen: Search For Barbeque Nation
    Search Screen: Perform Search    Barbeque Nation

Barbeque Nation Search Results Should Be Displayed
    Search Results Should Be Loaded    Barbeque

Click On View Details Button
    Click On Text Widget    VIEW

Details Page Should Be Loaded
    Text Widget Should Be Present    About this place

Click On Add To Favourite
    Click On Text Widget    Add to favourites

Sign In To Favorite An Offer Screen Should Be Loaded
    Text Widget Should Be Present    Sign in to favorite an offer

Select Sort By Option
    [Arguments]    ${value}
    Click On Text Widget    SORT
    Click On Text Widget    ${value}