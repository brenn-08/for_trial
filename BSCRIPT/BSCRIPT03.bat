@echo off
rem BSCRIPT03.bat: Windows Utility Selector

:main
cls
echo Choose a Windows utility:
echo 1: ipconfig
echo 2: tasklist/taskkill
echo 3: chkdsk
echo 4: format
echo 5: defrag
echo 6: find
echo 7: attrib

set /p choice="Enter the number corresponding to your choice: "

if "%choice%"=="1" (
    call :ipconfig
) else if "%choice%"=="2" (
    call :tasklist_taskkill
) else if "%choice%"=="3" (
    call :chkdsk
) else if "%choice%"=="4" (
    call :format
) else if "%choice%"=="5" (
    call :defrag
) else if "%choice%"=="6" (
    call :find
) else if "%choice%"=="7" (
    call :attrib
) else (
    echo Invalid choice. Please choose a number between 1 and 7.
    pause
    goto main
)

pause
goto end

:ipconfig
ipconfig
goto :eof

:tasklist_taskkill
echo Choose action:
echo 1: Display tasklist
echo 2: Kill a task by name

set /p action="Enter the number corresponding to your action: "

if "%action%"=="1" (
    tasklist
) else if "%action%"=="2" (
    set /p task_name="Enter the name of the task to kill: "
    taskkill /IM %task_name% /F
) else (
    echo Invalid action. Please choose 1 or 2.
)
goto :eof

:chkdsk
chkdsk
pause
goto :eof

:format
echo Warning: Formatting a drive will erase all data on it.
set /p drive_letter="Enter the drive letter to format (e.g., C:): "
format %drive_letter%
goto :eof

:defrag
echo Starting defragmentation...
defrag
pause
goto :eof

:find
set /p search_term="Enter the term to search for: "
find "%search_term%" *
goto :eof

:attrib
echo Choose action:
echo 1: Show attributes
echo 2: Set attributes

set /p action="Enter the number corresponding to your action: "

if "%action%"=="1" (
    attrib
) else if "%action%"=="2" (
    set /p attributes="Enter the attributes to set (+r, -h, etc.): "
    set /p files="Enter the file or files to set attributes for: "
    attrib %attributes% %files%
) else (
    echo Invalid action. Please choose 1 or 2.
)
goto :eof

:end
echo Task complete.
pause