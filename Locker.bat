cls
@ECHO OFF
title Folder Locker
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST MySecretFolder goto MDMySecretFolder
:CONFIRM
echo Are you sure you want to lock the folder? (Y/N)
set /p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==N goto END
if %cho%==n goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren MySecretFolder "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked.
goto End
:UNLOCK
echo Enter the password to unlock folder:
set /p "pass=>"
if NOT %pass%==Dadi@656 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" MySecretFolder
echo Folder unlocked successfully.
goto End
:FAIL
echo Invalid password.
goto End
:MDMySecretFolder
md MySecretFolder
echo MySecretFolder created successfully.
goto End
:End
