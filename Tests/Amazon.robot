*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.amazon.com/
${BROWSER_C}      Chrome
${BROWSER_F}      Firefox
${BROWSER_S}      Safari
${HELLO_SIGN_IN_BUTTON}    //*[@id="nav-link-accountList"]
${START_HERE_BUTTON}    //*[@id="nav-flyout-ya-newCust"]/a
${SECOND_SIGN_IN_BUTTON}    //*[@id="ap_register_form"]/div/div/div[6]/a
${YOUR_NAME_TEXT_BOX}    //*[@id="ap_customer_name"]
${EMAIL_TEXT_BOX}    //*[@id="ap_email"]
${CONTINUE_BUT}    //*[@id="continue"]
${PASSWORD_TEXT_BOX}    //*[@id="ap_password"]
${SUBMIT_BUT}    //*[@id="signInSubmit"]

*** Test Cases ***
Navigate and Login to the site using Chrome
    [Tags]    Chrome
    Navigate to the site using Chrome
    Go to login page
    Fill in login Credentials and submit
    Close current browser

Navigate and Login to the site using Firefox
    [Tags]    Firefox
    Navigate to the site using Firefox
    Go to login page
    Fill in login Credentials and submit
    Close current browser

*** Keywords ***
Navigate to the site using Chrome
    Open Browser    ${URL}    ${BROWSER_C}

Navigate to the site using Firefox
    Open Browser    ${URL}    ${BROWSER_F}

Go to login page
    Mouse Over    ${HELLO_SIGN_IN_BUTTON}
    Wait Until Element Is Visible    ${START_HERE_BUTTON}
    Click Element    ${START_HERE_BUTTON}
    Click Element    ${SECOND_SIGN_IN_BUTTON}

Fill in login Credentials and submit
    Input Text    ${EMAIL_TEXT_BOX}    see3dee@gmail.com
    Click Element    ${CONTINUE_BUT}
    Input Text       ${PASSWORD_TEXT_BOX}   XXXXXXXXXXX
    Click Element    ${SUBMIT_BUT}


Close current browser
    Close Browser