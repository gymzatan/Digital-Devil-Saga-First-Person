@echo off
setlocal
if "%~1"=="" (
  echo Drag ONE original ISO onto this script, or pass its path as an argument.
  pause
  exit /b 1
)
if not "%~2"=="" (
  echo Please provide only ONE original ISO.
  pause
  exit /b 1
)
if /i not "%~x1"==".iso" (
  echo Input must be an ISO file, not a ZIP, CHD, patch, or folder.
  pause
  exit /b 1
)
set "dds_source=%~f1"
set "dds_output=%~dpn1 [SELECT Camera Pitch].iso"
if exist "%dds_output%" (
  echo Output already exists. No files were changed.
  echo "%dds_output%"
  pause
  exit /b 1
)
echo Checking the original ISO and applying DDS2_USA...
echo Large ISO files can take several minutes. Keep this window open.
"%~dp0tools\xdelta3.exe" -d -s "%dds_source%" "%~dp0patches\DDS2_USA.xdelta" "%dds_output%"
set "dds_result=%errorlevel%"
if not "%dds_result%"=="0" (
  echo Patching failed. Your original ISO has not been modified.
  echo Read the xdelta error above. Do not use an incomplete output file.
  pause
  exit /b %dds_result%
)
echo Patch applied and verified successfully:
echo "%dds_output%"
echo Cold boot this ISO and load a normal in-game save.
pause
exit /b 0
