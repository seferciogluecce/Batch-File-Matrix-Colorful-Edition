@Echo Off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)


:top
echo
SET /A test=%RANDOM% * 10 / 32768 + 1
for /l %%N in (1 1 100) do call :colorEcho  " !random! "
goto top


call :colorEcho 0e "Hello "
call :colorEcho 0a " World"
pause
exit
:colorEcho
echo off
SET /A test=%RANDOM% * 10 / 32768 + 1
<nul set /p ".=%DEL%" > %test% 
findstr /v /a:%1 /R "^$" %test%  nul
del %test%  > nul 2>&1i
