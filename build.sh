#!/bin/bash
set -e

git pull origin main
if [ $? -ne 0 ]; then
    echo "Error updates."
    exit 1
fi

mkdir -p build
cd build

cmake .. -G "Unix Makefiles"
if [ $? -ne 0 ]; then
    echo "Error CMake."
    exit 1
fi

make
if [ $? -ne 0 ]; then
    echo "Error."
    exit 1
fi

echo "Successfully."
./main
