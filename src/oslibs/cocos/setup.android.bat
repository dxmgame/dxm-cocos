@echo off

set ocd=%cd%
set COCOS2DX_VERSION_NAME=cocos2d-x
set COCOS2DX_ZIP_NAME=cocos2d-x
cd /d %~dp0

echo ##### ��ʾ����ȡ�����ļ� #####
if exist ..\config.bat call ..\config.bat
if exist ..\..\config.bat call ..\..\config.bat
if exist ..\..\..\config.bat call ..\..\..\config.bat
if exist ..\..\..\..\config.bat call ..\..\..\..\config.bat
if exist ..\..\..\..\..\config.bat call ..\..\..\..\..\config.bat

echo ##### ��ʾ����ѹ %COCOS2DX_ZIP_NAME% #####
rem if not exist %COCOS2DX_ZIP_NAME% ( %DXM_TOOLS%\win\bsdtar.exe -zxvf %COCOS2DX_VERSION_NAME%.zip
rem 	move %COCOS2DX_VERSION_NAME% %COCOS2DX_ZIP_NAME%
rem 	)
	
echo ##### ��ʾ���򲹶� #####
rem rmdir /s/Q %COCOS2DX_ZIP_NAME%\extensions\spine
rem xcopy /y/s patch\* %COCOS2DX_ZIP_NAME%\

md proj.android\jni
copy /y Android.mk proj.android\jni

cd %ocd%
@echo on

