@echo off
if not exist "run.bat" (
(
echo.@echo off
echo.call cmd /c start /min ²ÊºçÊý×ÖÓê.bat^&exit
)>run.bat
start run.bat&exit
) else (
del /f /q run.bat
)
:loop
if not exist "NumberRain.bat" (
(
echo.@echo off^&Setlocal Enabledelayedexpansion
echo.mode con cols=1920 lines=1080
echo.:loop
echo.:rand
echo.set /a rNum=%%random%%%%%%2
echo.set str=!str!!rNum!
echo.set /a randNum+=1
echo.if not "!randNum!"=="168" ^(goto :rand^)
echo.set randNum=<nul
echo.echo.!str!
echo.set str=<nul
echo.for %%%%i in ^(0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f^) do ^(
echo. for %%%%j in ^(0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f^) do ^(
echo. color %%%%i%%%%j
echo. ^)
echo.^)
echo.goto :loop
)>NumberRain.bat
)
call cmd /c start /wait /max NumberRain.bat&cls
set /a closeNum+=1
if %closeNum%==5 (del /f /q NumberRain.bat) else (goto :loop)
exit