*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/Keywords/Generic_Keywords.robot
Resource          ../Resources/Variable/Find_Center_Objects.robot
Library           OperatingSystem
Library           String
Resource          ../Resources/Variable/Generic_Objects.robot

*** Test Cases ***
Bright Horizons New York Center Search
    [Documentation]    Automate Bright Horizons New York Center Search
    Launch Application    ${URL}    ${Browser}
    Maximize Browser Window
    Find_Center    New York
    [Teardown]    Close All Browsers

*** Keywords ***
Find_Center
    [Arguments]    ${Search_Center}
    #Click on Find a Center option
    Wait Until Page Contains Element    ${Find_Center}    timeout=10s
    Click Element    ${Find_Center}
    #Verify URL Contains '/child-care-locator'
    ${current_url}=    Get Location
    Should Contain    ${current_url}    ${Locator_URL}    error=URL doesnot contain '/child-care-locator'
    #Search for ${Search_Center} and press Enter
    Input Text    ${Location_Search}    ${Search_Center}
    sleep    2s
    Press Keys    ${Location_Search}    ENTER
    #Verify number of centers matches the list
    Wait Until Page Contains Element    ${Center_List_Count}    timeout=10s    error=Center Count is not available
    ${centers_list}=    Get Element Count    ${Center_List_Count}
    ${centers_count}=    Get Text    ${Center_count}
    ${centers_count}=    Convert To Integer    ${centers_count}
    Should Be Equal    ${centers_list}    ${centers_count}    msg=Center Count is not maching with the dispalyed centers
    # Click on the first center and verify name and address
    ${first_center_name}=    Get Text    ${First_Center_Name}
    ${first_center_address}=    Get Text    ${First_Center_Address}
    sleep    2s
    Wait Until Page Contains Element    ${Result_List}
    Click Element    ${Result_List}
    Wait Until Page Contains Element    ${First_Center_Name_Popup}    timeout=20s    error=Pop up is not getting displyed for Center Information
    ${popup_center_name}=    Get Text    ${First_Center_Name_Popup}
    ${popup_center_address}=    Get Text    ${First_Center_Address_Popup}
    ${popup_center_address}=    Replace String    ${popup_center_address}    \n    ${SPACE}
    Should Be Equal    ${first_center_name}    ${popup_center_name}    msg=First center name is not getting match with First Center name on displayed pop up
    Should Be Equal    ${first_center_address}    ${popup_center_address}    msg=First center address is not getting match with First Center address on displayed pop up
