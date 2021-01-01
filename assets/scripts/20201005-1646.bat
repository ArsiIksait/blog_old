@echo off&Setlocal Enabledelayedexpansion
if "%1"=="" (echo.你没有拖入文件&pause&exit /b)
certutil -encode "%1" "%~nx1.bas"
echo.@echo off>%~nx1.bat
echo.cd.^>%~nx1.bas>>%~nx1.bat
echo.^(>>%~nx1.bat
for /f "delims=" %%i in (%~nx1.bas) do (
echo.echo.%%i>>%~nx1.bat
set /a Line+=1
if !Line!==5000 (echo.^)^>^>%~nx1.bas>>%~nx1.bat&echo.^(>>%~nx1.bat&set Line=0)
)
echo.)^>^>%~nx1.bas>>%~nx1.bat
echo.certutil -decode %~nx1.bas %~nx1>>%~nx1.bat
echo.del /q %~nx1.bas>>%~nx1.bat
echo.del /f /q %%0>>%~nx1.bat
del /q %~nx1.bas
pause
exit /b