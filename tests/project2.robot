*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    RequestsLibrary
Library    XML

*** Keywords ***
Login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    email
    Input Password    password    pwd
    Click Element    //button[@name="login"]

Select First 3 Reasons For Leaving
    Sleep    5
    Wait Until Page Contains Element    //input[@name="financial-priorities"]//following-sibling::span[@class="dc-text dc-checkbox__label"]    10
    Click Element    //input[@name="financial-priorities"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="stop-trading"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="not-interested"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element     //input[@name="financial-priorities"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element     //input[@name="stop-trading"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="not-interested"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    
Select Second 3 Reasons For Leaving
    Click Element    //input[@name="another-website"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element     //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="another-website"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element     //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    
Select Last 3 Reasons For Leaving
    Click Element    //input[@name="lack-of-features"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="unsatisfactory-service"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="other-reasons"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

User Did Not Select Any Reason
    Click Element    //input[@name="lack-of-features"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="lack-of-features"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Max 110 Characters Input
    Click Element    ${input_field_1}
    Input Text    other_trading_platforms    ${110_char}

55 Characters Input
    Click Element    ${input_field_2}
    Input Text    do_to_improve    ${55_char}

*** Variables ***
${account_settings}    //a[@href="/account/personal-details"]
${close_account_option}    //a[@href="/account/closing-account"]
${policy}    //a[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
${close_my_account_btn}    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${input_field_1}    //textarea[@name="other_trading_platforms"]//parent::div[@class="dc-input__container"]
${input_field_2}    //textarea[@name="do_to_improve"]//parent::div[@class="dc-input__container"]
${110_char}    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.incididunt ut labore et dolore.
${55_char}    Lorem ipsum dolor sit amet, consectetur adipiscing elit
${char_hint}    //p[text()="Remaining characters: 0"]
${continue_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${close_account_btn}    //span[text()="Close account"]//parent::button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]

*** Test Cases ***
Close Account Without Reason Selection
    Login
    Sleep    5
    Wait Until Page Contains Element    ${account_settings}    10
    Click Element    ${account_settings}
    Wait Until Page Contains Element    ${close_account_option}    5
    Click Element    ${close_account_option}
    Sleep    5
    Wait Until Page Contains Element    //*[@class="closing-account__information"]    5
    Reload Page
    Click Element    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]    
    Wait Until Page Contains Element    //p[@class="dc-text closing-account-reasons__title"]
    User Did Not Select Any Reason
    Wait Until Page Contains Element    //p[@class="dc-text closing-account-reasons__error"]    5
    Element Should Be Disabled    ${continue_btn}

More Than 110 Characters In Input Field
    Wait Until Page Contains Element    ${account_settings}    5
    Click Element    ${account_settings}
    Wait Until Page Contains Element    ${close_account_option}    5
    Click Element    ${close_account_option}
    Sleep    5
    Wait Until Page Contains Element    //*[@class="closing-account__information"]    5
    Reload Page
    Click Element      ${close_my_account_btn}  
    Wait Until Page Contains Element    //p[@class="dc-text closing-account-reasons__title"]
    Select Second 3 Reasons For Leaving
    Max 110 Characters Input
    Wait Until Page Contains Element    ${char_hint}    10
    55 Characters Input
    Wait Until Page Does Not Contain    ${char_hint}    10

Security And Privacy Policy
    Wait Until Page Contains Element    ${account_settings}    5
    Click Element    ${account_settings}
    Wait Until Page Contains Element    ${close_account_option}    5
    Click Element    ${close_account_option}
    Sleep    5
    Wait Until Page Contains Element    ${policy}    5
    Click Element    ${policy}
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    Switch Window    ${handles}[0]       

Successful Close Account
    Wait Until Page Contains Element    ${account_settings}    5
    Click Element    ${account_settings}
    Wait Until Page Contains Element    ${close_account_option}    5
    Click Element    ${close_account_option}
    Sleep    5
    Wait Until Page Contains Element    //*[@class="closing-account__information"]    5
    Reload Page
    Click Element      ${close_my_account_btn}  
    Wait Until Page Contains Element    //p[@class="dc-text closing-account-reasons__title"]    5
    Select First 3 Reasons For Leaving
    Select Second 3 Reasons For Leaving
    Select Last 3 Reasons For Leaving
    Click Element    ${continue_btn}
    Wait Until Page Contains Element    //div[@class="account-closure-warning-modal"]    5
    Click Element    ${close_account_btn}
    Wait Until Page Contains Element    //div[@class="language-switcher-module--trigger--5677a"]    15



    