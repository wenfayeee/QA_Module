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
${reset_btn}    //*[text()="Reset Balance"]//parent::button

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

Switch To Virtual Account
    Wait Until Page Contains Element     ${dropdown_btn}    10
    Click Element    ${dropdown_btn}
    Wait Until Page Contains Element    ${demo_btn}    10
    Wait Until Element Is Visible    ${demo_btn}    10
    Wait Until Page Contains Element    ${real_btn}    10
    Click Element    ${demo_btn}
    Wait Until Page Contains Element    ${reset_btn}    10
