# Description
This project provides a code to control the LEDs and retargeting printf() function 
to communicate with the developer PC over serial interface on NUCLEO-H743ZI board.
It serves as a template for future projects.
The code is forked from the STM32CubeH7/Projects/NUCLEO-H743ZI/Tamplates.

## Requirements
This code is compiled and flashed with following tools
* GNU Make 4.2.1
* GNU Arm Embedded Toolchain 10.3-2021.07
* stlink-1.7.0

## Configuration
* "Conf.mk" includes all build specific defines like project name, used device, header includes, 
preprocessor defines and compiler settings
* Every directory has a "Sourcelist.mk" which includes all source files with relative paths

## Directories
* "src" includes all the main source header files of the project
* "ldscript" and "startup" includes the linker script file and startup file
* "system" includes submodules CMSIS_5, CMSIS Device H7 and STM32H7XX HAL Driver

## Getting started
All target are defined in the "Makefile". To execute this file open the terminal and 
cd into the the project direcory.
The following commands can be executed by the make:
* Command "make" will create an output directory which includes all the object files and the binary, 
elf and map file of the project.
* Command "make flash" file will install the binary on the target ST-Mikrocontroller via stlink-tool.
* Command "make clean" deletes the output directory and all the content inside.
* Command "make print_objects" prints all the object files with their relative paths that 
are generated out of the source files. So you can quickly check if all source files are included through 
the "Sourcelsit.mk".
* Command "make print_includes" prints all header include directories of the project.

This software contains code from the STM32 Cube examples that is provided by STMicroelectronics.

<h2><center>&copy; Copyright (c) 2017 STMicroelectronics.
All rights reserved.</center></h2>

This software component is licensed by ST under BSD 3-Clause license,
the "License"; You may not use this file except in compliance with the
License. You may obtain a copy of the
License at:
opensource.org/licenses/BSD-3-Clause