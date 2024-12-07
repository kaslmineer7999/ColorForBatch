@echo off

REM ColorForBatch  Copyright (C) 2024  kaslmineer7999
REM This program comes with ABSOLUTELY NO WARRANTY
REM This is free software, and you are welcome to redistribute it under certain conditions

if "%1" equ "/?"    goto:help
if "%1" equ "-?"    goto:help
if "%1" equ ""      goto:help
if "%1" equ "/help" goto:help
if "%1" equ "-help" goto:help
goto:main
:main
setlocal EnableDelayedExpansion
REM change x86 with x64 if you use a 64-bit procsessor
bin\x86\ansicon.exe -p
set esc=
set type=%1
set color=%2
set color=!color:~1,-1!
set text=%3
set text=!text:~1,-1!
set echo_type=%4
if "!type!" equ "fg"               set type=38
if "!type!" equ "bg"               set type=48
if "!color!" equ ""                exit /b 1
if "!text!" equ ""                 exit /b 1
if "!echo_type!" equ "/newline"    set echo_type=echo
if "!echo_type!" equ "-newline"    set echo_type=echo
if "!echo_type!" equ "/nl"         set echo_type=echo
if "!echo_type!" equ "-nl"         set echo_type=echo
if "!echo_type!" equ ""            set echo_type=echo
if "!echo_type!" equ "/no-newline" set echo_type=set /p =
if "!echo_type!" equ "-no-newline" set echo_type=set /p =
if "!echo_type!" equ "/nnl"        set echo_type=set /p =
if "!echo_type!" equ "-nnl"        set echo_type=set /p =
!echo_type! !esc![!type!;2;!color!m!text!!esc![0m<nul
exit /b

:help
echo.
echo.                           ColorForBatch                           
echo.ColorForbatch is a utilty for batch that allows color without gloa-
echo.       le color changing and instead change color of one text      
echo.
echo.                            parameters:                            
echo.
echo.fg, bg - is the color for the forground/text (fg) or the background
echo.         (bg)                                                      
echo.
echo.                    "r;g;b" - use r;g;b as color"
echo.
echo.        "STRING" - output STRING with all previous color options
echo.
echo.  /newline, -newline, /nl, -nl - add a newline at the end (DEFAULT)
echo.
echo./no-newline, -no-newline, /nnl, -nnl - do not add a newline at the-
echo.end
echo.           all parameters must be in the following order:
echo.call %~0 (fg or bg) (rgb in "r,g,b" format) "STRING" [-nl,-nnl]
echo.
