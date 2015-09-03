REM ע��
@echo off

set ocd=%cd%
cd /d %~dp0
cd ..

echo ##### ��ʾ����ȡ�����ļ� #####
if exist ..\config.bat call ..\config.bat
if exist ..\..\config.bat call ..\..\config.bat
if exist ..\..\..\config.bat call ..\..\..\config.bat
if exist ..\..\..\..\config.bat call ..\..\..\..\config.bat
if exist ..\..\..\..\..\config.bat call ..\..\..\..\..\config.bat
if exist ..\..\..\..\..\..\config.bat call ..\..\..\..\..\..\config.bat
if exist ..\..\..\..\..\..\..\config.bat call ..\..\..\..\..\..\..\config.bat

echo ##### ��ʾ��Ԥ���밲װ %COCOS2DX_ZIP_NAME% #####
set COCOS2DX_VERSION_NAME=cocos2d-x
set COCOS2DX_ZIP_NAME=cocos-src
SET cocos2dx_sln=build/cocos2d-win32.sln
SET DXM_PREBUILT=%cd%\prebuilt
SET DXM_PLATFORM=win_x86

call %DXM_COMPILER_TOOLS%vsvars32.bat
	
echo ##### ��ʾ���򲹶� #####
rem rmdir /s/Q %COCOS2DX_ZIP_NAME%\extensions\spine
rem xcopy /y/s patch\* %COCOS2DX_ZIP_NAME%\

echo ##### ��ʾ������ %COCOS2DX_ZIP_NAME% #####

cd %COCOS2DX_ZIP_NAME%
BuildConsole.exe %cocos2dx_sln% /prj=libluacocos2d /Silent /Cfg="Debug|WIN32,Release|WIN32" 

echo ##### ��ʾ����װ %COCOS2DX_ZIP_NAME% #####

rem lib&dll
xcopy /y/s build\Release.win32\*.lib %DXM_PREBUILT%\lib\%DXM_PLATFORM%\release\
xcopy /y/s build\Debug.win32\*.lib %DXM_PREBUILT%\lib\%DXM_PLATFORM%\debug\
xcopy /y/s build\Release.win32\*.dll %DXM_PREBUILT%\bin\%DXM_PLATFORM%\release\
xcopy /y/s build\Debug.win32\*.dll %DXM_PREBUILT%\bin\%DXM_PLATFORM%\debug\

rem cocos
xcopy /y/s cocos\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\*.inl %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\audio\include\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\network\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\editor-support\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\platform\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\platform\desktop\*.h %DXM_PREBUILT%\inc\cocos\

rem extensions
xcopy /y/s extensions\*.h %DXM_PREBUILT%\inc\cocos\

rem external
xcopy /y/s external\*.h %DXM_PREBUILT%\inc\cocos\

xcopy /y/s external\chipmunk\include\chipmunk\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\curl\include\win32\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\websockets\include\win32\*.h %DXM_PREBUILT%\inc\cocos\

xcopy /y/s external\glfw3\include\win32\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\win32-specific\gles\include\OGLES\GL\*.h %DXM_PREBUILT%\inc\cocos\GL\

xcopy /y/s external\freetype2\include\win32\freetype2\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\freetype2\include\win32\*.h %DXM_PREBUILT%\inc\cocos\

rem lua
xcopy /y/s cocos\scripting\lua-bindings\auto\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\scripting\lua-bindings\manual\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s cocos\audio\include\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\lua\lua\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\lua\tolua\*.h %DXM_PREBUILT%\inc\cocos\
xcopy /y/s external\lua\luajit\include\*.h %DXM_PREBUILT%\inc\cocos\

cd /d %~dp0
cd ..

setlocal enabledelayedexpansion
call :GET_PATH_NAME %cd%
set project=%PATH_NAME%

if not exist  proj.win32 md proj.win32
cd proj.win32

echo #####��ʾ����ʼ����#####
cmake -DDXM_CMAKE_PLATFORM=WIN32 ..
echo %errorlevel%
if %errorlevel% neq 0 goto :cmEnd
cmake -DDXM_CMAKE_PLATFORM=WIN32 ..
echo %errorlevel%
if %errorlevel% neq 0 goto :cmEnd
echo #####��ʾ����������#####

echo #####��ʾ����ʼ����#####
rem BuildConsole.exe %project%.sln /prj=ALL_BUILD /Silent /OpenMonitor /Cfg="Debug|WIN32,Release|WIN32" 
rem BuildConsole.exe %project%.sln /prj=ALL_BUILD /Silent  /Cfg="Debug|WIN32,Release|WIN32" 
rem if %errorlevel% neq 0 goto :cmEnd
echo #####��ʾ���������#####

echo #####��ʾ����ʼ��װ#####
cmake -DBUILD_TYPE="Debug" -P cmake_install.cmake
if %errorlevel% neq 0 goto :cmEnd
cmake -DBUILD_TYPE="Release" -P cmake_install.cmake
if %errorlevel% neq 0 goto :cmEnd
echo #####��ʾ����װ����#####

goto cmDone
:cmEnd
echo setup failed
pause
exit

:cmDone
cmake -P dxm_cmake_compile_succeeded.cmake
cmake -P dxm_cmake_install_succeeded.cmake
cd /d %ocd%

goto :eof
:GET_PATH_NAME
set PATH_NAME=%~n1

:eof
