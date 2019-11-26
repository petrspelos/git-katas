@echo off

SETLOCAL
CALL :create_git_repository WrongBranchRepo
CD WrongBranchRepo
CALL :set_git_user Shirline shirline@example.com
CALL :make_initial_commits
CALL :set_git_user Stacy stacy@example.com
CALL :setup_branches
CALL :make_wrong_commit
cls
@echo on
@echo =================================================
@echo YOUR REPOSITORY WAS GENERATED
@echo The "WrongBranchRepo" folder was created.
@echo =================================================
@echo The situation:
@echo You committed "Wrong Commit" into the "wrong-branch"
@echo Move the "Wrong Commit" into the "correct-branch"
@echo =================================================
@echo If you make a mistake, delete the whole folder
@echo and run this utility again. It will generate a
@echo new repository for you.
@echo =================================================
@pause
@EXIT /B %ERRORLEVEL%

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
git add .
git commit -m "Initial Commit"
ECHO A sample license file >> LICENSE
git add .
git commit -m "Add LICENSE"
EXIT /B 0

:setup_branches
CALL set_git_user Bob bob@example.com
git checkout -b correct-branch
git checkout master
git checkout -b wrong-branch
git checkout master
EXIT /B 0

:make_wrong_commit
git checkout wrong-branch
echo function sayHello() {>index.js
echo     console.log("Hello");>>index.js
echo }>>index.js
git add .
git commit -m "Wrong Commit"
EXIT /B 0
