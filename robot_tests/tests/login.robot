*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${USERNAME}     testuser123
${PASSWORD}     testpassword

*** Test Cases ***
*** Test Cases ***
User Can Log In
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Log in')]    timeout=5s
    Click Element    xpath=//a[contains(text(),'Log in')]
    Wait Until Element Is Visible    id=loginusername    timeout=5s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[contains(text(),'Log in')]
    Sleep    3s
    Close Browser
