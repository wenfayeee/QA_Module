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
${AUD_USD}    //span[@class="ic-frx ic-frxAUDUSD"]
${contract_dropdown}    //div[@data-testid="dt_contract_dropdown"]
${high_low_btn}    //div[@id="dt_contract_high_low_item"]
${days_input}    //input[@class="dc-input__field"]
${2_days}    //span[@data-duration="2 Days"]
${payout_btn}    //button[@id="dc_payout_toggle_item"]
${payout_input}    //input[@id="dt_amount_input"]
${contract_lower}    //button[@id="dt_purchase_put_button"]
${barrier_btn}    //input[@id="dt_barrier_1_input"]
${barrier_error}    //span[text()="Contracts more than 24 hours in duration would need an absolute barrier."]

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

Check Relative Barrier Error
    Wait Until Page Contains Element    ${cq_btn}    10
    Wait Until Element Is Visible    ${cq_btn}    10
    Click Element    ${cq_btn}
    Wait Until Page Contains Element    ${AUD_USD}    10
    Wait Until Element Is Visible    ${AUD_USD}    10
    Click Element    ${AUD_USD}
    Wait Until Page Contains Element    ${contract_dropdown}    10
    Wait Until Element Is Visible    ${contract_dropdown}    10
    Click Element    ${contract_dropdown}
    Wait Until Page Contains Element    ${high_low_btn}    10
    Wait Until Element Is Visible    ${high_low_btn}    10
    Click Element    ${high_low_btn}
    Wait Until Page Contains Element    ${days_input}    10
    Click Element    ${days_input}
    Wait Until Page Contains Element    ${2_days}    10
    Click Element    ${2_days}
    Wait Until Page Contains Element    ${barrier_btn}    10
    Click Element    ${barrier_btn}
    Press Keys    ${barrier_btn}    CTRL+A+BACKSPACE
    Input Text    ${barrier_btn}    -0.5
    Wait Until Page Contains Element    ${payout_btn}    10
    Click Element    ${payout_btn}
    Wait Until Page Contains Element    ${payout_input}    10
    Wait Until Page Contains Element    ${barrier_error}    10
    Sleep    10   