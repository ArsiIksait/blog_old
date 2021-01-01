@echo off
set n=32
setlocal enabledelayedexpansion
set str=0123456789-ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz
for /l %%a in (1,1,%n%) do call :slz "%%a"
echo.%random_str%
:slz
if "%~1"=="" goto:eof
set /a r=%random%%%64
set random_str=%random_str%!str:~%r%,1!