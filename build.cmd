@echo off
git pull origin main
if errorlevel 1 (
    echo Error updates.
    exit /b 1
)
mkdir build 2>nul
cd build
cmake .. -G "MinGW Makefiles"
if errorlevel 1 (
    echo Error CMake.
    exit /b 1
)
mingw32-make
if errorlevel 1 (
    echo Error.
    exit /b 1
)
echo Successfully.
main.exe
