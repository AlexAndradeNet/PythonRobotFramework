*** Settings ***
Documentation    Blog Blankfactor
Library    SeleniumLibrary
Resource   ../../Resources/home/home_po.resource
Resource    ../../Resources/home/home_kw.resource
Variables  ../../Common/common.py
            
*** Test Cases ***
Validate open Browser
    Start home
    Expected result
    Sleep    2s
    Close Browser 

Validate subscription
    Start home
    Subscription newsletter
    Sleep    2s
    Close Browser

Validate printout list of fintech posts
    Search List Fintech
    Close Browser