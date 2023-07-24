@echo off
title PS3ISO Decryption
color 0A
set DIR_SOURCE=ISO_Files
set DIR_DEST=ISO_Decrypt
set TYPE00=d
set TYPE01=key
if not exist "%DIR_SOURCE%" (
    mkdir "%DIR_SOURCE%"
    echo Create folder with Sucess!
) else (
    echo Existing folder, no action taken.
)
if not exist "%DIR_DEST%" (
    mkdir "%DIR_DEST%"
    echo Create folder with Sucess!
) else (
    echo Existing folder, no action taken.
)
:menu00
cls
title PS3ISO Decryption
ping 127.0.0.1 -n 2 > nul
:menu01
echo =======================================================
echo ============    -----------------------    ============
echo ===========     PS3ISO Launcher Decrypt     ===========
echo ==========      -----------------------      ==========
echo =========                                     =========
echo ========      A. 4 Threads                     ========
echo =======                                         =======
echo ======        B. 8 Threads                       ======
echo =====                                             =====
echo =====         C. 12 Threads                       =====
echo =====                                             =====
echo =====         D. 16 Threads                       =====
echo ======                                           ======
echo =======       E. About Launcher                 =======
echo ========                                       ========
echo =========     F. Exit                         =========
echo ==========                                   ==========
echo =======================================================
set "choice="
2>nul >nul choice /c:yn /t 0 /d y
if errorlevel 1 if not errorlevel 2 set "choice=choice /cs"
if not defined choice (
  2>nul >nul choice /c:yn /t:y,1
  if errorlevel 1 if not errorlevel 2 set "choice=choice /s"
)
if not defined choice goto ERROR

CHOICE /C abcdef /N /M "Choose how many threads your processor:"

if errorlevel 6 goto Exit
if errorlevel 5 goto About
if errorlevel 4 goto Thd16
if errorlevel 3 goto Thd12
if errorlevel 2 goto Thd8
if errorlevel 1 goto Thd4
pause
cls
goto menu00

:ERROR

set /p OPTION= Choose how many threads your processor:
if %OPTION%==A goto Thd4
if %OPTION%==B goto Thd8
if %OPTION%==C goto Thd12
if %OPTION%==D goto Thd16
if %OPTION%==E goto About
if %OPTION%==F goto Exit
if %OPTION%==a goto Thd4
if %OPTION%==b goto Thd8
if %OPTION%==c goto Thd12
if %OPTION%==d goto Thd16
if %OPTION%==e goto About
if %OPTION%==f goto Exit
echo You can only choose A-F
pause
cls
goto menu01

:Thd4
set thdset=4
title PS3ISO Decryption --%thdset%
set EXE=4Thd.exe
goto resume

:Thd8
set thdset=8
title PS3ISO Decryption --%thdset%
set EXE=8Thd.exe
goto resume

:Thd12
set thdset=12
title PS3ISO Decryption --%thdset%
set EXE=12Thd.exe
goto resume

:Thd16
set thdset=16
title PS3ISO Decryption --%thdset%
set EXE=16Thd.exe
goto resume

:resume
set /p SourceFile=Enter the name for ISO: 
title PS3ISO Decryption --%thdset% --%SourceFile%
set /p DestFile=Enter the final name for ISO: 
title PS3ISO Decryption --%thdset% --%SourceFile% --%DestFile%
set /p dkey=Enter the Decryption Key: 
title PS3ISO Decryption --%thdset% --%SourceFile% --%DestFile% --%dkey% 
ping 127.0.0.1 -n 5 > nul
"%EXE%" "%TYPE00%" "%TYPE01%" "%dkey%" "%DIR_SOURCE%\%SourceFile%" "%DIR_DEST%\%DestFile%"
if exist "%DIR_SOURCE%\%SourceFile%" del "%DIR_SOURCE%\%SourceFile%"
ping 127.0.0.1 -n 3 > nul
goto menu00

:Exit
exit

:About
cls
title About Launcher
echo ========================================================
echo ============     ----------------------     ============
echo ===========          About Launcher          ===========
echo ==========       ----------------------       ==========
echo =========                                      =========
echo ========       Developed by @StrawFox64         ========
echo =======                                          =======
echo ======  Thanks al3xtjames for PS3Dec Alternative  ======
echo =====                                              =====
echo =====    Thanks red_meryl for PS3Dec originally    =====
echo ======                                            ======
echo =======                                          =======
echo ========                                        ========
echo =========        G. Return                     =========
echo ==========                                    ==========
echo ========================================================
set /p OPTION=Return for menu: 
goto menu00












































































































































































































:Debug
cls
title [DEBUG]
color 04
echo [Debug] Valor Definido Menu: %OPTION%
echo [Debug] Valor Definido EXE: %EXE%
echo [Debug] Valor Definido Type0: %TYPE00%
echo [Debug] Valor Definido Type1: %TYPE01%
echo [Debug] Valor Definido dkey: %dkey%
echo [Debug] Valor Definido DIRSOURCE: %DIR_SOURCE%
echo [Debug] Valor Definido SourceFile: %SourceFile%
echo [Debug] Valor Definido DIRDEST: %DIR_DEST%
echo [Debug] Valor Definido DestFile: %DestFile%
pause
