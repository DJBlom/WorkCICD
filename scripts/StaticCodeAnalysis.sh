#!/bin/bash

MAIN=source/Orion.cpp
SOURCE_DIR=source/src 
CORE_SOURCE_DIR=source/coreSystem/src

if ! cppcheck --enable=all --std=c++11 --suppress=missingInclude --suppress=unusedFunction --error-exitcode=1 $SOURCE_DIR $CORE_SOURCE_DIR $MAIN;
then
    exit 1
else
    exit 0
fi
