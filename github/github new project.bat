:: ryd skærmen
@echo off

echo #_____________1. New git project________
echo #
echo #    Create a new folder
echo #
echo #    New Folder Name     - Windows Folder Name
echo #
echo #___________________________________
echo .



set /p UserDir="New Folder Name ":
MD %UserDir%
cd %UserDir%

:: clear screen
cls

@echo off

echo #_____________2. New git project________
echo #
echo #    Press: SPACE bar
echo #    This open link in Chrome and create repository
echo #
echo #    https://github.com/new
echo #
echo #___________________________________
echo .
echo Note: Must Install Desktop App from https://desktop.github.com/
echo .

pause

start chrome "https://github.com/new"

cls

@echo off

echo #_____________3. New git project________
echo #
echo #    Insert Github link here
echo #    
echo #    Example:
echo #    https://github.com/martinandersen3d/my-framework.git
echo #    
echo #___________________________________
echo .

set /p githubLink="Insert Gihub link here: ":

echo "# readme" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin %githubLink%
git push -u origin master

:Menu
@ECHO OFF
CLS
ECHO 1.Install Vue+Node and edit port config
ECHO 2.Vue Run Dev
ECHO 3.Install Node
ECHO 4.Go to commandprompt
ECHO 5.Open directory in VS Code
ECHO 6.Add All, Commit and push
ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 6 GOTO gitHubAddAllPush
IF ERRORLEVEL 5 GOTO VsCode
IF ERRORLEVEL 4 GOTO OpenCmd
IF ERRORLEVEL 3 GOTO VueRunDev
IF ERRORLEVEL 2 GOTO InstallNode
IF ERRORLEVEL 1 GOTO Vue

:: in reverser order for some reason
:: the CALL command is explained here https://stackoverflow.com/questions/19264972/prevent-abort-in-windows-batch-for-npm-install
:Vue
call vue init webpack
call npm install
git add .
git commit -a -m "Fresh new Vue App"
git push
call code .
call code config/index.js
call explorer .
GOTO Menu

:InstallNode
npm install
GOTO Menu

:VueRunDev
call npm run dev
GOTO Menu

:OpenCmd
cmd
GOTO Menu

:VsCode
:: open explore and vs code
call explorer .
call code .
GOTO Menu

:gitHubAddAllPush
:: open explore and vs code
call explorer .
call code .
GOTO Menu

:End




