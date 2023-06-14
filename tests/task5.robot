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
${R_50}     //span[@class="ic-icon ic-R_50"]
${contract_dropdown}    //div[@data-testid="dt_contract_dropdown"]
${multiplier_btn}    //a[@href="/markets/forex/?tab=multipliers#multipliers"]
${stake_txt}    //span[text()="Stake"]
${payout_txt}    //span[text()="Payout"]
${stake_input}    //input[@id="dt_amount_input"]
${disabled_trade_btn}    //div[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
${enabled_trade_btn}    //button[@class="btn-purchase btn-purchase--1 btn-purchase--multiplier"]
${multiplier_input}    //div[@data-testid="dt_dropdown_container"]
${x20}    //div[@id="20"]
${x40}    //div[@id="40"]
${x60}    //div[@id="60"]
${x100}    //div[@id="100"]
${x200}    //div[@id="200"]
${take_profit}    //input[@name="has_take_profit"]
${stop_loss}    //input[@name="has_stop_loss"]
${cancellation}    //input[@name="has_cancellation"]
${take_profit_btn}    //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${take_profit_value_0}    //input[@id="dc_take_profit_input" and @value="0"]
${take_profit_value_1}    //input[@id="dc_take_profit_input" and @value="1"]
${take_profit_add}    //button[@id="dc_take_profit_input_add"]
${take_profit_sub}    //button[@id="dc_take_profit_input_sub"]
${deal_cancellation_btn}    //span[@class="dc-text dc-checkbox__label"]
${deal_cancellation_input}    //div[@class="dc-dropdown__display dc-dropdown__display--clicked dc-dropdown__display--no-border"]
${cancellation_5}    //div[@id="5m"]
${cancellation_10}    //div[@id="10m"]
${cancellation_15}    //div[@id="15m"]
${cancellation_30}    //div[@id="30m"]
${cancellation_60}    //div[@id="60m"]

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

Check Multiplier Contract Parameter
    Wait Until Page Contains Element    ${cq_btn}      10
    Wait Until Element Is Visible    ${cq_btn}    10
    Click Element    ${cq_btn}
    Wait Until Page Contains Element    ${R_50}    10
    Click Element    ${R_50}
    Sleep    10
    Wait Until Page Contains Element   ${contract_dropdown}    10
    Click Element    ${contract_dropdown}
    Sleep    10
    Wait Until Page Contains Element    ${multiplier_btn}        10
    Click Element    ${multiplier_btn}
    Wait Until Page Contains Element    ${stake_txt}    10
    Wait Until Page Does Not Contain Element    ${payout_txt}    10
    Click Element    ${stake_input}
    Press Keys    ${stake_input}    CTRL+A+BACKSPACE
    Input Text    ${stake_input}    2000
    Wait Until Page Contains Element    ${enabled_trade_btn}    10
    Press Keys    ${stake_input}    CTRL+A+BACKSPACE
    Input Text    ${stake_input}    2001
    Wait Until Page Contains Element    ${disabled_trade_btn}    10
    Press Keys    ${stake_input}    CTRL+A+BACKSPACE
    Input Text    ${stake_input}    0.9
    Wait Until Page Contains Element    ${disabled_trade_btn}    10
    Press Keys    ${stake_input}    CTRL+A+BACKSPACE
    Input Text    ${stake_input}    1
    Wait Until Page Contains Element    ${enabled_trade_btn}    10
    Wait Until Page Contains Element    ${multiplier_input}    10
    Wait Until Element Is Visible    ${multiplier_input}    10
    Click Element    ${multiplier_input}
    Wait Until Page Contains Element    ${x20}    10
    Wait Until Page Contains Element    ${x40}    10
    Wait Until Page Contains Element    ${x60}    10
    Wait Until Page Contains Element    ${x100}    10
    Wait Until Page Contains Element    ${x200}    10
    Wait Until Page Contains Element    ${take_profit}    10
    Wait Until Page Contains Element    ${stop_loss}    10
    Wait Until Page Contains Element    ${cancellation}    10
    Wait Until Page Contains Element    ${take_profit_btn}    10
    Wait Until Element Is Visible   ${take_profit_btn}    10
    Click Element    ${take_profit_btn}
    Wait Until Page Contains Element    ${take_profit_add}    10
    Click Element    ${take_profit_add}
    Wait Until Element Is Visible   ${take_profit_value_1}    10
    Wait Until Page Contains Element    ${take_profit_sub}    10
    Click Element    ${take_profit_sub}
    Wait Until Element Is Visible   ${take_profit_value_0}    10
    Wait Until Page Contains Element    ${deal_cancellation_btn}    10
    Click Element    ${deal_cancellation_btn}
    Wait Until Page Contains Element    ${deal_cancellation_input}    10
    Click Element    ${deal_cancellation_input}
    Wait Until Page Contains Element    ${cancellation_5}    10
    Wait Until Page Contains Element    ${cancellation_10}    10
    Wait Until Page Contains Element    ${cancellation_15}    10
    Wait Until Page Contains Element    ${cancellation_30}    10
    Wait Until Page Contains Element    ${cancellation_60}    10