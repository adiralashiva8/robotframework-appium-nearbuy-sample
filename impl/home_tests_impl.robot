*** Settings ***
Resource    ${EXECDIR}${/}common${/}app_common_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}home_screen_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}search_screen_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}search_results_screen_keywords.robot
Resource    ${EXECDIR}${/}screens${/}keywords${/}share_and_rate_screen_keywords.robot

*** Keywords ***
Standard Icons Should Be Present In Home Screen
    List Of Text Widget Should Be Present
    ...    Home    Search    Pulse    Purchases

Standard Icons Should Not Be Present In Home Screen
    List Of Text Widget Should Not Be Present
    ...    Home    Search    Pulse    Purchases

Quick Search Icons Should Be Present In Home Screen
    List Of Text Widget Should Be Present
    ...    Maha Cash Voucher    Pulse    Restaurants
    ...    Salon    Spa    Gift cards    Activities    Home & Auto

Perform Scroll Down In Home Screen
    Scroll    ${APP_COMMON_SCREEN_LOCATORS.first_image}    ${APP_COMMON_SCREEN_LOCATORS.image_banner}

Quick Search Icons Should Not Be Present In Home Screen
    List Of Text Widget Should Not Be Present
    ...    Spa    Gift cards    Activities    Home & Auto

Perform Scroll Up In Home Screen
    Scroll    ${APP_COMMON_SCREEN_LOCATORS.image_banner}    ${APP_COMMON_SCREEN_LOCATORS.first_image}

Search Screen: Search For Salon
    Input Text Into Search Textbox    Salon
    #Press Keycode    66
    Click On Text Widget    Search

Salon Search Results Should Be Displayed
    Wait Until Loading Indicator Disappear
    Search Results Record Should Be Displayed
    Wait Until Page Contains    Salon

Start New Home Activity
    Start Activity    ${NEARBUY_APP_PACKAGE}    ${NEARBUY_APP_ACTIVITY}

Menu Fields Should Be Present
    List Of Text Widget Should Be Present    Sign in
    ...    Refer a friend    Promocodes    Notifications
    ...    Share & rate    Help

Remember Nearbuy Context
    ${context}=    Get Current Context
    Set Test Variable    ${NEARBUY_CONTEXT}    ${context}

Click On Share & Rate
    Click On Text Widget    Share & rate

Click On Nearbuy Blog Link
    Home Screen: Click On Menu Icon
    Click On Share & Rate
    Share & Rate Screen Should Be Loaded
    Remember Nearbuy Context
    Click On Nearbuy Blog

Nearbuy Blog Should Be Loaded In Browser
    Sleep   4s
    # switch to web
    @{contexts}=    Get Contexts
    Switch To Context    @{contexts}[-1]
    Capture Page Screenshot
    Run Keyword And Continue On Failure
    ...    Wait Until Page Contains Element    xpath=//button[text()='Menu']

Web: Click On Menu In Blog
    Run Keyword And Continue On Failure
    ...    Click Element    xpath=//button[text()='Menu']
    Sleep   2s
    Capture Page Screenshot

Go Back To App Home Screen
    Switch To Context    ${NEARBUY_CONTEXT}
    Capture Page Screenshot
    Click Back Arrow Icon