@echo off

for /f "tokens=*" %%i in ('git symbolic-ref --short HEAD') do set current_branch=%%i

echo Текущая ветка: %current_branch%

git pull origin %current_branch% --rebase

IF %ERRORLEVEL% NEQ 0 (
    echo Ошибка при выполнении git pull.
    exit /b 1
)

if not exist build mkdir build
cd build

cmake ..

IF %ERRORLEVEL% NEQ 0 (
    echo Ошибка при конфигурации CMake.
    exit /b 1
)

cmake --build .

IF %ERRORLEVEL% NEQ 0 (
    echo Ошибка сборки.
    exit /b 1
)

echo Сборка завершена успешно!
cd ..
