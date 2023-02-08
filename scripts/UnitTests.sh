#!/bin/bash

cd test
make clean
make -s -f Makefile OrionUnitTests
./OrionUnitTests -c -v

