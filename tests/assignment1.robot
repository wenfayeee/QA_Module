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
    Input Text    txtEmail    munnfaye+3@besquare.com.my
    Input Password    password    @Bcd1234
    Click Element    //button[@name="login"]

Select Read Option Only
    Click Element    //input[@name="read"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Select Trade Option Only
    Click Element    //input[@name="trade"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Select Payments Option Only
    Click Element    //input[@name="payments"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Select Trading Information Option Only
    Click Element    //input[@name="trading_information"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Select Admin Option Only
    Click Element    //input[@name="admin"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Select 2 Options
    Click Element    //input[@name="read"]//following-sibling::span[@class="dc-text dc-checkbox__label"]
    Click Element    //input[@name="trade"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Unselect Payments Option
    Click Element    //input[@name="payments"]//following-sibling::span[@class="dc-text dc-checkbox__label"]

Create Token
    Input Text    token_name    ${token}
    Click Element     ${create_btn}

*** Variables ***
${account_settings}    //a[@href="/account/personal-details"]
${api_generator}    //a[@id="dc_api-token_link"]
${special_char}    !@#$%^&*
${token}    test
${40_char}    Loremipsumdolorsitametconsecteturadipisc
${1_char}    a
${name_error}    //div[text()="Please enter a token name."]
${min_char_error}    //div[text()="Length of token name must be between 2 and 32 characters."]
${max_char_error}    //div[text()="Maximum 32 characters."]
${create_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]

*** Test Cases ***
Create Read Token
    Login
    Sleep    5
    Wait Until Page Contains Element    ${account_settings}    5
    Click Element    ${account_settings}
    Sleep    5
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]    5
    Select Read Option Only
    Create Token

Create Trade Token
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]    5
    Select Trade Option Only
    Create Token

Create Payments Token
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]    5
    Select Payments Option Only
    Create Token

Create Trading Information Token
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]    5
    Select Trading Information Option Only
    Create Token

Create Admin Token
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]   5
    Select Admin Option Only
    Create Token

Name Token With Special Characters
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]   5
    Select Payments Option Only
    Sleep    5
    Input Text    token_name    ${special_char}
    Click Element    ${create_btn}
    Element Should Be Disabled    ${create_btn}
    Press Keys    token_name    CTRL+A+BACKSPACE  
    Unselect Payments Option   

Token Without Name
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]   5
    Select Payments Option Only
    Sleep    5
    Input Text    token_name    ${token}
    Press Keys    token_name    CTRL+A+BACKSPACE
    Wait Until Page Contains Element    ${name_error}    5
    Click Element    ${create_btn}
    Element Should Be Disabled    ${create_btn}
    Unselect Payments Option

Token Name With More Than 32 Characters
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]   5
    Select Payments Option Only
    Sleep    5
    Input Text    token_name    ${40_char}
    Wait Until Page Contains Element    ${max_char_error}     5
    Click Element    ${create_btn}
    Element Should Be Disabled    ${create_btn}
    Unselect Payments Option
    Press Keys    token_name    CTRL+A+BACKSPACE

Token Name With 1 Character
    Wait Until Page Contains Element    ${api_generator}    5
    Click Element    ${api_generator}
    Sleep    5
    Wait Until Page Contains Element    //h4[text()="API token"]   5
    Select Payments Option Only
    Sleep    5
    Input Text    token_name    ${1_char}
    Wait Until Page Contains Element    ${min_char_error}     5
    Click Element    ${create_btn}
    Element Should Be Disabled    ${create_btn}