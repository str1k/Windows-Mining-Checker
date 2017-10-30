@echo off
rem configuration
SET /A GPU_NUM=1
SET RESTART_TIME=120
SET "servers=metaverse.farm:3333 metaverse.farm:8888"
SET EXECUTE_FILE=start.bat

echo checking internet connection
FOR /L %%A IN (1,1,10) DO (
  ECHO %%A
  Ping www.google.com -n 1 -w 1000
  cls
  if errorlevel 1 (
	set internet=0
  ) else (
	set internet=1
	goto :check_pool
	
)
  echo %internet%
  timeout /t 5 /nobreak
)

:check_pool
rem Put All your pool address here
echo checking pool connection
setlocal
for %%I in (%servers%) do (
    for /f "tokens=1,2 delims=:" %%a in ("%%I") do (
        set "port=%%~b"
        if not defined port set "port=80"
        setlocal enabledelayedexpansion
        PortQry.exe -n "%%~a" -e "!port!" >NUL 2>NUL && (
            echo %%a port !port!: OK
	    goto :check_gpu
        ) || (
            echo %%a port !port!: Error
        )
        endlocal
    )
)
goto :restart_PC



:check_gpu
echo %%a port !port!: OK
SET /A CARDS=0
for /F "tokens=* skip=1" %%n in ('WMIC path Win32_VideoController get Name ^| findstr "."') do set GPU_NAME=%%n
SET /A CARDS+=1
echo %GPU_NAME%
echo %CARDS%
rem Check if all card existed
if %CARDS% == %GPU_NUM% (
	goto :run_minner
) else (
	goto :restart_PC
)

:restart_PC
c:\windows\system32\shutdown -r -t %RESTART_TIME%

rem Run miner by calling batch file
:run_minner
%EXECUTE_FILE%
