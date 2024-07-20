@echo off
rem BSCRIPT02.bat: Shape area and type calculator

:main
cls
echo Choose shape:
echo 1: Circle
echo 2: Triangle
echo 3: Quadrilateral

set /p shape="Enter chosen number: "

if "%shape%"=="1" (
    call :circle
) else if "%shape%"=="2" (
    call :triangle
) else if "%shape%"=="3" (
    call :quadrilateral
) else (
    echo Invalid choice. Please choose 1, 2, or 3.
    pause
    goto main
)

pause
goto end

:circle
set /p radius="Enter radius: "
set /a area=314*radius*radius/100
echo The area of the circle is: %area%
pause
goto main

:triangle
set /p a="Enter length of side a: "
set /p b="Enter length of side b: "
set /p c="Enter length of side c: "

rem Calculate semi-perimeter
set /a s=(a+b+c)/2

rem Calculate area using Heron's formula
set /a temp=s*(s-a)*(s-b)*(s-c)
set /a area=%temp%

rem Determine the type of triangle
if "%a%"=="%b%" (
    if "%b%"=="%c%" (
        echo The triangle is equilateral.
    ) else (
        echo The triangle is isosceles.
    )
) else if "%a%"=="%c%" (
    echo The triangle is isosceles.
) else if "%b%"=="%c%" (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)

echo The area of the triangle is: %area%
pause
goto main

:quadrilateral
set /p length="Enter length: "
set /p width="Enter width: "
set /a area=length*width
echo The area of the quadrilateral is: %area%
if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
pause
goto main

:end
echo Calculation complete.
pause
goto :eof
