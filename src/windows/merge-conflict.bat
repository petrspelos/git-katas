@echo off

SETLOCAL
CALL :checkExistingFolderAndDelete MergeConflictRepo
CALL :create_git_repository MergeConflictRepo
CD MergeConflictRepo
CALL :set_git_user Alice alice@example.com
CALL :make_initial_commit
CALL :make_bob_commit_feature
CALL :make_alice_commit_feature
git merge alice-feature-1
cls
@echo on
@echo =================================================
@echo YOUR REPOSITORY WAS GENERATED
@echo The "MergeConflictRepo" folder was created.
@echo =================================================
@echo Please go into the repository and try to:
@echo - Merge branch "bob-feature-1" into "master"
@echo This will result in a merge conflict.
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

:make_initial_commit
ECHO # Merge Conflict Repository >> README.md
git add .
git commit -m "Initial Commit"
EXIT /B 0

:make_bob_commit_feature
CALL :set_git_user Bob bob@example.com
git checkout -b bob-feature-1
echo function SayHello()>index.js
echo {>>index.js
echo     console.log("Helllo")>>index.js
echo }>>index.js
git add .
git commit -m "Feature 1 by Bob"
git checkout master
EXIT /B 0

:make_alice_commit_feature
CALL :set_git_user Alice alice@example.com
git checkout -b alice-feature-1
echo function sayHello() {>index.js
echo     console.log("Hello");>>index.js
echo }>>index.js
git add .
git commit -m "Feature 1 by Alice"
git checkout master
EXIT /B 0
