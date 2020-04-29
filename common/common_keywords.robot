*** Settings ***
Library     AppiumLibrary
Library     String
Resource    ${EXECDIR}${/}test_data${/}test_data.robot

*** Keywords ***
Replace Placeholder
    [Arguments]    ${string}    ${replace_item}    ${replace_with}
    ${custom_text}=    Replace String    ${string}    __${replace_item}__    ${replace_with}
    [Return]    ${custom_text}

Replace Placeholders
    [Arguments]    ${string}    @{placeholder_list}
    ${list_size}=    Get Length    ${placeholder_list}
    :FOR    ${INDEX}    IN RANGE    0    ${list_size}    2
        \    ${value}=    Evaluate    ${INDEX} + ${1}
        \    ${string}=    Replace String    ${string}    __@{placeholder_list}[${INDEX}]__    @{placeholder_list}[${value}]
    [Return]    ${string}