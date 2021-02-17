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
${RE_ENTER_PASSWORD_TEXT_BOX}    //*[@id="ap_password_check"]
${CREATE_AMAZON_ACCOUNT_BUTTON}    //*[@id="continue"]
${ENTER_OTP_TEXT_BOX}    //input[@name="code"]

*** Test Cases ***
Navigate and Login to the site using Chrome
    [Tags]    SMOKE
    Navigate to the site using Chrome
    Go to login page
    Fill in login Credentials and submit
    Close current browser

Navigate and Login to the site using Firefox
    [Tags]    SMOKE
    Navigate to the site using Firefox
    Go to login page
    Fill in login Credentials and submit
    Close current browser

Navigate and Login to the site using Safari
    [Tags]    SMOKE
    Navigate to the site using Safari
    Go to login page
    Fill in login Credentials and submit
    Close current browser


*** Keywords ***
Navigate to the site using Chrome
    Open Browser    ${URL}    ${BROWSER_C}

Navigate to the site using Firefox
    Open Browser    ${URL}    ${BROWSER_F}}

Navigate to the site using Safari
    Open Browser    ${URL}    ${BROWSER_S}

Go to login page
    Mouse Over    ${HELLO_SIGN_IN_BUTTON}
    Wait Until Element Is Visible    ${START_HERE_BUTTON}
    Click Element    ${START_HERE_BUTTON}
    Click Element    ${SECOND_SIGN_IN_BUTTON}

Fill in login Credentials and submit
    Input Text    ${EMAIL_TEXT_BOX}    see3dee@gmail.com
    Click Element    ${CONTINUE_BUT}
    Input Text       ${PASSWORD_TEXT_BOX}   0n1yR0ckandR011!
    Click Element    ${SUBMIT_BUT}

Fill in create account form
    Click Element    ${YOUR_NAME_TEXT_BOX}
    Clear Element Text    ${YOUR_NAME_TEXT_BOX}
    Input Text    ${YOUR_NAME_TEXT_BOX}    Donald
    Click Element    ${EMAIL_TEXT_BOX}
    Clear Element Text    ${EMAIL_TEXT_BOX}
    Input Text    ${EMAIL_TEXT_BOX}    testingrobot@gmail.com
    Click Element    ${PASSWORD_TEXT_BOX}
    Clear Element Text    ${PASSWORD_TEXT_BOX}
    Input Password    ${PASSWORD_TEXT_BOX}    abcxyz@123
    Click Element    ${RE_ENTER_PASSWORD_TEXT_BOX}
    Clear Element Text    ${RE_ENTER_PASSWORD_TEXT_BOX}
    Input Password    ${RE_ENTER_PASSWORD_TEXT_BOX}    abcxyz@123
    Click Element    ${CREATE_AMAZON_ACCOUNT_BUTTON}

Verify navigated to otp page
    Element Should Be Visible    ${ENTER_OTP_TEXT_BOX}

Close current browser
    Close Browser