@echo off

SETLOCAL
CALL :checkExistingFolderAndDelete ChangedParentMergedRepo
CALL :create_git_repository ChangedParentMergedRepo
CD ChangedParentMergedRepo
CALL :set_git_user Lynda lynda@example.com
CALL :make_initial_commits
CALL :set_git_user Maddi maddi@example.com
CALL :setup_branches
CALL :setup_situation
cls
@echo on
@echo =================================================
@echo YOUR REPOSITORY WAS GENERATED
@echo The "ChangedParentMergedRepo" folder was created.
@echo =================================================
@echo The situation:
@echo A parent branch "feature-1" of your branch "feature-2"
@echo got merged and squashed into "master".
@echo Merge "feature-2" into "master".
@echo =================================================
@echo If you make a mistake, delete the whole folder
@echo and run this utility again. It will generate a
@echo new repository for you.
@echo =================================================
@pause
@EXIT /B %ERRORLEVEL%

:checkExistingFolderAndDelete
if exist %~1 rmdir /s /q %~1

:create_git_repository
mkdir %~1
cd %~1
git init
cd ..
EXIT /B 0

:set_git_user
git config user.name %~1
git config user.email %~2
EXIT /B 0

:make_initial_commits
ECHO # My playground repository >> README.md
ECHO ---------> README.md
ECHO The situation:> README.md
ECHO A parent branch "feature-1" of your branch "feature-2">> README.md
ECHO got merged and squashed into "master".>> README.md
ECHO Merge "feature-2" into "master".>> README.md
git add .
git commit -m "Initial Commit"
ECHO A sample license file >> LICENSE
git add .
git commit -m "Add LICENSE"
EXIT /B 0

:setup_branches
git checkout -b feature-1
git checkout master
EXIT /B 0

:setup_situation
git checkout feature-1

CALL :set_git_user Lynda lynda@example.com

echo function sayHello() {>index.js
echo     console.log("Hello");>>index.js
echo }>>index.js
git add .
git commit -m "Add hello world"

echo TODO: add html>index.html
git add .
git commit -m "Add index.html"

CALL :set_git_user Maddi maddi@example.com

git checkout -b feature-2

echo function sayHello() {>index.js
echo console.log("Hello, world!");>>index.js
echo alert("Hello, world!");>>index.js
echo }>>index.js
git add .
git commit -m "Add alert"

CALL :set_git_user Lynda lynda@example.com

git checkout feature-1

echo function greetWorld() { console.log("Hello, world!"); }>index.js
git add .
git commit -m "Refactor hello world function"

git checkout master
git merge --squash feature-1
git commit -m "Squash and merge feature 1"

CALL :set_git_user Maddi maddi@example.com

EXIT /B 0
