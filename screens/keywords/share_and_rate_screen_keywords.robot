*** Settings ***
Resource    ${EXECDIR}${/}screens${/}locators${/}search_screen_locators.robot

*** Keywords ***
Share & Rate Screen Should Be Loaded
    Widget Textview Should Be Present    Share & rate

Click On Nearbuy Blog
    Click On Text Widget    nearbuy blog