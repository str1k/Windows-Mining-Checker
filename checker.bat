@echo off
rem configuration
SET /A GPU_NUM=1
SET RESTART_TIME=120
SET "servers=asia.zcoin.miningpoolhub.com:20581 asia.miningspeed.com:3072 asia1.ethermine.org:14444"
SET EXECUTE_FILE=start.bat
SET ONBOARD_GPU=1

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
goto :restart_PC

:check_pool
echo checking pool connection
setlocal
rem Check conectivity for every address in the servers list, delimit each address by space.
rem use PortQryV2 to check connectivity, if any of the address work proceed to check GPUs number.
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
rem Get all GPU list but skip On-board card and concat all name to GPU_NAME, 
rem also count all the number of GPU.
SET /A CARDS=0
for /F "tokens=* skip=1" %%n in ('WMIC path Win32_VideoController get Name ^| findstr "."') do (
	set GPU_NAME=%%n
	SET /A CARDS+=1
)
echo %GPU_NAME%
SET /A CARDS = CARDS - ONBOARD_GPU
echo Detected %CARDS% Cards
rem Check if all card existed, if it does proceed to run miner, else restart PC.
if %CARDS% == %GPU_NUM% (
	goto :run_minner
) else (
	goto :restart_PC
)

:restart_PC
c:\windows\system32\shutdown -r -t %RESTART_TIME%
goto :eof

rem Run miner by calling batch file
:run_minner
%EXECUTE_FILE%
