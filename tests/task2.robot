*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    RequestsLibrary
Library    XML

*** Variables ***
${login_btn}   //button[@name="login"]
${dropdown_btn}    //span[@class="dc-text dc-dropdown__display-text"]
${demo_btn}    //div[@id="demo"]
${real_btn}    //div[@id="real"]
${reset_balance_btn}    //*[text()="Reset Balance"]//parent::button
${open_btn}    //a[@href="/"]
${cq_btn}    //div[@class="cq-symbol-select-btn"]
${volatility_101s}    //div[@class="sc-mcd__item sc-mcd__item--1HZ150V "]
${contract_dropdown}    //div[@data-testid="dt_contract_dropdown"]
${rise_fall_contract}    //span[@value="rise_fall"]
${5_ticks}    //input[@value="5"]
${10_stake}    //input[@value="10"]
${purchase_btn}    //button[@id="dt_purchase_call_button"]
${purchased_contract}    //a[@class="dc-result__caption-wrapper"]

*** Test Cases ***
Login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    email
    Input Password    password    pwd
    Click Element    ${login_btn}

Switch To Demo Account
    Wait Until Page Contains Element    ${dropdown_btn}    10
    Click Element    ${dropdown_btn}
    Wait Until Element Is Visible    ${demo_btn}    10
    Click Element    ${demo_btn}
    Wait Until Page Contains Element    ${reset_balance_btn}    10
    Wait Until Page Contains Element    ${open_btn}    10
    Click Element    ${open_btn}
    Sleep    10

Buy Rise Contract
    Wait Until Page Contains Element    ${cq_btn}    10
    Wait Until Element Is Visible    ${cq_btn}    10
    Click Element    ${cq_btn}
    Wait Until Page Contains Element    ${volatility_101s}    10
    Click Element    ${volatility_101s}
    Wait Until Page Contains Element   ${contract_dropdown}    10
    Click Element    ${contract_dropdown}
    Sleep    10
    Wait Until Page Contains Element   ${rise_fall_contract}    10
    Click Element    ${rise_fall_contract}
    Sleep    10
    Wait Until Page Contains Element    ${5_ticks}    10
    Wait Until Page Contains Element    ${10_stake}    10
    Wait Until Page Contains Element    ${purchase_btn}    10
    Wait Until Element Is Visible    ${purchase_btn}    10
    Click Element    ${purchase_btn}
    Sleep    10
    Wait Until Page Contains Element    ${purchased_contract}    10