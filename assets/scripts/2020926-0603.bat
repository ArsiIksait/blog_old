@echo off
if not exist "test" (md test)
cd test
:add
set /p text=ÇëÊäÈëÊý×Ö:
if "%text%"=="END" (set n=0&goto show)
set /a n+=1
set Templist=%n%
echo.%text%>list_%n%.txt
goto add
:show
set /a n+=1
set /p read=<list_%n%.txt
echo.%read%
if "%n%"=="%Templist%" (goto end)
goto show
:end
echo ½áÊø
pause