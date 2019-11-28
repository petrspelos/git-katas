@echo off

SETLOCAL
CALL :checkExistingFolderAndDelete SquashCommitsRepo
CALL :create_git_repository SquashCommitsRepo
CD SquashCommitsRepo
CALL :set_git_user Nicol nicol@example.com
CALL :make_initial_commits
CALL :set_git_user Sally sally@example.com
CALL :setup_branches
CALL :setup_situation
cls
@echo on
@echo =================================================
@echo YOUR REPOSITORY WAS GENERATED
@echo The "SquashCommitsRepo" folder was created.
@echo =================================================
@echo The situation:
@echo In branch "feature-1" there are redundant commits
@echo Squash commits "Add hello world" and "Refactor hello world"
@echo into one and remove the "Add index.html" and "Remove index.html" commits.
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
ECHO In branch "feature-1" there are redundant commits>> README.md
ECHO Squash commits "Add hello world" and "Refactor hello world">> README.md
ECHO into one and remove the "Add index.html" and "Remove index.html" commits.>> README.md
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

echo function sayHello() {>index.js
echo     console.log("Hello");>>index.js
echo }>>index.js
git add .
git commit -m "Add hello world"

echo TODO: add html>index.html
git add .
git commit -m "Add index.html"

echo function sayHello() { console.log("Hello, world!"); }>index.js
git add .
git commit -m "Refactor hello world"

del index.html
git add .
git commit -m "Remove index.html"

EXIT /B 0
