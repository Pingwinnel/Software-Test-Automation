*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    BuiltIn
Library    String

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${CREDENTIALS_FILE}  ../user_credentials.txt

*** Test Cases ***
User Can Log In
    Open Browser    ${URL}    ${BROWSER}

    # Read saved credentials
    ${CREDENTIALS}  Get File  ${CREDENTIALS_FILE}
    @{LINES}  Split String  ${CREDENTIALS}  \n
    ${USERNAME}  Set Variable  ${LINES}[0]
    ${PASSWORD}  Set Variable  ${LINES}[1]

    Wait Until Element Is Visible    xpath=//a[contains(text(),'Log in')]    timeout=5s
    Click Element    xpath=//a[contains(text(),'Log in')]
    Wait Until Element Is Visible    id=loginusername    timeout=5s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[contains(text(),'Log in')]

    Wait Until Page Contains    Welcome ${USERNAME}
    Close Browser
