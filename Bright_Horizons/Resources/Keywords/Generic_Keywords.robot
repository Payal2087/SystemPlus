*** Settings ***
Library           SeleniumLibrary
Resource          ../Variable/Find_Center_Objects.robot
Library           ../Other_Resources/Webdriversync.py

*** Keywords ***
Launch Application
    [Arguments]    ${URL}    ${Browser}
    [Documentation]    *Keyword Description*:Keyword is used to Launch portal application
    Select Browser    ${Browser}    ${URL}
    ${Bool}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Find_Center}    timeout=10s    error=Page is not visible after 10 seconds
    Run Keyword If    '${Bool}'== 'True'    log    ${\n}Application Login Successfully
    ...    ELSE    log    ${\n}Application Login Failed
    ${Bool}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div/button[text()='Accept All']
    IF    ${Bool}==True
    Click Button    //div/button[text()='Accept All']
    END

Select Browser
    [Arguments]    ${browser_option}    ${URL}
    [Documentation]    *Keyword Description*:Keyword can be used to select browser at execution time
    IF    '${browser_option}'=='Firefox'
    Launch Firefox Browser    ${URL}
    ELSE IF    '${browser_option}'=='Chrome'
    Launch Chrome Browser    ${URL}
    ELSE
    Log To Console    Browser not mentioned
    END

Launch Firefox Browser
    [Arguments]    ${URL}
    [Documentation]    *Keyword Description*:Keyword can be used to open Firefox browser
    ${gekodriver_path}=    Get Gekodriver Path
    Create Webdriver    Firefox    executable_path=${gekodriver_path}
    Go To    ${URL}

Launch Chrome Browser
    [Arguments]    ${URL}
    ${chromedriver_path}=    Get Chromedriver Path
    Create Webdriver    Chrome    executable_path=${chromedriver_path}
    Go To    ${URL}
    Maximize Browser Window
