@echo off

set ocd=%cd%
set COCOS2DX_VERSION_NAME=cocos2d-x
set COCOS2DX_ZIP_NAME=cocos-src
cd /d %~dp0

echo ##### 提示：读取配置文件 #####
if exist ..\config.bat call ..\config.bat
if exist ..\..\config.bat call ..\..\config.bat
if exist ..\..\..\config.bat call ..\..\..\config.bat
if exist ..\..\..\..\config.bat call ..\..\..\..\config.bat
if exist ..\..\..\..\..\config.bat call ..\..\..\..\..\config.bat

SET cocos2dx_sln=build/cocos2d-win32.vc2012.sln
SET DXM_PREBUILT=win_x86

call %DXM_PREBUILT_TOOLS%vsvars32.bat

echo ##### 提示：解压 %COCOS2DX_VERSION_NAME% #####
rem if not exist %COCOS2DX_ZIP_NAME% ( %DXM_TOOLS%\win\bsdtar.exe -zxvf %COCOS2DX_VERSION_NAME%.zip
rem	move %COCOS2DX_VERSION_NAME% %COCOS2DX_ZIP_NAME%
rem 	)
	
echo ##### 提示：打补丁 #####
rem rmdir /s/Q %COCOS2DX_ZIP_NAME%\extensions\spine
rem xcopy /y/s patch\* %COCOS2DX_ZIP_NAME%\

echo ##### 提示：编译 %COCOS2DX_ZIP_NAME% #####

cd %COCOS2DX_ZIP_NAME%

BuildConsole.exe %cocos2dx_sln% /prj=libcocos2d /Silent /Cfg="Debug|WIN32,Release|WIN32" 

echo ##### 提示：安装 %COCOS2DX_ZIP_NAME% #####
if not exist %DXM_PREBUILT%\bin\%DXM_PREBUILT%\debug mkdir %DXM_PREBUILT%\bin\%DXM_PREBUILT%\debug
if not exist %DXM_PREBUILT%\bin\%DXM_PREBUILT%\release mkdir %DXM_PREBUILT%\bin\%DXM_PREBUILT%\release
if not exist %DXM_PREBUILT%\lib\%DXM_PREBUILT%\libcocos2dx\debug mkdir %DXM_PREBUILT%\lib\%DXM_PREBUILT%\libcocos2dx\debug
if not exist %DXM_PREBUILT%\lib\%DXM_PREBUILT%\libcocos2dx\release mkdir %DXM_PREBUILT%\lib\%DXM_PREBUILT%\libcocos2dx\release
if not exist %DXM_PREBUILT%\inc\libcocos2dx mkdir %DXM_PREBUILT%\inc\libcocos2dx
if not exist %DXM_PREBUILT%\inc\libcocos2dx\external mkdir %DXM_PREBUILT%\inc\libcocos2dx\external
if not exist %DXM_PREBUILT%\inc\libcocos2dx\extensions mkdir %DXM_PREBUILT%\inc\libcocos2dx\extensions

copy build\Release.win32\*.lib %DXM_PREBUILT%\lib\%DXM_PREBUILT%\libcocos2dx\release\
copy build\Debug.win32\*.lib %DXM_PREBUILT%\lib\%DXM_PREBUILT%\libcocos2dx\debug\
copy build\Release.win32\*.dll %DXM_PREBUILT%\bin\%DXM_PREBUILT%\Release\
copy build\Debug.win32\*.dll %DXM_PREBUILT%\bin\%DXM_PREBUILT%\Debug\

xcopy /y/s cocos\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\*.inl %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\editor-support\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\platform\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\platform\desktop\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\scripting\lua-bindings\auto\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\scripting\lua-bindings\manual\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\audio\include\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\ui\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\2d\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\3d\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\base\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\editor-support\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\editor-support\spine\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\editor-support\cocostudio\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\editor-support\cocostudio\ActionTimeline\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s cocos\editor-support\cocosbuilder\*.h %DXM_PREBUILT%\inc\libcocos2dx\

xcopy /y/s external\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\glfw3\include\win32\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\win32-specific\gles\include\OGLES\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\chipmunk\include\chipmunk\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\Box2D\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\curl\include\win32\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\win32-specific\zlib\include\*.h %DXM_PREBUILT%\inc\libcocos2dx\
xcopy /y/s external\*.h %DXM_PREBUILT%\inc\libcocos2dx\external\

xcopy /y/s extensions\*.h %DXM_PREBUILT%\inc\libcocos2dx\extensions\
xcopy /y/s extensions\*.h %DXM_PREBUILT%\inc\libcocos2dx\

cd %ocd%
@echo on


