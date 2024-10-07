#!/bin/bash

current_branch=$(git symbolic-ref --short HEAD)

echo "Текущая ветка: $current_branch"

git pull origin $current_branch --rebase

if [ $? -ne 0 ]; then
  echo "Ошибка при выполнении git pull. Проверьте конфликтующие изменения."
  exit 1
fi

if [ ! -d "build" ]; then
  mkdir build
fi

cd build

cmake ..

if [ $? -ne 0 ]; then
  echo "Ошибка при конфигурации CMake."
  exit 1
fi

cmake --build .

if [ $? -eq 0 ]; then
  echo "Сборка завершена успешно!"
else
  echo "Ошибка сборки."
  exit 1
fi

cd ..
