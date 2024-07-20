@echo off
rem Open five websites
start chrome "https://www.youtube.com/"
start chrome "https://www.canva.com/"
start chrome "https://www.britannica.com/"
start chrome "https://www.grammarly.com/"
start chrome "https://www.reddit.com/?rdt=48305"

rem Launch caclulator and notepad
start calc.exe
start notepad.exe

rem Initiate system shutdown after a brief delay
timeout /t 10
shutdown /s /f /t 0
