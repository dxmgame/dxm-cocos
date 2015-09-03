@echo off

set ocd=%cd%
set COCOS2DX_ZIP_NAME=cocos-src
cd /d %~dp0
cd ..

echo ##### 提示：读取配置文件 #####
if exist ..\config.bat call ..\config.bat
if exist ..\..\config.bat call ..\..\config.bat
if exist ..\..\..\config.bat call ..\..\..\config.bat
if exist ..\..\..\..\config.bat call ..\..\..\..\config.bat
if exist ..\..\..\..\..\config.bat call ..\..\..\..\..\config.bat

echo ##### 提示：打补丁 #####
rem rmdir /s/Q %COCOS2DX_ZIP_NAME%\extensions\spine
rem xcopy /y/s patch\* %COCOS2DX_ZIP_NAME%\

md proj.android\jni
copy /y Android.mk proj.android\jni

cd %ocd%
@echo on

