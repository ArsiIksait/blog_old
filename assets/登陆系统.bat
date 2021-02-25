@echo off&title 登陆系统&set "LoginName=Hello World"
echo:欢迎来到%LoginName%登陆系统!
:Start
echo:Login 登陆 [L]    Register 注册 [R]    Exit 退出 [E]
choice /C "LRE" /D E /T 10 /M "请在10秒内做出选择:"
if %ERRORLEVEL%==1 (cls&goto :Login)
if %ERRORLEVEL%==2 (cls&goto :Register)
if %ERRORLEVEL%==3 (cls&set EXIT_RETURN_TEXT=退出登陆系统...&goto :End)
cls&echo:出现错误,请重新选择!&goto :Start
:Login
echo:登陆到%LoginName%:
set /p UserName=请输入用户名:
set /p Passworld=请输入密码:
set FROM_ID=Login
goto :CheckAccount
:Register
echo:在%LoginName%上注册:
echo:Admin 管理员 [A]    User 用户 [U]    Cancel 取消 [C]
choice /C "AUC" /M "请选择账户类型:"
if %ERRORLEVEL%==1 (set UserRights=Admin) else if %ERRORLEVEL%==2 (set UserRights=User) else if %ERRORLEVEL%==3 (cls&echo:取消创建账户&goto :Start) else (cls&echo:出现错误,请重新注册!&goto :Register)
set /p UserName=请输入用户名:
set /p Passworld=请输入密码:
echo:最终确认:您将在%LoginName%上注册一个新账户:
echo:拥有权限:%UserRights%
echo:用户名:%UserName%
echo:密码:%Passworld%
choice /C "YN" /M "你是否决定创建这个账户?"
if %ERRORLEVEL%==1 (set FROM_ID=Register&cls&goto :CheckAccount) else if %ERRORLEVEL%==2 (cls&echo:取消创建账户&cls&goto :Start) else (cls&echo:出现错误,请重新注册!&cls&goto :Register)
:CheckAccount
Setlocal Enabledelayedexpansion
if "%FROM_ID%"=="Login" (
::检查用户名和密码
if "%UserName%"=="" (cls&echo:用户名不可为空!&goto :Login)
if "%Passworld%"=="" (cls&echo:密码不可为空!&goto :Login)
type "%~f0"|find /i "$%UserName%@%Passworld%#">QueryResults.sid
set /p UserInformation=<QueryResults.sid
if "!UserInformation!"=="" (del /q QueryResults.sid&cls&echo:用户名或密码错误,请重新输入!&goto :Login) else (for /f "tokens=1,2,3 delims=~$@#" %%i in (QueryResults.sid) do (echo:欢迎%%i %%j 来到 %LoginName%))
del /q QueryResults.sid
)
if "%FROM_ID%"=="Register" (
::写入账户信息
if "%UserRights%"=="" (cls&echo:权限不可为空!&goto :Register)
if "%UserName%"=="" (cls&echo:用户名不可为空!&goto :Register)
if "%Passworld%"=="" (cls&echo:密码不可为空!&goto :Register)
echo.~%UserRights%$%UserName%@%Passworld%#>>"%~f0"
set EXIT_RETURN_TEXT=您的账户: %UserName%@%Passworld% 已注册成功!
)
goto :End
:End
echo:%EXIT_RETURN_TEXT%
pause&exit
:UserTab
~Admin$Administrator@123456#
~User$ArsiIksait@6669998800#
~User$hello@656@335#
~Admin$3@65#
