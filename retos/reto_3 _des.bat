setlocal enabledelayedexpansion
title Batch III
set c= abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/"=:()%%0123456789
color d
echo off
set /P cadena="Ingrese la contrasea: "
set cadena==
set temp=a
set ret=
set length=
:loop
if not .a==. (set temp=set /a length += 1 goto loop)
for /l %%i in (0 0 ) 
do (
set /a pos=%%i - 0
call set letra=%%cadena:~(%%i - 0) 1%%
if "%%cadena:~(%%i - 0) 1%%"=="a" (set letrar=i)
if "%%cadena:~(%%i - 0) 1%%"=="b" (set letrar=h)
if "%%cadena:~(%%i - 0) 1%%"=="c" (set letrar=g)
if "%%cadena:~(%%i - 0) 1%%"=="d" (set letrar=f)
if "%%cadena:~(%%i - 0) 1%%"=="e" (set letrar=n)
if "%%cadena:~(%%i - 0) 1%%"=="f" (set letrar=d)
if "%%cadena:~(%%i - 0) 1%%"=="g" (set letrar=c)
if "%%cadena:~(%%i - 0) 1%%"=="h" (set letrar=b)
if "%%cadena:~(%%i - 0) 1%%"=="i" (set letrar=a)
if "%%cadena:~(%%i - 0) 1%%"=="j" (set letrar=r)
if "%%cadena:~(%%i - 0) 1%%"=="k" (set letrar=q)
if "%%cadena:~(%%i - 0) 1%%"=="l" (set letrar=p)
if "%%cadena:~(%%i - 0) 1%%"=="m" (set letrar=o)
if "%%cadena:~(%%i - 0) 1%%"=="n" (set letrar=e)
if "%%cadena:~(%%i - 0) 1%%"=="o" (set letrar=m)
if "%%cadena:~(%%i - 0) 1%%"=="p" (set letrar=l)
if "%%cadena:~(%%i - 0) 1%%"=="q" (set letrar=k)
if "%%cadena:~(%%i - 0) 1%%"=="r" (set letrar=j)
if "%%cadena:~(%%i - 0) 1%%"=="s" (set letrar=z)
if "%%cadena:~(%%i - 0) 1%%"=="t" (set letrar=y)
if "%%cadena:~(%%i - 0) 1%%"=="u" (set letrar=x)
if "%%cadena:~(%%i - 0) 1%%"=="v" (set letrar=w)
if "%%cadena:~(%%i - 0) 1%%"=="w" (set letrar=v)
if "%%cadena:~(%%i - 0) 1%%"=="x" (set letrar=u)
if "%%cadena:~(%%i - 0) 1%%"=="y" (set letrar=t)
if "%%cadena:~(%%i - 0) 1%%"=="z" (set letrar=s)
set /P ret=tr
)
if not ""=="8" (goto no)
if not ""=="yg" (goto no)
if not "tr"=="hi" (goto no)
if not ""=="bo" (goto no)
if not ""=="ijn" (goto no)
set color=1a
set cadena=3
set cadena=2
set respuesta=Bien la respuesta para validar el reto es "a"
goto salida
:no
set color=3c
set respuesta=Mal,%c:~0,1%%c:~9,1%%c:~14,1%%c:~20,1%%c:~5,1%%c:~14,1%%c:~20,1%%c:~1,1%%c:~12,1%%c:~15,1%%c:~0,1%%c:~4,1%%c:~5,1%%c:~0,1%%c:~14,1%%c:~21,1%%c:~5,1%%c:~22,1%%c:~15,1%
:salida
echo Mal intentalo de nuevo
color 3c
pause>nul
color 07
cls
endlocal