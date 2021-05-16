@echo off&color 20&mode con cols=80 lines=32&setlocal EnableDelayedExpansion&set "+=%1"
set "ToolKitHelper=%2"
:RemoveMenu
if exist "Mount\Windows\SysWOW64" (set "Bit=64") else (set "Bit=86")
for /f "tokens=4 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ProductName" 2^>nul') do set "Version=%%i"
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2^>nul') do set "ImageBuild=%%i"
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 2^>nul') do set "ImageFlag=%%i"
for /f "tokens=3 delims= " %%i in ('reg query "HKLM\ZTM\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId" 2^>nul') do set "ReleaseId=%%i"
echo !ReleaseId!|Findstr /i "1809 1903 1909 2004" >nul 2>nul||(cls&echo.&echo.精简功能目前仅适用于Windows10 1809/1903/1909/2004，当前挂载的是Windows !Version!,!ReleaseId!...&echo.&echo.请按任意键返回...&pause>nul&goto :menu2)
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
	echo.   ^|   [X] 退出                                                             ^|
	echo.   ^|                                                                        ^|
	echo.    ________________________________________________________________________
	echo.
	choice /c:123456X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==7 Exit
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
	echo.   ^|   [X] 退出                                                             ^|
	echo.   ^|                                                                        ^|
	echo.    ________________________________________________________________________
	echo.
	choice /c:123456X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==7 Exit
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
	echo.   ^|   [X] 退出                                                             ^|
	echo.   ^|                                                                        ^|
	echo.    ________________________________________________________________________
	echo.
	choice /c:123456X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==7 Exit
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
	echo.   ^|   [X] 退出                                                             ^|
	echo.   ^|                                                                        ^|
	echo.    ________________________________________________________________________
	echo.
	choice /c:1234X /n /m ">>>>>>>请输入选择:" 
	if !errorlevel!==5 Exit
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
echo.  ^|                                                                          ^|
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
echo.  ^|                                                                          ^|
echo.    ________________________________________________________________________
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
echo.  ^|                                                                          ^|
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
echo.  ^|                                                                          ^|
echo.    ________________________________________________________________________
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
echo.  ^|                                                                          ^|
echo.   ^|   [1] 家庭组                                                           ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] MultiPoint Connector                                             ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] 远程协助                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [4] 移除以上全部组件                                                 ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.  ^|                                                                          ^|
echo.    ________________________________________________________________________
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
echo.   ^|   [A] 设备锁定 ^(嵌入式体验^)                                          ^|
echo.   ^|                                                                        ^|
echo.   ^|   [B] 轻松访问主题                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [C] 轻松传送                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [D] 文件历史记录                                                     ^|
echo.   ^|                                                                        ^|
echo.   ^|   [E] 手动安装程序 ^(就地升级^)                                        ^|
echo.   ^|                                                                        ^|
echo.   ^|   [F] 画图工具                                                         ^|
echo.   ^|                                                                        ^|
echo.   ^|   [G] 安全中心 ^| 依赖于：Windows Defender                             ^|
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
echo.  ^|                                                                         ^|
echo.    ________________________________________________________________________
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
echo.  ^|                                                                          ^|
echo.   ^|   [1] 系统应用一                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] 系统应用二                                                       ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.  ^|                                                                          ^|
echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
echo.  ^|                                                                          ^|
echo.   ^|   [1] Windows应用一                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [2] Windows应用二                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [3] Windows应用三                                                    ^|
echo.   ^|                                                                        ^|
echo.   ^|   [X] 返回                                                             ^|
echo.  ^|                                                                          ^|
echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
	echo.    ________________________________________________________________________
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
title 正在移除 %2
mode con cols=80 lines=22
cls&echo.&echo.正在移除 %2 请稍等...
set "Item=移除 %2"
"!ToolsPath!\ToolKitHelper.exe" %1 %3
call :Log
goto :eof

:Log
echo 操作日期：!date:~0,-3!，操作时间：!Time:~0,-3!，项目名称：!Item!，项目状态：成功 >> "操作日志.Log"
goto :eof