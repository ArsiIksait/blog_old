@echo off&title 文件搜索器
:start
set /p FileName=请输入文件名(可不全写):
set /p FileType=请输入文件扩展名(加点):
echo:搜索模式:  字符匹配[1]    完全匹配[2]
choice /C "12" /M "请选择搜索模式:"
for %%i in (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) do (
title 正在搜索 %FileName%%FileType% - 当前盘符: "%%i:\"
if %ERRORLEVEL%==1 (if exist "%%i:\" (dir /s /b %%i:\*%FileType% 2>nul|findstr "%FileName%")) else if %ERRORLEVEL%==2 (if exist "%%i:\" (dir /s /b %%i:\%FileName%%FileType% 2>nul|findstr "%FileName%")) else (cls&echo:出现错误,请重新输入!&goto :start)
)
echo.搜索完毕
pause