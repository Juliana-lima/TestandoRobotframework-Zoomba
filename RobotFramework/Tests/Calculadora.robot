*** Settings ***
Documentation     Testes automatizados Delphi com a library do Zoomba 
Library           Zoomba.DesktopLibrary
Suite Setup       Start Calculadora
Test Setup        Launch Application
Test Teardown     Quit Application



*** Variables ***

${REMOTE_URL}             http://127.0.0.1:4723
${APP}                    Microsoft.WindowsCalculator_8wekyb3d8bbwe!App
 

*** Test Cases ***
Caso de Teste 01: Realizando soma com tipo de elemento Nome    

    Dado que estou no programa Calculadora exibindo 0
    E clico no número 5
    E clico no soma
    E clico no número 2
    Quando clico no botão igual
    Então visualizo o reultado 7

Caso de Teste 02: Realizando soma com tipo de elemento AutomationId    

    Dado que estou no programa Calculadora exibindo 0
    E clico no número 3
    E clico no multiplicação
    E clico no número 6
    Quando clico no botão de igual
    Então visualizo o reultado 18

*** Keywords ***
Start Calculadora
    [Documentation]     Sets up the application for quick launching through 'Launch Application' and starts the winappdriver
    Driver Setup
    Open Application    ${REMOTE_URL}  plataformName=Windows    deviceName=Windows     app=${APP}  
    Quit Application

Dado que estou no programa Calculadora exibindo 0
    Element Should Contain Text            name=A exibição é 0    0
E clico no número 5        
    Click Element                          name=Cinco
E clico no soma
    Click Element                          name=Mais
E clico no número 2
    Click Element                          name=Dois
Quando clico no botão igual
    Click Element                          name=Igual a
Então visualizo o reultado 7
    Element Should Contain Text            name=A exibição é 7    7

#Keywords com elementos do tipo AutomationId
E clico no número 3
    Click Element                          xpath=//Button[@Name="Três"]
E clico no multiplicação
    Click Element                          accessibility_id=multiplyButton
E clico no número 6                        
    Click Element                          accessibility_id=num6Button        
Quando clico no botão de igual
    Click Element                          accessibility_id=equalButton
Então visualizo o reultado 18
    Element Should Contain Text            accessibility_id=CalculatorResults    18

