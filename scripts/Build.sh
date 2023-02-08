#!/bin/bash

CMAKE=cmake
TYPE=debug
BUILD_DIR=$(pwd)/build/debug
TESTING_DIR=Testing
TOOLCHAIN=cmakeModules/ProjectToolchain.cmake

rm -rf $BUILD_DIR/*
rm -rf $TESTING_DIR
mkdir $BUILD_DIR
$CMAKE -S . -B $BUILD_DIR -DBUILD_ORION:TYPE=ON -DCMAKE_BUILD_TYPE=$TYPE -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN
$CMAKE --build $BUILD_DIR 
