@echo off

set "script_dir=%~dp0"
set "dbasic=%script_dir%..\dbasic.exe 4"
set "clang=clang.exe"
set "temp=%~n1.ll"
set "output=%~n1.exe"
set "library_c=%script_dir%basic_lib.c"
set "library_ll=%script_dir%basic_lib.ll"

where /q %clang%
if %errorlevel% neq 0 (
    echo Error: Cannot find %clang%
    goto end
)

if not exist "%library_ll%" (
    if not exist "%library_c%" (
        echo Error: No support library "basic_lib.c"
        goto end
    )
    echo Creating %library_ll%
    %clang% -S -emit-llvm -o "%library_ll%" "%library_c%"
)

%dbasic% < %1 > "%temp%"
if exist "%temp%" (
    %clang% -Wno-override-module -O3 -o "%output%" "%temp%" "%library_ll%"
    rem del %temp%
    if exist "%output%" (
        %output%
    )
)

:end
