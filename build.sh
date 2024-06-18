#!/bin/bash

# Remove specified files and directories
rm -r CMakeCache.txt
rm -r CMakeFiles
rm -r cmake_install
rm cuda.F90
rm cuda.F90.in

# Load the nvhpc module using spack
# spack load nvhpc@23.3
spack load nvhpc@23.3/gq4uoop

# Run cmake and make
cmake .
make
