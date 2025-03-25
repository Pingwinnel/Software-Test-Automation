*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome

*** Test Cases ***
User Can Log Out
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Log out')]    timeout=5s
    Click Element    xpath=//a[contains(text(),'Log out')]
    Sleep    2s
    Close Browser
