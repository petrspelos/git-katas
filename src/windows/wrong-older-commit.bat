@echo off

SETLOCAL
CALL :checkExistingFolderAndDelete WrongOlderCommitRepo
CALL :create_git_repository WrongOlderCommitRepo
CD WrongOlderCommitRepo
CALL :set_git_user Nicol nicol@example.com
CALL :make_initial_commits
CALL :set_git_user Sally sally@example.com
CALL :setup_branches
CALL :setup_situation
cls
@echo on
@echo =================================================
@echo YOUR REPOSITORY WAS GENERATED
@echo The "WrongOlderCommitRepo" folder was created.
@echo =================================================
@echo The situation:
@echo One of the older commits on branch "feature-1" called
@echo "Update LICENSE" is supposed to be in the "feature-2" branch
@echo Move the "Wrong Commit" into the "feature-2" branch
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
ECHO One of the older commits on branch "feature-1" called>> README.md
ECHO "Update LICENSE" is supposed to be in the "feature-2" branch>> README.md
ECHO Move the "Wrong Commit" into the "feature-2" branch>> README.md
git add .
git commit -m "Initial Commit"
ECHO A sample license file >> LICENSE
git add .
git commit -m "Add LICENSE"
EXIT /B 0

:setup_branches
git checkout -b feature-1
git checkout master
git checkout -b feature-2
git checkout master
EXIT /B 0

:setup_situation
git checkout feature-1

echo function sayHello() {>index.js
echo     console.log("Hello");>>index.js
echo }>>index.js
git add .
git commit -m "Add index"

echo function sayHello() {>index.js
echo     console.log("Hello, world!");>>index.js
echo }>>index.js
git add .
git commit -m "Extend greeting"

echo OUR OFFICIAL LICENSE>LICENSE
echo We the company hereby state:>>LICENSE
echo Please do not sue us.>>LICENSE
git add .
git commit -m "Update LICENSE"

echo const greeting = "Hello, world!";>index.js
echo function sayHello() {>>index.js
echo     console.log(greeting);>>index.js
echo }>>index.js
git add .
git commit -m "Refactor greeting"

git checkout feature-2

echo Please read our License file>>README.md
git add .
git commit -m "Reference license in README"

git checkout feature-1
EXIT /B 0
