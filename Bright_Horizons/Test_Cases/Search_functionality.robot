*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/Keywords/Generic_Keywords.robot
Resource          ../Resources/Variable/Search_Page_Object.robot
Library           OperatingSystem
Resource          ../Resources/Variable/Generic_Objects.robot

*** Test Cases ***
Verify search functionality
    Launch Application    ${URL}    ${Browser}
    Maximize Browser Window
    Search_Page_Validation    Employee Education in 2018: Strategies to Watch
    [Teardown]    Close All Browsers

*** Keywords ***
Search_Page_Validation
    [Arguments]    ${Search_Text}
    #Click on the search/loop icon (top, right corner)
    Wait Until Page Contains Element    ${Search}    timeout=10s    error=search button is not visible in 20s
    Click Element    ${Search}
    sleep    2s
    #Verify if the search field is visible on the page
    Wait Until Page Contains Element    ${Search_Field}    timeout=10s    error=search filed is not available
    Element Should Be Visible    ${Search_Field}    msg=search filed is not available
    # Type into the search field
    Input Text    ${Search_Field}    ${Search_Text}
    #Click the search button
    Click Button    ${Search_Button}
    #Wait for the search results to appear
    Wait Until Page Contains Element    ${Search_Result}
    # Verify if the search result matches the search term
    ${Search_result}=    Get Text    (//h3[@class='title'])[1]
    Should Be Equal    ${Search_result}    ${Search_Text}    msg=search result is not matches with the search text entered
