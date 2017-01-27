ECHO +++++++++++++++++++++++++++++++++++++++++++++++
ECHO + Immune Response Template navigator by ISBM. +
ECHO +++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Starting a copy of IRT 1.1 as Google application...
ECHO.

REM Global
SET chromePath1="%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"
SET chromePath2="%PROGRAMFILES(x86)%\Google\Chrome\Application\chrome.exe"
REM Local
SET chromePath3="%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"

set chromePath=""
IF EXIST %chromePath1% (
  SET chromePath=%chromePath1%
  GOTO start
)
IF EXIST %chromePath2% (
  SET chromePath=%chromePath2%
  GOTO start
)
IF EXIST %chromePath3% (
  SET chromePath=%chromePath3%
  GOTO start
)
IF %chromePath%=="" (
  echo ERROR! Google Chrome is not installed or cannot be found.
  GOTO lexit
)

:start
start "starting" %chromePath% -user-data-dir=%TEMP% --allow-file-access-from-files --disable-popup-blocking --app="%cd%\index.xhtml"
:lexit

