@echo off&title 日志拷贝器
set A_Folder_Path=C:\Users\Administrator\Desktop\A
::设置最新的日志文件所在文件夹的路径
set B_Folder_Path=C:\Users\Administrator\Desktop\B
::设置日志拷贝输出的路径
set Chack_Logs_Ever_Hours=0
set Chack_Logs_Ever_Minutes=3
set Chack_Logs_Ever_Seconds=0
::每N小时+N分钟+N秒检查一次log
set Recovery_Chack_Hours=%Chack_Logs_Ever_Hours%
set Recovery_Chack_Minutes=%Chack_Logs_Ever_Minutes%
set Recovery_Chack_Seconds=%Chack_Logs_Ever_Seconds%
::备份计时器时间,用于恢复计时器
echo.日志拷贝器正在运行中...
:loop
timeout 1
::MsHta JavaScript:document.write();setTimeout('close()',1000);
if "%Chack_Logs_Ever_Seconds%"=="0" (
if not "%Chack_Logs_Ever_Minutes%"=="0" (
 set /a Chack_Logs_Ever_Minutes-=1
 set Chack_Logs_Ever_Seconds=60
 )
 if "%Chack_Logs_Ever_Minutes%"=="0" (
 if not "%Chack_Logs_Ever_Hours%"=="0" (
 set /a Chack_Logs_Ever_Hours-=1
 set Chack_Logs_Ever_Minutes=60
 )
 if "%Chack_Logs_Ever_Hours%"=="0" (
 goto :Chack
 )
 )
)
if  not "%Chack_Logs_Ever_Seconds%"=="0" (
set /a Chack_Logs_Ever_Seconds-=1
)
title 日志拷贝器-将在%Chack_Logs_Ever_Hours%小时,%Chack_Logs_Ever_Minutes%分钟,%Chack_Logs_Ever_Seconds%秒后检查一次日志文件
goto :loop
:Chack
set /a Yesterday=(%Date:~0,4%%Date:~5,2%%Date:~8,2%)-1
set Back_Work_Path=%CD%
cd %A_Folder_Path%
title 正在检查日志文件-当前工作目录:%CD%
echo.%Date:~0,4%/%Date:~5,2%/%Date:~8,2% %Time% INFO:正在尝试更新%B_Folder_Path%目录下的log.bak和logs.bak
if exist "log.%Yesterday%.bak" (copy /y "log.%Yesterday%.bak" "%B_Folder_Path%\log.bak"||echo.%Date:~0,4%/%Date:~5,2%/%Date:~8,2% %Time% ERROR:在尝试更新%B_Folder_Path%目录下的log.bak时出错!)
if not exist "log.%Yesterday%.bak" (echo.%Date:~0,4%/%Date:~5,2%/%Date:~8,2% %Time% WARNING:在%A_Folder_Path%目录下没有找到log.%Yesterday%.bak文件)
if exist "logs%Yesterday%.bak" (copy /y "logs%Yesterday%.bak" "%B_Folder_Path%\logs.bak"||echo.%Date:~0,4%/%Date:~5,2%/%Date:~8,2% %Time% ERROR:在尝试更新%B_Folder_Path%目录下的logs.bak时出错!)
if not exist "logs%Yesterday%.bak" (echo.%Date:~0,4%/%Date:~5,2%/%Date:~8,2% %Time% WARNING:在%A_Folder_Path%目录下没有找到logs%Yesterday%.bak文件)
cd %Back_Work_Path%
title 结束检查日志文件-当前工作目录:%CD%
set Chack_Logs_Ever_Hours=%Recovery_Chack_Hours%
set Chack_Logs_Ever_Minutes=%Recovery_Chack_Minutes%
set Chack_Logs_Ever_Seconds=%Recovery_Chack_Seconds%
::恢复计时器时间
goto :loop