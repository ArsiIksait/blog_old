@echo off
:input
set /p input=请输入要计算的物理量:
if "%input%"=="I" (goto I)
if "%input%"=="U" (goto U)
if "%input%"=="R" (goto R)
echo.输入错误,只支持I U R(电流 电压 电阻)
goto input
:I
set /p V=请输入电压(V):
set /p Ω=请输入电阻(Ω):
set /a A=%V%/%Ω%
echo.电流I=%A%A
set V=<nul&set Ω=<nul&set A=<nul
pause
cls
goto input
:U
set /p A=请输入电流(I):
set /p Ω=请输入电阻(Ω):
set /a V=%A%*%Ω%
echo.电压U=%V%V
set V=<nul&set Ω=<nul&set A=<nul
pause
cls
goto input
:R
set /p V=请输入电压(U):
set /p A=请输入电流(I):
set /a Ω=%V%/%A%
echo.电阻R=%Ω%Ω
set V=<nul&set Ω=<nul&set A=<nul
pause
cls
goto input