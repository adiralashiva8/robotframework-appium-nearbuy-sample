*** Settings ***
Resource    ${EXECDIR}${/}screens${/}locators${/}home_screen_locators.robot

*** Keywords ***
More Icon Should Be Present
    Wait Until Page Contains Element    ${HOME_SCREEN_LOCATORS.more_icon}
    Text Widget Should Be Present    More

More Icon Should Not Be Present
    Wait Until Page Does Not Contain Element    ${HOME_SCREEN_LOCATORS.more_icon}
    Text Widget Should Not Be Present    More

Home Screen: Click On Quick Search Icon
    Wait Until Page Contains Element    ${HOME_SCREEN_LOCATORS.search_icon}
    Click Element    ${HOME_SCREEN_LOCATORS.search_icon}

Home Screen: Click On Notification Icon
    Wait Until Page Contains Element    ${HOME_SCREEN_LOCATORS.notification_icon}
    Click Element    ${HOME_SCREEN_LOCATORS.notification_icon}

Notification Should Be Displayed
    Wait Until Page Contains    notifications
    Go Back
    Wait Until Loading Indicator Disappear

Home Screen: Click On Menu Icon
    Wait Until Page Contains Element    ${HOME_SCREEN_LOCATORS.menu_icon}
    Click Element    ${HOME_SCREEN_LOCATORS.menu_icon}