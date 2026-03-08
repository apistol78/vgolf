@echo off

:: Get game home path using some bat magic.
for %%i in ("%~dp0.") do (set GAME_HOME=%%~dpi)
if %GAME_HOME:~-1%==\ set GAME_HOME=%GAME_HOME:~0,-1%

:: Setup traktor home.
call "%GAME_HOME%\..\traktor\scripts\config.bat"

pushd %GAME_HOME%

"%TRAKTOR_HOME%\bin\latest\win64\releaseshared\Traktor.Runtime.Deploy.App" VolleyGolf.workspace build "Volley Golf" "macOS" -verbose -force -avalanche-cache=pn-tambor-ws.pistol.one
if not errorlevel 0 ( exit /b 1 )

popd
