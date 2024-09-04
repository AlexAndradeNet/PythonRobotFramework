*** Settings *** 
Documentation
Library    SeleniumLibrary
Library    ../../venv/lib/python3.10/site-packages/robot/libraries/OperatingSystem.py
Library    ../../venv/lib/python3.10/site-packages/robot/libraries/Collections.py
Resource   ./home_po.resource
Variables  ../../Common/common.py
Variables  ../../Common/home_confirmation.py

*** Keywords ***
Start home
    Open Browser    ${url_bfactor}    ${chrome}
    Maximize Browser Window    
    Click Element    ${BTN_ACCEPT_COOKIES}
    Scroll Element Into View    ${BTN_INSIGHTS}
    Click Element    ${BTN_INSIGHTS}
    Scroll Element Into View    ${BTN_BLOG}
    Click Element    ${BTN_BLOG}
    Scroll Element Into View    ${LINK_POST}
    Click Element    ${LINK_POST}

 Expected result
     Scroll Element Into View    ${TXT_CONFIRMATION}
     Element Text Should Be    ${TXT_CONFIRMATION}    ${expected_link_post}

    
 Subscription newsletter
     Input Text    ${INPUT_MAIL}      ${email}
     Click Element    ${BTN_SUBSCRIBE}
     Wait Until Element Is Visible    ${TXT_CONFIRMATION_SUBSCRIBE}
     Element Text Should Be    ${TXT_CONFIRMATION_SUBSCRIBE}    ${expected_txt_subscribe}


 Validate printout list of fintech posts
    Go Back
    Click Element   ${BTN_SEARCH}
    Input Text     ${INPUT_SEARCH}   ${txt_search}
    Sleep    3s
    

Fintech list
    #@{elements}    Get WebElement    ${FINTECH_ELEMENT}
    ${titles_elements}=    Create List    ${FINTECH_1}     ${FINTECH_2}    ${FINTECH_3}    ${FINTECH_4}    ${FINTECH_5}    ${FINTECH_6}    ${FINTECH_7}    ${FINTECH_8}    ${FINTECH_9}    ${FINTECH_10}
    ${titles_fintech}    Create List         
    FOR    ${element}    IN    ${titles_elements}
            ${fintech}    Get Text    ${element} 
            Append To List    ${titles_fintech}    ${fintech}
    END        
    Log List    ${titles_fintech}
    
Search List Fintech
   Open Browser    ${url_bfactor}    ${chrome}
    Maximize Browser Window    
    Click Element    ${BTN_ACCEPT_COOKIES}
    Scroll Element Into View    ${BTN_INSIGHTS}
    Click Element    ${BTN_INSIGHTS}
    Scroll Element Into View    ${BTN_BLOG}
    Click Element    ${BTN_BLOG}
    Scroll Element Into View    ${LINK_POST}
    Click Element    ${LINK_POST}
    Go Back
    Click Element   ${BTN_SEARCH}
    Input Text     ${INPUT_SEARCH}   ${txt_search}
    Sleep    3s
    @{result_list_fintech}    Get WebElements    ${FINTECH_ELEMENT}
    FOR    ${element}    IN    @{result_list_fintech}
            ${titles_fintech}=    Get Text    ${element}
            Sleep    2s
            Log To Console    ${titles_fintech}
    END