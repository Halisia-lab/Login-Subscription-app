*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Inscription
    Inscription    prenom  nom    email@gmail.com     monAdresse  ville  75000   0123456788  username  password1234
Connexion
    Connexion   username  password1234
Inscription with Error
    Connexion with Error    prenom  nom    email@gmail.com     monAdresse  ville  75000   0123456789  useruser  passwo

*** Keywords ***
Inscription
    [Arguments]    ${prenom}    ${nom}       ${mail}     ${adresse}  ${ville}    ${codePostale}  ${numero}   ${nomUtilisateur}      ${password}
    Open Browser  http://localhost:3000/signup  chrome
    Wait Until Page Contains    Connexion
    Input Text    firstName    ${prenom}
    Input Text    lastName    ${nom}
    Input Text    email    ${mail}
    Input Text    adress    ${adresse}
    Input Text    city    ${ville}
    Input Text    postIndex    ${codePostale}
    Input Text    phoneNumber    ${numero}
    Input Text    username    ${nomUtilisateur}
    Input Password     password   ${password}
    Click Button    Inscription
    Wait Until Page Contains    accueil
    Close Browser

Connexion
    [Arguments]    ${nomUtilisateur}      ${password}
    Open Browser  http://localhost:3000/login  chrome
    Wait Until Page Contains    Inscription
    Input Text    username    ${nomUtilisateur}
    Input Password     password   ${password}
    Click Button    Connexion

    Wait Until Page Contains    accueil
    Close Browser

Inscription with Error
    [Arguments]    ${prenom}    ${nom}       ${mail}     ${adresse}  ${ville}    ${codePostale}  ${numero}   ${nomUtilisateur}      ${password}
    Open Browser  http://localhost:3000/signup  chrome
    Wait Until Page Contains    Inscription
    Input Text    firstName    ${prenom}
    Input Text    lastName    ${nom}
    Input Text    email    ${mail}
    Input Text    adress    ${adresse}
    Input Text    city    ${ville}
    Input Text    postIndex    ${codePostale}
    Input Text    phoneNumber    ${numero}
    Input Text    username    ${nomUtilisateur}
    Input Password     password   ${password}
    Click Button    Inscription

    Wait Until Page Contains    Veuillez saisir un mots de passe valide : minimum huit caractères, au moins une lettre et un chiffre
    Close Browser
