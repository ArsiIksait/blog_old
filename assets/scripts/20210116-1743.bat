@echo off&set ThemeCode=0a
color %ThemeCode%
:: ThemeCode 是用在color命令上的,有效范围是:00~ff
if "%~s1"=="" (echo:你未拖入文件!&pause&exit)
set P_Num=20
:: P_Num 是运行时的窗口数量(和多线程差不多,数值越大,转换得越快,但也不是越大越好)
set L_Num=5000
:: L_Num 是释放器释放时一次写入文件的行数,数值越大,文件生成的速度越快,可以设置到0~9000±1000(0是无限制[不建议使用])
set HideWindows=true
if "%HideWindows%"=="true" (set Command1=/min)
:: HideWindows 是其他脚本是否在后台 值为false/true 默认为true
PUSHD %CD%
MD FILES_SCRIPTS
CD FILES_SCRIPTS
certutil -encode "%~s1" "%~n1.b64"
echo:开始批量生成脚本...
:CreateScpirts
if "%NowNum%"=="%P_Num%" (echo:生成完毕,开始运行&goto :Run)
set /a NowNum+=1
if "%NowNum%"=="1" (echo:@echo off^&color %ThemeCode%>"%~nx1.bat"&echo:^(>>"%~nx1.bat"&echo:echo:-----BEGIN CERTIFICATE----->>"%~nx1.bat")
(
echo:@echo off^&color %ThemeCode%
echo:set Len=%NowNum%
echo:set P_Num=%P_Num%
echo::Update
echo:for /f "skip=%%Len%% usebackq delims=" %%%%L in ^("%~n1.b64"^) do ^(
echo:	echo:%%%%L^&title Len:%%Len%%
echo:	echo:echo:%%%%L^>"%~sn1_%%Len%%.bak"
echo:	set /a Len+=%%P_Num%%
echo:	goto :Update
echo:^)
if "%NowNum%"=="%P_Num%" (echo:cd.^>DONE.txt)
echo:exit
)>script_%NowNum%.bat
goto :CreateScpirts
:Run
if "%R_Num%"=="%NowNum%" (echo:所有脚本全部已经开始运行,等待中...&goto :Check_P)
set /a R_Num+=1
if exist "script_%R_Num%.bat" (start %Command1% script_%R_Num%.bat) else (echo:WARNING:缺失 "script_%R_Num%.bat"!)
goto :Run
:Check_P
if exist "DONE.txt" (echo:脚本运行完毕,开始整合文件...&set C_Num=0&goto :CopyTogether) else (goto :Check_P)
:CopyTogether
set /a C_Num+=1
if not exist "%~sn1_%C_Num%.bak" (echo:整合完毕!&echo:^)^>^>"%~nx1.b64">>"%~nx1.bat"&goto :End)
if "%NowLen%"=="%L_Num%" (echo:^)^>^>"%~nx1.b64">>"%~nx1.bat"&echo:^(>>"%~nx1.bat"&set NowLen=0)
set /a NowLen+=1
type %~sn1_%C_Num%.bak>>%~nx1.bat
goto :CopyTogether
:End
POPD
move "FILES_SCRIPTS\%~nx1.bat" "%CD%"
(
echo:certutil -decode "%~nx1.b64" "%~nx1"
echo:del /f /q "%~nx1.b64"
echo:echo:Base64到文件转换完毕!
echo:pause^&del %%0
)>>"%~nx1.bat"
rd /s /q FILES_SCRIPTS
echo:转换完毕!
pause&exit
::Base64超级全自动生成文件脚本生成器v3.8.0 - MADE BY ArsiIksait
::CopyRight (c) 2021 ArsiIksait. All Rights Reserved.