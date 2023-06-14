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

Buy Lower Contract
    Wait Until Page Contains Element    ${cq_btn}    10
    Wait Until Element Is Visible    ${cq_btn}    10
    Click Element    ${cq_btn}
    Wait Until Page Contains Element    //*[@class="sc-mcd__filter__item "][1]    5
    Click Element    //*[@class="sc-mcd__filter__item "][2]
    Sleep    10
    Wait Until Element Is Visible    //*[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]    5
    Click Element    //*[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
    Sleep    10
    Wait Until Page Contains Element   //*[@id="dt_contract_dropdown"]    5
    Click Element    //*[@id="dt_contract_dropdown"]
    Sleep    10
    Wait Until Page Contains Element    //*[@id="dt_contract_high_low_item"]    5
    Click Element    //*[@id="dt_contract_high_low_item"]
    Sleep    10
    Wait Until Page Contains Element    //input[@value="3"]    10
    Click Element    //input[@value="3"]
    Sleep    10
    Wait Until Page Contains Element    //*[@id="dc_stake_toggle_item"]    5
    Click Element    //*[@id="dc_stake_toggle_item"]
    Sleep    10
    Wait Until Element Is Visible    //input[@value="15.50"]    10
    Click Element    //input[@value="15.50"]
    Sleep    10
    Wait Until Element Is Visible    //*[@id="dt_purchase_put_button"]    5
    Click Element    //*[@id="dt_purchase_put_button"]