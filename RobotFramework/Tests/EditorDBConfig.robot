*** Settings ***
Documentation     Testes automatizados Delphi com a library do Zoomba 
Library           Zoomba.DesktopLibrary
Suite Setup       Start EditorDeDBConf
Test Setup        Launch Application
Test Teardown     Quit Application



*** Variables ***

${REMOTE_URL}             http://127.0.0.1:4723
${APP}                    C:\\Users\\juliana.dias\\Desktop\\GDBCONFIG\\EditorDeDBConf.exe
@{DBCONFIG}              DBCONFIG - CURITIBA.INI  


*** Test Cases ***
Caso de Teste 01: Realizando troca de DB com tipo de elemento Nome    

    Dado que estou no programa EditorDeDBConf
    E clico no seletor do "DBCONFIG"
    E seleciono o @{DBCONFIG}
    Quando clico no botão "Substituir Conf Atual"
    #Então visualizo o @{DBCONFIG} no quadro DBCONFIG.INI

#Caso de Teste 02: Realizando troca de DB com tipo de elemento AutomationId    

    #Dado que estou no programa EditorDeDBConf
    #E clico no seletor do "DBCONFIG"
    #E seleciono o @{DBCONFIG}
    #Quando clico no botão "Substituir Conf Atual"
    #Então visualizo o @{DBCONFIG} no quadro DBCONFIG.INI

*** Keywords ***
Start EditorDeDBConf
    [Documentation]     Sets up the application for quick launching through 'Launch Application' and starts the winappdriver
    Driver Setup
    Open Application    ${REMOTE_URL}  plataformName=Windows    deviceName=Windows     app=${APP}  
    Quit Application

#Keywords com elementos do tipo Name
Dado que estou no programa EditorDeDBConf
    Element Should Contain Text            name=DBConfig.ini    DBConfig.ini
E clico no seletor do "DBCONFIG"        
    Click Element                          name=Abrir
E seleciono o @{DBCONFIG}
    Select Element From ComboBox           name=DBCONFIG - CURITIBA.INI
Quando clico no botão "Substituir Conf Atual"
    Click Element                          name=Substituir Conf Atual

#Então visualizo o @{DBCONFIG} no quadro DBCONFIG.INI
    #Element Should Contain Text                          


#Keywords com elementos do tipo AutomationId

