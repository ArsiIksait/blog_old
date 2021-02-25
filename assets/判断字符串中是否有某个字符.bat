@echo off
set /p str=请输入:
if "%str%"=="" (
 echo IsNULL
 echo Then Do Somethings...
 ) else (
  echo IsNotNULL
 echo=%str%|findstr "abc"&&(
 echo 找到了查找的字符
 )||(
 echo 没找到要查找的字符[其他字符]
 )
)
pause