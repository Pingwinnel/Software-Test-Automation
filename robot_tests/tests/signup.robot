*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    BuiltIn

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome
${CREDENTIALS_FILE}  ../user_credentials.txt

*** Test Cases ***
User Can Sign Up
    Open Browser    ${URL}    ${BROWSER}

    # Generate a unique username
    ${RANDOM}      Evaluate    random.randint(1000, 9999)    modules=random
    ${USERNAME}    Set Variable    tester_${RANDOM}
    ${PASSWORD}    Set Variable    tester123password

    Wait Until Element Is Visible    xpath=//a[contains(text(),'Sign up')]    timeout=5s
    Click Element    xpath=//a[contains(text(),'Sign up')]
    Wait Until Element Is Visible    id=sign-username    timeout=5s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[contains(text(),'Sign up')]

    # Handle Alert (Sign Up Successful message)
    Handle Alert    Accept

    # Save credentials to file
    Create File    ${CREDENTIALS_FILE}    ${USERNAME}\n${PASSWORD}

    Close Browser
