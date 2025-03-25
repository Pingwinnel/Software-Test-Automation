*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${USERNAME}     testuser123
${PASSWORD}     testpassword

*** Test Cases ***
User Can Sign Up
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Sign up')]    timeout=5s
    Click Element    xpath=//a[contains(text(),'Sign up')]
    Wait Until Element Is Visible    id=sign-username    timeout=5s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[contains(text(),'Sign up')]
    Sleep    2s
    Close Browser
