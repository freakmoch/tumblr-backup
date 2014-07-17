@echo off
color f5
title bbolli tumblr backup
:start
echo Begin Tumblr backup using PYTHON
echo BBOLLI Forked tumblr_backup.py
echo Please refer to bbolli's GITHUB page for any extra commands
echo https://github.com/bbolli/tumblr-utils
echo BAT script by freakmoch
echo Latest Backup script used : Feb 23 14
echo. 
echo While this script is in use, posting is not recommended
echo What blog do you want to back up?

:na
set /p blogname=Enter The URL:%=%
SET /P ANSWER=Is %blogname% correct? (Y/N)
if /i {%ANSWER%}=={y} (goto :hella) 
if /i {%ANSWER%}=={yes} (goto :hella) 
goto :na

:hella
if not exist "c:\python27\python.exe" goto PY 
if not exist "tumblr_backup.py" goto PY2 
if not exist "xmltramp.py" goto PY3 

:shake
SET /P ANSWER=Any custom commands? (Y/N)
if /i {%ANSWER%}=={y} (goto :cmsd) 
if /i {%ANSWER%}=={yes} (goto :cmsd) 
goto :allgood

:allgood
cls
echo Starting backup of %blogname%....
echo This can take a while. Sit back, relax, and enjoy some snacks!
echo.
c:\python27\python.exe tumblr_backup.py %cms% %blogname%
echo.
echo Your tumblr has been backed up!
echo Please remember that you must manually save your theme and custom pages...
pause
exit


:cmsd
cls
c:\python27\python.exe tumblr_backup.py -h
echo 
set /p cms=Enter Your Commands:%=%
echo The commands you entered are %cms%
pause
goto allgood

:PY
echo.
echo is Python27 not installed?
pause
cls
goto start

:PY2
echo.
echo tumblr_backup.py is missing!
pause
cls
goto start


:PY3
echo.
echo xmltramp.py is missing!
pause
cls
goto start
