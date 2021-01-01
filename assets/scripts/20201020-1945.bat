@echo off&Setlocal Enabledelayedexpansion&color 0A
set Delete_original_file=false
set Delete_space=true
set Chain=false
if "%~x1"==".hex" (goto :decodehex) else (goto :encodehex)
:encodehex
certutil -encodehex "%1" "%~nx1.hex.temp"
for /f "tokens=1,2* usebackq delims=	" %%i in ("%~nx1.hex.temp") do (
set str=%%j
set str=!str:~0,48!
if "%Delete_space%"=="true" (set str=!str: =!)
if "%Chain%"=="true" (if "!oldstr!"=="" (set oldstr=!str!) else (set oldstr=!oldstr!!str!))
if not "%Chain%"=="true" (echo.!str!&echo.!str!>>%~nx1.hex)
)
if "%Chain%"=="true" (echo.%oldstr%&echo.%oldstr%>%~nx1.hex)
del /q %~nx1.hex.temp
if "%Delete_original_file%"=="true" (del /q %~nx1)
echo.文件到16进制转换完成
pause&exit /b
:decodehex
set name=%~nx1
set name=%name:.hex=%
certutil -decodehex "%1" "%name%"
if "%Delete_original_file%"=="true" (del /q %~nx1)
echo.16进制到文件转换完成
pause&exit /b